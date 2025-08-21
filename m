Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47623CA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhQfBfq8iXVVMyZRRNuftkKwoUq1X4idU9xupbhAG4s=; b=ln8cRVZCv3YzvM
	+RAp2+n5YM4OqO6R5c3YxllR2k3cFIz5SH1cmDXrh2dHmQpc1sW5pLGY8PbyGUma78bSUuMTn6uzM
	vygnVOZp/2JEFYFtRpDXKyVYtnGXfYQXEG5kxWVa8kIwPvwBw196pbbZtom+FH92EIL/HRepsrhh/
	6ptTR927CmXXnK0DPPbrGhz2yp8Iq8+jpwDFmBaoTnUB6WOhcS2rqxfyF4MoP2geZJCPp0kHnVfVR
	d8xRm/R2DnrJy0AeH19nLddyv5naXS+Q7P8q++6VL+CRfUKIl4FKpWWJG6G/MfTGKDerpv7+I+cB3
	qH4u6CzrHH9NXpeIechQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhj-00000000EKh-2AaX;
	Thu, 21 Aug 2025 19:12:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5VS-0000000H5HI-13dc
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 13:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nB2t3WQDGZmyqwOWHUe4oKJKmrBX6EMje7BAzEJRWNg=; b=D8WfSHTN/9TnZ2syqgcgHFXoQ7
	6dJLJgW4y6O2swCs0DM0kDfMgLzzndOA8fQ5MIG6uNLFKhK78IdExqfGcLeNcX5Ha9A3UmzFhz7N9
	DwoYxiZ6khDQxyOO0eZzBAySWa5gSf3FAxHVtq89OT6vkQ3Ux48m08DzxhJhfzqzslamYe8R6fPkB
	fzSxn80WB5rLQmdP9GjDqLoMDr5JXcA3Xfk/e6VAAthFwSYZqo8KEylR3Kvg3Fw6UghKebEpLm+29
	1S/GC2+NNuIbnrq9+Bcbm1eIarQavqDr93NJt0VD1cFtZd82QMyjjbDGaUEzsM/K8m12uWw5Zk+Ol
	vnquEZAQ==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5VN-00000000ZeW-2FtJ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 13:39:05 +0000
Received: from [192.168.0.106] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABXR6tfIadoNV0QDg--.59898S2;
	Thu, 21 Aug 2025 21:38:40 +0800 (CST)
Message-ID: <e0d4e114-9523-4b12-bf32-22d13c7f914f@iscas.ac.cn>
Date: Thu, 21 Aug 2025 21:38:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/5] net: spacemit: Add K1 Ethernet MAC
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250820-net-k1-emac-v6-0-c1e28f2b8be5@iscas.ac.cn>
 <20250820-net-k1-emac-v6-2-c1e28f2b8be5@iscas.ac.cn>
 <cf0431cf-523e-488e-87ec-6b5a68699809@linux.dev>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <cf0431cf-523e-488e-87ec-6b5a68699809@linux.dev>
X-CM-TRANSID: qwCowABXR6tfIadoNV0QDg--.59898S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GryfZFWfAr48ZFy8AFWUurg_yoWxtrXEkF
	W0vwnF9w1DGw10g3WfG3ZF9w4DKr1kXr1xWrZrZws5Jw17AF98XF17Kwnaqr43WFZ2qrn7
	Gr1jyrWYv343ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jgPEfUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_143902_305630_68E2BA08 
X-CRM114-Status: UNSURE (   6.04  )
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

SGkgVmFkaW0sCgpPbiA4LzIxLzI1IDIwOjU5LCBWYWRpbSBGZWRvcmVua28gd3JvdGU6Cgo+IE9u
IDIwLzA4LzIwMjUgMDc6NDcsIFZpdmlhbiBXYW5nIHdyb3RlOgo+PiBUaGUgRXRoZXJuZXQgTUFD
cyBmb3VuZCBvbiBTcGFjZW1pVCBLMSBhcHBlYXJzIHRvIGJlIGEgY3VzdG9tIGRlc2lnbgo+PiB0
aGF0IG9ubHkgc3VwZXJmaWNpYWxseSByZXNlbWJsZXMgc29tZSBvdGhlciBlbWJlZGRlZCBNQUNz
LiBTcGFjZW1pVAo+PiByZWZlcnMgdG8gdGhlbSBhcyAiRU1BQyIsIHNvIGxldCdzIGp1c3QgY2Fs
bCB0aGUgZHJpdmVyICJrMV9lbWFjIi4KPj4KPj4gU3VwcG9ydHMgUkdNSUkgYW5kIFJNSUkgaW50
ZXJmYWNlcy4gSW5jbHVkZXMgc3VwcG9ydCBmb3IgTUFDIGhhcmR3YXJlCj4+IHN0YXRpc3RpY3Mg
Y291bnRlcnMuIFBUUCBzdXBwb3J0IGlzIG5vdCBpbXBsZW1lbnRlZC4KPj4KPj4gVGVzdGVkLWJ5
OiBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4+IFNpZ25lZC1vZmYtYnk6
IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4KPgo+IFJldmlld2VkLWJ5OiBW
YWRpbSBGZWRvcmVua28gPHZhZGltLmZlZG9yZW5rb0BsaW51eC5kZXY+wqAKClRoYW5rIHlvdSBm
b3IgeW91ciByZXZpZXcuIEkgYXBwcmVjaWF0ZSBpdC4KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdh
bmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
