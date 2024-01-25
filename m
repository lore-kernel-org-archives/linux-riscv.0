Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF75C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfuCiabDVDF4E+ss5BIrBX/mqJx4hRDB+I6KIQYbzDg=; b=L1MYNlTwgSgvyd
	AENZD1AdaWQAHnF6PHYM8T84F2/okygFx3UvRVxmVMkEZCOCMVAB256DncWK3Jj/+cnzIXUDpZyX5
	5d3XoP2vcSPVZK7aTGpTH3hsapELU6lHCpPasGVXG+2U7A9lP+wct3FsBhtFTER80znwANh2VAEg4
	U/AK4AXnBQ2HFdiTSSOGvmMXZEpou4/tYE+auYFBoVPFo55El97qEjxVQtF/nRd4nNivcYjw5zqre
	TGWoBowVMk7ZV1+0hJfcue+GOAOnPhmjZimGQxDlSxUGnZZ/oVedcQwZ6gXthNpfLa7JfZbeANLqH
	kTqIy/n9nQ6iQPO4wbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu1t-00703U-12;
	Thu, 25 Jan 2024 07:20:05 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu1p-006zzU-0h
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 07:20:03 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id B3EC45813A9;
	Thu, 25 Jan 2024 02:19:55 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 25 Jan 2024 02:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1706167195; x=1706174395; bh=vWNYCVEsyV
	iu3nUft3Ms12HcBU6UW+6JtvbOuVw1J0c=; b=ihcT370B+njuRntc5twt82oqIv
	WvEyF+QhQZa3KbxhS1Vh3b75U4BZbt5PpaGUtpLdWOMVruYAqxRCiY37LNSdHW56
	0t4j6dlWCu7PmtyHhZ0qyeSKWjSpzHikBrUJUHqdoT8z2IdRorn+n7Zm/HDIsUOL
	WYavFzm1CSp4emtFfgrCEHvih+SugQmK/Pf5VXMfuthNnqOZJJ+bCLjW/TQ+m++J
	5m5YHXrKYYZHjJFiVTI2vPsex9fKp5LtmNE9SPGo9ignBJDifbDrQpns+f7vo556
	RSoHKG8V+GnknxVCpEgU/BZ/XCjq0cc9ncCDz2mWjzFzijiccHDg1o3iSQ1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706167195; x=1706174395; bh=vWNYCVEsyViu3nUft3Ms12HcBU6U
	W+6JtvbOuVw1J0c=; b=cCuKUF7MdOT7mLgNSydAybFj0ppLkPstCclIddMg4APh
	6P9jN+4/eljGJACE8fXUjIigtGmz/r9VoDnP+My7G+p8zuZg0o3/D2Mp26NkkAQh
	QIOxGweWqP8lUNPBjNQYujtEGzLyMCsmzf6X+gSx7SKUymoYA9MAeRXC7MJCmzcg
	+QIC12zqU7I8U3juNyMb/1N0sDhG30iEjzmgwukf5ou6NBEnHNrx1KZbEomggwoC
	vG7k9k134zZYxjCvEeBB3sbZxJzPcvbxL5hRTMTJJBU+bjN6e8Y5J/srhCe1UkNu
	SGSiTPVBe1BBPLH7gPetacZX8zcVSlxITX/Va76hiA==
X-ME-Sender: <xms:mAuyZeoub7k6X41V6FHs70JRUywJzR95FYp9WYHmVroGO3U43rKziw>
    <xme:mAuyZcpRK0wJ0CdO8AAK9Uj6roOFrelvBtgS9rUxUYvo4oSXJmvLt5VKH3iKG4bdz
    -ZXlU1okf9FeduT5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdelvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpefhtefgffelieduudekgeevueegudegueefhfehhfffiefg
    keffvedtuefggfehteenucffohhmrghinhepvghnthhrhidrshgspdhinhhfrhgruggvrg
    gurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:mQuyZTOnheMbskQ8dkkvSRTMeEnR4112qvAXcs5rmihobYRa2gOQog>
    <xmx:mQuyZd5uB5anV1oTW2vOQdGo3HwrWAsiV8w1Po5bkuPSSty259EO7Q>
    <xmx:mQuyZd5ssYNKALInWXcR7Tdd-6qltbrsgb5mtsDX1vCWnSQAfVXGew>
    <xmx:mwuyZdDpCky6uLlnBQrJBXH56jHwERSkgsogMeHWMFlAiE5aHe_lNQ>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CBA0C1700093; Thu, 25 Jan 2024 02:19:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <23d023c0-27cf-44fa-be0a-000d1534ef86@app.fastmail.com>
