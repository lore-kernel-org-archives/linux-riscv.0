Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F69D262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpmfIvYFYygl3odrH5i/7Lx6kAWedPBO2YpS51WbNDY=; b=1Tj9JkgN8l+qzU
	Vp3y+2bhI7Nywc9Nll20SSY6JuVsb+hDTfUI08gvUf5FyfZ3S+jaxc0VU+5SJPiw//JYO+nR5a0BH
	a+5+ZfpY8pdAVwKygyIb+7286m00Iv1VH7OWFqqQXlOPPnjb7AUlG3g9jGRqrN+nKKNN85wmK95l5
	UNIc305ZFv5j9RfVwgWTcrwhOlK45QD6pxECZfewp6p9ciEpPU5Ts037E7TWl9SxACnNbmAaSriCZ
	+P9TIygHl+FvFpiYcIC+uDQEHXFZ8Q3Bn368FtycVRvUerXkNeRgH0xThO40oT9jclKH62tc6kaG+
	uzst/BzYudicPUGHZGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viS8Q-00000004yPV-3dpT;
	Wed, 21 Jan 2026 06:56:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viS8O-00000004yOt-1BNn
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 06:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57ACF41A03;
	Wed, 21 Jan 2026 06:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA81C116D0;
	Wed, 21 Jan 2026 06:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768978566;
	bh=yOVaNladVEcNrJfwkbxw/j7oi6o2x8nlGkpscTpRLgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlTpD4+yIL0mM3n1qXpxh2CplqAAt2MHScyfFqj6aSHDC4qTGVJkR/1WGdRJ4tAf4
	 aBJGz0QImBlSgJsavzIberDdMg6nmlWQ8Zttr75aK7LQ0NVmJkFbO1H8itJsn47y92
	 qE6XKTiuFKexUmUwT69PWv+t1N9UalMMR1W5c5fFSfOW3qsR0qwYjn6eEZxaXLccmB
	 4xbH/fOvt63lJiLyXkop8GcrE3N0K1LphPHVoz7Kqqdxw54nRfB6AQkmER8jzrlzs0
	 NGqG9fh2FBvjcYwrM+Pz9xfRMw0jV/x/O7Lc6XDD/XeiLi2Q1wQ4Mhw5L6R0v7v6dd
	 LQhxd0XL8GVtw==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 0/1] riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi
Date: Wed, 21 Jan 2026 14:55:53 +0800
Message-ID: <176895691233.28343.4094639440954032303.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120100001.1285624-1-amadeus@jmu.edu.cn>
References: <20260120100001.1285624-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_225608_339500_F6A3479B 
X-CRM114-Status: UNSURE (   5.71  )
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


On Tue, 20 Jan 2026 18:00:00 +0800, Chukun Pan wrote:
> On OrangePi R2S and RV2 boards, when the interface link down,
> reading statistics will print several timeout logs:
> 
> root@OpenWrt:~# ethtool -S eth1
> [   71.725539] k1_emac cac81000.ethernet eth1: Read stat timeout
> NIC statistics:
>      rx_drp_fifo_full_pkts: 0
>      rx_truncate_fifo_full_pkts: 0
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi
      https://github.com/spacemit-com/linux/commit/5164e95565d3fd508ca8a95351323f5716dfb695

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
