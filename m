Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED354CD343F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIyPSguBxTYVHGWUvBSt6I071/jm9Dix2kscbAPSdGI=; b=TRHPVNSnJeLVqi
	ShMneFo0y0ACf1aLidRoePA7ukuCQSrIknnDSoaqnvvF5vtJbbeS0yGm93agOAeveKi2oqxsNGRc2
	DKTpKk6pFMxW9XxPS65/ZzwJuJD8QXED4wFe89llturMtpZwjSYGErWVWaiizaxsZZv3ruGOFDS5e
	WZZM1Muk8dAXfG/M854BK/DIbB9zjGIMtiP5YLPlhRrkjtISqJcVrgjEA0xeakW0AX7JpJDwnjEuT
	RH77GVQFa4oi4iASok/nByMb9wpkuUfxGirqVtvMYn6lQj2yVd7oW7uAKCRD8sCZak/q44RUI3qRA
	8NVBNnxpeWCIjP6tZuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP45U-0000000GoiC-2CIQ;
	Mon, 18 May 2026 19:57:16 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP45S-0000000GohA-0553
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 19:57:15 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50e61648f10so5831cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 12:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779134232; cv=none;
        d=google.com; s=arc-20240605;
        b=fK5p3TLUl2qw12DrYP0hNZDhk93a3x8qTJucj3u+QErLUIbcThFr+8E2LEA0Pa2u4z
         xiCyqve3mVriENUaY0mo04+JDAgAJcj89fpCLhokKaqhhKcBl9n0gkhC8KX53v20nyJi
         x3NgkNh2Hu1QTfe6NVXOQrlUMcj7Kg8ZUcYMaA8QCkM+aLZ1avvK8d8tO0JtQzqra6gQ
         iRZ5rAoHf3SYBcudBNwj2QXNKh6djaznCTl623uZSWY0yuKU539WCetCuBcGH0gXc1gV
         ccLhoho+Fqq9jK9DokFzh7aZ2Kk9pNeLnxSdPPB3mcVa4Q/JE6uR4YoMXAO2egg1DMvV
         8I1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        fh=sQkEPv69XsJzvZJw0OrtZTDgKDWlnAik2pCuFHgH/n8=;
        b=aNuiohwNc2imEkXNsML6FlkBUgSAMNVZ9JG9d8WDgJPoJ/FL0tiDtkcrgHD6iiV8CO
         ucjjf6OgSjyOcSHPV3NE6AkAGKxsGDuQm0MyJoS49b1E5QeSLxnpllDIog98WfuhFgrH
         UwjAjw1PctsYgr6vah8IW4WGSjnH9ppryOxA/bG687QDU0L/8sczdouQ4mMTc2Ui/yhr
         St79+JZ+3OMB4zuTS3FkTg48bAJmkDVC+oMBYh6IlQTkFE6fv+t26lwhWo+ocFLiJuU/
         uwAp8q3y4MBF4/oUVk+c8dNolN0utNKoJ/7/FBxC4UJ5/mxC5Nz6FG+sJet61Az7SK/R
         253A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779134232; x=1779739032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        b=UmME8FLbKuacmhsaR1BYtoJW/iZMQnTKoq3g/86dwxinwFHALTMAUjv7m8kUdR3vpj
         L6bscYzn57eIoVdu1meZppy/uTqh7J6bhMg2lWmvsf4Ut4TOz79r169NE+dtpYr+lIjY
         U0suor2m8nFJ1xJvBmTMkGtLxNPLVqj3Mfvk3OaCiT5mxUfBakRFb9nT3wH2kp7dNKd9
         E1uMPYtxCtSF6+4aDBIdGnicEylOuEapkeYDUW9POjQ3e2/1cYHTxFxtnd6wJiPR9wnJ
         p0hqrAdoy6cuq3tEiSf3BMGw5/Vba+hTqApIjPkIJIOABSvcldPloHLN92g5OWwDKMiO
         NfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134232; x=1779739032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        b=hVxBxsVK17uuqWfs/BwmenlE7QJvtznB/5meBBn8/2gT2I72Ap6CivJDbFq9JVVSRE
         UE06PlXTDVaqgjJv3U2r/m41MOayCztyIvf2laQHRV7joVh3nbr0Jolc865YxFO2zLcY
         lMiUDockhAQpTyjgo9X2zaafPkL940zskXugctl2lLrL1B4GUq5nkkx8fkG41lD3dNHF
         GzuSAv2xu0PnG3Sq+fRdy+Ge45r/UBPN4WH6pnhCzRlcnYiSeMYuenKsAtklzE9BT6Pd
         /094/rT/eCknr7mRLRHCqhq94ZrQ6GvopK+smu3nhSpGD5AFKZbDWJW8VuKBRS3zxHz2
         ZfLg==
