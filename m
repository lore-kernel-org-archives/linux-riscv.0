Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223F5C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpQgJUDPQHLgCOSsT4oeXM+24OdaA8lfb0ll1VkIMLo=; b=uqmU2+PMTnUUB2
	XAy3t2ek6MZcY9gjVTKobNzHMBWjyJRaEjjxD/yWm07wiegjccJeftVn3HzUuschSSaI/dyszz/gy
	jxKyDNiw4ZhA65wSsbsatxvZddWEJwJTxZIBgh734F+4wBFCJTP9W8Zcfb0wF6Z2Ii/fxlGqGIk8C
	AJtox5e+qjWCVrUqTxVH8Tk0w45KlcjihcFkGSzoOOvL3nOaf0Vh5COKHVwr9Lb7f+lISlZkfKcKT
	9i2Qn185wn3v8iKmp14ihepa0+udkMK4w1q8aUfbEEKs4bMIim7TpaDAI/jIrpWZ7Eu8m1AqfEext
	99A7E2rpN/brzraG2Vng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7jE-0083hh-2v;
	Thu, 10 Aug 2023 15:37:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7jB-0083g9-2t
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 15:37:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37DF466040;
	Thu, 10 Aug 2023 15:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE06AC433C8;
	Thu, 10 Aug 2023 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691681852;
	bh=L0JsfUS8p25f+d3PZHsFgozKJuVZBca+0cwe9Igyejg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DA4t/dbhdtsbR6tiYTlI71TTFx7W8xv6Q0CUs8rU0/+v+I1azT3SQneIY8X3s5nJ1
	 dMlqsF4RdDvx2NPGykU7egEiFdF5lhIIHCpiUbL260pbLhxqsHzOc67Ytj8JbGKVL0
	 Dp606sCLyjkVnJMEDeykJXEINtIneHJcCtBNQ3/ILnPnNfEIMWCcTfjPvIeSd25NPw
	 Zh7Aj1dHT2M0tDXWYqnax3wdh0DPJYNFEW3crdqQdd2FvYNs82iaQaOhkq2uGygskm
	 RgDygbU8jDkDoFKUGSv71WfjV16mAT2degv+HCzvRcwh64v1LbAd+/5J9ktdC6IHl8
	 O596pSd4L/OFw==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Samin Guo <samin.guo@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [-next v1 0/1] Fix StarFive JH7110 gmac TCP RX speed issue
Date: Thu, 10 Aug 2023 16:37:13 +0100
Message-Id: <20230810-cresting-talon-51a6c31da4f8@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810074646.19076-1-samin.guo@starfivetech.com>
References: <20230810074646.19076-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0Tr68Xd8hSRu8rUov59X+oljjBng5+GIs9HgXSz7jKs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClXWdQNNupuq1t+dKJetmZ0PX/MGqcnYVu+Pw0/Jtx+R pc5JOJwRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbyoJzhr6i3XkV+T9+uLnm3 ksh1KWoiWZan3+Xvdp08a8Fbhe6XRxkZDnr42Mjpldm1GRrV5tRt2O1aKBbx7knz18hzwezcDw2 ZAQ==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_083734_026051_EE52E990 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 10 Aug 2023 15:46:45 +0800, Samin Guo wrote:
> This patch fixes the StarFive JH7110 gmac TCP RX slow issue. And it has been
> tested on VisionFive 2.
> 
> Here is the result of the test (iperf3):
> 
>   Before:
>       # iperf3 -s
>       -----------------------------------------------------------
>       Server listening on 5201 (test #1)
>       -----------------------------------------------------------
>       Accepted connection from 192.168.1.4, port 47604
>       [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47612
>       [ ID] Interval           Transfer     Bitrate
>       [  5]   0.00-1.00   sec  36.3 MBytes   305 Mbits/sec
>       [  5]   1.00-2.00   sec  35.6 MBytes   299 Mbits/sec
>       [  5]   2.00-3.00   sec  36.5 MBytes   306 Mbits/sec
>       [  5]   3.00-4.00   sec  36.5 MBytes   306 Mbits/sec
>       [  5]   4.00-5.00   sec  35.7 MBytes   300 Mbits/sec
>       [  5]   5.00-6.00   sec  35.4 MBytes   297 Mbits/sec
>       [  5]   6.00-7.00   sec  37.1 MBytes   311 Mbits/sec
>       [  5]   7.00-8.00   sec  35.6 MBytes   298 Mbits/sec
>       [  5]   8.00-9.00   sec  36.4 MBytes   305 Mbits/sec
>       [  5]   9.00-10.00  sec  36.3 MBytes   304 Mbits/sec
>       - - - - - - - - - - - - - - - - - - - - - - - - -
>       [ ID] Interval           Transfer     Bitrate
>       [  5]   0.00-10.00  sec   361 MBytes   303 Mbits/sec        receiver
> 
> [...]

Applied to riscv-dt-for-next with the conversion to decimal, thanks!

[1/1] riscv: dts: starfive: jh7110: Fix GMAC configuration
      https://git.kernel.org/conor/c/1273f7e96a70

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
