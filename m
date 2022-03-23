Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmLB0ubF4UKrB5ppN5d6nmvuAT8kK3ibBa435ea9EVc=; b=QI/YvAbi/1INlv
	RlgXinXJwfqWAd1te+y7Us6LRg2bKt98X7aVVDSwf/fzry6x/e6Nepdu4+aKGtkXkmaGyYRVmo+CB
	r2vbyPWZSkoyVHvMiHrJZDROXkszpeSNvppiuorYUnsYHfRSJcoGh0/bhdeEZftQvPSd/Sq8fhdrG
	yXdSisKl9eMyiCrpue7exRseymvCk5QJJ/H401WsgTSWOZg4p1UgBHXSBps4iZqLTCIul9bO6OkCU
	YUYZtu6SNl7kEy15EozZy9snoDWH7J02CSnNZ1icZBoOBMVdGgqgPRvQ5lzijledg8bqHnSLTTJVu
	DiuzufnQuXUO4T3nysBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX3ng-00EEnT-1D; Wed, 23 Mar 2022 16:25:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX3nc-00EEma-Fc
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 16:25:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id a1so2864292wrh.10
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zux2DSMFds7jNsOmIxre0BZd99zkEKB0BbI/vQzRfsM=;
 b=ZL6SIc8QgB4vo2AaILu7W03eB96SloGUo76GWLZw298dw6/iPQe/clKe0AXygyH+pJ
 5wX2g4zimIwhXDD7m1iKeN7uAT/U4FUXK+IJVQB5YAAMu382wgc1BMRXq4Gn76OlHXlP
 UudOdDxygk1GPUl+2sGk7rwUJ1ko6EYEAo7ckdshO8vyDIlPyBVhgygKjd3NNw5yzGcl
 4ZiMKlSs5oy3Ob66y8Tp5LlZcFlOujKowIesq/6fUsZ2UnSKRKPNHckIa33o/wTpm3Hv
 /UieAEnETtzSpKdtcdMyhs51Ten8hAp4lcsAjlKUzMXPGrTn78VUpZSCiBZjH7HnIWx5
 BhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zux2DSMFds7jNsOmIxre0BZd99zkEKB0BbI/vQzRfsM=;
 b=iprUzM0ApBGHtkEbGZXm2lUtyj/hPIEe6WbfnMd6BON2pruxoYQG2p/oQWYEC2FzKO
 +3PJsr5Rl4oRGgujkmT+42SqjloZZq8UsDMUhoVUfPl+NGsCsLW5WvL0eOZX9ASY21wZ
 VkLcilnVa9THMcDAwAiw4A4YZfAafNXRbL5WtFFR66iIPP5XJEFT0+0CGtrjeqrWe0TS
 qQSnZzmoD/VCgT6LEjVph9DPKB1JZmtIeMpaXd97GsrmARdWy7j9ILG8TqBUkwy/iwok
 uugivjejOo/BLyorCQpwfoPVktM1WlCrMa/hyVY528jyl1LD+UCkLyPIlBqk2qI2rU2o
 Lfeg==
X-Gm-Message-State: AOAM532O/vYhLg4fgDB/VIZtZ+pimB7bP++ggu3BbXTc7veStVNjA3Xi
 8L6I6MzriZTFYc4bjoe5JUTtioIC7FXouY6OZUxkeQ==
X-Google-Smtp-Source: ABdhPJx6FwYw9GL9+ToBwFPA/+4ufe9trV2zBnIK4kXoRtmCiXBwujVjRQmxPal/vhHUz95WmSUs/rBIqM6x7NOnFIY=
X-Received: by 2002:a5d:6ac9:0:b0:203:de0b:295f with SMTP id
 u9-20020a5d6ac9000000b00203de0b295fmr619983wrw.86.1648052723385; Wed, 23 Mar
 2022 09:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220323161604.GA54531@sunil-laptop>
In-Reply-To: <20220323161604.GA54531@sunil-laptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Mar 2022 21:55:10 +0530
Message-ID: <CAAhSdy2n0Mf4ZAPH1cL6nZS3AGPOUhMdRtQe4o+vFe=fVNa-Ag@mail.gmail.com>
Subject: Re: [RISC-V] [tech-unixplatformspec] Public review of RISC-V UEFI
 Protocol Specification
To: RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V ISA Dev <isa-dev@groups.riscv.org>
Cc: tech-unixplatformspec <tech-unixplatformspec@lists.riscv.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_092528_611649_2DCA9A8C 
X-CRM114-Status: GOOD (  15.60  )
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

(Resending for RISC-V ISA-DEV and RISC-V SW-DEV because previous email
was not received on these lists.)

On Wed, Mar 23, 2022 at 9:46 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> This is to announce the start of the public review period for
> the RISC-V UEFI Protocol specification. This specification is
> considered as frozen now as per the RISC-V International policies.
>
> The review period begins today, Wednesday March 23, and ends on Friday
> May 6 (inclusive).
>
> The specification can be found here
> https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc3/RISCV_UEFI_PROTOCOL-spec.pdf
>
> which was generated from the source available in the following GitHub
> repo:
> https://github.com/riscv-non-isa/riscv-uefi
>
> The specification is also attached in this email.
>
> To respond to the public review, please either reply to this email or
> send comments to the platform mailing list[1] or add issues to the
> GitHub repo[2]. We welcome all input and appreciate your time and
> effort in helping us by reviewing the specification.
>
> During the public review period, corrections, comments, and
> suggestions, will be gathered for review by the Platform HSC members.
> Any minor corrections and/or uncontroversial changes will be
> incorporated into the specification. Any remaining issues or proposed changes
> will be addressed in the public review summary report. If there are no
> issues that require incompatible changes to the public review
> specification, the platform HSC will recommend the updated
> specifications be approved and ratified by the RISC-V Technical
> Steering Committee and the RISC-V Board of Directors.
>
> Thanks to all the contributors for all their hard work.
>
> [1] tech-unixplatformspec@lists.riscv.org
> [2] https://github.com/riscv-non-isa/riscv-uefi/issues
>
> Regards
> Sunil
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1694): https://lists.riscv.org/g/tech-unixplatformspec/message/1694
> Mute This Topic: https://lists.riscv.org/mt/89979471/6366717
> Group Owner: tech-unixplatformspec+owner@lists.riscv.org
> Unsubscribe: https://lists.riscv.org/g/tech-unixplatformspec/unsub [anup@brainfault.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
