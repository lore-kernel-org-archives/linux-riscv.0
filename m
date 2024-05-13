Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E203C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6KEcNErPsJE1rtobcIl9OQkRrILTi61/ayFXvGKDw4=; b=32Z6F1UDrHwq+IfnCUvS+545oa
	f4hfiNe7z74OdfbeNViuivA65BmysKXYaVfNbWl1HTwD8kBW/eZr+6hMvPv/aUlqVJk1p0HvfVTKp
	2cYIT+W++IG2cHRh4qmWl4wlml7opazHep28uaR9YLmcmyNryExPdBymChCN+Hjj79FpcRX4HMJA4
	mf2FyJT0I6t82isWt+JduT6tgu4umvHnSc1zKfgw2H2OYiAniWbc9p5KoGtFb5PPXnizOyFu6+RZC
	aUQ+dez4F/iXxwSGGlvyQtff4uiSPPYACerQ0oMnMf4H6z+Bt1vB8w9jTMbSKONScgsYPTVx6Pzu5
	5b1KHC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Z9l-0000000DfkV-3aqL;
	Mon, 13 May 2024 17:08:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Z9j-0000000Dfho-0RsI
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 17:08:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso3675340b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715620080; x=1716224880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R03ALj5gMTI3HJczT8mvtLqpQZw1vQdw7W4zPWu4U5M=;
        b=qzFW5I9J+pDi3vUU1/GRF6z6jpSzJOXV5nyFuwmsc7ZZa6MQg/xWJK/EdjRHmDs0Nz
         i6Ir4fNoh5eRuBYwST23/PCnMluAJ6w+UDzuoE+kUPh2e8zquwwBmWof/PMQd47P5O3O
         1ysvaBvQ3ND4Tc4PhSl4VF9HV769AUBd8xym3fJdTbG5B2iyuF2YQ5Gph4OsIdXe84og
         F+J0nJzA3WkLShsBAYQQwXarmfzI92sNJIWbcixzmhG+K0+RtjwB77C8+qEVSmSYhidA
         QZBuwv28t2hPRjR6E/Araf06PTFVA7QNOVdSoE3ira6Jb4KPCuO6uWAPRPH/PCA9XoP7
         JWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715620080; x=1716224880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R03ALj5gMTI3HJczT8mvtLqpQZw1vQdw7W4zPWu4U5M=;
        b=K4ppOn1DeQ2jHdQ+j6zkLeDcjuFEqbXGUelHH/C57r5CsFA8KaH++0Iy2FkdwebHAW
         okaC5E5+NJqOj4UGIF08rxjaL6l4DVdzntrV2qpZEtOrQh7xJh6sPY6q8YUO0zg0hFWf
         ykv76+LKQPImQK1riYFsGPZM+BbGUaZVrdR+urmoqgqZsCpL3bgJl5ePWAkvGe/3UQrn
         UHH+n96IE1UdTtutxmonHY/a7qtnr5DT2ld+JUyHe8x+/Zc1x6IpFKAZAvt6BwPYlUg3
         xbscrHodbvESfCO+RrZrki92GIAJcmiWZ5GFapE/G+dvhtaJqTL2XHG1jIvKPCoIy9wV
         6waA==
X-Forwarded-Encrypted: i=1; AJvYcCWalLZH+0OayjbaVjpPKrR7719HorPBja/B7k+nEcNW6412oDTBZPc7GaHBtPHryCnghL0STy+W/bY3+G2l+gXDmXx+DrtEKkJd73FrBIJR
X-Gm-Message-State: AOJu0YydfCDv9bG7tNZyIoTRrt/1wT+2WRU0RdE/qaoG2OxbIoZpCXXx
	p8uu0VkpQZ6sVh9p/4d3e4dONyznB3TrteJh/i5YrLr2vempcT4LstpvXwASDZs=
X-Google-Smtp-Source: AGHT+IGgitRfxdN9c/jkn+3dztyByZuJHDxryLBrfrJDLCggaquJnKcgfWgSQwb6qIcM1QjSPmZaxA==
X-Received: by 2002:a05:6a20:431a:b0:1aa:43f4:3562 with SMTP id adf61e73a8af0-1afde0a98d8mr11383826637.11.1715620079928;
        Mon, 13 May 2024 10:07:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2bccsm8222317b3a.170.2024.05.13.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:07:59 -0700 (PDT)
Date: Mon, 13 May 2024 10:07:54 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 27/29] riscv: Documentation for landing pad / indirect
 branch tracking
Message-ID: <ZkJI6lV8du1L+kE2@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-28-debug@rivosinc.com>
 <Zj6D6FqfbnEhcfqs@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj6D6FqfbnEhcfqs@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_100807_365221_1D31C44E 
X-CRM114-Status: GOOD (  25.08  )
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

