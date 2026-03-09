Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C00EFCD9A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuxrdQNpmXqapbyJG7GruqIRLI9bybSpI4oBWHvGviI=; b=gfiDvsZArxa1QB
	98r6TA6vZcnCeCeyeHoW7kqL1kxBliCeMY7ik5geBNy4bgPhlkb1FLGUM8nX9PRFvkn7GRMcfuLL4
	ALBqmNxgwnIghLhPKwHf67Wt2dMfp8zp8axUblP7budUpR7bTgNBsF2Mc3e65cDkpJKAJ6FFx0vfD
	gWIAn2md2PNp8fia2k7uNMiKCmTjx+PVzfAoH6l1d3AvjN4ty1DVmAccx2Nkar7jC+ukfAKD5HQ4+
	D76R4hOS2krY+hHOD4U6G3szxFcEMooR2usIYGz+jUI4l3gZU+HF8gvzc8nv7biQ3gd7K8ktpG0QY
	GLZyJixtK558Nye+CWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyV-00000007CuD-3k4f;
	Mon, 09 Mar 2026 11:40:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyT-00000007Csh-1RON
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439d8df7620so1943817f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056435; x=1773661235; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ9F92hXIJmt/OqV8+0Y8qWB6C+g5fuewMC6KiuhW88=;
        b=JRdGD5M/s2nIU0oto1ptsLJhViAHT2rO2O+Cg/FIO6eijJkF23K0+qOxoAghRZdCjZ
         KwDjTEAJxf+qzINEftFzmReDtfYIPC5H+AwIkS6WI9IGKmAQy3e5Z0xW3w2fRai8eiPI
         xgThoibOCpjCpBFyfJ9FOTcrB3pLb84RHZLG2Wx4+9ih4REkEET6RSjY2P8S+mgdTwGh
         L1J8Zo6H8RPkRFk2/sevpiye8Sl7kQC1Jx3YlbNdKCBG9FfdaAumU2vwdKxp73QgNsVh
         +7QIHwKrHS4npkXpfC/1galh+qYxIFYvJPfL4w/bcpbRpmNW9YG0Oe8sWfsdyoXYG+xN
         UlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056435; x=1773661235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ9F92hXIJmt/OqV8+0Y8qWB6C+g5fuewMC6KiuhW88=;
        b=tYgxMKYL7B8rsGfIs81ShCPY4P1tZp5JjeEp/uq0L/C4eQYUeNfKsI+p7eZUXd7S2w
         9SwYO6IRq1E8HWJ6Xrc5pW6mwn00/A59VuP3qJEtmVWccQw2SPjPDsO6Na2uUTvOhvbT
         9uXYCyL14iwkCuVPhx7ePobXFgNdE7XIp2E1v58k/6c+qckV7DlWCXkZeZOII/bmZKd8
         skDgMFZLNa3a4I2LWbRBQr8VI+uQ1N0Ib/0iQDyx9bF4WIXPPTgErDGHRuUFuwaWCo27
         Ui26oKetlbvuY5PyciZpOhsQInm5fbdO0RCd2r9syAPG8UpZsmRtiMDka1sl/wgkB+9H
         KZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZgnA+IP4iknCqVbISwq5gYyhTF4hdxApjMi6KaRXAp4puXkHgKQnHSp2jN2vBcHpcGcwepygYocpLgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6IiIj7VD2xpe4gqtomRriz41WyQ+Kc6FEYvfeltBqzJSpJ1Wd
	V0HFafkzFkO/2u43TAAaq6XUXJPrAEV27WdEksQfBy9Z+Bsq/0G2aB4Y
