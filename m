Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FEEC54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRuznO0hCdyEXw6U+eM4L65ur6O9H2jDl9eHKekHZUA=; b=Id9i1DPPQIoBqX
	HU+0YaCujtc8WjYE/BHsx3l2kflyOnjkyt6C5gPttOUmU1L6gVIwiVt43Hvu0TPO1auEM5TfUGr5Y
	va9Cj+nJfL1dQJAeWkZduCm6maRchiCk/h52s7Ocw2sVViRNpTZPovn4VD2JBIlavKTmRo4EuTyaq
	pjWuUVXi3tvP5nTsZG3BAqQU3NkpK2OYdLkv7Dwc1c7pZz4pA2RutJqRvg9OGn5Y8Kxwc06EhDMy/
	swWArrEzNnhizh1xSWWPX7Q7jmtQgDBlE5tojS2KoCJgG9FujWXNIugDgavbA9S3Pqr8VrTZA9fq2
	S3LA3hrJi/8sIVIOkSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVP5-00000008Hd4-0ZkC;
	Fri, 08 Mar 2024 08:16:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVP2-00000008Hcc-3BBJ
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 08:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0E4661D9C
	for <linux-riscv@lists.infradead.org>; Fri,  8 Mar 2024 08:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E028C433A6
	for <linux-riscv@lists.infradead.org>; Fri,  8 Mar 2024 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709885787;
	bh=+KlByP7rf+bOfulZPxS+EKdSXzyhEgQiIoUkRNVAth0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AJEBJF65mmnJlZwCUPpKFJYdzNJka13dBkz0edt4+/KqQdM7xUsiNLYeVYxnMrgt2
	 q+ehRfCaOtMGAyldwckSNhgvODgQReTpEl3zR9QqFbo3uY3bApcRnMHPrQ0Jz7CICf
	 /dXmWydc0avlzbfadhLItkiAcm0UkiiFbC5UT9mmuEDm1vtLh7koBbseq3h8OqxMqs
	 wkoWMTKjHqaRBj/tku/OkDmQo7tcmrc+F8KaDn5kdqbOAoKuIScNjFtabxUgiwPq26
	 HUDMaS0ENmScg89zDJ/noNVANFZ7cHVPYmrtjBFbgqxgS43RJMGbKnYX5cE3p8ZdVO
	 TgMdERL4rmWaw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51364c3d5abso1967296e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 00:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyTOiEbzNNucp/8WOEYbNHZRPFHLwKeDn+ckvOetK6thT6znIUZx7r4Q24010q7MBH02B1PGb6sReA1QhzvxgPerSsHqG1+v4JnW6jyIr4
X-Gm-Message-State: AOJu0YwfH2UP6hIS1rEXmJFvtMFgm1QxZVTRSYGtyIkIAHih6Mfu4ZyY
	7eRm7Z9MgkyAmrypouDV4W1UNEK1nKKW2qMdLxII4cMCnp7KbHBMr9IWje2jukNogyU3pzpQjgV
	i88ETDgNlvaLJaUAFDtgEa47WBgc=
X-Google-Smtp-Source: AGHT+IGpv/Z8DQiyJqrjf2eUzf7yHR2/5h5Z4A8FPQ0x7MSK7aRM10lTeI1HNy98FRtxs0WDa4CCB8IatOX9H1APg7I=
X-Received: by 2002:a05:6512:4851:b0:513:54c6:9f68 with SMTP id
 ep17-20020a056512485100b0051354c69f68mr2751944lfb.18.1709885785595; Fri, 08
 Mar 2024 00:16:25 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
 <mhng-c53211c1-4708-459a-bdc5-6e013c2adaee@palmer-ri-x1c9>
 <CAMj1kXEFqMx8qUHQEbg=OqbG-H0Zpj-nWu=a6qhhvNEZPO7f4Q@mail.gmail.com>
 <CAMj1kXG4SXsBfNqWMRUJ+AVv=6trWUAow-f8Mk5oKCpO=WueFg@mail.gmail.com>
 <CAEEQ3wkN3HDUuPDfWTn4kTxKH03OaRxBTFru3jJzZgW+BVhABg@mail.gmail.com>
 <CAMj1kXHuKbaXqWuFuMXhfL1_2w05CfJrk2uAPOW2HNHdpEnxXA@mail.gmail.com> <CAEEQ3wnv47x+FXYQ1=DdQdgRrp_EgX+C9eH+-JMPWh5p2450Zw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnv47x+FXYQ1=DdQdgRrp_EgX+C9eH+-JMPWh5p2450Zw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 8 Mar 2024 09:16:14 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFE_G5-od5kbOiU_4D7dwjksdrMTofHfYsLkjFtZDz-dA@mail.gmail.com>
