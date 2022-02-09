Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48E1C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 01:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OoevdJE4gb5IERUil9CSQqOyuXv5IIvXIaqozjD5lEo=; b=1gd6D9pgBUKV50WuxmT5uFpdJV
	xK+nNqUMvpSICmzwbShsUHfJJciVTpSYgmlgZOyZBCoM2IuFiWOq0BKV24rkYrYetPPrlbgbF4s+9
	Vm+uhYJGhmICC098XvId5wQh/Z2fh2Vi4c1P1IYkETWga+uIQeOus/ugT/1O8myVUfZ/9YfrFgQlz
	Pu/o3FwzLM2Lqy8C+0W0CuU8y5QHiZN3Gir2ymFXTDR/OF8bggtYlJfeMciVxPj0qg61KLK4XFfHK
	+X2dOCn3eX0QLOkI/qlLxbKJAcwRkGdSaGebS52pqgOI9uBKNIcM/apMHzq84jSJPcS6xTlOxKk8Z
	NNYSKP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHbY1-00FtOz-Ku; Wed, 09 Feb 2022 01:13:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHbXw-00FtO1-Mf
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 01:13:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id n32so1437627pfv.11
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 17:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6W7y718FfmqJKqlTc/NMGFN0LXDpFekTjcKMsPXwoFQ=;
 b=CQhlZGjdUdVVtD4OqY0eC9dKLPULaUkBvi9OFswCOqu8BAKS8ZpZIg+nyCWk5uWgBL
 7r28EOuo2HnNVZB/JH7OpbDJqZaL6dpPbo/J6QrPoUk939Z3ftQSD5e9VDkQZhHRKxrL
 6xSduYB9vMCGazunnA7LSXSXYuDXZh8MPgMb11HU7SUw2EYzaeTJdKK/3OSgDWG3ZCqk
 KJUVmmhEn1CYn21FajvU3eorSI6PQsyeu2tllpjPC/VyM8pnh9PEk4eT0MrktNQ624Bj
 bVPQTt5hwxhi6qHBwe91+onCwRsATdeczwhyeWGMulxlKNPBY5NdV5cD0i5Lq1lDVkkA
 p1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6W7y718FfmqJKqlTc/NMGFN0LXDpFekTjcKMsPXwoFQ=;
 b=A+JcBkZxzNP/ioXGkKwR9bEDlkNxgHi4u1vfjyFmq1BKRSnIOXYAvDvuAREOR72URK
 XBBOtw/oF8iZFoPsmcOesI/6OQW/Iq+L5khRWwpEOmP0doAYEEctScylfpWzvimfwZYG
 CtmxOdiY7t1w5VLMsQgzL7vW+l0JGYT65sHctg0luIdGHmjofiNXM3ng5VYzDNeHaLqd
 8GdPcVO/kMx2LdwLq2cfEqvRvnoXkkj1LmGxkeguqzuQtrjKBDOMt55H7PriJ7n0GiaH
 hbsq9srsLTTuNYewxEMe6OYhQnHOI6YtrkgoM0oeNrOBPVoP0nB2hGb4iUbfjWBT+ckH
 Psfw==
X-Gm-Message-State: AOAM532KlzMmonoXmm3iYQ8XDhc8g7EXIY/FJQv+FP1aRgcnFFxg55CN
 9aRrZFLGBuZjI6SSqKW3nn847fLih30oPQ==
X-Google-Smtp-Source: ABdhPJzIDhsab6eZocl4TvpHmhPc6plEMeHHSoMK7vx8O6YcAiDhwpaaesBhLVYOeRreKrJJxRUZ2A==
X-Received: by 2002:a63:8343:: with SMTP id h64mr10036pge.566.1644369201816;
 Tue, 08 Feb 2022 17:13:21 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id mn7sm3816807pjb.8.2022.02.08.17.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 17:13:21 -0800 (PST)
Date: Tue, 08 Feb 2022 17:13:21 -0800 (PST)
X-Google-Original-Date: Tue, 08 Feb 2022 17:12:30 PST (-0800)
Subject: Re: [PATCH] riscv: cpu-hotplug: clear cpu from numa map when teardown
In-Reply-To: <20220123121352.13199-1-kernelfans@gmail.com>
CC: linux-riscv@lists.infradead.org, kernelfans@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kernelfans@gmail.com
Message-ID: <mhng-9439ea0d-b7ab-48ed-a359-702383ad6321@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_171324_848634_85A28187 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 23 Jan 2022 04:13:52 PST (-0800), kernelfans@gmail.com wrote:
> There is numa_add_cpu() when cpus online, accordingly, there should be
> numa_remove_cpu() when cpus offline.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> To: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/cpu-hotplug.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
> index be7f05b542bb..78d156a359ef 100644
> --- a/arch/riscv/kernel/cpu-hotplug.c
> +++ b/arch/riscv/kernel/cpu-hotplug.c
> @@ -40,6 +40,7 @@ int __cpu_disable(void)
>  		return ret;
>
>  	remove_cpu_topology(cpu);
> +	numa_remove_cpu(cpu);
>  	set_cpu_online(cpu, false);
>  	irq_migrate_all_off_this_cpu();

Thanks, this is on fixes.  I don't really have any NUMA-related test 
setups, but if someone has a QEMU-based config that's meaningful then 
I'm happy to add it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
