Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF1CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 12:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D915206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 12:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fNEh+UVz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="aZdcNThX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D915206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGnS1zxpV/1/8Yic8p+zRYizn7QY2QcCoWFmR0+GwFQ=; b=fNEh+UVz9zNpPf
	3BnOhxZ16BUN/OEVpW3g+hvzEs2wBgYvioUwyE7po6WodMjkLP4k3KuwYNaDvYGNveZIhLjUNkSPz
	xcPDLQBQY7X/WeOemlwmo3YKJZ/ub8iW+V5b9KvgYnjI7nMALxpWbalOWuLLdbchTvPmn1YhTdljS
	8+HFTunsNk3abEY3OguDCyKK5Y4Cpjz9WPhaYQGoMVHgJpupHUsTyHRDxOQtWun73RNTt4HNirsQh
	qAvrAVuF7y8f64uaKHfCE0X644Cl6joB720V4cRBuECvKBrKT0OQBAhWP+ikj6mqi6MY+mUBWwKwo
	LQN8piVdNkttg40gx8Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggqH0-0002Si-6t; Tue, 08 Jan 2019 12:14:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggqGw-0002Qg-Rl
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 12:14:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id q18so3800764wrx.9
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 04:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H58GJbXTkYOWpGzunPY/zRGy+r/zK4zeENd9eaVqfA8=;
 b=aZdcNThXWO06NC8TfXwatRCZ2mF4uvIWZfYfPXcH4Zv2XZTyEe1MuGi1vITINS9O5/
 5d/0J7z9p2z4R6hPmcLioNAuzY+ETzMNcY5GbK7u/DaO8EsQ13EwM2x6zyntBvKxnuZW
 3l0ZIa61L94OyCBgnJBmkGfkpM/Lm3Ztwe8m33rtjZSUmT9PuePNaJk4DkrcCtWUOcMQ
 Qw6kLT9ktuCL7pbQwmIAG5ESaoBcsylmCnd37hbpRq9Bkf9MQv02Hrv0lp9HN8kye/ww
 p4Be/yetzJ22PmkHkuictC5AEMBbt4Xsmd5AUBO3dwCIdVbldnj2qWSj3M24CIGx+eeU
 vbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H58GJbXTkYOWpGzunPY/zRGy+r/zK4zeENd9eaVqfA8=;
 b=i3RWqhYAX8m5RJyxDAXpKo1ZZ7pUux5+0w1ReUmK9YGNx0jfEUbqwFUbH32lTlO7jI
 j2M0XbfXKJqdKQ/G4aoy25O1fOR5D75VxPElY0cdKWhUhVBS/+yY5JnmHaB6XSifk7nq
 RFJsxe7Z89jHlEovwHECi3Pr/a2YoolNrryc7TyQOtWYBV3IHSAIrMat0NT30EXL6srf
 da5VbgmpZzY0j4nlfxHqO4GWcNESqlxtPwPDtlO1IELdMuPonuGo43NbXRK+do2Z29mU
 iOJY81vXCdA9Yki/W/nRYP2Jwpdr0rDrMmNXD7ek6pRAzmtJLKFbHvD0o4SUHsAIfXsG
 smow==
X-Gm-Message-State: AJcUukeEKOq69hMGEBx/BEn7P0GvoUV7BU0T/t6KC1aA1YxVwO5B95va
 C1z2l4IBnKXtX0TGNmpCfT+hIYOSn4JQZgkAt6CBmA==
X-Google-Smtp-Source: ALg8bN5Mb3svnjAy8H2NU1gkpIfGnt3L63bKxV77vWm1+E+T5nJsTa0EGLbJZh8WoLD78cp3ruBM6NcDLSc4dqoFCok=
X-Received: by 2002:adf:f785:: with SMTP id q5mr1351829wrp.9.1546949656721;
 Tue, 08 Jan 2019 04:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20181227111821.80908-1-anup@brainfault.org>
In-Reply-To: <20181227111821.80908-1-anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:44:05 +0530
Message-ID: <CAAhSdy0NYKgX0whXLF8h9Pjeg05D=pL8FcH674jTrTwUX3YX3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] IRQ affinity support in PLIC driver
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_041418_907629_13EFB46F 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 27, 2018 at 4:48 PM Anup Patel <anup@brainfault.org> wrote:
>
> This patchset primarily adds IRQ affinity support in PLIC driver and
> other improvements.
>
> It gives mechanism for explicitly route external interrupts to particular
> CPUs using smp_affinity attribute of each Linux IRQs. Also, we can now
> use IRQ balancer from kernel-space or user-space.
>
> The patchset is tested on QEMU virt machine. It is based on Linux-4.20
> and can be found at riscv_plic_irq_affinity_v4 branch of:
> https://github.com/avpatel/linux.git
>
> Changes since v3:
>  - Dropped PATCH2
>  - Added PATCH to not inline plic_toggle() and plic_irq_toggle()
>  - Moved PATCH3 changes to PATCH6
>  - Used WARN_ON_ONCE() instead of WARN_ON() in PATCH5
>
> Changes since v2:
>  - Fixed incorrect address of enable registers using sizeof(u32) in PATCH1
>  - Retained comment about need for locking in PATCH1
>  - Split PATCH2 into two patches
>  - Split PATCH3 into two patches
>  - Minor fix in commit description of PATCH4
>
> Changes since v1:
>  - Removed few whitspace changes from PATCH1
>  - Keep use of DEFINE_PER_CPU() as it is
>
> Anup Patel (5):
>   irqchip: sifive-plic: Pre-compute context hart base and enable base
>   irqchip: sifive-plic: Don't inline plic_toggle() and plic_irq_toggle()
>   irqchip: sifive-plic: Add warning in plic_init() if handler already
>     present
>   irqchip: sifive-plic: Differentiate between PLIC handler and context
>   irqchip: sifive-plic: Implement irq_set_affinity() for SMP host
>
>  drivers/irqchip/irq-sifive-plic.c | 110 +++++++++++++++++++-----------
>  1 file changed, 71 insertions(+), 39 deletions(-)
>
> --
> 2.17.1
>

Hi All,

Any comments on this series??

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
