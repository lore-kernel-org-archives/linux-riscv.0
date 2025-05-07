Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B587C369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Pi3xA77/6Fj+EuksB74NDSopJC2nDDRlKoL47eCX5M=; b=wr2cmZrelpAWsm
	qN94UPFuzNNo5mfQofF3nvX8s+B+tAwNul1gpFTSe1nHOqxv7QlbPTkokVlA2/ybT7dQX/OGcwbDp
	nNZe/Z2rRdj3T0qULkrsizc1V8MlMby8Dg33xTC17L4GMCt3XT4XCfhLPqMOWYIu1bxYjPueH4/vi
	GdYIChfDPOmxnwbMx5hfiRwAEwaurdeCp2hAXkmLCtxGoe8IZ7iSGwzDKfQO3tnFirzWslbFbmi8B
	6PNY6mdEfrswrOeoVys2rnmW4OeLDQGS3o4PwenjybgAKEDiPeuwTvFLr7iTvwOafGujQHQGVf/fM
	CiAcJlVbErRri4J8XcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjh-0000000E6oD-3Dzk;
	Wed, 07 May 2025 03:46:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjf-0000000E6nd-3CIG
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:46:21 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22e39fbad5fso71255ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589579; x=1747194379; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CprdoLUso6rbsqIqPABR3Bwu/KBPakjt6caNQFlDa9s=;
        b=vat24AnTbGyxCBxUpqdpJ4XYrt9JS9W+uGWTodwYkv1KdwCgvhJCx7UPmdOEjY2CKw
         EeCat1+f4aSWG+b+SX1yJdHWO9tHnQAJXOJFniQ/+Sz6ixkyuy0BU5I2QzR2thu7TnnC
         wtyoqRCaV0gTsEY+R5Gf1NIyd8uX35/fJNRtMxLLLKI6YTiE/D+aL0oIdK+z+uATLDyE
         gFQuswlr8TFdex29GqYxiYt/gGXJhwqGO4KawBpTY2/+vCZHTBNs8VMlCBBKz1ta2mt2
         LS1eYCE3dghkivg436FsUlaTyEUzapGZarn66PQ6z30/aMhcAjmRSmDR4emvZS4Y2CWE
         3Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589579; x=1747194379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CprdoLUso6rbsqIqPABR3Bwu/KBPakjt6caNQFlDa9s=;
        b=VwfK87cAf95GWg9xc63N1te4tGnAGj7IWfznjruNDaJAeeLbMZ/js3ocylXuN/r4+k
         rPM9rETFCtMMKuNnb5EVXQhVdgjRIThoK/qFO/sodWq7wNBElraFmNtJ32qu0VJIZ8iA
         6ZrtlSflE2ItcqtfPh2i3rHczfSerr7iIDmrZdVeGnnAfFueWm9fcYhCvZdAQpEshAkV
         cmkEjTQUyZFmWj7D0GfRoY+m+PCQ+J09njZOToV5Gpnc7VfFVTnpjxlfRz7hj9tkXfdB
         vW2HBTJdeprG2DzE9uC3HPNKiwglmwNEPqBXa4837reFsL1SWCqzWa6PULY+lQmrC+K/
         8jIw==
X-Gm-Message-State: AOJu0YxnqPG0BmroI/7Iw4oVd9uryAiWQTn1W/N+GjIj72oPaM242bgZ
	cS90cTBp8zMCuzAZ5SzdmWGWgcOiT66eUsMbLDTFIWh1h8tzeBN1Sky6jq8gNg==
X-Gm-Gg: ASbGncuVqZa/V0yTTo6veechLPQcFuzlBM5enx7lgBKKeqvgPtqAUI5OoesDlDSfXER
	GYEcfGUsujQ5sYtCdRlQwzZ0VoYHs7hNi4Lagck9vxOUezGTK/FGdBiRDsNfYAt6VCmmVUWGo2O
	eHc+07Ur6RFs/VG84CI0m84Yu+lQ4gZWz1wMmJ3Vj/S+cNge1Hc+8+ONYhoKTCHmDY+ZYxXX+ni
	C5fCDns9UuRmSZQYBFgn4E0tud9TxF4V6D4Q9INah6/7BoSyILQEllfTQvMN8e/Urm6SAEQKXoP
	/XtiYHynRCt+0YMczGfGcJHZORasSlrcupsN/z2q5lAc9+kFDrCq6D1zPMJYO9WNceVYCGGEZYt
	sqQ4uZQ==
X-Google-Smtp-Source: AGHT+IGBb8IZ+p4eSssPzIozOCBP9geGZhXA8XOl5UScfnTahE2nYrYHiyIiwfXFxk5ASUPHxlM5IA==
X-Received: by 2002:a17:902:ccc7:b0:223:5696:44f5 with SMTP id d9443c01a7336-22e5ee8bfdemr1866575ad.12.1746589578269;
        Tue, 06 May 2025 20:46:18 -0700 (PDT)
Received: from google.com (202.108.125.34.bc.googleusercontent.com. [34.125.108.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6c4a4sm8409572a12.73.2025.05.06.20.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 20:46:17 -0700 (PDT)
Date: Wed, 7 May 2025 03:46:12 +0000
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, Andrea Parri <parri.andrea@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>
Subject: Re: [PATCH bpf-next v2 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
Message-ID: <aBrXhK_Tv1M5ON-e@google.com>
References: <cover.1746588351.git.yepeilin@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204619_802245_4E89A743 
X-CRM114-Status: GOOD (  12.29  )
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

Hi Lehui,

On Wed, May 07, 2025 at 03:42:29AM +0000, Peilin Ye wrote:
> v1: https://lore.kernel.org/bpf/cover.1745970908.git.yepeilin@google.com/
> Changes since v1:
> =

>  * add Acked-by:, Reviewed-by: and Tested-by: tags from Lehui and Bj=F6rn
>  * simplify code logic in PATCH 1 (Lehui)
>  * in PATCH 3, avoid changing 'return 0;' to 'return ret;' at the end of
>    bpf_jit_emit_insn() (Lehui)
> =

> Please refer to individual patches for details.  Thanks!
> =

> [1] https://lore.kernel.org/all/cover.1741049567.git.yepeilin@google.com/
> =

> Andrea Parri (2):
>   bpf, riscv64: Introduce emit_load_*() and emit_store_*()
>   bpf, riscv64: Support load-acquire and store-release instructions
> =

> Peilin Ye (6):
>   bpf/verifier: Handle BPF_LOAD_ACQ instructions in insn_def_regno()
>   bpf, riscv64: Skip redundant zext instruction after load-acquire
>   selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL when appropriate
>   selftests/bpf: Avoid passing out-of-range values to __retval()
>   selftests/bpf: Verify zero-extension behavior in load-acquire tests
>   selftests/bpf: Enable non-arena load-acquire/store-release selftests
>     for riscv64
> =

>  arch/riscv/net/bpf_jit.h                      |  15 +
>  arch/riscv/net/bpf_jit_comp64.c               | 332 ++++++++++++------
>  arch/riscv/net/bpf_jit_core.c                 |   3 +-
>  kernel/bpf/verifier.c                         |  12 +-
>  tools/testing/selftests/bpf/progs/bpf_misc.h  |   5 +-
>  .../bpf/progs/verifier_load_acquire.c         |  48 ++-
>  .../selftests/bpf/progs/verifier_precision.c  |   5 +-
>  .../bpf/progs/verifier_store_release.c        |  39 +-
>  8 files changed, 313 insertions(+), 146 deletions(-)

Please take another look at v2 PATCH 1/8 and 3/8, thanks!

Peilin Ye


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
