Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CDFC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 01:38:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EBD5206BF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 01:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjJbaKX7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sj5suOkR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EBD5206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tKVnR+SPDvwyOiXFu7PjlCuA9bX42WhH+bw9zj8Aes=; b=TjJbaKX7GUGOl1
	XhU3IhBH+yBH7RWbc4nBXzbhCi64WJPbo0jEIh0puqcdJsxfouCnUsJcOiTHh7Rkc4irMqEkFJzE5
	Vgoh+S/KqCh4MpGMXbCVVS1OAXqiDkgbKaNCmXW/W4ODulQiGu25Ot4EjbPhPK4hrXEL/jlAg20JE
	yzbSFhA2SekYZckM5CWlOkgw8ZuNwxvrs+719f4U0jhRfhCL9srQxyUsVVUqL8KW/DTlDhvJNNaAS
	WgF5hoG8Pb4vhSQqyC0GnGQZSy4OVaYXh+EgkfToa8MqbMnhl5U5UzbgyuwjBpHemtLUdDRSJDoZv
	t6unQ5cNqeTwG0MKjLXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJpp5-0006JM-0g; Fri, 26 Apr 2019 01:38:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJpp2-0006J1-7N
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 01:38:41 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9950B206BF;
 Fri, 26 Apr 2019 01:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556242719;
 bh=d7Ir08bBi4TxEsMumxprS2fXxUkfiMgE/kM9QWPr980=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=sj5suOkRDhCCYxAvrgjb1iZT5s/Wanay10AblXBH01zNZ29HZEPhYQGo6JfxbVdJV
 s4tkKeb4pV7vS+80pITct4vvjYvKfcB785xQnG7eAN8Yk8s616nKvMCNyHAIB9sSVA
 V2353gHuQqL6RSilh3guUfmi8uMSOeN+DxkBlt94=
MIME-Version: 1.0
In-Reply-To: <20190411082618.3502-1-paul.walmsley@sifive.com>
References: <20190411082618.3502-1-paul.walmsley@sifive.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs
 it controls
To: Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com
Message-ID: <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Thu, 25 Apr 2019 18:38:38 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_183840_282545_BDBC49E6 
X-CRM114-Status: GOOD (  12.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Paul Walmsley (2019-04-11 01:26:16)
> clk: add driver for the SiFive FU540 PRCI and PLLs it controls
> 
> Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
> some device reset control for the SiFive FU540 chip.  Also add a driver-
> independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
> the PRCI driver to monitor and control the WRPLL instances on the FU540
> chip.
> 
> Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
> open-source FSBL with a mainline-focused DTB.
> 
> This third version incorporates changes requested by Stephen Boyd
> <sboyd@kernel.org> and Rob Herring <robh@kernel.org>.
> 
> This patch series is also available, along with the DT macro prerequisite
> patch, at:

Can you please send the dt macro patch along with the rest of the
patches? I can't apply these patches and build them without it.
Typically the macro patch is part of the binding patch and Rob
acks/reviews it as one change. Then I pick that up and the clk driver
parts and they get pulled into whatever SoC tree is using the bindings
header with and those defines get merged up through some other path..

> 
> https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v5.1-rc4
> 

I suppose I'll go and fetch it from here manually.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
