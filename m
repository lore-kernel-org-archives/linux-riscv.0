Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C087BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrI4At/fFfdozsretBsC4IxIzu8rNrLnKyeLcKr0B2I=; b=KFuSmgJj9Jp5Wk
	6xyr+FczJsrqEOXQKeEf+V95H7egpQOY9qpG+53bMY3WgmDuUIL09DrSPtNaLVblzVDRjezbzeoZp
	GMI3MTEpnSBEEHbg1nMOQNldjN//ed3jhs+CfHbHe8Yd2kaSnSEw0EX+ESQ/GnEtHXK4xPQLg52Mk
	htVAXLzLi8SfT6ii33ZDyllmF/X2Xq8mdtsU4ko6uHb8PZ8pcj4nExP5CNyO6pduCxzu4YkTeKxxh
	vGAZUyvHBMHjOfmbAyTQQlwNMHOAA7Pm9dQmsscSSMGnCcOaybVRiN5M9h1lCRFuMj+fezgf+MbAX
	J9gCtm/XECuwVWwFgHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaZ5-00000008ksd-3ZSl;
	Mon, 25 Aug 2025 17:01:03 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZxW-00000008e2p-0bWH
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 16:22:15 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e571d40088so41459215ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756138933; x=1756743733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gN8JTVN3UqrYbcE7si46e+ibxM+XGryuvpF6NcC0BZ0=;
        b=IhCgmtGyVXoOJC7f8Aet9Rfm9cnSAese1paa8zZeG1bm9W0B1DDzgOEdaQxgzgcvy3
         YXMUea+ykLdD80VeGZxpxiBHGAmlBkPWTQ+GkGZVJVnnx2fC7N1WUypduPiLvpZ/AAhC
         jndwNLIXb/5luPk+pVgyPDGxJnsWeZl5I0IoO9lV8joEJbNNotG8J0nC3yOupvVJuQSX
         fkOLR4Vy8O4Ssbr98Ky47FG3v+K1hL/+DlhKMyfBu6jObKIXn0GCOrDiurefUiFOLTum
         /ZKPHEW6VGem4vuEa6Sl8f1DSMYvOSygrQ1jqZ6s1QyK0HDusl9NNQpzBgkTWHCIS1rt
         /hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756138933; x=1756743733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN8JTVN3UqrYbcE7si46e+ibxM+XGryuvpF6NcC0BZ0=;
        b=YEtTGJbFo3nwv4uVt3q2eYGsTwGkgmUqTkp0xneZrG3cIGaeMI6efQVr9Io5vwoq+s
         Yz1R02xW+f6wFgug4W7F8gyxaj0PYhzM+U59XAduOWsaGiBInoRnl1tKc07uIYcOqEEP
         3/DZ2k8HK41VqgXi/H4rSM1e72MLQNVKvEPeAgo6DYlZfbpZ3n3qWujQypPUey7ZTOJL
         /+8a+3lJCCvIVyy7xV4ER+cUDdB/xqeYMeizuJbVisD+9ZeD15dAYG8v4RDX8UQXDdcc
         rF7xOrgkWYkAgBwCvP/0Z+aQlOP3GYvC2+M7jTSdO3rOYCwtStjvK5KZIxGrT9HMk1ts
         e+aA==
X-Forwarded-Encrypted: i=1; AJvYcCUXRLNHDyfqdsKeQ/H0+ksoMARFEaa6gp85Itgx1BHVE390sgQcaY061xNVU1KIPvVIhgMc8Jg0s2wBvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGkkdG9hdL+6h8WPZQrH0hb7TqahXj6UGGruikvN45G1M0XW2/
	xb4AKLkXWyrgGxa12+B28NodAp0B+k50OTX49e376gQQ7nBqHnU+cSZ4w7rcXP5qbVU=
X-Gm-Gg: ASbGncsASpjC95PH3cPDZO3N9rUUp9k6NqcL/JJTAhv0yVN76F3RuRZ1u5Ve5oF2hzG
	rTuM/cfS5QTbHy/QHgSywnVRGs6+qIYsQkI6bzEa97tv7tIv0K9/OY77AmpAUuVL7HN3M2+TXZJ
	LTvvLCNShKWzM9y4HBEtGHx1Kv4izza8LzFK4HbiAiZOv5KSi6jqfnRYVLRfEuWAHWbXZPvPQWn
	fdqKFPy4aHxrbrO34PmlDXmLfDaTr+g5Meb9RygZpybgY3r5Zl6ej5XSS96TMADUVSzDCUnN29z
	buCB0HWfji5YVQ9XQz+YdVh+fzso/i8aQirTEXUi8UbH4LCHGa+2AvT0IkzZUX5ATL4EwLgQT/O
	1EUJLKjE9eBDWja3U+iAC9mmf
X-Google-Smtp-Source: AGHT+IHxDLcJHAYpyzsrbmn/aJb96iGEjJWm0YdiTY2GoeJB5NHC5Ix7Bwg5uxn0XGZ/yig4LtZaRw==
X-Received: by 2002:a05:6e02:184c:b0:3ec:40cf:2d37 with SMTP id e9e14a558f8ab-3ec40cf2ed7mr61486495ab.31.1756138933068;
        Mon, 25 Aug 2025 09:22:13 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4c28624bsm49231365ab.18.2025.08.25.09.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 09:22:12 -0700 (PDT)
Date: Mon, 25 Aug 2025 11:22:11 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: skip csr restore if vcpu preempted reload
Message-ID: <20250825-69a3c8b588e0bb1fbb5b7beb@orel>
References: <20250825121411.86573-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825121411.86573-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_092214_191757_37B64136 
X-CRM114-Status: GOOD (  19.11  )
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

On Mon, Aug 25, 2025 at 08:14:11PM +0800, Jinyu Tang wrote:
> The kvm_arch_vcpu_load() function is called in two cases for riscv:
> 1. When entering KVM_RUN from userspace ioctl.
> 2. When a preempted VCPU is scheduled back.
> 
> In the second case, if no other KVM VCPU has run on this CPU since the
> current VCPU was preempted, the guest CSR (including AIA CSRS and HGTAP) 
> values are still valid in the hardware and do not need to be restored.
> 
> This patch is to skip the CSR write path when:
> 1. The VCPU was previously preempted
> (vcpu->scheduled_out == 1).
> 2. It is being reloaded on the same physical CPU
> (vcpu->arch.last_exit_cpu == cpu).
> 3. No other KVM VCPU has used this CPU in the meantime
> (vcpu == __this_cpu_read(kvm_former_vcpu)).
> 
> This reduces many CSR writes with frequent preemption on the same CPU.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>  v2 -> v3:
>  v2 was missing a critical check because I generated the patch from my
>  wrong (experimental) branch. This is fixed in v3. Sorry for my trouble.
> 
>  v1 -> v2:
>  Apply the logic to aia csr load. Thanks for
>  Andrew Jones's advice.
> 
>  arch/riscv/kvm/vcpu.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
