Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0357CD10DCF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ccewu6PfsWjA6egHE5+dVbTsVHWeI1CutyvBq+6sbb4=; b=QYQU7tV9yTc/p7
	vrJEyEr2asws9rQYKwF4HSOQupyOpMDxqj6D3yk/u64oWbyQQi4kCDU6wwjozXTMeZzGpSgECZPgd
	4/Ry71Ligab5o5IIzdKOJFYAx5swIdgJigpkPcpRcbn5jzsER+t+Xql2QdnGOsNBI3/Wd+XkrYjRa
	5NWImoNDkwjuEb7H4SE6qyEafjwt5VUZGT7eHNvvRscnjJPmJ9BCoedjhtTRXjQXSGLo6vYVauKO0
	/+pjvGzd0ZAwHhGDFPQtwFT6Y/HgvzKIfwR7rSUf8VLdOGdz1wsfVGLZBUdr/of25xdro4Mbt/kih
	ahFo254MSBRlPsW8v0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2KP-00000005Uzf-2tyW;
	Mon, 02 Dec 2024 09:02:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2KJ-00000005UyK-354g
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 09:02:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434a736518eso50354185e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 01:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733130161; x=1733734961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqKOPBDUL8YN7lxc82mF8ZRE8Y/MFtvKPLpgicB0tj8=;
        b=MjWhOscAYxqynSKCNiRM5Vv51U8jETNCJWgErnDHakum1JGIyhxrV8bv0qmiFX3Ni8
         toIrDjxg+TJ/7Gkhm5NgvS3G66HTW7cFY3DrBmwTA/SBjXb9HCr/6AbliSP/ylqes9D8
         yaLctl1BeL9uxiD+EEOCh2n95W9vsX7E0U5+Ia8ztsZIdIKZMYJtGkcPz5SeG+AEgqPq
         zPRzyfvmF1WeLkpfdprKCE5HXB4VdHXc+DQn0FWE32q8NMZW6vTFBEVyL7CRS6a6UCWH
         NHhYCZ+G45hjAxKkcrUXWBVaWZsrqQJ9ORzcretn5lJkBreFXiAJFNjDuRJin+Ima0Qd
         P2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130161; x=1733734961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqKOPBDUL8YN7lxc82mF8ZRE8Y/MFtvKPLpgicB0tj8=;
        b=ojn2uoN5QGFyv9+JgibXIGR7c+8TvZh8YvcGZ+h/MlEiSokTsDJvw+ld209lDVDkpY
         WkINrTuAg6GfZWDFfjSjz1bt5HtoR0W3gHgp3GeKW7ma2tlHhjpReyh4A/hDWmGDPG4R
         jlHHw54vNpSV0aVWMq/ZZBh97/fk+vhDTYCB1rQxFsnGz4BpOzdSAQ17VhBm5Pq/AgLQ
         XT/MsffIuWpK8M0y5bxciaFwHfgAtA8hjJ0vZ3rOCF4COY2Jzsi/vx2S+8ENYU/qD34E
         DxWygXi+wgHeURzWLB52hAh6OoDOoaHpbJJO+HXq+gW+HtGBwoPLpW6P/vsz4++ehnTx
         +IWw==
X-Gm-Message-State: AOJu0YyYYtRptbS/8MrV46IaUQ2YGGoo/zCmoo118WxzS0xwJN/qZRtk
	2S5SugmBlEaNjpqxIrqmgben9Rc+NdVjfltm19cyrGCee5vLNSPrh7xAx8s8c0U=
X-Gm-Gg: ASbGncsf6Zc2PCa67MAGZccamDw3Dbgiu8/qBUvHIBQ+9X2J2LquH2HnD9omSMfbBip
	HmI/kG00Ig4kZmcGQF7LdgTQhvronCp/ifOqRj+q/XBXsKUqUC8PWeRtf1h6U2CnY4d2tHYtmax
	bptL7gFPVhTCXz8S0vGTkAE163E0PvPNuGSOUlnMAsCZga37Qwyhq+pgXoW5Lz1DeJo2LnJ9I9r
	Tc2KClfp1DWNqY4M5+5oiellTpcx4biKDD/keckWXp4GKZRUSngBqWU0IcwpbyWEv14Q1o4ipEL
	4lGtFNUJhJgg/UMblYiC8C7AJvHXC7kZqco=
X-Google-Smtp-Source: AGHT+IFttgZrGyLSVAtu4HIwgJCguSjaFhoXqHZXxW/+T/9wVzQpFWrJRkjb+SO/dy8gXma9TpsuBg==
X-Received: by 2002:a05:600c:4e8a:b0:431:562a:54be with SMTP id 5b1f17b1804b1-434a9dc36c1mr239498965e9.9.1733130161384;
        Mon, 02 Dec 2024 01:02:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm175993565e9.43.2024.12.02.01.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:02:40 -0800 (PST)
Date: Mon, 2 Dec 2024 10:02:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: Re: [PATCH v2 1/3] riscv: ptrace: add regs_set_register()
Message-ID: <20241202-70fdc452b13e10d15b0641b1@orel>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
 <20241201102759.221176-2-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241201102759.221176-2-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_010243_773039_1A66054B 
X-CRM114-Status: GOOD (  21.91  )
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

On Sun, Dec 01, 2024 at 10:27:57AM +0000, Ben Dooks wrote:
> Since we have regs_get_register() and we could use the set counterpart
> for things like fixing up traps, add regs_set_register() to set a pt_regs
> value from offset.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
>   - fixed Andrew Jones' suggestions for comments
> ---
>  arch/riscv/include/asm/ptrace.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index b5b0adcc85c1..45c503b592c8 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -143,6 +143,26 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
>  	return *(unsigned long *)((unsigned long)regs + offset);
>  }
>  
> +/**
> + * regs_set_register() - set register value at its offset
> + * @regs:	pt_regs to which register value is set
> + * @offset:	offset of the register.

drop the '.'

> + * @value:	value to set register to
> + *
> + * regs_set_register sets the value @to to a register whose offset from @regs.
                                       ^ @value

but just write regs_set_register sets @value...

also

s/whose/which is/

> + * The @offset is the offset of the register in struct pt_regs.
> + * If @offset is bigger than MAX_REG_OFFSET, this will ignore the write.
> + */
> +static inline void regs_set_register(struct pt_regs *regs,
> +				     unsigned int offset,
> +				     unsigned long value)
> +{
> +	if (unlikely(offset > MAX_REG_OFFSET))
> +		return;
> +
> +	*(unsigned long *)((unsigned long)regs + offset) = value;
> +}
> +
>  /**
>   * regs_get_kernel_argument() - get Nth function argument in kernel
>   * @regs:       pt_regs of that context
> -- 
> 2.37.2.352.g3c44437643
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
