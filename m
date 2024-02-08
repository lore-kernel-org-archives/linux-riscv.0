Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FD1C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 11:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvSA7u4vX+K4V0fstPJtyQyTTJ8oUXs0I/R1pu3+xgE=; b=VYrIiueAPnmp6l
	OAai4FGjPf5zH+3gxBv7SLUcMiX4RLyvVDtnjMXL7XxzTS2WBqhcLND1+/YBtxSBwFhkamXJNMS79
	+/JLsAMsD6u2+YDN4y+NQ6jw+BYzP0sifIOZac6Ki7ay9a9KVvLojRQEQC1/4vJlwPB65ia1TWAjA
	EQgUcvABqU//c0IR7sZmyvNRVrrJk9+T3tDAC4wwoIVvJaDqetYNWjseEm4phPgdYohBmqYCLLEsJ
	iEJwBK/zarqSsE+sMhh0dINPYm/m70H7g3+BNv5Y6bnPbM3TrKMVsuAxRAcWgJOPmDAy2/BD5O2cB
	/4HwnsRm3aW3d6w5D5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2nS-0000000DbsG-1lYY;
	Thu, 08 Feb 2024 11:42:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2nP-0000000DbrD-3v41
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 11:42:25 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a38271c0bd5so227906866b.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 03:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707392541; x=1707997341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJx67bcvbAo9zHf0ymAdxOGvHwHm6HIalhNV9TyZktU=;
        b=mZiF+KFSoCMMZuCu9LysAS84dFn6h34SAywcqypwrgAn/nG7aLth5BIQZIvx0QhtvV
         LYiZX6ZUQ5Yl2MJJIR7HIvw/r9WXGfzZaxu1v2MhniRlU1K6wVSt2489gh6CaWIqv2UV
         bNeOvRb0r5zHjczeMJ+XUntoh2e4P3vwYVAGIff3kaNVUskHumbF3OPl+wAijhqhA/xR
         GUcyQdXrxOn/iRnUUb7RK1xx+Xfr0kW7+1iUqVmZXwljpGPUGk7S9UFgK6hQPnavuL6x
         hE239QD/hfY/5ENMBVCMN5Kom9arSe9DGSRHVMRWNiLJRFFGEjVD7Cp7K9hCiEPxVlgy
         wLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707392541; x=1707997341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJx67bcvbAo9zHf0ymAdxOGvHwHm6HIalhNV9TyZktU=;
        b=R9m/ocwFK9H2cjIvCkAsIskp3zVFc1+sVy+HVjrent4E6AyiLPgkSge82gBMuZOEVj
         8b1l0o5+ULIRk5SbHa4lhhnQjdzofUFm3W2O2/2i9iflOk18fJc80djjWRbaEW2PLivU
         O7YVPougi8Cn3CYEV3ZDd+2bI2xZ4skIPMGcdMT3a/yeZinsVec0rp7r8R6rLLZpjRzm
         4HpMlMmRcN4t50jtgG200Jyg60dvY8p6UCc1Mkrws06wG9yO1NFRhCZ61K94j/ydMFJU
         +hB036mNCA8N5Q+UsLQf58x1KH/wvXSSpvDWfrrJKb3JkuHeWgZy8kTgonDqbo+moJxj
         htsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk6vkNP2eaqq/Pi9f1ZE4UjdruW+o1kzq2zIkldLei0u1O4Q8iKDp1reKjWtB9PWeNk1mX/e1SqT+IAH5bKrWtvwcbtLxNOMFNEh+sTcb0
X-Gm-Message-State: AOJu0Yw55gamXx1WkSk5afn0ak7OYAS4WyKNKK31LNFh7q86v2pab+KE
	t4sBG+K75MhrDbmwmsR2B5I2jsLLXfWU0ATtxfcqcVCe1dnzEJRUVU4HLoWXoNQw7Q==
