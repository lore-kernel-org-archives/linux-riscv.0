Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F844606A886
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JtezRjr0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K8Lzlh+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qRrl6SJrOsKavs9cKA21qqg0PAwfsL6XHhG6z1n9j0I=; b=JtezRjr0VNu65ayVWOp0YrkH+X
	hXH8FR96xQQ584JgOCWFOU80WTDTKDuGguQhceLUYB8KgkVZoOg1ZwrDdtDjG5kMjDdP5CYtwJKTY
	bBt2xd65o9ABDPzASY/u74WnKpbBuQA35atTkWEs5YlJwmF6l+qxtotm4gwNJ469+2e69znF9AdeP
	o5e9SNev/PkidLDyZx2vrf4FK4zVRramj6PmBw3bJM4C4feCjPclM22/DjYK52wasDWwnGqKdM6Xe
	JHgcAXg1aJ6+HAGQcpRkY+sKEY2zNu/b40F3rHdMB9XGOB/+Vx3o/ks80IQjZ5ETg4xpos5qa7zdk
	4UYNUYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWu-0000000BrtC-3rdn;
	Fri, 13 Nov 2026 07:17:01 +0000
Received: from out-80.mta1.migadu.com ([2001:41d0:203:375::50] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWh-0000000BroQ-16qa
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:16:58 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gK3FEv3HtB5PH2bOaJrgzUy1LeJIdaerJNWPT7yY4Ig=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554204; v=1; x=1795159004;
 b=K8Lzlh+Gr6lPfpxKDtsQAVwJE3B6nrJNAhr4ZcjdWP0wzKwvVcIQwWELpeh4zlwF2b4WwfjM
 8J/ol2avkbzc4Sx3GS1wxlYCaSc2n7dixXqmxnOfN/mfHKVE2NZpBP8cB0MTczrtRbht0fu9sFe
 80yukW2L+nCyB04Kn+UhsBMg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6754d430aca00714;
	Fri, 13 Nov 2026 07:16:44 +0000
X-Mizu-Trace-ID: 6754d430aca00714
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
Subject: [PATCH 2/3] riscv: kgdb: use BREAK_INSTR_SIZE instead of hardcoded value
Date: Fri, 13 Nov 2026 08:16:13 +0100
Message-ID: <20261113071616.219623-3-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113071616.219623-1-clement.leger@linux.dev>
References: <20261113071616.219623-1-clement.leger@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231648_422288_E6F20AAF 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

QmVmb3JlIGNvbW1pdCA1NTBjMmFhNzg3ZDEgKCJyaXNjdjogS0dEQjogUmVtb3ZlICIub3B0aW9u
IG5vcnZjLy5vcHRpb24KcnZjIiBmb3Iga2dkYl9jb21waWxlZF9icmVhayIpLCAubm9ydmMgd2Fz
IGVuZm9yY2VkIGFuZCB0aGF0IHJlc3VsdGVkCmluIGEgbm9uIGNvbXByZXNzZWQgZWJyZWFrIGlu
c3RydWN0aW9uIHNvIHRoZSArNCB3YXMgbGVnaXQuIFRoZQpwcmV2aW91c2x5IG1lbnRpb25uZWQg
Y29tbWl0IHJlbW92ZWQgdGhhdCBvcHRpb24sIGxlYWRpbmcgdG8gZWJyZWFrCmJlaW5nIGVtaXR0
ZWQgYXMgYy5lYnJlYWsgd2hlbiBjb21waWxlZCB3aXRoIENPTkZJR19SSVNDVl9JU0FfQz15LgoK
VXNlIEJSRUFLX0lOU1RSX1NJWkUgc28gZXBjIGlzIGluY3JlbWVudGVkIGJ5IHdoYXRldmVyIHNp
emUgdGhlIGJyZWFrCmluc3RydWN0aW9uIGlzLgoKRml4ZXM6IDU1MGMyYWE3ODdkMSAoInJpc2N2
OiBLR0RCOiBSZW1vdmUgIi5vcHRpb24gbm9ydmMvLm9wdGlvbiBydmMiIGZvciBrZ2RiX2NvbXBp
bGVkX2JyZWFrIikKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2Vy
QGxpbnV4LmRldj4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9rZ2RiLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMKaW5kZXggNGFk
ODE3Njk4YWY4Li4xMjFkYWU4N2RjNjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2tn
ZGIuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMKQEAgLTM2NSw3ICszNjUsNyBAQCBz
dGF0aWMgaW50IGtnZGJfcmlzY3Zfbm90aWZ5KHN0cnVjdCBub3RpZmllcl9ibG9jayAqc2VsZiwg
dW5zaWduZWQgbG9uZyBjbWQsCiAJCXJldHVybiBOT1RJRllfRE9ORTsKIAogCWlmICh0eXBlID09
IEtHREJfQ09NUElMRURfQlJFQUspCi0JCXJlZ3MtPmVwYyArPSA0OworCQlyZWdzLT5lcGMgKz0g
QlJFQUtfSU5TVFJfU0laRTsKIAogCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKIAotLSAKMi41
NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
