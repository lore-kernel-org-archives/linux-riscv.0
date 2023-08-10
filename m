Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D51C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 07:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i6QDlZm3VFCpJg6CHLxDIrNZHgEYbZCxIEa9gGXHNq8=; b=GWDIW55DN8AYwU
	c5OId2bHhHk/eb9GrQ5BzNlMMpBWHZNBaalDuIB5Mhp2fIXHMCIm1vi13b4yVEpKFmDHLelB35VzW
	tt2zB84KtcjROo1JQqEWEb7WAf4J7SpAyiMWXyMG0n6GN+mw75uZ6MpnTEq5tNFE9kfNzUyjRpvOS
	zy91eQAr4JlqFWYnJ3/rGMW+OhiA9tn5MrwZUc5l/sRzMrpIbHXOeNxtkKrpDziOLfFPSUYCumTTP
	VLFMmUwFmL/gTDmF0qixOh8Nf0IqCDUSINrozdo0qMxP66ZB8Kyd2VcMDru6kVtdmwQLe+Kz45qJ2
	JZKb20oZlACaIffuo9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0OR-006mbL-2q;
	Thu, 10 Aug 2023 07:47:39 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0ON-006mVW-2C
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 07:47:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DEBE78565;
	Thu, 10 Aug 2023 15:46:47 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 10 Aug
 2023 15:46:47 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX062.cuchost.com (172.16.6.62) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 10 Aug 2023 15:46:46 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Samin Guo <samin.guo@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>
Subject: [-next v1 0/1] Fix StarFive JH7110 gmac TCP RX speed issue
Date: Thu, 10 Aug 2023 15:46:45 +0800
Message-ID: <20230810074646.19076-1-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004736_116781_2FF692B7 
X-CRM114-Status: UNSURE (   8.12  )
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

This patch fixes the StarFive JH7110 gmac TCP RX slow issue. And it has been
tested on VisionFive 2.

Here is the result of the test (iperf3):

  Before:
      # iperf3 -s
      -----------------------------------------------------------
      Server listening on 5201 (test #1)
      -----------------------------------------------------------
      Accepted connection from 192.168.1.4, port 47604
      [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47612
      [ ID] Interval           Transfer     Bitrate
      [  5]   0.00-1.00   sec  36.3 MBytes   305 Mbits/sec
      [  5]   1.00-2.00   sec  35.6 MBytes   299 Mbits/sec
      [  5]   2.00-3.00   sec  36.5 MBytes   306 Mbits/sec
      [  5]   3.00-4.00   sec  36.5 MBytes   306 Mbits/sec
      [  5]   4.00-5.00   sec  35.7 MBytes   300 Mbits/sec
      [  5]   5.00-6.00   sec  35.4 MBytes   297 Mbits/sec
      [  5]   6.00-7.00   sec  37.1 MBytes   311 Mbits/sec
      [  5]   7.00-8.00   sec  35.6 MBytes   298 Mbits/sec
      [  5]   8.00-9.00   sec  36.4 MBytes   305 Mbits/sec
      [  5]   9.00-10.00  sec  36.3 MBytes   304 Mbits/sec
      - - - - - - - - - - - - - - - - - - - - - - - - -
      [ ID] Interval           Transfer     Bitrate
      [  5]   0.00-10.00  sec   361 MBytes   303 Mbits/sec        receiver

  After:
      # iperf3 -s
      -----------------------------------------------------------
      Server listening on 5201 (test #1)
      -----------------------------------------------------------
      Accepted connection from 192.168.1.4, port 47710
      [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47720
      [ ID] Interval           Transfer     Bitrate
      [  5]   0.00-1.00   sec   111 MBytes   932 Mbits/sec
      [  5]   1.00-2.00   sec   111 MBytes   934 Mbits/sec
      [  5]   2.00-3.00   sec   111 MBytes   934 Mbits/sec
      [  5]   3.00-4.00   sec   111 MBytes   934 Mbits/sec
      [  5]   4.00-5.00   sec   111 MBytes   934 Mbits/sec
      [  5]   5.00-6.00   sec   111 MBytes   935 Mbits/sec
      [  5]   6.00-7.00   sec   111 MBytes   934 Mbits/sec
      [  5]   7.00-8.00   sec   111 MBytes   935 Mbits/sec
      [  5]   8.00-9.00   sec   111 MBytes   934 Mbits/sec
      [  5]   9.00-10.00  sec   111 MBytes   934 Mbits/sec
      [  5]  10.00-10.00  sec   167 KBytes   933 Mbits/sec
      - - - - - - - - - - - - - - - - - - - - - - - - -
      [ ID] Interval           Transfer     Bitrate
      [  5]   0.00-10.00  sec  1.09 GBytes   934 Mbits/sec        receiver


For more information and support, you can visit RVspace wiki[1].

[1]: https://wiki.rvspace.org/

Samin Guo (1):
  riscv: starfive: jh7110: Fix GMAC configuration

 arch/riscv/boot/dts/starfive/jh7110.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
