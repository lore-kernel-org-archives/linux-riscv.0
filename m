Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26741C433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:28:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8680A610C8
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8680A610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=S0w7B2AO/lt3RBxKvu/3pVvPilN12VJC9GV2rOpQtMg=; b=AB7Et1u+EMmlZiW5IyNe4nzQ1
	TCojFckGeYlow9bW2tHCQxYpYR45WacQOH055lLp9d55Rz/lmtFWbfhsZTXmJg8Gk2IDNjFu3kMcT
	08DVu6HMcmsSI9coM4873OLls4CweQJYfFfHm9nUPVPXHD5WySwdB22ZTBhLYpBcM7rcLZyFU5gjI
	C+lAkA3xjkkW6sWuInK9UhyXFpVTUgkdHg7nKBlxDRbQ5hS4jH/q6sqXJLLttw2CRP1mMvX2YpJQ3
	BcFq4yTrx1CBZ21vXyup/992CkaQXsogC4TP3kFE8fIM/DqO3IrX3vKyANrc9EHfM97BOr2tsWi+J
	CrRPupWzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVhcN-0057dx-Vh; Sun, 11 Apr 2021 21:27:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhcG-0057do-Vq
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 21:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=PVNDzZJZyebCsZPn5zFminUc1ykkQL3Oq73CobiugXo=; b=AtFB5HYFZ/LqFq6Gcd7Z7cdgcb
 xQC744GzqLBL8OCjF/i6289EfYB4aJMGlwf+0d4MsZz7YGud+Nkj1ITuYHTWgtlLNjbxSFJYkhe0B
 ZNJzs9qdOmJIOKQj0yCGmnn8Ym42Z49uvL0QI66ze3yiir082a5xInAwXqAxw8y0Tw6KQI8X/5jP+
 KFsO0Bn7+a+ikaDrTsSnSZAYgKK66CfTN3Ebl32+DUnDyML0mi/NI2aL8ndkLj4DsZ0A0OsetUdXq
 IqtjqdvWzSIlvONEMDjALx6+LYhesdt1x42Avmj1Yl45QUOV1aC1lyLJIdTVRW+s6Inmah9idgI2Y
 Kqhr353g==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhcE-005kb7-6g
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 21:27:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so7653416pjb.4
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 14:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PVNDzZJZyebCsZPn5zFminUc1ykkQL3Oq73CobiugXo=;
 b=daGbgO06FD0y3yZqFkPlkbxG30REc1PCqGB45ldOYzvfq7QFgqlmMDE5C8RjJIGvh6
 7UO+61A9xXkRYjS/XiaDTJ3FlNJV0NAqJfgXc1Xh71CYEn7DqL7dA5ueSFBUarxYY0x0
 I+p1Z2kKArDrrwLu9HOyTZuBuj9HxhC1X1zmJK3EgtZbvR4cdlocolO8fWIHLtT6I+DV
 nZi6u5UqAF6I/44y9X07nM3yYpa0c4x3Dx4yyM0uLYxCq16igwAFYCyl090PA1A+sG3p
 wk48FgH5+GGRkm4kG8YjhCdHJgFiBMWWJKDyWDXXqQslHuaHLZciy5+z46Y1zGsiecFA
 OMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PVNDzZJZyebCsZPn5zFminUc1ykkQL3Oq73CobiugXo=;
 b=cPD1QaubWpX7k2b0ZapIs86SA5Hnvli6t6FG4Nk97vVzHkLTTSlh/dMin/EW+IzyLN
 y7SxmyCBBPCBzMQKwUwPJcFouJZOsj8Df4z9a5aM+3XN4/MD4uTZ47iQMFFZKHhdo6SO
 bLmkRhNXqOmkTmMzmbZdiMpcw4+Fv9yPatX/ctXCt9gn8Gpii/L5QLr+7uY4MjLD5ZGj
 /55eacWAf659vgMV1RWD4HrzvEYeJQRInrvPviceZzkFswajNPfoTIbMJYxDviYYLc1R
 AGM4T5cej8wccOlUGw/U8gKbd1qmW/vbQgMQ5i90Z2FUYd8NqRmtc0F/cuLpqT36eOa1
 sHww==
X-Gm-Message-State: AOAM532oAtl681ZiKoKaC1YwB37WHMHN8xC0bjuEaeAIWGYVeygZK2Lk
 jwtVQ3lW/sV3ONE+6+B1pud4Dw==
X-Google-Smtp-Source: ABdhPJwiwdBQAdhDHFHwQCGnLzB0bUJmt+unt3I8hrFL8qAfHwOTT+mw9YnciK4YJQsdSdoUScIMxQ==
X-Received: by 2002:a17:902:9a0a:b029:e6:bf00:8a36 with SMTP id
 v10-20020a1709029a0ab02900e6bf008a36mr23328948plp.51.1618176453013; 
 Sun, 11 Apr 2021 14:27:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v126sm7943215pfv.138.2021.04.11.14.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 14:27:32 -0700 (PDT)
Date: Sun, 11 Apr 2021 14:27:32 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 14:27:00 PDT (-0700)
Subject: Re: [PATCH 0/3] Fix CONFIG_FUNCTION_TRACER with clang
In-Reply-To: <20210325223807.2423265-1-nathan@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-fbfe4121-4626-4641-b596-d027d6cfc50c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_142734_270548_1A57D581 
X-CRM114-Status: GOOD (  21.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Mar 2021 15:38:04 PDT (-0700), nathan@kernel.org wrote:
> Hi all,
>
> This series fixes function tracing with clang.
>
> Patch 1 adjusts the mcount regex in scripts/recordmcount.pl to handle
> the presence of PLT relocations, which happen with clang. Without this,
> the mcount_loc section will not be created properly.
>
> Patch 2 adds a workaround for clang less than 13.0.0 in relation to the
> mcount symbol name, which was "mcount" rather than "_mcount". This was
> written as a separate patch so that it can be reverted when the minimum
> clang version is bumped to clang 13.0.0.
>
> Patch 3 avoids a build error when -fpatchable-function-entry is not
> available, which is the case with clang less than 13.0.0. This will make
> dynamic ftrace unavailable but all of the other function tracing should
> work due to the prescence of the previous patch.
>
> I am hoping this series can go in as fixes for 5.12, due to patch 3, but
> if not, they can always be backported (patches 1 and 2 are already
> marked for stable).
>
> This series has been build tested with gcc-8 through gcc-10 and clang-11
> through clang-13 with defconfig and nommu_virt_defconfig plus
> CONFIG_FTRACE=y and CONFIG_FUNCTION_TRACER=y then boot tested under
> QEMU.
>
> Cheers,
> Nathan
>
> Nathan Chancellor (3):
>   scripts/recordmcount.pl: Fix RISC-V regex for clang
>   riscv: Workaround mcount name prior to clang-13
>   riscv: Select HAVE_DYNAMIC_FTRACE when -fpatchable-function-entry is
>     available
>
>  arch/riscv/Kconfig              |  2 +-
>  arch/riscv/include/asm/ftrace.h | 14 ++++++++++++--
>  arch/riscv/kernel/mcount.S      | 10 +++++-----
>  scripts/recordmcount.pl         |  2 +-
>  4 files changed, 19 insertions(+), 9 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