X-Forwarded-Encrypted: i=1; AFNElJ9b+q6JiRSKuFP02MzrYd25s7ED3XHcGOfhgn8J6oud1ezOJ5QFoAm/zWjPP6hGxG38aNBZylZ9Btg1RA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzCd456G5dl8s1xDFWtniU/bZsvgvan/MtHfltsXkCvYiN6IwZ
	OVVkkhojChap21XCDiqttnHA+jG1UoiqTtN/3l9wdzR+HWlRNNuObjGYGTE4GiD3R/rJDGcR9m5
	uVUakc7CHcnXGMhM65g5mY+kM6ap+EZn/ytxPqa7B
X-Gm-Gg: Acq92OHwp9DidY/8sy6IjHJHPHJr3iaxN/MRgNL8ZslNNuejICQHMfqK8/HHje/jNAQ
	EoHgygiKXG+7kTsSdt5U8Euz7tJZlHigNURUXbY0cJfN1Uv8i4xvXyvLt0kodj+IcnQSDPXZ+S+
	0K/rC3rxWdNQc2fh4COOn/WoMkr3mDmZF67kdqKFhn4RmJctXReaTA1Qoryaykou8q25m7fSsnz
	Mn0yLyS1AE2/LsAYoQ1jnofHQj9S3bAyLsRfWzDvSXTygA40S3lMmDkGU7yfMzFyHjsFdzFLQxL
	0ytpFPDo+4JxH+sE
X-Received: by 2002:ac8:5907:0:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-51679440a95mr20949301cf.16.1779134231137; Mon, 18 May 2026
 12:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 18 May 2026 12:56:59 -0700
