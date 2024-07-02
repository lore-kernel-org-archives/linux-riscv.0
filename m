Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA18C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FV+r4c+2k5X7iKmMfS8M5KNzUYi5LSIeTXxcCY9/IDE=; b=d7aTqYxGimJNPC
	i9ittAEtcLJ/g/s454BvQKuqQnvHmthifjuLWvweI2/l2xB7j2wgXXdLS3oifHb6qDD+DYWvSU5NF
	tANAiC4hR1rHW8ByWu+BoV/nNhzMCx3OaqLaUzAROzOeKY6J8/gYFJ+FeOKlfwMFK+voUNoGtbqkR
	V33nR0vFf3EBzPKasPilF3wHQ25j05tqmEPC91cGytITCR+0zjZuKWNrSHSF+lvcp/LlDDXAwaBpS
	lNnz9Wg0TatS8b4EBS3FwWQv/gKMwNRFeNfM2cwRCiNR+nZvgmKwecsi/C6C6cqceDt/qcTNm8NL3
	Wms/47Q9midH4INEd+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObLf-00000006Qvc-2dnl;
	Tue, 02 Jul 2024 11:06:59 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObLc-00000006Quz-3dsf
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 11:06:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-36701e6c6e8so2136092f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918415; x=1720523215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feeElcS+cgUqpw8/9Nt4sJkTMDw+8CzRJvyGXG18+xQ=;
        b=JsXNy0OoR5hmepNk0Z0Q19wKcq/bGH02qtjWNEHfHxsaR6o3hkZ+bmyWh121HvACDS
         39iI6mlNwl1nbgMmzxmgyh1a59BcPjqvW3HzKrAW6WpJQSmU5GnXf6JQYaI5CxioktiL
         jPXaG3WCdTYwe4Yu47+O8QmClMtOlV0q35g4RlvQV76gIVBVdgigrbOgcShkmuDDSSzJ
         3WZMPgmxj9TvlOzMeffeY1kehn6rjfNegFnxVdDfqixfWgZ9f8TwmWILVjhNkpCwR7cU
         q1FWmZ6l36KrXDI3dKwLO66mIf/IS9CwXSkpAHmy9Z2e2cWT1MGCZ6Yq1vrwmwx2Xpqc
         AYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918415; x=1720523215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feeElcS+cgUqpw8/9Nt4sJkTMDw+8CzRJvyGXG18+xQ=;
        b=nJfpfAeKM/Qpxr4w4rOXaccxreI3Jxm96FVQOYUvdCKB9R+vRonWTWIg5XY55y9FOX
         oLt+tfQiDTG3z5tbAYNaseF3TIRq+pCHdudL1nYR+HuzhE1hAndrivLJmbKiwpFrEvbg
         MYBhBKsfRjpgXJ2T9uTO7rSIUPwnQt5HrIZN3i3fTzJOnmOSopSZiWvCz9sHgDA4wl2M
         YX1b0WDMCLwrzNWPMNUx4UHNrmB8o5F8PyheKlfk6BsfUhPlmYd1Ths3czH9Fxhlq7FP
         xfVsaGDTDavU08H9rmcTvu90Eo5BADttQuiy7kG08LZjyYV5k7r7/bkR1Otuzhl4HhA1
         I8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs9KU8NfkvwCDE/FipHMpByznUC2uQIeG9ubvnGUjTcVf8tILjX7Du6Pcvu27NcGsA29DaYjR2vl47klB918IyFeMfWvEvjtTUdB9O9NRL
X-Gm-Message-State: AOJu0YwOvY31DetDtt5auW5udt3kJNgS8RaAShK/96JQlnklALXYtAv6
	p23dt8zJkBzBIYfWVA9Nvq/hoTAglbYIBLygCLaOCmoyGyqbh+3I
X-Google-Smtp-Source: AGHT+IEGhAWe9RE3TaYL9RFgz6QtvvSP/o6vjTEXDErXd2V/GouKOTyn5TIC5dteuJvtpMJQg/SopA==
X-Received: by 2002:a5d:630f:0:b0:362:41a4:974d with SMTP id ffacd0b85a97d-3677571b76bmr7046893f8f.46.1719918414409;
        Tue, 02 Jul 2024 04:06:54 -0700 (PDT)
Received: from krava ([176.105.156.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd562sm12980174f8f.15.2024.07.02.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 04:06:54 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jul 2024 13:06:49 +0200
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v5 2/3] selftests/bpf: Factor out many args
 tests from tracing_struct
Message-ID: <ZoPfSe-CvdEwlxjo@krava>
References: <20240702013730.1082285-1-pulehui@huaweicloud.com>
 <20240702013730.1082285-3-pulehui@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702013730.1082285-3-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_040656_931785_AAA0A661 
X-CRM114-Status: GOOD (  10.80  )
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

On Tue, Jul 02, 2024 at 01:37:29AM +0000, Pu Lehui wrote:

SNIP

> +
> +static void test_struct_many_args(void)
> +{
> +	struct tracing_struct_many_args *skel;
> +	int err;
> +
> +	skel = tracing_struct_many_args__open_and_load();
> +	if (!ASSERT_OK_PTR(skel, "tracing_struct_many_args__open_and_load"))
> +		return;
> +
> +	err = tracing_struct_many_args__attach(skel);
> +	if (!ASSERT_OK(err, "tracing_struct_many_args__attach"))
> +		goto destroy_skel;
> +
> +	ASSERT_OK(trigger_module_test_read(256), "trigger_read");
> +
>  	ASSERT_EQ(skel->bss->t7_a, 16, "t7:a");
>  	ASSERT_EQ(skel->bss->t7_b, 17, "t7:b");
>  	ASSERT_EQ(skel->bss->t7_c, 18, "t7:c");
> @@ -74,12 +95,15 @@ static void test_fentry(void)
>  	ASSERT_EQ(skel->bss->t8_g, 23, "t8:g");
>  	ASSERT_EQ(skel->bss->t8_ret, 156, "t8 ret");
>  
> -	tracing_struct__detach(skel);
> +	tracing_struct_many_args__detach(skel);

nit, I know it's in the current code, but tracing_struct_many_args__destroy
will take care of the detach, so no need to call it explicitly

jirka


>  destroy_skel:
> -	tracing_struct__destroy(skel);
> +	tracing_struct_many_args__destroy(skel);
>  }
>  

SNIP

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
