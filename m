Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEFED46C1D
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 01:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kld7RZQXakaG1aG9zlRWmJiCVAuN/HK0jszX7+1Mcvc=; b=rGXQebbQeawk1X
	yWVKWCN4tl/YZhjMoYa2t5mk/4+Rbvk24HFT0oUj/XwZI8udLZGlF7GiEbNS30EvsolRB+PpWoqxt
	ukDjrR2+zRYvU187u8dL8VnrwhDh0dBo9pUdrogt9DccqzFqOsO/Vn6u0KIIiGpc+jGOAePONKhWj
	PSxzuCrFADrkdQtgMbXkFUPA99B8KASk4DE5ygg2RF4KYmvQvIrZZ1GH+Y78T/HVZi0nTKmHIWvqr
	c199TjLa7mGhfF4J3frCilNIcHnjuC6p48zoEYYvtP4Iic2gT6ET5IsUcXCU9Lcj7F2IoQWWbhR2H
	Dh3t6grLkPyespl3yMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzme-00000002Bkg-0SOO;
	Sat, 31 Jan 2026 01:28:20 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzmb-00000002BkL-22qS
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 01:28:18 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-66307e10d1dso1373074eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 17:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769822895; cv=none;
        d=google.com; s=arc-20240605;
        b=DMAn8zxtvtf3K5NUA6IxwXyQrojJg5Yk3ZP/MmnVLB49mXKcCsgm/7yXRTMuMPf6Zs
         BH6UpqF3gNaDpDBvETyRFdxZNKyfWoH6JvcTKdE9+gUf41aJJftsH9F2jpPatQcBdcWl
         5Wj6Hp8E5L7f586ppUpFxTcf/fczk2ZGl7cccbzXr6r1kR2HQgab9te4l4bQkTYZ7/+7
         WnJO/61AlT0VoIFJ04RaW66+qsXmiMSRGazgQZEBG0/Vk1PjYTByUPevhsaM/pPX41Bj
         Dew2xYXh7AnpewTBQvXwYHVznXPRxutVMEnxWx1Bby315vL7cM+5LTJ38BTAk0urRDkz
         fNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAdK8PSPpbAG4ZF3DDf9iwcQO/z7KVY0C1nZwOLHMfE=;
        fh=6XGEB3ruxEchUrtmLaZedanyQmWMqcNZTsaMd+2PDao=;
        b=AfwEytrVmid1z+bBykOJzaI+MAlfEzDIvAnfNjrodliobFuwykOBczDjBfDr0g1dHm
         BpO1yVwmzrSMyTTUDc7PcbSIl4CDqZvC6W4TT6E6HZ+anHbwSeLJpYnh7jKKE6ws0ef1
         yj7lN431MEpMgor6RxG9Zi2nzaFVIWf2RxDQCUjfOSxxrPtBVZjkrP5V/pt3Ag/EGk9o
         WbXNGbJUxl1iVEhjuf0OCbrsvlUHGNp9fuc51MCCsy5jH4tcUyGNfRGzm21u/4g6h7lk
         i0qcrQnzLMGywxWLGypdWpulYBFJQEAEVWxv/UOzz22DLx+nsGCzGsKfHLt5y/jLop9S
         a15g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1769822895; x=1770427695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAdK8PSPpbAG4ZF3DDf9iwcQO/z7KVY0C1nZwOLHMfE=;
        b=Dw+/hYj2MfV+SyOwqPIkRuAFZgdzeJ2LS7fR0LVLLyQciTe/LbKwFHMqzP78uPptuS
         nhAOkpqgQ6x5Q7WhoHY/MytoYKUtSaaxggiosx7gNLcxQMz7ja6VKIIBFd/dYhs05OST
         rReMbsQR+MhPrOJ5gX3ZO+HOe1oJ2/U4f5BvkvukuQ1cKOwEnlfTc0AcW/M+7YgsZJUD
         93jLI0R6r1vYIJHFdXO66KqubgOA0KmhVU0R4pxJXsotcVdBZpFM4u85og0oELL8XnmI
         VqFkREgcK1FdLizEIwzLZGTfIQ2GIx8RZBbVAj08wfCn2OXGAhY0IVQFSXt+3oqgvmMa
         DnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769822895; x=1770427695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hAdK8PSPpbAG4ZF3DDf9iwcQO/z7KVY0C1nZwOLHMfE=;
        b=dTFED/O3Erl7Y/bFaPxeEjWj+5H8bEUBKQfLmk+xOdY80pPZEdgKrCJy6+beHePU6W
         5MREPfHYifOWYf/LoGSyLcV/ywx9AotboryWoI9ILFublQTmtoHcs68XqZs9GlOkLZVm
         HeuUGI+OhED/0S7fjtX47TO4Xm2iQKmqhAI/uOeGmoFjs1G14nai+XRd8pYEhMe1ZCLf
         bg+VenWExjdENKQpjukmEsQ5cUTqNGHZDi2WGeRUHUUaN1/TDlP3SZlP8F4ouQ8gG5B4
         hHj1VIo8gpsU6JAWPx3c4URcsGtwAY8l1/wRG/SMpCAKrTymuexO2GnZSn4W+eBgh4Nj
         6J6w==
