Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D72CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKJjwMY0K4sICloNQcsKUHxAZGa8u4svjXPS7F+u6xc=; b=xeJ6wSfLAMrcWH
	av41gwAhd151Nvp/SR6ttNucRcCM494+wROHhmhg/s1zSl5MCw244xP32CZvqIvyEl1D5Kjr9yKDr
	y0CQsNh+4fWOwCt3uW6iG2asW3WW9CUMMMBoSwl+NYbq/HDQN6srnvFeLg8WAP2L1y29C5sjL1ffV
	JFMz0j0lNgvD3PWaWwzFg3AR63/eQXNgvByCxhjKeorD2IcfRwMozzRO5zmqV7WrfHSdr06obPxd5
	pxyf7tXha2PLnymW9PZSaFk2Vevr312N3rXNm0vcl/yb0bb3e2fASMs/I5tPCcJO+YbDQoCPDrrIX
	9v8L1GD1/2/PzxFhFKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rO-000000042hQ-2Z79;
	Mon, 15 Sep 2025 11:59:06 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rL-000000042fw-20LT
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 11:59:05 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-89365bbc079so16263139f.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757937542; x=1758542342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=;
        b=ne65M2J7ZkQAwhEXxrHu00YUT4pQWDiMrP633cB3O5/GDFgviT8Qe2HFO4W51Ep1oP
         L8o4pacU3xIw4TmsDXC4aoKdZ2Y/NvYRniLXbLXxBJnto6FPgX8WbTRU2xQs0BjO7f7O
         S9ErupvpPRFfPM6EqYFoYSgWpLl33NznxF/Tg8J2SZoppiY3wlUqOJZYegJoCkExtrPh
         MBrIt4TPqsFsTCss2csdT18SIu1N9tKUIIXFN4/z/2Dv1hqoapAtmfEehWW/O8LEdPiI
         Af/4MHF34nqTVtaVBfrGOjWAsQYU0YkGahtTyw7+k5JsQYTiYCw3BTnpUn/YU6UtgseR
         Pa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937542; x=1758542342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=;
        b=pO6Mf39r9FguBjzuVHEd+ONFSGwSZvTe+JaBsaZJtrrzOVYBGqjieCU7GUpSBLdEas
         IutI6o0yzeXqXUBj82mzNJ/ohvlJ9SiTR6aPydnL6d5x9cU58aUXDgT+lXtwmisS4A7y
         u6rcTL+UrIUZhL9i3fjA9OPdi/ry6JUIwqiSwDbFIgEd5bjSeWIdQR3tS3EmUl4gcsWt
         LWHZ//6OCdQjUwbSRc9Mv23EjtldroI1HSjkMo5sCrVmZzNRho/KzcY+Y/bEByEJQpvf
         seCqdRg3QcHhjZKamZnCmGHD99c8L3RQwLOSjtVpP4gJEGm4y2DcEPf+adK+OXpXFgS8
         ZHpw==
X-Forwarded-Encrypted: i=1; AJvYcCXFdaN2DmiToVD4YTVke6V6w0c4gjezKNi1bIVYpw7SeSzihVPpDXYNakjLr40MfmOlV7PSbOcxm+P2xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwA4ZuW2JloAOF3NmDLdNQwaBJ6j5YYrp3ERV46J8yTQqOBrG
	IfPcFdlxwukHD71QFwZZVzWAORRxbARqKjBkHSs9/Umo4Eef1d/PlMRxvzCETWb6KHR609BpWaV
	urZ59sfu3F2zWR2/zGr8iN1Y8VYxM1VWC2c5BjatC0A==
X-Gm-Gg: ASbGnctgpsXE9d0qonuS/NMaCcDtXfGvcuwLJ1F0Lo8BAxl/f0HbksB6LIZm142Wh8A
	SwsqO6jfGX2rZ0YCEgG6GhKZNLjLsZgUgd7V3E/9MsjNWdq47ygYxF3/VqpTvZCp7FQv1HurCue
	Hvsg0vBsYXTx+N8oeY9X7yiGAteLpYQ19uUABLpmyqXlXLMqE712MYZxGaXsB3wqXDDgZBqvWu5
	TbpmcQVNlobtMUXdi5SXI1dS1EGCInj0J9sOgDK
X-Google-Smtp-Source: AGHT+IHTDrsD99f5SQM6r2xQgpJxH71mXjBKOGQCXs9gTx5sBfVD90LiO27Njr8hwWJISfU1lWc6TvRVPNc4XTqs0j4=
X-Received: by 2002:a05:6e02:3312:b0:423:fd3b:ef72 with SMTP id
 e9e14a558f8ab-423fd3bf017mr46668695ab.0.1757937541951; Mon, 15 Sep 2025
 04:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
 <f740b716-6c8b-46a5-31ae-ecc37e766152@kernel.org> <aMftcHLgBvH76erX@willie-the-truck>
