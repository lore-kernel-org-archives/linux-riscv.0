Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB38C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 19:18:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0438B206A5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 19:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VOTXx/ME";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="x6CSQIUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0438B206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=VsplkFsM2woBhkWYdebilaDsagqlhYwxPLfxFUb10ro=; b=VOTXx/MEyHpHVFUVz1Q/VXv83
	RF1b/7m7H0sVn4dlG8XNmLUdew6n59BlNSNE9uRFPgekCF1NjrN3P3Dbg/1OCTc+ZkrpU/wnx8V1f
	3CMVaGUGeQ5icc4IJ6262/I6477MN7ne0zYGJylIKKLQtCnMk1Xgg5HwDwpOh3uFVZmcukS+oniCt
	UYKDBvKI3+R57ndAqiMXadkdPDb+OJOnbXI8c2qpvRcvZsuiPaxbJPCHbugkPxus4x4azlSrSjS8+
	P9RwRhJlDMOzsP2dmTk037X6xi+dkGeWcOU43Bkw2eL0Z4J1sfipKvL+SQ3s4d1JG3Wga/QYwt/Ej
	T1oxIIU2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEHDh-0004ts-5A; Fri, 04 Sep 2020 19:17:57 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEHDe-0004t4-3n
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 19:17:55 +0000
Received: by mail-pf1-x443.google.com with SMTP id c142so5129135pfb.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bZwqC1RcOwlSN3VEcYwP2ZtgIrDiEXbG7sY4kaAsweU=;
 b=x6CSQIUDYYG2v4g+T0cscHCIBlh9iTfFZW03yanbsjgJxLAL4AQz9CjBE1qyGMdrqo
 wt0F5NfuED1VyMq3uZ95/R3r3O0Ue8y5C6osV6vbTZHzAqcijpX/eFhHKTha+M+GXcHP
 wdqbF15HIimeJcXcjXd0/VgBv8XevcXgu+5FUyb4+YB+zD0k98hPUf4oQ61xDTE01W+V
 feYePReyeY767cT7m4Gz23yifMx/fSaXEqMKJE3rJOr+zzTLqVhN0pCL4sFLe+41s4/t
 m9kqBm5MV0dz8865fwwT6vB0bP9kwXL84+HzFjmrnqK7Qt0nQ9kabNrsSZT1vqKWvTwb
 yNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bZwqC1RcOwlSN3VEcYwP2ZtgIrDiEXbG7sY4kaAsweU=;
 b=n98Pu6FXMz9Q7O8MFOGuB7Zw6JfbEzpRO5Rr9R71mzmcJxI1ItNd7aHUeLJ1iB5F+N
 A8KYmpfSkR5hb/rLdr9hbsPp6TfOZe0kDa+kIIadnLVAf+so48v2XbIHNpy4PWjqaY4n
 LiG08gHE3NgOxEkTGeLRG1rCyvmdvCyfbWVmD6ejexbCXbv5Mo2HhO8/6gQxHUshTiyu
 d41yjQxSlLtY91AhFfSryu5vr0jIxDLhJbioPfncRBhgIi2/qCu/Wn2BuP0S4VLXx8+Z
 4A/BUkwWxFH3wJeqkmphhnwdeUWNXTR0vG2lERlJWeaNy6GFTJFPqCQMmJErilqYsjyx
 x5hg==
X-Gm-Message-State: AOAM532ZUZb0qaiEF7K2yk2ZtigvmBUDa4p5lPQNn6nux7ifmjUvRGSp
 TxzdZ/nHDR7dMK3kDLKLJG5HEA==
X-Google-Smtp-Source: ABdhPJwNswuWQ4CWTtTWToMlX4aX5Q9ul6jEdoZSRJQBH76X9BowhFVtHj1ksJtxW8ygzGY1V4qw6g==
X-Received: by 2002:a63:7b16:: with SMTP id w22mr8160772pgc.17.1599247071532; 
 Fri, 04 Sep 2020 12:17:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s67sm7842917pfs.117.2020.09.04.12.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 12:17:50 -0700 (PDT)
Date: Fri, 04 Sep 2020 12:17:50 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Sep 2020 12:17:45 PDT (-0700)
Subject: Re: [PATCH v2 0/3] Get cache information from userland
In-Reply-To: <cover.1598515355.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-6b86dc70-671f-4e9f-b136-1a03e68f7d88@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_151754_249965_EFC9AD5B 
X-CRM114-Status: GOOD (  19.55  )
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
Cc: david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 01:22:25 PDT (-0700), zong.li@sifive.com wrote:
> There are no standard CSR registers to provide cache information, the
> way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
> AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
> could use them to get information of cache through AUX vector. We
> exploit 'struct cacheinfo' to obtain the information of cache, then we
> don't need additional variable or data structure to record it.
>
> We also need some works in glibc, but we have to support the function in
> kernel first by rule of glibc, then post the patch to glibc site.
>
> The result of 'getconf -a' as follows:
>
> LEVEL1_ICACHE_SIZE                 32768
> LEVEL1_ICACHE_ASSOC                8
> LEVEL1_ICACHE_LINESIZE             64
> LEVEL1_DCACHE_SIZE                 32768
> LEVEL1_DCACHE_ASSOC                8
> LEVEL1_DCACHE_LINESIZE             64
> LEVEL2_CACHE_SIZE                  2097152
> LEVEL2_CACHE_ASSOC                 32
> LEVEL2_CACHE_LINESIZE              64
>
> Changed in v2:
>   - Add error checking for parsing cache properties.
>
> Zong Li (3):
>   riscv: Set more data to cacheinfo
>   riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
>   riscv: Add cache information in AUX vector
>
>  arch/riscv/include/asm/cacheinfo.h   |  5 ++
>  arch/riscv/include/asm/elf.h         | 13 ++++
>  arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
>  arch/riscv/kernel/cacheinfo.c        | 91 +++++++++++++++++++++++-----
>  4 files changed, 117 insertions(+), 16 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
