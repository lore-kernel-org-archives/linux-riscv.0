Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520DBCAC5BD
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cmcx1pSJjYdjpKDwe/HdDi5qGMMfA8cxIDxWdZ3VC4=; b=YluoTSTIenGaqL
	2Azyhu0T/+8+CjSDEcbjMBjiJqZ8XV43+oZYB96TEcFZbrDQjTGeYFpkS8HX+c4/eHAgunOyyvhgY
	uVm35PKUBzC+6Q59fgeuqCwE2KdVno/hNuLkioX/VmkjN7MB5X6pCimJPFGlUP0Lp+5L4nmnnLk0D
	+Ia6nG2+VKIn0mPCQTPuXcDn/+7nbwJ/5VOunWs8dRU8DOQenm/dU/B6mvnzn09udLNs2Bm9Oq8u4
	tpo/8JOBZ7OVxcSNdtl30a0RTEVqDIxKwuykNFB6DGKu05dWeI245NXmUMpQ9bOSMXpxQAOIcmdfM
	4HypcD+KRHnEvdeo6e6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sZO-0000000G3v3-0n6C;
	Sun, 28 Sep 2025 14:40:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sZM-0000000G3tZ-0lxH
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 14:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F295A43208
	for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 14:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD83C4AF0B
	for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759070406;
	bh=YTfeZ2Az2Z8Gm9DtkMQMER4W7eQCdNdPKRtSzc6jOSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E+eEDf738DIWH8AV/fKoc38BolmBbkv2V3MzRdl9kmp+cWmedZHwK0nxfwFGGO+UQ
	 45AqO5ZFt4tJZzxZd6CS2q3iWcAS4Cbm2N1Iy990txMQROoVk7uAHvjUuU/JHjVJcx
	 E3P76EMaVdCAm6ljVWWca2xSfv6YP/I871kQXLIassNB/tMf1STibLRON5mCzYfrnW
	 f3v6VVvYwtllH8yx9nPhcUazF0FUub5fedvheR2I3/cGe+iSgelMwVd2B05vSjy5SP
	 UbAmbTHotqsZB+WoHDd19rq+DNy7tPRZbosPIetRNE91Jw7cB4CFTM8kJNYWmpZNOE
	 yl+zwxV//VHnw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso46008081fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 07:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWO4d0BYToq88B9Qbaia5mIhlWenpLLxnC+9Gahf7Zx8vjFurDrgqC6U7+jecojxciAilW7Kcl5WZXFYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz16lVyG3UCXNUJrFu8IP7J/IqZLej0Bb9zAArNvfbz/yjT3Gr8
	zL2q+yBoPOVKLp71Qt8owq2+c7ky2phEopreF5PI49X/PuwLANH6fKVR4YYpJ1DrqM8f6fIvg3F
	cCEzUO8cZq0hLcq1++Nw/Q2Fb9MEh0YI=
X-Google-Smtp-Source: AGHT+IHH3ITnfb2BpbA6fI4i1D/KynnPo0itxokVo5z2R2BxNhPDjgHL5REZ4v90HN8ojvUvINWVTbbCPEGJLRT00uM=
X-Received: by 2002:a2e:bc24:0:b0:36c:2899:7a33 with SMTP id
 38308e7fff4ca-36fb05aac1emr41368541fa.5.1759070405095; Sun, 28 Sep 2025
 07:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
In-Reply-To: <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 28 Sep 2025 16:39:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
X-Gm-Features: AS18NWBfnP56WGhzhDUorQf3ioUtwwx0in0DsVvUF4v8bsmet9iSfiUkxyOpxGQ
Message-ID: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_074008_267350_FFCA3780 
X-CRM114-Status: GOOD (  22.76  )
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

