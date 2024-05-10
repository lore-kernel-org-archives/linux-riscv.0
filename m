Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB51C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tn956YtAv1n0sDDxfcF7MkC+C899Y+k3sftg/Emei9w=; b=i9qDFGlEjGi3jq
	7Ue9vb2ZL6ZjIJAPFA/QW3TsF6LSZkG2L0fABMa0SKXafE+9BozzoceHzda+TNdXx5yGTaO7pTEUA
	No/tkFUGuewKVZBt9sFftrpoAkJCH7gfIZb93u2bsYhGI/+32fzCcJSwIV45sXfu9y8y8Vfw4tnED
	61rDiYeeDIi68uhZ+JdGdIzbnnxOqNnIwN27fBwzn1LI4bS7nP+91NnN9Dy/L6UwPcpyDCDyeLrvs
	x5mHl7uugwe/GrsP5sYZkpQhoalCbVHg41e9pyN0dxoVmjinC8ZdHZ8yAuewii8uBe3TDZPsDK27a
	VccSRqEY7Wc8hRbtCUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5WtC-00000006OLv-2jt0;
	Fri, 10 May 2024 20:30:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Wt8-00000006OKG-3dtB
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 20:30:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ecddf96313so21384495ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 13:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715373040; x=1715977840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6+vAbiClRDiC4uIvdtPo+0v0pdzSTB+/qaSHejfRyI=;
        b=dOP6hquvITdwSgqhGiEDaC8P8tIkYzeqAcwpJnd5poYTfz8M9nGXMXRb/6qyHVK+yN
         d4856BJnspnnZ95yHQJl+RnZlAxYT78bQeXkEtzJi9KLln3+Ld1MKV9oSkydklPmNMZr
         Xnrr3C8bc+btMkl4h0xa0edmC4zMypqmhe4ef9Ekry6GF6AHmqJzEKLTFTyB3KB+hP3+
         0FugPvRqaCgbi32RINHgvsh0T+6H4nocZB4X5Q9c0IPAJiFlYyDlv3q7l5+RFMiYLzaW
         7QnA/Xg3Ck+7licvq3rpnUglgrf4fFO4JMbI1bOPGKSOxhaHmJGtl7zobmRs33/VqEAH
         cY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715373040; x=1715977840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6+vAbiClRDiC4uIvdtPo+0v0pdzSTB+/qaSHejfRyI=;
        b=WMGGzX3fQ+FzKKOIqNJK53+9gRmMtW1CWptgYTZI5Fs0uH/Y/rHItZEvGlXz6SQ1zF
         P9uscGAhpMtYh32WnyJb59/LVIR+4UZG4T5yAjilLzSjJ/yB3Jv93g2GPBfYRrYU4rl5
         92fhQkGfZ6tk+qjvlZ++M4BqVCCgeMQKd0kOeAL0mo51imceL4lYWpOm9CvXLrrwHYeP
         ZpPexUbU6KTg5sbiEizDTjEnRDTSu9p8naRIat27mnJ2qmr4MrrkRDob0n03wwGL5hvV
         +WzTncgFBINNCjuLfivbdHd+DtcEJS+PDGDzUoGG2ll1kDusrSu3S6U5io+URYVWCr8G
         F6jA==
X-Forwarded-Encrypted: i=1; AJvYcCVo6ar/2UKtBo91yGKXkaAVlLydBzlvb3bIw9IaycTpwf/yxstUAwl27ibjdWQobswMNnAmp9CKrhOQs27wEBK+c2mT6LsvSOm8dZFabJW8
X-Gm-Message-State: AOJu0YwOwnSuDalyEtJtT45r7LaneZFoQ+g25Ea/JhvuF3tds026SczW
	tfHDAjLS2ai/DJ9ZnpAoI3MVd11Q/zXEqyxLJuBzzLsCtOgtrnXLNmnVvpT83V8=
X-Google-Smtp-Source: AGHT+IFPBkbU2aNYrXQ8809dzA+eKb9uiS2PXSzCao5t90cyhOzkMcMmTiaCTPqTvHS08OSljlo5Sg==
X-Received: by 2002:a17:902:7ed0:b0:1eb:dae:bdab with SMTP id d9443c01a7336-1ef43f4e315mr43128725ad.46.1715373039531;
        Fri, 10 May 2024 13:30:39 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c138c04sm36433135ad.267.2024.05.10.13.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 13:30:38 -0700 (PDT)
Date: Fri, 10 May 2024 13:30:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
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
Message-ID: <Zj6D6FqfbnEhcfqs@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-28-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-28-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_133043_034877_0B126BA5 
X-CRM114-Status: GOOD (  32.36  )
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

