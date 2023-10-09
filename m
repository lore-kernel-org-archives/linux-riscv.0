Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E661E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p53g/qROQBgyMVol3qZfFWhVpSlsy2ttFN0r66LEaFU=; b=Twb5OYJnosuOXA
	r1MRBY1woGehpiRNWT0zUeoaJupedaok9cfs1ScTd7/K3dQ+ze8f2kl9JZ/rNQB1y+ofyygxObc/F
	FG9x3jU7DU5zHMVx5Z39Vx10F/4eVZPExLtbqt0dVXuGP2T/790dLfFBxR0VZyo1T1B5igtFW7uI3
	1IEkSOkeDL2+shSUYM0VdATVgOCJKOivCwx3+mcLbHlhbvK9MS4DoaQZF/LpHzZ/Dqsm7+pB/g7hE
	5XLA+jGiDtbtOin7rt4bPvfLegWFiVeVO3hAqYQixXNqeNDimDvcRb2Uq9xCDhX+Y5HkWTJRN1Sq8
	2CEq22vcuyhJJyrzSkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpo9s-00AQaX-0f;
	Mon, 09 Oct 2023 11:10:44 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpo9p-00AQZf-0d
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:10:42 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7ac4c3666so624267b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 04:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849840; x=1697454640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWthkWDqr7tBRS16dMRTYjQcxpjwoRQd7noLnGne1cw=;
        b=hmvVJRzUqPjg7/iSvXBJLsYsE2RukCfgo9ShDCQ0EJu23x1N3KnpGf7Czw9z0X8ajb
         SoprR76TcFDAtBBHm/w6+Czda0DC3HX5Htcg1yhSvUqGC01E8zW1/zkGa/LdghBWDaBA
         DxueHH5NmAufm9VLX2C7iBqs3FhRxVkXnPLmUMqWrC7hk5c46b7Ho0QQe9hf2rEQMLHn
         TUuMit344+lgRh4UGU69ksPkFltwl/fG/rDZqhyBMq+wUXGZMFR3+hAB9Xy63cn5tV6W
         TlWoCLL/BRoOxitzRmqJs57Mup4O9Ulwf014wOaIHSm/XYK/WE5H0Of8335SgWSH/p/B
         UnqQ==
X-Gm-Message-State: AOJu0YzRdOlbxQmvUpdHllad6pCXzsjPDgfgEAlszGqEt2GpLLBUn6qD
	gHtB9KZIWtZUcPoVwWVXRpNQsZLinNo6+A==
X-Google-Smtp-Source: AGHT+IHUZ1t/6+YNVzsG1xUQIH80XAFb7sutQMvizsJBOdEeLKyWV5t5QVipQLuPQHsPRIRAgx8zdQ==
X-Received: by 2002:a81:7b54:0:b0:595:e1b:b978 with SMTP id w81-20020a817b54000000b005950e1bb978mr16558437ywc.21.1696849839803;
        Mon, 09 Oct 2023 04:10:39 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id x132-20020a817c8a000000b005925c896bc3sm3645355ywc.53.2023.10.09.04.10.38
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7ac4c3666so624007b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
X-Received: by 2002:a81:7b54:0:b0:595:e1b:b978 with SMTP id
 w81-20020a817b54000000b005950e1bb978mr16558396ywc.21.1696849838737; Mon, 09
 Oct 2023 04:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de> <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
 <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
In-Reply-To: <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 13:10:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, arm-soc <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_041041_233051_C9321656 
X-CRM114-Status: GOOD (  25.92  )
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

