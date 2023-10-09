Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B2E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZlwSaPxYqMg5hkHDeEM/DlOXDwrtY5UxgrcxI83Wak=; b=kvtxSe7ke8wD18
	N5A8gtt6bsEbXbY3s2hHIamZ0C17qmEN6rTTXEd0oliVbQy6i7c+mMsf+zirxvNHPmNN+bubneVDM
	iE10rW7fNDeiRvOfnu5TKOT3PAYEfkZW5VFJMvwFKM+jmeBWq5Ld7bIfrtduUzit6lBu4fHuDhO4c
	c1KZwWuEh8lyPwqFxi4qw6RK49WSWQ/6pvOmYufOyuJbVY65My6BIN4pBxlGXc1Q/k5oTkpoj9SWW
	GNudrInRbEki6kHYYC7PLwQrYBGMkPXkyj/Xv86PsRQQ7I0d4UxjXNuv84E2Zc6/jsPaIve6Uq3v2
	RXIvG4ZF4kejNVhc//Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmfT-00A6ad-21;
	Mon, 09 Oct 2023 09:35:15 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmfQ-00A6aB-1E
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:35:14 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59f6e6b7600so51131787b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 02:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696844110; x=1697448910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xr8BhwyyAKTpcM9iiIvbHN9gtfLY84lyd2lf3mY1OqM=;
        b=N44kK459x5tWhpQnClN8Bj7K5qaF2RCOUHZAC6xevhhkMJudQXoTeNBwtIbzy2hpFu
         tI9eX7hFNgDCEVgFL8vfkj4suleFe6ogDZkhWYUrQJAcd0OW2cmhfy7I90D7CuiV0bl+
         c0gTficJ5333ck3zD3raw6/cP5fFxX+1Nh8s9peolLTms8HTyDGaMCEtMAvRkMkiOTu5
         5jCZUo/STm4K0HAK+Isif6Xktggt/5BNpV2Nk2bUpZVtdgB3PdiWqFsKuHJuHgZyz3bD
         w9JN91EX44TjrALOQYbpeorkNfubMc+byj7ja4ccenWh5lNnqY4SElbsBa2wF+H3dXhb
         Wu6w==
X-Gm-Message-State: AOJu0YyDyhqwKIuQTeiYMiNLE76j63SElyhrLCEhJO9Dx21Ah9LjNJV0
	xokpl+qPMwW9kalnSM+zGBViZs/8dWufFg==
X-Google-Smtp-Source: AGHT+IHzwG4Ek+7Y4GHwGZektwZP2yRXppmkqe1351huOuTPj4yyJa1OKz75jnGCzh6919MzP32OKA==
X-Received: by 2002:a81:9196:0:b0:58d:7599:676a with SMTP id i144-20020a819196000000b0058d7599676amr15400341ywg.37.1696844109885;
        Mon, 09 Oct 2023 02:35:09 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id fr9-20020a05690c358900b005a7a77e715csm57194ywb.40.2023.10.09.02.35.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:35:09 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f7f46b326so51485937b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 02:35:08 -0700 (PDT)
X-Received: by 2002:a81:8246:0:b0:58d:f1fe:5954 with SMTP id
 s67-20020a818246000000b0058df1fe5954mr15164085ywf.32.1696844108593; Mon, 09
 Oct 2023 02:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com> <20231009091625.GB22463@lst.de>
In-Reply-To: <20231009091625.GB22463@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 11:34:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
Message-ID: <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_023512_442865_2CB2096B 
X-CRM114-Status: GOOD (  19.39  )
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

SGkgQ2hyaXN0b3BoLAoKT24gTW9uLCBPY3QgOSwgMjAyMyBhdCAxMToxNuKAr0FNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiBPbiBNb24sIE9jdCAwOSwgMjAyMyBhdCAx
MDo0Mzo1N0FNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiA+ICBjb25maWcg
RE1BX0RJUkVDVF9SRU1BUAo+ID4KPiA+IHJpc2N2IGRlZmNvbmZpZyArIENPTkZJR19OT05QT1JU
QUJMRT15ICsgQ09ORklHX0FSQ0hfUjlBMDdHMDQzPXk6Cj4gPgo+ID4gV0FSTklORzogdW5tZXQg
ZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgRE1BX0dMT0JBTF9QT09MCj4gPiAgIERl
cGVuZHMgb24gW25dOiAhQVJDSF9IQVNfRE1BX1NFVF9VTkNBQ0hFRCBbPW5dICYmICFETUFfRElS
RUNUX1JFTUFQIFs9eV0KPiA+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ID4gICAtIEFSQ0hfUjlBMDdH
MDQzIFs9eV0gJiYgU09DX1JFTkVTQVMgWz15XSAmJiBSSVNDViBbPXldICYmIE5PTlBPUlRBQkxF
IFs9eV0KPgo+IEFuZCB0aGF0J3MgZXhhY3RseSB3aGF0IHRoaXMgcGF0Y2ggaXMgc3VwcG9zZWQg
dG8gc2hvdy4gIFJJU0NWIG11c3Qgbm90Cj4gc2VsZWN0IERNQV9ESVJFQ1RfUkVNQVAgYXQgdGhl
IHNhbWUgdGltZSBhcyBETUFfR0xPQkFMX1BPT0wuICBJIHRob3VnaAo+IHRoZSBmaXggZm9yIHRo
YXQganVzdCB3ZW50IHVwc3RyZWFtPwoKVGhlIGZpeCB5b3UgYXJlIHJlZmVycmluZyB0b28gaXMg
cHJvYmFibHkgY29tbWl0IGMxZWM0YjQ1MGFiNzI5ZTMKKCJzb2M6IHJlbmVzYXM6IE1ha2UgQVJD
SF9SOUEwN0cwNDMgKHJpc2N2IHZlcnNpb24pIGRlcGVuZApvbiBOT05QT1JUQUJMRSIpIGluIG5l
eHQtMjAyMzEwMDYgYW5kIGxhdGVyLiAgSXQgaXMgbm90IHlldCB1cHN0cmVhbS4KClN0aWxsLCBp
dCBtZXJlbHkgbWFrZXMgQVJDSF9SOUEwN0cwNDMgKHdoaWNoIHNlbGVjdHMgRE1BX0dMT0JBTF9Q
T09MKQpkZXBlbmQgb24gQVJDSF9SOUEwN0cwNDMuClJJU0NWX0RNQV9OT05DT0hFUkVOVCBzdGls
bCBzZWxlY3RzIERNQV9ESVJFQ1RfUkVNQVAsIHNvIGJvdGggY2FuIGVuZAp1cCBiZWluZyBlbmFi
bGVkLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
