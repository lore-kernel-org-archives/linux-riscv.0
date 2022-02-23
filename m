Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203BDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 01:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wvXcui99BcD3Qozv2ncZXD4w7zrSmP711yaPJln3VBg=; b=v+ybI+uwwwkbGcnpspA9FsZ4lG
	o748Mgv6+dgfVBgRFotT6JDE8jRPiyrtXT01sLTDxd5N96dgg+uD5fD06PUNrZl/H/uWb48Tbg59s
	WAmDGsMo8MDmFgPQXTeqr5F2jLwYFAb46dRLNVldAXH9F2D1RosyB4uNk8e4670ECGUaGnYGgK1Dk
	lcrOY2H1NHTYyhk8bk8PXa4nx6iPcsJE8hWHFORSTrG8mLlxhhyC40xCyB/bBLjfA35bQaqFsSCcv
	xqFAnroG7/VJ3jCyCuW04371NWLJR9XEPvo+/uaG82RSGv1L3V9N/sQqSCXM3V+I4iuPNbygFMbWm
	kKb07dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMggR-00C9L8-Kf; Wed, 23 Feb 2022 01:43:11 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMgg6-00C996-B8
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 01:42:52 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso762189pjk.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 17:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=N2UCfbLp79h/dkfWTGY4WIVSQeEuINCqmpbos16sW34=;
 b=4LFj9bz4NwjfZrhnHEdaivZOeq/+lWRcuq5Y1wzU2pkH5M1EbGGH+iS2dAWte4zzK0
 uhfsYDkF8v/YwKD4UrkItpNjka+Xnb5VDUm1+nNaSTfiwLfufG7rXr/ximrBJWWJ3I98
 SVPPLrKIpK7zmmK0mTw99x5pVOqdEe7hcOHvTEa4Vd3384rUHgzjAjmsWfjUCq+/kFkH
 LdIKEFlWMPZJtDKZwldMNodHN+jWw5yu0bDJ44NRvdh2aClgYR4rkjeegQmMBQE1UbfI
 CHqHwSMlqOGdpTnIqkYZYWyNY/pga1f2aIBpTtYLUdCay8XLPTHf+igsHER5SXIaDjrF
 Bjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=N2UCfbLp79h/dkfWTGY4WIVSQeEuINCqmpbos16sW34=;
 b=QHhdmCPVj8wI9hEgDSBAyMjOB1OFb3rg4RU5GU8DB4a6MtXY9rbs5ulDonUYbo8AGw
 v0PqxYIA/9fXeTmJt51d8WtyUnqesAR72mSEhWKWHeNFgyF2+4xUrX5fW7ZAteT+c5xz
 Pueez1d6K5zuR/ARuecGOrW5z3YcA6S3eylSiufqrAeZBv7aKkoUmbYGx/yIDZnGn0XA
 eRGjvfHzOK2oi9UrYW1qoCJ/9ia7tP9zwajKml25e0AqBQXQp8P+bvDXKlKSQLBb34or
 /hNc0FMEFGzCilTlXzhkITADk/jfSkL1fPfHlCkeXrjl8o0lFOeNWJlwD9f05wuibMLS
 XOwA==
X-Gm-Message-State: AOAM531nVrEHXQqxRSYOfWpkAUMfo1mxR1VYivUnRkFGo7TSV9VV41Fe
 53gOVXC6xPO7nHEoyJAvbCSY+w==
X-Google-Smtp-Source: ABdhPJziibP3VeHPcI77/p+oZjngxSrgPOeEDAz92xaYnjXHit/HBL3E+aw7A2/vfSyzdBkgFOVIog==
X-Received: by 2002:a17:90a:a502:b0:1bc:8dd6:a859 with SMTP id
 a2-20020a17090aa50200b001bc8dd6a859mr2404594pjq.46.1645580569193; 
 Tue, 22 Feb 2022 17:42:49 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id bd13sm4528769pfb.60.2022.02.22.17.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:48 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:48 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 15:29:49 PST (-0800)
Subject: Re: [PATCH V5 13/21] riscv: compat: process: Add UXL_32 support in
 start_thread
In-Reply-To: <20220201150545.1512822-14-guoren@kernel.org>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org,
 Greg KH <gregkh@linuxfoundation.org>, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, 
 wangjunqiang@iscas.ac.cn, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 x86@kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-5c3b969c-9a23-48dc-ab10-a1addc6a5349@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_174250_392487_78C3E8B2 
X-CRM114-Status: GOOD (  21.80  )
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

On Tue, 01 Feb 2022 07:05:37 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> If the current task is in COMPAT mode, set SR_UXL_32 in status for
> returning userspace. We need CONFIG _COMPAT to prevent compiling
> errors with rv32 defconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/process.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..1a666ad299b4 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  	}
>  	regs->epc = pc;
>  	regs->sp = sp;
> +
> +#ifdef CONFIG_COMPAT
> +	if (is_compat_task())
> +		regs->status |= SR_UXL_32;

Not sure if I'm just misunderstanding the bit ops here, but aren't we 
trying to set the UXL field to 1 (for UXL=32)?  That should be a bit 
field set op, not just an OR.

> +#endif
>  }
>
>  void flush_thread(void)

Additionally: this isn't really an issue so much with this patch, but it 
does bring up that we're relying on someone else to have set UXL=64 on 
CONFIG_COMPAT=n systems.  I don't see that in any spec anywhere, so we 
should really be setting UXL in Linux for all systems (ie, not just those with
COMPAT=y).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
