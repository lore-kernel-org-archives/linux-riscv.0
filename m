Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3437AD5E14C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXhbYah9Z3o7ge23VB8rP8qwed34eXD/BjTTVCzgT/s=; b=qylZ5D5D547dK6
	eaCV7woIQSGfIAO4GLUYv5orS/yiTKRXeqf6zo97uLy4bgkQPLozmxBCd5CfgfVSJMxl8vwKCz/OM
	UBaQRvpS3csKAdfwmGRkW9BMMMOy0LCcO+xNR0l53DTrc+hFi4aNtyTYC67lwJRI1uNxFv2/DdshZ
	TVqrcx1D4YFGwpZ9z46W3epe5+7GSYkz8g5bvYEuP9tatomfEPnB30x1KLemvvSXtogBPcHvbio4E
	JgVpodmRtEapBV4oss9KhXhFQzXWG/Ha+czIV1i6stNamfW9xh2GGwEF1VrznNvWgaoI5RQM4D/8D
	2r6iBsZOGUHhlESbvJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUw7-00000005Eog-3wuc;
	Tue, 16 Dec 2025 13:17:55 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUw3-00000005EoE-0vPT
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:17:54 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-657509d761dso2697260eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765891070; x=1766495870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5Nc5kSjeLOYF1kQP3EhPUJ3irJVYIWAj/CpkVkXlqs=;
        b=m+o7zPJ6OyAYkoHYFN0Y7p7y2T5+x7DiZxELnnEDXMGEpzr+q37KWNrPegilQGZQdP
         GNleQxbjopQHKO9MEzCvzyLys6P1UUxlXwW6ZXi1bPSH4qj2I75vGMrmeboAhf2JWeWF
         8tx5xu61REjXdlwnviJBGXXTz58QrbfpDIBDhnAi7/QOPZxzJ9IYR/zh+/dqag3hYOUE
         QW4MkEY/xKJEtxQRRjewEXHriFRNgrgizgN4soJhJhTQQ5O1mGJ9AhOCu2aaCecR4omD
         F1IKoAFNwVHS/6X61ZFAhVQmN/dSlXE+irYnKNC24jrne9+h6J6lG2PtnxXNHjT2EIAr
         1PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891070; x=1766495870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M5Nc5kSjeLOYF1kQP3EhPUJ3irJVYIWAj/CpkVkXlqs=;
        b=SET9HptaWlwOBVvN//spbwUMqf6qntd49IjJ6130Zo+2qoJ1o68gNqngtnWvazQzda
         J2s35bjQB1+xksyP7eJNOpybBfvJwPs/wkblIosrC+tCkQ1a6pAARhvjkZTeRJC4+jWi
         jB2vo94qQq4ieyrGATPzJmQGHnFgxIA+GxIIRfSbEksxJ89/kwiwjKMrBoTg2BENC0Y9
         OjlXmKi7lVm8IzciLK8IeOMmXfb2RtrKvdcU44WVgONNPWTzFuWIAyqRKENZkr+OXaaP
         H9kpv15mBmXBb4y/k2KHbN/KKqFuARcyCE8oIRwnMcYErB8NZj7qsie0BvpMAOyvNKiQ
         y+6g==
X-Forwarded-Encrypted: i=1; AJvYcCWhGDY+EukgzN+RV7dZahwG07h2CioQJhJIFHhuVzsR7C2T2addUb8odUQlQw8EDxHXcC6DkbvmOXKVHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxueL8OC5dhstprPtUKskhJ4UZtdIbF+i6EMYsjxo5eHJf9HmO3
	5zaBZZstGQzxjhK/5yVf65AVDyBCvGmT7xihCZ2KqT8Juh3CYxU8yXf2iiJOWBt+PtxOSCN+IVy
	xAKD+O5xRJ4bQ5pPbaDpqzEen0z2vIXFecFoWfcbKRg==
