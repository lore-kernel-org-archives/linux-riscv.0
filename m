Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B5C67871
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cH29CeFPGCZe4mtlPCg0mEooeQmThHwDVcHdc1jwCyA=; b=1lo/d9FZOaVTBb
	LZL4ezSPnBy6S/Z4bmuUpLldqAY/ppgKcbwFUtruqG9Lhh6BxYDN5WjWuUcvUa5gk1Osw3TUMJme8
	p8jRzfy2MEa4plSVkasdQ5OEUNM6G2LBoZcx6ovzGX+IMm00brlSPCgMmw7zgUzkR+yO1mbGktTeo
	h5EnJwGJcmj50r+F+vnlZ+gaezCkKotgVDPMR4wM6HdFW2iPkHb+pZO4FAakILYIFaupsyKZJIGk4
	Q3enbt+hs4Q7F7TWTCHZpAgdr5850Zg4Vnn3fqHeIRpkFFvCaAuFhGD5TNSHxuRtsl+0tVL2XMAtk
	L9nqjUiL9wqPvi6Oe1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK5B-0090l2-BC; Mon, 16 Jan 2023 07:39:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK57-0090jE-1a
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 07:39:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D62C6B80D59;
	Mon, 16 Jan 2023 07:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0CAC433F0;
	Mon, 16 Jan 2023 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673854737;
	bh=GRifVG8QQU3bI8YFwJPVwBl3vn/mY1G/0lBs8bIH0oI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=em9uypzzHGPvaNWOz7teN9KlBmzxP3upD3xcgjrQ7YYhMhdRamJWXJHaM/kQ0spLe
	 MLY9n7CUhvc/zwYxxk2uktB+paiXu/SAyOH0m1OE1eCU0ObNQBjaXbu594R0P1lbby
	 xZ1SLHwcK1gmlf5re16DScRSe8cJLKZLeelsCA9/ao6OcPVBf5hfsWnvf0Kgz/H/4K
	 hWNGBn+HGpsWiV3EroSE1cA7s0rxjaokTnCdpnYagBZ/1WWqSuStoNwH3FwSu6oR6z
	 c+gC2WCXU5eqFQR0Ru8zPEWq1hrDJVsVbZjK+QGZC1VPApdZ31XxYlos24ihjler2s
	 V5/BK0vsMKPOA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: Add instruction dump to RISC-V splats