In-Reply-To: <aMftcHLgBvH76erX@willie-the-truck>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Sep 2025 17:28:48 +0530
X-Gm-Features: AS18NWDM6MzdjjPsw0ij-OL-CWk_57B0_4S3ilJtO7cErapGgoLvo5MzWEvUv3s
Message-ID: <CAAhSdy3wJd5uicJntf+WgTaLciiQsqT1QfUmrZ1Jk9qEONRgPw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_045903_753044_FF3A5299 
X-CRM114-Status: GOOD (  19.51  )
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

SGkgV2lsbCwKCk9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDQ6MTHigK9QTSBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDEyOjI1
OjUyQU0gLTA2MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gPiBPbiBUdWUsIDkgU2VwIDIwMjUs
IEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4KPiA+ID4gU0JJIHYzLjAgc3BlY2lmaWNhdGlvblsxXSBh
ZGRlZCB0d28gbmV3IGltcHJvdmVtZW50cyB0byB0aGUgUE1VIGNoYXBlci4KPiA+ID4gVGhlIFNC
SSB2My4wIHNwZWNpZmljYXRpb24gaXMgZnJvemVuIGFuZCB1bmRlciBwdWJsaWMgcmV2aWV3IHBo
YXNlIGFzCj4gPiA+IHBlciB0aGUgUklTQy1WIEludGVybmF0aW9uYWwgZ3VpZGVsaW5lcy4KPiA+
ID4KPiA+ID4gMS4gQWRkZWQgYW4gYWRkaXRpb25hbCBnZXRfZXZlbnRfaW5mbyBmdW5jdGlvbiB0
byBxdWVyeSBldmVudCBhdmFpbGFibGl0eQo+ID4gPiBpbiBidWxrIGluc3RlYWQgb2YgaW5kaXZp
ZHVhbCBTQkkgY2FsbHMgZm9yIGVhY2ggZXZlbnQuIFRoaXMgaGVscHMgaW4KPiA+ID4gaW1wcm92
aW5nIHRoZSBib290IHRpbWUuCj4gPiA+Cj4gPiA+IDIuIFJhdyBldmVudCB3aWR0aCBhbGxvd2Vk
IGJ5IHRoZSBwbGF0Zm9ybSBpcyB3aWRlbmVkIHRvIGhhdmUgNTYgYml0cwo+ID4gPiB3aXRoIFJB
VyBldmVudCB2MiBhcyBwZXIgbmV3IGNsYXJpZmljYXRpb24gaW4gdGhlIHByaXYgSVNBWzJdLgo+
ID4gPgo+ID4gPiBBcGFydCBmcm9tIGltcGxlbWVudGluZyB0aGVzZSBuZXcgZmVhdHVyZXMsIHRo
aXMgc2VyaWVzIGltcHJvdmVzIHRoZSBncGEKPiA+ID4gcmFuZ2UgY2hlY2sgaW4gS1ZNIGFuZCB1
cGRhdGVzIHRoZSBrdm0gU0JJIGltcGxlbWVudGF0aW9uIHRvIFNCSSB2My4wLgo+ID4gPgo+ID4g
PiBUaGUgb3BlbnNiaSBwYXRjaGVzIGhhdmUgYmVlbiBtZXJnZWQuIFRoaXMgc2VyaWVzIGNhbiBi
ZSBmb3VuZCBhdCBbM10uCj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
bm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL3YzLjAtcmM3L3Jpc2N2LXNi
aS5wZGYKPiA+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFs
L2lzc3Vlcy8xNTc4Cj4gPiA+IFszXSBodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvbGludXgv
dHJlZS9iNC9wbXVfZXZlbnRfaW5mb192Ngo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBGb3IgdGhlIHNlcmllczoKPiA+
Cj4gPiBBY2tlZC1ieTogUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+Cj4KPiBJIHdhcyBh
c3N1bWluZyB0aGlzIHNlcmllcyB3b3VsZCBnbyB2aWEgdGhlIFJpc2MtViBhcmNoIHRyZWUgc28g
cGxlYXNlCj4gc2hvdXQgaWYgeW91IHdlcmUgZXhwZWN0aW5nIG1lIHRvIHRha2UgaXQgdmlhIGRy
aXZlcnMvcGVyZi8hCj4KCkJhc2VkIG9uIG9mZmxpbmUgZGlzY3Vzc2lvbiB3aXRoIFBhdWwsIEkg
d2lsbCB0YWtlIHRoaXMgc2VyaWVzCnRocm91Z2ggdGhlIEtWTSBSSVNDLVYgdHJlZS4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