X-Gm-Gg: AY/fxX4Q0YUSU7zmrZe1j8I3NJPMttECe0F15nPM8YcNNBybe9mHg3D9jSv4uwdxJOO
	UuNL+2ONXMkP0sX4BwUFKle8QRZmQ4wmqsc+MfglWwO9L4z0gDYSmjjV6764YBTXKDvW9/GJu+c
	2i+yeebLN40Sp8aSTmlaX7QIvrrp5ylD7xpngOOKJYy778oOQQirXD4Ud0wLWPBVyE4e26iV02u
	PCV/e3pNXaCK6FN6Mb54zCPaxzdBVj0z/AAlS/bA/miFLhXCQisAQ4aun5fXkJ72Ziebw4ZXOb1
	Odn9SwH1MaKE1ovmAnBGtr4d8yWAHCBSbRON
X-Google-Smtp-Source: AGHT+IH8VEaZzqh5zZTcB8vKsSC66JepkEuL2a9J2zyEGbF3ADaE18eZgFTcRxc8CGjXDE5KvbwfgmqDaqUUUAD3soA=
X-Received: by 2002:a05:6820:2214:b0:659:9a49:8fbe with SMTP id
 006d021491bc7-65b452848f3mr6608510eaf.55.1765891069683; Tue, 16 Dec 2025
 05:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20251204101730.1036671-1-arnd@kernel.org> <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com> <aTbCqyOuprPOyU4X@sumit-X1>
 <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com> <3aacf997-3a21-4e4b-b6bd-c55c36fb4c74@oss.qualcomm.com>
 <CAHUa44GO-D1YcQ_36pe-vQ83fB9rcOkny+M7a=CThAxWb6TLTQ@mail.gmail.com> <ba8554b7-499b-4fb8-b792-471d83cf3893@oss.qualcomm.com>
In-Reply-To: <ba8554b7-499b-4fb8-b792-471d83cf3893@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 16 Dec 2025 14:17:37 +0100
X-Gm-Features: AQt7F2rzrn2reenZ61zHb0RF-mtpsW8kdfOWWvyd1ydaz_86tS9Y4U3dPNZzna4
Message-ID: <CAHUa44GaKGhDuNcMqn0c0UgK-CV3bHoUE_Q_X-0ZY+jNEs9ZcQ@mail.gmail.com>
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Etienne Carriere <etienne.carriere@foss.st.com>, Randy Dunlap <rdunlap@infradead.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_051751_919738_4401F99F 
X-CRM114-Status: GOOD (  30.53  )
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

