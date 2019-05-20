Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04787C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 08:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD76206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 08:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTvTkKAL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="aN7TKzsw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD76206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VO+nDywuCfmrXzQxcNEEK/VScJghwfKYb8xSMwgoaqg=; b=PTvTkKALGAChzM
	wN+Ij8QJ/u0PkLF6GS5196CNeScG0C3uoT38kBHaL7pB8H4kBL42eGD1bTfcA1SEi2cWsxKnvmYwO
	StcjU1mT30GbTXiiQRUUDwJgVuTHVHi6fqXdHC7BrxnKiFftCA57xzpAsn+aFnu441usuHf4a/1fw
	XOzfXRciNaXNg1wJNngL1Y7+7R6PZPHaFVppFnSJvzx5yjzuXJ7mspeXZ4/HccJHZsbERziCmyBIw
	LZq2gv3mBwHe8qZ5S74eCard+SrA+8xD2e96u0BHQn/sD2YkDmqCIpVzxNTkSyyHpkZRD6IYomOAV
	hV594NH4oDHaGCg/sY2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSdJ2-0001pY-Nx; Mon, 20 May 2019 08:06:00 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSdId-0001GH-Mj
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 08:05:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id f204so12237029wme.0
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5i7/XDpfm3fWH4Ml9uuxM88EMAgEyCkLNLDzAUDSZ0=;
 b=aN7TKzswvueSwWlYr5KtwQEUDm4FwOzq19jE5z3pv8sUvOak2w8NcLvYczOR7mVdEC
 P2S3uIzCkjtQ2aotwBcpbuqNF8Cw3Da3lTLAWb0zExra8L3o2umg7W9woO6Xc55C0ZcB
 dQoN0Lb5efbJMs5Qne9S1n6yybhaXFZy5FvGFUeQ0PUlIm27zEYRMTTFWxf8hhSnqryF
 9ceGvzS6/zQ0OevUJKDf/3nlg4O9TkUuEl4tQukvHwYnP5ncA78N8Ci4Z+1kJdbTYECf
 8C5g//rspnOOH0eaE9czErhjwXHfKaf1FO3A6PMEj4quNFYDKeK9rEge9cGMmzlLLtBE
 +8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5i7/XDpfm3fWH4Ml9uuxM88EMAgEyCkLNLDzAUDSZ0=;
 b=OAoIRtZIPHKrknrVkAjYishAjds8Vptvm1NuxiIIdgpn+2t92jLrSUPF9oXji/LrFi
 +qjuprc9NlkPc2q4CwBmQS4JJMAMnM4tqsetEdp5zQenx8cuAf1Oc0lTT8oayQM5IQZ5
 D3Yom4Kkn3Q/H06StNtAZiPqd1CvLNTG/m5HdSYgkDH0DG7/CKP7AmVBdYAnjvDWb7AJ
 gDPZ2NQRP6xZbRvoOC+uJhCBdt+LYcNV6C9cLPa7LgPjxrceNKgv90UlHVYr8Pal2F0p
 jfH42TbO5yUG4mDQ0krawZIfMu2Mrfzc42/RZmKWKwCtRhVUZxXGTcIYexSDVYwdvSMb
 SfWw==
X-Gm-Message-State: APjAAAUb2ZxBna2/xifBTTMVvMVkBUo7msB/nGHCFqcdiUve4R/jy35u
 EMAqS8hXdtAJMUIHIEl1AdhYl75hX5S/1Yv6ArX+kQ==
X-Google-Smtp-Source: APXvYqz/x+wplnWtWRAm2caTMk28mJLp0zciA4G0yf9XqQh45uE9rk6iwDlg1+yyxEcWuqSPKpaVVr0N3xBRPIdMPI4=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr1909247wmc.10.1558339533772; 
 Mon, 20 May 2019 01:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190515063004.3466-1-anup.patel@wdc.com>
In-Reply-To: <20190515063004.3466-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 May 2019 13:35:22 +0530
Message-ID: <CAAhSdy3GqjS06QxCtY6OUkBZds4gygQsAkaoaa+sMj3z6qgUBQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable NO_HZ_IDLE and HIGH_RES_TIMERS
To: Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_010535_781457_1CC4B3D6 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 15, 2019 at 12:00 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> This patch enables NO_HZ_IDLE (idle dynamic ticks) and HIGH_RES_TIMERS
> (hrtimers) in RV32 and RV64 defconfigs.
>
> Both of the above options are enabled by default for architectures
> such as x86, ARM, and ARM64.
>
> The idle dynamic ticks helps use save power by stopping timer ticks
> when the system is idle whereas hrtimers is a much improved timer
> subsystem compared to the old "timer wheel" based system.
>
> This patch is tested on SiFive Unleashed board and QEMU Virt machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/configs/defconfig      | 2 ++
>  arch/riscv/configs/rv32_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 2fd3461e50ab..f254c352ec57 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -1,5 +1,7 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 1a911ed8e772..d5449ef805a3 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -1,5 +1,7 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> --
> 2.17.1
>

Hi All,

Any comments on this one?

@Palmer, It would be nice to have this in Linux-5.2

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