X-Forwarded-Encrypted: i=1; AJvYcCWz1Z2lrw5RDT+zDkUleteVBr1eNC8kQ7RgqJAbMVejd4uB2/2q7T6THyLvh3gia0ThpbDYA6MhkwtnPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8JhCCNyLS+o170gP5z3E+3CGVD36PSDhrV0rwIy7F838nA0PS
	LO3kvP40b6n/+gx2aQC9ZwdsuFRLK8GGJKkDBpNlkeJkfzGhfxDSU41iKNlq4f8VOEBjzn9DL8G
	wDqDaotiWv91uyUx5CQXimRcqAOwgYuTVeZtPg8Ff7g==
X-Gm-Gg: AZuq6aKFqscQcpzYDhdccz+T73Mvvg0+uAnD1fY2h9yWqbyYI1m49zBPE80cRr6zB51
	OWBkppaypPyIyTRVxQ5f89vpjT/vLS7TOwQ8k447Q21vCRBNRPraCCBj9Mc1OibhCKyqDk1oyU0
	lHTF5fYQetYzS3fYAZM90PvNt/P9Wxo5bzLvhE4h2ymrInb86V8AQPyrCdIgeN7WGBGkUgpExn5
	sQqxRKG3qiaIVIwS4O60t21XlGCInwNnoDCrsqDdTLf0mBoA7nD7+dHR/hALNU2LTCAmqPckQjs
	0sjhqA==
X-Received: by 2002:a05:6820:22a9:b0:65b:257b:a898 with SMTP id
 006d021491bc7-6630f0507ffmr2047585eaf.29.1769822894013; Fri, 30 Jan 2026
 17:28:14 -0800 (PST)
MIME-Version: 1.0
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <72olk767l4goaqsrkyelhtnzg33nxbtwnammy4asnqxukbolnh@gwypmg6n5t3e>
 <20260129004640.GB1641016@ziepe.ca> <63c38161-762f-bff5-0b9c-0148140c695b@kernel.org>
In-Reply-To: <63c38161-762f-bff5-0b9c-0148140c695b@kernel.org>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Fri, 30 Jan 2026 17:28:03 -0800
X-Gm-Features: AZwV_Qj0tZjKAecspcSVxodkCX0io_Vn0UvzOmM88WNtFjCfrWhK6JNivTo3BO4
Message-ID: <CAH2o1u4_bieYiNUwCvhheKeRg6wvjH3Y4hZY9AGLcMbH5A-rDQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
To: tjeznach@fb.com, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Joerg Roedel <joro@8bytes.org>, Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>, 
	patches@lists.linux.dev, xieyongji@bytedance.com, 
	Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_172817_602433_25047BE5 
X-CRM114-Status: GOOD (  16.06  )
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

