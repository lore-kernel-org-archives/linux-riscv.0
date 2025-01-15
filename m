Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A1C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 19:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JngcLCgtcd+PL5YTF+n7fsLlJS54BCpVuUyhegFJ8IA=; b=UpbBpWdaNQfaxv
	erHlHocXtCqntBNGwtd1imQdokrmUYI0VmQ9kQ1MP3sJShwHx/vYnl25IL0lbGN8yBmWzRQoU5f1N
	ncaOqriicse1NFQYaE7rklOf5med3b3Ko9Rai6a1czFVVcmMQZTiUHz/t4uzx+5C9EkTDJqhnL+Ux
	UfITcBCA4No3a2FFs8wYxas+6vTWkRQ9D8NvS+gSqbW2rDogj7valBqk7elCs9j1raTsJPwdXGwtH
	PbQhpNhPjPYldYofh11dJ6hp4DTq88Yrkm3VO+eeXszMvqCgNAjHD7lvXsUG3j74W9jTf9Hli7Cq9
	gR/w7gotF4L3TWdTlrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8w1-0000000Ct7h-1R7Q;
	Wed, 15 Jan 2025 19:20:13 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8vz-0000000Ct6m-0fA6
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 19:20:12 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6d8e8cb8605so1353346d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 11:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736968810; x=1737573610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxOLisM/r2vqci17iimcnJ3+oT6PlH7eXAcAxS9wH8I=;
        b=ZSkP7TONPI78FHQ7O/ANtvsi2QB/v2Ci3hscsWTwqa5urnYnyRK9Ahku7lTlG82zzO
         ovMGQ1nXVCXv24+Mrx8xcMjOFF/qv00bDt40f5iHknUaQQ4Mwa/Ic1EdeLx/nlQDUX7W
         7/uRFufhzeqaq1nzdNzmMP3INmDjneRP/kRMW5aF3sdg3iR796bLd/HDG/mWXxPi0K2O
         n8CNCg7xGlaIPTkdeXsMxCXt/NpYo8S/kZYoObb1FAHSq67jMx5M0hssRHQEwHJIYaLj
         UAmLUMJdqMl1fsozhoJczROfs0xzYWyn076UTqNTqLzNkyzaSRZ2q/k+t8eDm2oF3RCp
         xAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968810; x=1737573610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxOLisM/r2vqci17iimcnJ3+oT6PlH7eXAcAxS9wH8I=;
        b=Kvn92YG244ZcRrl6Pz/VXqlDiXcMoXr75OwPCIOgnIoypLB1leqT3X0OoFon8MPetP
         DZZ/8gaPD4OXzf1XTx70pHv2cemhtomrjMoU3J2uO9OkirtQZEDoaBU/6c3rAgcSmVM6
         HGIGp0QiAhWGwEuSK2mECAbfADYTmv9j25lIjPWQg4dDq0t7+CUgE5OckhblUqvRiSew
         mrfZHSPZJpvB6VpKSEmkgZx2FXV2RyOGfIGN8PqJ2gXb70SlZNoBQB964CqGVZYFxkyF
         fLkAz+yGGsgxwKvZbpw6CcMWfORR0eMIWznybqlaeLhGRGFUe8nG3Z5ShiW11BkpCcVh
         ZTpQ==
X-Gm-Message-State: AOJu0Yx5ZFdMM4RYRvB1/UMGuQ9dRiG3omNrUEj73hjLywJH/wP+/LYb
	FtnCsbB0zJsXN5+6Jt3J5OMfZl4lOtKyjNBjOnSPHi+zUbKZ1Dja8qnV5sTOkm+vvxRUq9nsdt3
	7krnJKm9NBrqYy2vDpi1HUt2NC08=
X-Gm-Gg: ASbGncvMpn6H/zc5qLBrz5aLM6/MFnSARHpGD3yTC+VsqpGC6zXOsZKAAXwMFTZiBi9
	VWEPGIgfOeXJqmHWgUvOne9jjQ4Vh6PjeUA6LKQ==
X-Google-Smtp-Source: AGHT+IGcOD+cwuWLZQkHOERr/i/5IgCk1JWHnGSSNWX5DKVOVQdU9aSL/egf0MIChEkPIlmVmG4Q/k0vSx6KgLYio+A=
X-Received: by 2002:a05:6214:3c8c:b0:6df:8c25:2c81 with SMTP id
 6a1803df08f44-6df9b1d0b5emr530159576d6.5.1736968810243; Wed, 15 Jan 2025
 11:20:10 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop> <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
