Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BD4C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjZSik4OzqOvkhvnBC76GJHD2Qm+Y0RxUpIaateRJA8=; b=OWN4Vs+64rLo68
	8rSDK4QLUlcEYbGPC55epj8tB+ibBhjmR+RkonYD7i5y90Z2wB6EXJcpMwKeLjSkKg6fZe9nABYNK
	RpQIJ5y+R7bGR3QV1GjDkm4SdDsS/ZGVKmUmhD2NvIJbAjYgJ7qNy6X9BX3H8axItiIgSZ2m+o7r3
	t9d9oI7JTnE+HZWF0q+UqHDqvMq4zgJBZEEXiU3lLRmhqgghfPg0i2Iqpt/co2Dvs+BX5Pu/wcfHV
	8husB57rRdxuPFjMQYv+p1k2Su5Ip3eyqNOOxnZ37ULjI2XNIOyNuS0fkxZIQsxEDRGk+f9MSwYN7
	7YTxmH51tw4LUuIJj3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhiS-007omo-BM; Wed, 25 Jan 2023 15:29:36 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhiQ-007olq-4j
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 15:29:35 +0000
Received: by mail-qt1-f170.google.com with SMTP id j9so16233331qtv.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 07:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3g/bTcIABXhuOTGEfGmYgpildLrwGp+xtHqxezjbAIo=;
        b=NvGRl5s4vqFzftFBVYbzn0j36YiyM/GWjZAGbCkajL/sLxlBhEvcsp2LMd1RHmK5LL
         slsh7taYrTV3agxVHFBhsh7Kr0dG/4my+u2K4+KDkwjgZ24wGbDDbwKhywcYzWP1t4Nb
         lGaCMQuqK2s+54yJGNPwb1P7AUKRCiXBOo2RyQtwj6BK8w2F+lPIjas+pp7rfYQqJlAV
         MJK2F7KZbJGyVRkm4t1nl1IB0d5ZBaQ8N644jSKnnzbrJAP2fzK0+R+c7g914QdHejav
         JVNrTk3uthT6oRVMoLmiTkWBIovQDQ5oP0qqQIypT60ouRKGUmlqGojOQ7/O+fHz1gkW
         3S9w==
X-Gm-Message-State: AFqh2kpQN1UhI52OMWi0h4BtNuXEznV218u9Ql+Hggz1R+mjsK/HQGk5
	lugUg5ktPxPoUq3SJV7sPzET1xKJS3xQLQ==
X-Google-Smtp-Source: AMrXdXstgWnCtUFTnTP1aa2Idole3SUvL5P4wARppKGtS8JsxdyYgrJA3x+Rq64AhM8ueEdTxVs7og==
X-Received: by 2002:a05:622a:1ccd:b0:3b6:3ca2:dde8 with SMTP id bc13-20020a05622a1ccd00b003b63ca2dde8mr42608684qtb.67.1674660571788;
        Wed, 25 Jan 2023 07:29:31 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id r9-20020ac85209000000b003b54a8fd02dsm3380665qtn.87.2023.01.25.07.29.30
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:29:31 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-4b718cab0e4so268181757b3.9
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 07:29:30 -0800 (PST)
X-Received: by 2002:a81:1216:0:b0:506:6b5d:523c with SMTP id
 22-20020a811216000000b005066b5d523cmr193364yws.283.1674660570612; Wed, 25 Jan
 2023 07:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
In-Reply-To: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jan 2023 16:29:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWo=6jR5WEWkdDWVCs0bUPFL3gyTVM_3HWh+SLCxQV5Gw@mail.gmail.com>
Message-ID: <CAMuHMdWo=6jR5WEWkdDWVCs0bUPFL3gyTVM_3HWh+SLCxQV5Gw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Move call to init_cpu_topology() to later
 initialization stage
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ley Foon Tan <lftan.linux@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Sudeep Holla <Sudeep.Holla@arm.com>, Pierre Gondois <pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_072934_198707_9F97C760 
X-CRM114-Status: GOOD (  20.24  )
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

Hi Ley,

On Thu, Jan 5, 2023 at 4:45 AM Ley Foon Tan
<leyfoon.tan@starfivetech.com> wrote:
> If "capacity-dmips-mhz" is present in a CPU DT node,
> topology_parse_cpu_capacity() will fail to allocate memory.
> ARM64, with which this code path is shared, does not call
> topology_parse_cpu_capacity() until later in boot where memory allocation
> is available.
>
> Move init_cpu_topology(), which calls topology_parse_cpu_capacity(), to a
> later initialization stage, to match ARM64.
>
> Tested on Qemu platform.
>
> Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>
> ---
> Changes:
> v2:
> - Update commit description with suggestion from Conor.
> - Added Reviewed-by.
> - Added Fixes.

This also fixes the error message

    Early cacheinfo failed, ret = -12

seen during early boot on all my RV64 platforms.

Fixes: 5944ce092b97caed ("arch_topology: Build cacheinfo from primary CPU")
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
