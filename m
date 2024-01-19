Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCE0C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBYPcbFyy+NDLKJHd8JPYG5YINMCHBsn+T2B3Pey6yY=; b=NvSFyTeSnTCx8x
	U3OYkMo5LZrpFnUACcBISMQooYcfrQ6aJogrGDmEh+Oy//SFapECMf9aL/4QfgU1/ygvDkDrfjk6V
	jDLhShsgMEHXEdin17hnKg62pub5xfYt3V+vZik8XlDoe0ix2PFYFo0MiHHkPvTzDxNuEHQ0zMRb9
	vEnD36U0FyULF0liU23i4feeFmc4adGcopReoRCzvItJA2L6R/EY8DsDulGUXWjpNlX/bRY4B66Jk
	NQoWuGcgFNExwQzBQs5mTE3qcYaBEl7MeiQeHFWrij8uw2nQc8tBkGN44ODvAFpXTB70yZXzf4Q0p
	ThcmkLnehqSET22rmxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqih-005zNP-16;
	Fri, 19 Jan 2024 15:23:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqic-005zMp-2v
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 15:23:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6d9b13fe9e9so736397b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705677820; x=1706282620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4piK4FlIBshk3S545o0PPe5+IQl2dl/fnP0KWlMUlPE=;
        b=HKPWPPiD7e9MxwKKR2vuqQkMc+LFgI/23QR1nHKWe1P9OuF3mnWDJkaHQdIQJZzaM9
         SSJaVpPEmFd7xaxpWSgt+y55Jy4s4x9oUHWnvx+MCacWZyNilvswz+qMbmXFS4hCbZqB
         PBFwxCVtYfWmTGkfoEcdeSYPKWdW/2UD0XWdLjFIGkVoUuck2QxqKWeK7B/T87FsoA2s
         lIJZ8CRJ/DVLpvM6D+fSdyxZVJeLcklqa3Re2GMShN3A8pB8Zj0mr1ZDuMn8EmNFP2Eh
         elCGE2tk14oWW5RFxV+KvFSNkLOdvZ5vELiNsJjgT2sMfAaEuLo1N8HnnQflayyomAOv
         F+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705677820; x=1706282620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4piK4FlIBshk3S545o0PPe5+IQl2dl/fnP0KWlMUlPE=;
        b=RspJjNRSWyP29xiH+GBszh3800W0yCMFHSaPqHUp51ceaFA+1EoZhaaZsQ5nE9MoBs
         HeTnEfsyCamu7CwQGJKaVfw4O+J4ZIN1vXq6ma6OZZMFOf8rIqkkJ3F8L4J1Vq+gXCCB
         O4DH/08LWNMBgpU+DR544EGlZFIcTwyRE8kElL5n22PFHqRDISjRQLm+WhrStU/6EAVi
         UF8MgCah/zMTNwQVAzcy9oRaDtYskHHYqCmHbl9ZRTEw6PvsM6rsZBLVGGsQv58Qr17w
         n9pHYBtqmEDmBAbjrW1pzffENJndP32KIl5GwwLr+UI3I+DvvFsazdNvMCrXWBXcxhqM
         7vXw==
X-Gm-Message-State: AOJu0YygGX3jsEoishAVEDRKcgnJrjdc2RNUq1gk2x18NgLtDmkdIAq0
	OfOUU592QqrVTqq78fnmK5ZnP3PL7Nyuqnit/8VR3DBwiGsVPhhuDtiIOlWcTPA=
X-Google-Smtp-Source: AGHT+IEDpAw5jRwxWDGo0pZARDmf9QlhA87xq1E/pHFbxmVfn6Z7N1QSRsRV5TCFojVTVQwO0YNAsA==
X-Received: by 2002:a05:6a20:4281:b0:19a:25c6:4913 with SMTP id o1-20020a056a20428100b0019a25c64913mr3247900pzj.38.1705677819959;
        Fri, 19 Jan 2024 07:23:39 -0800 (PST)
Received: from ghost (50-197-128-209-static.hfc.comcastbusiness.net. [50.197.128.209])
        by smtp.gmail.com with ESMTPSA id ks11-20020a056a004b8b00b006d6b91c6eb6sm5356928pfb.13.2024.01.19.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 07:23:39 -0800 (PST)
Date: Fri, 19 Jan 2024 07:23:36 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: lib: Check if output in asm goto supported
Message-ID: <ZaqT2E0rH3UbdnV0@ghost>
References: <20240118-csum_remove_output_operands_asm_goto-v2-1-5d1b73cf93d4@rivosinc.com>
 <20240119-1bff4a21b3d2d5c500a14fcc@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119-1bff4a21b3d2d5c500a14fcc@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_072342_943523_6918FB0F 
X-CRM114-Status: GOOD (  29.17  )
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

On Fri, Jan 19, 2024 at 10:41:14AM +0100, Andrew Jones wrote:
> On Thu, Jan 18, 2024 at 02:36:45PM -0800, Charlie Jenkins wrote:
> > The output field of an asm goto statement is not supported by all
> > compilers. If it is not supported, fallback to the non-optimized code.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Fixes: a04c192eabfb ("riscv: Add checksum library")
> > ---
> > The OutputOperands field for asm goto statements is only supported
> > starting from GCC 11. Split the asm goto to remove the use of this
> > feature.
> > ---
> > Changes in v2:
> > - Use CC_HAS_ASM_GOTO_TIED_OUTPUT
> > - Link to v1: https://lore.kernel.org/r/20240118-csum_remove_output_operands_asm_goto-v1-1-47c672bb9d4b@rivosinc.com
> > ---
> >  arch/riscv/lib/csum.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > index 06ce8e7250d9..af3df5274ccb 100644
> > --- a/arch/riscv/lib/csum.c
> > +++ b/arch/riscv/lib/csum.c
> > @@ -156,6 +156,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
> >  	end = (const unsigned long *)(buff + len);
> >  	csum = do_csum_common(ptr, end, data);
> >  
> > +#ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
> 
> Can't we just add another IS_ENABLED() to the if rather than this #ifdef?

Unfortunately no. GCC throws syntax before it determines if a branch
will never be taken, so even though the code is not emitted it will
still fail with IS_ENABLED.

> 
> >  	/*
> >  	 * Zbb support saves 6 instructions, so not worth checking without
> >  	 * alternatives if supported
> > @@ -214,6 +215,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
> >  		return csum >> 16;
> >  	}
> >  no_zbb:
> > +#endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
> >  #ifndef CONFIG_32BIT
> >  	csum += ror64(csum, 32);
> >  	csum >>= 32;
> 
> BTW, I wonder how/if the check for CC_HAS_ASM_GOTO_TIED_OUTPUT in
> init/Kconfig is working as expected. I see $CC, as opposed to $(CC),
> being used there. I believe $CC is just the expansion of $C with a
> 'C' appended.

Huh that is strange. It does work but I am not sure how.

- Charlie

> 
> Thanks,
> drew
> 
> > 
> > ---
> > base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
> > change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
> > -- 
> > - Charlie
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
