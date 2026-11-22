Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03F606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L9/RJem0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wOjvFX6oq6nZ8bwppYoLPrlWKvYEki96W+TRw2YsZXI=; b=L9/RJem0aVBtqcUZ5R9li9TZ6W
	1zpQwogmdnh91asxQiNfMzLRaBeA2gx9hVe0mY8RmqSKNzot6yIg2KrEMyQQBFAsaXbf9UE44iHTC
	MBWCxREC9Nq1i35HHauYkbuXMGVe8VqLgApBcO7Gco2KOI+cuQHSSgwSaYOcCOgodnYp5kiAo+M/4
	H4OGwDCN+pjqYg9wGAqx7vRL1s9T5mf/NL4VrVsD/fsHlgYRO6JibtGLF56rX5kcV0w5+PTv91x4x
	GqCt2XoYsSWqe97cTYTcfzi9l906ZE8eLchdlLKQWLY9SRuYGfVEm03qSIWXmhW0HXGzDRC0HB0w3
	DwLBfWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1Bo-00000000nR6-1NVz;
	Sun, 22 Nov 2026 06:36:40 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1Bj-00000000nQU-2c6v;
	Sun, 22 Nov 2026 06:36:38 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-03 (Coremail) with SMTP id rQCowADX4JFJjQJrB7yNAQ--.19133S2;
	Sun, 22 Nov 2026 14:35:55 +0800 (CST)
Message-ID: <06e509d9cbfa06179cf5327ff533ae7212e23985.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss	 <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli	
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, Paul
 Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
 Belhachemi	 <db@domibel.de>, Andy Yan <andyshrk@163.com>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Yakir Yang
 <kuankuan.y@gmail.com>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>, 
 William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
 <xingyu.wu@starfivetech.com>, Sandy Huang	 <hjc@rock-chips.com>, Manivannan
 Sadhasivam <mani@kernel.org>
Date: Sun, 22 Nov 2026 14:35:53 +0800
In-Reply-To: <20261106-jh7110-clean-send-v7-6-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
		<CGME20261106135900eucas1p17159021cc747335b62cad6b3326605be@eucas1p1.samsung.com>
	 <20261106-jh7110-clean-send-v7-6-68f7ea9913db@samsung.com>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADX4JFJjQJrB7yNAQ--.19133S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW7try5Zw1rGr17GrWDXFb_yoWkWwb_ua
	yxC3WUAFs8JryFga1jkrn7KF1Fqa12yw4rC3Z8tF1rG348CrZ0gF93Jw1Yyw1UZr4I9r15
	Crs3WryqgFsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU-eHqUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_223636_052926_7246E586 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMDbkupTnmoQgMTQ6NTggKzAxMDDvvIxNaWNoYWwgV2lsY3p5bnNraeWGmemB
k++8mgo+IFRoZSBKSDcxMTAgZW1iZWRzIGEgREM4MjAwLiBUaGUgYmluZGluZyByZXF1aXJlcyBh
biBTb0Mgc3BlY2lmaWMKPiBjb21wYXRpYmxlIGFoZWFkIG9mIHRoZSBnZW5lcmljIG9uZSwgc28g
YWRkIHRoZSBKSDcxMTAgdG8gdGhlIGVudW0uCj4gCj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChB
cm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kg
PG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byBkcm0tbWlz
Yy1uZXh0LgoKVGhhbmtzLApJY2Vub3d5Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMueWFtbAo+IGlu
ZGV4IDkxOWE5MDAxMjIwMTIwMDU0Y2I2MmQxZDAxYjcyOTMzNjcyNjZmOTUuLjA1YTIwMjYzM2Nk
MjczZmVjMzU4YzA5NWM2NDU4NGQ5NTlkOTZkOTAgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMueWFtbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRj
LnlhbWwKPiBAQCAtMTYsNiArMTYsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgIGNvbXBhdGlibGU6Cj4g
ICAgICBpdGVtczoKPiAgICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAgLSBzdGFyZml2ZSxqaDcx
MTAtZGM4MjAwCj4gICAgICAgICAgICAtIHRoZWFkLHRoMTUyMC1kYzgyMDAKPiAgICAgICAgLSBj
b25zdDogdmVyaXNpbGljb24sZGMgIyBEQyBJUHMgaGF2ZSBkaXNjb3ZlcmFibGUgSUQvcmV2aXNp
b24gcmVnaXN0ZXJzCj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
