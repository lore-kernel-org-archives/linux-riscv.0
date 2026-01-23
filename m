Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C701D74EDB
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAcqcpGcZdNJGekbtQYIWLDuu0aquGr7DDFVmhLA6oU=; b=zeLb/svYxlDf7K
	MMZOMgREFfy97Di6/Jv58jGc0Yxghhw4L4yqBzl5dkSy1x8NqJrKKW7epMHBP2zJMfsDSYY7EuLNk
	dxd18kNontNOR8WD6jTzPcZVvKehS0smcd/DAqEQyRbYsYVuHysldlUe3Oym0abPYMxF2Mpn10/eY
	oZp5xo8yCkAmalsH4tjxXsr2bRyXKhJLYBUlWyfI8vWMWHn218KLlTycda08yjn/eSQ1Gz9NvLmNq
	3U7YBAljHUBbJiHByMdYBMag+E9Ntul4n0eWMic75osns8AX6CnYGw63a4cP79vlxO4ES2GQJC/c6
	Tl5q/aCtIdjuQ/1jcdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIUZ-000000093k1-1U6m;
	Fri, 23 Jan 2026 14:50:31 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIUW-000000093je-1Qdf
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 14:50:30 +0000
Received: from localhost.localdomain (unknown [116.25.94.62])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c3675a5;
	Fri, 23 Jan 2026 22:50:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for OrangePi
Date: Fri, 23 Jan 2026 22:50:15 +0800
Message-Id: <20260123145015.1926865-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260119030251-GYD47382@gentoo.org>
References: <20260119030251-GYD47382@gentoo.org>
MIME-Version: 1.0
X-HM-Tid: 0a9beb55b3fa03a2kunmc924b17ad8fbd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkNDVkhNQx8aTUJCSE5CTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_065028_592381_5F13A5F9 
X-CRM114-Status: UNSURE (   5.61  )
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

> > +	pcie_vcc3v3: regulator-pcie-vcc3v3 {
> can you follow the same name scheme with k1-bananapi-f3.dts?

Sorry, but I don't quite understand?

From fixed-regulator.yaml:
properties:
  $nodename:
    anyOf:
      - description: Preferred name is 'regulator-[0-9]v[0-9]'
        pattern: '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
      - description: Any name allowed
        deprecated: true

Using 'regulator-' as a prefix is correct.
There are also some commits that changed regulator nodenames. [1]

As for the regulator-name, it should be consistent with the name in
the schematics so that people can look it up between the two.
The BPI-F3 also seems to have some names [2] that need improvement:

vcc_4v     -> vcc4v0_sys
USB30_HUB  -> vcc5v0_hub
USB30_VBUS -> 5v_vbus
vin-supply    vcc5v0_sys

> also please add this regulator with explict consumer - pcie,
> otherwise I see the patch isn't really useful

I will update this in the next version.

[1] https://github.com/torvalds/linux/commit/5c96e63301978f4657c9082c55a066763c8db7b1
[2] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view?usp=sharing

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
