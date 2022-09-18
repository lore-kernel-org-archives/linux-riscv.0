Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F38EC32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 05:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MeuoxSi1/dHlh7q88KvTzg5drXec4sJqyszli4+0mk=; b=y7kfod0MuWRtev
	DD41tfNdv18O5Vwm8Dei9mTwgE6LaDUIt1mjPH1/e0cxKuFI5iNXKgKaUCY0fAHlTo8JH4+6xiHeD
	5BpOwW+7TB6ARMyT7lT9yJ+K92nnVh7gEJ9jcp1dxcAYdnKVIvFAhc98MzsxjJlG/VS1o6FeFNyA2
	agEYvpxqdqa4MMcLhVrL6FOdc6MPFrcv3DiTPD2FXten100zeFiPt8Q+5wE7p6244fxBuNX/XXDDS
	Im80yplZ+eX4bxYDNr4R2DwemQqzTT9YweTL5EaMrdReAMTQQ4VhyQag0YW9PsOr6nrRKGbGdSeH7
	XngOuHlOJDjTL9bRaJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZn6J-00Chib-RA; Sun, 18 Sep 2022 05:44:19 +0000
Received: from m12-18.163.com ([220.181.12.18])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZn6G-00Chg9-Fn
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 05:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=L6ozd
	f2KEmZz6UdpG0ZFUAYyo1y/S2z5zIIgU4sBd3U=; b=RdipC916B6Vq0ycKjdLVm
	coQgs0f83PShXFwrAU1OWVxhXjs5NzejcCqEF3i7sQPsg83nTs0T4mo3jsQxhyu4
	KWA9cj5AF87zyyKw+lL4iGvhz3XDAjehTLCCZUEx4lP9i5a+9ysWmhtGh74dayTD
	Ad8ZW/mFntYEJkKEIGGKlw=
Received: from whoami-VirtualBox.. (unknown [223.72.42.150])
	by smtp14 (Coremail) with SMTP id EsCowAC3iQ8CsCZjC0f0AQ--.46422S2;
	Sun, 18 Sep 2022 13:43:31 +0800 (CST)
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
Date: Sun, 18 Sep 2022 13:43:29 +0800
Message-Id: <20220918054329.23783-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906144126.3enx6y2mhevrc4ur@kamzik>
References: <20220906144126.3enx6y2mhevrc4ur@kamzik>
MIME-Version: 1.0
X-CM-TRANSID: EsCowAC3iQ8CsCZjC0f0AQ--.46422S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU7F4EDUUUU
X-Originating-IP: [223.72.42.150]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbipQOAeFUMmfRvCgAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_224416_858216_05BDC4C8 
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