In-Reply-To: <20240125062739.1339782-3-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-3-debug@rivosinc.com>
Date: Thu, 25 Jan 2024 02:19:29 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: debug@rivosinc.com, rick.p.edgecombe@intel.com, broonie@kernel.org,
 Szabolcs.Nagy@arm.com, "kito.cheng@sifive.com" <kito.cheng@sifive.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Andrew Jones" <ajones@ventanamicro.com>, paul.walmsley@sifive.com,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Conor Dooley" <conor.dooley@microchip.com>, cleger@rivosinc.com,
 "Atish Patra" <atishp@atishpatra.org>, "Alexandre Ghiti" <alex@ghiti.fr>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Albert Ou" <aou@eecs.berkeley.edu>,
 oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
 "Eric W. Biederman" <ebiederm@xmission.com>, shuah@kernel.org,
 "Christian Brauner" <brauner@kernel.org>, guoren <guoren@kernel.org>,
 samitolvanen@google.com, "Evan Green" <evan@rivosinc.com>,
 xiao.w.wang@intel.com, "Anup Patel" <apatel@ventanamicro.com>,
 mchitale@ventanamicro.com, waylingii@gmail.com, greentime.hu@sifive.com,
 "Heiko Stuebner" <heiko@sntech.de>, "Jisheng Zhang" <jszhang@kernel.org>,
 shikemeng@huaweicloud.com, david@redhat.com,
 "Charlie Jenkins" <charlie@rivosinc.com>, panqinglin2020@iscas.ac.cn,
 willy@infradead.org, "Vincent Chen" <vincent.chen@sifive.com>,
 "Andy Chiu" <andy.chiu@sifive.com>, "Greg Ungerer" <gerg@kernel.org>,
 jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
 ancientmodern4@gmail.com, mathis.salmen@matsal.de,
 cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
 ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
 baruch@tkos.co.il, zhangqing@loongson.cn,
 "Catalin Marinas" <catalin.marinas@arm.com>, revest@chromium.org,
 josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
 omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 02/28] riscv: envcfg save and restore on trap entry/exit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_232001_717131_EFEC6036 
X-CRM114-Status: GOOD (  19.58  )
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

On Thu, Jan 25, 2024, at 1:21 AM, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
>
> envcfg CSR defines enabling bits for cache management instructions and soon
> will control enabling for control flow integrity and pointer masking features.
>
> Control flow integrity enabling for forward cfi and backward cfi is controlled
> via envcfg and thus need to be enabled on per thread basis.
>
> This patch creates a place holder for envcfg CSR in `thread_info` and adds
> logic to save and restore on trap entry and exits.

Should only be "restore"?  I don't see saving.

>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/thread_info.h | 1 +
>  arch/riscv/kernel/asm-offsets.c      | 1 +
>  arch/riscv/kernel/entry.S            | 4 ++++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/riscv/include/asm/thread_info.h 
> b/arch/riscv/include/asm/thread_info.h
> index 574779900bfb..320bc899a63b 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -57,6 +57,7 @@ struct thread_info {
>  	long			user_sp;	/* User stack pointer */
>  	int			cpu;
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
> +	unsigned long envcfg;
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	void			*scs_base;
>  	void			*scs_sp;
> diff --git a/arch/riscv/kernel/asm-offsets.c 
> b/arch/riscv/kernel/asm-offsets.c
> index a03129f40c46..cdd8f095c30c 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -39,6 +39,7 @@ void asm_offsets(void)
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> +	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>  #endif
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 54ca4564a926..63c3855ba80d 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -129,6 +129,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>  	addi s0, sp, PT_SIZE_ON_STACK
>  	REG_S s0, TASK_TI_KERNEL_SP(tp)
> 
> +	/* restore envcfg bits for current thread */
> +	REG_L s0, TASK_TI_ENVCFG(tp)
> +	csrw CSR_ENVCFG, s0
> +

This is redundant if we're repeatedly processing interrupts or exceptions
within a single task.  We should only be writing envcfg when switching
between tasks or as part of the prctl.

We need to use an ALTERNATIVE for this since the oldest supported hardware
does not have envcfg csrs.

-s

>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current
> 
> -- 
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