T24gU3VuLCAyOCBTZXB0IDIwMjUgYXQgMTU6NTIsIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEFyZCwKPgo+IE9uIFN1biwgU2VwIDI4LCAyMDI1IGF0
IDk6NDLigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4g
PiBPbiBTdW4sIDI4IFNlcHQgMjAyNSBhdCAxMDo1NSwgVGllemh1IFlhbmcgPHlhbmd0aWV6aHVA
bG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPgo+ID4gPiBXaGVuIGNvbXBpbGluZyB3aXRoIExMVk0g
YW5kIENPTkZJR19MVE9fQ0xBTkcgaXMgc2V0LCB0aGVyZSBleGlzdHMKPiA+ID4gdGhlIGZvbGxv
d2luZyBvYmp0b29sIHdhcm5pbmcgb24gTG9vbmdBcmNoOgo+ID4gPgo+ID4gPiAgIHZtbGludXgu
bzogd2FybmluZzogb2JqdG9vbDogX19lZmlzdHViX2VmaV9ib290X2tlcm5lbCgpCj4gPiA+ICAg
ZmFsbHMgdGhyb3VnaCB0byBuZXh0IGZ1bmN0aW9uIF9fZWZpc3R1Yl9leGl0X2Jvb3RfZnVuYygp
Cj4gPiA+Cj4gPiA+IFRoaXMgaXMgYmVjYXVzZSBlZmlfYm9vdF9rZXJuZWwoKSBkb2Vzbid0IGVu
ZCB3aXRoIGEgcmV0dXJuIGluc3RydWN0aW9uCj4gPiA+IG9yIGFuIHVuY29uZGl0aW9uYWwganVt
cCwgdGhlbiBvYmp0b29sIGhhcyBkZXRlcm1pbmVkIHRoYXQgdGhlIGZ1bmN0aW9uCj4gPiA+IGNh
biBmYWxsIHRocm91Z2ggaW50byB0aGUgbmV4dCBmdW5jdGlvbi4KPiA+ID4KPiA+ID4gQXQgdGhl
IGJlZ2lubmluZywgdHJ5IHRvIGRvIHNvbWV0aGluZyB0byBtYWtlIGVmaV9ib290X2tlcm5lbCgp
IGVuZHMgd2l0aAo+ID4gPiBhbiB1bmNvbmRpdGlvbmFsIGp1bXAgaW5zdHJ1Y3Rpb24sIGJ1dCB0
aGlzIG1vZGlmaWNhdGlvbiBzZWVtcyBub3QgcHJvcGVyLgo+ID4gPgo+ID4gPiBTaW5jZSB0aGUg
ZWZpc3R1YiBmdW5jdGlvbnMgYXJlIHVzZWxlc3MgZm9yIHN0YWNrIHVud2luZGVyLCB0aGV5IGNh
biBiZQo+ID4gPiBpZ25vcmVkIGJ5IG9ianRvb2wuIEFmdGVyIG1hbnkgZGlzY3Vzc2lvbnMsIG5v
IG5lZWQgdG8gbGluayBsaWJzdHViIHRvCj4gPiA+IHRoZSB2bWxpbnV4Lm8sIG9ubHkgbGluayBs
aWJzdHViIHRvIHRoZSBmaW5hbCB2bWxpbnV4Lgo+ID4gPgo+ID4KPiA+IFBsZWFzZSB0cnkga2Vl
cGluZyB0aGVzZSBjaGFuZ2VzIGNvbmZpbmVkIHRvIGFyY2gvbG9vbmdhcmNoLiBUaGlzCj4gPiBw
cm9ibGVtIGRvZXMgbm90IGV4aXN0IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMsIGFuZCBjaGFuZ2lu
ZyB0aGUgd2F5Cj4gPiB2bWxpbnV4IGlzIGNvbnN0cnVjdGVkIG1pZ2h0IGNyZWF0ZSBvdGhlciBp
c3N1ZXMgZG93biB0aGUgcm9hZC4KPiBBUk0sIFJJU0MtViBhbmQgTG9vbmdBcmNoIGRvIHRoaW5n
cyBleGFjdGx5IGluIHRoZSBzYW1lIHdheS4gTm93Cj4gTG9vbmdBcmNoIGlzIHRoZSBmaXJzdCBv
ZiB0aGUgdGhyZWUgdG8gZW5hYmxlIG9ianRvb2wsIHNvIHdlIG1lZXQgdGhlCj4gcHJvYmxlbSBm
aXJzdC4KPgo+IEJ1dCB5ZXMsIEkgYWxzbyBkb24ndCB3YW50IHRvIGNoYW5nZSB0aGUgd2F5IG9m
IGNvbnN0cnVjdGluZyB2bWxpbnV4Lgo+IFNvIEkgcHJlZmVyIHRoZSBlYXJsaWVzdCB3YXkgdG8g
Zml4IHRoaXMgcHJvYmxlbS4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sb29uZ2FyY2gvQ0FB
aFYtSDdmUkhHRlZLVjhIaXRSZ211b0RQdDVPRHQtLWlTdVYwRW1lZVViOWQ1Rk53QG1haWwuZ21h
aWwuY29tL1QvI21lZWY3NDExYWJkMTRmNGMyOGM4NWU2ODY2MTRhYTkyMTFmY2NkY2EwCj4KCkNh
biB3ZSBqdXN0IGRyb3AgdGhlIF9fbm9yZXR1cm4gYW5ub3RhdGlvbiBmcm9tIGtlcm5lbF9lbnRy
eV90LCBhbmQKcmV0dXJuIEVGSV9TVUNDRVNTIGZyb20gZWZpX2Jvb3Rfa2VybmVsKCk/CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
