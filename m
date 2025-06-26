Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C702C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 12:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHOoGwa9tE0nJTBZYtsUKCxLTk9ga1ltYO3u+mHz3tA=; b=cC8vxia9Ws7Q3o
	7Z+TPUnFbsJKBQccp8oaSeM5EmZbce6ENJvKYMbscNbWPgoQkniBsjfRC3BlESYF695vLNF50djTw
	LtHS8JJPxjA5+dluBCIeaaFMJszFBBoWeBTepXFdo8RVGgnoGTJSOJhVLpvZDYsWizePTo35uEpT1
	Ibu0zmns65PynicBpSYXFTeRA0um6D8z8FXNhif+r9S97jPIi7b52hUr/xIDuuf/mTlWMz8Fswy1b
	fTBoB2dkHdgXZUuF2JfHoc9q75ry3kuZdibe4U2muNbmQePuAVDHkiFFFl6UiGSHCymimPrL2FzHT
	8zp0qia/n40OtJrdxQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlHS-0000000BUGJ-2ljH;
	Thu, 26 Jun 2025 12:00:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkAm-0000000BKJA-3H3t
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 10:49:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a588da60dfso516162f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750934979; x=1751539779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1a0bjQkrE0lXOwbpfOZiZMnL8XuL0L+bDp2YasyQuLw=;
        b=jLm2e7tBY/7PhYSK0BU1tzBYjOreBvzXT9jeubCzT/Ymc82QH6ITBcgZfjn6QjbE4z
         uRpCEUttVOdfhYCbQURIc/aQFHL1aKBA4wI7pvRtLjesqrabHW9fIJTt5XBjMmRYnNPY
         2Xrz4Lpx7CM9MnHHQ82vEFq25K93ziIortb6YBrWlshPvJ9e7FyFDCSisYaD9lmZQtPy
         tz5UCS2FdaM+5TFizaEonzFSaUAByKJkmuQHhsgkwsAY7j3WskEy5vh8edSRzkxdc5eb
         krqXB69qBmi4CTxkBVo5bQCaIiEJ6F0lOAPJZbXFFjeStE0rj9TVXRErGcKeoyTZmVU9
         VL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750934979; x=1751539779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a0bjQkrE0lXOwbpfOZiZMnL8XuL0L+bDp2YasyQuLw=;
        b=uboSRrpb4GXMII+lZGaHOYXW9FqYqPzTSekNJLUi6ESthsN/b8ybxWoOn6M3XgmH69
         icL8KzIbYleQ7GOvYwdYls9x1FQPYvDMHZ0MUa4vW8mJ1q06L3a0vcs9/uOcxOBVoAtb
         6gUmJ9fY+VRFPTdsvC2MpRDCZTFIN7gNK8MIBUx7Louiv2ERQgE3vW8D+9pTVmzMgokg
         cjLrEJxGKsUgZDqmsWNGxnCBtVl/GrVbfFkefFbToJ/2L9N5qsJ6ZseQlA+jMTxXsZcG
         sdGKGz4F8ykQ8MskcO0ySw2oNboQSHFgMlaeUhoQBKzsUtvB+qlFV6OmXoC1SFtsNVu4
         huXw==
X-Forwarded-Encrypted: i=1; AJvYcCU0SbsSWB/oM9suav84DCbVIeJKAskyKUhUaVdx6FB8QQbx+z6dj1NaGUUrPtZbGrwIQ63XjRmngjAixw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2u1vQE1deLvF9g9+O04Lj29LpS1MhrDi5yEAHe7EhGWvJYAx8
	0yzrfSOWrIN4CC1v26oLBFzGnFy+w/oVH2gWLjLaJ1aCskUbgVbAlxJWg9y/XehbNpc=
