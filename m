Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBE7C6FA86
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 05:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MeuoxSi1/dHlh7q88KvTzg5drXec4sJqyszli4+0mk=; b=wYjOOo78QraraM
	m8KuFHtUEKm/RIrzFyQmCkGz4xbtLOaER09c1StJz+w3EJEbZQyxXSrhRzEiWGZY5VT7zSgTVf7jW
	A3LfzjIdt09x9Ep10HuCPApRYtDy8i+mWGfZILwiqbRp/TU5KlBknwMrXZhA9UUuiuRYTl1bwObGC
	13s2KUFMoFvefBZTRl+JmNwkMqlhIMFQ2i0M5Bfqo2kHHxpSjz+dptOi/GNJ66FxU5aWGQALVA1DG
	HOgi7f9njtmXzYmOn8Vv4qVXACKssiR4GukEpXOBB7jib5FpQwY1N3VtiFwck6HI8aLfbxrrk5nbc
	KR3oku/fTG2q8sIXE1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZn2s-00CgAd-Ov; Sun, 18 Sep 2022 05:40:46 +0000
Received: from m12-18.163.com ([220.181.12.18])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZn2q-00Cg94-8R
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 05:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=L6ozd
	f2KEmZz6UdpG0ZFUAYyo1y/S2z5zIIgU4sBd3U=; b=cB/SHauBNTDI60CHd8iYl
	UZfqQ/FErKjmJu0AliQT/ISy6hfUMpj5xO/HpNVCnrBBVso3fpkrSsgM3GQ/kmpJ
	NvkuiYb/lTc3XlsfOhq3pAmMXj30rDUqAa0vgcq9ulisQFYY1Hc3j05c5cEg2r2t
	UfY6DbcdW3fN4f31ydrrS0=
Received: from whoami-VirtualBox.. (unknown [223.72.42.150])
	by smtp14 (Coremail) with SMTP id EsCowACn1zMUryZjQMfzAQ--.48323S2;
	Sun, 18 Sep 2022 13:39:33 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: ajones@ventanamicro.com
Cc: akpm@linux-foundation.org,
	alexandre.ghiti@canonical.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	falcon@tinylab.org,
	guoren@kernel.org,
	heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	sunnanyong@huawei.com,
	tjytimi@163.com,
	tongtiangen@huawei.com
Subject: Re:Re: [PATCH v1] riscv : support update_mmu_tlb() for riscv
Date: Sun, 18 Sep 2022 13:39:30 +0800
Message-Id: <20220918053930.23380-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906144126.3enx6y2mhevrc4ur@kamzik>
References: <20220906144126.3enx6y2mhevrc4ur@kamzik>
MIME-Version: 1.0
X-CM-TRANSID: EsCowACn1zMUryZjQMfzAQ--.48323S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU70eHDUUUU
X-Originating-IP: [223.72.42.150]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiVhWAeFqzt7lobAAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_224044_657917_6ED1CDBA 
X-CRM114-Status: UNSURE (   3.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Jinyu 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