On Fri, May 10, 2024 at 01:30:32PM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:35:15PM -0700, Deepak Gupta wrote:
>> Adding documentation on landing pad aka indirect branch tracking on riscv
>> and kernel interfaces exposed so that user tasks can enable it.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  Documentation/arch/riscv/zicfilp.rst | 104 +++++++++++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>  create mode 100644 Documentation/arch/riscv/zicfilp.rst
>>
>> diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/riscv/zicfilp.rst
>> new file mode 100644
>> index 000000000000..3007c81f0465
>> --- /dev/null
>> +++ b/Documentation/arch/riscv/zicfilp.rst
>> @@ -0,0 +1,104 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Author: Deepak Gupta <debug@rivosinc.com>
>> +:Date:   12 January 2024
>> +
>> +====================================================
>> +Tracking indirect control transfers on RISC-V Linux
>> +====================================================
>> +
>> +This document briefly describes the interface provided to userspace by Linux
>> +to enable indirect branch tracking for user mode applications on RISV-V
>> +
>> +1. Feature Overview
>> +--------------------
>> +
>> +Memory corruption issues usually result in to crashes, however when in hands of
>> +an adversary and if used creatively can result into variety security issues.
>> +
>> +One of those security issues can be code re-use attacks on program where adversary
>> +can use corrupt function pointers and chain them together to perform jump oriented
>> +programming (JOP) or call oriented programming (COP) and thus compromising control
>> +flow integrity (CFI) of the program.
>> +
>> +Function pointers live in read-write memory and thus are susceptible to corruption
>> +and allows an adversary to reach any program counter (PC) in address space. On
>> +RISC-V zicfilp extension enforces a restriction on such indirect control transfers
>> +
>> +	- indirect control transfers must land on a landing pad instruction `lpad`.
>> +	  There are two exception to this rule
>> +		- rs1 = x1 or rs1 = x5, i.e. a return from a function and returns are
>
>What is a return that is not a return from a function?
Those would be a jump or call (depending on convention of whether return is saved in x1/x5)

>
>> +		  protected using shadow stack (see zicfiss.rst)
>> +
>> +		- rs1 = x7. On RISC-V compiler usually does below to reach function
>> +		  which is beyond the offset possible J-type instruction.
>> +
>> +			"auipc x7, <imm>"
>> +			"jalr (x7)"
>> +
>> +		  Such form of indirect control transfer are still immutable and don't rely
>> +		  on memory and thus rs1=x7 is exempted from tracking and considered software
>> +		  guarded jumps.
>> +
>> +`lpad` instruction is pseudo of `auipc rd, <imm_20bit>` and is a HINT nop. `lpad`
>
>I think this should say "x0" or instead of "rd", or mention that rd=x0.

Yeah I missed that. will fix it.

>
>> +instruction must be aligned on 4 byte boundary and compares 20 bit immediate with x7.
>> +If `imm_20bit` == 0, CPU don't perform any comparision with x7. If `imm_20bit` != 0,
>> +then `imm_20bit` must match x7 else CPU will raise `software check exception`
>> +(cause=18)with `*tval = 2`.
>> +
>> +Compiler can generate a hash over function signatures and setup them (truncated
>> +to 20bit) in x7 at callsites and function proglogs can have `lpad` with same
>
>"prologues" instead of "proglogs"

Will fix it.

>
>> +function hash. This further reduces number of program counters a call site can
>> +reach.
>> +
>> +2. ELF and psABI
>> +-----------------
>> +
>> +Toolchain sets up `GNU_PROPERTY_RISCV_FEATURE_1_FCFI` for property
>> +`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
>> +
>> +3. Linux enabling
>> +------------------
>> +
>> +User space programs can have multiple shared objects loaded in its address space
>> +and it's a difficult task to make sure all the dependencies have been compiled
>> +with support of indirect branch. Thus it's left to dynamic loader to enable
>> +indirect branch tracking for the program.
>> +
>> +4. prctl() enabling
>> +--------------------
>> +
>> +`PR_SET_INDIR_BR_LP_STATUS` / `PR_GET_INDIR_BR_LP_STATUS` /
>> +`PR_LOCK_INDIR_BR_LP_STATUS` are three prctls added to manage indirect branch
>> +tracking. prctls are arch agnostic and returns -EINVAL on other arches.
>> +
>> +`PR_SET_INDIR_BR_LP_STATUS`: If arg1 `PR_INDIR_BR_LP_ENABLE` and if CPU supports
>> +`zicfilp` then kernel will enabled indirect branch tracking for the task.
>> +Dynamic loader can issue this `prctl` once it has determined that all the objects
>> +loaded in address space support indirect branch tracking. Additionally if there is
>> +a `dlopen` to an object which wasn't compiled with `zicfilp`, dynamic loader can
>> +issue this prctl with arg1 set to 0 (i.e. `PR_INDIR_BR_LP_ENABLE` being clear)
>> +
>> +`PR_GET_INDIR_BR_LP_STATUS`: Returns current status of indirect branch tracking.
>> +If enabled it'll return `PR_INDIR_BR_LP_ENABLE`
>> +
>> +`PR_LOCK_INDIR_BR_LP_STATUS`: Locks current status of indirect branch tracking on
>> +the task. User space may want to run with strict security posture and wouldn't want
>> +loading of objects without `zicfilp` support in it and thus would want to disallow
>> +disabling of indirect branch tracking. In that case user space can use this prctl
>> +to lock current settings.
>> +
>> +5. violations related to indirect branch tracking
>> +--------------------------------------------------
>> +
>> +Pertaining to indirect branch tracking, CPU raises software check exception in
>> +following conditions
>> +	- missing `lpad` after indirect call / jmp
>> +	- `lpad` not on 4 byte boundary
>> +	- `imm_20bit` embedded in `lpad` instruction doesn't match with `x7`
>> +
>> +In all 3 cases, `*tval = 2` is captured and software check exception is raised
>> +(cause=18)
>> +
>> +Linux kernel will treat this as `SIGSEV`` with code = `SEGV_CPERR` and follow
>> +normal course of signal delivery.
>> --
>> 2.43.2
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
