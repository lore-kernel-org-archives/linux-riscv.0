Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA228C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:53:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63422225F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUKz2FRh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="j/PZKR7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A63422225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T/mTGYyVEKOAkuTejAagn+sLEkMM3RdCF9iTQ+kNzqc=; b=NUKz2FRhnxwrp7l4xGIXrCZbH
	wLip8g/j4VldobUZM5um9ITMcKYf5b3rgsVvkyYy/CjQ+nU4ShVoUouq1sJCmQ+Dn/h6AiYCXS7ty
	Ox5unDHCz31DiGQLJabh16S+Tshu/s82lX535SiixSaBJXJJeKrwzipSmrJrGE8Ny5gkN/Ej20Wq2
	pCWyZqA+0XbvZ2RkDzKf8N5E7+QcIKzglAxqxSN9LIGOF1/0SZXFpVqOIGAmw9mSv1xGE9c06ZTJj
	BUX8y6cKs9+/zgIOGLKde91sz7m0xzmo7XvMBANLGp+PTP+cWf1nFBqYIWCpgxrZiIRBTQlX2RGWK
	cZlC5BONg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpln3-0007Mo-DR; Mon, 29 Jun 2020 04:53:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpln1-0007Me-Ot
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 04:53:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id s10so15086437wrw.12
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xlkirLsIZMObxpVgMysLgRaq8YNVzTc6KirQpgVXrl4=;
 b=j/PZKR7k1xbX2L5QA4ostwRavWKWUK/N34oC2C8aMw8lMmmV4WnYf/amEnn5yWG6WP
 v5XfK2tf6vIerdnASizSZxc9nmxXFGUBQoEr8xbxqHz9ot4GDAC1Xhkk6IkuLKowEEV8
 jRQ7QmthO6fUya5tSXTmdvwiv/3InniocLRyjDawgX4ZtLcTjeean32ErbKDtyMpLfCt
 h41wudieF4BNsc3tKAMFx3t6ihPEw+EGzk38vspi+YI7g+cfql1SYETCLdsJRtdSN33C
 NCAHfXe896jFf+rcPPRYrLkX6EJW+Q9RPxehYZEuMaFqEJx2ildGX4cQH642SxNm4dB5
 cT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlkirLsIZMObxpVgMysLgRaq8YNVzTc6KirQpgVXrl4=;
 b=ms01BsmlhmTwU6SQt43DJr+nnLMfWi6o2G2YDbyp/F5SwSSPe2ouNNK4hR0amBPOEH
 VVIMEkgdUDMy38c0d/oh9bgcvgRh0nYr1n38n+tldk9RrepPIeaJgvU+XEBZheT4pKKc
 jxD0IcovMRMIYGw9fsErLdrow7HTNyatmCcQM6PllXGHixSfCX8vusi3XkovYejhfWoU
 zP1LmVMENz/h4tijOjIe8bo55B+dRWUm1Xaqm7hUDbs6p/g3vxGQfXc2lxuXD1aDJWvu
 s7rYg4jLpQVVwdMObgzekNa48O5v9LdnOtQBmI6qETByVYQIJlbg0ptLXADpkMSU1zAO
 asCw==
X-Gm-Message-State: AOAM530v9uGfzqKHC/UYg0vIpdcEMa7qO43+I8hWBiGgqKFllXUpsFmy
 RuBQEDoeeZ5bhg6mpL7bAY+3RJIDO9rwBXK19Nr1Wg==
X-Google-Smtp-Source: ABdhPJxa/xVZEo4rcONrdXK7z4EBCafJE7t3pkJxGBiHDISKtOWNiYaOD0c0v3gOgqNI5AKRBTrN8tHGHJujsgatwnI=
X-Received: by 2002:adf:de12:: with SMTP id b18mr16280822wrm.390.1593406386452; 
 Sun, 28 Jun 2020 21:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
In-Reply-To: <cover.1593397455.git.zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jun 2020 10:22:55 +0530
Message-ID: <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Zong Li <zong.li@sifive.com>
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
>
> This patch set adds raw event support on RISC-V. In addition, we
> introduce the DT mechanism to make our perf more generic and common.
>
> Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> would raise an illegal instruction exception and trap into m-mode to
> emulate event selector CSRs access. It doesn't make sense because we
> shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> selector through standard SBI call or the shadow CSRs of s-mode. We have
> prepared a proposal of a new SBI extension, called "PMU SBI extension",
> but we also discussing the feasibility of accessing these PMU CSRs on
> s-mode at the same time, such as delegation mechanism, so I was
> wondering if we could use SBI calls first and make the PMU SBI extension
> as legacy when s-mode access mechanism is accepted by Foundation? or
> keep the current situation to see what would happen in the future.
>
> This patch set also introduces the DT mechanism, we don't want to add too
> much platform-dependency code in perf like other architectures, so we
> put the mapping of generic hardware events to DT, then we can easy to
> transfer generic hardware events to vendor's own hardware events without
> any platfrom-dependency stuff in our perf.

Please re-write this series to have RISC-V PMU driver as a regular
platform driver as drivers/perf/riscv_pmu.c.

The PMU related sources will have to be removed from arch/riscv.

Based on implementation of final drivers/perf/riscv_pmu.c we will
come-up with drivers/perf/riscv_sbi_pmu.c driver for SBI perf counters.

Regards,
Anup

>
> Zong Li (6):
>   dt-bindings: riscv: Add YAML documentation for PMU
>   riscv: dts: sifive: Add DT support for PMU
>   riscv: add definition of hpmcounter CSRs
>   riscv: perf: Add raw event support
>   riscv: perf: introduce DT mechanism
>   riscv: remove PMU menu of Kconfig
>
>  .../devicetree/bindings/riscv/pmu.yaml        |  59 +++
>  arch/riscv/Kconfig                            |  13 -
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  13 +
>  arch/riscv/include/asm/csr.h                  |  58 +++
>  arch/riscv/include/asm/perf_event.h           | 100 ++--
>  arch/riscv/kernel/Makefile                    |   2 +-
>  arch/riscv/kernel/perf_event.c                | 471 +++++++++++-------
>  7 files changed, 471 insertions(+), 245 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
>
> --
> 2.27.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
