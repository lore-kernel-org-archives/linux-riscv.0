Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60601E9A745
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfxgR3mGMynud13ieWw4Xi7Gwd/zjWDNuH2+6kiPobs=; b=pgXGs31EzbF9b7
	kvehcYJd/cfASnn17uhPHC5ViNNiISxhPqqvPZU6F2Nyvnfq8riz6MRbV03Emd1FzYeQMW1s75IuX
	IBLdx2COKy7GIPPmhdvhnwHbVbVMfZzrEQqg6yU5TadW91e4CUnmOg5uQdl9fBO+ckrBAXn2nji8H
	beSr8IY8bUduPq+NA5i22WjnueuMmEjK6heO4tRl4o87nD0q4gu/i7e9NmaObS/MN/xWLfOML/m68
	kGXmGyL83/NcHLiTqo4SCGpERbDioQwlv4OaLTyKwO0zUv9XTtpI2uZzr8SFI8iLAK39nI7h+XX3p
	us3LQqM85TmpKcfDiihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xoZ-000000013Xo-1Kbj;
	Tue, 24 Mar 2026 09:12:43 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xoV-000000013VC-10qT
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 09:12:40 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so622932fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 02:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774343558; cv=none;
        d=google.com; s=arc-20240605;
        b=A00GBVmWkXOGDMdxV6YtwlKpm2JQEN/wNL0VSRS5GMU+u45xWj7boq6dYnAIng8ytG
         NlF/ZR82kZ6GeGBMNG0zjY/xYnuA6dxsJVV3SLkEiKCNzg6PrmdzhMyGjMZSKc+XSUBS
         EQpOnFg3NoCsbRmasoqY2SL05t6QoaV7x9iy+8lcOlX7Dso4BuSjBT6cUcjI82jGGGEi
         iYxcSEn9DM4s6fnmjrmlP8d8MzD9IpadgN7Jx8eA8F6oZq+HrLZ0IvAbQFB2KwswmVsq
         WUH7sxAFy3Y2pHGqPBy/pJ0BNflrdwy7TlT2dDfnxLQkMl/OIDRnP7ipnHdu6vBKEkJk
         9N6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=po0GgTJdVB9QB9NPjwdcp7bWtiuP/AIBoTKiY3wESRA=;
        fh=RGNgjRCNff0lMhJFmg3qW49aC7AmdUUm4aPOjgOzZfA=;
        b=aP3mrox1q2WuWjwpQ68hfRHX1o5jBYpcO1jfDP2QapLKyHSuPUp2qwebNxhh7/wJXE
         YKnQUWUcjnlVTjoAprDLi7+Au27RNz3KbUdAvNt+la//P83iiF/wpoLZGiJmw/EHrHsp
         ehvgvVczQlwUDqEZJxvF5Lis3MSe4zilNFl9O1h3fGToVNkNb68jnVu6c82iw/5rJoWt
         eBeQ1LZydc8CJR416Uau9YqeCzut758OpwAVNB2yi/8Qhps5c/qOqLSdWcs1eFCzeV7c
         wvAx6VdgTfTpr2YLeYrKw614HDn2URhr+2MiXlg99JBn4dQqDfPqzLfF6CHn6KYgehXA
         QWhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774343558; x=1774948358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=po0GgTJdVB9QB9NPjwdcp7bWtiuP/AIBoTKiY3wESRA=;
        b=GkFws/fq7G9I4xguYKPh9caCi9Hs6ugU+dFDY95jgoqV2zjx3Jeipw0x5fi+Ean30C
         4cRhSkLi2z0DVjXH2/BVC+dF/t0JAh+uGfhI2IK+lu0JDAicJB6w+KwiDwtcTAQNjuvn
         ov32rdqBUj+kPTI+fZ0c4f2sQzYZYdvhCNPmQIGdUH+ARakzxJVwk9VVxIflGjssC41M
         GKmqcJRvk0qMWv7HcD8512EGqe6I+55pxgjDtumkVyavM1JyIzBzt5/s7GryfRRBweY1
         5EzVyxz2K798iJDMSOySRRmHBsB6/GvEJhbqe+uWv+SfUDcvMr/MNeVfVWaqZxq28oRR
         218g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343558; x=1774948358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=po0GgTJdVB9QB9NPjwdcp7bWtiuP/AIBoTKiY3wESRA=;
        b=dP8P/ZTjIq8ECvDBWFL0ikD1a/gZQ+hXHVbkeY5qj/iqh4/MpYCxnhOpnfRVf3Mhoq
         8W2slnKnz6Uji1ZMuiIodmI5b+x9CytzmDNPimLsF4xpN/K4AgN1QA4TMYPtdMizVKbg
         lB+f4T3JF+jPQNWVaAUHz8s+43pNmv51PGCrBuhVdY1xnuxQPXHenhv2FzOLv68p8jrI
         8NG0WVdh2zr0hnkxHZRAJ8yBQBRW9F7cpVPQG85oKkGOlwBtCz3YNU20Pz7vOvQizfL3
         p8qkXOZxTU25Vu8DJrv5QiP8SEMCIUnI/GUfcPoqv2z8A0aC+SbeolphY+fAHKWWsE4m
         MHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXerN4rEw6SBgN3YmM384UzEna17ZyKT2kwcsGWXYIz1OwOxenyTSlY2dgMmMfmgC1tEBb1lFpRF7ch9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwpSokTCL8q5gsnuLbsf7FNMmjIg4kK06Pa/mdf41BlLrah0aU
	/nnMuSyjWkRfKSXA+/w+txK9f2dexUVSUtJ8KMSACKjpNt+Tgx7foMcSXwUF286QRTSX+fOIkI0
	IqL78ZT4gGqwcaKBFwCnO7yqTrSliQTs65jeN8QdqJw==