SGVsbG8gZXZlcnlvbmUsCgpTb3JyeSBmb3IgdGhlIHZlcnkgbG9uZyByYWRpbyBzaWxlbmNlLiBJ
J20gYmFjayBvbmxpbmUuIEknbGwgdXBkYXRlIG15CmVtYWlsIGluIHRoZSBNQUlOVEFJTkVSUyBm
aWxlIHNvb24sIGZvciBub3cgYWRkaW5nIG15IG5ldyBhZGRyZXNzIHRvCnRoZSByZWNpcGllbnRz
LgoKVGhhbmtzIEphc29uIGZvciB0aGlzIGNoYW5nZSwgSSd2ZSBsb29rZWQgYXQgdGhlIHYxLCBs
b29rcyBnb29kLiBJdApwYXNzZWQgbXkgaW5pdGlhbCB0ZXN0aW5nIGF0IHRoZSB0aW1lLiBVbmZv
cnR1bmF0ZWx5IEkgaGFkIHRvIGhvbGQgb2ZmCm9uIHRlc3RpbmcgZm9yIGEgd2hpbGUuLi4KCkkn
dmUgcmV2aXZlZCBSSVNDLVYgdGVzdCBmbG93cyBiYXNlZCBvbiB2Ni4xOS1yYzcgKyB0aGlzIHBh
dGNoc2V0IGFuZApoaXQgdHJhbnNsYXRpb24gZmFpbHVyZXMgb24gRE1BcyBmcm9tL3RvIE5WTWUg
U1NELiBIb3BlZnVsbHkKdW5yZWxhdGVkLCBzdGlsbCBpbnZlc3RpZ2F0aW5nLgoKQmVzdCwKLSBU
b21hc3oKCgpPbiBGcmksIEphbiAzMCwgMjAyNiBhdCAzOjE04oCvUE0gUGF1bCBXYWxtc2xleSA8
cGp3QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyOCBKYW4gMjAyNiwgSmFzb24gR3Vu
dGhvcnBlIHdyb3RlOgo+Cj4gPiBPbiBUaHUsIEphbiAyMiwgMjAyNiBhdCAwODo1NjoxMkFNICsw
MTAwLCBKb2VyZyBSb2VkZWwgd3JvdGU6Cj4gPiA+IFRvbWFzeiwKPiA+ID4KPiA+ID4gT24gVHVl
LCBKYW4gMDYsIDIwMjYgYXQgMTE6MDY6NDRBTSAtMDQwMCwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Ogo+ID4gPiA+IEphc29uIEd1bnRob3JwZSAoNSk6Cj4gPiA+ID4gICBpb21tdXB0OiBBZGQgdGhl
IFJJU0MtViBwYWdlIHRhYmxlIGZvcm1hdAo+ID4gPiA+ICAgaW9tbXUvcmlzY3Y6IERpc2FibGUg
U0FERQo+ID4gPiA+ICAgaW9tbXUvcmlzY3Y6IFVzZSB0aGUgZ2VuZXJpYyBpb21tdSBwYWdlIHRh
YmxlCj4gPiA+ID4gICBpb21tdS9yaXNjdjogRW5hYmxlIFNWTkFQT1Qgc3VwcG9ydCBmb3IgY29u
dGlndW91cyBwdGVzCj4gPiA+ID4gICBpb21tdS9yaXNjdjogQWxsb3cgUklTQ19WSU9NTVUgdG8g
Q09NUElMRV9URVNUCj4gPiA+Cj4gPiA+IEFueSBvcGluaW9uIG9uIHRoYXQgc2VyaWVzPwo+ID4K
PiA+IExldCdzIHRha2UgaXQgaWYgd2UgZG9uJ3QgaGVhciBmcm9tIFRvbWFzeiB0aGlzIHdlZWs/
IEl0IGJyaW5ncwo+ID4gdGhlIGNvbnRpZ3VvdXMgcGFnZSBmZWF0dXJlIHBlb3BsZSB3YW50ZWQg
YW5kIG5vdyB0aGF0IGl0IGlzIHRlc3RlZAo+ID4gSSdtIG5vdCBlc3BlY2lhbGx5IHdvcnJpZWQg
YWJvdXQgaXQuCj4KPiBJbiB0aGUgZXZlbnQgdGhhdCB5b3UgZG9uJ3QgaGVhciBmcm9tIFRvbWFz
ejoKPgo+IEFja2VkLWJ5OiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4gIyBhcmNoL3Jp
c2N2Cj4KPgo+IC0gUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
