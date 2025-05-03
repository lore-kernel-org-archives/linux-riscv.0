Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC01C3ABAC
	for <linux-riscv@archiver.kernel.org>; Sat,  3 May 2025 01:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSUXzuMKNAg+66D4KW50k+wDJrSx72ffHbQvTGGq37A=; b=02fRLNOzWafxW7
	WcPdg5h1jLLgtV/EmYXObgu2+gu9evtnqRPNFOckPO0a8pp2g/9Pq1CybP1m1nPz9D1S8+SqXpZsV
	eaRx3Jov5deBt05H+xm7GK/Jpxdk/m6SRub8LipJrmU8RZbG3UPANlc2+kjEQcEOg+3hQKSAtPQp7
	Mn7Z+LUkjvK9cY8t+gtkKJxEbAzAJtkFPgiJqtNTjPKLQf9HeenHZEiJQwwgGr8knBfZMkSeUBWSz
	VWo4U5DtIl3+DN9372UsTN5gow6sg7Dcg8nyoO+4409x1cGkPW4AtI34x9bSigp1NuAhh4cM6+9Tl
	fn2ofWFkNR3EaZ6pjNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB1Hs-00000003MQo-1ofV;
	Sat, 03 May 2025 01:03:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB1Hp-00000003MQJ-30ab
	for linux-riscv@lists.infradead.org;
	Sat, 03 May 2025 01:03:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2264c9d0295so74705ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 18:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746234204; x=1746839004; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sxoQJro3lXNQqEyg+Rdvsoi8HWU2XRbsF61iZfZEgI=;
        b=udNZpuopqnZL8jWuqoKuP8m4MWaOpLseI/pZkvvY+O8AbFoTKo7cZgAIh1oETlJAAE
         bwgQ9mvwHXtG/Xa7I7vycKjBFf/Y0U3FSKh13syT3Lckf2ch6qLeGPdjcO+rypBZXryK
         qDTF+x8gvu4R5ujZjJUD4VVmC+J2LOWWPyuO+vKf+EzB/cjDS5cX2bBJYNaIPkWtzTVJ
         UXbrnb4GM8a3zWA3SP1hEkR6f60I0QHk+ECuVX8hK34j1Q4B1Uwz9YpI2j/bvAtgtg0A
         yYvLcH/8+XD/fY1GtzCmi0KtqJYg4sqrTkjuQhowg1jV8JRfn0WYVIqmHVob4wrkPJol
         RF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746234204; x=1746839004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sxoQJro3lXNQqEyg+Rdvsoi8HWU2XRbsF61iZfZEgI=;
        b=hkbwGmtJvaZ8kCWMQ0wJ2bHsgBGvGDRu1YUmgPOpFVK20J/rSLpVcy8GmxR0vtLdQH
         V25npBeofKryvPfZwERxs22H1FuS4yEw7ou7FqXCqWsQi9San7Wywm0ymGG2vfbdxrbi
         qsaiQLRNCJuml8o6PsCRBLaMt5/aXvf2FpKah1VxTMd7aornwfEMSOuaLcjdkDwuVqrD
         DwyTrpko3BYFl17dWDwF01E+4Q6+8kcwQe3VN8yKkuNbW6NLbRh18JSOtdj+cM7n84kI
         chxnNjtjqNjhwfn7Ev7hLUJzZ3p5/6uBTt7lUaMboLHF5vUGeQTrkFQ0ft6VCZJ4wHkD
         /8fg==
X-Forwarded-Encrypted: i=1; AJvYcCXm5xDU+S7qH6hfGPfDwwcQBChi/SwMCE7f/qxLDXDnUiFHPBtw5yxvL7c/5HnhD+9K3blDdxLOVkPweA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy87na2DlbWM6lFqOHsIOZ1n7K7OxGX0NLkLbi+HLsWVqMNENAW
	BKRNDyi6ppiqZqkmKnJUVaAloLQNQyygPDfh7SDUFpHZN9hj/60TLhuwhzNWxg==
X-Gm-Gg: ASbGncuAw5jTp/UqJqesZQMU0p026CHl6fL8MSy5XXOcUsYu95V6JDKC6o1j+f3OnhR
	jJiVfl4m8crWNwK4lmmAy8IEGKrQ5+kr5lX2S6GoeMxmb2E4bKykeZmCdQs4Ssq6gnmHCkRcsgA
	sOXS0gAqbSzcZNG8q+bKREd0ZOjlNCOOgz2Mn9Dx0rJQGLmBbyA2cOBU04STKV6BzgsGeDrKZ51
	fCtozK7EAtKKQd4Qjit8eKxKj/xQgBHDlTGRIXu+2Tg5M+Z77HxVqvX4FDXbAYDrxcP4iepf/x9
	s4Ip/mzBKUaqcH09E4ysnOo9xrbvGYycFGq7vhjDngsxJifmdcLIN+0ku97mY8EIqCMDZU/4ire
	F5992Xw==
X-Google-Smtp-Source: AGHT+IEtUkf0uocVKNrUNevFVjkIDwrkvuhXutNiDyyT5o9u+4cz2DnehOSMmC3g0359s6dmSn7BIg==
X-Received: by 2002:a17:903:11d2:b0:215:8232:5596 with SMTP id d9443c01a7336-22e18a582edmr1199265ad.16.1746234203784;
        Fri, 02 May 2025 18:03:23 -0700 (PDT)
Received: from google.com (202.108.125.34.bc.googleusercontent.com. [34.125.108.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152293casm14076835ad.205.2025.05.02.18.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 18:03:23 -0700 (PDT)
Date: Sat, 3 May 2025 01:03:17 +0000
From: Peilin Ye <yepeilin@google.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrea Parri <parri.andrea@gmail.com>,
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
Subject: Re: [PATCH bpf-next 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
Message-ID: <aBVrVfgoKTnWVgk4@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <87ldrfm31e.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldrfm31e.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_180325_754184_8E703061 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Hi Bj=F6rn,

On Fri, May 02, 2025 at 05:43:25PM +0200, Bj=F6rn T=F6pel wrote:
> Peilin Ye <yepeilin@google.com> writes:
> > Patchset [1] introduced BPF load-acquire (BPF_LOAD_ACQ) and
> > store-release (BPF_STORE_REL) instructions, and added x86-64 and arm64
> > JIT compiler support.  As a follow-up, this patchset supports
> > load-acquire and store-release instructions for the riscv64 JIT
> > compiler, and introduces some related selftests/ changes.
> =

> Thanks a bunch for working on this!
> =

> For the series:
> Acked-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> Tested-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com> # QEMU/RVA23

Thanks for testing this!

Peilin Ye


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
