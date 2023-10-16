Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D94CCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 22:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqCs2zD6nUsE/lP1srGk26UnahDsgtdlM6tEg7sX5A8=; b=2y2D+Z6atFjPG3
	ETn4G4TGCklA8pK3+MYVREyZQCWiCNU1Lh+I+QUXKdLueYalhiOg51s8yf4MoDpRYXi0WbCXrDEs+
	MWXcoG+tXctrM6twrGY9TGKfWFRLd/8QGWub4QltiWMJii2WQhHXblud0KDxdk9FqxUVhLqyxRQEh
	3F78pxMz6qkf1Kck2dpAeivD0H6XQmE6mk6gkeWFWBc2xhHKMxavOeUyjLqsIUwewOWWvmss5JKPB
	FTN27ronf9JJ9W6N1KMZ8VX1btGckwfinFXkNuf35Bl1IwV82KPO+K0vNAlfJSTGnHMhjYLDKPBn3
	FtTbHB1DjxLwk5zeeS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVzJ-00Ai0h-0c;
	Mon, 16 Oct 2023 22:23:01 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVzG-00Ahzo-0k
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 22:22:59 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so3583760fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697494975; x=1698099775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ep3okjgpPqs/SuawFmrOIwNlvj2vgI/0SEsxtO/LHEg=;
        b=v9K4+HhBQgwZmOSzOj34DDExbqSdL/0NU+Z0LklkNCwuRVorenzuBPPouRAQTWZj4X
         wDy84rKuFBnk+QTscLNLpuVNvMlFtPBx/rJ6q6rTJfi0OdVJjxUd2t6L9mRqElv8ksLS
         o/hluFtKeZcOwKSfcGoRNU5aXTnZXeIQcrCDZAv7zRgkcpNPCYR4hahxfV45xEcKpv4g
         p2PEWCuhF+D5unvXgMH8+j3oXYpMRZsbg2R5KrvCdU7a9DN1nwcLk1inAMBgZm/IXAMI
         cECOSUD5uV2V9/JQPXyrlYvIz71mX8YKQHTzr6YQQLR6S9iFkN0CXQkP+d62Y1Hmhelu
         m88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697494975; x=1698099775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep3okjgpPqs/SuawFmrOIwNlvj2vgI/0SEsxtO/LHEg=;
        b=Ly4sRZdOuJFwmINGJWpvEbfYHJgMSA+JvXgJBXXvyIW+b1bAKxuOHS6+kYS47rR23h
         ScQ8YRGcUlgg3X4Zxz68a8M/NEsd+Yxep3m4ofnPobZ/77cwuXkof14D3cBod5ZCBgEg
         sP8MSY/AHVPtttW3en5G79eca9TkDflcsCqTYeW16cvardrBltSJIrYcbkRA9aaxFBxQ
         3uAqw86bETB9ggW5M1NreWh3+JILTATNKuA+wwUSD0KHmThwn8eW6myiJuYfH+Nfynz0
         noaXQsq3j9XIbTF5SUmu5gdDf8zUB0m5JBK+KJW2zYpfJwv1lDUOnwB5Rq+Im820wRjm
         /Pww==
X-Gm-Message-State: AOJu0YybWysbVOD2Lb7eqD+thF3SdEmLR9y452q7IHJolYWFtl8MYTyo
	FLunJUG62Re4/aCSOkabwrzOiA==
X-Google-Smtp-Source: AGHT+IHiEWD6MRJd+TaZ6w0hpRhBtF+BvSza1fmbGFOxARxyVi2XYgFgQfHLOFHJi74OH4nTUE5Qgg==
X-Received: by 2002:a05:6870:1157:b0:1ea:aa9:9b00 with SMTP id 23-20020a056870115700b001ea0aa99b00mr413599oag.57.1697494975207;
        Mon, 16 Oct 2023 15:22:55 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id j25-20020a056870169900b001cd1a628c40sm17676oae.52.2023.10.16.15.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 15:22:54 -0700 (PDT)
Date: Mon, 16 Oct 2023 15:22:51 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 1/2] riscv: Add remaining module relocations
Message-ID: <ZS23u+NvzU6RmFbj@ghost>
References: <20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com>
 <20231016-module_relocations-v3-1-a667fd6071e9@rivosinc.com>
 <87h6mqo2r3.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6mqo2r3.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_152258_513371_5CD698AF 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 16, 2023 at 08:12:32PM +0200, Andreas Schwab wrote:
> On Okt 16 2023, Charlie Jenkins wrote:
> 
> > @@ -81,7 +82,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
> >  #define R_RISCV_ALIGN		43
> >  #define R_RISCV_RVC_BRANCH	44
> >  #define R_RISCV_RVC_JUMP	45
> > -#define R_RISCV_LUI		46
> > +#define R_RISCV_RVC_LUI		46
> 
> The latest ELF psABI defines 46 as reserved.
I will remove that in the next version. Thank you.

- Charlie
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
