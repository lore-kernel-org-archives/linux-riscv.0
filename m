Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96738C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EnXAXuQC+WnRx5J1FiV+fVGdwhrX2HDyHhPhcRbkfaE=; b=S0AtCjs4X4Y/7P
	R8dRXVv9DBYxybwdJmM1yME+3c7ALkLtRCW6qPfsTHoaKwlgDa1mPgIOiiY/wQuT5kRDhkGXGcIYH
	jUtbnGLzGTzf7SIdhVHDSMOxfjjeNTTARECmeFHQot+CBJpgCQdOwTdgK+DpBH5lnliJZuZJCVCpY
	LeWmIMcimU/2yHbATbRM/m+PYBeTz7XONAIADfHo5T1Sa0sBSuoZnR/w4s1z8V4MwYc4hUiTJZUpb
	dZ6Hwvsb3os4dhjl/bZUNl2k+SNTws1d+SP5XJQiCQyOQfeXL8CF7bsz1MdIBHElYkKKAkO3p2ZpB
	jXm0BPMgYcwF4icIkLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnvG-0058Fa-2w;
	Fri, 07 Jul 2023 16:03:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnvE-0058EF-18
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 16:03:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b89e10d356so12071155ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688745782; x=1691337782;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=kF0uQEN662Ylwi2u8B6YjR1hUODDsncC9aFANUny7O8=;
        b=cYoTElhkxPgxMxbMBtiYHiY7zIG+iRfcpLBx18CvRbyyrYJav4Qlg47Aj69t/rdGZj
         UPMEVD5biF0LlK2QptEmZgbDod1gpbFgcl4UFNF7c/xXBHa3QPeLiRlLu6g77JNm7dWi
         KV34YgdDOOywcumWNpQrGsqcp/x2cTkv33JUr1OmsyW7yhaRIhpxiqI9bkUzcrc0EwU6
         Umcboojqup8T8nMnNl6M5MhaKyFDjKWiffKk8VFp6JsqIFw5zljomlNM9gU+F5yKGAoH
         Ym3KEsN0d3PF6VNryEYS1YQDXP/49075KvpKJrLQvKQZmsM8gJtC1HpkYwdUoxF35ARu
         q6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745782; x=1691337782;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kF0uQEN662Ylwi2u8B6YjR1hUODDsncC9aFANUny7O8=;
        b=BXtpg8u8u5dYudq6cFqYGlpCfREyFqFziXqFPImgQD7//vGc3MiE/xI4bSq6nmD4qe
         gaah32GeDch2kfIhuYG1hi3X3ki2hQyu/6MdNtP8pR89SLJw2sO2E3DDDRDCKw3qYaMy
         ubV2BpkHbeEtku+z/Pz3YOu43DTNDcXhzw8ABH2xB89qGvg0163kHHQR1m9wWz5RUAmn
         rth9aMrOHTkpHyQk4BsI7ARFrJynhwReWs4aIZNHi1mf8zcGfj9Ljl1RGBWXigxCkrp4
         fdlUWrNR0euyll68E/fOJt6s1s1qWn1JvtqUudqqmzYpBLOmfBWrYrZSAnHJe6A2k7p9
         dxDw==
X-Gm-Message-State: ABy/qLZzcUkgnuxQQsWHTrR/kPeiJZFRMQrayBx+tQmZfNijxt3G2dUN
	i+uLbDSbaY5y8o/iTjS2Cr4iu8ULjzEFVRNIApc=
X-Google-Smtp-Source: APBJJlGNN3z7qOn51JWWxegL0GEQ8tvT7dLoK6EFuISJia98DCx0aGARl5XCxRkkRmZuVvjqqBt/Eg==
X-Received: by 2002:a17:902:d508:b0:1b8:4ec2:5200 with SMTP id b8-20020a170902d50800b001b84ec25200mr5567552plg.2.1688745782222;
        Fri, 07 Jul 2023 09:03:02 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e80200b001b567bbe82dsm3454695plg.150.2023.07.07.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 09:03:01 -0700 (PDT)