Message-ID: <CAMj1kXFE_G5-od5kbOiU_4D7dwjksdrMTofHfYsLkjFtZDz-dA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_001628_908050_AEC9BA03 
X-CRM114-Status: GOOD (  33.00  )
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

T24gRnJpLCA4IE1hciAyMDI0IGF0IDA4OjEwLCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBcmQsCj4KPiBPbiBGcmksIE1hciA4LCAyMDI0IGF0IDEy
OjQ54oCvQU0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gVGh1LCA3IE1hciAyMDI0IGF0IDA0OjE5LCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4gPiA+Ci4uLgo+ID4gPgo+ID4gPiBGcm9tIHRoZSBsb2dpYyBvZiBi
aW51dGlscywgaWYgIl9fZ2xvYmFsX3BvaW50ZXIkIiBleGlzdHMsIGl0IGlzCj4gPiA+IHBvc3Np
YmxlIHRvIHVzZSBHUCBmb3Igb3B0aW1pemF0aW9uLiBGb3IgUklTQy1WLCAiX19nbG9iYWxfcG9p
bnRlciQiCj4gPiA+IHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCAiZmJlOTM0ZDY5ZWI3ZSIuIFRo
ZXJlZm9yZSwgZm9yIHRoZSBzeXN0ZW0gYXMKPiA+ID4gYSB3aG9sZSwgd2Ugc2hvdWxkIGtlZXAg
dXNpbmcgR1AgdW5pZm9ybWx5Lgo+ID4KPiA+IFRoZXJlIGlzIG5vICdzeXN0ZW0gYXMgYSB3aG9s
ZScgdGhhdCBjYW4gdXNlIEdQICd1bmlmb3JtbHknCj4gPgo+ID4gVGhlIEVGSSBzdHViIGlzIGEg
c2VwYXJhdGUgZXhlY3V0YWJsZSB0aGF0IHJ1bnMgZnJvbSBhIGRpZmZlcmVudAo+ID4gbWFwcGlu
ZyBvZiBtZW1vcnksIGluIGFuIGV4ZWN1dGlvbiBjb250ZXh0IG1hbmFnZWQgYnkgdGhlIGZpcm13
YXJlLiBJdAo+ID4gaGFwcGVucyB0byBiZSBsaW5rZWQgaW50byB0aGUgc2FtZSBleGVjdXRhYmxl
IGFzIHRoZSB2bWxpbnV4IGtlcm5lbC4KPiA+Cj4gPiA+IFRoZSByb290IGNhdXNlIG9mIHRoaXMK
PiA+ID4gcHJvYmxlbSBpcyB0aGF0IEdQIGlzIG5vdCBsb2FkZWQsIHJhdGhlciB0aGFuICJPbiBS
SVNDLVYsIHdlIGFsc28KPiA+ID4gYXZvaWQgR1AgYmFzZWQgcmVsb2NhdGlvbnMuLi4iIGFzIGNv
bW1pdCAiZDJiYWY4Y2M4MmMxNyIgc2FpZC4KPiA+Cj4gPiBHUCBpcyBub3QgbG9hZGVkIGJlY2F1
c2UgaW4gdGhlIEVGSSBmaXJtd2FyZSBjb250ZXh0LCB0aGVyZSBpcyBubyBzYWZlCj4gPiB3YXkg
dG8gcmVseSBvbiBpdC4KPiA+Cj4gPiA+IFdlIG5lZWQKPiA+ID4gdG8gYWRkcmVzcyBwcm9ibGVt
cyBoZWFkLW9uLCByYXRoZXIgdGhhbiBhdm9pZCB0aGVtLgo+ID4gPgo+ID4KPiA+IFNvIHdoYXQg
c29sdXRpb24gYXJlIHlvdSBwcm9wb3NpbmcgZm9yIHRoZSBwb3RlbnRpYWwgR1AgY29uZmxpY3Rz
Cj4gPiBiZXR3ZWVuIHRoZSBib290IGxvYWRlciwgdGhlIExpbnV4IEVGSSBzdHViIGFuZCB0aGUg
ZmlybXdhcmU/Cj4KPgo+IFRoZSBHUCByZWdpc3RlciB2YWx1ZXMgYXJlIG5vdyBsb2FkZWQgaW4g
dGhlIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IGFuZCBhcmNoL3Jpc2N2L2tlcm5lbC9zdXNw
ZW5kX2VudHJ5LlMgZmlsZXMuCj4KPiBMZXQncyB0aGluayBhYm91dCBFRkkgcnVudGltZXNlcnZp
Y2UuIElmIHRoZSBFRkkgZmlybXdhcmUgY29kZSB1c2VzIEdQCj4gcmVnaXN0ZXJzIGJ1dCB0aGUg
Y29tcGlsZXIgZG9lcyBub3QgYXZvaWQgR1AsIGFuZCBrZXJuZWwgdXNlcyB0aGUKPiBjYWxsYmFj
ayBmdW5jdGlvbiBwcm92aWRlZCBieSBFRkksIGlzIHRoZXJlIGEgcHJvYmxlbT8gSXMgaXQgcG9z
c2libGUKPiB0byBzb2x2ZSB0aGUgcHJvYmxlbSBvbmx5IGJ5IG1ha2luZyB0aGUgZmlybXdhcmUg
Y29kZSBub3QgdXNlIEdQIGF0Cj4gYWxsIGFuZCBjb21waWxpbmcgb3B0aW9ucyB0byBhdm9pZCB1
c2luZyBHUD8KPgoKRUZJIHJ1bnRpbWUgc2VydmljZXMgZG8gbm90IHVzZSBjYWxsYmFja3MsIGFu
ZCBleGVjdXRlIGluIGEgY29udGV4dAp0aGF0IGlzIGVudGlyZWx5IG93bmVkIGJ5IHRoZSBPUy4g
U28gdGhpcyBpcyBvbmUgcGxhY2Ugd2hlcmUgRUZJCmZpcm13YXJlIGNhbm5vdCB1c2UgR1AgYXQg
YWxsIGV2ZW4gaWYgdGhlIFVFRkkgc3BlYyBwZXJtaXR0ZWQgaXQuCgo+IFRoZSBzYW1lIGdvZXMg
Zm9yIGVmaXN0dWIuCj4KCk5vdCByZWFsbHkuIFRoZSBVRUZJIHNwZWMgc2VlbXMgdG8gc3VnZ2Vz
dCB0aGF0ICpzeXN0ZW0qIGZpcm13YXJlCnNob3VsZCBub3QgdG91Y2ggR1Agb3IgbWFrZSBhbnkg
YXNzdW1wdGlvbnMgYWJvdXQgaXRzIHZhbHVlLCBidXQgaXQKZG9lc24ndCBzYXkgYW55dGhpbmcg
YWJvdXQgRUZJIGFwcGxpY2F0aW9ucyBzdWNoIGFzIHRoZSBFRkkgc3R1YiBvcgpHUlVCLgoKPiBT
byB0aGUgd2F5IHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBpcyB0aGF0IHRoZSBmaXJtd2FyZSBkb2Vz
IG5vdCB1c2UgR1AKPiBvcHRpbWl6YXRpb24uIERvZXMgdGhpcyBhbGxvdyBlZmlzdHViIHRvIGxv
YWQgdGhlIEdQIHJlZ2lzdGVyPwo+CgpXaGF0IGFib3V0IEdSVUIgb3Igb3RoZXIgYm9vdGxvYWRl
cnMgdGhhdCBhcmUgbG9hZGVkIGJlZm9yZSB0aGUKa2VybmVsLCBidXQgYXJlIHN0aWxsIGFjdGl2
ZSB3aGlsZSB0aGUgRUZJIHN0dWIgaXMgZXhlY3V0aW5nPyBXaG8gZ2V0cwp0byBvd24gR1AgaW4g
dGhpcyBzY2VuYXJpbz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