SGksCgpPbiBUdWUsIERlYyAxNiwgMjAyNSBhdCAxMTo1NuKAr0FNIEhhcnNoYWwgRGV2CjxoYXJz
aGFsLmRldkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEhpIEplbnMsCj4KPiBPbiAxMi8x
Ni8yMDI1IDE6MTggUE0sIEplbnMgV2lrbGFuZGVyIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24g
VHVlLCBEZWMgOSwgMjAyNSBhdCA0OjU04oCvQU0gQW1pcnJlemEgWmFycmFiaQo+ID4gPGFtaXJy
ZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSwKPiA+Pgo+
ID4+IE9uIDEyLzgvMjAyNSAxMTo1NCBQTSwgSGFyc2hhbCBEZXYgd3JvdGU6Cj4gPj4+Cj4gPj4+
Cj4gPj4+IE9uIDEyLzgvMjAyNSA1OjUwIFBNLCBTdW1pdCBHYXJnIHZpYSBPUC1URUUgd3JvdGU6
Cj4gPj4+PiBPbiBNb24sIERlYyAwOCwgMjAyNSBhdCAwNDoyNDoxN1BNICsxMTAwLCBBbWlycmV6
YSBaYXJyYWJpIHdyb3RlOgo+ID4+Pj4+IEhpLAo+ID4+Pj4+Cj4gPj4+Pj4gT24gMTIvNS8yMDI1
IDEyOjI3IEFNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiA+Pj4+Pj4gSGksCj4gPj4+Pj4+Cj4g
Pj4+Pj4+IE9uIFRodSwgRGVjIDQsIDIwMjUgYXQgMTE6MTfigK9BTSBBcm5kIEJlcmdtYW5uIDxh
cm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gVGhlIHRlZV9pb2N0bF9v
YmplY3RfaW52b2tlX2FyZyBzdHJ1Y3R1cmUgaGFzIHBhZGRpbmcgb24gc29tZQo+ID4+Pj4+Pj4g
YXJjaGl0ZWN0dXJlcyBidXQgbm90IG9uIHg4Ni0zMiBhbmQgYSBmZXcgb3RoZXJzOgo+ID4+Pj4+
Pj4KPiA+Pj4+Pj4+IGluY2x1ZGUvbGludXgvdGVlLmg6NDc0OjMyOiBlcnJvcjogcGFkZGluZyBz
dHJ1Y3QgdG8gYWxpZ24gJ3BhcmFtcycgWy1XZXJyb3I9cGFkZGVkXQo+ID4+Pj4+Pj4KPiA+Pj4+
Pj4+IEkgZXhwZWN0IHRoYXQgYWxsIGN1cnJlbnQgdXNlcnMgb2YgdGhpcyBhcmUgb24gYXJjaGl0
ZWN0dXJlcyB0aGF0IGRvCj4gPj4+Pj4+PiBoYXZlIGltcGxpY2l0IHBhZGRpbmcgaGVyZSAoYXJt
NjQsIGFybSwgeDg2LCByaXNjdiksIHNvIG1ha2UgdGhlIHBhZGRpbmcKPiA+Pj4+Pj4+IGV4cGxp
Y2l0IGluIG9yZGVyIHRvIGF2b2lkIHN1cnByaXNlcyBpZiB0aGlzIGxhdGVyIGdldHMgdXNlZCBl
bHNld2hlcmUuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gRml4ZXM6IGQ1YjhiMGZhMTc3NSAoInRlZTog
YWRkIFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfT0JKUkVGIikKPiA+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPj4+Pj4+PiAtLS0KPiA+Pj4+
Pj4+IFRoZSBuZXcgaW50ZXJmYWNlIHNob3dlZCB1cCBpbiA2LjE4LCBidXQgSSBvbmx5IGNhbWUg
YWNyb3NzIHRoaXMgYWZ0ZXIKPiA+Pj4+Pj4+IHRoYXQgd2FzIHJlbGVhc2VkLiBDaGFuZ2luZyBp
dCBub3cgaXMgdGVjaG5pY2FsbHkgYW4gQUJJIGNoYW5nZSBvbgo+ID4+Pj4+Pj4gYXJjaGl0ZWN0
dXJlcyB3aXRoIHVudXN1YWwgcGFkZGluZyBydWxlcywgc28gcGxlYXNlIGNvbnNpZGVyIGNhcmVm
dWxseQo+ID4+Pj4+Pj4gd2hldGhlciB3ZSB3YW50IHRvIGRvIGl0IHRoaXMgd2F5IG9yIG5vdC4K
PiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBXb3JraW5nIGFyb3VuZCB0aGUgQUJJIGRpZmZlcmVuY2VzIHdp
dGhvdXQgYW4gQUJJIGNoYW5nZSBpcyBwb3NzaWJsZSwKPiA+Pj4+Pj4+IGJ1dCBhZGRzIGEgbG90
IG9mIGNvbXBsZXhpdHkgZm9yIGNvbXBhdCBoYW5kbGluZy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhp
cyBpcyBjdXJyZW50bHkgb25seSB1c2VkIGJ5IHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIHFjb210
ZWUgYmFja2VuZAo+ID4+Pj4+PiBkcml2ZXIuIFNvIGl0J3Mgb25seSB1c2VkIG9uIGEgZmV3IGFy
bTY0IFF1YWxjb21tIHBsYXRmb3JtcyByaWdodCBub3cuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEkgdGhp
bmsgd2Ugc2hvdWxkIHRha2UgdGhpcyBwYXRjaCwgYnV0IGxldCdzIGhlYXIgd2hhdCBvdGhlcnMg
dGhpbmsuCj4gPj4+Pgo+ID4+Pj4gWWVhaCBzaW5jZSBpdCdzIG5vdCBhbiBBQkkgaXNzdWUgb24g
YXJtNjQgcGxhdGZvcm1zIHdoZXJlIFFURUUgcnVucywgc286Cj4gPj4+Pgo+ID4+Pj4gUmV2aWV3
ZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAb3NzLnF1YWxjb21tLmNvbT4KPiA+Pj4+Cj4g
Pj4+Pj4+Cj4gPj4+Pj4+IFRoYW5rcywKPiA+Pj4+Pj4gSmVucwo+ID4+Pj4+Pgo+ID4+Pj4+Cj4g
Pj4+Pj4gSSBhZ3JlZS4gV2Ugc2hvdWxkIHRha2UgdGhpcyBwYXRjaC4gQXMgbm90ZWQsIHRoZXJl
IGFyZSBub3QgbWFueQo+ID4+Pj4+IGNsaWVudHMgcmVseWluZyBvbiBpdCB5ZXQsIHNvIHVwZGF0
aW5nIHRoZSB1c2Vyc3BhY2Ugc2hvdWxkCj4gPj4+Pj4gYmUgc3RyYWlnaHRmb3J3YXJkLgo+ID4+
Pj4KPiA+Pj4+IFlvdSBzaG91bGQgcmF0aGVyIHRlc3Qgd2l0aG91dCBhbnkgdXNlcnNwYWNlIGxp
YnJhcnkgdXBkYXRlIHRvIHRlc3QgaXQncwo+ID4+Pj4gbm90IGFuIEFCSSBpc3N1ZS4gSnVzdCBm
b3IgY29ycmVjdG5lc3Mgc2FrZSwgeW91IGNhbiB1cGRhdGUgdGhlIGxpYnJhcnkKPiA+Pj4+IHRv
by4KPiA+Pj4+Cj4gPj4+Cj4gPj4+IEknbGwgdGFrZSB0aGUgdGltZSB0byB0ZXN0IGl0IGF0IHNv
bWUgcG9pbnQgdGhpcyB3ZWVrIGJvdGggd2l0aCBhbmQgd2l0aG91dCB1cGRhdGluZwo+ID4+PiB0
aGUgbGlicmFyeSBBQkkuCj4gPj4+Cj4gPj4KPiA+PiBTdW1taXQsIHRoYXQgd2FzIHRoZSBwbGFu
IGZyb20gdGhlIGJlZ2lubmluZywgdGhhdCdzIHdoeSBJIGRpZCBub3QgYWRkICJSZXZpZXdlZC1i
eToiCj4gPj4gaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGFua3MgSGFyc2hhbCBmb3Igdm9sdW50ZWVy
aW5nLgo+ID4KPiA+IEFyZSB3ZSBnb29kIHdpdGggdGhpcyBwYXRjaCBub3c/Cj4gPgo+Cj4gWWVz
LCB0aGlzIGlzIGdvb2QgZnJvbSBvdXIgc2lkZS4KPgo+IFRlc3RlZC1ieTogSGFyc2hhbCBEZXYg
PGhhcnNoYWwuZGV2QG9zcy5xdWFsY29tbS5jb20+CgpHb29kLCB0aGFuayB5b3UsIEhhcnNoYWwu
CgpSZXZpZXdlZC1ieTogSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+
CgpBcm5kLCB3aGF0IGRvIHlvdSBwcmVmZXIsIHRha2luZyB0aGlzIGRpcmVjdGx5IG9yIHNob3Vs
ZCBJIHNlbmQgaXQgaW4KYSBwdWxsIHJlcXVlc3Q/CgpDaGVlcnMsCkplbnMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