X-Google-Smtp-Source: AGHT+IEiPm4u84iqFSB/UQg6ibdfUKzGrLkfL1m3NTh0SS5++/aHuKt3pBw9YrhOY1kilrXZeG6DMg==
X-Received: by 2002:a17:906:d10d:b0:a38:948e:85d3 with SMTP id b13-20020a170906d10d00b00a38948e85d3mr2932904ejz.71.1707392541302;
        Thu, 08 Feb 2024 03:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVISQGNJhcgRfbCljEvw7EzsND50WXxUpC4wFphSMcBvdzRIwbL7Ryz518AMPWPM8jSxRs0KB7Ropazpm8LjMrbZ8JFStTaDPeC1LQt2v8Ut06vT2nk2yiRzB5u5BwQ6VPecfYcJUZUnj3snDHe3u9fyFsYjU5QawLERsKuJF3YAWRNgL06iSOJ8SPb2oNBunViYzVACgOdN48RvE7Hab7wmi+qh1B5Nbs2VlDSJozNfZ03T/pWq1SaHNkIxG5Q1zGeZjK0WpttiduQo/fpQFRK/Y9Xow6QVEftEVQPw0jypU8d5Z2nQ9sWPbOADDjT9FKF4/yr8KIWAAGqCvHzPUSg1bgl+GaQv2Y+z41S38/k3qowiSDXHmU5a4279KlMRbSCw/LNpg==
Received: from andrea ([31.189.46.254])
        by smtp.gmail.com with ESMTPSA id qc12-20020a170906d8ac00b00a28f6294233sm1784541ejb.76.2024.02.08.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:42:20 -0800 (PST)
Date: Thu, 8 Feb 2024 12:42:16 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH] riscv: Fix text patching when icache flushes use IPIs
Message-ID: <ZcS+GAaM25LXsBOl@andrea>
References: <20240206204607.527195-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206204607.527195-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_034223_998551_04E07150 
X-CRM114-Status: GOOD (  18.23  )
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

> +static int __ftrace_modify_code(void *data)
> +{
> +	struct ftrace_modify_param *param = data;
> +
> +	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
> +		ftrace_modify_all_code(param->command);
> +		atomic_inc(&param->cpu_count);

I stared at ftrace_modify_all_code() for a bit but honestly I don't see
what prevents the ->cpu_count increment from being reordered before the
insn write(s) (architecturally) now that you have removed the IPI dance:
perhaps add an smp_wmb() right before the atomic_inc() (or promote this
latter to a (void)atomic_inc_return_release()) and/or an inline comment
saying why such reordering is not possible?


> +	} else {
> +		while (atomic_read(&param->cpu_count) <= num_online_cpus())
> +			cpu_relax();
> +		smp_mb();

I see that you've lifted/copied the memory barrier from patch_text_cb():
what's its point?  AFAIU, the barrier has no ordering effect on program
order later insn fetches; perhaps the code was based on some legacy/old
version of Zifencei?  IAC, comments, comments, ... or maybe just remove
that memory barrier?


> +	}
> +
> +	local_flush_icache_all();
> +
> +	return 0;
> +}

[...]


> @@ -232,8 +230,7 @@ static int patch_text_cb(void *data)
>  	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>  		for (i = 0; ret == 0 && i < patch->ninsns; i++) {
>  			len = GET_INSN_LENGTH(patch->insns[i]);
> -			ret = patch_text_nosync(patch->addr + i * len,
> -						&patch->insns[i], len);
> +			ret = patch_insn_write(patch->addr + i * len, &patch->insns[i], len);
>  		}
>  		atomic_inc(&patch->cpu_count);
>  	} else {
> @@ -242,6 +239,8 @@ static int patch_text_cb(void *data)
>  		smp_mb();
>  	}
>  
> +	local_flush_icache_all();
> +
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text_cb);

My above remarks/questions also apply to this function.


On a last topic, although somehow orthogonal to the scope of this patch,
I'm not sure the patch_{map,unmap}() dance in our patch_insn_write() is
correct: I can see why we may want (need to do) the local TLB flush be-
fore returning from patch_{map,unmap}(), but does a local flush suffice?
For comparison, arm64 seems to go through a complete dsb-tlbi-dsb(-isb)
sequence in their unmapping stage (and apparently relying on "no caching
of invalid ptes" in their mapping stage).  Of course, "broadcasting" our
(riscv's) TLB invalidations will necessary introduce some complexity...

Thoughts?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