X-Gm-Gg: ATEYQzwpiJyp28uYbS+McsOQbck9agFqCT7+D4EGguBqk8s2Me2/KaxPjnX6STq3zXw
	xx3fUHT7M094FUWa1rTqdUY8uSoAYWoBfytBLWXFEgIjCtubNuZqHbS4B4Kpu8k9gWQhtxgb670
	IjGmprxZ9QRjGpvSOiY5DhY8W9k6JACphD4jop58PjB1VwJ+MlaNGROA4+ZFTYHev9yhitQQWtQ
	h8E6qwkGvdMAAjNnD1qKfg9QeUG/acHe3dO3nG2fufaEpMA+Pg1F4hokoGq++p1Xn6PPqzdGCnJ
	V00GDuVJ/A==
X-Received: by 2002:a05:6870:e8d:b0:404:1250:1c1f with SMTP id
 586e51a60fabf-41c10f8df08mr9671520fac.5.1774343557584; Tue, 24 Mar 2026
 02:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com> <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com> <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com> <20250923-b85e3309c54eaff1cdfddcf9@orel>
 <20250923152702.GB2608121@nvidia.com> <20250923-e459316700c55d661c060b08@orel>
 <20250923162302.GC2608121@nvidia.com> <20250923-b2caf55f4f87f05aaa619e0b@orel>
In-Reply-To: <20250923-b2caf55f4f87f05aaa619e0b@orel>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 24 Mar 2026 17:12:26 +0800
X-Gm-Features: AaiRm51YfU_yNPx_PEn26PHbdMYezrFLe21xvA7oPwXPoXNN6d2xjsb4N-4LCyk
Message-ID: <CABvJ_xjnVJjV2GnYr=1WuXqo9VivNXniq8BJ39LQNwaT6vUiQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC access
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_021239_311662_0C250875 
X-CRM114-Status: GOOD (  34.51  )
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

