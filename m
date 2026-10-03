Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5960CA5FEC
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXCGkxIBvMl2ybjRUMyDt0moVFGQJvK9dS4jp+SpjdA=; b=YKxOaKAdyEZWPY
	UYYQAAIvViewcS9By+EZ+xyrSbbyoAIPIcVr5PHoCUupn5H0vNFngM0LZlqSy3EEMatpdbhEY/qcm
	FA59QfEF1xXrAZVW5FbKucG9r0YwySMSLisTkxaOOf2G1D4aRj0MhxyLkRibqkZ8EfrWn6wReTp8v
	39USuzABY0JhZAXOPCqTtdZ7sVgh0AqetjPO5cjtKG9IEQ8pvdlxlaQIPekDaIwFlxtr7pJzBxPFY
	m2DdElA0KNRTctJlb4m4Nf9tFrNnfBAhQsySSZnXaZHvgR6+ux1OjUcI6dYlKEbHBMT7aZzxYbEe/
	Kmx8on5/Ma4aB4nrzbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2fD-0000000Dktc-1s9B;
	Sat, 03 Oct 2026 16:32:43 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2fA-0000000Dksj-15LV
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 16:32:41 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5d082395235so213819e0c.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791045159; x=1791649959; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6IGX+v8BkO6n9pIMVGytNElaq/yPQhIUaLvSvPAc94=;
        b=Qgp5WSQCbi2e79/84zcvp3gkTcPAFMJFD0MUoSh+KgO5RdNjQx8vsVhTNvzQzhVmO8
         Z3Gf1+MbY8jl3s63AYnyez93BrfbXiIUxvM0myiuleGa1lqFm2N+UXJG/w8xA2+c5YUq
         xjU6FjVFL9MviOpZtInkMchdh67FMLop6dp5oNt6WCGj0JNfXKgPhRVnfFApe3J8Lcxr
         Ce3G3yIdzezEwVmhwUUiQFIaqN0vy4wunOE56K2h9NTTqnH2vyYNV2CmwYAwjaSkrlhL
         YK9alHLDTnKODHqF46BJLLwPIqIxqor7Y2RbK2tVNR4emBWtCkAlZfMm5QyS+TVZi5Yr
         HiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791045159; x=1791649959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6IGX+v8BkO6n9pIMVGytNElaq/yPQhIUaLvSvPAc94=;
        b=TMcGiWllJ+iJJlyjfVK9r9JfDtVapmTHhnY9w0ThwnaJanKwUurIpoVv68rJK3niKB
         PMm+H6tuFnKHN0szmbJb51TlNqDD364kY0K4quNn3sgdD5OHCQBL2B8O7d0pvQoKjODU
         m6ukN9qIT89pQGrVkaWAUSc47BD9C8yo8NDDnjGYFV53Y2yMa10xG18tQl+xJ9/vX83q
         +hu3lCW8Iy2LJ8ExbB+fqJ/W38YviTHQOkaPdHH0xATx+BQ+iOOXoqHuXb5hXTaoidbH
         NDWL8yAEqRd3HBgY3O044rzS3MekaioYelUOsoWgmmmE3cToYeNBfTSGWT0Y9aUG7ca1
         n18Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWBjgoL/dLDXtP800FXSjRtPKzc1uL7ij7eFL5ifr1UJUt74qhEkVhA/p3hwNyQe6jlH0KT7XH+rf2GQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3oj/0ZqZ7y6MMdTexkwJRoREkhSSUeiDhfZhQ1z0T+hZX2Alq
	SrN+xz7cfT7v+HRPlRPdmg6gmsOnLuj+sz0CfzLYyqHmKKsWOsT+EdHDxXVWZkSEp6w=
X-Gm-Gg: AYBFou24WrGBe+moRM97lbOJPq4taoty+Ie3OQ61khhJ4vdUmk49j3ESSFZlTtfGkps
	qqKTyMoyGQvQVFlrlJkNzjG3Cc3ujdRIiNIW9+ga9w462r/tTDS2gYuR3tVsCDu/3h43eNChgoD
	5UVObQ+Tbrk7r+RO1FqhLx3+UTokMW8FoKM629WeeRy0w7X70A5xvrhBQng07g8ar3/sjEsBicJ
	kWT9xL7HfQqtcTMFyVHpZT1EYBeVzngSb9pINJPg0AB53GOJKRKTVoCbNnVVXPVfYqGrOhT675H
	OINAevTcTmr+AH4+HDAOWtxWM1dY7ADhAWm+TiEWyKtmNHeZ/nSUmhCHAY40AR65806cwPfgT6m
	Mp/8TcKQqKDJ0p1UeXasBvFDrj2zHjkSwsKX9TERBHnXwyAOje2in8mZzqLgisfNR4FrTTW62CO
	KZ+3jbhprQUD/GEOiuiLGKA7VrvgV0HL97T/f0FlfmZqFmuppoIaqgaVGr5nBT5yf3ua5hhGk1d
	MLJTZ5rjQXZQPtL7Q1H4Q3fYoGK402Nu64lXAdNVs355/4GCyw=
X-Received: by 2002:a05:6122:35cd:b0:5d8:20d9:78f2 with SMTP id 71dfb90a1353d-5d820d97a5amr2139563e0c.14.1791045158975;
        Sat, 03 Oct 2026 09:32:38 -0700 (PDT)
Received: from hiagonb ([2804:7f0:9541:40e1:2108:ffa6:f94b:baff])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm7442753e0c.15.2026.10.03.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:32:37 -0700 (PDT)
Date: Sat, 3 Oct 2026 13:32:27 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Joshua Milas <josh.milas@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet
 support
Message-ID: <asEsCbfKIkXPAyCh@hiagonb>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_093240_346485_4498D7F1 
X-CRM114-Status: GOOD (  23.65  )
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

On Sat, Oct 03, 2026 at 04:46:24PM +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v2:
>  - Enable Ethernet through an overlay instead of in the board
>    devicetree, since without the IO board the pins may be used as GPIO
>    (Inochi)
>  - Send both patches in one thread (Inochi)
>  - Test link-up and traffic on the IO board, which v1 could not
>  - Collect Inochi's Reviewed-by on the PHY node name fix
> 
> The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
> two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
> so covers that board as well.
> 
> Testing, with a kernel built from this branch:
> 
>  - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
>    address via DHCP and passes traffic
>  - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
>    reads back as disabled
>    
> Kernel log with sg2002-milkv-duo256m-eth.dtb:
> 
>   [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
>   [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
>   [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
>   [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> 
>   # ip addr show eth0
>   2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
>       inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0
> 
> With the base sg2002-milkv-duo256m.dtb:
> 
>   # ip addr show eth0
>   ip: can't find device 'eth0'
>   # cat /proc/device-tree/soc/ethernet@4070000/status
>   disabled
> 
> iperf3 against a desktop on the same switch gives 94 Mbit/s with the
> board sending and 70-74 Mbit/s with it receiving, with no
> retransmissions either way. The receive side being slower is not a CPU
> limit on the board; I have not looked into it further yet.
> 
> v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>     https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/
> 
> [1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/

for the series,

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> 
> Chen-Yu Yeh (2):
>   riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
>   riscv: dts: sophgo: cv180x: Fix internal ephy node name
> 
>  arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
>  .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
> 
> -- 
> 2.43.0
> 

Best regards,
-- 
Hiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
