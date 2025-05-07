Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B5EC369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu41iLoHsGNEaYxb6uyWtLBW58q2fv6kzHlORGf0ZIs=; b=wgbqHEnqTcmKO3
	H5ZqJ0o4Q2WFaLtjmbSHXTjDkyqGuBt16B1QvDv/MKQhQCqA0XX6JKzl4p57E/a89HQ9DwpxxDau3
	VXwapLopjBbGwy3YB68tjf4nIbyW9Y49zcWfc6UlZj2HJ7cdGhCP/IinIofjUtb9Ss4M+8vy2JGxw
	0nU5smrFQkfDNvRvVG4IYO4iXSwP4e2tR8LW70fD8Jr+lefvPrXaU8wlccFLUn4rcpQfU/PfMzcXM
	lhFDgS3jrS8K5YZWCvMlAmkKNUnFWRhFR35npigEBS/tZxQBIiYuRfs+7f6nclX6IndipN3epcRLw
	8tNvankmh5PEnfGOE71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVk9-0000000E7Xj-2AWA;
	Wed, 07 May 2025 03:46:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSUt-0000000DmiP-1tu5
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 00:18:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22e1eafa891so89495ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 17:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746577130; x=1747181930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rOxJ2ZleJ6jrErKcMxnacgjBMyxg2WYmX0Aa16MkjwU=;
        b=uetmex4FojDTyj9aH0ZXHJbYam/W4vnsBqjCApUrt4Bj5ARsaD5VyYZmQgmw57dsj4
         jH65+kin73KFGBSgC+C4StmFV/vff6ooHf0MNFkipGuIsSueilpG8VYbDuiP0Ck7BOtX
         WCoD0mzO2tAKujfSqk5rDFxuCFrUo4s2nokDsNJfUk+2yO9UQSfmF9/6FYlfGVAGRoyZ
         hA9k4UYCqH50Zni/273jXVMbPq30frV9nTRm3YFcEgN+gNbJv4uEOmBFVZ+rI0gVCJPf
         vFh+p6juJf3ZoGbzoAKHglEHeJMgLehhMU3ugK5siFMRQlhNIyOOJQh4d2A6k7O+LiEP
         P/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577130; x=1747181930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOxJ2ZleJ6jrErKcMxnacgjBMyxg2WYmX0Aa16MkjwU=;
        b=axZY/hpvx4gjXq6KKkVGqgZeSBjIfIUs/pJHaqE93SgZ/ADBMwIyR5Ee+sTvn6/Vn1
         w+BYb2fbyvHYUEzvPxWTtre59D/8trhfh9awcrKLxgswrkMIzGjpUmhQMtByr2GpBDxJ
         3WbZa+VaLE6QAzxwQtdtRmq7RroCP3WFPB7GlgmwKxM9CJdb4iEmNwKCXjXa+ACoxEkA
         D1lJo0RZHWeHhKne9H57c3alGp1/6TApvDDrNvCqXZDNT8PkEoqFRcTtZEDlHTKGqnap
         GS4kaRJS48BR/A85pwL+jur/LDg+SdXOHKRhmm+jBFB0MDCOMbJbrBZqL3VIhu+ahSTO
         ZfXw==
X-Forwarded-Encrypted: i=1; AJvYcCUb8bFZG23bmY+oSYQOhU/fP+FtcQfMFzvW5gJniBGEW9i9V/hJlIL20hDWSwKkksMehBZiPNr5SxsTkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/rpJ9XbKUx2mNfbm6M0/21cvWxbh2oKhTXzAyO+L0rLeImBu6
	ZTPoiCZdWXwcQwjDvPR7AxCq91di4zqoRrU17DuqZcLYKDeQRaA5Tp3JY7lixQ==
