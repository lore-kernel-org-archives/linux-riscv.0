Return-Path: <SRS0=WwmX=T4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49A4C04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 28 May 2019 14:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC852081C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 28 May 2019 14:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2+RPHNo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC852081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrSCusdv3ZgSgFqatObuBZLm3mH3rUMNdtwinUBnCdo=; b=H2+RPHNo82wc/w
	/YQTZZaR3WnyZW2lTtvjmotm2if115VguFAaThs36X9DBs1902b/cope56eF8YRjenCQISViv0JaW
	Rq7raYSawKmjxwb4oyalaY13rrTIO7XpLYyhq9M1PpT+cXU/5OLz/GMHyywMWzfK33gs/Yqx2TOOG
	NZW5ZbDX8eitKV5zE9q5Rc1kwhzrp1WOs094votUDRjAyHi+F/qWdcCp2cstUaR+RHOPr26tdw36s
	3HrFUYgvMgxhv9QLt1Q4RnrqTDeH9eq+fk6bEUh3kqnpAu0eO6TdWghO4rabTR2AhYmD/UGpGqMCh
	CkcP+rIyXusUGUbNFquQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVcqP-0007BR-0w; Tue, 28 May 2019 14:12:49 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVcqG-00074f-1S; Tue, 28 May 2019 14:12:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D36780D;
 Tue, 28 May 2019 07:12:39 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 C10193F5AF; Tue, 28 May 2019 07:12:35 -0700 (PDT)
Date: Tue, 28 May 2019 15:12:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 4/5] kconfig: make arch/*/configs/defconfig the default
 of KBUILD_DEFCONFIG
Message-ID: <20190528141232.GC32006@arrakis.emea.arm.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
 <20190527143725.12542-4-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527143725.12542-4-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_071240_089255_5678ACDA 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-s390@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <deanbo422@gmail.com>,
 linux-kbuild@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Firoz Khan <firoz.khan@linaro.org>, Greentime Hu <green.hu@gmail.com>,
 linux-alpha@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Guo Ren <guoren@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 11:37:24PM +0900, Masahiro Yamada wrote:
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index b025304bde46..970c41a30ed3 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -30,8 +30,6 @@ LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
>    endif
>  endif
>  
> -KBUILD_DEFCONFIG := defconfig
> -
>  # Check for binutils support for specific extensions
>  lseinstr := $(call as-instr,.arch_extension lse,-DCONFIG_AS_LSE=1)

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
