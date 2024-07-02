Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DBAC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnhqdM6HmXiuOB51m0dpo4D7rYFsqZYZe4SntnKbLfU=; b=dovt8ZSQ/UiXVj
	XvTXvRjPiET8LNDgIYiSckNwwRReJ7te0RxIMl+RGaFWthDKc6t/yCgRZfabA8rSLezSJJg56Caha
	AqZep+CJYCx9q0F6cdXuRp9Gk3D3kmHNTaf7kms7uPMQAmpz+glDQSncRercQCkdFKdke12ZH/f15
	eOT/lUs4sOfXmjlhaGOPMaWkL4R+1AszP/UDxDjpXmMxbJJd4zADI1PbqyD6SL76j0WWV1bo32uJD
	+CkXhj3ZCRXZzFlaFjPp3ACoBarB/1o1IkSMkRyQJ/hHhBKuPiTBllYuG6lilLCO65jR7HDWbQy5z
	WcCvwNeNDOVYXDAtWrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOe1A-00000006xME-43lL;
	Tue, 02 Jul 2024 13:58:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOe15-00000006xL7-3vo9
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 13:57:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a7245453319so674495466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719928674; x=1720533474; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7FK8iXLG1SnlI4ndAhM4FDLc7t8LfJYFyucJUdAyuE=;
        b=KbLEeAUJs0K9BmS/Fi+8ibfZoQDwas6UZSMy7Al8jvKsnPcmMPvLkNvRCJ6x7ZyCxe
         DjDLcNBaV/EB+0Pl7uh0LNSx/SXBbBisC3XhEak+67LjkJwYSRyYK/BcYn9SKsPWv9Oa
         bq1Ra4XtpZCttnxVv/C7K9OkVCFhM5nojEzH6Slf1seXeNdf7/n/Mh2GB/XHhLYWH312
         cyr0hQLUGaRGnyTitDxvNkP08kwiAH+WFc1cASy1tSBqVUYNpmR6GZhGtS3fLoGi3Bf1
         1j4sAAQP15czLBeLbzEwCGbfgbquklQ7COng8aJDdxbEuwMwlKCyJJRiK9Fz5251gxsV
         Fe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719928674; x=1720533474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7FK8iXLG1SnlI4ndAhM4FDLc7t8LfJYFyucJUdAyuE=;
        b=mjfY8cgRo99vXfb0qL94/E9bgjuaLRpCZVwIXyAemC3HydlI1dhmFPVjO9AU8ivEs7
         WqXyNO/+gAg/wZ9RP1TP9su0mChH91EIWFayU0uTr/39TGLz75qXh0eb7aH9kmc5FbYA
         zT9urXMqO3GSmX31C493RQPXmynzPG6nYZuaMaFSnwbDUde0Db+XuYLGTf22DOOEZS9q
         3jYM4sbplDopmfFj6vaKgO6bBPqSkYNPNANkhRKosJ5MQgcO3w2Po5Yw77FOUjy73Exk
         rS0fV/0ncgfDkPjzp9UxnPL+910Mm3G7oO2bl5LCvhxBKYQE8QVq0BKfZWmLdnrZSlxD
         DcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8YWHxxhOnFVqyRSMVNjyUS2u4UL9bk+fZmt4t1YxsLey4CkGaL3b/GPfpsGyimZUDKcUftjmCrfZ52ASvCm8rLgzySxz4XIOPmQ6gWJG
X-Gm-Message-State: AOJu0YyDxRge1Ka9p8i2yOo49JaI6ynxlXycPGx9byDBIXHw3Vsjb+Vu
	3+z4/n4mu+PS6hLLk7Bbyk80h7M1YzvPCwfnA8hjJr6KcR7VK0xH
X-Google-Smtp-Source: AGHT+IH2HqD5izfKCSSLrGswi6+i1YWaBA+ICZDZLQ4sVhN4O2GnDe+J7F6F+MWd2qssMhCawY4LUQ==
X-Received: by 2002:a17:906:494a:b0:a6f:7707:b846 with SMTP id a640c23a62f3a-a72aee66c4dmr877328666b.15.1719928673929;
        Tue, 02 Jul 2024 06:57:53 -0700 (PDT)
