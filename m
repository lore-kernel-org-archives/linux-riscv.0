Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB861CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 22:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlP8aj4K1cxOuDZE1uOhjdoBv3Uk3AeiVBqMQkdYrzs=; b=AAln+7H86Pr1kN
	jw+O3luAn6Lirk9izGp/wh/jHsEOy8E5/Bm3VEW+V6zm/CHONAYgTDp5ZTHDlxiGK/P5fKHAmffS9
	v3Rw1NbSmz+hjxi2Ey9sARChcc2dJ1UEQCNVXuVaAX580hSt0vs6xZOXWSOqRErcVt4SyIqYMk/ZM
	Uj2mLr69js/RRMR9stqDKagz6MpT9uo9nz+QKPNTJxECDRXvpKBHa/ZjX8lv1d9RF9gzfrHae/42j
	g3QLKoG2Knuy/gpHBLWQS9gJ8BH3VwZBOHQ93MHCrqM2aq5n+rvaKdBosS84D8l+UYQCK4fPitVLQ
	YhQRLyco03cdnUGVrr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorHq-0000000F5x9-2jQ4;
	Wed, 20 Aug 2025 22:28:06 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uon2k-0000000Ec1V-26dx
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 17:56:16 +0000
Received: from [192.168.0.110] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAB3Z6sLDKZou3TODQ--.64161S2;
	Thu, 21 Aug 2025 01:55:23 +0800 (CST)
Message-ID: <2601e3bd-b3d4-4eb1-bcb5-e4fbd9fe9c96@iscas.ac.cn>
Date: Thu, 21 Aug 2025 01:55:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-4-dd17c4905f49@iscas.ac.cn>
 <463dcfa3-152e-4a48-9821-debdc29c89b2@hammernet.be>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <463dcfa3-152e-4a48-9821-debdc29c89b2@hammernet.be>
X-CM-TRANSID: qwCowAB3Z6sLDKZou3TODQ--.64161S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurWrJr43Kw45AFy8Gr45Wrg_yoWfArbE9F
	WSqFnxu34ku3W0gr1UtanxAr1FqrZxWryaqas8twn5J34Ivw4UGw1rJas5JwnxGFy2qrnr
	ZFyagF4jyr12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUkX_TUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_105614_896132_2F5DA268 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDgvMTMvMjUgMjE6MzQsIEhlbmRyaWsgSGFtZXJsaW5jayB3cm90ZToKPgo+IE9uIDgvMTIv
MjUgMDQ6MDIsIFZpdmlhbiBXYW5nIHdyb3RlOgo+PiBCYW5hbmEgUGkgQlBJLUYzIHVzZXMgYW4g
UkdNSUkgUEhZIGZvciBlYWNoIHBvcnQgYW5kIHVzZXMgR1BJTyBmb3IgUEhZCj4+IHJlc2V0Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWaXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+
Cj4+Cj4gVGVzdGVkIG9uIEJhbmFuYSBQaSBCUEktRjMgYW5kIE9yYW5nZSBQaSBSVjIuIFZlcmlm
aWVkIFNTSCBzaGVsbCBvdmVyIGV0aDAKPiBhbmQgZXRoMSBpbnRlcmZhY2VzLCBhbmQgYmFzaWMg
VURQIGNvbm5lY3Rpdml0eSB1c2luZyBpcGVyZjMuIFRoYW5rIHlvdSEKPgo+IFRlc3RlZC1ieTog
SGVuZHJpayBIYW1lcmxpbmNrIDxoZW5kcmlrLmhhbWVybGluY2tAaGFtbWVybmV0LmJlPgoKVGhh
bmsgeW91IGZvciB0aGUgdGVzdGluZyEgSSd2ZSBhbHJlYWR5IHB1dCB0aGlzIHRyYWlsZXIgb24g
djYsIGJ1dApmb3Jnb3QgdG8gcmVwbHkgaGVyZS4KCkkgaGF2ZW4ndCBpbmNsdWRlZCB0aGUgRFRT
IHBhdGNoIGZvciBPcmFuZ2UgUGkgUlYywqBpbiB2NizCoGJlY2F1c2UgdGhlCmJvYXJkIERUUyBp
cyBub3QgaW4gdjYuMTctcmMxLiBIb3dldmVyLCBpdCBpcyBpbiBZaXh1bidzIHNwYWNlbWl0IHRy
ZWUsCkFGQUlDVCwgc28gaWYgd2UgZ2V0IHRoZSBkcml2ZXIgaW4gZm9yIHY2LjE4IEknbGwgc2Vu
ZCB0aGUgRFRTCnNlcGFyYXRlbHkgdG8gc3BhY2VtaXQgbWFpbGluZyBsaXN0LiBJZiB3ZSBkb24n
dCwgSSdsbCBpbmNsdWRlIGl0CmFsb25nc2lkZSB0aGUgZHJpdmVyIHdoZW4gcmViYXNpbmcgdG8g
djYuMTgtcmMxLgoKVml2aWFuICJkcmFtZm9yZXZlciIgV2FuZwoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
