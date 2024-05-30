Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B00C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvL+VZlsVC1K+GuZbpMzNdF+HVMzp+Bv4H+ugQkqtUo=; b=Xzn52V1VI/RVOT
	Ld/vv6OAyhXcsH1E1Fwz6gC8oMkJhnc9f3bQd8ow6xGItINxhBW3l4TIVd2srFTi67Lgy4bt/AXZU
	F4/D5EtgWui5EeRh9HPv6IAhvBW5cBwew7Orpt2sX+RjvFKvdHGxJV6Qr/A/fXLxKMFTHlU/vPJMu
	yFIqLIeBQQQrO3IZLztOqL8xjEF5/FwRYA5v5o7I65pCBBCAT1FxiV5S2aFS5Wbt8YczmEwHGoTpO
	0+ZfAAdbqGC+EM4JTxmJ8Runvg91WZLYLoLxqNTIyUc9qNM2cJBOIRhlyHgvnWqk4fGasKFX1YjML
	Wn16bxKk1Ejs1U5ZCqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCb1N-00000006bxN-42K4;
	Thu, 30 May 2024 08:20:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCb1L-00000006bwZ-0VjC
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 08:20:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4202ca70287so3389755e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 01:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717057219; x=1717662019; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAFqwlnprskdijXg0+qVMxiHshvm9v4VwBvMivw4hqg=;
        b=CXAZP82bojczrtCmlmwwIq0yYJLh3Bi3M3ya42rlJgpaEnnMVQztZ4U3sG2F1aLtIb
         LTaSzUfTlW7WuwITb4D9rkCnu2xz+aNTVCsGJyEdS71WvWO/zWa+4nEHfboZCsmhd63K
         Rvs3NYzEBxPh0UNRCtfmIzUVAbvu8fBEXlzTYAFYBbl0ntUKDoO8zhx7330MUpFtFv+9
         GUbJ1VrwGrlp8+CPcVpkFuQvSdAQWu5OVEo6ebbMCu7BLGCYeq5luJlOiSlGwqmutTNR
         f/AbmYspHOvWF/xSI1iLXFt3olSpQhfr05iRr6cNBx2wRs2xCqs4jFlF7wEv4Lk/ucS4
         iCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717057219; x=1717662019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAFqwlnprskdijXg0+qVMxiHshvm9v4VwBvMivw4hqg=;
        b=bHuK6jg9Ub87j6y5wc9Qz/2CVhch3CSCyR8KK88QVAr6v3sGiadBSTJIn9rewDOjxG
         xfIZzo39tnY3etVqt7VSrlkTOQRRnt1HCAv8yZwmmAA5mOa5dZ2o4OZ9+N7Ga+MrZrNN
         d2yWo7gFGGgR1hFtyGqXnnyoAvOpG6XrHBrDvD43/Hgd9Gx34s3XFOWZQOTCkRE6a3bk
         CLY7XTMVaA5DQIBT3t1jTHYkeMtdXnLZI6FQRSZN22Zh/w25xHlWej6VfiVCWKtWNEea
         5Xqi1jDxksgCHsAmypQluwZflIXFCsSiH86miTNN4u/6V3Q1xTWJAbcrhhv16ZQyggp8
         gsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBSA9+4hPhS4hoPG3M6nQypOWdeF75deO993GLLXBBMaf0NV7l4I6A+Xk1u5k+6DprmbiooyJUTXLR+uoWqx/0VJIoQwfTs5nih4YxIQOK
X-Gm-Message-State: AOJu0YxXXR3RzW73iqyrktvnq/6JwWCvLdJOnCSyPYSaIrcIRTmRuDbF
	VPCs/KyXwhiYJsY4hVSrWvSv413AKXVfcf8M/ltX++ak4mfO67iQdN9LsODiAXA=
X-Google-Smtp-Source: AGHT+IG1keazYzeuDlTEJWYo0DNz5z0le/1L4QF2tlIZz4H3UjAuU4J130ihkcGjOo2htfDSVAmo6A==
X-Received: by 2002:a05:600c:45d4:b0:421:2241:5be3 with SMTP id 5b1f17b1804b1-4212780a865mr16402325e9.5.1717057219466;
        Thu, 30 May 2024 01:20:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212708a6fbsm17283305e9.44.2024.05.30.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:20:19 -0700 (PDT)
