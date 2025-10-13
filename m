Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBA8CCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PNUZlsU5izzXmY6bX+BZbosh7ETZWEuVIi9YGYo9XE=; b=vKKzrie/PE9U5J
	dht/u/ES1DyIyjsks+rNJuzdYhyDBM5gAdGL4m7DwDFgqF76C9zrcG+boS6vKaEfD/9HtZjRoK129
	fzWhrVAhZN+TBeb9AdDqDPAE49rhVYTPJIrIDDZj9RxDmIPzN20D5x0o+kvaWikmw/wlNA1+610kt
	MSi+w2dhVrQGWCBKvc1B2xFjWbrA/Q5Qsa1jurnb+PXhmde3bwwjXK31QhasnGSmNRbZlZnPL6tMr
	fWpziEhG+8Y72OdIeOozfhMTrVVnEeDJPLyWPMxCeiD4tfK7yHnVsOAuJOnOivG+jPE+rq75inlvA
	9pC6oGsT6QgIqrcQrWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LDg-0000000Dq5u-08xo;
	Mon, 13 Oct 2025 16:16:20 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LDc-0000000Dq4W-1XCy
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 16:16:18 +0000
Received: from Mobilestation.localdomain (unknown [183.6.60.79])
	by APP-05 (Coremail) with SMTP id zQCowAAXuxTCJe1o46MZDg--.16717S2;
	Tue, 14 Oct 2025 00:16:04 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: ajones@ventanamicro.com
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	shuah@kernel.org,
	zhangyin2018@iscas.ac.cn,
	zihong.plct@isrc.iscas.ac.cn,
	zihongyao@outlook.com
Subject: Re: [PATCH v2 0/4] riscv: hwprobe: Add Zicbop support
Date: Tue, 14 Oct 2025 00:15:59 +0800
Message-ID: <20251013161600.28841-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009-440720dc2e40b8a0b8296956@orel>
References: <20251009-440720dc2e40b8a0b8296956@orel>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXuxTCJe1o46MZDg--.16717S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYB7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI
	0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [183.6.60.79]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_091616_797507_F688632B 
X-CRM114-Status: UNSURE (   4.18  )
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

SSBmb3VuZCB0aGF0IHRoZXJlIGFyZSBhIGZldyBkaWZmZXJlbnQgc3R5bGVzIGluIHRoZSB0cmVl
LCBidXQKZm9sbG93aW5nIHRoZSBaaWNib20gZXhhbXBsZSB3b3VsZCBpbmRlZWQgYmUgY2xlYW5l
ci4KCknigJlsbCBzcXVhc2ggMS0zIHRvZ2V0aGVyIGluIHYzIGZvciBzaW1wbGljaXR5IGFuZCBj
b25zaXN0ZW5jeS4KClRoYW5rcywKWmlob25nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
