Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBBFC9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdJlUdMCLnXuvV9ibxkUYq0yncn+M+KDCDUthPUJ/js=; b=Iq60yNyAkeplCP
	lVIm+Mw1az9q3dUXK2TcqRHdYpbcmfe4W8iA5y1uUn2ijd5jbl62So6yHiQXHt4KIJbU/SUKYkRX3
	EYOL/09OhA/v01a79YSwG/z7JT5oEwfzeIIgMUGRSBSqVK2QrlJ0D2QKOPugJaKeDyrZGInEYJreI
	oY8WX4k7NngCRjl8QK5gW5GvocEkBoGB+Eob0bTDPrn+9asd4EPORwCWrJUL4vVKTZM0hkk/tnrNU
	ZvO76bzLC/eSMeJVuJ9t1JJlfYM2yfnUhzd0yaTb3v+F1KK2d0C+gWhcGixph01RwrTEQCd0LrftB
	1OALf0ao7VnWAOJIz2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6be-000000004g8-06KP;
	Mon, 28 Sep 2026 08:21:02 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6ba-000000004PR-1ZDu
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 08:21:00 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-03 (Coremail) with SMTP id rQCowAD3AD9AI7pqv1UICQ--.246S2;
	Mon, 28 Sep 2026 16:20:17 +0800 (CST)
Message-ID: <7442671c93a4e5d4b2d1f4c377566369ab249f77.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/2] drm/bridge: th1520-dw-hdmi: Two fixes
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Felix Gu <ustc.gu@gmail.com>, Drew Fustini <fustini@kernel.org>, Guo Ren
	 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 16:20:16 +0800
In-Reply-To: <20260321-th1520-v1-0-ec877197770d@gmail.com>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3AD9AI7pqv1UICQ--.246S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r4a6rW5Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU87fHUUUUUU==
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012058_787962_77267191 
X-CRM114-Status: UNSURE (   5.84  )
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

5ZyoIDIwMjYtMDMtMjHlha3nmoQgMDM6MTIgKzA4MDDvvIxGZWxpeCBHdeWGmemBk++8mgo+IFNp
Z25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gZHJt
LW1pc2MtZml4ZXMuCgpUaGFua3MsCkljZW5vd3kKCj4gLS0tCj4gRmVsaXggR3UgKDIpOgo+IMKg
wqDCoMKgwqAgZHJtL2JyaWRnZTogdGgxNTIwLWR3LWhkbWk6IEZpeCBlcnJvciBjaGVjayBvbiBk
d19oZG1pX3Byb2JlKCkKPiByZXR1cm4gdmFsdWUKPiDCoMKgwqDCoMKgIGRybS9icmlkZ2U6IHRo
MTUyMC1kdy1oZG1pOiBGaXggcmVtb3ZlKCkgY2FsbGJhY2sKPiAKPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGgxNTIwLWR3LWhkbWkuYyB8IDggKysrKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IGI1
ZDA4M2EzZWQxZTI3OTgzOTZkNWU0OTE0MzJlODg3ZGE4ZDRhMDYKPiBjaGFuZ2UtaWQ6IDIwMjYw
MzIxLXRoMTUyMC1mNDMyNjEzOGM5YmYKPiAKPiBCZXN0IHJlZ2FyZHMsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
