Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E446C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tpwKlkY1l1qy1eAeqcmo610w++nOygkUKdunP+2YsQ=; b=XRk59Q4qJK4O1m
	8aESOwjPkcrDVoo6pS3gFk8g1CGEQ/ME3jWw6uswV50UtRORBSQC2q45tuONNyTkf/EfovqGvO+DX
	unAq6Bxu3NbCRNQ23+4Kk3aUT5pZVeARCZYwceiiwgbjqi8FbOcK/DtTgD5zUPXkefC0dmZBfKN8i
	ZfizmouhIlgpbm7oQApKJudScdZB/EB+iUo6aSNADodyOHRorVhmqVrD43wpRd3wm5FBpZs52Xx5q
	snN8+yfW+cnJfC1ZPk7sOWsttSR4mA8yoVjMNThF6j/YFJ+kl+GW2ms60mKhsViH3/V5cwdgH7vKm
	1LsBV/ouM0sINtHCOYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0Z8-00000001Xpv-2NpQ;
	Tue, 28 May 2024 17:24:50 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0Z5-00000001Xmq-0p4J
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 17:24:48 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-43dfe020675so33131cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716917085; x=1717521885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/zJPbXyQmRdniGVZf4TSPPBc/ZwEN1OkaaD+bjWerY=;
        b=cTbVyqeASVfq8joqOhEsL32fM7cX4+47jrrPX/uhuEA4ks7slT6KuxHJNnCvqAHUWI
         vsvlEwVFcCbyGvrioaXRQHUGTUU9OdjuzNJDyMKcVGZ4GXN71R8qWu4a1u9JwnTfiI8d
         teJiDdTmOdlL7wERy4eUJhTgxh9g2Ay2vvc0sUJpuSVFAz8EVIR1CPcoq6AMD3Bww7Jk
         RW7ZkwgN2iwnvvZIogUlYaSDAUpBPPXusvl1bF6YpI6celtLMNEIGSJbSYbkIU3Nwf8C
         xH4LnKkuSj+X8VldYD510mFyH+BK37BfQLRxqP++1LPKdf1k+0lI+Al28M15CK5rnXs6
         XiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716917085; x=1717521885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/zJPbXyQmRdniGVZf4TSPPBc/ZwEN1OkaaD+bjWerY=;
        b=V3G9N/Q7tK91I8QjavB+T/73M7LbP6NDZuNHvPjSaXgwKDUyKU4Xhagotz9CktSogQ
         Xk8zAinzgoUtxRdNNbaYzl+Z2k+07oT/ShXmEBbBoURwP4u9vYEhpOhq1D/fjvvb3Z8v
         rtVTU2xcqbKpT4+luFXTn4Yv/K0OpRuZTtqhuS8zOEjJS7D8T3DM2oqnFFUwV5t20oOu
         oK+W9QRNRfTWRoZtYOn1gckDGlsvXWLPUywdzaX4Tt2oJglTZFhl20KfcYNZpjkJhtba
         8539jh0INuePZpZWCdGLnIgLuSkAyEJOYxahwGjqWfiVpXW6T51W+y1ZMFQTa1B/2XNS
         ATXA==
X-Forwarded-Encrypted: i=1; AJvYcCVK6Z8OffC450zowN6UCMcE8YWx2Eef8F13XB9EEHLSlBnwK1+f5YxCEmNp7gI+clL/bCyg1dGVKYGoIaApK5JirGVdgbEju/IrhhN2AnzO
X-Gm-Message-State: AOJu0YwTV4jdzJrxTbktFllORRtkjELSHyPKAFbDA2Sjs1WHTid2acMS
	7he40NkQ5vJbmdqGCCYjf4C+17FxCcpphdqivaygBVZ1Be7BcEzXw/V+5nkl8iHx7+wbKer0ZAJ
	UfPyJTpRjNLtqKdhwc/h46liGKEbCBsGUi3fe
X-Google-Smtp-Source: AGHT+IHOOURY6/R8zKLRs0+9b0KCEvabYkkR5HlqFkHzn0eIA34VYFPXTS30jDv55131zHsyX8c1BLRfOrGstkj0xBk=
X-Received: by 2002:a05:622a:400d:b0:43f:b1dd:11fc with SMTP id
 d75a77b69052e-43fb9f9ac98mr7220561cf.18.1716917084620; Tue, 28 May 2024
 10:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240528164132.2451685-1-maz@kernel.org>
In-Reply-To: <20240528164132.2451685-1-maz@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 28 May 2024 19:23:39 +0200
Message-ID: <CAGETcx-ZbK3P+CoPb1szjWNBbM7kN0j_p6QzT4iqPrYHqvWjRw@mail.gmail.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
To: Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_102447_256049_8DBC5D28 
X-CRM114-Status: GOOD (  23.15  )
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