X-Gm-Gg: ATEYQzyMsAKAWIrv71nAXqt1E2Lax2ZXjEzjt7PbSnH1D531wOLmmMU7JJqTgbn/amj
	/C1Ppu5ck4JCtyBZfoWsijU8J3QnMgPqrPYVc/wEtct1UawD9577QVdo16wvUAVOMmndB8iNAUs
	2yLx5wllHgUQlYEsVCfEMVpvxOlC7m0kTyDMzs2UsowPo8Oq69EVJshuAXADRfWDZ7e9UAkfUcP
	6tbzb3Er/a4LlJrEfYPQtza8JK2BwlmAxxCrP98tzu3Hzs4chioSoBDzgPJCxxAi7VRuYhiz99F
	3DWd4vRCTUdCCzM+F3rDg1CeP2j1NbZfOm7zJifBlMr0D0UDZhgBIb3D1p4z55kFxe52GGH5IGM
	+Qr7fRmgb7SpWX6LkbAJSNdinRTdzv290sOb70smpgyLzO3SFsPo0gCwI/c8sh102BH+RkgRp+R
	e6R1EBeyZHIzIoZ930uLYrBt6U86AAw2jXzWIOYReT3D+TGOfRdUPZDQBCqd/65klI
X-Received: by 2002:a05:6000:1886:b0:439:b541:a091 with SMTP id ffacd0b85a97d-439da8a2cd8mr18675754f8f.56.1773056435052;
        Mon, 09 Mar 2026 04:40:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:34 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:14 +0100
Subject: [PATCH v2 4/7] mmc: sdhci-of-k1: add comprehensive SDR tuning
 support
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-4-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044037_418120_022E38B0 
X-CRM114-Status: GOOD (  19.54  )
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

