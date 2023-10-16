Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ACACDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueFZo9xhzNfUXZXtOwTd6Bfpc80egiDxcV5idvkrNDI=; b=x9HoIatdFR7jn0
	rF/4kszd2P73v2cZ9Wt1kRF7kWafFUUM+k+7+WIdBTFv0DxdnSHJsRmUgRT6d8PKv9TzyieNuDENf
	BsvwemhF2JKh0/BIexFmhUM1AggRd1BS+c9zEz6KouR8aT8NRgkyr4sG8g/kntRamVguzAWwxUIfO
	vyPNkBhr19hQMik6KpsjwTQRpv5ks2d0AShRc7NPo/hll9K/n1MO+blyy3ur96MZoMJGpvm4ITAxS
	U9cKgmF7Giigqhdm3yktWC3CoOojHt/bvMX6lnhOKSOX7vrakz96h8Onqxaa1XgEUDwHoQoN/sCwz
	Oj4B8eUOlL0Oj5kMJ9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPn5-00A2GE-1c;
	Mon, 16 Oct 2023 15:45:59 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPn2-00A2FI-2u
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 15:45:58 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49618e09f16so1730164e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697471156; x=1698075956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be+JqDvKcVfoZO+fdW/6Y7p5xoTP2t1qbUjOd8UWjBU=;
        b=JzsS1ZrRXWvjNDMiE6WBUg2wyQxfitkr9KjLbac2c2Ke3IbD1desnHfs/JLQdIIxmC
         my8OM4DHKlPInPv7aQE8Wj5TZjFcQ+dllX9nnNQGcrbYq8P7I/0xW3scroyeVuhey/Iu
         E+thauVir1QPe2lGMPk8j8DSmRg7Ku7iu2vEqtNoddvUxIcZwl7D3xAO91JhN6bA/rJw
         dPtTw4uzkQuqjZX+8dQNguGF+cG1ADsoogg3wanHUdNWi89oFK+y2JQjgwR39Kmnic8M
         oArxdrlgDKhR65I+pu++4X13+i8oYVGuzcE5OlTQQ533nmKjIZlrBaMknFogJxXSaJog
         6mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471156; x=1698075956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be+JqDvKcVfoZO+fdW/6Y7p5xoTP2t1qbUjOd8UWjBU=;
        b=hElr62AQ3+onFOvBTiKU6+EkfFq12iv4//gEfJIMuczf5rqXHDGdZJNhflQdr2V0+Y
         rzSdlQjtx3tbh3qygziEtTZWUGpHhluX9QsP4Ab0FJ0BygA1PW23hUE18/lKXYMg9CJP
         XJ5D5kxhMeZIbXQNU9vCzow+FTQKhULXmYeFifpzn5b7n7w6GnMe+xOEgbR2ppudzjcE
         djnxGV/OKKCsWS4iAFUm/6nQGwAbENjdVLCZQ9XHG7NSV65r2DsjJ8VcAFoAdWnb7p3L
         iGsH7yGWe3+NxYRg4Euq2vqJawvTS2lDbZbDNIPebYU1BOukF4cLPjirx8a3syXV6GIu
         oYKA==
X-Gm-Message-State: AOJu0YxRYzVP0udLm1KUz1Vihz/pekMxAwpqHUx/1YvYrN44JfTFNVi4
	n/k6/uxBDirHrEeaN2mRdDZI2ieF/dIXqTTwYmk=
X-Google-Smtp-Source: AGHT+IGv1onTQjqVJotgyiMblBPHjo7A5lICsP21th4oYCrXg7fMKsA2HIivTnjBub3qHrxO15iu+5gAK0C1u+4Pm/Y=
X-Received: by 2002:a1f:e641:0:b0:48f:8891:29d9 with SMTP id
 d62-20020a1fe641000000b0048f889129d9mr27437782vkh.13.1697471156012; Mon, 16
 Oct 2023 08:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-6-hch@lst.de>
In-Reply-To: <20231016054755.915155-6-hch@lst.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Oct 2023 16:44:39 +0100
Message-ID: <CA+V-a8vfYb-OBZMMXx7vwtZ4b9V7iep3CzPw5FVmvespF8OPqw@mail.gmail.com>
Subject: Re: [PATCH 05/12] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_084556_942205_F1210566 
X-CRM114-Status: GOOD (  13.81  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNjo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IENPTkZJR19ETUFfR0xPQkFMX1BPT0wgY2FuJ3QgYmUgY29tYmlu
ZWQgd2l0aCBvdGhlciBETUEgY29oZXJlbnQKPiBhbGxvY2F0b3JzLiAgQWRkIGRlcGVuZGVuY2ll
cyB0byBLY29uZmlnIHRvIGRvY3VtZW50IHRoaXMsIGFuZCBtYWtlCj4ga2NvbmZpZyBjb21wbGFp
biBhYm91dCB1bm1lbnQgZGVwZW5kZW5jaWVzIGlmIHNvbWVvbmUgdHJpZXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAga2VybmVsL2Rt
YS9LY29uZmlnIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KUmV2
aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9rZXJuZWwvZG1hL0tj
b25maWcgYi9rZXJuZWwvZG1hL0tjb25maWcKPiBpbmRleCBmNDg4OTk3YjA3MTcxMi4uNDUyNGRi
ODc3ZWJhMzYgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9LY29uZmlnCj4gKysrIGIva2VybmVs
L2RtYS9LY29uZmlnCj4gQEAgLTEzNSw2ICsxMzUsOCBAQCBjb25maWcgRE1BX0NPSEVSRU5UX1BP
T0wKPgo+ICBjb25maWcgRE1BX0dMT0JBTF9QT09MCj4gICAgICAgICBzZWxlY3QgRE1BX0RFQ0xB
UkVfQ09IRVJFTlQKPiArICAgICAgIGRlcGVuZHMgb24gIUFSQ0hfSEFTX0RNQV9TRVRfVU5DQUNI
RUQKPiArICAgICAgIGRlcGVuZHMgb24gIURNQV9ESVJFQ1RfUkVNQVAKPiAgICAgICAgIGJvb2wK
Pgo+ICBjb25maWcgRE1BX0RJUkVDVF9SRU1BUAo+IC0tCj4gMi4zOS4yCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