X-Gm-Gg: ASbGncsi34otCXWOqTBkfGlCjn2YP+JcJTu0wk2Oc37vJBn8Rhi1tqnmilagE9uYGBg
	DUQb/sWxxlS6Wp/qWxcTSRM2PLuw7Yox4qiTlluFXq5h8aQmnNn5yYF2bVjYfmNmoGoYzB9esEC
	f9D4/dKYMk30HpgUVonOU71DmJj1YRfzLl54HoKIsnkO52NDWHgaoelJHkJoA/iBrh1z3xlrm+/
	xWJFhMvCdaiy5kNYkxJuhzHTwphd18vrgeGpoq9tLMnQlJnIN71g6RKsmD150cGMt7V0YQT9JJd
	+0TH1npuvActAmXFqNyCH6MXwc4D4/tWSrKmFJqzxh3eWIHzOcQWbX1mI9Vn1pXnwsn1m10KFJA
	Mas3EEg==
X-Google-Smtp-Source: AGHT+IFmGem4PNyUmSVD8zL0fRN7LffVd//g6xDAdzb1nlkNZSOB6w7YBuoQbUG985u6qDaMChHTrQ==
X-Received: by 2002:a17:902:e74e:b0:21f:4986:c7d5 with SMTP id d9443c01a7336-22e5ee8be88mr1763875ad.8.1746577129359;
        Tue, 06 May 2025 17:18:49 -0700 (PDT)
Received: from google.com (202.108.125.34.bc.googleusercontent.com. [34.125.108.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d067sm9661814b3a.126.2025.05.06.17.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:18:48 -0700 (PDT)
Date: Wed, 7 May 2025 00:18:43 +0000
From: Peilin Ye <yepeilin@google.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrea Parri <parri.andrea@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
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
Subject: Re: [PATCH bpf-next 1/8] bpf/verifier: Handle BPF_LOAD_ACQ
 instructions in insn_def_regno()
Message-ID: <aBqm4-CsZyWXRwp_@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <2c1ec0e60974f8438730dc5126f9ed986b32a3f6.1745970908.git.yepeilin@google.com>
 <83698e73-3b47-4cdc-af50-c4f3ca479b7a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83698e73-3b47-4cdc-af50-c4f3ca479b7a@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_171851_492138_AB042018 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Lehui,

On Tue, May 06, 2025 at 10:03:59PM +0800, Pu Lehui wrote:
> On 2025/4/30 8:50, Peilin Ye wrote:
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -3649,13 +3649,16 @@ static int insn_def_regno(const struct bpf_insn *insn)
> >   	case BPF_ST:
> >   		return -1;
> >   	case BPF_STX:
> > -		if ((BPF_MODE(insn->code) == BPF_ATOMIC ||
> > -		     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) &&
> > -		    (insn->imm & BPF_FETCH)) {
> > +		if (BPF_MODE(insn->code) == BPF_ATOMIC ||
> > +		    BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
> >   			if (insn->imm == BPF_CMPXCHG)
> >   				return BPF_REG_0;
> > -			else
> > +			else if (insn->imm == BPF_LOAD_ACQ)
> > +				return insn->dst_reg;
> > +			else if (insn->imm & BPF_FETCH)
> >   				return insn->src_reg;
> > +			else
> > +				return -1;
> >   		} else {
> >   			return -1;
> >   		}
> 
> How about simplify like this:
> ```
> static int insn_def_regno(const struct bpf_insn *insn)
> {
>         switch (BPF_CLASS(insn->code)) {
>         case BPF_JMP:
>         case BPF_JMP32:
>         case BPF_ST:
>                 return -1;
>         case BPF_STX:
>                 if (BPF_MODE(insn->code) == BPF_ATOMIC ||
>                     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
>                         if (insn->imm == BPF_CMPXCHG)
>                                 return BPF_REG_0;
>                         else if (insn->imm == BPF_LOAD_ACQ)
>                                 return insn->dst_reg;
>                         else if (insn->imm & BPF_FETCH)
>                                 return insn->src_reg;
>                 }
>                 return -1;
>         default:
>                 return insn->dst_reg;
>         }
> }
> ```

I see, I'll change it in v2.  Thanks for the suggestion!

Peilin Ye


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