SW1wbGVtZW50IHNvZnR3YXJlIHR1bmluZyBhbGdvcml0aG0gdG8gZW5hYmxlIFVIUy1JIFNEUiBt
b2RlcyBmb3IgU0QKY2FyZCBvcGVyYXRpb24uIFRoaXMgYWRkcyBib3RoIFRYIGFuZCBSWCBkZWxh
eSBsaW5lIHR1bmluZyBiYXNlZCBvbiB0aGUKU3BhY2VtaVQgSzEgY29udHJvbGxlciBjYXBhYmls
aXRpZXMuCgpLZXkgZmVhdHVyZXM6Ci0gQ29uZGl0aW9uYWwgdHVuaW5nOiBvbmx5IHR1bmUgd2hl
biBTRCBjYXJkIGlzIHByZXNlbnQgYW5kIGZvcgogIGhpZ2gtc3BlZWQgbW9kZXMgKOKJpTEwME1I
eikKLSBUWCB0dW5pbmc6IGNvbmZpZ3VyZSB0cmFuc21pdCBkZWxheSBsaW5lIHdpdGggZGVmYXVs
dCB2YWx1ZXMKICAoZGxpbmVfcmVnPTAsIGRlbGF5Y29kZT0xMjcpIHRvIGVuc3VyZSBvcHRpbWFs
IHNpZ25hbCBvdXRwdXQgdGltaW5nCi0gUlggdHVuaW5nOiB0ZXN0IGZ1bGwgZGVsYXkgcmFuZ2Ug
KDAtMjU1KSB3aXRoIHdpbmRvdyBkZXRlY3Rpb24KICBhbGdvcml0aG0gdG8gZmluZCBvcHRpbWFs
IHJlY2VpdmUgdGltaW5nCi0gUmV0cnkgbWVjaGFuaXNtOiBtdWx0aXBsZSBmYWxsYmFjayBkZWxh
eXMgd2l0aGluIG9wdGltYWwgd2luZG93IGZvcgogIGltcHJvdmVkIHJlbGlhYmlsaXR5Ci0gQ29t
cGxldGUgcmVnaXN0ZXIgc3VwcG9ydDogYWRkIGRlbGF5IGxpbmUgY29udHJvbCBhbmQgY29uZmln
dXJhdGlvbgogIHJlZ2lzdGVyIGRlZmluaXRpb25zIGZvciBmaW5lLWdyYWluZWQgdGltaW5nIGNv
bnRyb2wKClNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMgfCAxMTkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMTkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYyBiL2Ry
aXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwppbmRleCA3OWNiN2M4ZDBiNmQ5YzQyMDZiZjAx
NzIxNjUxYzhlZmU4YTE3M2M5Li5kOTAzODUxYjliZTBlMWQyMWEyYjMwNjM2ZjVlNjNhNTJjYWQw
ZGMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKKysrIGIvZHJp
dmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jCkBAIC04NCw2ICs4NCwxMiBAQAogI2RlZmluZSAg
U0RIQ19UWF9ETElORV9SRUdfTUFTSyAgICAgICAgIEdFTk1BU0soMjMsIDE2KQogCiAjZGVmaW5l
IFNQQUNFTUlUX1JYX0RMSU5FX1JFRwkJOQorI2RlZmluZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZ
X01JTgkweDAKKyNkZWZpbmUgU1BBQ0VNSVRfUlhfVFVORV9ERUxBWV9NQVgJMHhGRgorI2RlZmlu
ZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX1NURVAJMHgxCisKKyNkZWZpbmUgU1BBQ0VNSVRfVFhf
VFVOSU5HX0RMSU5FX1JFRwkweDAwCisjZGVmaW5lIFNQQUNFTUlUX1RYX1RVTklOR19ERUxBWUNP
REUJMTI3CiAKIHN0cnVjdCBzcGFjZW1pdF9zZGhjaV9ob3N0IHsKIAlzdHJ1Y3QgY2xrICpjbGtf
Y29yZTsKQEAgLTI1MSw2ICsyNTcsMTE4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgc3BhY2VtaXRf
c2RoY2lfY2xrX2dldF9tYXhfY2xvY2soc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QpCiAJcmV0dXJu
IGNsa19nZXRfcmF0ZShwbHRmbV9ob3N0LT5jbGspOwogfQogCitzdGF0aWMgaW50IHNwYWNlbWl0
X3NkaGNpX2V4ZWN1dGVfdHVuaW5nKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgb3Bjb2Rl
KQoreworCWludCByZXQgPSAwOworCWludCBpOworCWJvb2wgcGFzc193aW5kb3dbU1BBQ0VNSVRf
UlhfVFVORV9ERUxBWV9NQVggKyAxXSA9IHtmYWxzZX07CisJaW50IHBhc3NfbGVuID0gMCwgcGFz
c19zdGFydCA9IDAsIG1heF9wYXNzX2xlbiA9IDAsIG1heF9wYXNzX3N0YXJ0ID0gMDsKKwl1OCBm
aW5hbF9kZWxheTsKKwlzdHJ1Y3QgbW1jX2hvc3QgKm1tYyA9IGhvc3QtPm1tYzsKKwlzdHJ1Y3Qg
bW1jX2lvcyBpb3MgPSBtbWMtPmlvczsKKworCS8qCisJICogVHVuaW5nIGlzIHJlcXVpcmVkIGZv
ciBTRFI1MC9TRFIxMDQsIEhTMjAwL0hTNDAwIGNhcmRzIGFuZAorCSAqIGlmIGNsb2NrIGZyZXF1
ZW5jeSBpcyBncmVhdGVyIHRoYW4gMTAwTUh6IGluIHRoZXNlIG1vZGVzLgorCSAqLworCWlmICho
b3N0LT5jbG9jayA8IDEwMCAqIDEwMDAgKiAxMDAwIHx8CisJICAgICEoaW9zLnRpbWluZyA9PSBN
TUNfVElNSU5HX01NQ19IUzIwMCB8fAorCSAgICAgIGlvcy50aW1pbmcgPT0gTU1DX1RJTUlOR19V
SFNfU0RSNTAgfHwKKwkgICAgICBpb3MudGltaW5nID09IE1NQ19USU1JTkdfVUhTX1NEUjEwNCkp
CisJCXJldHVybiAwOworCisJaWYgKCEobW1jLT5jYXBzMiAmIE1NQ19DQVAyX05PX1NEKSAmJiAh
bW1jLT5vcHMtPmdldF9jZChtbWMpKQorCQlyZXR1cm4gMDsKKworCWlmIChtbWMtPmNhcHMyICYg
TU1DX0NBUDJfTk9fTU1DKSB7CisJCXNwYWNlbWl0X3NkaGNpX3NldF90eF9kbGluZV9yZWcoaG9z
dCwgU1BBQ0VNSVRfVFhfVFVOSU5HX0RMSU5FX1JFRyk7CisJCXNwYWNlbWl0X3NkaGNpX3NldF90
eF9kZWxheShob3N0LCBTUEFDRU1JVF9UWF9UVU5JTkdfREVMQVlDT0RFKTsKKwkJc3BhY2VtaXRf
c2RoY2lfdHhfdHVuaW5nX3ByZXBhcmUoaG9zdCk7CisKKwkJZGV2X2RiZyhtbWNfZGV2KGhvc3Qt
Pm1tYyksICJUWCB0dW5pbmc6IGRsaW5lX3JlZz0lZCwgZGVsYXljb2RlPSVkXG4iLAorCQkJU1BB
Q0VNSVRfVFhfVFVOSU5HX0RMSU5FX1JFRywgU1BBQ0VNSVRfVFhfVFVOSU5HX0RFTEFZQ09ERSk7
CisJfQorCisJc3BhY2VtaXRfc2RoY2lfcHJlcGFyZV90dW5pbmcoaG9zdCk7CisKKwlmb3IgKGkg
PSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01JTjsgaSA8PSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZ
X01BWDsKKwkgICAgIGkgKz0gU1BBQ0VNSVRfUlhfVFVORV9ERUxBWV9TVEVQKSB7CisJCXNwYWNl
bWl0X3NkaGNpX3NldF9yeF9kZWxheShob3N0LCBpKTsKKworCQlyZXQgPSBtbWNfc2VuZF90dW5p
bmcoaG9zdC0+bW1jLCBvcGNvZGUsIE5VTEwpOworCQlwYXNzX3dpbmRvd1tpXSA9IChyZXQgPT0g
MCk7CisKKwkJZGV2X2RiZyhtbWNfZGV2KGhvc3QtPm1tYyksICJSWCBkZWxheSAlZDogJXNcbiIs
CisJCQlpLCBwYXNzX3dpbmRvd1tpXSA/ICJwYXNzIiA6ICJmYWlsIik7CisJfQorCisJZm9yIChp
ID0gU1BBQ0VNSVRfUlhfVFVORV9ERUxBWV9NSU47IGkgPD0gU1BBQ0VNSVRfUlhfVFVORV9ERUxB
WV9NQVg7CisJICAgICBpICs9IFNQQUNFTUlUX1JYX1RVTkVfREVMQVlfU1RFUCkgeworCQlpZiAo
cGFzc193aW5kb3dbaV0pIHsKKwkJCWlmIChwYXNzX2xlbiA9PSAwKQorCQkJCXBhc3Nfc3RhcnQg
PSBpOworCQkJcGFzc19sZW4rKzsKKwkJfSBlbHNlIHsKKwkJCWlmIChwYXNzX2xlbiA+IG1heF9w
YXNzX2xlbikgeworCQkJCW1heF9wYXNzX2xlbiA9IHBhc3NfbGVuOworCQkJCW1heF9wYXNzX3N0
YXJ0ID0gcGFzc19zdGFydDsKKwkJCX0KKwkJCXBhc3NfbGVuID0gMDsKKwkJfQorCX0KKworCWlm
IChwYXNzX2xlbiA+IG1heF9wYXNzX2xlbikgeworCQltYXhfcGFzc19sZW4gPSBwYXNzX2xlbjsK
KwkJbWF4X3Bhc3Nfc3RhcnQgPSBwYXNzX3N0YXJ0OworCX0KKworCWlmIChtYXhfcGFzc19sZW4g
PCAzKSB7CisJCWRldl9lcnIobW1jX2Rldihob3N0LT5tbWMpLCAiVHVuaW5nIGZhaWxlZDogbm8g
c3RhYmxlIHdpbmRvdyBmb3VuZFxuIik7CisJCXJldHVybiAtRUlPOworCX0KKworCWZpbmFsX2Rl
bGF5ID0gbWF4X3Bhc3Nfc3RhcnQgKyBtYXhfcGFzc19sZW4gLyAyOworCXNwYWNlbWl0X3NkaGNp
X3NldF9yeF9kZWxheShob3N0LCBmaW5hbF9kZWxheSk7CisJcmV0ID0gbW1jX3NlbmRfdHVuaW5n
KGhvc3QtPm1tYywgb3Bjb2RlLCBOVUxMKTsKKwlpZiAocmV0KSB7CisJCXU4IHJldHJ5X2RlbGF5
c1tdID0geworCQkJbWF4X3Bhc3Nfc3RhcnQgKyBtYXhfcGFzc19sZW4gLyA0LAorCQkJbWF4X3Bh
c3Nfc3RhcnQgKyAoMyAqIG1heF9wYXNzX2xlbikgLyA0LAorCQkJbWF4X3Bhc3Nfc3RhcnQsCisJ
CQltYXhfcGFzc19zdGFydCArIG1heF9wYXNzX2xlbiAtIDEKKwkJfTsKKwkJaW50IHJldHJ5X2Nv
dW50ID0gQVJSQVlfU0laRShyZXRyeV9kZWxheXMpOworCisJCWRldl93YXJuKG1tY19kZXYobW1j
KSwgIlByaW1hcnkgZGVsYXkgJWQgZmFpbGVkLCB0cnlpbmcgYWx0ZXJuYXRpdmVzXG4iLAorCQkJ
IGZpbmFsX2RlbGF5KTsKKworCQlmb3IgKGkgPSAwOyBpIDwgcmV0cnlfY291bnQ7IGkrKykgewor
CQkJaWYgKHJldHJ5X2RlbGF5c1tpXSA+PSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01JTiAmJgor
CQkJICAgIHJldHJ5X2RlbGF5c1tpXSA8PSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWCkgewor
CQkJCXNwYWNlbWl0X3NkaGNpX3NldF9yeF9kZWxheShob3N0LCByZXRyeV9kZWxheXNbaV0pOwor
CQkJCXJldCA9IG1tY19zZW5kX3R1bmluZyhob3N0LT5tbWMsIG9wY29kZSwgTlVMTCk7CisJCQkJ
aWYgKCFyZXQpIHsKKwkJCQkJZmluYWxfZGVsYXkgPSByZXRyeV9kZWxheXNbaV07CisJCQkJCWRl
dl9pbmZvKG1tY19kZXYobW1jKSwgIlJldHJ5IHN1Y2Nlc3NmdWwgd2l0aCBkZWxheSAlZFxuIiwK
KwkJCQkJCSBmaW5hbF9kZWxheSk7CisJCQkJCWJyZWFrOworCQkJCX0KKwkJCX0KKwkJfQorCisJ
CWlmIChyZXQpIHsKKwkJCWRldl9lcnIobW1jX2RldihtbWMpLCAiQWxsIHJldHJ5IGF0dGVtcHRz
IGZhaWxlZFxuIik7CisJCQlyZXR1cm4gLUVJTzsKKwkJfQorCX0KKworCWRldl9kYmcobW1jX2Rl
dihob3N0LT5tbWMpLAorCQkiVHVuaW5nIHN1Y2Nlc3NmdWw6IHdpbmRvdyAlZC0lZCwgdXNpbmcg
ZGVsYXkgJWRcbiIsCisJCW1heF9wYXNzX3N0YXJ0LCBtYXhfcGFzc19zdGFydCArIG1heF9wYXNz
X2xlbiAtIDEsIGZpbmFsX2RlbGF5KTsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IHNw
YWNlbWl0X3NkaGNpX3ByZV9zZWxlY3RfaHM0MDAoc3RydWN0IG1tY19ob3N0ICptbWMpCiB7CiAJ
c3RydWN0IHNkaGNpX2hvc3QgKmhvc3QgPSBtbWNfcHJpdihtbWMpOwpAQCAtMzQ0LDYgKzQ2Miw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2RoY2lfb3BzIHNwYWNlbWl0X3NkaGNpX29wcyA9IHsK
IAkuc2V0X2Nsb2NrCQk9IHNwYWNlbWl0X3NkaGNpX3NldF9jbG9jaywKIAkuc2V0X3Voc19zaWdu
YWxpbmcJPSBzcGFjZW1pdF9zZGhjaV9zZXRfdWhzX3NpZ25hbGluZywKIAkudm9sdGFnZV9zd2l0
Y2ggICAgICAgICA9IHNwYWNlbWl0X3NkaGNpX3ZvbHRhZ2Vfc3dpdGNoLAorCS5wbGF0Zm9ybV9l
eGVjdXRlX3R1bmluZyA9IHNwYWNlbWl0X3NkaGNpX2V4ZWN1dGVfdHVuaW5nLAogfTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBzZGhjaV9wbHRmbV9kYXRhIHNwYWNlbWl0X3NkaGNpX2sxX3BkYXRh
ID0gewoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
