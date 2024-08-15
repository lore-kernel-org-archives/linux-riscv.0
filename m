Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5620CC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H5tJOeu9ROdo1MrfaCbdnxrwyR5YbD08NlRmUNnPKoU=; b=YqdwB189eVmiIzSTPoEClvnpy1
	zrKS1eBns3vxYZkp+Qz8LjLHEesOyeEvavp1xLLEtaqoh7UI878B6UD2rLxNjypENmEhMU1g4cTVe
	636i5tqgZybA62K9qeO1sqaBLjTBzHG8TQv7FosNBnjy/OpqBCfK/P01q11t7IipSCGWt2GiJZOTH
	k8nQ2TbeL5cRy4e2GzEVXnyzeKkTL9EYKA+V+eohDu+1HzO+Y8Fh+TVrcKhubwe8v74jisdJujD24
	QI/9935n9OpRL7gG1qFmIo58KnOJhGdYWk48QL/mhBIdYO8Q43K3UY4ggPk5etvL1NByXS+yigSyR
	qdXJrXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seadz-0000000A3uE-0rno;
	Thu, 15 Aug 2024 13:35:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seadu-0000000A3tM-3lHA
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 13:35:57 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 154E43F670
	for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723728953;
	bh=Z5UFM6jCql770Z7anv34dNUzaqaODcHWZimSfHmsQlA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=d5CiWCqU9iXQ+p6QwgluHa+tBT080OgSVDxwfecUWB33YcLLRha0rw58BOnC0Ch21
	 Jd2Grc4K+20lWR1cVx4GpSpIIi72n4aWv/Tx6OQA416NvtDMutcXRkladaVtbVZw9m
	 6Dodd7vb9k4aTsCxJEzWbboudY5dPUQqd20wlQqb4gfLrx9gCjE9+62tlTlFB1zKkZ
	 EfQod9cHXahIia9V2vYeiJvK8x2/WJl9cIyG4cwitY14ePUTzKwt1Cx7lvrJOtj1OL
	 NGCpNe7E1KFDPJNkwHyCvxtwjvKdV9fSBbgJn2TQK0zBjj/ay77l0HoPcQHj47AW+z
	 HDU9uFtjEHpgQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44ffb762db6so11491011cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 06:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723728952; x=1724333752;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5UFM6jCql770Z7anv34dNUzaqaODcHWZimSfHmsQlA=;
        b=sTPBj+49ixarJcZ55O/XzvZ9OPpmFKLLjlz/a4fi5Lm0lsoxwyFLBb1EHF9d2bcE4x
         WBNUIRaFk6TnuQGdQgTHmkcXcNtwqfhsEMXEzF9fv7PD9qC1qll1Z/M2Tv60p0izvne1
         dnkv0PJfJdaQSb7XdaVCejaBdyHM2QsHU98lu99IduepicfEPDPrqBVa6dVvyhOUpK+V
         f3jNPzgF+l7amwHh4RbmpZ0C0O6jrsYTTnVFLrXiYCcCGc6AwLvYmjJIMdahuxSNPDto
         Y0q0SBPE+nuG3T2JuLe4uxHfDb4PHh5lBpNHWQ4JQbuTG8N2rYqFSrdYvL4MYFDGGAod
         x8wg==
X-Forwarded-Encrypted: i=1; AJvYcCU75WbXBJFmj9nYVtTAxkVDudvPgbpQ4OpQIV+EVJuK1oebg9Wopmk3lMiV+EuhMsubw9lF2UWT26dhLd0C1lm6XW0LCgO1X4ZFsqz++RSI
X-Gm-Message-State: AOJu0YxT7Zz9cUp3svEwdPBZ9V2yefC2Ae54t1kbtmR4D53wifaVxXgh
	x2ZX/kuxMfG1L4J6apA39+WG89bxDTeeFJKZdShTlu/ovTgHRSJK809fvBAuy1qr/d6XJWk23V2
	K//5vn9X+fKPJLa999+OgGYHoQ44sWnp4VGYjT4jGAYxKQ64iK3p74CgxUEFv+QfsLsRtwqH3UJ
	U9EFbHbihHDnsXIH6cSRt4TazU1rtU/XO1S3unU/gg6j4y9SYNzmCq6gvT
X-Received: by 2002:a05:622a:2486:b0:451:8d59:9c2b with SMTP id d75a77b69052e-4535baaaf2amr69274891cf.19.1723728951862;
        Thu, 15 Aug 2024 06:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqiC54ur7so/hBdoMSAGpHK9JEALQBpn2eQz5+W592+eOzqpSFskWCFTHKjQ66+ydxlIf9iWgPRpkKAp1k+eE=
X-Received: by 2002:a05:622a:2486:b0:451:8d59:9c2b with SMTP id
 d75a77b69052e-4535baaaf2amr69274601cf.19.1723728951484; Thu, 15 Aug 2024
 06:35:51 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Aug 2024 06:35:51 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <87plqalyd4.ffs@tglx>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx> <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com> <87plqalyd4.ffs@tglx>
Mime-Version: 1.0
Date: Thu, 15 Aug 2024 06:35:51 -0700
Message-ID: <CAJM55Z_R6MaOwxSrBwnT8-1ZvMuUjiwhT3CuwMLYVd2qoGG-Yg@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_063555_420079_68AD4AEC 
X-CRM114-Status: GOOD (  10.32  )
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

Thomas Gleixner wrote:
> On Thu, Aug 15 2024 at 05:14, Emil Renner Berthing wrote:
> > Emil Renner Berthing wrote:
> >> 6.11-rc3 + these reverts:  https://termbin.com/q6wk
> >> 6.11-rc3 + Samuel's patch: https://termbin.com/7cgs
> >
> > I think this confirms what Charlie found here:
> > https://lore.kernel.org/linux-riscv/ZoydV7vad5JWIcZb@ghost/
>
> Yes. So the riscv timer is not working on this thing or it stops
> somehow.
>
> Can you apply the debug patch below and check whether you see the
> 'J: ....' output at all and if so whether it stops at some point.

No, I don't see the J: ... debug output anywhere:
https://termbin.com/3vez

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
