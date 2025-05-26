Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03038C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rZ3sYfIEAuIPbuemU77zPaBd2g3MGP73XQ9TzQszqk=; b=lZSXmJPSCFZFwi
	wytbaX5RWV0wEeiAnk1YBDJuMRvYCoNdWDFja3clp2oixBK66Km2Diz8521lK60V1ANaK+iCKw4f6
	8qfDhgH0spDkz0KP89uxbOdfY+qXBZYy/HnIywdt988gQH6b4GqgYLdF74Xu7TCPuEFzR7szY84Ts
	I7kdYoqzdo6zpYz5z1MClCefBV3H1rKK4GO2dEST1AYYEYZtHOn7++rDVxtaMc9UFQt49/VgQsizM
	BYIUx8at1VdAv334YyswZ+fTmMQJc/LFnkagaDDJQoQUgFN2qbg4Seqcu4QJ/1/ra/Z8l6v1Yzg0u
	LlLw/4rL82rZ2wy+WrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTOt-00000008PeC-45mt;
	Mon, 26 May 2025 08:41:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTOr-00000008Pcn-16RY
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 08:41:38 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so1277839a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748248895; x=1748853695; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgi+BI+UxQxxje7YEG6nl3Jn6VhfFhFL9BZoJyhkgXs=;
        b=mPYrVOXK9HtkBdOjLT+5lR86OVvN2ZNTRm7jIfFYFVxt3CMIatMXupb7d0Iey5FJc7
         t2/hhonGLsVprnmxolc0Zl9CkGhQALaZDTcu0wENlhalSF3qRTeSfMGhJu/j6tUkvUSd
         gHsGTeXyI30WlN4K7+qMKl64kLJaHh5ENmQraF4pETaVipdEbUVFiC1V+NdoLqMt3FYZ
         jOsgTYN8vQkyffHE6UH4h1D4B9GV81gEtrFFe/ezbIERcdpg0p+KaqRw/xhBbgaHC4Bl
         mYum7UzC6TbUPfNix5qGSJMuIdHi2C9fNbQiNFm4eaXD9UiXpxbWbKsKZhxOBhSohjpW
         /1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248895; x=1748853695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgi+BI+UxQxxje7YEG6nl3Jn6VhfFhFL9BZoJyhkgXs=;
        b=WUk4tQqpQUaiM5UpKL0tFHV99tEXYGMpP2HikzzkL1wXfP6Vt/XO2rZdj/AKmrzxip
         CwApLQSy1ErtXd8YaHGFV+Bne7SC8G+gfHqFBGYL3R0DMBhkEnEjlNfQV7CQmwxiLM1+
         xf2eXFFNYds5+XtlpCui/rtm7D0+4AlYtnYqtTazQOHpYIZ1TKvQZySMM16k6cNu1spA
         eM7yWqGTBR+GrpA8ZR+6PjJhLM9noqaxVJwBJaIG1ynBEhgEqWLN+P26ED0zC4+s2xN6
         W5SrAUvSHhgHYihKSoBEbjE4+JnfLWVED2JnI2TTZMInRdMvGLzpNG8pche3LTgXnwQc
         /hrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTD5Yl7zeNv/59VxNmAxej36MF9pHzN9sCku3+NV0nDcVNtb3L0s/So+WJ5++YIroPioS7XnokKkIleA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyska015uFGLXDK7g2rMXJA9bVgRGgP2PDBxt1IHwy0bdqZRcLf
	UZ/rPqLaQ38BGx7EnR/uo6JLgBGjcCVgBMLGac22DF6IRWOogsSAC6DUjUxm9HpMdN4=
