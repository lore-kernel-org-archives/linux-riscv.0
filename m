Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A5C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 22:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2Kegzmj46h5ai0Ah5BnnnLRMKo9RbhwI45S477rjK8=; b=bFRWFD5GUmdQkT
	5o/tnCKNxI36/6EMGANErLPQ2kfBefLQ4e0j36QQCL91mgHuRifa0rxhKv6ShHeKF58XnxW6+7L4a
	E4Ge7SH4bcaLbYm5VueQamk85r0te67E/kt+w2BNDZdDSMO65oWgkPHhWkfMm7vUlBB4QvJOK962A
	ZeV+YFCrOwEi5oSwBZF1RE6rZ/ETdppHYWww2JClNjWn64o8OW/RIkDHFvT5BNndlDfEoFt5PkC7K
	DGObQYtrM5CrIGikq0fO1RVYvc6CQmmVQpBSJVa4rekufr9LLG/27I0KcP0t32aliX6IslI3MBrWs
	w5nOEGvsgdqg7EHNQPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Tlk-0000000D6Z4-0whR;
	Tue, 07 May 2024 22:58:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Tlf-0000000D6WD-2b6k
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 22:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC72F61A05;
	Tue,  7 May 2024 22:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C699C3277B;
	Tue,  7 May 2024 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715122718;
	bh=JyGWNzf2bX/DbV0OLPxeQ4X+rfNpuJCLVzX52aXUeDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y70/XhEotLIJZDe05ChMzbT+3B5smH+DlxKijEaWhGzW736cA/ftHuQx3XnAU+QZ+
	 sdDooQpcFmbBdM8sK1AN7m8GZIuqztK0BClAsZEWmNSpgka2cvT78uyBVCAdJqafeM
	 lgzGDNGsyaXtdy8uecZpEl/iP8wYuoHQA2jpNYDv5U0FrFOQtjnR1c+sR+kQi/bHgB
	 D4ds1LkL/mGglPUrwMq2y2u3kPBZhXKyzQ/5vFiztyJiHZUqsKA37N9Vn4dWJMMTTU
	 qv4fXjOj514uOaW+5rl8kodJSRaeMUTNV033eOtzSQXpqztuckWJnDuw93rPp9UL03
	 bOMwY3z+KB6IQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jszhang@kernel.org,
	guoren@kernel.org,
	evan@rivosinc.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 22/23] riscv: T-Head: Test availability bit before enabling MAE errata
Date: Tue,  7 May 2024 18:56:48 -0400
Message-ID: <20240507225725.390306-22-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225725.390306-1-sashal@kernel.org>
References: <20240507225725.390306-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_155839_742720_3DC84535 
X-CRM114-Status: GOOD (  13.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cgpb
IFVwc3RyZWFtIGNvbW1pdCA2NWI3MWNjMzVjYzY2MzFjYjBhNWIyNGY5NjFmZTY0YzA4NWNiNDBi
IF0KClQtSGVhZCdzIG1lbW9yeSBhdHRyaWJ1dGUgZXh0ZW5zaW9uIChYVGhlYWRNYWUpIChub24t
Y29tcGF0aWJsZQplcXVpdmFsZW50IG9mIFJWSSdzIFN2cGJtdCkgaXMgY3VycmVudGx5IGFzc3Vt
ZWQgZm9yIGFsbCBULUhlYWQgaGFydHMuCkhvd2V2ZXIsIFFFTVUgcmVjZW50bHkgZGVjaWRlZCB0
byBkcm9wIGFjY2VwdGFuY2Ugb2YgZ3Vlc3RzIHRoYXQgd3JpdGUKcmVzZXJ2ZWQgYml0cyBpbiBQ
VEVzLgpBcyBYVGhlYWRNYWUgdXNlcyByZXNlcnZlZCBiaXRzIGluIFBURXMgYW5kIExpbnV4IGFw
cGxpZXMgdGhlIE1BRSBlcnJhdGEKZm9yIGFsbCBULUhlYWQgaGFydHMsIHRoaXMgYnJva2UgdGhl
IExpbnV4IHN0YXJ0dXAgb24gUUVNVSBlbXVsYXRpb25zCm9mIHRoZSBDOTA2IGVtdWxhdGlvbi4K
ClRoaXMgcGF0Y2ggYXR0ZW1wdHMgdG8gYWRkcmVzcyB0aGlzIGlzc3VlIGJ5IHRlc3RpbmcgdGhl
IE1BRS1lbmFibGUgYml0CmluIHRoZSB0aC5zeHN0YXR1cyBDU1IuIFRoaXMgQ1NSIGlzIGF2YWls
YWJsZSBpbiBIVyBhbmQgY2FuIGJlCmVtdWxhdGVkIGluIFFFTVUuCgpUaGlzIHBhdGNoIGFsc28g
bWFrZXMgdGhlIFhUaGVhZE1hZSBwcm9iaW5nIG1lY2hhbmlzbSByZWxpYWJsZSwgYmVjYXVzZQph
IHRlc3QgZm9yIHRoZSByaWdodCBjb21iaW5hdGlvbiBvZiBtdmVuZG9yaWQsIG1hcmNoaWQsIGFu
ZCBtaW1waWQKaXMgbm90IHN1ZmZpY2llbnQgdG8gZW5hYmxlIE1BRS4KClJldmlld2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4KTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQwNzIxMzIzNi4yMTIxNTkyLTMtY2hyaXN0b3Bo
Lm11ZWxsbmVyQHZydWxsLmV1ClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgfCAxNCArKysrKysrKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2
L2VycmF0YS90aGVhZC9lcnJhdGEuYwppbmRleCA2ZTdlZTFmMTZiZWUzLi5iZjZhMGE2MzE4ZWUz
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYworKysgYi9hcmNo
L3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwpAQCAtMTksNiArMTksOSBAQAogI2luY2x1ZGUg
PGFzbS9wYXRjaC5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JpZF9saXN0Lmg+CiAKKyNkZWZpbmUg
Q1NSX1RIX1NYU1RBVFVTCQkweDVjMAorI2RlZmluZSBTWFNUQVRVU19NQUVFCQlfQUMoMHgyMDAw
MDAsIFVMKQorCiBzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfbWFlKHVuc2lnbmVkIGludCBzdGFn
ZSwKIAkJCSAgICAgdW5zaWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQog
ewpAQCAtMjgsMTEgKzMxLDE0IEBAIHN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9tYWUodW5zaWdu
ZWQgaW50IHN0YWdlLAogCWlmIChhcmNoX2lkICE9IDAgfHwgaW1waWQgIT0gMCkKIAkJcmV0dXJu
IGZhbHNlOwogCi0JaWYgKHN0YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UIHx8
Ci0JICAgIHN0YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19NT0RVTEUpCi0JCXJldHVybiB0cnVl
OworCWlmIChzdGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfRUFSTFlfQk9PVCAmJgorCSAgICBz
dGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfTU9EVUxFKQorCQlyZXR1cm4gZmFsc2U7CiAKLQly
ZXR1cm4gZmFsc2U7CisJaWYgKCEoY3NyX3JlYWQoQ1NSX1RIX1NYU1RBVFVTKSAmIFNYU1RBVFVT
X01BRUUpKQorCQlyZXR1cm4gZmFsc2U7CisKKwlyZXR1cm4gdHJ1ZTsKIH0KIAogLyoKLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