Date: Thu, 30 May 2024 10:20:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v6 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20240530-af20943d2b372faa7b11ed41@orel>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <7dcd9a154625704cbf9adc4b4ac07ca0b9753b31.1716578450.git.tjeznach@rivosinc.com>
 <20240529-08fd52a8e703418142bdfa84@orel>
 <CAH2o1u7DmywajQWRnQEW2Zjw95EzruM3_Mb5Z-K4zJChh8pGLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u7DmywajQWRnQEW2Zjw95EzruM3_Mb5Z-K4zJChh8pGLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_012023_188748_04BC71D9 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTA6NTk6NThBTSBHTVQsIFRvbWFzeiBKZXpuYWNoIHdy
b3RlOgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0IGF0IDg6MTXigK9BTSBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBUb21hc3osCj4gPgo+ID4g
SSByZXZpZXdlZCBpb21tdS1iaXRzLmggdG8gdGhlIHNwZWMuIE1vc3QgbmFtaW5nIG1hdGNoZXMg
ZXhhY3RseSwgd2hpY2gKPiA+IGlzIG5pY2UsIGJ1dCBJJ3ZlIHBvaW50ZWQgb3V0IGEgZmV3IHdo
aWNoIGRvbid0Lgo+ID4KPiA+IFRoYW5rcywKPiA+IGRyZXcKPiA+Cj4gCj4gVGhhbmtzIGZvciBs
b29raW5nIGludG8gdGhpcyBhIGJpdCBib3JpbmcgZmlsZS4KCk5vIHByb2JsZW0uIEkgYWxzbyBt
ZWFudCB0byBwb2ludCBvdXQgdGhhdCBJIGNoZWNrZWQgYWxsIGJpdHMvb2Zmc2V0cyBhcwp3ZWxs
LiBUaGV5IGFsbCBsb29rZWQgZ29vZCB0byBtZS4KCi4uLgo+ID4gPiArZW51bSByaXNjdl9pb21t
dV9mcV90dHlwZXMgewo+ID4gPiArICAgICBSSVNDVl9JT01NVV9GUV9UVFlQRV9OT05FID0gMCwK
PiA+ID4gKyAgICAgUklTQ1ZfSU9NTVVfRlFfVFRZUEVfVUFERFJfSU5TVF9GRVRDSCA9IDEsCj4g
PiA+ICsgICAgIFJJU0NWX0lPTU1VX0ZRX1RUWVBFX1VBRERSX1JEID0gMiwKPiA+ID4gKyAgICAg
UklTQ1ZfSU9NTVVfRlFfVFRZUEVfVUFERFJfV1IgPSAzLAo+ID4gPiArICAgICBSSVNDVl9JT01N
VV9GUV9UVFlQRV9UQUREUl9JTlNUX0ZFVENIID0gNSwKPiA+ID4gKyAgICAgUklTQ1ZfSU9NTVVf
RlFfVFRZUEVfVEFERFJfUkQgPSA2LAo+ID4gPiArICAgICBSSVNDVl9JT01NVV9GUV9UVFlQRV9U
QUREUl9XUiA9IDcsCj4gPiA+ICsgICAgIFJJU0NWX0lPTU1VX0ZRX1RUWVBFX1BDSUVfQVRTX1JF
USA9IDgsCj4gPiA+ICsgICAgIFJJU0NWX0lPTU1VX0ZXX1RUWVBFX1BDSUVfTVNHX1JFUSA9IDks
Cj4gPiA+ICt9Owo+ID4KPiA+IFJJU0NWX0lPTU1VX0ZXX1RUWVBfKiBmb3IgYWxsIGFib3ZlCj4g
Pgo+IAo+IEkgZ3Vlc3MgUklTQ1ZfSU9NTVVfRlFfVFRZUF8qIHRvIG1hdGNoIF9GUV8gYWNyb255
bS4KCk9oIHllYWguIEkgZ3Vlc3MgbXkgZXllcyBoYWQgZ2xhemVkIG92ZXIgYXQgdGhpcyBwb2lu
dCBiZWNhdXNlIEkgZGlkbid0Cm5vdGljZSB0aGUgJ0ZXJyB2cy4gJ0ZRJy4gU28sIHllYWgsIHdl
IHdhbnQgUklTQ1ZfSU9NTVVfRlFfVFRZUF8qIGZvciBhbGwKYWJvdmUsIGluY2x1ZGluZyBSSVND
Vl9JT01NVV9GUV9UVFlQX1BDSUVfTVNHX1JFUS4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
