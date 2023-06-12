Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5722C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvsacE/c/TPL7hcMvC7P9SMnRBXn4WtE0vwXinp1p/Q=; b=nI2pWGIHgHCsRs
	40YbnfzVEoKvrZTSmBasp2nmK9rBSDjYdAx8BmUF99gOqSPIrCePC3K779KrcKZx78EQgFPM+1Dg7
	cicfZ0qtdt6q+E3+1LuqZh02x3bS3kaBOX0YJiuFC0FslpQZOXS232qkNXWBtHgk3lw98dPnABh95
	7uFsFa1JI3IwC2ciw6iKsp9qlmZupE8sF9uK7/q8mkcsPNOt/7y6JW/EWZrrUdSz28mSwV20vqXr5
	bXEtGmnkBbVk3gSUU0dIGNu5Az98LTuU/jki2b5P59NxA42wAGKuzWBtKjdpfCt3h8zb5OkRStUlv
	n1VEdMsxKyAGMHmkpW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mGz-004wYR-1I;
	Mon, 12 Jun 2023 18:28:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mGv-004wX1-28;
	Mon, 12 Jun 2023 18:28:10 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51870e2dc48so190451a12.1;
        Mon, 12 Jun 2023 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686594486; x=1689186486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4agcRs13sbq0fH6nM511QGzLPmuFdZA0cppyFltK+ps=;
        b=VkkQGM9ZGvbJWrYQfpqn7L4k1h2dVUd/QoFfSAOnwXq1NTAWfNLA3YHD5IxwQ92QCA
         A9ggeOYq2NycUNAKSOu5nBuvFvtL9R0CG33IOp/m5zsGRpPGzfyrgBrQUCYPFKu6VvNb
         xKNPNR6FW8aXs844q/tb+nWHXh/0+WFrJHj8AaCVH3O6afT1XeHx9ClTFZtS6DJZsCz6
         9/TL553Qr7Tf4XGCUfuGag5kTVokRLN7X8IeuroC/x57w2lOlcHOM+r70jdTgmQSTvVr
         uW4E67rNyYhxZVU8D7vyoRkPZ4e/U0AMzC08n0lj55BFmbM6CZMiUVq3XrlETAFAcIl6
         M17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594486; x=1689186486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4agcRs13sbq0fH6nM511QGzLPmuFdZA0cppyFltK+ps=;
        b=YGvM2bPfZLibuKeZglutk70bx/1tbJQPwXC3vx5Og5h63dcJl18A7MLwT1btz3xReU
         j0H6o7tn2v1g1UlD+F/gbSadRfd2z0bWRKHZQWOgMsh6++y1S3o9WY6pckjxg42i9NEt
         WP7NljZJvQas2QvXWUh/jpy9OJHrxznI60Ykql5NdWiWISDJonbQrC0OTDUgb+Gqmp66
         JeXc9zLrS02uOxJ3Zk9utrPdVsJsl8vZYj5q2lsEb+3m7OoEKzIps4jQM+NahOdEYtZM
         Gri/iJ0Gpy6lU4Ld3moj22/f+0xGr0pxohw1Lb2xcinMFd5zavWMuTzSoWitxLYhKBzJ
         UOag==
X-Gm-Message-State: AC+VfDxnkBIE7t+bG68W5zlaMBR+BDRhYKDuqKNrVHFFikM+a/dO9Mlf
	kkHJErMjCY/m5yRfxYtNtsc=
X-Google-Smtp-Source: ACHHUZ60yZJ9QPJzqKwozXYJ/sqa9Zy/f+rn7T6IW6OI+RSRCBLxL2MW5KoChkvUBMzrAVZixMKaqQ==
X-Received: by 2002:a17:907:7249:b0:973:dd5b:4072 with SMTP id ds9-20020a170907724900b00973dd5b4072mr8579667ejc.53.1686594485690;
        Mon, 12 Jun 2023 11:28:05 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0097d7924b4edsm4012765ejq.168.2023.06.12.11.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:28:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
Date: Mon, 12 Jun 2023 20:28:03 +0200
Message-ID: <3232828.aeNJFYEL58@jernej-laptop>
In-Reply-To: <13282074.uLZWGnKmhe@jernej-laptop>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
 <13282074.uLZWGnKmhe@jernej-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_112809_723327_10095FAD 
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

RG5lIHBvbmVkZWxqZWssIDEyLiBqdW5paiAyMDIzIG9iIDIwOjIyOjQzIENFU1QgamUgSmVybmVq
IMWga3JhYmVjIG5hcGlzYWwoYSk6Cj4gRG5lIHNvYm90YSwgMTAuIGp1bmlqIDIwMjMgb2IgMjI6
MzU6NDEgQ0VTVCBqZSBNYWtzaW0gS2lzZWxldiBuYXBpc2FsKGEpOgo+ID4gVGhpcyBzZXJpZXMg
YWRkcyBzdXBwb3J0IGZvciBBbGx3aW5uZXIgRDEvVDExM3MgdGhlcm1hbCBzZW5zb3IgY29udHJv
bGxlci4KPiA+IFRISVMgY29udHJvbGxlciBpcyBzaW1pbGFyIHRvIHRoZSBvbmUgb24gSDYsIGJ1
dCB3aXRoIG9ubHkgb25lIHNlbnNvciBhbmQKPiA+IHVzZXMgYSBkaWZmZXJlbnQgc2NhbGUgYW5k
IG9mZnNldCB2YWx1ZXMuCj4gPiAKPiA+IHYyOgo+ID4gLSBGaXhlZCBTb0IgdGFnCj4gCj4gSXQg
ZG9lc24ndCBzZWVtcyB5b3UgZml4ZWQgdGhhdC4KClNvcnJ5LCB0b28gbWFueSByZXZpc2lvbnMg
aW4gc2hvcnQgdGltZS4gV2FpdCB1bnRpbCBkaXNjdXNzaW9uIGlzIGZpbmlzaGVkLgoKQmVzdCBy
ZWdhcmRzLApKZXJuZWoKPiAKPiA+IC0gTW92ZWQgYmluZGluZyBwYXRjaCBiZWZvcmUgZHJpdmVy
IGNoYW5nZXMKPiA+IAo+ID4gdjE6Cj4gPiAtIEluaXRpYWwgdmVyc2lvbgo+ID4gCj4gPiBNYXhp
bSBLaXNlbGV2ICgzKToKPiA+ICAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IHN1bjhpOiBBZGQgYmlu
ZGluZyBmb3IgRDEvVDExM3MgVEhTIGNvbnRyb2xsZXIKPiA+ICAgdGhlcm1hbDogc3VuOGk6IEFk
ZCBEMS9UMTEzcyBUSFMgY29udHJvbGxlciBzdXBwb3J0Cj4gPiAgIHJpc2N2OiBkdHM6IGFsbHdp
bm5lcjogZDE6IEFkZCB0aGVybWFsIHNlbnNvciBhbmQgdGhlcm1hbCB6b25lCj4gPiAKPiA+ICAu
Li4vdGhlcm1hbC9hbGx3aW5uZXIsc3VuOGktYTgzdC10aHMueWFtbCAgICAgfCAyMCArKysrKysr
KysrKysrLQo+ID4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSAg
ICB8IDI2ICsrKysrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL3RoZXJtYWwvc3VuOGlfdGhl
cm1hbC5jICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA1OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IAo+IAo+IAo+IAo+IAo+
IAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
