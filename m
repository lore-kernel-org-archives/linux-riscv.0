Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D4AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdPU7c00nFK/BoiBppwQ1O8/zkqVsK8Uy/4a1Sc612w=; b=XqXYAo1NphsYA2
	ZmnmT6G1ETWnRNNrsM9C6KGbZo7bGLtEzRrk2UqqEi5wlW5BUKGWBp8L0JatqWygXDMBJprxa+yZb
	+6bfCdiKQ9PqglHpjXry+xsIlUaZTCEqTxuLGlO5v9UxhZ2QzeH3S+xYBAKPFEDL7HczhcVNBybT+
	cJqdXKkFIELT/wZ+/ZOVBLeNTNKQDjkKWS2iqxPKzeLlA7KiFhZHf373oWEa1/3GSMV2b7T9qc+r6
	mpiTVZCdH/D00/kEE7NwKtJsWFxkYy3w+3tm0MhU751HpwSJeVVRimL+TtBjF4GZVsQRmWgpxiUUf
	76YWFoI+hy30YNyNuuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMl4-000k9S-K2; Tue, 23 Nov 2021 03:46:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMl1-000k8W-QS
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 03:46:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso412305wmr.5
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 19:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bp7mEUVEt5QqG8xtFw9E/AxBIVfYeYYO56kVpuGbx0w=;
 b=KyN9plmEYyF3x0xQCMBvv/ru9mWfjMMKqxC5jgl0lp/npQTuCiJHJwFP7tGG1y5TJd
 viO7MgOcbUYXROE6Fdvaq95av8hNE8fIZB0y4/sEKguAibSAlzCbgZcjoRSbHOW5r2fr
 jyO8qXc6/Ye0pzZXBQ8o0vAe01kTq+rN81c1H2rp5T3Vl00al1Lk18B1qoyjtvojBKNn
 AIwNUdve229Uua8ERl9LLmtfTSEV0ud+DOu+8sjZYPUDL4fizeWm0DEur8ToXjkgehTE
 Z1/mJWLWkC2ZLy5Dxyg7XGLih5qK93mqgrkdMZjgRoKy+ZbQ9d8RmBWEsVkrU/UHOeBq
 ix0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bp7mEUVEt5QqG8xtFw9E/AxBIVfYeYYO56kVpuGbx0w=;
 b=73FN51jgfSBTI0WKkYohWmSiPPHfrYMbJZm6bH2sVAOTkzV9X7FXpLrJXTShzpjOYq
 6610LSna610s2QrKC+Sdho04XA7lWu2J29xglkTS9a7UNSpoTe060dv7zMxStcAw1yFm
 yPLGNsdFGzXoqJEbAmFkBfl6b1Wo0SDTY8dIWBqwXp4MpQrK0j0hFi9Ec2VfBaPLL8RX
 wE3FJ2SptGmBks/vAClnNridDwKYvevwOvoHx28vAWUv/o2UsHucC/eCHuQPfLrLz327
 RCiyGvFkQOhdNGFOWGCM8QfsnHpLJnqBmyCdcJ5ao9nRZ8UktehJOtrnpkg13eFVWYyd
 MNJA==
X-Gm-Message-State: AOAM531HFqBwLN9DEGbAnn4Z49wsKyoVC2MlIv0p6lCYYeW7a/fehOZ7
 sHf4j6ZJZdmhaU+myrTxljsm1JZGjZf1b6ggV724Ug==
X-Google-Smtp-Source: ABdhPJwF++wWUq50mUMTn31nsRbQkp7Q/pEnYoXUvcdHVH5A7NkAMXK0YWkEElOmdUQGxHy+cfheXIlQKhKS83s//+Q=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr3008380wmb.137.1637639168977; 
 Mon, 22 Nov 2021 19:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-4-guoren@kernel.org>
In-Reply-To: <20211123015717.542631-4-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 09:15:57 +0530
Message-ID: <CAAhSdy3+hY1jwNAOrhE0kiCZPMRh4amY3+Mn-NR2TDFQ24orwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] riscv: Add riscv.fwsz kernel parameter
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_194611_881099_ADE174FB 
X-CRM114-Status: GOOD (  15.78  )
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

On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
> 4MB(32bit) in Linux. It's very wasteful to small memory footprint
> soc chip such as Allwinner D1s/F133. The kernel parameter gives a
> chance to users to set the proper size of the firmware and get
> more than 1.5MB of memory.

This kernel parameter is redundant see my comment on other patch.

regards,
Anup

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 9725c546a0d4..ee505743c8f4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4964,6 +4964,9 @@
>                         [KNL] Disable ring 3 MONITOR/MWAIT feature on supported
>                         CPUs.
>
> +       riscv.fwsz=nn[KMG]
> +                       [RISC-V] Determine firmware size to save memory
> +
>         ro              [KNL] Mount root device read-only on boot
>
>         rodata=         [KNL]
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
