Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDEDC71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRz6U54QHAP5Xd8ME0B6yOBhdq99WIE0ltb0eEVki5I=; b=DuLnBD5FHUt9wi
	hqzAYjxldDztWKTnwpX2z5JTnb7h8xOlgS4InVxVVDY3JiTprhrejtteWgNHSW4LfeK+jhyE2iPUq
	rfRAlu9Mw+k8MWvYmUcSEPUVuEHHRgtt++29UrRu5bs9Ag2SJwlBHN1Q+coGRFm/coA5GdDQ9Ie6P
	FDiPajlLeMNlBtCPD3PghI29WB4+vjlak8zYZMNmbMuHG44snSR2peoeyqLtpEFkTtTHV7Ix0Y4ap
	qZEnEQ/RhR3S7k5A5NJFzGHS6UKhz3lysdmgTlKfIE+jk05b0VXe15Nu1SQ/PEFVhsqJ9iTApl/5Q
	JbPhnUQkbQOOv6E4VVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPl4-0000000AoFU-1d5n;
	Wed, 11 Jun 2025 18:01:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMd7-0000000A83n-0Wco
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 14:40:42 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad8826c05f2so1284973766b.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749652839; x=1750257639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VanCGAV853jeZl/piu55b8cOeQ1lh3SiVReRL2SvGyU=;
        b=DcgoHU8RGQeY0lEmDrc+zugVolAoGgL+ecA+v85Ny3py+zlCFvbB9+M3t6EpcNnecx
         o5y7J6AR9nISky2kFMgcoChEUurcCKvNTeydId0tavPSRMrq3fmowjxUzDmBwdbZRuI0
         eX3EQvw071p3xrO1qwD63B3khRMkyZGPQZeRpBKSCBqYXQ0DrB4AoW7edbzBLRAbWL1P
         jW7eHMwCoSTe1qJu0MxlQCJc+oNzFQTd5+wDYy7GtDSRyY2CSq3P12Ut8f5MUNErQzcS
         +OBtaj3GFNccrllBbMlAU2ye34nIsYtpXxIr+kfKgopmqkuurk1o6Dw1u5xnwAcjjtAC
         f6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652839; x=1750257639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VanCGAV853jeZl/piu55b8cOeQ1lh3SiVReRL2SvGyU=;
        b=U5LsV0DaxRGy/nhTfkRciJJAwJuSbprTGUprX5OvP2S8tFsgVioB4Z8edg89YKi5Lp
         +pqrLhJWV+YsPlmT/3ugUk0N8/adPot+tvrornD4WxneMzfpNZBZ2X6x4RLsqBFOOh3F
         7dQ8XME2d8vXymXespfTp/jn7LMr+03ZotIaAu48b0XQl9yj0ZLL/HW8jz9kUbz4CNiu
         /vz6G4D/RG1Z2mLj0xQb96gfBV9inw0aopdzqm0hfTyNnTIbEs+zBsA3hQKr9m54ore1
         v2Tf6Sq4s3e1r74wV1TgVkphj9nV/GRLP67CbPzocKd8ODPTkOZ1NVGCZhNOhc/nlLk9
         IP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRibhn9+Pv7RcJEWsd0kWoC+vfqsc2GT+AcanPPLQV/L5GA0oyl1J4M4429SQAnyEeV/MNIa/vFrsarw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy0sGoa7M9GE80rvkOxovgiBpq4Z5Tlx932ZExPj44rwDMwm+F
	dBrIjN3IBNEYKbUFAraYeMff3DRu45fGgy0YIZLk3IqJVBeoaJUKCRQ1VevqJynUORHa7UwO1ip
	daDR6pDN73bAAqfmRPW6giBRcXR7tCcdrY2qfi6GlJg==
X-Gm-Gg: ASbGncsRI55RBHzdX296pZ/GmSAiCAE3TTC+MCB6J92bCigefHFhEPEK3fDXTPubT3z
	VVvMlI+XoL4ySNkKW1qZ4naM1is1NZzb8hCmLtNZ3yeETV4wMmEiyScgd9E0hqmYXjqmuDphn1T
	CnyDFb4jnLzt4TlAybKLPDiM2Kbvp5hAY5ntFi+6GnKMOM