On Wed, Apr 03, 2024 at 04:35:15PM -0700, Deepak Gupta wrote:
> Adding documentation on landing pad aka indirect branch tracking on riscv
> and kernel interfaces exposed so that user tasks can enable it.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Documentation/arch/riscv/zicfilp.rst | 104 +++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/arch/riscv/zicfilp.rst
> 
> diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/riscv/zicfilp.rst
> new file mode 100644
> index 000000000000..3007c81f0465
> --- /dev/null
> +++ b/Documentation/arch/riscv/zicfilp.rst
> @@ -0,0 +1,104 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:Author: Deepak Gupta <debug@rivosinc.com>
> +:Date:   12 January 2024
> +
> +====================================================
> +Tracking indirect control transfers on RISC-V Linux
> +====================================================
> +
> +This document briefly describes the interface provided to userspace by Linux
> +to enable indirect branch tracking for user mode applications on RISV-V
> +
> +1. Feature Overview
> +--------------------
> +
> +Memory corruption issues usually result in to crashes, however when in hands of
> +an adversary and if used creatively can result into variety security issues.
> +
> +One of those security issues can be code re-use attacks on program where adversary
> +can use corrupt function pointers and chain them together to perform jump oriented
> +programming (JOP) or call oriented programming (COP) and thus compromising control
> +flow integrity (CFI) of the program.
> +
> +Function pointers live in read-write memory and thus are susceptible to corruption
> +and allows an adversary to reach any program counter (PC) in address space. On
> +RISC-V zicfilp extension enforces a restriction on such indirect control transfers
> +
> +	- indirect control transfers must land on a landing pad instruction `lpad`.
> +	  There are two exception to this rule
> +		- rs1 = x1 or rs1 = x5, i.e. a return from a function and returns are

What is a return that is not a return from a function?

> +		  protected using shadow stack (see zicfiss.rst)
> +
> +		- rs1 = x7. On RISC-V compiler usually does below to reach function
> +		  which is beyond the offset possible J-type instruction.
> +
> +			"auipc x7, <imm>"
> +			"jalr (x7)"
> +
> +		  Such form of indirect control transfer are still immutable and don't rely
> +		  on memory and thus rs1=x7 is exempted from tracking and considered software
> +		  guarded jumps.
> +
> +`lpad` instruction is pseudo of `auipc rd, <imm_20bit>` and is a HINT nop. `lpad`

I think this should say "x0" or instead of "rd", or mention that rd=x0.

> +instruction must be aligned on 4 byte boundary and compares 20 bit immediate with x7.
> +If `imm_20bit` == 0, CPU don't perform any comparision with x7. If `imm_20bit` != 0,
> +then `imm_20bit` must match x7 else CPU will raise `software check exception`
> +(cause=18)with `*tval = 2`.
> +
> +Compiler can generate a hash over function signatures and setup them (truncated
> +to 20bit) in x7 at callsites and function proglogs can have `lpad` with same

"prologues" instead of "proglogs"

> +function hash. This further reduces number of program counters a call site can
> +reach.
> +
> +2. ELF and psABI
> +-----------------
> +
> +Toolchain sets up `GNU_PROPERTY_RISCV_FEATURE_1_FCFI` for property
> +`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
> +
> +3. Linux enabling
> +------------------
> +
> +User space programs can have multiple shared objects loaded in its address space
> +and it's a difficult task to make sure all the dependencies have been compiled
> +with support of indirect branch. Thus it's left to dynamic loader to enable
> +indirect branch tracking for the program.
> +
> +4. prctl() enabling
> +--------------------
> +
> +`PR_SET_INDIR_BR_LP_STATUS` / `PR_GET_INDIR_BR_LP_STATUS` /
> +`PR_LOCK_INDIR_BR_LP_STATUS` are three prctls added to manage indirect branch
> +tracking. prctls are arch agnostic and returns -EINVAL on other arches.
> +
> +`PR_SET_INDIR_BR_LP_STATUS`: If arg1 `PR_INDIR_BR_LP_ENABLE` and if CPU supports
> +`zicfilp` then kernel will enabled indirect branch tracking for the task.
> +Dynamic loader can issue this `prctl` once it has determined that all the objects
> +loaded in address space support indirect branch tracking. Additionally if there is
> +a `dlopen` to an object which wasn't compiled with `zicfilp`, dynamic loader can
> +issue this prctl with arg1 set to 0 (i.e. `PR_INDIR_BR_LP_ENABLE` being clear)
> +
> +`PR_GET_INDIR_BR_LP_STATUS`: Returns current status of indirect branch tracking.
> +If enabled it'll return `PR_INDIR_BR_LP_ENABLE`
> +
> +`PR_LOCK_INDIR_BR_LP_STATUS`: Locks current status of indirect branch tracking on
> +the task. User space may want to run with strict security posture and wouldn't want
> +loading of objects without `zicfilp` support in it and thus would want to disallow
> +disabling of indirect branch tracking. In that case user space can use this prctl
> +to lock current settings.
> +
> +5. violations related to indirect branch tracking
> +--------------------------------------------------
> +
> +Pertaining to indirect branch tracking, CPU raises software check exception in
> +following conditions
> +	- missing `lpad` after indirect call / jmp
> +	- `lpad` not on 4 byte boundary
> +	- `imm_20bit` embedded in `lpad` instruction doesn't match with `x7`
> +
> +In all 3 cases, `*tval = 2` is captured and software check exception is raised
> +(cause=18)
> +
> +Linux kernel will treat this as `SIGSEV`` with code = `SEGV_CPERR` and follow
> +normal course of signal delivery.
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
