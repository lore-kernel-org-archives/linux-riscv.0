Return-Path: <SRS0=iqkr=RH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3C6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 19:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD7420823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 19:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCz0G2aX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SNRrPeiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD7420823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ESJtFLdGIHZQbGw6AroNuM2cIur4bi5In8P+XquS45M=; b=kCz0G2aXnONRY6c4kjWxJzQja
	wsB2Jq5QDAhyGAQ8HtflWYhYjNKV6lyPakjw6+qa4EJDlgHkV5mGg6zqiJ5XQn4zbOjNoBbW1Or7Y
	0TaQcLlpXeqMI4DdFZ2jiO1uqtL64FDOKCTV2eiXK634Y7p7j2SRtMgo+vOvaPLlGaKrpwU88SkzY
	38a5J6ItbMnplmYkFMC3V/YKN0ytU5E850/Pm5FfCr9EuXOkj7P6TtzmJdTiUow+QXjdPB6N6lucL
	cIciOGx0r4q8zEezpcZ2ZVX9qOmPzTeT6RuxXd88ZSm8EImBRnezzCaIYq/kfBQ6a+eNlDxU0A0lS
	EwA6UbXTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0svI-00052I-MM; Mon, 04 Mar 2019 19:06:48 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0svA-0004sb-1h
 for linux-riscv@lists.infradead.org; Mon, 04 Mar 2019 19:06:41 +0000
Received: by mail-pf1-x443.google.com with SMTP id i20so3681599pfo.6
 for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2019 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fsyumd3cYkUPXCx3sxWWz65F7VdbF/BpDrgSmoCGI7E=;
 b=SNRrPeiPmCZ40ZCzXnA5d+cPrKqQUjOSDWFH7Ft8rbQh9PqVBJFNLOvMLKBxfm9ho2
 HrEg/VRhgzZ89iNdAToXKZpM/WI/EmRjYuHtzr5YG1OSN2kaIINfe85IZSysD3ntI29l
 ja2BV/ouYIFt6NIXPA2QLXswoJIqaNR2Wpoby/IpkDF4yMpQG3h2J9HIrndu5xi0TkEX
 tNsdPf9f+eUiUaabj6o0pWfP70yKEDyaRGQWxiqKlSu0ic+8FMqEXw6kSS/dBRlmQ1LI
 4DkYzgQfJIp6lY0PCsejNqNDFFLzF/yQf5lIQZju1Siirn3pjDyzeh6XAI5jIJGTvzJK
 P2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fsyumd3cYkUPXCx3sxWWz65F7VdbF/BpDrgSmoCGI7E=;
 b=RvmX9HelmrPKsPP6B4jABoaRa5vxCaIFc/MqwKBhobKPniiIj1FQL4ZNL9cFo+zZmD
 tFPD/FBfbD9rJd6TrWeDuUe124WjC8uF06tUgmF3p7Ub8KjwZro5B5hgb44TbMMjiTYr
 USPPxNkQm8wfbeHtMmgJzgGokvEGjfJeo5lvIxvES3zktjmQdKt4nNVvSt32iyCY+hKJ
 SHJRFsEqdNG2K9u0QXASPzmghdflPrrFyTBG7hET+hMujf/W0RYAXEadVf+/rkaWeIkK
 Rh7i9JI8zEFB+mo7zDSlDQa95usvwXOLH4OUbWI9T3hpv7kX1fAQsKcCTUTGmtbWIXQy
 SjbA==
X-Gm-Message-State: AHQUAuYIdqB9h1F0Kf9EOpF/cK7fRsXaPE1fhlDQUtRaePW5ieBWwVd7
 EZkAx9dR4A+uh8CZqQHSnolb8GYlgfM=
X-Google-Smtp-Source: APXvYqzDN0bfW6vhe7meCYC2JknpYdrSeoicnS++/YC8bLC0ijRS28CggA6IBNYpeqmXV0m5Q7v5FQ==
X-Received: by 2002:a62:6453:: with SMTP id y80mr21207844pfb.203.1551726398577; 
 Mon, 04 Mar 2019 11:06:38 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f192sm12087077pfc.180.2019.03.04.11.06.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2019 11:06:37 -0800 (PST)
Date: Mon, 04 Mar 2019 11:06:37 -0800 (PST)
X-Google-Original-Date: Mon, 04 Mar 2019 11:06:35 PST (-0800)
Subject: Re: [v6 PATCH 0/6] Various SMP related fixes
In-Reply-To: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-0e06d7b7-e7f4-4ca0-a8cc-1b06c43701d2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_110640_115078_FC11AF71 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: aou@eecs.berkeley.edu, alankao@andestech.com, dmitriy@oss-tech.org,
 anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>,
 johan@kernel.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 schwab@suse.de, linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Feb 2019 11:41:34 PST (-0800), atish.patra@wdc.com wrote:
> The existing upstream kernel doesn't boot for non-smp configuration.
> This patch series address various issues with non-smp configurations.
>
> The patch series is based on 5.0-rc7 + Johan's below mentioned patch
> series. Tested on both QEMU and HiFive Unleashed board using both
> OpenSBI & BBL.
>
> https://lore.kernel.org/lkml/20190118140308.9599-1-johan@kernel.org/
>
> Changes from v5->v6
> 1. Dropped driver patches as they have been accepted via drivers tree.
>
> Changes from v4->v5
> 1. Continue processing other harts even if isa string is incorrect for
>    a single hart during HWCAP processing.
>
> Changes from v3->v4
> 1. Fixed commit text length issues.
> 2. Updated hwcap patch to use common capabilities of all harts.
> 3. Rebased on Johan's patch series.
>
> Changes from v2->v3
>
> 1. Fixed spurious white space.
> 2. Added lockdep for smpboot completion variable.
> 2. Added a sanity check for hwcap.
>
> Changes from v1->v2
>
> 1. Move the cpuid to hartid map to smp.c from setup.c
> 2. Split 3rd patch into several small patches based on
>    logical grouping.
> 3. Added a new patch that fixes an issue in hwcap query.
> 4. Changed the title of the patch series.
>
> Atish Patra (6):
> RISC-V: Do not wait indefinitely in __cpu_up
> RISC-V: Move cpuid to hartid mapping to SMP.
> RISC-V: Remove NR_CPUs check during hartid search from DT
> RISC-V: Allow hartid-to-cpuid function to fail.
> RISC-V: Compare cpuid with NR_CPUS before mapping.
> RISC-V: Assign hwcap as per comman capabilities.
>
> arch/riscv/include/asm/smp.h   | 18 +++++++++++++-----
> arch/riscv/kernel/cpu.c        |  4 ----
> arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
> arch/riscv/kernel/setup.c      |  9 ---------
> arch/riscv/kernel/smp.c        | 10 +++++++++-
> arch/riscv/kernel/smpboot.c    | 20 +++++++++++++++++---
> 6 files changed, 61 insertions(+), 41 deletions(-)

I've taken this v6 into for-next, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
