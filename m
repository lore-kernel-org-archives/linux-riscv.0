Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF8DE9538B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrIlbQqhXC8ZTZuPGvQoPYQYguVTX2efn3U7JzGh4gI=; b=tpP7sLrpGPTSLK
	6IPRL3RnMbKDc1ZFyPJ/hzcEhZdXCOmkjztNX/PXgHSA7tUEQKnvr/SWrFhDPriBQB4yOxOWP1XND
	i+6Wg4Ks1R6YtYN2v9WSKycEpBcD8zEGjB8+Qu6dOfMzuzzqws9wxOl3F7CAIEk744mafa9h2T7DA
	B/9Tvxtny+Cib000ZKoA15QFAC6VBFlPWKOFfzIWrm3QhyY+stObpO7wpRuawSwdeVn0JufWfXC5g
	mqOtjihfqoyoSc4x4saoDzVBv94xlfJ/I4IpOAAp2PV0ynCZMs4NqsItawtEKXiejNEw31X8x+1MR
	te/tMJLwg0+LxdLGckOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndHU-00000008Y63-31g6;
	Wed, 04 Feb 2026 13:50:56 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndHP-00000008Y4x-02gn
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 13:50:54 +0000
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 331d2b19c;
	Wed, 4 Feb 2026 21:50:41 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 6/7] riscv: dts: spacemit: Add a PCIe regulator for OrangePi RV2
Date: Wed,  4 Feb 2026 21:50:32 +0800
Message-Id: <20260204135032.46172-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fbeb8b9f1c3453cb6907247aecbf62675d2e9de9.1769895215.git.gaohan@iscas.ac.cn>
References: <fbeb8b9f1c3453cb6907247aecbf62675d2e9de9.1769895215.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9c28eb639203a2kunm98d059402ccf93
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGE5JVkNIHRoaGU5DTRpNTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSUJNSEpVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_055051_271115_0EF62A4E 
X-CRM114-Status: UNSURE (   4.46  )
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

Hi,

> Define a 3.3v fixed voltage regulator to be used by PCIe on the
> OrangePi RV2. On this platform, this regulator is always on.

(...)

> +		regulator-always-on;
> +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;

Why is this regulator always on?
It is clearly controlled by gpio.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
