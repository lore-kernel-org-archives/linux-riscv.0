Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1BACD4F24
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 19:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK2Fiqg1mD4FaWTBOibyDi0JAv5eoAKRrippX+lpPg0=; b=jMSVH65rA0NHmp
	RzlnDPRn521wSzZr9FYdk7yxy0Ht6sb9x+y5BjaCBSG3YbjzlmehWqOJHuO8E9mzEpotJCCwdSOaE
	TFdRlN9Y9FJI5prURcEjnL5DpGDAWiB3HBUUY7EFp0aHE78Lth+UKq81S8wf8q6KzXfPVuK6KvxJj
	zpvLmq8yY4EmPZjussfbONSY2CZDLezY4XuqXxqFpLnabDSJmbWDtrrovfx4ew+Ytk5/L3NRSLBSa
	YxAToZeeF6DCwTPQ1qctG6YuUahp2W3OTXU2vDW95d2IxrgyXbVNREdS46PL4MYMkdHLusiHDiF9E
	KpOYtDFM2JdzVVRmnZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slvp0-00000005pRe-1n2d;
	Wed, 04 Sep 2024 19:37:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slvoy-00000005pR2-1A75
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 19:37:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-715c160e231so5887459b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 12:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725478659; x=1726083459; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=539JpYt3z4yAWF9FgRwuAOBj2XoJGZXhHjPZHfOy/vU=;
        b=J2UbOVCEY/Oeb4LlfCwGcmiIcLg7iXoTxQUV0AlOtUmkF8wgL7RS9fatm+xXVeOPdW
         uSAOzbDlCq8Q6A89YOpQPbgSlSrNidaWxpPXi4I8Mn3Pl70P0JjQsb/02y1xHe9LUyl1
         K/yLNgs59PFLhEYspcb34K6jqZkhVxVD9zIsqTHaOM3SAMKGPTAD9LhhS/oB28ysKNaV
         GKEf6qMU2JqXsOdGvWe80qcTiM1DZXk/CTRVkVT8p1LP5dfHEpKfOndyUbyeku8oqRbL
         544xOGZx210yd7K4xohWWeNcb0h8lAj+o+IFqzV0l3UlzlHbcWuxr+MwmHHXSggn+7nu
         qQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725478659; x=1726083459;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=539JpYt3z4yAWF9FgRwuAOBj2XoJGZXhHjPZHfOy/vU=;
        b=tzuweYr0r8Xny3lFD13iUZuKWwCtwsCeAK2szoHC6yxzYAgLX28OketyjnSE5zVasM
         /0UAuRll/hz42AbhThIQYgZsjVnr+jBQNBW9ww31oK9bi0PGs9ZWoCN36LMeDD9NCI7L
         hucTtWJYIv1A2yc4tVFiWm312D0hNhE+pUec+4uY60x96Xj8Xc4XiZHfiSClVKHHhlJV
         2y9o7dgij2jQoJjxmqhQN+GaQUlu2d6+qyicbocn0QGfrFYGr/UI7j8l/Lr0IMBkNL7/
         ZhfD4GyQgOGz7SfVwtFh77vBQREhXDqaLYeR8370Hq+Rui0YgEtwSKN1e8qWfmAgJkdP
         SXVA==
X-Forwarded-Encrypted: i=1; AJvYcCWqsB3Ziz95bK1ARoPNkrsWPdhKpCWTwzCf4XZcVqm6J8Ep6JQpwm37e1cQFOZfOKAX1bZEHn8ZvURdDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAx4tVdx+dOnvPz94bbQw9BVXhCjCqiSxbIHrBxv2ASTP6kP3H
	68L+8vVNfgErpyWY6FzxLSZ5Gp1nxOcgRsltc7PkiY/R4U9qIzr4f12paqaz
X-Google-Smtp-Source: AGHT+IGVoOZOS5Yvkub7Juoan+1ICnFwIH/PkP8dmCe/hS+hO0jG6HWz+D6sHhnx1h9kFMw9lDR1og==
X-Received: by 2002:a05:6a20:c916:b0:1ce:d418:a45c with SMTP id adf61e73a8af0-1ced418a474mr13084964637.50.1725478659223;
        Wed, 04 Sep 2024 12:37:39 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e66sm1986107b3a.21.2024.09.04.12.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 12:37:38 -0700 (PDT)
Message-ID: <fc9a03f1809cfdd80a9a8cb7b513e32302be5a43.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 03/10] selftests/bpf: Disable feature-llvm
 for vmtest
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui
 <pulehui@huawei.com>
Date: Wed, 04 Sep 2024 12:37:33 -0700
In-Reply-To: <20240904141951.1139090-4-pulehui@huaweicloud.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
	 <20240904141951.1139090-4-pulehui@huaweicloud.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_123740_402594_A8B16964 
X-CRM114-Status: GOOD (  12.62  )
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

On Wed, 2024-09-04 at 14:19 +0000, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> After commit b991fc520700 ("selftests/bpf: utility function to get
> program disassembly after jit"), Makefile will link libLLVM* related
> libraries to the user binary execution file when detecting that
> feature-llvm is enabled, which will cause the local vmtest to appear as
> follows mistake:
> 
>   ./test_progs: error while loading shared libraries: libLLVM-17.so.1:
>     cannot open shared object file: No such file or directory
> 
> Considering that the get_jited_program_text() function is a useful tool
> for user debugging and will not be relied upon by the entire bpf
> selftests, let's turn it off in local vmtest.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

I actually don't agree.
The __jited tag is supposed to be used by selftests
(granted, used by a single selftest for now).
Maybe add an option to forgo LLVM linkage when test_progs are compiled?
Regarding base image lacking libLLVM -- I need to fix this.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
