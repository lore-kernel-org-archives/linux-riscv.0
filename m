Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A5CCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 06:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JgnyjPYcCOALQuiM7aSwndDxiwr/vPEFBVFuX1bID0=; b=2TOGin5ZBihNr+
	SE5a9gXkFx3kN+ROk4ddLmotdrsq6MdY/GzjCqG9j7xcmTaQSh1qJkVoJgPgukfTMbOZLANUcKEN/
	Il3X/inkVi/+3oEM16Wx5Ttec7NZQJgS0CEjmUGDqoOkKDorU+g6nvB2TBv0LOrSBcu/kep/H2gmH
	ssWExFm7gbKQToPrZH5mkdSyHhy90YOnJ5gqNjcvFt1z/aMxw21oW8VKFlVHqPhK3ohkQrSU7FhbS
	XyZwzj+VwWqFhDYM3QRByvpOPbTzyVN/lh6CNkjN4u0UxPozb4z6IB7tUj50VCmIK2ZrDP4afA4Ks
	3ueTjYVVd3CNv7nam5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBC3-00000008LI6-2uDu;
	Fri, 24 Oct 2025 06:22:31 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBC0-00000008LH2-3jST
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 06:22:30 +0000
Received: from ofsar (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E78B4340F69;
	Fri, 24 Oct 2025 06:22:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	michael.opdenacker@rootcommit.com
Cc: Yixun Lan <dlan@gentoo.org>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/1] Add Ethernet and PDMA support to OrangePi RV2 board
Date: Fri, 24 Oct 2025 14:22:11 +0800
Message-ID: <176128683756.231420.15637681703914919807.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_232229_053513_3A4D393B 
X-CRM114-Status: UNSURE (   6.38  )
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


On Wed, 22 Oct 2025 20:18:30 +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Reusing DTS code from the BananaPi F3 board.
> 
> iperf3 tcp performance results:
> 
> Eth1 client test (iperf3 -c <server-ip>)
> [  5] local 172.24.0.2 port 41914 connected to 172.24.0.1 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   113 MBytes   946 Mbits/sec    0    378 KBytes
> [  5]   1.00-2.00   sec   112 MBytes   942 Mbits/sec    0    424 KBytes
> [  5]   2.00-3.00   sec   113 MBytes   947 Mbits/sec    0    424 KBytes
> [  5]   3.00-4.00   sec   112 MBytes   939 Mbits/sec    0    445 KBytes
> [  5]   4.00-5.00   sec   112 MBytes   944 Mbits/sec    0    445 KBytes
> [  5]   5.00-6.00   sec   112 MBytes   937 Mbits/sec    0    445 KBytes
> [  5]   6.00-7.00   sec   113 MBytes   944 Mbits/sec    1    445 KBytes
> [  5]   7.00-8.00   sec   112 MBytes   936 Mbits/sec    0    445 KBytes
> [  5]   8.00-9.00   sec   112 MBytes   943 Mbits/sec    0    445 KBytes
> [  5]   9.00-10.01  sec   114 MBytes   944 Mbits/sec    0    445 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.01  sec  1.10 GBytes   942 Mbits/sec    1            sender
> [  5]   0.00-10.02  sec  1.10 GBytes   940 Mbits/sec                  receiver
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2
      https://github.com/spacemit-com/linux/commit/9813395078352fed03c88742bd39b9c4a0e40c15

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