SGkgUm9iaW4sCgpPbiBNb24sIE9jdCA5LCAyMDIzIGF0IDEyOjA04oCvUE0gUm9iaW4gTXVycGh5
IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gT24gMjAyMy0xMC0wOSAxMDo1MSwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgOSwgMjAyMyBhdCAxMTo0M+KA
r0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+PiBPbiBNb24sIE9j
dCAwOSwgMjAyMyBhdCAxMTozNDo1NUFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gPj4+IFRoZSBmaXggeW91IGFyZSByZWZlcnJpbmcgdG9vIGlzIHByb2JhYmx5IGNvbW1pdCBj
MWVjNGI0NTBhYjcyOWUzCj4gPj4+ICgic29jOiByZW5lc2FzOiBNYWtlIEFSQ0hfUjlBMDdHMDQz
IChyaXNjdiB2ZXJzaW9uKSBkZXBlbmQKPiA+Pj4gb24gTk9OUE9SVEFCTEUiKSBpbiBuZXh0LTIw
MjMxMDA2IGFuZCBsYXRlci4gIEl0IGlzIG5vdCB5ZXQgdXBzdHJlYW0uCj4gPj4+Cj4gPj4+IFN0
aWxsLCBpdCBtZXJlbHkgbWFrZXMgQVJDSF9SOUEwN0cwNDMgKHdoaWNoIHNlbGVjdHMgRE1BX0dM
T0JBTF9QT09MKQo+ID4+PiBkZXBlbmQgb24gQVJDSF9SOUEwN0cwNDMuCj4gPj4+IFJJU0NWX0RN
QV9OT05DT0hFUkVOVCBzdGlsbCBzZWxlY3RzIERNQV9ESVJFQ1RfUkVNQVAsIHNvIGJvdGggY2Fu
IGVuZAo+ID4+PiB1cCBiZWluZyBlbmFibGVkLgo+ID4+Cj4gPj4gT2ssIHNvIHdlIG5lZWQgdG8g
YWN0dWFsbHkgZml4IHRoaXMgcHJvcGVybHkuICBMYWQsIGNhbiB5b3UgcmVzcGluCj4gPj4gdGhl
IGZpeCB0byBub3Qgc2VsZWN0IERNQV9ESVJFQ1RfUkVNQVAsIGZvciBBUkNIX1I5QTA3RzA0Mz8K
PiA+Cj4gPiBBUkNIX1I5QTA3RzA0MyBkb2VzIG5vdCBzZWxlY3QgRE1BX0RJUkVDVF9SRU1BUCBk
aXJlY3RseSwKPiA+IFJJU0NWX0RNQV9OT05DT0hFUkVOVCBkb2VzLiAgQW5kIHRoZXJlIGFyZSBv
dGhlciB1c2VycyBvZgo+ID4gUklTQ1ZfRE1BX05PTkNPSEVSRU5UIChSSVNDVl9JU0FfWklDQk9N
IGFuZCBFUlJBVEFfVEhFQURfQ01PKS4KPiA+IFNob3VsZCB0aGUgc2VsZWN0aW9uIG9mIERNQV9E
SVJFQ1RfUkVNQVAgbW92ZWQgdG8gdGhlaXIgdXNlcnM/Cj4KPiBObywgdGhlIHNlbGVjdGlvbiBv
ZiBETUFfR0xPQkFMX1BPT0wgc2hvdWxkIGJlIHJlbW92ZWQgZnJvbQo+IFJJU1ZfRE1BX05PTkNP
SEVSRU5UIGFuZCBzZWxlY3RlZCBkaXJlY3RseSBieSBBUkNIX1I5QTA3RzA0MyAoYWxvbmcgd2l0
aAo+IGFueSBvZiB0aGUgb3RoZXIgaW1wbGllZCBzeW1ib2xzIGl0IG5lZWRzKS4gT3IgaWYgYXMg
c3VnZ2VzdGVkIHRoaXMKPiBwaHlzaWNhbC1hdHRyaWJ1dGUtcmVtYXAgd2Fja2luZXNzIGlzIGR1
ZSB0byBzaG93IHVwIG9uIG1vcmUgcGxhdGZvcm1zCj4gYXMgd2VsbCwgbWF5YmUgaGF2ZSBhIGNv
bW1vbiBjb25maWcgZm9yIHRoYXQgd2hpY2ggc2VsZWN0cwo+IERNQV9HTE9CQUxfUE9PTCBwbHVz
IHRoZSByZWxldmFudCBjYWNoZSBtYWludGVuYW5jZSBleHRlbnNpb25zIGFzIGFuCj4gZXF1aXZh
bGVudCB0byBSSVNDVl9ETUFfTk9OQ09IRVJFTlQsIGFuZCBjYW4gaXRzZWxmIGV4cGxpY2l0bHkg
ZGVwZW5kIG9uCj4gTk9OUE9SVEFCTEUgZm9yIGNsYXJpdHkuCgpSSVNDVl9ETUFfTk9OQ09IRVJF
TlQgZG9lcyBub3Qgc2VsZWN0IERNQV9HTE9CQUxfUE9PTCwKQVJDSF9SOUEwN0cwNDMgc2VsZWN0
cyBETUFfR0xPQkFMX1BPT0wuClJJU0NWX0RNQV9OT05DT0hFUkVOVCBkb2VzIHNlbGVjdCBETUFf
RElSRUNUX1JFTUFQIGlmIE1NVS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
