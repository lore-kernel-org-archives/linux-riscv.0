Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D56C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 06:32:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628A5613C8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 06:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628A5613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mrdNfCYHoY68Yh9M8AILpfdIMGyEi9FtrRuG16g/oNY=; b=HkwGOV3vVHbsvIfR1csdumkcv
	M3m8C/+h4F4Ty2dUuH27X4G9Td8hQuNmKBe5pha8plY1eha0SDRiSlPRBR7ntO1D6/OPJJKTzOerb
	NO2M81wj6s7fEqudM+5klib47Pg26ACigSx8qLVzwIvZp0r0JiuP/aSUBsxLJP1DowwEWgqI9DI5Q
	DDM1xZHgvS5sqA5jay7GMuqiz85o+rOL52w3O90gRzlCRLg0rBDaUoP34E/OCgKdzNit9XhZc1bhw
	KYuvN7AkOzYx4s42Bj3k5nm9EJm6i7z11KS1F252gysobb3cvi4Pdg93z0rDNxMkG1VVRL5z27hID
	Zzlu+wQVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbdjW-002viK-6K; Wed, 28 Apr 2021 06:31:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbdjR-002vhs-Fh
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 06:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DNbceJ2JPy17A3jIMWMtBBJqu9jLShZ5Gqf22qewDXA=; b=psBZFNqlpKYhD84M4jEyYbryqC
 ubbq0OZFLvo4PqoYZQOPXQwm7Yy2d0b6La0/x/CfONYPi3536AZkhWNXTkl/8TPp7tMI0cbc97v8R
 mq7YQy54x0UUZIx6CT8lR0Eg/pyjmFlc3xW6zCAfhAMCy3YNpulXPcqfpNl9YhJRlzzOIYCQNGEpB
 nXQ30mmavwkEMAIcAG89Rnn6WgfP/3rvKA9vx+tM7RW8s4tnznmA2FGq5PG/n1B9NGpQAiBetLtx+
 EQIGXOyUIBxBl2sQ5tUN8N8uijVWofnANlHfQSgALrBdTBZLpniFZXt0KfHqFucT/BKVylKLGeOws
 vOQ5nV5g==;
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbdjO-00HDNI-L8
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 06:31:32 +0000
Received: by mail-yb1-xb33.google.com with SMTP id t94so19235080ybi.3
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DNbceJ2JPy17A3jIMWMtBBJqu9jLShZ5Gqf22qewDXA=;
 b=EJaXHE9qosy2Xm2b5VHtfxSMpk+/LnJ/RyBCswUXYSuznYT7DlLpZHP8CLD9DK1fgE
 hftdE4h7KSJXW9GnX+/mNv6ugDWpBewdXS+9g54vl7GQUa1xJbvCOIVsTLlyTrpNF1tk
 82ItMhUJbzZPIj4jovBPpO3d959ZMF8Tv7594=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DNbceJ2JPy17A3jIMWMtBBJqu9jLShZ5Gqf22qewDXA=;
 b=cBKWJJxke38BCXw5xtNC/WSvv0pW+obnmfKRFuDVqYKAUIz/qme+KE4fbqtFoSJkkf
 4MYq6QNuhDxOd7/zXj8TR9yNXd7GsbgMBmbVZrOPk3j/itp0iA5me3yJo1u0jiF2obwG
 pv/w14Ti4h+yNgnCgVicl16Dnu0hyw49v2KGwb46TpV6O5t3Am3jQhUvMLkbyjvk7ysT
 dZ7Mp8LTWDpK3apv/EZ3fVChk5m9YjBm7fGADv/TLDtImDdT4T1hlm8ZkPvfxdXiecVY
 wUxoR+y8CnP0SCbPECLB5d8kQ029DqBjg6Bma+44w9rRShK9+myipKb+IxOiqVbxEeIn
 t6vw==
X-Gm-Message-State: AOAM533jptJQg3J30VToRHjcsZzbIFKrd35JPuwS9LcQ8BUXU81xtTfe
 +IB0Pgsg85ydmoAe5J4s+RGsnaysNeg6WLh9tBEAmiHyeEnEbsU=
X-Google-Smtp-Source: ABdhPJzokc03Du5N/maoI43vXKBCcwRm5pu0iU1IIRyTDnZz7nX/Uxdplb7O6nlg16pgeJh2NRMVxiwUJgoXKOw1Vkk=
X-Received: by 2002:a05:6902:728:: with SMTP id
 l8mr15508196ybt.326.1619591488539; 
 Tue, 27 Apr 2021 23:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMz51GMRM6s7YqGYgfZwRhW=y0aCALM-C3APU0=GjZ+X_g@mail.gmail.com>
In-Reply-To: <CAKXUXMz51GMRM6s7YqGYgfZwRhW=y0aCALM-C3APU0=GjZ+X_g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 27 Apr 2021 23:31:17 -0700
Message-ID: <CAOnJCUKrqOXGY7ePLEqxtAk39_fbhxt0wVhEtrv5m6X2wwuUpw@mail.gmail.com>
Subject: Re: MAINTAINERS section RISC-V/MICROCHIP POLARFIRE SOC SUPPORT with
 invalid file references
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>, Conor.Dooley@microchip.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_233130_852783_A6F2D232 
X-CRM114-Status: GOOD (  15.37  )
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

On Tue, Apr 27, 2021 at 9:15 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Dear Patish, dear Conor, dear Palmer,
>
> Commit df29598aaf5c ("MAINTAINERS: add microchip polarfire soc
> support") adds the new section RISC-V/MICROCHIP POLARFIRE SOC SUPPORT,
> but that section solely refers to files that do not exist in the
> repository.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches    F:    drivers/soc/microchip/
>   warning: no file matches    F:    include/soc/microchip/mpfs.h
>
> The patch series, [PATCH v4 0/5] Add Microchip PolarFire Soc Support,
> never adds those files, though. Are they coming through a different
> patch series into Linus' tree or do you intend to refer to other files
> instead?
>

The actual files are added as a part of the following series.
https://patchwork.kernel.org/project/linux-riscv/list/?series=467187

As the "Add Microchip PolarFire Soc Support" series added the basic SoC support,
we thought it is better to update the maintainers file in this series
to provide the information about
the maintainers for the PolarFire Soc.

Should we just remove the Files section or update the maintainers in
the SoC system controller series ?

>
> Lukas
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