Subject: [PATCH v2] module: Ignore RISC-V mapping symbols too
Date: Fri,  7 Jul 2023 09:00:51 -0700
Message-ID: <20230707160051.2305-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mcgrof@kernel.org, rdunlap@infradead.org, thomas@t-8ch.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_090304_386792_7C087DF6 
X-CRM114-Status: GOOD (  15.68  )
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

UklTQy1WIGhhcyBhbiBleHRlbmRlZCBmb3JtIG9mIG1hcHBpbmcgc3ltYm9scyB0aGF0IHdlIHVz
ZSB0byBlbmNvZGUKdGhlIElTQSB3aGVuIGl0IGNoYW5nZXMgaW4gdGhlIG1pZGRsZSBvZiBhbiBF
TEYuICBUaGlzIHRyaXBzIHVwIG1vZHBvc3QKYXMgYSBidWlsZCBmYWlsdXJlLCBJIGhhdmVuJ3Qg
eWV0IHZlcmlmaWVkIGl0IHlldCBidXQgSSBiZWxpZXZlIHRoZQprYWxsc3ltcyBkaWZmZXJlbmNl
IHNob3VsZCByZXN1bHQgaW4gc3RhY2tzIGxvb2tpbmcgc2FuZSBhZ2Fpbi4KClJlcG9ydGVkLWJ5
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2xvc2VzOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvOWQ5ZTI5MDItNTQ4OS00YmYwLWQ5Y2ItNTU2YzhlNWQ3MWMyQGlu
ZnJhZGVhZC5vcmcvClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MSA8MjAyMzA3MDcwNTQwMDcuMzI1OTEtMS1wYWxt
ZXJAcml2b3NpbmMuY29tLz46CgoqIERyb3AgdGhlIHVubmVjZXNzYXJ5IElTX1JJU0NWIGRlZmlu
ZSBhbmQganVzdCBpbmxpbmUgaXQuCi0tLQogaW5jbHVkZS9saW51eC9tb2R1bGVfc3ltYm9sLmgg
fCAxMiArKysrKysrKysrKy0KIGtlcm5lbC9tb2R1bGUva2FsbHN5bXMuYyAgICAgIHwgIDIgKy0K
IHNjcmlwdHMvbW9kL21vZHBvc3QuYyAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21vZHVsZV9zeW1ib2wuaCBiL2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oCmluZGV4
IDdhY2U3YmEzMDIwMy4uNWI3OTk5NDJiMjQzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21v
ZHVsZV9zeW1ib2wuaAorKysgYi9pbmNsdWRlL2xpbnV4L21vZHVsZV9zeW1ib2wuaApAQCAtMywx
MiArMywyMiBAQAogI2RlZmluZSBfTElOVVhfTU9EVUxFX1NZTUJPTF9ICiAKIC8qIFRoaXMgaWdu
b3JlcyB0aGUgaW50ZW5zZWx5IGFubm95aW5nICJtYXBwaW5nIHN5bWJvbHMiIGZvdW5kIGluIEVM
RiBmaWxlcy4gKi8KLXN0YXRpYyBpbmxpbmUgaW50IGlzX21hcHBpbmdfc3ltYm9sKGNvbnN0IGNo
YXIgKnN0cikKK3N0YXRpYyBpbmxpbmUgaW50IGlzX21hcHBpbmdfc3ltYm9sKGNvbnN0IGNoYXIg
KnN0ciwgaW50IGlzX3Jpc2N2KQogewogCWlmIChzdHJbMF0gPT0gJy4nICYmIHN0clsxXSA9PSAn
TCcpCiAJCXJldHVybiB0cnVlOwogCWlmIChzdHJbMF0gPT0gJ0wnICYmIHN0clsxXSA9PSAnMCcp
CiAJCXJldHVybiB0cnVlOworCS8qCisJICogUklTQy1WIGRlZmluZXMgdmFyaW91cyBzcGVjaWFs
IHN5bWJvbHMgdGhhdCBzdGFydCB3aXRoICIkIi7CoCBUaGUKKwkgKiBtYXBwaW5nIHN5bWJvbHMs
IHdoaWNoIGV4aXN0IHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBpbmNvbXBhdGlibGUKKwkgKiBp
bnN0cnVjdGlvbiBlbmNvZGluZ3Mgd2hlbiBkaXNhc3NlbWJsaW5nLCBzaG93IHVwIGFsbCBvdmVy
IHRoZSBwbGFjZQorCSAqIGFuZCBhcmUgZ2VuZXJhbGx5IG5vdCBtZWFudCB0byBiZSB0cmVhdGVk
IGxpa2Ugb3RoZXIgc3ltYm9scy7CoCBTbworCSAqIGp1c3QgaWdub3JlIGFueSBvZiB0aGUgc3Bl
Y2lhbCBzeW1ib2xzLgorCSAqLworCWlmIChpc19yaXNjdikKKwkJcmV0dXJuIHN0clswXSA9PSAn
JCc7CisKIAlyZXR1cm4gc3RyWzBdID09ICckJyAmJgogCSAgICAgICAoc3RyWzFdID09ICdhJyB8
fCBzdHJbMV0gPT0gJ2QnIHx8IHN0clsxXSA9PSAndCcgfHwgc3RyWzFdID09ICd4JykKIAkgICAg
ICAgJiYgKHN0clsyXSA9PSAnXDAnIHx8IHN0clsyXSA9PSAnLicpOwpkaWZmIC0tZ2l0IGEva2Vy
bmVsL21vZHVsZS9rYWxsc3ltcy5jIGIva2VybmVsL21vZHVsZS9rYWxsc3ltcy5jCmluZGV4IGVm
NzNhZTdjODkwOS4uNzhhMWZmYzM5OWQ5IDEwMDY0NAotLS0gYS9rZXJuZWwvbW9kdWxlL2thbGxz
eW1zLmMKKysrIGIva2VybmVsL21vZHVsZS9rYWxsc3ltcy5jCkBAIC0yODksNyArMjg5LDcgQEAg
c3RhdGljIGNvbnN0IGNoYXIgKmZpbmRfa2FsbHN5bXNfc3ltYm9sKHN0cnVjdCBtb2R1bGUgKm1v
ZCwKIAkJICogYW5kIGluc2VydGVkIGF0IGEgd2hpbS4KIAkJICovCiAJCWlmICgqa2FsbHN5bXNf
c3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpID09ICdcMCcgfHwKLQkJICAgIGlzX21hcHBpbmdfc3lt
Ym9sKGthbGxzeW1zX3N5bWJvbF9uYW1lKGthbGxzeW1zLCBpKSkpCisJCSAgICBpc19tYXBwaW5n
X3N5bWJvbChrYWxsc3ltc19zeW1ib2xfbmFtZShrYWxsc3ltcywgaSksIElTX0VOQUJMRUQoQ09O
RklHX1JJU0NWKSkpCiAJCQljb250aW51ZTsKIAogCQlpZiAodGhpc3ZhbCA8PSBhZGRyICYmIHRo
aXN2YWwgPiBiZXN0dmFsKSB7CmRpZmYgLS1naXQgYS9zY3JpcHRzL21vZC9tb2Rwb3N0LmMgYi9z
Y3JpcHRzL21vZC9tb2Rwb3N0LmMKaW5kZXggYjI5YjI5NzA3ZjEwLi43YzcxNDI5ZDY1MDIgMTAw
NjQ0Ci0tLSBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYworKysgYi9zY3JpcHRzL21vZC9tb2Rwb3N0
LmMKQEAgLTEwNTIsNyArMTA1Miw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGlzX3ZhbGlkX25hbWUo
c3RydWN0IGVsZl9pbmZvICplbGYsIEVsZl9TeW0gKnN5bSkKIAogCWlmICghbmFtZSB8fCAhc3Ry
bGVuKG5hbWUpKQogCQlyZXR1cm4gMDsKLQlyZXR1cm4gIWlzX21hcHBpbmdfc3ltYm9sKG5hbWUp
OworCXJldHVybiAhaXNfbWFwcGluZ19zeW1ib2wobmFtZSwgZWxmLT5oZHItPmVfbWFjaGluZSA9
PSBFTV9SSVNDVik7CiB9CiAKIC8qIExvb2sgdXAgdGhlIG5lYXJlc3Qgc3ltYm9sIGJhc2VkIG9u
IHRoZSBzZWN0aW9uIGFuZCB0aGUgYWRkcmVzcyAqLwotLSAKMi40MS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
