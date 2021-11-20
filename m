Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236FC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRnbFDBF665991o2cqmu10eq1392+MnWch+RlnFOaJw=; b=xRA8GwR661/7+i
	zOONGxat+pHgdXnyJ9hX74FI7T67e2ZNolaBPEvOOuJ93r5RVBuZY1H9cOrbfeqgPHBziI3GYHytI
	0OZqikUB3iJH/asKxylPYoEpb7bv8SyckNmTU1txru1hGzyU0hYJkfht5wNMFhuRIyvRiuAtlz/Dz
	ujHAHriu5uoEsAqXD2UDLuDX2wdx82yHUM8BihW8/7GUOzDBPxpAFkjyryzmYLjASv8gFpRwp5nrT
	hxsPpLm4iVZsDyU8zEVMs2cy4PKpAt1rR8z0oQxPVzmXZz2xMtuIXJMssRtXqBUN1jvGFldZ3/6af
	xp3UDhbWfSlqE2y1Aswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHXh-00C08i-8J; Sat, 20 Nov 2021 03:59:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHXe-00C07S-M1
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 03:59:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so4083729wmj.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 19:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3KW2fH/dOJNfVmUh3I46vnrHPpkzt1L5iGQVTotVhc4=;
 b=vs6jyKbTyTloAogTFd0AecQgVlh0D9IhsDmJL7f9Pbu4b9ldCWk1LsmkdRb4+B7HFf
 /VV64azkeZr+01wtD/S09RPRyLCesZhBIcJxKBWqThbwKQ083x/yVpkJCxAyMBZnoTqS
 8p1zoZtvhWGUyFWMCLriFgv0VYGaBJKs9fCUy474Tmgu7Cx50OIUVdHeUIjBZJdMF8FK
 T21cfmqynuD+LokID/GxSg3hvMs4OUCB/ffKGIeIO0wjw0lEKNosjBw/yfccnIzsMFeM
 9PhY7oZxiqct4JuukkVx9c0CSdR3ExrWXJO+41VR0pyYba/mOQTfcjpKkwFj3s+IR80y
 eQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3KW2fH/dOJNfVmUh3I46vnrHPpkzt1L5iGQVTotVhc4=;
 b=XVSXbHoxJdrRq2vsuPg9lfOGPxNPM/UVQ93m25r+HMANV5PqCu8L5B4gpem4fSVwdB
 hNbezMLmVcUYMvPaAnvFdq2dj/SZO8jnazCaUQiyMtnZKECFIzI1f8quf0SxjxyOHRsD
 CC0QJDlQJS3DT8qsu8BfA2Rk3dpqaoeJfaZRo0AkL4oDDzLksuiCG31obZ8CG+7rtrhv
 zNwekNxsGgAk2DHrYaGxD9DIMo7MBriJSoPLhhPXNPe4d+KsJRFvL6gtngV1sBVT7fqM
 xrWtTTpgXcU/Po/PRHNVEVkaU4MTJPXd5KfEf8EgtXDe9DEz2qvL3CMn/yRS2yUlHYB4
 oxMw==
X-Gm-Message-State: AOAM532RWR/mWjzjVIdamCx0NyY3T7Ac7falinBPqSSGVCvvTgqtB2WJ
 DzzS7LAcYWYtUrs8TTcmAr/ytqLq1V+vCVW0UGcZ0Q==
X-Google-Smtp-Source: ABdhPJynv+3Wgn8IeW3BkKaEsON4nak+D1rio8ktZla4HpaWEb12Bo8j8MDmmlnWwnyLFlrPd2iNHso+BQZB/bdZ8VQ=
X-Received: by 2002:a05:600c:2149:: with SMTP id
 v9mr6573477wml.59.1637380793206; 
 Fri, 19 Nov 2021 19:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-6-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-6-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:29:41 +0530
Message-ID: <CAAhSdy0gwWOfUmqBXwZqKr-+crEXmvqO5gFC-ZQANw2nM+=MHQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] RISC-V: defconfigs: Sort CONFIG_SOC_POLARFIRE
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_195954_739465_11F2257E 
X-CRM114-Status: GOOD (  14.40  )
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

On Fri, Nov 19, 2021 at 10:15 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> This should have no functional change, it just sorts
> CONFIG_SOC_POLARFIRE the same way savedefconfig does.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 96c2a3615bcd..0f4fe5790fb5 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -15,9 +15,9 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> -CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_VIRTUALIZATION=y
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