X-Google-Smtp-Source: AGHT+IHDSmTZDyiDRZOD1n1VEoO2BN/q5+1t3d32dZUsxmTdSpg0xwKQkFHQYBpUpsmp4CIhNRKBUUObLCw4k1Y89D8=
X-Received: by 2002:a17:907:968a:b0:adb:1804:db93 with SMTP id
 a640c23a62f3a-ade8c8eff15mr309077666b.49.1749652839519; Wed, 11 Jun 2025
 07:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-8-guodong@riscstar.com>
 <20250611135116-GYB125008@gentoo>
In-Reply-To: <20250611135116-GYB125008@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 11 Jun 2025 22:40:28 +0800
X-Gm-Features: AX0GCFtLP8n8AGHV29EjK0zTceQ99c8B_7Z1bY9fkoSHAd2Q1BdFWQkZ6Pv-a54
Message-ID: <CAH1PCMbP54PRq27p7Ss+cdvB86M8k3CQepzxJwfpwfJPPnrMag@mail.gmail.com>
Subject: Re: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_074041_163365_A3F96C43 
X-CRM114-Status: GOOD (  18.48  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgOTo1MeKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsCj4gICBJJ2Qgc3VnZ2VzdCBtb3ZpbmcgdGhpcyBw
YXRjaCBhZnRlciA0LzgsIGFzIGJvdGggb2YgdGhlbSBzaG91bGQgZ28KPiB2aWEgRE1BIHN1c2J5
c3RlbSB0cmVlLCBvciBzaW1wbHkgc3F1YXNoIHRoZW0/Cj4KClRoYW5rcyBmb3IgeW91ciBhZHZp
Y2UuIEFncmVlLiBJdCBtYWtlcyBzZW5zZS4KSSB3aWxsIGFycmFuZ2UgdGhlbS4KCi1HdW9kb25n
Cgo+IE9uIDIwOjU3IFdlZCAxMSBKdW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEV4dGVu
ZCB0aGUgTU1QX1BETUEgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIFNwYWNlbWlUIGFyY2hpdGVjdHVy
ZQo+ID4gYnkgYWRkaW5nIEFSQ0hfU1BBQ0VNSVQgYXMgYSBkZXBlbmRlbmN5IGluIEtjb25maWcu
Cj4gPgo+ID4gVGhpcyBhbGxvd3MgdGhlIGRyaXZlciB0byBiZSBidWlsdCBmb3IgU3BhY2VtaVQt
YmFzZWQgcGxhdGZvcm1zCj4gPiBhbG9uZ3NpZGUgZXhpc3RpbmcgQVJDSF9NTVAgYW5kIEFSQ0hf
UFhBIGFyY2hpdGVjdHVyZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3Vv
ZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2RtYS9LY29uZmlnIHwgMiAr
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9LY29uZmlnIGIvZHJpdmVycy9kbWEvS2NvbmZp
Zwo+ID4gaW5kZXggZGI4N2RkMmEwN2Y3Li5mZmY3MGY2NmM3NzMgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2RtYS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2RtYS9LY29uZmlnCj4gPiBAQCAt
NDUxLDcgKzQ1MSw3IEBAIGNvbmZpZyBNSUxCRUFVVF9YRE1BQwo+ID4KPiA+ICBjb25maWcgTU1Q
X1BETUEKPiA+ICAgICAgIHRyaXN0YXRlICJNTVAgUERNQSBzdXBwb3J0Igo+ID4gLSAgICAgZGVw
ZW5kcyBvbiBBUkNIX01NUCB8fCBBUkNIX1BYQSB8fCBDT01QSUxFX1RFU1QKPiA+ICsgICAgIGRl
cGVuZHMgb24gQVJDSF9NTVAgfHwgQVJDSF9QWEEgfHwgQVJDSF9TUEFDRU1JVCB8fCBDT01QSUxF
X1RFU1QKPiA+ICAgICAgIHNlbGVjdCBETUFfRU5HSU5FCj4gPiAgICAgICBoZWxwCj4gPiAgICAg
ICAgIFN1cHBvcnQgdGhlIE1NUCBQRE1BIGVuZ2luZSBmb3IgUFhBIGFuZCBNTVAgcGxhdGZvcm0u
Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4KPgo+IC0tCj4gWWl4dW4gTGFuIChkbGFuKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
