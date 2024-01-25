Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F82C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 19:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hKN+LkNbkQimw+VS05nyB/uFC9AWioOR1N7KPeN7m0=; b=3hmr1ydePVFAMrmHhtlc+sbJFZ
	TFlMsQPSu3MQBXG24p1IGqqWqT7KabFpU/tnBoHm9/JnNawnOx8LwDfCIs4VWeFxBmPd59LQB+ObZ
	CF2Ywjb4hLe0WKIxDTYv8dX4JOrGr+apnuqK+w/CMAD+s4ReiMrkxlbB2UG56jPjG10mUjlQpTNpG
	Ni3GHk4Ov6xM0wbJD+jspGllO4J56udxYDNLCzWN5WV3fzAL9X+Zw6MhIyndjQaW0zgd789CgTzmy
	krjnLtWyj6bf62pMZxsiy9NF51ZbsqROXLwBCU46BKgyCfCW2EipN5S/m80KNWotERAbjN6HUwOzS
	U/ihEomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5NR-00000001WUg-3hWd;
	Thu, 25 Jan 2024 19:27:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5NH-00000001WSw-1eOM
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 19:26:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d70b0e521eso51838795ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 11:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706210812; x=1706815612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQXEmk/KhfqrXjoSGAenKDc1hYdrFqHQSs6fJFT2dl0=;
        b=gGgYzWe5hDPi4Neg83HV9Vl1FkUKI1Q6VfftgAjN5WI8+2Qb2usnq+oyqX1PjEoL8O
         fJINBpnuoYhr7wAhvo0X+HvkBKRb4fcY2zV2ytyUqD0aHmlCzEUXqv7GCt6ghQlRL2MV
         5H3hdB5s5Y7CsdL+9l7MB/9JRNOAcd0SVvfyXVorBVI7WV4c1KY8KA2ay0zq0+ebrGxw
         wtQCavvgBpIR9N7Wi5GsZT4Il95nDKGAAIalF4/8aePGq4nsio5prudQZFF2BNNY+4h2
         IQwPhQdfHwyw/SHKgvx7HhJYNFmWoRghUr9rI2zmgj+Irit7qI2ad4YT2taCcJZsQUmk
         TOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706210812; x=1706815612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQXEmk/KhfqrXjoSGAenKDc1hYdrFqHQSs6fJFT2dl0=;
        b=vfiplEnFy+yXMWxoeyuv4QfJOf1ja/Nk4+bsUpen7TyHYMKMyI2SCmpfXW7PY4TK1Z
         g4uR7ZuIP9gTv0ETxgNWv9OwzqGdAbqy2dlIz/MfEyCSIuYiAlwkwo5L5b9981PGA84h
         +jQD92+0FsRbffA+oRCiS1n++AEjHLmVAL9SPDj1B5RY8Y24Nh5j1EMmo7xZfy9cPhcH
         cBeo/dkE2XWbPpsgAdQ8NbMMV4xLDCn1cWSOyVLXh07Xh+zqQHrWgAp/orC6TrDsszQY
         NioikAeOuOXq+AnjImT0ZTYiI23bv5RYqDa2lfKUGjPBLTGZjmUmpWOnl6QrbFvXgnpq
         iKpw==
X-Gm-Message-State: AOJu0YxMC3RwFCGzRPnwTYos+8+oIgRcaGBsE7mtFICEiR/1cx7/Yoo/
	lyZylqIP5IePaXElAT/m+ACmaDFftsQayJ8e+WmsLvhS/yy3y7SeWNXFqkVZ0rA=
X-Google-Smtp-Source: AGHT+IEjKhTyFXdeaj6bJIwWSc4zBffLzTHNmIGLnbACUsqZozte6YVSrp4zqdesGPXDBC/y4GWPyA==
X-Received: by 2002:a17:903:2350:b0:1d4:97:b8e with SMTP id c16-20020a170903235000b001d400970b8emr186405plh.79.1706210812431;
        Thu, 25 Jan 2024 11:26:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090270cb00b001d757e49a70sm6544821plt.112.2024.01.25.11.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 11:26:52 -0800 (PST)
Date: Thu, 25 Jan 2024 11:26:47 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 24/28] riscv: select config for shadow stack and
 landing pad instr support
Message-ID: <ZbK198Vovbw2CwrR@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-25-debug@rivosinc.com>
 <20240125-snitch-boogieman-5b4a0b142e61@spud>
 <ZbKkgNX7xfU5KO8X@debug.ba.rivosinc.com>
 <20240125-implement-coagulant-3058e743a098@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125-implement-coagulant-3058e743a098@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_112655_699135_719FC48C 
X-CRM114-Status: GOOD (  25.53  )
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

On Thu, Jan 25, 2024 at 06:44:48PM +0000, Conor Dooley wrote:
>On Thu, Jan 25, 2024 at 10:12:16AM -0800, Deepak Gupta wrote:
>> On Thu, Jan 25, 2024 at 06:04:26PM +0000, Conor Dooley wrote:
>> > On Wed, Jan 24, 2024 at 10:21:49PM -0800, debug@rivosinc.com wrote:
>> > > From: Deepak Gupta <debug@rivosinc.com>
>> > >
>> > > This patch selects config shadow stack support and landing pad instr
>> > > support. Shadow stack support and landing instr support is hidden behind
>> > > `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires up path
>> > > to enumerate CPU support and if cpu support exists, kernel will support
>> > > cpu assisted user mode cfi.
>> > >
>> > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> > > ---
>> > >  arch/riscv/Kconfig | 15 +++++++++++++++
>> > >  1 file changed, 15 insertions(+)
>> > >
>> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > > index 9d386e9edc45..437b2f9abf3e 100644
>> > > --- a/arch/riscv/Kconfig
>> > > +++ b/arch/riscv/Kconfig
>> > > @@ -163,6 +163,7 @@ config RISCV
>> > >  	select SYSCTL_EXCEPTION_TRACE
>> > >  	select THREAD_INFO_IN_TASK
>> > >  	select TRACE_IRQFLAGS_SUPPORT
>> > > +	select RISCV_USER_CFI
>> >
>> > This select makes no sense to me, it will unconditionally enable
>> > RISCV_USER_CFI. I don't think that that is your intent, since you have a
>> > detailed option below that allows the user to turn it on or off.
>> >
>> > If you remove it, the commit message will need to change too FYI.
>> >
>>
>> Selecting this config puts support in Kernel so that it can run tasks who wants
>> to enable hardware assisted control flow integrity for themselves. But apps still
>> always need to optin using `prctls`. Those prctls are stubs and return EINVAL when
>> this config is not selected. Not selecting this config means, kernel will not support
>> enabling this feature for user mode.
>
>I don't think you understand me. "select RISCV_USER_CFI" will
>unconditionally build it into the kernel, making stubs etc useless.
>You're talking like (and the rest of your commit implements it!) that
>this feature can be enabled in menuconfig etc. Having this select
>will always enable the config option, rendering the choice below
>redundant. Try turning it off in menuconfig.

Aah got it now. Thanks.
I'll fix this messaging and select in next version.

>
>Oh and if it were valid to have here, you put it in out of order. That's
>an alphanumerically sorted list :)

Thanks for pointing that out. Will fix it.
>
>Cheers,
>Conor.
>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
