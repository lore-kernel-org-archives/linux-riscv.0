Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27EBC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fj3YmjRrCDtMClHmoJ67wCjQGbX+czIxiw7LHeaYW9Y=; b=kqb5GKdYSJRFvz
	kyW/Q89pc1YXu97/MTaRpg71R3dhOecQhDokGTN5Xl61+vvtJgc2UbJkgNdHSGwm0FWwhp835k6L1
	IYwXGyhSwg+c4F7DQgyu22KbxQ2FXAdMECULWOtVOrUCcYKiBvxtVpWzlNSfV2WYd8Ly7o3WG1XW4
	p0aW3DwhnYomfr58Jyz36ZWv/MiRtxyXFm4tO5nU40VGsxuzHRDNHFdwXNU7SZz1yuTMKJw3M+WKB
	Z4xISsIxpuv/ygXMNZgstltkOXb5ozEBGACbbTeiNQPNfmtFQYmGpO6SrJW1Ua7QfmLw2VtgYHzGe
	UoONOLen4HAc5tvKAd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOHr-00EaBC-21;
	Wed, 13 Dec 2023 12:24:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOHo-00Ea9j-31
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 12:24:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c32df9174so59986365e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702470260; x=1703075060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Do9us9KI9YVf91TMl8txltk4WC8U3fmMGLk20+eGOw=;
        b=nJZcnWRHZh4KabCn9Nl/Vz/QX2yfOp/ukSa0R2bam+WqG22clGvzIQTbAahitezyeI
         0k1JoJB8V+HGo/VVUsdSCQ/fIbCUB0iSSGS++J7EDLvZBsUxZCOptJK9ErDnf1FqfnE+
         2xpkOsQratjEwULUku7QukTr+drn0u/breuP2rIZOHtuLS1Bi0q84pvgV0Uiao+CSVF5
         pGxprW4/Tr9yyE9MsWwcIusfyfxafJr8BZ/6ks7AEvOHRUPqBQZu9rPpDdanfXb/WBcf
         cSwSNX8vcj1kFqnr8+FLkIz3FDStBpE4/bbHs9Jk13qorbfGkUKe7NAoxXEwpjJOZ45V
         xifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702470260; x=1703075060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Do9us9KI9YVf91TMl8txltk4WC8U3fmMGLk20+eGOw=;
        b=UGnq7a15wyxBiP3ilis/Q3gWAvzl1GotGJ30LILabXVCLEVGGeemP1Y+Xwdiwmnr66
         iYaaMXJFXDQbyfhANmHdulX6zp035HvrvrD13KlPd5knpRMsd8u0HxntqbXrRAt/F4C/
         2cFqZuWx02QMG+JHurrYbRwq3sCu/3odr69XnB38SoPK1/vxub+/bbpvzu0JZ1vdSw5/
         0sznGjlA9KZ4kNGqz+Jun33ecY3bPMyf/9uyl3Flmb1yxHMv3REA+WURR/Y3lVqBSuHi
         qfO/oWSkh6zOm7kXQer+uQrtdJUAtbF7HboDzo4ZHapbfTkEmpwxNkI3bJFfrIU5oAr5
         EZIw==
X-Gm-Message-State: AOJu0YxdYQ2UJNLPWUHIcbVeMyFnHsvPeh3MLjflS17Y90EtlI4axmlS
	qUzD76KfMFaOGDPOj3S4E0LwIQ==
X-Google-Smtp-Source: AGHT+IFH3rJTleJTU4xsQNweH6i96bFDZCHpyMZmqgOvAispGx7uzx5Me7DqfOkSWHH7fB2FceGEow==
X-Received: by 2002:a05:600c:1715:b0:40b:5e21:c5cd with SMTP id c21-20020a05600c171500b0040b5e21c5cdmr2457031wmn.155.1702470260169;
        Wed, 13 Dec 2023 04:24:20 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fl9-20020a05600c0b8900b0040b43da0bbasm20393302wmb.30.2023.12.13.04.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 04:24:19 -0800 (PST)
Date: Wed, 13 Dec 2023 13:24:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, apatel@ventanamicro.com, 
	guoren@kernel.org, mchitale@ventanamicro.com, waylingii@gmail.com, 
	greentime.hu@sifive.com, samitolvanen@google.com, Bjorn Topel <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, jeeheng.sia@starfivetech.com, Heiko Stuebner <heiko@sntech.de>, 
	Evan Green <evan@rivosinc.com>, jszhang@kernel.org, cleger@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] riscv: envcfg save and restore on trap entry/exit
Message-ID: <20231213-707b4e8b5a91ceedd557eb12@orel>
References: <20231212235003.2036221-1-debug@rivosinc.com>
 <mhng-ae72b5fd-358d-48e2-87cf-f571b67afe9e@palmer-ri-x1c9a>
 <ZXkCs9ypok5X/Wx2@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXkCs9ypok5X/Wx2@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_042424_980088_2490EE0B 
X-CRM114-Status: GOOD (  24.24  )
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

On Tue, Dec 12, 2023 at 05:02:43PM -0800, Deepak Gupta wrote:
> On Tue, Dec 12, 2023 at 04:53:48PM -0800, Palmer Dabbelt wrote:
> > On Tue, 12 Dec 2023 15:49:25 PST (-0800), debug@rivosinc.com wrote:
> > > envcfg CSR defines enabling bits for cache management instructions and soon
> > > will control enabling for control flow integrity and pointer masking features.
> > > 
> > > Control flow integrity and pointer masking features need to be enabled on per
> > > thread basis. Additionally, I believe cache management instructions need to be
> > > enabled on per thread basis. As an example a seccomped task on riscv may be
> > > restricted to not use cache management instructions
> > 
> > Do we have anything in the kernel that actually does that?  Generally we
> > need some use, I couldn't find any user-mode writable envcfg bits in any
> > extesions I looked at (admittidly just CFI and pointer masking), and
> > unless I'm missing something there's no per-thread state in the kernel.
> > 
> 
> Cache management operations?
> As of now kernel blindly enables that for all the user mode. It will be good if
> that is enabled on per-thread basis. Sure, all threads can have it enabled by
> default. But if strict seccomp is enabled, I would argue that cache management
> operations for that thread to be disabled as is done on other arches. As an
> example x86 disable rdtsc on strict seccomp. RISCV allows this CMO extension
> and I expect CMO to leverage this (currently it
> doesn't).
> 
> I was being opportunistic here so that I can reduce number of patches on CFI
> enabling patchset.
> 
> Will it be okay if I revise this patch to include with a usecase to restrict CMO
> (say for case of strict seccomp on risc-v)?

I opted to only expose cache block zero since giving userspace the
ability to invalidate cache blocks seems risky from a side-channel attack
perspective.

I'm no security expert, so feedback welcome, but I don't see a risk with
userspace being granted cbo.zero, even for strict seccomp processes.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