T24gV2VkLCBTZXAgMjQsIDIwMjUgYXQgMTI6MzTigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDIzLCAyMDI1IGF0IDAxOjIz
OjAyUE0gLTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDIzLCAy
MDI1IGF0IDEwOjUwOjU2QU0gLTA1MDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+ID4gWWVzLCB0
aGlzIGlzIHRoZSBwYXJ0IHRoYXQgSSdkIGxpa2UgdG8gbGVhbiBvbiB5b3UgZm9yLCBzaW5jZSBJ
IHVuZGVyc3RhbmQKPiA+ID4gd2Ugd2FudCB0byBhdm9pZCB0b28gbXVjaCBLVk0vdmlydCBzcGVj
aWFsIGNhc2luZyBmb3IgVkZJTy9JT01NVUZELiBJIHdhcwo+ID4gPiB0aGlua2luZyB0aGF0IGlm
IEkgYml0IHRoZSBidWxsZXQgYW5kIGltcGxlbWVudGVkIG5lc3RlZCBzdXBwb3J0IHRoYW4gd2hl
bgo+ID4gPiBuZXN0aW5nIHdhcyBzZWxlY3RlZCBpdCB3b3VsZCBiZSBhcHBhcmVudCB3ZSdyZSBp
biB2aXJ0IGNvbnRleHQuIEhvd2V2ZXIsCj4gPiA+IEkgd2FzIGhvcGluZyB0byBwdWxsIHRvZ2V0
aGVyIGEgc29sdXRpb24gdGhhdCB3b3JrcyB3aXRoIGN1cnJlbnQgUUVNVSBhbmQKPiA+ID4gVkZJ
TyB0b28uCj4gPgo+ID4gWW91IHByb2JhYmx5IGRvIGhhdmUgdG8gbWFrZSBuZXN0ZWQgcGFydCBv
ZiB0aGlzLCBidXQgSSBkb24ndCBoYXZlIGEKPiA+IGNsZWFyIHBpY3R1cmUgaG93IHlvdSdkIHRp
ZSBhbGwgdGhlIHBhcnRzIHRvZ2V0aGVyIHRocm91Z2ggdGhlIG5lc3RlZAo+ID4gQVBJLi4KPiA+
Cj4gPiBTb21laG93IHlvdSBoYXZlIHRvIGxvYWQgYSBtc2lwdHAgdGhhdCBpcyBlZmZlY3RpdmVs
eSBsaW5rZWQgdG8gdGhlCj4gPiBLVk0gcmVsaWFibHkgaW50byB0aGUgREMgZm9yIHRoZSBpb21t
dWZkIGNvbnRyb2xsZWQgZGV2aWNlcyB0aGF0IGFyZQo+ID4gbGlua2VkIHRvIHRoYXQgS1ZNLiBU
aGVuIHN5bmNocm9uaXplIHdpdGggVkZJTyB0aGF0IHRoaXMgaXMgZG9uZSBhbmQKPiA+IGl0IGNh
biBzZXR1cCBLVk0gb25seSBpbnRlcnJ1cHRzIHNvbWVob3cuIFRoaXMga3ZtIGVudGFuZ2xlbWVu
dCBpcyB0aGUKPiA+ICJ2aXJ0IiB5b3UgaGF2ZSBtZW50aW9uZWQgbWFueSB0aW1lcy4KPgo+IFll
cywgdGhlIFZGSU8rS1ZNIGlycWJ5cGFzcyBmcmFtZXdvcmsgY3VycmVudGx5IHByb3ZpZGVzIG11
Y2ggb2YgdGhpcwo+IHN1cHBvcnQgKHdoaWNoIHBhdGNoZXMgMTAtMTcgb2YgdGhpcyBzZXJpZXMg
bGV2ZXJhZ2UpLiBCdXQsIGlmIHVzaW5nCj4gbmVzdGVkIGlzIG5lY2Vzc2FyeSBpbiBvcmRlciB0
byAic2lnbmFsIiB0byB0aGUgcmVsZXZhbnQgc3Vic3lzdGVtcyB0aGF0Cj4gdGhlIGRldmljZSdz
IGlycXMgd2lsbCB0cnVseSBiZSBpc29sYXRlZCwgdGhlbiBJJ2xsIG5lZWQgdG8gc3RhcnQgZmln
dXJpbmcKPiBvdXQgaG93IGlvbW11ZmQgY2FuIGZpdCBpbnRvIHRoZSBtaXggKG9yIGlmIHdlJ2xs
IG5lZWQgYW4gaW9tbXVmZC1zcGVjaWZpYwo+IGltcGxlbWVudGF0aW9uIGZvciBhIG5ldyBtaXgp
Lgo+CgpIaSBBbmRyZXcgYW5kIEphc29uLAoKSSBqdXN0IG5vdGljZWQgdGhpcyB0aHJlYWQsIHNv
IGFwb2xvZ2llcyBpZiBJIG1pc3NlZCBhbnkgcHJpb3IgY29udGV4dApvciBpZiB0aGlzIGhhcyBh
bHJlYWR5IGJlZW4gZGlzY3Vzc2VkLgoKSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgdGhlIGN1
cnJlbnQgZGlzY3Vzc2lvbiByZXZvbHZlcyBhcm91bmQKdXNpbmcgbmVzdGVkIHRyYW5zbGF0aW9u
IHRvIGlkZW50aWZ5IGEgc2FmZSAiVmlydCBDb250ZXh0IiBmb3IgVkZJTywKbGFyZ2VseSBiZWNh
dXNlIHRoZSBiYXNlIFJJU0MtViBJT01NVS9JTVNJQyBkb2Vzbid0IHZhbGlkYXRlIE1TSSBkYXRh
LApsZWF2aW5nIG5vbi12aXJ0IGNhc2VzIHZ1bG5lcmFibGUgdG8gTVNJIHNwb29maW5nLgoKSSdk
IGxpa2UgdG8gc2hhcmUgYW4gYWx0ZXJuYXRpdmUgaWRlYSBhbmQgc2VlIGlmIGl0IG1pZ2h0IGJl
IGEgdmlhYmxlCmRpcmVjdGlvbiBmb3IgdGhpcyBzY2VuYXJpby4KCkFzIEFuZHJldyBtZW50aW9u
ZWQsIHNoYXJpbmcgdGhlIHNhbWUgSU1TSUMgZmlsZSB3aXRob3V0IGRhdGEKdmFsaWRhdGlvbiBt
YWtlcyBpdCBkaWZmaWN1bHQgdG8gcHJldmVudCBzcG9vZmluZy4gSG93ZXZlciwgd2hhdCBpZiB3
ZQpjb25zaWRlciB1dGlsaXppbmcgdGhlIE1SSUYgKE1lc3NhZ2UgUmVxdWVzdCBJbnRlcmZhY2Ug
RmlsZSkgZmVhdHVyZQpmb3IgVkZJTyBwYXNzdGhyb3VnaCBkZXZpY2VzPwoKV2hpbGUgTVJJRiBp
cyBwcmltYXJpbHkgZGVzaWduZWQgdG8gZXh0ZW5kIHRoZSBudW1iZXIgb2YgZ3Vlc3QgSU1TSUNz
LAp0aGUgc3BlY2lmaWNhdGlvbiBkb2Vzbid0IHNlZW0gdG8gbGltaXQgaXRzIHVzYWdlIHN0cmlj
dGx5IHRvIHRoZSBWaXJ0CkNvbnRleHQuIElmIHdlIGFzc2lnbiBhIGRlZGljYXRlZCBNUklGIHRv
IGEgcGFzc3Rocm91Z2ggZGV2aWNlIChldmVuCmZvciBub24tdmlydC91c2Vyc3BhY2UgY2FzZXMp
LCB0aGUgZGV2aWNlIHdvdWxkIG9ubHkgYmUgYWJsZSB0byBzZW5kCk1TSXMgdG8gaXRzIG93biBp
c29sYXRlZCBNUklGIHZpYSB0aGUgSU9NTVUgTVNJIHRhYmxlLgoKSW4gdGhpcyBzZXR1cCwgdGhl
IGFjdHVhbCBpbnRlcnJ1cHQgZGVsaXZlcmVkIHRvIHRoZSBwaHlzaWNhbCBDUFUKd291bGQgYmUg
dGhlIE5vdGljZSBNU0kgZ2VuZXJhdGVkIGJ5IHRoZSBJT01NVSBoYXJkd2FyZSBpdHNlbGYuIFNp
bmNlCnRoZSBhZGRyZXNzIGFuZCBkYXRhIG9mIHRoaXMgTm90aWNlIE1TSSBhcmUgc3RyaWN0bHkg
Y29uZmlndXJlZCBieSB0aGUKSG9zdCBPUywgdGhlIGRldmljZSB3b3VsZG4ndCBiZSBhYmxlIHRv
IHNwb29mIE1TSXMgdG8gdGhlIEhvc3Qgb3IKb3RoZXIgZGV2aWNlcy4KCklmIG15IHVuZGVyc3Rh
bmRpbmcgaXMgY29ycmVjdCwgdGhpcyBhcHByb2FjaCBtaWdodCBuYXR1cmFsbHkgcHJvdmlkZQp0
aGUgaXNvbGF0aW9uIG5lZWRlZCBmb3IgSVJRX0RPTUFJTl9GTEFHX0lTT0xBVEVEX01TSSBhY3Jv
c3MgYm90aCB2aXJ0CmFuZCBub24tdmlydCBjb250ZXh0cywgcG90ZW50aWFsbHkgc2ltcGxpZnlp
bmcgdGhlIG5lZWQgZm9yIEtWTS9WRklPCnNwZWNpYWwgY2FzaW5nLgoKSSB3b25kZXIgaWYgdGhp
cyBhcHByb2FjaCB3b3VsZCBiZSBhY2NlcHRhYmxlLCBvciBpZiB0aGVyZSBhcmUgYW55CmhhcmR3
YXJlL3NvZnR3YXJlIGNvbnN0cmFpbnRzIEkgbWlnaHQgaGF2ZSBvdmVybG9va2VkPwoKPiA+Cj4g
PiBUaGUgZGlyZWN0IGluamVjdGlvbiBpbnRlcnJ1cHQgcGF0aCBpcyBhbHJlYWR5IHF1aXRlIGEg
Y29uZnVzaW5nCj4gPiB0aGluZy4uCj4KPiBObyBhcmd1bWVudCB0aGVyZSA6LSkKPgo+IFRoYW5r
cywKPiBkcmV3Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