X-Gm-Gg: ASbGnctIcl1Tamwil0mj55PlhTDtJ9Szh1UfomZYYfXGComhXJh0MLKe256PNjSIR5D
	I4Xa5Y2Dk3hyT+XJVKTmxIdWRHwVfJo98n0nL58szsSLPLt8zHuEHsFigXGFi4kkTc6sU3UWGlu
	X45PByheCdLhG20i6jtXmtahmPv3JF25+rJMnhmD/uyNrWNXCEdR+w1r5rq2xjiAAxMDi0hJR9V
	c2lQL89uSdzJ6rj8ZUfmWQYk6wOL5J/YHK+qjU93OzgiyFBVRQZTR8O14jIhuSMJk9YCJnu5dxD
	WIozl8Oa//CoenwtI4NZlYF4IJnQs0BlWH5aDooMIQE/g4ZyOrKrHxOkZ0vg
X-Google-Smtp-Source: AGHT+IHq/vFRkJj/oJMZi+3J+q9S/bpmTny3iypeXTqCnR6Swc4ofLBoKTbFvUTAYU6DIEK0HRcCDQ==
X-Received: by 2002:a5d:64e1:0:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3a6ed5e9c5bmr5333270f8f.9.1750934978974;
        Thu, 26 Jun 2025 03:49:38 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6f3a79377sm1808780f8f.20.2025.06.26.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:49:38 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:49:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-af013235ad8d22421b2fe5b1@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
 <20250626-a1aca9887bbf5410741e17c4@orel>
 <20250626-0186dfe9df28f9bb72a91426@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626-0186dfe9df28f9bb72a91426@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_034940_819503_5157938E 
X-CRM114-Status: GOOD (  30.46  )
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

On Thu, Jun 26, 2025 at 11:34:21AM +0200, Andrew Jones wrote:
> On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
> > On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> > > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > > 
> > > Use the hwprobe syscall to decide which PAUSE instruction to execute in
> > > userspace code.
> > > 
> > > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > > ---
> > >  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
> > >  1 file changed, 17 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > > index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> > > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > > @@ -4,26 +4,33 @@
> > >  
> > >  #ifndef __ASSEMBLY__
> > >  
> > > +#include <asm/hwprobe.h>
> > > +#include <sys/hwprobe.h>
> > > +#include <asm/vendor/mips.h>
> > >  #include <asm-generic/barrier.h>
> > >  
> > >  static inline void cpu_relax(void)
> > >  {
> > > +	struct riscv_hwprobe pair;
> > > +	bool has_mipspause;
> > >  #ifdef __riscv_muldiv
> > >  	int dummy;
> > >  	/* In lieu of a halt instruction, induce a long-latency stall. */
> > >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> > >  #endif
> > >  
> > > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > > -	/*
> > > -	 * Reduce instruction retirement.
> > > -	 * This assumes the PC changes.
> > > -	 */
> > > -	__asm__ __volatile__ ("pause");
> > > -#else
> > > -	/* Encoding of the pause instruction */
> > > -	__asm__ __volatile__ (".4byte 0x100000F");
> > > -#endif
> > > +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> > > +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> > > +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> > > +
> > > +	if (has_mipspause) {
> > > +		/* Encoding of the mips pause instruction */
> > > +		__asm__ __volatile__(".4byte 0x00501013");
> > > +	} else {
> > > +		/* Encoding of the pause instruction */
> > > +		__asm__ __volatile__(".4byte 0x100000F");
> > > +	}
> > > +
> > 
> > cpu_relax() is used in places where we cannot afford the overhead nor call
> > arbitrary functions which may take locks, etc. We've even had trouble
> > using a static key here in the past since this is inlined and it bloated
> > the size too much. You'll need to use ALTERNATIVE().
> 
> Oh, I see now that the next patch is handling the kernel cpu_relax with
> ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
> a syscall inside cpu_relax though either, since it gets called in loops.

(Another follow up to myself...)

I guess with the vdso cached result it should only be a handful of
instructions, but it still seems odd to embed a call in cpu_relax.

Thanks,
drew

> It'd be better to just call the standard pause (0x100000F) even if it
> does nothing. Or maybe there's some define that can be added/used to
> select the correct instruction?
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
