Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72775108B8FF
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 05:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqQmWjG76i6T2H/2TaULnMd1rZSw17cxRmZjsmVmR3w=; b=e5peT8Afuo+nCb
	6GdLIwiXYTJcfZvk1gt9UvqIqft+eAAIP3ZTKQTSnoOQqxrsrvW0UG5ol4m9by5q/RrbqXUjc6hgE
	43w/H3sgpAwtSJMCYOwcuAoyAYvXvmfvZYKMkQRQn4a8bGJmx1qE26PCIb7SoBMXM4zU/l823/7k/
	7fdn8QLopHXu3r4bzW46iS9W8KFSE9xr55CKbkeXMqaj4iRLAeF93nVLSqbxGP0IBpFmDaoqMbO0G
	AW7STKQ+5ongmrpDA5xiEI80c8Ricl50+fKir9Xtb809hG6asg3Fk4y0SVwK4wIiEIkULTG11Avt6
	aclx+Q5bHPrCgnVDLdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oWo-0000000E3kN-05pv;
	Sat, 21 Mar 2026 05:05:38 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oWi-0000000E3jY-3bS3
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 05:05:36 +0000
Received: from [192.168.1.204] (unknown [112.94.102.202])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+IHJ75pwzRUCw--.57166S2;
	Sat, 21 Mar 2026 13:05:12 +0800 (CST)
Message-ID: <4180689d3426882dcac2eb74209d398477f88b90.camel@iscas.ac.cn>
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
Date: Sat, 21 Mar 2026 13:05:10 +0800
In-Reply-To: <20260321-th1520-v1-0-ec877197770d@gmail.com>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3m+IHJ75pwzRUCw--.57166S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1fXFykWF4rAw13CF1DAwb_yoWxZrg_Za
	9YyryqvrWUAFs3C3ZxZrn8Z3sYg345JFW5Ar1DK398G3yFyrnxW3WrW395Xry3uF4qkFy3
	trn3A398C3W7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUVQ6pDUUUU
X-Originating-IP: [112.94.102.202]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_220533_284518_96EA22AF 
X-CRM114-Status: UNSURE (   6.02  )
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
Z25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4KPiAtLS0KPiBGZWxpeCBH
dSAoMik6Cj4gwqDCoMKgwqDCoCBkcm0vYnJpZGdlOiB0aDE1MjAtZHctaGRtaTogRml4IGVycm9y
IGNoZWNrIG9uIGR3X2hkbWlfcHJvYmUoKQo+IHJldHVybiB2YWx1ZQo+IMKgwqDCoMKgwqAgZHJt
L2JyaWRnZTogdGgxNTIwLWR3LWhkbWk6IEZpeCByZW1vdmUoKSBjYWxsYmFjawoKQm90aCBmaXhl
cyBsb29rIHRyaXZpYWwgYW5kIGxldCBtZSBzdGFydCB0byBkb3VidCBob3cgY291bGQgSSBtYWtl
IHN1Y2gKbWlzdGFrZXMuCgpSZXZpZXdlZC1ieTogSWNlbm93eSBaaGVuZyA8emhlbmd4aW5nZGFA
aXNjYXMuYWMuY24+Cgo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aDE1MjAtZHctaGRt
aS5jIHwgOCArKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogYjVkMDgzYTNlZDFlMjc5ODM5NmQ1ZTQ5
MTQzMmU4ODdkYThkNGEwNgo+IGNoYW5nZS1pZDogMjAyNjAzMjEtdGgxNTIwLWY0MzI2MTM4Yzli
Zgo+IAo+IEJlc3QgcmVnYXJkcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
