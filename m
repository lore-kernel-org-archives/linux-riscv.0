Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0F606C3D1
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4ZuM889;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TsSjnMly
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=79cWgZzGWjo84IwPxlo7VSdfO/texSKGR4CePA2Sjeg=; b=R4ZuM889Owv/pP55PUeWKJvzUl
	msGNPBHSSHPQBU3yqdBpAOK5lE+TKKoqnIxBu4u6ha77WdckUrHpjZ94A+Fo3eC2Q+j/ZT8FxpVDF
	dsWhIbQPInbhr9GRbP5mmDUF/GZzb+mnMHp4sOKipTXiakbaj4osdr56h0Nqs5ybeKO439UzCE4rV
	L7K9ssflyVRd9h41puq5yOHr6OBsgu4Xo25UVAQL/jKl6Onu1uJbxIOs4o+oR/ecOPYjyMyZS/ZbR
	Ae6fln6U4naPaacnC6jaVZc60Bmc1nnpgzm48NV99pV57iJIXP8bJ2Ojo4oESZ1N0TLJeuDTJBKgA
	7HRS2XHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtUo-0000000Gw7G-0TJv;
	Mon, 02 Nov 2026 14:58:50 +0000
Received: from out-50.mta0.migadu.com ([2001:41d0:1004:224b::32] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtUl-0000000Gw6U-0ktP
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:58:49 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ecSSOXwMPLSgrPwivWZlr5O7kQVEdpqiDzJteOU8z7Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793631523; v=1; x=1794236323;
 b=TsSjnMlyxIgJqGg0OM2ywhSGrEVVTnr3vB4zsrEM3kHnNVX8ZTH9mMISulsN3rcRNybl8cKu
 zAbDByyVZXzO0PN+5hEF7nqXl2K34scaiF1k6aTa/96CKZ1aX0X7qZO3wE4EF4qjYVSWM7/8SMv
 7cHWfLk8fYaO5gqtumrwsE2A=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 66ae8b979347ddfb;
	Mon, 02 Nov 2026 14:58:43 +0000
X-Mizu-Trace-ID: 66ae8b979347ddfb
X-Migadu-Flow: FLOW_OUT
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] riscv: kgdb: Fix potential missing local_irq_restore() call
Date: Mon,  2 Nov 2026 15:58:11 +0100
Message-ID: <20261102145812.36939-1-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_065847_731895_F4ED4A8A 
X-CRM114-Status: UNSURE (   9.45  )
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

SWYga2dkYl9oYW5kbGVfZXhjZXB0aW9uKCkgcmV0dXJucyBhbiBlcnJvciwgbG9jYWwgaXJxcyBh
cmUgbm90CnJlZW5hYmxlZC4gRml4IHRoaXMgYnkgZmFjdG9yaW5nIG91dCB0aGUga2dkYiBleGNl
cHRpb24gaGFuZGxpbmcgdG8gYQpmdW5jdGlvbiBhbmQgY2FsbCBpdCBiZXR3ZWVuIGxvY2FsX2ly
cV9zYXZlKCkvbG9jYWxfaXJxX3Jlc3RvcmUoKSBzbwp0aGF0IHRoZSBlcnJvciBoYW5kbGluZyBm
bG93IGlzIHNpbXBsZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5s
ZWdlckBsaW51eC5kZXY+CgotLS0KLSBSZXNlbnQgYmVjYXVzZSBvZiBhIGJhZCBtc210cCBjb25m
aWd1cmF0aW9uLgoKIGFyY2gvcmlzY3Yva2VybmVsL2tnZGIuYyB8IDI4ICsrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9rZ2RiLmMKaW5kZXggMGJmNjI5MjA0Yzc2Li5iODMzNDA4NDk0ZjkgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2tnZGIuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9r
Z2RiLmMKQEAgLTMxOSwxMyArMzE5LDI4IEBAIHN0YXRpYyBpbnQga2dkYl9yaXNjdl9rZ2RiYnJl
YWsodW5zaWduZWQgbG9uZyBhZGRyKQogCXJldHVybiBrZ2RiX2hhc19oaXRfYnJlYWsoYWRkcik7
CiB9CiAKK3N0YXRpYyBpbnQga2dkYl9yaXNjdl9oYW5kbGUoc3RydWN0IGRpZV9hcmdzICphcmdz
LCB1bnNpZ25lZCBsb25nIGNtZCwKKwkJCSAgICAgaW50IHR5cGUpCit7CisJc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MgPSBhcmdzLT5yZWdzOworCisJaWYgKGtnZGJfaGFuZGxlX2V4Y2VwdGlvbih0eXBl
ID09IEtHREJfU1dfU0lOR0xFX1NURVAgPyAwIDogMSwKKwkJCQkgIGFyZ3MtPnNpZ25yLCBjbWQs
IHJlZ3MpKQorCQlyZXR1cm4gTk9USUZZX0RPTkU7CisKKwlpZiAodHlwZSA9PSBLR0RCX0NPTVBJ
TEVEX0JSRUFLKQorCQlyZWdzLT5lcGMgKz0gNDsKKworCXJldHVybiBOT1RJRllfU1RPUDsKK30K
Kwogc3RhdGljIGludCBrZ2RiX3Jpc2N2X25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnNl
bGYsIHVuc2lnbmVkIGxvbmcgY21kLAogCQkJICAgICB2b2lkICpwdHIpCiB7CiAJc3RydWN0IGRp
ZV9hcmdzICphcmdzID0gKHN0cnVjdCBkaWVfYXJncyAqKXB0cjsKIAlzdHJ1Y3QgcHRfcmVncyAq
cmVncyA9IGFyZ3MtPnJlZ3M7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKLQlpbnQgdHlwZTsKKwlp
bnQgdHlwZSwgcmV0OwogCiAJaWYgKHVzZXJfbW9kZShyZWdzKSkKIAkJcmV0dXJuIE5PVElGWV9E
T05FOwpAQCAtMzM1LDE3ICszNTAsMTAgQEAgc3RhdGljIGludCBrZ2RiX3Jpc2N2X25vdGlmeShz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnNlbGYsIHVuc2lnbmVkIGxvbmcgY21kLAogCQlyZXR1cm4g
Tk9USUZZX0RPTkU7CiAKIAlsb2NhbF9pcnFfc2F2ZShmbGFncyk7Ci0KLQlpZiAoa2dkYl9oYW5k
bGVfZXhjZXB0aW9uKHR5cGUgPT0gS0dEQl9TV19TSU5HTEVfU1RFUCA/IDAgOiAxLAotCQkJCSAg
YXJncy0+c2lnbnIsIGNtZCwgcmVncykpCi0JCXJldHVybiBOT1RJRllfRE9ORTsKLQotCWlmICh0
eXBlID09IEtHREJfQ09NUElMRURfQlJFQUspCi0JCXJlZ3MtPmVwYyArPSA0OwotCisJcmV0ID0g
a2dkYl9yaXNjdl9oYW5kbGUoYXJncywgY21kLCB0eXBlKTsKIAlsb2NhbF9pcnFfcmVzdG9yZShm
bGFncyk7CiAKLQlyZXR1cm4gTk9USUZZX1NUT1A7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGlj
IHN0cnVjdCBub3RpZmllcl9ibG9jayBrZ2RiX25vdGlmaWVyID0gewotLSAKMi41NS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