X-Gm-Features: AVHnY4LKURvCbX_IJPUmfCTmwYP6SL9RXK1r_86Qf4VKBQdD4r83VbCvOh5ZGPk
Message-ID: <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125714_084040_8841EDCC 
X-CRM114-Status: GOOD (  67.09  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNDoyNuKAr0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDE4LCAyMDI2IGF0IDU6NDfigK9QTSBMb3Jl
bnpvIFN0b2FrZXMgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIE1heSAx
NywgMjAyNiBhdCAwNDo0NToxNVBNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gPiBPbiBT
YXQsIE1heSAyLCAyMDI2IGF0IDE6NTjigK9BTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBTYXQsIE1heSAwMiwgMjAyNiBhdCAw
MTo0NDozNEFNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBNYXkg
MSwgMjAyNiBhdCAxMDo1N+KAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
PiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gRnJpLCBNYXkgMDEsIDIwMjYgYXQg
MDY6NDk6NThBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gPiA+ID4gPiAxLiBUaGVy
ZSBpcyBubyBkZXRlcm1pbmlzdGljIGxhdGVuY3kgZm9yIEkvTyBjb21wbGV0aW9uLiBJdCBkZXBl
bmRzIG9uCj4gPiA+ID4gPiA+ID4gYm90aCB0aGUgaGFyZHdhcmUgYW5kIHRoZSBzb2Z0d2FyZSBz
dGFjayAoYmlvL3JlcXVlc3QgcXVldWVzIGFuZCB0aGUKPiA+ID4gPiA+ID4gPiBibG9jayBzY2hl
ZHVsZXIpLiBTb21ldGltZXMgdGhlIGxhdGVuY3kgaXMgc2hvcnQ7IGF0IG90aGVyIHRpbWVzIGl0
IGNhbgo+ID4gPiA+ID4gPiA+IGJlIHF1aXRlIGxvbmcuIEluIHN1Y2ggY2FzZXMsIGEgaGlnaC1w
cmlvcml0eSB0aHJlYWQgcGVyZm9ybWluZyBvcGVyYXRpb25zCj4gPiA+ID4gPiA+ID4gc3VjaCBh
cyBtcHJvdGVjdCwgdW5tYXAsIHByY3RsX3NldF92bWEsIG9yIG1hZHZpc2UgbWF5IGJlIGZvcmNl
ZCB0byB3YWl0Cj4gPiA+ID4gPiA+ID4gZm9yIGFuIHVucHJlZGljdGFibGUgYW1vdW50IG9mIHRp
bWUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEJ1dCBkb2VzIHRoYXQgYWN0dWFsbHkgaGFwcGVu
PyAgSSBmaW5kIGl0IGhhcmQgdG8gYmVsaWV2ZSB0aGF0IHRocmVhZCBBCj4gPiA+ID4gPiA+IHVu
bWFwcyBhIFZNQSB3aGlsZSB0aHJlYWQgQiBpcyBpbiB0aGUgbWlkZGxlIG9mIHRha2luZyBhIHBh
Z2UgZmF1bHQgaW4KPiA+ID4gPiA+ID4gdGhhdCBzYW1lIFZNQS4gIG1wcm90ZWN0KCkgYW5kIG1h
ZHZpc2UoKSBhcmUgbW9yZSBsaWtlbHkgdG8gaGFwcGVuLCBidXQKPiA+ID4gPiA+ID4gaXQgc3Rp
bGwgc2VlbXMgcmVhbGx5IHVubGlrZWx5IHRvIG1lLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEl0IGRv
ZXNu4oCZdCBoYXZlIHRvIGludm9sdmUgdW5tYXBwaW5nIG9yIGFwcGx5aW5nIG1wcm90ZWN0IHRv
Cj4gPiA+ID4gPiB0aGUgZW50aXJlIFZNQeKAlGp1c3QgYSBwb3J0aW9uIG9mIGl0IGlzIHN1ZmZp
Y2llbnQuCj4gPiA+ID4KPiA+ID4gPiBZZXMsIGJ1dCB0aGF0IHN0aWxsIGZhaWxzIHRvIGFuc3dl
ciAiZG9lcyB0aGlzIGFjdHVhbGx5IGhhcHBlbiIuICBIb3cgbXVjaAo+ID4gPiA+IHBlcmZvcm1h
bmNlIGlzIGFsbCB0aGlzIGNvbXBsZXhpdHkgaW4gdGhlIHBhZ2UgZmF1bHQgaGFuZGxlciBidXlp
bmcgdXM/Cj4gPiA+ID4gSWYgeW91IGRvbid0IGFuc3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVz
dCBnb2luZyB0byBnbyBpbiBhbmQgcmlwIGl0Cj4gPiA+ID4gYWxsIG91dC4KPiA+ID4gPgo+ID4g
Pgo+ID4gPiBIaSBNYXR0aGV3IChhbmQgTG9yZW56bywgSmFuLCBhbmQgYW55b25lIGVsc2Ugd2hv
IG1heSBiZQo+ID4gPiB3YWl0aW5nIGZvciBhbnN3ZXJzKSwKPiA+ID4KPiA+ID4gQXMgcHJvbWlz
ZWQgZHVyaW5nIExTRi9NTS9CUEYsIHdlIGNvbmR1Y3RlZCB0aG9yb3VnaAo+ID4gPiB0ZXN0aW5n
IG9uIEFuZHJvaWQgcGhvbmVzIHRvIGRldGVybWluZSB3aGV0aGVyIHBlcmZvcm1pbmcKPiA+ID4g
SS9PIGluIGBmaWxlbWFwX2ZhdWx0KClgIGNhbiBibG9jayBgdm1hX3N0YXJ0X3dyaXRlKClgLgo+
ID4gPiBJIHdhbnRlZCB0byBnaXZlIGEgcXVpY2sgdXBkYXRlIG9uIHRoaXMgcXVlc3Rpb24uCj4g
PiA+Cj4gPiA+IE5hbnpoZSBhdCBYaWFvbWkgY3JlYXRlZCB0cmFjaW5nIHNjcmlwdHMgYW5kIHJh
biB2YXJpb3VzCj4gPiA+IGFwcGxpY2F0aW9ucyBvbiBBbmRyb2lkIGRldmljZXMgd2l0aCBJL08g
cGVyZm9ybWVkIHVuZGVyCj4gPiA+IHRoZSBWTUEgbG9jayBpbiBgZmlsZW1hcF9mYXVsdCgpYC4g
V2UgZm91bmQgdGhhdDoKPiA+ID4KPiA+ID4gMS4gVGhlcmUgYXJlIHZlcnkgZmV3IGNhc2VzIHdo
ZXJlIHVubWFwKCkgaXMgYmxvY2tlZCBieQo+ID4gPiAgICBwYWdlIGZhdWx0cy4gSSBhc3N1bWUg
dGhpcyBpcyBkdWUgdG8gYnVnZ3kgdXNlciBjb2RlCj4gPiA+ICAgIG9yIHBvb3Igc3luY2hyb25p
emF0aW9uIGJldHdlZW4gcmVhZHMgYW5kIHVubWFwKCkuCj4gPiA+IFNvIEkgYXNzdW1lIGl0IGlz
IG5vdCBhIHByb2JsZW0uCj4gPiA+Cj4gPiA+IDIuIFdlIG9ic2VydmVkIG1hbnkgY2FzZXMgd2hl
cmUgYHZtYV9zdGFydF93cml0ZSgpYAo+ID4gPiAgICBpcyBibG9ja2VkIGJ5IHBhZ2UtZmF1bHQg
SS9PIGluIHNvbWUgYXBwbGljYXRpb25zLgo+ID4gPiAgICBUaGUgYmxvY2tpbmcgb2NjdXJzIGlu
IHRoZSBgZHVwX21tYXAoKWAgcGF0aCBkdXJpbmcKPiA+ID4gICAgZm9yaygpLgo+ID4gPgo+ID4g
PiBXaXRoIFN1cmVuJ3MgY29tbWl0IGZiNDljNDU1MzIzZmYgKCJmb3JrOiBsb2NrIFZNQXMgb2YK
PiA+ID4gdGhlIHBhcmVudCBwcm9jZXNzIHdoZW4gZm9ya2luZyIpLCB3ZSBub3cgYWx3YXlzIGhv
bGQKPiA+ID4gYHZtYV93cml0ZV9sb2NrKClgIGZvciBlYWNoIFZNQS4gTm90ZSB0aGF0IHRoZQo+
ID4gPiBgbW1hcF9sb2NrYCB3cml0ZSBsb2NrIGlzIGFsc28gaGVsZCwgd2hpY2ggY291bGQgbGVh
ZCB0bwo+ID4gPiBjaGFpbmVkIHdhaXRpbmcgaWYgcGFnZS1mYXVsdCBJL08gaXMgcGVyZm9ybWVk
IHdpdGhvdXQKPiA+ID4gcmVsZWFzaW5nIHRoZSBWTUEgbG9jay4KPiA+Cj4gPiBIbSBidXQgZGlk
IHlvdSBvYnNlcnZlIHRoaXMgJ2NoYWluZWQgd2FpdGluZyc/IEFuZCB3aGF0IHdlcmUgdGhlIGxh
dGVuY2llcz8KPgo+IFdlIGhhdmUgY2xlYXJseSBvYnNlcnZlZCB0aGF0IHRoZSBgZm9yaygpYCBv
cGVyYXRpb25zIG9mIG1hbnkKPiBwb3B1bGFyIEFuZHJvaWQgYXBwcywgc3VjaCBhcyBpUWl5aSwg
QmFpZHUgVGllYmEsIGFuZCAxMDA4NiwKPiBlbmQgdXAgd2FpdGluZyBvbiBwYWdlLWZhdWx0IChQ
RikgSS9PIHdoZW4gdGhlIFZNQSBsb2NrIGlzCj4gaGVsZCBkdXJpbmcgSS9PIG9wZXJhdGlvbnMu
IFRoaXMgaGFzIGFscmVhZHkgYmVjb21lIGEKPiBwcmFjdGljYWwgaXNzdWUuIEkgYWxzbyBiZWxp
ZXZlIHRoaXMgY2FuIGxlYWQgdG8gY2hhaW5lZAo+IHdhaXRpbmcsIHNpbmNlIHRoZSBnbG9iYWwg
YG1tYXBfbG9ja2AgYmxvY2tzIGFsbCB0aHJlYWRzIHRoYXQKPiBuZWVkIHRvIGFjcXVpcmUgaXQu
Cj4KPgo+ID4KPiA+ID4KPiA+ID4gTXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCBTdXJlbidzIGNvbW1p
dCBtYXkgYmUgb3ZlcnNob290aW5nLAo+ID4gPiBzbyBteSByb3VnaCBpZGVhIGlzIHRoYXQgd2Ug
bWlnaHQgd2FudCB0byBkbyBzb21ldGhpbmcgbGlrZQo+ID4gPiB0aGUgZm9sbG93aW5nICh3ZSBo
YXZlbid0IHRlc3RlZCBpdCB5ZXQgYW5kIGl0IG1pZ2h0IGJlCj4gPiA+IHdyb25nKToKPiA+Cj4g
PiBZZWFoIEknbSByZWFsbHkgbm90IHN1cmUgYWJvdXQgdGhhdC4KPiA+Cj4gPiBQcmlvciB0byB0
aGUgVk1BIGxvY2tzLCB0aGUgbW1hcCB3cml0ZSBsb2NrIHdvdWxkIGhhdmUgZ3VhcmFudGVlZCBu
byBjb25jdXJyZW50Cj4gPiBwYWdlIGZhdWx0cywgd2hpY2ggaXMgcmVhbGx5IHdoYXQgZmI0OWM0
NTUzMjNmZiBpcyBhYm91dC4KPiA+Cj4gPiBTbyBTdXJlbidzIHBhdGNoIHdhcyBlc3NlbnRpYWxs
eSByZXN0b3JpbmcgdGhlIF9leGlzdGluZ18gZm9ya2luZyBiZWhhdmlvdXIsIGFuZAo+ID4gbm93
IHlvdSdyZSBzYXlpbmcgJ2xldCdzIGNoYW5nZSB0aGUgZm9ya2luZyBiZWhhdmlvdXIgdGhhdCdz
IGJlZW4gbGlrZSB0aGF0IGZvcgo+ID4gZm9yZXZlcicuCj4KPgo+IEkgYW0gYWZyYWlkIG5vdC4g
QmVmb3JlIHdlIGludHJvZHVjZWQgdGhlIHBlci1WTUEgbG9jaywgd2UKPiB3ZXJlIG5vdCBwZXJm
b3JtaW5nIEkvTyB3aGlsZSBob2xkaW5nIGBtbWFwX2xvY2tgLiBBIHBhZ2UgZmF1bHQKPiB0aGF0
IG5lZWRlZCBJL08gd291bGQgZHJvcCB0aGUgYG1tYXBfbG9ja2AgcmVhZCBsb2NrIGFuZCBhbGxv
dwo+IGBmb3JrKClgIHRvIHByb2NlZWQuCj4KPiBOb3csIHlvdSBhcmUgc3VnZ2VzdGluZyBwZXJm
b3JtaW5nIEkvTyB3aGlsZSBob2xkaW5nIHRoZSBWTUEKPiBsb2NrLCB3aGljaCBjaGFuZ2VzIHRo
ZSByZXF1aXJlbWVudHMgYW5kIGludHJvZHVjZXMgdGhpcwo+IHByb2JsZW0uCj4KPiA+Cj4gPiBJ
IHRoaW5rIHlvdSB3b3VsZCBfcmVhbGx5XyBoYXZlIHRvIGJlIHN1cmUgdGhhdCdzIHNhZmUuIEFu
ZCBmb3JraW5nIGlzIGEgdmVyeQo+ID4gZGFuZ2Vyb3VzIHRpbWUgaW4gdGVybXMgb2YgY29tcGxl
eGl0eSBhbmQgc2Vuc2l0aXZpdHkgYW5kICd3ZWlyZCBzdHVmZicKPiA+IGhhcHBlbmluZyBzbyBJ
J2QgdHJlYWQgX3ZlcnlfIGNhcmVmdWxseSBoZXJlLgo+Cj4gWWVwLiBJIHRoaW5rIG15IG9yaWdp
bmFsIHByb3Bvc2FsIGRpZCBub3QgcmVxdWlyZSBhbnkgY2hhbmdlcwo+IHRvIGBmb3JrKClgLCBz
aW5jZSBpdCBzaW1wbHkgcHJlc2VydmVkIHRoZSBjdXJyZW50IGJlaGF2aW9yIG9mCj4gZHJvcHBp
bmcgdGhlIFZNQSBsb2NrIGJlZm9yZSBwZXJmb3JtaW5nIEkvTy4gSW4gdGhhdCBtb2RlbCwKPiBg
Zm9yaygpYCB3b3VsZCBub3QgZW5kIHVwIHdhaXRpbmcgb24gSS9PIGF0IGFsbC4KPgo+IFdoYXQg
eW91IGFyZSBzdWdnZXN0aW5nIG5vdyBhcHBlYXJzIHRvIGJlIHBlcmZvcm1pbmcgSS9PIHdoaWxl
Cj4gaG9sZGluZyB0aGUgVk1BIGxvY2ssIHdoaWNoIGluIHR1cm4gaW50cm9kdWNlcyB0aGUgbmVl
ZCB0bwo+IGNoYW5nZSBgZm9yaygpYC4KPgo+ID4KPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL21t
L21tYXAuYyBiL21tL21tYXAuYwo+ID4gPiBpbmRleCAyMzExYWU3YzJmZjQuLjVkZGFmMjk3ZjMx
YSAxMDA2NDQKPiA+ID4gLS0tIGEvbW0vbW1hcC5jCj4gPiA+ICsrKyBiL21tL21tYXAuYwo+ID4g
PiBAQCAtMTc2Miw3ICsxNzYyLDEzIEBAIF9fbGF0ZW50X2VudHJvcHkgaW50IGR1cF9tbWFwKHN0
cnVjdCBtbV9zdHJ1Y3QKPiA+ID4gKm1tLCBzdHJ1Y3QgbW1fc3RydWN0ICpvbGRtbSkKPiA+ID4g
ICAgICAgICBmb3JfZWFjaF92bWEodm1pLCBtcG50KSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZmlsZSAqZmlsZTsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAgIHJldHZhbCA9IHZt
YV9zdGFydF93cml0ZV9raWxsYWJsZShtcG50KTsKPiA+ID4gKyAgICAgICAgICAgICAgIC8qCj4g
PiA+ICsgICAgICAgICAgICAgICAgKiBGb3IgYW5vbnltb3VzIG9yIHdyaXRhYmxlIHByaXZhdGUg
Vk1BcywgcHJldmVudAo+ID4gPiArICAgICAgICAgICAgICAgICogY29uY3VycmVudCBDb1cgZmF1
bHRzLgo+ID4gPiArICAgICAgICAgICAgICAgICovCj4gPgo+ID4gVG8gbml0IHBpY2sgSSB0aGlu
ayB0aGUgY29tbWVudCdzIGNvbmZ1c2luZyBidXQgYWxzbyB0ZWxscyB5b3UgeW91IGRvbid0IG5l
ZWQgdG8KPiA+IHNwZWNpZmljIGFub24gY2hlY2sgLSB3cml0YWJsZSBwcml2YXRlIGlzIHN1ZmZp
Y2llbnQuIEFuZCBpdCdzIG5vdCByZWFsbHkganVzdAo+ID4gQ29XIHRoYXQncyB0aGUgaXNzdWUs
IGl0J3MgYW5vbl92bWEgcG9wdWxhdGlvbiBfYXQgYWxsXyBhcyB3ZWxsIGFzIENvVy4KPiA+Cj4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoIW1wbnQtPnZtX2ZpbGUgfHwgKCEobXBudC0+dm1fZmxh
Z3MgJiBWTV9TSEFSRUQpICYmCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAobXBudC0+dm1fZmxhZ3MgJiBWTV9XUklURSkpKQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR2YWwgPSB2bWFfc3RhcnRfd3JpdGVfa2lsbGFibGUobXBudCk7Cj4gPgo+
ID4gSSB0aGluayB0aGlzIGhhcyB0byBiZSBWTV9NQVlXUklURSwgYmVjYXVzZSBzb21lYm9keSBj
b3VsZCBvdGhlcndpc2UgbXByb3RlY3QoKQo+ID4gaXQgUi9XLgo+ID4KPiA+IEkgYWxzbyBkb24n
dCB1bmRlcnN0YW5kIHdoeSAhbXBudC0+dm1fZmlsZSBmb3IgYSByZWFkLW9ubHkgYW5vbiBtYXBw
aW5nIChtb3JlCj4gPiBsaWtlbHkgUFJPVF9OT05FKSBpcyBoZXJlLCBqdXN0IGRvIHRoZSBzZWNv
bmQgY2hlY2s/Cj4gPgo+ID4gKEFsc28gcGxlYXNlIHVzZSB0aGUgbmV3IGludGVyZmFjZSwgc28g
IXZtYV90ZXN0KG1wbnQsIFZNQV9TSEFSRURfQklUKSAmJgo+ID4gdm1hX3Rlc3QobXBudCwgVk1B
X01BWVdSSVRFX0JJVCkpCj4KPiBZZXAsIEkgY2FuIGRlZmluaXRlbHkgcmVmaW5lIHRoZSBjaGVj
ayBmdXJ0aGVyLiBCdXQgYmVmb3JlCj4gZG9pbmcgdGhhdCwgSSdkIGZpcnN0IGxpa2UgdG8gY29u
ZmlybSB0aGF0IHdlIGFyZSBhbGlnbmVkIG9uCj4gdGhlIGRpcmVjdGlvbi4KPgo+IElmIHlvdSBz
dGlsbCBpbnRlbmQgdG8gaG9sZCB0aGUgVk1BIGxvY2sgd2hpbGUgcGVyZm9ybWluZyBJL08sCj4g
dGhlbiBJIHRoaW5rIHdlIHNob3VsZCBmaXggYGZvcmsoKWAgdG8gYXZvaWQgdGFraW5nCj4gYHZt
YV9zdGFydF93cml0ZSgpYC4KPgo+ID4KPiA+ID4gICAgICAgICAgICAgICAgIGlmIChyZXR2YWwg
PCAwKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGxvb3Bfb3V0Owo+ID4gPiAg
ICAgICAgICAgICAgICAgaWYgKG1wbnQtPnZtX2ZsYWdzICYgVk1fRE9OVENPUFkpIHsKPiA+ID4K
PiA+ID4gQmFzZWQgb24gdGhlIGFib3ZlLCB3ZSBtYXkgd2FudCB0byByZS1jaGVjayB3aGV0aGVy
IGZvcmsoKQo+ID4gPiBjYW4gYmUgYmxvY2tlZCBieSBwYWdlIGZhdWx0cy4gQXQgdGhlIHNhbWUg
dGltZSwgaWYgU3VyZW4sCj4gPiA+IHlvdSwgb3IgYW55b25lIGVsc2UgaGFzIGFueSBjb21tZW50
cywgcGxlYXNlIGZlZWwgZnJlZSB0bwo+ID4gPiBzaGFyZSB0aGVtLgo+ID4gPgo+ID4gPiBCZXN0
IFJlZ2FyZHMKPiA+ID4gQmFycnkKPiA+Cj4gPiBUZWNobmljYWwgY29tbWVudGFyeSBhYm92ZSBp
cyBzb3J0IG9mICdqdXN0IGNvcycgOikgYmVjYXVzZSBJIHJlYWxseSBxdWVzdGlvbgo+ID4gZG9p
bmcgdGhpcyBob25lc3RseS4KPgo+IEkgdGhpbmsgd2UgZWl0aGVyIG5lZWQgdG8gZml4IGBmb3Jr
KClgLCBvciBrZWVwIHRoZSBjdXJyZW50Cj4gYmVoYXZpb3Igb2YgZHJvcHBpbmcgdGhlIFZNQSBs
b2NrIGJlZm9yZSBwZXJmb3JtaW5nIEkvTy4KCkkgc2VlLiBTbywgdGhpcyBwcm9ibGVtIGFyaXNl
cyBmcm9tIHRoZSBmYWN0IHRoYXQgd2UgYXJlIGNoYW5naW5nIHRoZQpwYWdlZmF1bHRzIHJlcXVp
cmluZyBJL08gb3BlcmF0aW9uIHRvIGhvbGQgVk1BIGxvY2suLi4KQW5kIHlvdSB3YW50IHRvIGxv
Y2sgVk1BIG9uIGZvcmsgb25seSBpZiB2bWFfaXNfYW5vbnltb3VzKHZtYSkgfHwKaXNfY293X21h
cHBpbmcodm1hLT52bV9mbGFncykuIFNvLCB3ZSB3aWxsIGJlIGJsb2NraW5nIHBhZ2UgZmF1bHRz
IGZvcgphbm9ueW1vdXMgYW5kIENPVyBWTUFzIG9ubHkgd2hpbGUgaG9sZGluZyBtbWFwX3dyaXRl
X2xvY2ssIHByZXZlbnRpbmcKYW55IFZNQSBtb2RpZmljYXRpb24uIE9uIHRoZSBzdXJmYWNlLCB0
aGF0IGxvb2tzIG9rIHRvIG1lIGJ1dCBJIG1pZ2h0CmJlIG1pc3Npbmcgc29tZSBjb3JuZXIgY2Fz
ZXMuIElmIG5vYm9keSBzZWVzIGFueSBvYnZpb3VzIGlzc3VlcywgSQp0aGluayBpdCdzIHdvcnRo
IGEgdHJ5LgoKCgoKPgo+ID4KPiA+IEknZCBhbHNvIGxpa2UgdG8gZ2V0IFN1cmVuJ3MgaW5wdXQs
IGhvd2V2ZXIuCj4KPiBZZXMuIG9mIGNvdXJzZS4KPgo+ID4KPiA+IFRoYW5rcywgTG9yZW56bwo+
Cj4gQmVzdCBSZWdhcmRzCj4gQmFycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
