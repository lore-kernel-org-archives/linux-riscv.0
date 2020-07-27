Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34607C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 03:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE68C204EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 03:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVH27ELm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dRSL0lbY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE68C204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBiXywltXIHc2RFPEOngC9x3zePuKnrSqXgVKcsdeCc=; b=GVH27ELm+JgXNAcvC2e4zpR38S
	49uYSiXB2j9a/FlRvy7fj6tvyq/aC1sFCfZTq4DByjiQD0TfitlirV9S94KyRpOZHFdOtWN1ZssSZ
	JYSYuoYVsaAIviraf0MqaXzgxmIkRWbisr7ueCrWhb6/P+Q+m3oLSfEwWSsOCKAIXQX6s+xteiR/C
	ucGC+3GGDy7/hd8gMjhrryVpl/D40hoQMZUOcbEvbnYwtsnZH8I7sENYi+hayD1DHVEvsWgCi+S12
	KWdrVi+/IZufVXxIbSaC9kab7zwFPDhrSf1/MGwBqHQVZu9EWQaUAI6Nrm287l2AA4NTirl3PeVvj
	N1ubt3lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jztQR-0004Il-Qq; Mon, 27 Jul 2020 03:03:39 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jztQP-0004I9-1b
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 03:03:38 +0000
Received: by mail-oi1-x244.google.com with SMTP id k22so13172078oib.0
 for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2020 20:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fkOV/O/kNHZFKdtAVB8sb4T2DKi6scD2vvTjm2Gdfqw=;
 b=dRSL0lbY5nq2kJl32rI3bvbQV7YwZGiMnJZCnZAC+ymE5OAV/PBYKUjE/sv0VnV8yd
 jz9dYbDnPqdLRelkUeTjlqb+iB7EEN4IPEeUXoaTtY+6SPD5k9f2TW05G9pyyvwBsMEZ
 lmWrvPnjy9OplvxE9MgQuEplMRGLY7/1q6qaPUsVK7NqdLI8XNv9/cfyQbtDnfIO/kR7
 5Omng4IZ/VXNvrp0g+6wk4HXWYNWOw1df31SfQvjIYs4iyt4ZW/qaf0QpvlnnMN8WJUU
 DP8GmBpwv6OcdnC01zcG/eLol9h7FehVXEH75FIkGq7EVgHEwTQkVCN8Wy7NBSRUB3Ph
 aSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fkOV/O/kNHZFKdtAVB8sb4T2DKi6scD2vvTjm2Gdfqw=;
 b=GWFa4QVLya+qb4VHrhkpL7jjIAtRb+FEdeJXUPiK3Iq/+EIyVLcMEEZP4y+V54I1NI
 /9CcvGXELhtU6ApZpov5hL8aDuFEz7ijxVjxVLYoMrd2m1V9HtalYb6ZsqN2+P1mmWsc
 Z48TS1lOuhEY2qjBf1P+ypkg7+/IAWeImffsduswIX/lD+m/IwBYp0NGbEbXlUQQGUwg
 iod8cKPsuF1rhX74vLag09WZpL83OdswR4bT2jlklJ3Xne+W1YQ0xJNQ1xRQG5YLI/5B
 V3/h5h3c8S5Du6N/3nYJWJpcu2IozFKcI+X99TbvrtyLwle0LHPWECI82+A9n+RiVHld
 1Zww==
X-Gm-Message-State: AOAM5318SyPMkpTlq4UCED+7yXxH131FmBN67yaokkN8ydKv5W0O1GSl
 8z1pM4dz/06TH3RBkQy9ZZbO/ZQaA4OU2uV2f5zdQl+kHvI=
X-Google-Smtp-Source: ABdhPJwtnMrFY5H/y6xGKI6VwNLjMw4MAkz7DUVThi1J8t+gbrS7hX9yAbiMeWdVtKljVjzXjBwGOpfEGYDBXks7/vg=
X-Received: by 2002:aca:d509:: with SMTP id m9mr15724168oig.116.1595819001911; 
 Sun, 26 Jul 2020 20:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593766028.git.zong.li@sifive.com>
In-Reply-To: <cover.1593766028.git.zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 27 Jul 2020 11:03:09 +0800
Message-ID: <CANXhq0p7HO=zD7fDyz9O+TFzwFq2tqJva_V6RiFO6PExzuUq=g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Get cache information from userland
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_230337_108773_BDAF8AA3 
X-CRM114-Status: GOOD (  12.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 3, 2020 at 4:57 PM Zong Li <zong.li@sifive.com> wrote:
>
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
> Zong Li (3):
>   riscv: Set more data to cacheinfo
>   riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
>   riscv: Add cache information in AUX vector
>
>  arch/riscv/include/asm/cacheinfo.h   | 14 +++++
>  arch/riscv/include/asm/elf.h         | 13 ++++
>  arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
>  arch/riscv/kernel/cacheinfo.c        | 92 +++++++++++++++++++++++-----
>  4 files changed, 127 insertions(+), 16 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cacheinfo.h
>
> --
> 2.27.0
>

ping

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
