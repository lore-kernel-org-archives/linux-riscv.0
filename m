Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11038C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5sR/eFCE1O5rfmhTWTTrFwYK2z/3qMRftBELPcw2Pc=; b=RRzuFvByfjuDrG
	WAiY7epDoQacD1KhutL4C9ZDsNXw077p+/94DerfhMwMikCULsUQYUjSHrSe6vuOg/5gJTtXwQniZ
	teWe2CQDLBYoFt2IoiY/D/Lbu2pU0RZMhwrlZ9EKJ+vgsbFiD9PyzVlgXoqEMEPBUUKaLapgLU83m
	SyAA2EzsZZSPapZeNyUDdfdeesAnT1PqjPAHrFvaTt48ddXNacXap62x9DbiqeqNshWzjJO8JoPFa
	mY6jDTJ5tasFMrzHl3/QHsdjrEqp7DYJW4illbz5fLjgmchJIQLvYQ5WEgpATnBj0M6sEV5JcZcP4
	749eFCE91vWtzfT3elsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDs4-001DAT-0T; Wed, 16 Nov 2022 08:34:12 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDs1-001D8c-U2
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 08:34:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id l11so25500808edb.4
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 00:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=av6KDv62AGdGoFmcTHykVy0hCGItuh5CT9+Lv5jvyqs=;
        b=AOsO8yEqQANtBMjyqTMpmYYoBZ8gDCxWQZj7HrEzHLLrDcp/A7qItf7JjYNt0gAAdi
         CSN05Q4ANnOIWoLIIeNUXWk1qrRi6RP7hZSL0H8ccfO5U0KRg9bPFGEnPHuIxTuje2y6
         HXkV40xlo6wzcJ0M6VmJVJp5Dug+kxoKW789TiIAvdjyQfrRIAMJAoU2P3XTp5imjYeD
         ugmcZ7BpwjEkbd7Y5y7+1pvUCVmIK8XKkE5R6cctleP03bu5wYLJ/bgDKSDZ2AdsGDjk
         cnXaER+3YQMpNpuOaZeYkNebgFh/Rd6gq/w/AlS2ixWhi/JZ1jYwfI2jdLko5EMtJk7H
         Wu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av6KDv62AGdGoFmcTHykVy0hCGItuh5CT9+Lv5jvyqs=;
        b=yx1dyW6X9MSBSCdzlxJZgqFvcIcMqoxVK3uGDU5GfY0MvlXFJ3sWZRSl6gLC9GvG8i
         TWUgX95/V0FFjw38GJuSpVOr6BCrjL5jfO5KnRaRj7+ZTqmN81Gsd5KNX1nB/T95RYpF
         cleFYdwTQPGRSpI/Vpx/ivRQC0QIfvUa3a0tUQ313yVx41S8bbQJu5EU0pd8fZFbgRJr
         NLOytgPOR3iM0HiMPm4MmHkclLQjMkFrhdUOdWMA0kHgNOFi9KpM5eC10oiaXfjLNnVC
         9k4M7C2HPUuWKmUJK1HAu+YP4On2+PzaHR2I7qCLEfAFj4Ghip5eH0WSrl9i/qpVqkMW
         uAgA==
X-Gm-Message-State: ANoB5pmVy3xxaxkxsp41q3+HlS/3Y7thUgs3KFzhOGICLROEgMSqYXfY
	vySWOvQZVl17d/+LJ0q3sr/XGBfxAfxG7Q==
X-Google-Smtp-Source: AA0mqf4KQyKv4ojZnu8XCNVz3uzBsl/9Q9V+SdHUQxstiySRh4iKvcpDN3BGoIAdFATuX0rYqawP1g==
X-Received: by 2002:a05:6402:c09:b0:462:6b8e:1ddb with SMTP id co9-20020a0564020c0900b004626b8e1ddbmr17722279edb.276.1668587645307;
        Wed, 16 Nov 2022 00:34:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b3-20020a170906728300b007a559542fcfsm6511174ejl.70.2022.11.16.00.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 00:34:05 -0800 (PST)
Date: Wed, 16 Nov 2022 09:34:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] RISC-V: Dynamic ftrace support for RV32I
Message-ID: <20221116083403.nastv4eqigdut66y@kamzik>
References: <20221115200832.706370-1-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_003409_994726_B3BB6C54 
X-CRM114-Status: GOOD (  16.46  )
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

On Tue, Nov 15, 2022 at 08:08:28PM +0000, Jamie Iles wrote:
> This series enables dynamic ftrace support for RV32I bringing it to 
> parity with RV64I.  Most of the work is already there, this is largely 
> just assembly fixes to handle register sizes, correct handling of the 
> psABI calling convention and Kconfig change.
> 
> Validated with all ftrace boot time self test with qemu for RV32I and 
> RV64I in addition to real tracing on an RV32I FPGA design.
> 
> Changes since v1 
> (http://lists.infradead.org/pipermail/linux-riscv/2022-October/021103.html)
> 
>   - Fixed the use of SZREG in patch 2
> 
> Jamie Iles (4):
>   RISC-V: use REG_S/REG_L for mcount
>   RISC-V: reduce mcount save space on RV32
>   RISC-V: preserve a1 in mcount
>   RISC-V: enable dynamic ftrace for RV32I
> 
>  arch/riscv/Kconfig         | 10 ++++-----
>  arch/riscv/kernel/mcount.S | 44 ++++++++++++++++++++------------------
>  2 files changed, 28 insertions(+), 26 deletions(-)

Hi Jamie,

Please CC previous reviewers on the entire series when reposting.

Thanks,
drew

> 
> -- 
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