X-Gm-Gg: ASbGnctCnQozbyPmIA6O0ouHMjFrgMQbHAVYjnS81+9kYKQFPfPnZ8z9Po7zRCoNEna
	McaK4GAESXunHRUt2ztB2V0hsY4K9G9wQ/QwC9lXO5xTeYEgIt11qst7EYDCnJRIezpC8pCh+yR
	ynzDiOMSf4LpTuMkeaV50huIHmTGdAbC9EXs+uqUwnissvahZsCz5s7mOqhOZJnlVRMJOPn9mce
	i/CI0Cyrv04xi7HImg8ZyA5U8nhyXEsNLvX++bqg9JQnuK/wMQnRsKZ3axMmqkErc5K1U8jlvU2
	uyoCgKCLA/JR7fGfn5i0wpZ/ElQZxq9Fe2w1gY2lAcVUYgkNttBJ4Uo3I+TkKFLRBao5LBweZyh
	SJsbF
X-Google-Smtp-Source: AGHT+IG8/VYDbfxt/MCOP+EaLwsXzbrnjfrXlbSUZYq06meSDTM4WfgPl2nsylybH23Wd9Lf5xvIZg==
X-Received: by 2002:a05:6402:4404:b0:602:1b8b:2902 with SMTP id 4fb4d7f45d1cf-602d9bf086amr6150523a12.15.1748248894652;
        Mon, 26 May 2025 01:41:34 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-604b79dc22fsm1148466a12.14.2025.05.26.01.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:41:34 -0700 (PDT)
Date: Mon, 26 May 2025 10:41:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <20250526-baaca3f03adcac2b6488f040@orel>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com>
 <aDC-0qe5STR7ow4m@ghost>
 <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_014137_309246_43E8E87F 
X-CRM114-Status: GOOD (  31.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 23, 2025 at 09:21:51PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 23/05/2025 20:30, Charlie Jenkins wrote:
> > On Fri, May 23, 2025 at 12:19:26PM +0200, Cl=E9ment L=E9ger wrote:
> >> Split the code that check for the uniformity of misaligned accesses
> >> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> >> to its own function which will be used for delegation check. No
> >> functional changes intended.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/=
traps_misaligned.c
> >> index f1b2af515592..7ecaa8103fe7 100644
> >> --- a/arch/riscv/kernel/traps_misaligned.c
> >> +++ b/arch/riscv/kernel/traps_misaligned.c
> >> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulate=
d_all_cpus(void)
> >>  }
> >>  #endif
> >>  =

> >> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> >> +{
> >> +	int cpu;
> >> +
> >> +	for_each_online_cpu(cpu)
> >> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> >> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> +			return false;
> >> +
> >> +	return true;
> >> +}
> > =

> > This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
> > will always return false in that case. Maybe there is a way to simplify
> > the ifdefs and still have performant code, but I don't think this is a
> > big enough problem to prevent this patch from merging.
> =

> Yeah I though of that as well but the amount of call to this function is
> probably well below 10 times so I guess it does not really matters in
> that case to justify yet another ifdef ?

Would it need an ifdef? Or can we just do

 if (!IS_ENABLED(CONFIG_RISCV_SCALAR_MISALIGNED))
    return false;

at the top of the function?

While the function wouldn't waste much time since it's not called much and
would return false on the first check done in the loop, since it's a
static function, adding the IS_ENABLED() check would likely allow the
compiler to completely remove it and all the branches depending on it.

Thanks,
drew

> =

> > =

> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> =

> Thanks,
> =

> Cl=E9ment
> =

> > =

> >> +
> >>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
> >>  =

> >>  static bool unaligned_ctl __read_mostly;
> >> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emula=
ted(unsigned int cpu)
> >>  =

> >>  bool __init check_unaligned_access_emulated_all_cpus(void)
> >>  {
> >> -	int cpu;
> >> -
> >>  	/*
> >>  	 * We can only support PR_UNALIGN controls if all CPUs have misalign=
ed
> >>  	 * accesses emulated since tasks requesting such control can run on =
any
> >> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_c=
pus(void)
> >>  	 */
> >>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
> >>  =

> >> -	for_each_online_cpu(cpu)
> >> -		if (per_cpu(misaligned_access_speed, cpu)
> >> -		    !=3D RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> >> -			return false;
> >> +	if (!all_cpus_unaligned_scalar_access_emulated())
> >> +		return false;
> >>  =

> >>  	unaligned_ctl =3D true;
> >>  	return true;
> >> -- =

> >> 2.49.0
> >>
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