Received: from krava (37-188-191-130.red.o2.cz. [37.188.191.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf61f4dsm421550166b.71.2024.07.02.06.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:57:53 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jul 2024 15:57:47 +0200
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
Subject: Re: [PATCH bpf-next v6 0/3] Add 12-argument support for RV64 bpf
 trampoline
Message-ID: <ZoQHW2EaisezC1t5@krava>
References: <20240702121944.1091530-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702121944.1091530-1-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_065755_998769_6D8832C6 
X-CRM114-Status: GOOD (  16.60  )
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

On Tue, Jul 02, 2024 at 12:19:41PM +0000, Pu Lehui wrote:
> This patch adds 12 function arguments support for riscv64 bpf
> trampoline. The current bpf trampoline supports <=3D sizeof(u64) bytes
> scalar arguments [0] and <=3D 16 bytes struct arguments [1]. Therefore, we
> focus on the situation where scalars are at most XLEN bits and
> aggregates whose total size does not exceed 2=D7XLEN bits in the riscv
> calling convention [2].
> =

> Link: https://elixir.bootlin.com/linux/v6.8/source/kernel/bpf/btf.c#L6184=
 [0]
> Link: https://elixir.bootlin.com/linux/v6.8/source/kernel/bpf/btf.c#L6769=
 [1]
> Link: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/downl=
oad/draft-20230929-e5c800e661a53efe3c2678d71a306323b60eb13b/riscv-abi.pdf [=
2]
> =

> v6:
> - Remove unnecessary skel detach ops as it will be covered by skel destro=
y ops.

selftests bits lgtm

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> =

> v5: https://lore.kernel.org/all/20240702013730.1082285-1-pulehui@huaweicl=
oud.com/
> - Remove unnecessary copyright.
> =

> v4: https://lore.kernel.org/all/20240622022129.3844473-1-pulehui@huaweicl=
oud.com/
> - Separate many args test logic from tracing_struct. (Daniel)
> =

> v3: https://lore.kernel.org/all/20240403072818.1462811-1-pulehui@huaweicl=
oud.com/
> - Variable and macro name alignment:
>   nr_reg_args: number of args in reg
>   nr_stack_args: number of args on stack
>   RV_MAX_REG_ARGS: macro for riscv max args in reg
> =

> v2: https://lore.kernel.org/all/20240403041710.1416369-1-pulehui@huaweicl=
oud.com/
> - Add tracing_struct to DENYLIST.aarch64 while aarch64 does not yet suppo=
rt
>   bpf trampoline with more than 8 args.
> - Change the macro RV_MAX_ARG_REGS to RV_MAX_ARGS_REG to synchronize with
>   the variable definition below.
> - Add some comments for stk_arg_off and magic number of skip slots for lo=
ading
>   args on stack.
> =

> v1: https://lore.kernel.org/all/20240331092405.822571-1-pulehui@huaweiclo=
ud.com/
> =

> Pu Lehui (3):
>   riscv, bpf: Add 12-argument support for RV64 bpf trampoline
>   selftests/bpf: Factor out many args tests from tracing_struct
>   selftests/bpf: Add testcase where 7th argment is struct
> =

>  arch/riscv/net/bpf_jit_comp64.c               | 66 +++++++++----
>  tools/testing/selftests/bpf/DENYLIST.aarch64  |  1 +
>  .../selftests/bpf/bpf_testmod/bpf_testmod.c   | 19 ++++
>  .../selftests/bpf/prog_tests/tracing_struct.c | 44 ++++++++-
>  .../selftests/bpf/progs/tracing_struct.c      | 54 -----------
>  .../bpf/progs/tracing_struct_many_args.c      | 95 +++++++++++++++++++
>  6 files changed, 202 insertions(+), 77 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/progs/tracing_struct_many=
_args.c
> =

> -- =

> 2.34.1
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
