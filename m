Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9305CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otbYtsTA0BL/gHFR5pR5HD9P081yEC1s3tVByDXP9Rw=; b=WIVwTHIox9pLyC
	Ouq4KOjdaLPSX24Dwb9QJa6/GbfMtPB7B/RgXDoH0lLQC85NDJ3KCuWvF/9qm7elSX+b6XXYLo7HD
	bRonROlGpfbADVT7posg0IC5fHbVMAmbIQT8a4K/9GRB/rJQsf9ju+7kZSvVUtaVV+eFvKzg4TZ2g
	8Mk5T3JhEaAXlS3Z5O7yU4PJUOBrEiOAUe/Qi/l1YBiS9A+ttkZHaYu7EMvZnBhWgBwNtjmzzw5em
	FddCHmakGngde3ed4Cj7iySy4GJdI8puI6Tpn340g2gySKa1KqspxEKPCpxYZp1r9VUxLwA0qxoB2
	wRrOD/s1oXsn+/v8RnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGVz-00Aspq-Ry; Thu, 10 Nov 2022 22:59:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGVw-00Asns-KF
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 22:59:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id p21so2791389plr.7
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 14:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCiO+gXRF0lDVHlLBo3c4ej39VeZ3e6BYvKE2zsZKq0=;
        b=abTOCpM9RICqb1ONalOCn5LkxeesH4sL8drYDcbMXZ7kf00g+YuIpyzU4MM/cveqUN
         qweuuVXbHDaEYOpB2fvFUJ/8dB8L1x4/dbT3Tw452JhPAxjfIByRa/xziRHAHlkDIQW7
         qVvFTRg94rg0VkuoHQkhasr4ks6dXRN7pgaNfFhs47M/OgE9odD2HzsUweTg6tuai6Ea
         xKpQQVdSrZpzco6K6nR4sCVmSwI1mghyTguejHX9lokPPVS3gk53pqK4lyC+QNGNrpWc
         ThI6Z0UNwrLX0Jq2x4Ze/dlzkGwrQsC/pu619Mx8MXENmFS23EjZKrOR+p5MSOXfAuEH
         ZfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCiO+gXRF0lDVHlLBo3c4ej39VeZ3e6BYvKE2zsZKq0=;
        b=Zgz9HCItexXAcFoc+0zf4KM5q0Z9q8o0Txh6ZsG+l8oeMXNfcs1Do6I6gjhat06cJi
         7PVtvxVXdH4PD8/cuO1AVM0cqchPHeY70ONE/DXVYZn5qUEUPopUxPM7bqEDiJJpRYyQ
         6t65qhJ3nd6x4V75Fe+/UhMbYT31pAfzcWDxs6qfy3651W2//k87QBUXhw31CEgpjkC3
         7LJZDqOdjUn9P8zaCi0D6tta/9vhFv1PMo7rnj/adwFdSvYn//qMz/Cq0yLXvonlWlL3
         jhbSr35fFAcUrBHMhcDVbu18Id/TDRnOnILieeYYQGH2r+Azp7x3OC2RXGoR7YqvIJsI
         WGSQ==
X-Gm-Message-State: ACrzQf1Se6xj0hF/dh4COe5IqkDQ+v+XQlXn8H6guGPC/ASKQPFVmLe5
	cZFCxvOfJ1gAZSMReSpgjK2yYQ==
X-Google-Smtp-Source: AMsMyM6QmlJIusDk6bkMVYwQaiW/f3iTlZWIxaYlNHDq8CwDnodWF9tpEOQ3GmtzvkQ7TR4kWRhTnQ==
X-Received: by 2002:a17:902:eccb:b0:176:cf64:2f39 with SMTP id a11-20020a170902eccb00b00176cf642f39mr2423235plh.93.1668121154780;
        Thu, 10 Nov 2022 14:59:14 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a11-20020a170902eccb00b00186b7443082sm196815plh.195.2022.11.10.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 14:59:14 -0800 (PST)
In-Reply-To: <20221107151524.3941467-1-conor.dooley@microchip.com>
References: <20221107151524.3941467-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v1] riscv: fix reserved memory setup
Message-Id: <166812084905.21827.16442600363878515593.b4-ty@rivosinc.com>
Date: Thu, 10 Nov 2022 14:54:09 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
  Albert Ou <aou@eecs.berkeley.edu>, Nick Kossifidis <mick@ics.forth.gr>, linux-kernel@vger.kernel.org,
  Evgenii Shatokhin <e.shatokhin@yadro.com>, Anup Patel <anup@brainfault.org>,
  Daire McNamara <daire.mcnamara@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  Valentina Fernandez <valentina.fernandezalanis@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_145916_738912_35E462B8 
X-CRM114-Status: GOOD (  11.13  )
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

On Mon, 7 Nov 2022 15:15:25 +0000, Conor Dooley wrote:
> Currently, RISC-V sets up reserved memory using the "early" copy of the
> device tree. As a result, when trying to get a reserved memory region
> using of_reserved_mem_lookup(), the pointer to reserved memory regions
> is using the early, pre-virtual-memory address which causes a kernel
> panic when trying to use the buffer's name:
> 
>  Unable to handle kernel paging request at virtual address 00000000401c31ac
>  Oops [#1]
>  Modules linked in:
>  CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-00001-g0d9d6953d834 #1
>  Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>  epc : string+0x4a/0xea
>   ra : vsnprintf+0x1e4/0x336
>  epc : ffffffff80335ea0 ra : ffffffff80338936 sp : ffffffff81203be0
>   gp : ffffffff812e0a98 tp : ffffffff8120de40 t0 : 0000000000000000
>   t1 : ffffffff81203e28 t2 : 7265736572203a46 s0 : ffffffff81203c20
>   s1 : ffffffff81203e28 a0 : ffffffff81203d22 a1 : 0000000000000000
>   a2 : ffffffff81203d08 a3 : 0000000081203d21 a4 : ffffffffffffffff
>   a5 : 00000000401c31ac a6 : ffff0a00ffffff04 a7 : ffffffffffffffff
>   s2 : ffffffff81203d08 s3 : ffffffff81203d00 s4 : 0000000000000008
>   s5 : ffffffff000000ff s6 : 0000000000ffffff s7 : 00000000ffffff00
>   s8 : ffffffff80d9821a s9 : ffffffff81203d22 s10: 0000000000000002
>   s11: ffffffff80d9821c t3 : ffffffff812f3617 t4 : ffffffff812f3617
>   t5 : ffffffff812f3618 t6 : ffffffff81203d08
>  status: 0000000200000100 badaddr: 00000000401c31ac cause: 000000000000000d
>  [<ffffffff80338936>] vsnprintf+0x1e4/0x336
>  [<ffffffff80055ae2>] vprintk_store+0xf6/0x344
>  [<ffffffff80055d86>] vprintk_emit+0x56/0x192
>  [<ffffffff80055ed8>] vprintk_default+0x16/0x1e
>  [<ffffffff800563d2>] vprintk+0x72/0x80
>  [<ffffffff806813b2>] _printk+0x36/0x50
>  [<ffffffff8068af48>] print_reserved_mem+0x1c/0x24
>  [<ffffffff808057ec>] paging_init+0x528/0x5bc
>  [<ffffffff808031ae>] setup_arch+0xd0/0x592
>  [<ffffffff8080070e>] start_kernel+0x82/0x73c
> 
> [...]

Applied, thanks!

[1/1] riscv: fix reserved memory setup
      https://git.kernel.org/palmer/c/50e63dd8ed92

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
