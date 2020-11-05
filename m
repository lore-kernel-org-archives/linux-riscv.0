Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F02C00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:33:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76112078E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ie3Edq38";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UAhn6Td4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7k7a3BC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76112078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=24puKQXu3mMQlSg/SOhV4WkslM5dZ5+opbD/QcuQ+ik=; b=Ie3Edq38ItLAE516ac9NlN4s1
	ipqoaHjlwHl+AoL4RHFmhjGSzdtjA+C3M0WclkdqROGD8ojS76kGp5ue13tD/sHDVDTQ2oE95VX7d
	5JvVwhCssmRjLZVhRNL+XI3S8X2Dh9KRZdi1HKXg04krrCuYqCPJ3Qnr2Oi70kgagroZFnyX9c2XI
	nxXV5l4D8Z475J6R7PUiYk8l9ubIDHPdP5rHSIrr1nQD8rqRzRy3pN4qSVwhR0gtEZUSjlosN/dMa
	urEBeRvNpaci9xEAcTS5GJzAzICH7xjbGc8E06aceAvj0EeqfqgX6pHFihLcbu5coUDSKXIjCde6y
	+ROkqx/gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaW1B-0001N4-50; Thu, 05 Nov 2020 03:32:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW16-00016k-9g
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=pyiEt+qxceUiFEzH8s2GH0BBggrs6FB9y6TjoaIXOCE=; b=UAhn6Td4mqGaQUmUmubhBO5YMo
 DPyJxnfzMJaHpcprH9P8iPWekTG1wVZ1awL/do4WsQsPTLhiDKAkfhSpwYiemNgvGaFf/91iMnU2s
 yFN30HI09q37ZUwQB0uP/0xHiIHslVmTLLbE0DV2TNzReRV3agVa7tk/EvuIz4ktQJ8+IScrrbLJS
 jS0EVdDUmz9LbOs8DFHBR7bPv9GQtlSLXEYckSYvz7YOvmLzaaI9xrIo+6ZjAswpp+PPVbXy2m46N
 XiXvUmMQC0aBLbzjQRoM9V5bUqXrXgFQ7wonyY9zNIKff+7KFTSEDq1+BZUsrS3Q5laEkiCaIhcR8
 0z7fJVfg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaVIl-000088-E5
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 02:47:05 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBCD3207BB;
 Thu,  5 Nov 2020 02:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604544417;
 bh=latL1K3uBvpZ46MD7GD39fenbWIQylUyOF7tssY/na8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=j7k7a3BCXdmFXHRjEkR+nUanUPG7bBo8AypRT5JyDONuCrMXCS19mzAnkj9RB1PBC
 P4eXA7A7niOzVfeozB1wQpzCz6Lon0EUbNuzCZ/a5MNa1N0rDYxR5e713uuVc9By2d
 GY98O/1xDeBXuh6zPDsVIG7SS9N6NG8Q7IWhJa/4=
MIME-Version: 1.0
In-Reply-To: <691e24d1c45a4b56b57ce1e02a04268c4253a77d.1602838910.git.zong.li@sifive.com>
References: <cover.1602838910.git.zong.li@sifive.com>
 <691e24d1c45a4b56b57ce1e02a04268c4253a77d.1602838910.git.zong.li@sifive.com>
Subject: Re: [PATCH 2/4] clk: sifive: Use common name for prci configuration
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, yash.shah@sifive.com
Date: Wed, 04 Nov 2020 18:46:56 -0800
Message-ID: <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_024703_811885_8DD5140D 
X-CRM114-Status: GOOD (  14.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-10-16 02:18:24)
> Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> patch is prepared for fu740 support.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---

Looks ok but needs an ack from riscv maintainers to go through clk
tree. I was worried it would break defconfigs but it seems that the arch
selects the config so this should be OK, right?

>  arch/riscv/Kconfig.socs     | 2 +-
>  drivers/clk/sifive/Kconfig  | 6 +++---
>  drivers/clk/sifive/Makefile | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 8a55f6156661..3284d5c291be 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -5,7 +5,7 @@ config SOC_SIFIVE
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select CLK_SIFIVE
> -       select CLK_SIFIVE_FU540_PRCI
> +       select CLK_SIFIVE_PRCI
>         select SIFIVE_PLIC
>         help
>           This enables support for SiFive SoC platform hardware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