In-Reply-To: <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Wed, 15 Jan 2025 20:20:00 +0100
X-Gm-Features: AbW1kvYPm3yU6yFTdo5RO9-y77hSL0M_d4qB1E2QaVvMAqTHQihGuVHlucVKfps
Message-ID: <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112011_202278_B0F268E1 
X-CRM114-Status: GOOD (  28.03  )
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
Cc: jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gU3RlZmFubywgT2xla3NpaQoKT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgNTozMOKAr1BN
IE9sZWtzaWkgS3Vyb2Noa28KPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToKPgo+
IEhpIFN0ZWZhbm8sCj4KPiBPbiAxLzE1LzI1IDE6MDEgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPgo+ICtPbGVrc2lpCj4KPiBPbiBUdWUsIDE0IEphbiAyMDI1LCBNaWxhbiBEam9raWMg
d3JvdGU6Cj4KPiBGcm9tOiBTbGF2aXNhIFBldHJvdmljIDxTbGF2aXNhLlBldHJvdmljQHJ0LXJr
LmNvbT4KPgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBpbml0aWFsIHN1cHBvcnQgZm9yIHJ1bm5p
bmcgUklTQy1WIGFzIGEgWGVuIGd1ZXN0Lgo+IEl0IHByb3ZpZGVzIHRoZSBuZWNlc3NhcnkgaW5m
cmFzdHJ1Y3R1cmUgYW5kIHN0dWJzIGZvciBYZW4tc3BlY2lmaWMKPiBvcGVyYXRpb25zLiBLZXkg
Y2hhbmdlcyBpbmNsdWRlOgo+Cj4gLSBNb2RpZmljYXRpb25zIHRvIHRoZSBSSVNDLVYga2VybmVs
IHRvIGludGVncmF0ZSBYZW4tc3BlY2lmaWMgaHlwZXJjYWxscwo+ICAgYW5kIGludGVyZmFjZXMs
IHdpdGggZnVuY3Rpb24gaW1wbGVtZW50YXRpb25zIHN0dWJiZWQgZm9yIGZ1dHVyZSB3b3JrLgo+
IC0gSW50cm9kdWN0aW9uIG9mIFhlbi1zcGVjaWZpYyBoZWFkZXJzIGZvciBSSVNDLVYsIGluY2x1
ZGluZyBldmVudAo+ICAgaGFuZGxpbmcsIGh5cGVydmlzb3IgaW50ZXJhY3Rpb24sIGFuZCBwYWdl
IG1hbmFnZW1lbnQuIEZ1bmN0aW9ucyBhcmUKPiAgIGRlZmluZWQgYnV0IG5vdCB5ZXQgaW1wbGVt
ZW50ZWQuCj4gLSBTdHViIGltcGxlbWVudGF0aW9ucyBmb3IgbWVtb3J5IG1hbmFnZW1lbnQsIGdy
YW50IHRhYmxlcywgYW5kIGNvbnRleHQKPiAgIHN3aXRjaGluZyBpbiB0aGUgWGVuIGVudmlyb25t
ZW50LCBhbGxvd2luZyBmdXJ0aGVyIGRldmVsb3BtZW50IGFuZAo+ICAgaW50ZWdyYXRpb24uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWxhbiBEam9raWMgPE1pbGFuLkRqb2tpY0BydC1yay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogU2xhdmlzYSBQZXRyb3ZpYyA8U2xhdmlzYS5QZXRyb3ZpY0BydC1yay5j
b20+Cj4KPiBIaSBNaWxhbiwgU2xhdmlzYSwKPgo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlv
dXIgY29udHJpYnV0aW9uISBXaGljaCBYZW4gdHJlZSBhcmUgeW91IHVzaW5nCj4gZm9yIGRldmVs
b3BtZW50Pwo+Cj4gVGhleSBhcmUgdXNpbmcgWzFdIGFuZCBoYXZlIHNlcGFyYXRlIGJyYW5jaGVz
IG9uIHRvcCBvZiBsYXRlc3QuIFNvIHdlIGFyZSBpbgo+IHN5bmMuIEFsc28sIGlmIHlvdSBhcmUg
aW50ZXJlc3RlZCB3ZSBoYXZlIGNyZWF0ZWQgYSB0YXNrL2VwaWNzIGZvciB0aGlzIGZlYXR1cmUg
aW4KPiBbMV0gc28geW91IGNvdWxkIGFsc28gY2hlY2sgdGhlcmUgc29tZSBkZXRhaWxzOgo+IDEu
IGh0dHBzOi8vZ2l0bGFiLmNvbS9ncm91cHMveGVuLXByb2plY3QvcGVvcGxlL29sa3VyLy0vZXBp
Y3MvNQo+IDIuIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvb2xrdXIveGVu
Ly0vaXNzdWVzLzEyCj4KPiAgSSBhbSBhc2tpbmcgYmVjYXVzZSBSSVNDLVYgc3VwcG9ydCBpbiBY
ZW4gaXMgc3RpbGwgaW4KPiB0aGUgcHJvY2VzcyBvZiBiZWluZyB1cHN0cmVhbWVkLCBhbmQgWzFd
IGlzIHRoZSB0cmVlIHRoYXQgY29uc29saWRhdGVzCj4gYWxsIHBhdGNoZXMgY3VycmVudGx5IG9u
IHRoZSB0by1iZS11cHN0cmVhbWVkIGxpc3QuCj4KPiBXaGlsZSB0aGUgc3BlY2lmaWMgWGVuIHRy
ZWUgeW91IGFyZSB1c2luZyBpcyBub3QgcGFydGljdWxhcmx5IGltcG9ydGFudAo+IGF0IHRoaXMg
c3RhZ2UsIGFuZCB1c2luZyBbMV0gaXMgbm90IGEgcmVxdWlyZW1lbnQsIEkgYW0gYXNraW5nIGJl
Y2F1c2UKPiBpdCBpcyBlc3NlbnRpYWwgdG8gYWxpZ24gb24gdGhlIGh5cGVydmlzb3IgQUJJLCBl
c3BlY2lhbGx5IHJlZ2FyZGluZyBhbnkKPiBkZXRhaWxzIHRoYXQgaGF2ZSBub3QgeWV0IGJlZW4g
dXBzdHJlYW1lZC4gU3BlY2lmaWNhbGx5LCBpcyB0aGVyZQo+IGFueXRoaW5nIGluIHRoaXMgcGF0
Y2ggc2VyaWVzIHRoYXQgcmVsaWVzIG9uIGZlYXR1cmVzIG5vdCB5ZXQgdXBzdHJlYW0KPiBpbiBY
ZW4/Cj4KPiBUaGVyZSBhcmUgZmV3IGZlYXR1cmVzIGJ1dCBzb21lIHRoaW5ncyB3aGljaCBhcmUg
UnQtVGsncyBicmFuY2ggaW4gWzFdIGNvdWxkIGdvCj4gd2l0aG91dCB3YWl0aW5nIGZvciB0aGVz
ZSBmZWF0dXJlcyB0byBiZSB1cHN0cmVhbWVkLgo+Cj4gVGhhbmtzLgo+Cj4gfiBPbGVrc2lpCj4K
PiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9vbGt1ci94ZW4vLS90
cmVlL2xhdGVzdD9yZWZfdHlwZT1oZWFkcwoKQXMgT2xla3NpaSBhbHJlYWR5IGV4cGxhaW5lZCwg
d2UgYXJlIHdvcmtpbmcgaW4gc3luYyB3aXRoIGhpcyBsYXRlc3QKYnJhbmNoIHdoZXJlIG1vc3Qg
b2YgdGhlIHJpc2MgcG9ydCBpcyBkb25lLgpJIHdvdWxkIGp1c3QgYWRkIHRoYXQgdGhpcyBwYXRj
aCBpbnRyb2R1Y2VzIGtlcm5lbCByaXNjLXYgaHlwZXJjYWxsCnN1cHBvcnQgb24gd2hpY2ggb25s
eSBvdXIgYnJhbmNoIG9uIHhlbiB0cmVlIGRlcGVuZHMgb24uIFRoZXJlZm9yZSwgaXQKd29uJ3Qg
ZGlzcnVwdCBhbnkgZnVuY3Rpb25hbGl0eSB3aXRoIGN1cnJlbnQgdXBzdHJlYW0gWGVuLCBpdCB3
aWxsCmp1c3QgaW50cm9kdWNlIGtlcm5lbCBmdW5jdGlvbmFsaXR5IHdoaWNoIGlzIG5vdCB1c2Vk
IGZyb20gWGVuIHNpZGUKdW50aWwgb3VyIGJyYW5jaCBpcyBtZXJnZWQgdXBzdHJlYW0uCgpCZXN0
IHJlZ2FyZHMsCk1pbGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
