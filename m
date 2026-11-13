Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF932606A886
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkuE12nu;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KO0BXPZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9eVM0G1oQF5KOtyGRf+Mc5h8GPvNseGDbn/3s7LfksA=; b=FkuE12nuGmSYl0YZsU5nefddF3
	e9XWDBKABuQ0A5CeHLlmiN0xk/3pzHSyBovxpmWP9QDKzkd/695LIA52NIKhcvUkv2zcdoTUwlIrc
	FWAtg1OVPL+ioJRr5zx7W8h51I8LoRqlNOQ6HhuOpqzIF1Z3wjCujGqUg40mxQ5hBZaTqWWgkZPq0
	avYeN8zLbW4BNaJdGGV5PdwEAtPbAfqC3XjLu2CYimItAUBlbMA5hnn+Ed4BuNPAWX54ho00+rxfX
	FtgaeufSm1hoSyv1ei3Ufpl7DQSTHdg3qbkKQjXCn2urblu9w3j3Loy5NW5tLMr9sNPPHp/BjwURr
	fZrvYZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWx-0000000Bruv-480u;
	Fri, 13 Nov 2026 07:17:03 +0000
Received: from out-82.mta1.migadu.com ([2001:41d0:203:375::52] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWi-0000000Bron-1HWH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:17:00 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MlAH7VVzOoKTqgoo5+r2zLsQBkmZI7/9xOBOGcbvc/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554206; v=1; x=1795159006;
 b=KO0BXPZ3l5jxaALHZttvpA7O8ZSIRFnRqlpB/OAN9y0Do0wG3IDLkXalQuFJuElsBRF6YZDO
 WvDrCrYJuP4qSoAogP24NXxkBcp8r94lWrf3d/+yUQ2CULCmrhnPRjXKkTT21W+vNM3LjVfYajU
 V5XVpsCdJFE5bDmBuysQFsHs=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e03740ce7c941dc8;
	Fri, 13 Nov 2026 07:16:46 +0000
X-Mizu-Trace-ID: e03740ce7c941dc8
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
Subject: [PATCH 3/3] riscv: kgdb: clear bit 0 of single-step jump targets
Date: Fri, 13 Nov 2026 08:16:14 +0100
Message-ID: <20261113071616.219623-4-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113071616.219623-1-clement.leger@linux.dev>
References: <20261113071616.219623-1-clement.leger@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231648_490908_9374E5CF 
X-CRM114-Status: UNSURE (   9.07  )
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

UGVyIHRoZSBSSVNDLVYgSVNBLCBKQUxSIChhbmQgQy5KUi9DLkpBTFIpIGNsZWFyIHRoZSBsb3dl
c3QgYml0IG9mCnRoZSBjYWxjdWxhdGVkIHRhcmdldCBhZGRyZXNzLCBzbyB0aGF0IGF1eGlsaWFy
eSBpbmZvcm1hdGlvbiBjYW4gYmUKc3RvcmVkIGluIHRoZSBsb3cgYml0IG9mIGZ1bmN0aW9uIHBv
aW50ZXJzLiBrZ2RiJ3Mgc29mdHdhcmUgc2luZ2xlCnN0ZXAgbXVzdCBjb21wdXRlIHRoZSBzYW1l
IHRhcmdldCB0aGUgaGFyZHdhcmUgd2lsbCBhY3R1YWxseSB0YWtlLgoKVGhpcyBtaXJyb3JzIHdo
YXQgdGhlIGtwcm9iZSBpbnN0cnVjdGlvbiBzaW11bGF0b3IgYWxyZWFkeSBkb2VzIGluCnNpbXVs
YXRlX2phbHIoKS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdl
ckBsaW51eC5kZXY+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwva2dkYi5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMKaW5kZXgg
MTIxZGFlODdkYzY4Li42NDc1NjAxOTRkOGMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2tnZGIuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMKQEAgLTQ4LDcgKzQ4LDcgQEAg
c3RhdGljIGludCBnZXRfc3RlcF9hZGRyZXNzKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25l
ZCBsb25nICpuZXh0X2FkZHIpCiAJCWlmIChyaXNjdl9pbnNuX2lzX2NfamFscihvcF9jb2RlKSB8
fAogCQkgICAgcmlzY3ZfaW5zbl9pc19jX2pyKG9wX2NvZGUpKSB7CiAJCQlyczFfbnVtID0gZGVj
b2RlX3JlZ2lzdGVyX2luZGV4KG9wX2NvZGUsIFJWQ19DMl9SUzFfT1BPRkYpOwotCQkJKm5leHRf
YWRkciA9IHJlZ3NfcHRyW3JzMV9udW1dOworCQkJKm5leHRfYWRkciA9IHJlZ3NfcHRyW3JzMV9u
dW1dICYgfjFVTDsKIAkJfSBlbHNlIGlmIChyaXNjdl9pbnNuX2lzX2NfaihvcF9jb2RlKSB8fAog
CQkJICAgcmlzY3ZfaW5zbl9pc19jX2phbChvcF9jb2RlKSkgewogCQkJKm5leHRfYWRkciA9IFJW
Q19FWFRSQUNUX0pUWVBFX0lNTShvcF9jb2RlKSArIHBjOwpAQCAtMTA5LDYgKzEwOSw3IEBAIHN0
YXRpYyBpbnQgZ2V0X3N0ZXBfYWRkcmVzcyhzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQg
bG9uZyAqbmV4dF9hZGRyKQogCQkJaWYgKHJzMV9udW0pCiAJCQkJKm5leHRfYWRkciA9ICgodW5z
aWduZWQgbG9uZyAqKXJlZ3MpW3JzMV9udW1dOwogCQkJKm5leHRfYWRkciArPSBSVl9FWFRSQUNU
X0lUWVBFX0lNTShvcF9jb2RlKTsKKwkJCSpuZXh0X2FkZHIgJj0gfjFVTDsKIAkJfSBlbHNlIGlm
IChyaXNjdl9pbnNuX2lzX3NyZXQob3BfY29kZSkpIHsKIAkJCSpuZXh0X2FkZHIgPSBwYzsKIAkJ
fSBlbHNlIHsKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
