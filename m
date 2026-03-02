Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89104EA4E0A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6sofNCfQqrRKQ6EmaksTi3J0hpkFVtak5hHgmVf3+0=; b=jelL4tePssZTGG
	c7Ze61zu2bpZXHVewcQ6PuNunbiNDEn0OTxHRFPyGFGZLNAeJ7hwsFSEI2TbuNzEMslM7dz5Sx94B
	ZJPbeuM+CsejeDK+n9Udh1KtbVgtsjGYbyhre8AmnrEVD+AR865YWKZA08J8FzLzFXZtbXmiH1yye
	5bDJ7I3X5CEk1A9WHdOaqE+TtMjHx9CU1oHCut7oVmqYd5nWrqaWkzNJwdUfELP1a20NG26VjbUt7
	e1DGnhhtLmb2XfQ4pb7cjUyD6n+tdo27BDVIxhvBFfnTs7QRokzHQexu1PtTyrWOuvHRzOVwYJ/MR
	ivZ3YU963zpfPKK3AcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yE-0000000DK9f-1O9o;
	Mon, 02 Mar 2026 15:14:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yB-0000000DK5Y-0t4m
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:14:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4833115090dso47405925e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464441; x=1773069241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeFtmpd0OzFDMpfzIzFKTIa4npbmPiXE0EW+dCwlXrY=;
        b=WC8UezdGKx4m4uW0EkkOuJF3AIyK5eJBqr3pWeaNc0lu3vKq7nN2TMgq2orlfhBSTn
         HryuIT3UCZWkwh4VtDA9sOzfpIjmKLESkSGHrXdH7rm9q3fB3viN02b3FzgWR7joT6wB
         VbpGGc20y9r63beJI68QEx/GTzF4CHff1aie0Pp8fKdxE+8LM/HWgbNkdBvgUXo2mUuS
         Jp2HSf7kA1CBYrFYIgx3cCb7dbbDYg/060SULcvDNVqz33Se98JFStCFI+FiEgx7FdtZ
         60SemXZe2Q3B8xSbktnozYM/Ejx7mz5y2g44lDeJVVBCiYVCN8NoQUNJa4lfKGhRqN9N
         0YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464441; x=1773069241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeFtmpd0OzFDMpfzIzFKTIa4npbmPiXE0EW+dCwlXrY=;
        b=ieSlccJtI2kk5fj3bb4bOyOES4VgSKvsPZ1WcDtuS4JPP/8PTCL9z9hhp0maUYnHNQ
         4MJaxURdNF1kVxl1niAz8ezN+DW9ll8OSxazshUSZupROHmG5mcNgewz9DlGXOCDWL8d
         WYKhzpX6GVgkjRWCshzT/DK7IOOb8azcfch8MjL4cyauLIKZPk17oU7+SHFlqwC52YKo
         AunfXqpXAvKO0JMeX/LSB9ReirMrnDDFjC9Ipv6g3AKG0wSfhhJiQ+oOkaaWAwJiKBR8
         Ws2OKhVOlpn98V/7SqYlT1g4YItmo98rLfbbcKNaWjNonvN9V7p54VkW8d2NCN475Vi7
         LM2g==
X-Forwarded-Encrypted: i=1; AJvYcCXjr7lm/sAW85G8ZJVES5ZSY45Pq7ggyoVcFyQ5QcMbIwtasn/5xgBQv1JjoMUtKathbG22v1FrOv6E6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YziUQB8krM51ok5f0EPR3hsHG1jsklc+iXPPRADgsefQx05FTPL
	CuAe5YztuS5tHnDFPeNklXTkfsKlC9Pkip8EZCVCL44mV1EayKPxRmCR
X-Gm-Gg: ATEYQzxx6hhlqfL0J6wvrQBVVjMGWhNUrB6phbhuN1DfBi7vKfljdSi6RXlt2xpkuI6
	0RnGaT4gXpeyZ8PQdYPakwtQ2zpOdj1kyEBUpv/IH4mgy7BmUzljya9ztKo9NehNFxeXVhES7jH
	ixqNhRdxKHJfma45+CHQdX0AV28Fu7Z9RRGcMvFCSUMaNI5j9Su2V0YLXm8Q7/dJhiIzms/8UJY
	fD1n0CawyypvY6S88AUr2SO1oEedzosLtQDzQ4V6BBCeYty/aVK6g6P+uKubmusrX+WwOCgQoMt
	eBaH7oS94xiLt2m75FxjLPuHbC5l2tftnG9Z91Q2H5MsMocTXHJ3jhd5nV+i6NWRDNMDSuDISjd
	o5P28uIE4PuGsPB0rxfZdo8e09YZMak2HuIM+UvwAywsqxr6KdfUvwLm9Ba/1WWeY5wVRX1PHXs
	88gDoubNf6nGJiVcRgQf3vC5VM/Vr0VDf1tR6rFRYm5udqGfOHB0PVCLl4Cek4uoW6/A==
X-Received: by 2002:a05:600c:3550:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-483c9bedad1mr235668315e9.17.1772464441044;
        Mon, 02 Mar 2026 07:14:01 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:00 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:28 +0100
Subject: [PATCH 07/10] mmc: sdhci-of-k1: add comprehensive SDR tuning
 support
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-7-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071403_304978_67C3AE92 
X-CRM114-Status: GOOD (  18.53  )
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
bT4KLS0tCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMgfCAxMTggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMTggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYyBiL2Ry
aXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwppbmRleCAzNGExYjljMzU5MTkzYmU3ZGQ1ZjA3
ZDFmM2Q2NTY1YjVmNDBlN2ZmLi45NWIwMTZiZmI1NTk4YWNlYTQxNjYyNTdkMTJhZjU0ZDk0NWEw
YzEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKKysrIGIvZHJp
dmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jCkBAIC04OCw2ICs4OCwxMiBAQAogI2RlZmluZSAg
U0RIQ19UWF9ETElORV9SRUdfTUFTSyAgICAgICAgIEdFTk1BU0soMjMsIDE2KQogCiAjZGVmaW5l
IFNQQUNFTUlUX1JYX0RMSU5FX1JFRwkJOQorI2RlZmluZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZ
X01JTgkweDAKKyNkZWZpbmUgU1BBQ0VNSVRfUlhfVFVORV9ERUxBWV9NQVgJMHhGRgorI2RlZmlu
ZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX1NURVAJMHgxCisKKyNkZWZpbmUgU1BBQ0VNSVRfVFhf
VFVOSU5HX0RMSU5FX1JFRwkweDAwCisjZGVmaW5lIFNQQUNFTUlUX1RYX1RVTklOR19ERUxBWUNP
REUJMTI3CiAKIHN0cnVjdCBzcGFjZW1pdF9zZGhjaV9ob3N0IHsKIAlzdHJ1Y3QgY2xrICpjbGtf
Y29yZTsKQEAgLTI1Niw2ICsyNjIsMTE4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgc3BhY2VtaXRf
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
c3RydWN0IHNkaGNpX2hvc3QgKmhvc3QgPSBtbWNfcHJpdihtbWMpOwoKLS0gCjIuNTMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