T24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgNjo0MeKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gQ29tbWl0IGQ5NzZjNmY0YjMyYyAoIm9mOiBwcm9wZXJ0eTogQWRk
IGZ3X2Rldmxpbmsgc3VwcG9ydCBmb3IKPiBpbnRlcnJ1cHQtbWFwIHByb3BlcnR5IikgdHJpZWQg
dG8gZG8gd2hhdCBpdCBzYXlzIG9uIHRoZSB0aW4sCj4gYnV0IGZhaWxlZCBvbiBhIGNvdXBsZSBv
ZiBwb2ludHM6Cj4KPiAtIGl0IGNvbmZ1c2VzIGJ5dGVzIGFuZCBjZWxscy4gTm90IGEgaHVnZSBk
ZWFsLCBleGNlcHQgd2hlbiBpdAo+ICAgY29tZXMgdG8gcG9pbnRlciBhcml0aG1ldGljCj4KPiAt
IGl0IGRvZXNuJ3QgcmVhbGx5IGhhbmRsZSBhbnl0aGluZyBidXQgaW50ZXJydXB0LW1hcHMgdGhh
dCBoYXZlCj4gICB0aGVpciBwYXJlbnQgI2FkZHJlc3MtY2VsbHMgc2V0IHRvIDAKPgo+IFRoZSBj
b21iaW5hdGlvbnMgb2YgdGhlIHR3byBsZWFkcyB0byBzb21lIHNlcmlvdXMgZnVuIG9uIG15IE0x
Cj4gYm94LCB3aXRoIHBsZW50eSBvZiBXQVJOLU9OKCkgZmlyaW5nIGFsbCBvdmVyIHRoZSBzaG9w
LCBhbmQKPiBhbXVzaW5nIHZhbHVlcyBiZWluZyBnZW5lcmF0ZWQgZm9yIGludGVycnVwdCBzcGVj
aWZpZXJzLgo+Cj4gQWRkcmVzcyBib3RoIGlzc3VlcyBzbyB0aGF0IEkgY2FuIGJvb3QgbXkgbWFj
aGluZXMgYWdhaW4uCj4KPiBGaXhlczogZDk3NmM2ZjRiMzJjICgib2Y6IHByb3BlcnR5OiBBZGQg
ZndfZGV2bGluayBzdXBwb3J0IGZvciBpbnRlcnJ1cHQtbWFwIHByb3BlcnR5IikKPiBTaWduZWQt
b2ZmLWJ5OiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+IENjOiBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiBDYzogU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFuYWtA
Z29vZ2xlLmNvbT4KPiBDYzogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwgMTYgKysrKysrKysrKysrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiBpbmRl
eCAxYzgzZTY4ZjgwNWIuLjlhZGViYzYzYmVhOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL29mL3By
b3BlcnR5LmMKPiArKysgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiBAQCAtMTMyMiw3ICsxMzIy
LDEzIEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnNlX2ludGVycnVwdF9tYXAoc3Ry
dWN0IGRldmljZV9ub2RlICpucCwKPiAgICAgICAgIGFkZHJjZWxscyA9IG9mX2J1c19uX2FkZHJf
Y2VsbHMobnApOwo+Cj4gICAgICAgICBpbWFwID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAiaW50ZXJy
dXB0LW1hcCIsICZpbWFwbGVuKTsKPiAtICAgICAgIGlmICghaW1hcCB8fCBpbWFwbGVuIDw9IChh
ZGRyY2VsbHMgKyBpbnRjZWxscykpCj4gKyAgICAgICBpbWFwbGVuIC89IHNpemVvZigqaW1hcCk7
Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIENoZWNrIHRoYXQgd2UgaGF2ZSBlbm91Z2gg
cnVud2F5IGZvciB0aGUgY2hpbGQgdW5pdCBpbnRlcnJ1cHQKPiArICAgICAgICAqIHNwZWNpZmll
ciBhbmQgYSBwaGFuZGxlLiBUaGF0J3MgdGhlIGJhcmUgbWluaW11bSB3ZSBjYW4gZXhwZWN0Lgo+
ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoIWltYXAgfHwgaW1hcGxlbiA8PSAoYWRkcmNlbGxz
ICsgaW50Y2VsbHMgKyAxKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gICAgICAg
ICBpbWFwX2VuZCA9IGltYXAgKyBpbWFwbGVuOwo+Cj4gQEAgLTEzNDYsOCArMTM1MiwxNCBAQCBz
dGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpwYXJzZV9pbnRlcnJ1cHRfbWFwKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsCj4gICAgICAgICAgICAgICAgIGlmICghaW5kZXgpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHN1cF9hcmdzLm5wOwo+Cj4gLSAgICAgICAgICAgICAgIG9mX25v
ZGVfcHV0KHN1cF9hcmdzLm5wKTsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAg
ICAgICogQWNjb3VudCBmb3IgdGhlIGZ1bGwgcGFyZW50IHVuaXQgaW50ZXJydXB0IHNwZWNpZmll
cgo+ICsgICAgICAgICAgICAgICAgKiAoYWRkcmVzcyBjZWxscywgaW50ZXJydXB0IGNlbGxzLCBh
bmQgcGhhbmRsZSkuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBpbWFw
ICs9IG9mX2J1c19uX2FkZHJfY2VsbHMoc3VwX2FyZ3MubnApOwo+ICAgICAgICAgICAgICAgICBp
bWFwICs9IHN1cF9hcmdzLmFyZ3NfY291bnQgKyAxOwo+ICsKPiArICAgICAgICAgICAgICAgb2Zf
bm9kZV9wdXQoc3VwX2FyZ3MubnApOwo+ICAgICAgICAgICAgICAgICBpbmRleC0tOwo+ICAgICAg
ICAgfQo+CgpUaGFua3MgTWFyYyEgQW5kIHNvcnJ5IGZvciBub3QgY2F0Y2hpbmcgdGhpcyBpbiBt
eSBlYXJsaWVyIHJldmlldyEKCkFja2VkLWJ5OiBTYXJhdmFuYSBLYW5uYW4gPHNhcmF2YW5ha0Bn
b29nbGUuY29tPgoKLVNhcmF2YW5hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
