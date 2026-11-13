Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB322606A8AF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ixz/RPlL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pEFxn1+N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UmBbdZiSEE0+zTu/3pc/uFSpcjmv39pIOvkYrrPVdA0=; b=ixz/RPlLhTgnqkkCOJI+PHjk0u
	ur/C7V2qKT2CjGgFlM7Hkwode6vLtzNSvM4kPtaBh24ayumt20hNXM2fBoThfsc4yty74AdVYTJbo
	Kj1PcXKX9kiWX9jIVgfJPq93wzBppkZDi5a37sZ3ODkIpVy+NOIusmX9s+a/R2MT0/2VdkNWw6JVO
	5G2x7AujJY19MjiYokA+qITL4eHE1ZtBv1pjdTHe00mZCFQd2LyO+GyMtPGzfywx/pyJZaZWwiI/G
	F9euOxbqeOnaM2rIgLF5686qpAwsDYYhYEvcMfm+rjCJ2S1qNEXk8Z3vqBGhw1xO9Q0+dscAkhhDc
	cSQd2+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWx-0000000BruR-0wzT;
	Fri, 13 Nov 2026 07:17:03 +0000
Received: from out-77.mta1.migadu.com ([2001:41d0:203:375::4d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWg-0000000BroO-3zWI
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:17:00 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8t8H4CQ8gn3R9f8nurhquSa//ipjY+XXPYQiq2AQR7Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554204; v=1; x=1795159004;
 b=pEFxn1+Npn8zUyuPuX8psmcv2n1r1Q0jb705qkfsr2dE9oKq+BbJ34Fnm+sUQBXFCteqB3Oz
 3SWxZoWyq7+DsufxcqwHmHTdXjM+2jpyBH1TK8qJ3CjKI5+trPGOJSAf+jXwQUioRC9X+XNpBmt
 Ahv/rK18OnoEL4nGe6nd1xqo=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 211d82633146b9fb;
	Fri, 13 Nov 2026 07:16:42 +0000
X-Mizu-Trace-ID: 211d82633146b9fb
X-Migadu-Flow: FLOW_OUT
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	WangYuli <wangyuli@uniontech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: kgdb: use patch_insn_write() to set breakpoints
Date: Fri, 13 Nov 2026 08:16:12 +0100
Message-ID: <20261113071616.219623-2-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113071616.219623-1-clement.leger@linux.dev>
References: <20261113071616.219623-1-clement.leger@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231648_426026_801D9418 
X-CRM114-Status: GOOD (  12.14  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiB1c2luZyBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gsIHRoZSB0ZXh0IHNlY3Rpb24gaXMg
bm90IHdyaXRhYmxlCmFuZCBjb3B5X3RvX2tlcm5lbF9ub2ZhdWx0KCkgcmV0dXJucyAtRUZBVUxU
LiBGaXggdGhpcyBieSB1c2luZwpwYXRjaF9pbnNuX3dyaXRlKCkgd2VyZSBhcHBsaWNhYmxlIGFu
ZCBpbXBsZW1lbnQKa2dkYl9hcmNoX3NldF9icmVha3BvaW50KCkva2dkYl9hcmNoX3JlbW92ZV9i
cmVha3BvaW50KCkuCgpwYXRjaF9pbnNuX3dyaXRlKCkgY29ycmVjdGx5IHJlbWFwcyB0aGUgdGV4
dCBhcyB3cml0YWJsZSB1c2luZyBhIGZpeG1hcAphbGlhcy4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBsaW51eC5kZXY+Ci0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwva2dkYi5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwva2dkYi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwva2dkYi5jCmluZGV4
IDBiZjYyOTIwNGM3Ni4uNGFkODE3Njk4YWY4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9rZ2RiLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwva2dkYi5jCkBAIC0xMiw2ICsxMiw3IEBA
CiAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxhc20vZ2RiX3htbC5oPgog
I2luY2x1ZGUgPGFzbS9pbnNuLmg+CisjaW5jbHVkZSA8YXNtL3RleHQtcGF0Y2hpbmcuaD4KIAog
ZW51bSB7CiAJTk9UX0tHREJfQlJFQUsgPSAwLApAQCAtMTM0LDkgKzEzNSw5IEBAIHN0YXRpYyBp
bnQgZG9fc2luZ2xlX3N0ZXAoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJc3RlcHBlZF9hZGRyZXNz
ID0gYWRkcjsKIAogCS8qIFJlcGxhY2UgdGhlIG9wIGNvZGUgd2l0aCB0aGUgYnJlYWsgaW5zdHJ1
Y3Rpb24gKi8KLQllcnJvciA9IGNvcHlfdG9fa2VybmVsX25vZmF1bHQoKHZvaWQgKilzdGVwcGVk
X2FkZHJlc3MsCi0JCQkJICAgYXJjaF9rZ2RiX29wcy5nZGJfYnB0X2luc3RyLAotCQkJCSAgIEJS
RUFLX0lOU1RSX1NJWkUpOworCWVycm9yID0gcGF0Y2hfaW5zbl93cml0ZSgodm9pZCAqKXN0ZXBw
ZWRfYWRkcmVzcywKKwkJCQkgYXJjaF9rZ2RiX29wcy5nZGJfYnB0X2luc3RyLAorCQkJCSBCUkVB
S19JTlNUUl9TSVpFKTsKIAkvKiBGbHVzaCBhbmQgcmV0dXJuICovCiAJaWYgKCFlcnJvcikgewog
CQlmbHVzaF9pY2FjaGVfcmFuZ2UoYWRkciwgYWRkciArIEJSRUFLX0lOU1RSX1NJWkUpOwpAQCAt
MTU0LDggKzE1NSw4IEBAIHN0YXRpYyBpbnQgZG9fc2luZ2xlX3N0ZXAoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCiBzdGF0aWMgdm9pZCB1bmRvX3NpbmdsZV9zdGVwKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQogewogCWlmIChzdGVwcGVkX29wY29kZSAhPSAwKSB7Ci0JCWNvcHlfdG9fa2VybmVsX25vZmF1
bHQoKHZvaWQgKilzdGVwcGVkX2FkZHJlc3MsCi0JCQkJICAgKHZvaWQgKikmc3RlcHBlZF9vcGNv
ZGUsIEJSRUFLX0lOU1RSX1NJWkUpOworCQlwYXRjaF9pbnNuX3dyaXRlKCh2b2lkICopc3RlcHBl
ZF9hZGRyZXNzLAorCQkJCSAodm9pZCAqKSZzdGVwcGVkX29wY29kZSwgQlJFQUtfSU5TVFJfU0la
RSk7CiAJCWZsdXNoX2ljYWNoZV9yYW5nZShzdGVwcGVkX2FkZHJlc3MsCiAJCQkJICAgc3RlcHBl
ZF9hZGRyZXNzICsgQlJFQUtfSU5TVFJfU0laRSk7CiAJfQpAQCAtMjYxLDYgKzI2MiwyOSBAQCBu
b2lubGluZSB2b2lkIGFyY2hfa2dkYl9icmVha3BvaW50KHZvaWQpCiAJICAgICJrZ2RiX2NvbXBp
bGVkX2JyZWFrOiBlYnJlYWtcbiIpOwogfQogCisvKgorICogS2VybmVsIHRleHQgbWF5IGJlIHJl
YWQtb25seSAoQ09ORklHX1NUUklDVF9LRVJORUxfUldYKSwgc28gc29mdHdhcmUKKyAqIGJyZWFr
cG9pbnRzIG11c3QgYmUgcGxhbnRlZCB0aHJvdWdoIHRoZSB3cml0YWJsZSBwYXRjaCBhbGlhcyBp
bnN0ZWFkIG9mCisgKiB3cml0aW5nIHRoZSB0ZXh0IGFkZHJlc3MgZGlyZWN0bHkuCisgKi8KK2lu
dCBrZ2RiX2FyY2hfc2V0X2JyZWFrcG9pbnQoc3RydWN0IGtnZGJfYmtwdCAqYnB0KQoreworCWlu
dCBlcnI7CisKKwllcnIgPSBjb3B5X2Zyb21fa2VybmVsX25vZmF1bHQoYnB0LT5zYXZlZF9pbnN0
ciwgKGNoYXIgKilicHQtPmJwdF9hZGRyLAorCQkJCSAgICAgICBCUkVBS19JTlNUUl9TSVpFKTsK
KwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCXJldHVybiBwYXRjaF9pbnNuX3dyaXRlKCh2b2lk
ICopYnB0LT5icHRfYWRkciwKKwkJCQlhcmNoX2tnZGJfb3BzLmdkYl9icHRfaW5zdHIsIEJSRUFL
X0lOU1RSX1NJWkUpOworfQorCitpbnQga2dkYl9hcmNoX3JlbW92ZV9icmVha3BvaW50KHN0cnVj
dCBrZ2RiX2JrcHQgKmJwdCkKK3sKKwlyZXR1cm4gcGF0Y2hfaW5zbl93cml0ZSgodm9pZCAqKWJw
dC0+YnB0X2FkZHIsIGJwdC0+c2F2ZWRfaW5zdHIsCisJCQkJQlJFQUtfSU5TVFJfU0laRSk7Cit9
CisKIHZvaWQga2dkYl9hcmNoX2hhbmRsZV9xeGZlcl9wa3QoY2hhciAqcmVtY29tX2luX2J1ZmZl
ciwKIAkJCQljaGFyICpyZW1jb21fb3V0X2J1ZmZlcikKIHsKLS0gCjIuNTUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