Date: Mon, 16 Jan 2023 08:38:33 +0100
Message-Id: <20230116073834.333129-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116073834.333129-1-bjorn@kernel.org>
References: <20230116073834.333129-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_233901_416584_A9AB119A 
X-CRM114-Status: GOOD (  15.18  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQWRkIGluc3RydWN0aW9u
IGR1bXAgKENvZGU6KSBvdXRwdXQgdG8gUklTQy1WIHNwbGF0cy4gRHVtcCAxNmIKcGFyY2Vscy4K
CkFuIGV4YW1wbGU6CiAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwCiAgT29wcyBbIzFdCiAg
TW9kdWxlcyBsaW5rZWQgaW46CiAgQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRh
aW50ZWQgNi4yLjAtcmMzLTAwMzAyLWc4NDBmZjQ0YzU3MWQtZGlydHkgIzI3CiAgSGFyZHdhcmUg
bmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQogIGVwYyA6IGtlcm5lbF9pbml0KzB4YzgvMHgx
MGUKICAgcmEgOiBrZXJuZWxfaW5pdCsweDcwLzB4MTBlCiAgZXBjIDogZmZmZmZmZmY4MGJkOWE0
MCByYSA6IGZmZmZmZmZmODBiZDk5ZTggc3AgOiBmZjIwMDAwMDAwNjBiZWMwCiAgIGdwIDogZmZm
ZmZmZmY4MTczMGIyOCB0cCA6IGZmNjAwMDAwN2ZmMDAwMDAgdDAgOiA3OTc0Njk3Mjc1NjM2NTcz
CiAgIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDMwMzAzMDMyNzAzOTNkNmUgczAgOiBmZjIw
MDAwMDAwNjBiZWUwCiAgIHMxIDogZmZmZmZmZmY4MTczMjAyOCBhMCA6IDAwMDAwMDAwMDAwMDAw
MDAgYTEgOiBmZjYwMDAwMDgwZGQxNzgwCiAgIGEyIDogMDAwMDAwMDAwMDAwMDAwMiBhMyA6IGZm
ZmZmZmZmODE3NmE0NzAgYTQgOiAwMDAwMDAwMDAwMDAwMDAwCiAgIGE1IDogMDAwMDAwMDAwMDAw
MDAwYSBhNiA6IDAwMDAwMDAwMDAwMDAwODEgYTcgOiBmZjYwMDAwMDgwZGQxNzgwCiAgIHMyIDog
MDAwMDAwMDAwMDAwMDAwMCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAw
MDAwCiAgIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiAw
MDAwMDAwMDAwMDAwMDAwCiAgIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAw
MDAwMDAgczEwOiAwMDAwMDAwMDAwMDAwMDAwCiAgIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6
IGZmZmZmZmZmODExODYwMTggdDQgOiAwMDAwMDAwMDAwMDAwMDIyCiAgIHQ1IDogMDAwMDAwMDAw
MDAwMDAzZCB0NiA6IDAwMDAwMDAwMDAwMDAwMDAKICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAg
YmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgogIFs8ZmZm
ZmZmZmY4MDAwMzUyOD5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHgxNgogIENvZGU6IDg2MmEg
ZDE3OSA2MDhjIGE1MTcgMDA2OSAwNTEzIDJiZTUgZDBlZiBkYjJlIDQ3YTkgKGMxMWMpIGE1MTcK
ICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KICBLZXJuZWwgcGFuaWMgLSBu
b3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYgog
IFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKICAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBu
b3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYiBd
LS0tCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0t
LQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKaW5kZXggNTQ5YmRlNWM5NzBhLi5iOGYwZWE4YTk1NjggMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAt
MjksNiArMjksMjcgQEAgaW50IHNob3dfdW5oYW5kbGVkX3NpZ25hbHMgPSAxOwogCiBzdGF0aWMg
REVGSU5FX1NQSU5MT0NLKGRpZV9sb2NrKTsKIAorc3RhdGljIHZvaWQgZHVtcF9rZXJuZWxfaW5z
dHIoY29uc3QgY2hhciAqbG9nbHZsLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwljaGFyIHN0
cltzaXplb2YoIjAwMDAgIikgKiAxMiArIDIgKyAxXSwgKnAgPSBzdHI7CisJdW5zaWduZWQgbG9u
ZyBhZGRyID0gcmVncy0+ZXBjOworCWxvbmcgYmFkOworCXUxNiB2YWw7CisJaW50IGk7CisKKwlm
b3IgKGkgPSAtMTA7IGkgPCAyOyBpKyspIHsKKwkJYmFkID0gZ2V0X2tlcm5lbF9ub2ZhdWx0KHZh
bCwgJigodTE2ICopYWRkcilbaV0pOworCQlpZiAoIWJhZCkgeworCQkJcCArPSBzcHJpbnRmKHAs
IGkgPT0gMCA/ICIoJTA0aHgpICIgOiAiJTA0aHggIiwgdmFsKTsKKwkJfSBlbHNlIHsKKwkJCXBy
aW50aygiJXNDb2RlOiBVbmFibGUgdG8gYWNjZXNzIGluc3RydWN0aW9uIGF0IDB4JWx4LlxuIiwK
KwkJCSAgICAgICBsb2dsdmwsIChsb25nKSYoKHUxNiAqKWFkZHIpW2ldKTsKKwkJCXJldHVybjsK
KwkJfQorCX0KKwlwcmludGsoIiVzQ29kZTogJXNcbiIsIGxvZ2x2bCwgc3RyKTsKK30KKwogdm9p
ZCBkaWUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGNvbnN0IGNoYXIgKnN0cikKIHsKIAlzdGF0aWMg
aW50IGRpZV9jb3VudGVyOwpAQCAtNDMsOCArNjQsMTAgQEAgdm9pZCBkaWUoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MsIGNvbnN0IGNoYXIgKnN0cikKIAogCXByX2VtZXJnKCIlcyBbIyVkXVxuIiwgc3Ry
LCArK2RpZV9jb3VudGVyKTsKIAlwcmludF9tb2R1bGVzKCk7Ci0JaWYgKHJlZ3MpCisJaWYgKHJl
Z3MpIHsKIAkJc2hvd19yZWdzKHJlZ3MpOworCQlkdW1wX2tlcm5lbF9pbnN0cihLRVJOX0VNRVJH
LCByZWdzKTsKKwl9CiAKIAljYXVzZSA9IHJlZ3MgPyByZWdzLT5jYXVzZSA6IC0xOwogCXJldCA9
IG5vdGlmeV9kaWUoRElFX09PUFMsIHN0ciwgcmVncywgMCwgY2F1c2UsIFNJR1NFR1YpOwotLSAK
Mi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
