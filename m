Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A1EC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 21:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiWuuEkkqqKrcB+CudjW+Udys84qHW4cAoKlJzKt8ho=; b=WxRl5fK4qYs4Wn
	U6hfUyhXJXBWEEGTDcTtFrjDRwwJyO4upiLpJa9ssPZy2twklyrJm6DFnoNMLud1LdkKoj7TiPQ8W
	x4RNH3OqOIXyW0F3mKlCuWB2zrBtlsLQnT7Rmn+yrc4PUU6guF6WBSbuiigLdjh/92Dsgq70P1x2t
	KdgQNNI+TeBh+fypZQvZzsLRdWpsQyKHzYp/Ve15tYuK/77mkA0oNzq3/He/+d7JHJr9zMnFdV7Xm
	OdKpoMdWUkonwoTHIWuLYHyInABC0bFbbiyYsty4hWUt3QSXa3bSLffqDWguMOCimKhMaZW+L2dDw
	gEKupB3l4oyCOVyUq0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz2RO-007CrG-17;
	Tue, 16 May 2023 21:42:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz2RL-007Cq1-2T
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 21:42:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc22805d3so34571a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 14:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684273357; x=1686865357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCrwAPuGKXq93TXqe6WXaYC1Q/y0jn1/n3v/MjlEJns=;
        b=JR4x/5gSL9UBOTTLzKqCYxTw+bx1mkq+N2tp0cQoZ0Ey0OJRpdCcBjj6W5Ay2ZLVGs
         EJCBFb1qL76rpzwZC3KVUgqph2VG+pDMZgV2JH8i/qCyi2FFPDZdG7WageP4Jny+zw4B
         VDZkf2r95FYpsV5Wcr405f9S6PDZqXTUPwUy8LmYZm1aqmFu5gw1g6m5vcnLo8WaflDv
         PBr4RbftGq3yyvt/8YtmnaqDs4t26I1ShqQ1O4wqaTfXJNwLpYKR9d19X4JRj9OIR2dx
         XJmjef48zWkGhhTg2pV1cmyTme7GL/9IKf4RJyQTHz3gGE7ucHp0ObCtsVBQulRN1cbp
         DymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684273357; x=1686865357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCrwAPuGKXq93TXqe6WXaYC1Q/y0jn1/n3v/MjlEJns=;
        b=MIY1aCLJjQVJeLtcFvH61iJLTZWGXbz8B6DWRI7JaxNBXC9qfaHtODn46GW11A6zUz
         w1h4tIYul+0HHHKn89iiZbyk1hcig3LRY8KWbQE/uNBRQRv8G18ngz+wOYV1yMyKtiLT
         OMOztNdhazedC7Ae9cVSDKafUDu99DG7txU/kYJN6Vzcw/Zy4WPe210aejI9KjYM1zid
         Z9QKbi9CJ7XOMIzbzPGl7nuHK0dwj2nsR1ZL64893VKQm5dUpDJa+VPBimHSxCEmCzQg
         NqcxxBjoyuOlNpmHS488GQwwnw1MsjTTyzXVfH3PGUFqQXEWAvRKTReGyjHjDLoqBRLZ
         97jg==
X-Gm-Message-State: AC+VfDzUefvIi/XjnWZQJGvMMqu0bKTv2R2fym3Set0ca7yVOnWGRQAi
	d2aHTxwgxrgqwxg2beHj9VQ=
X-Google-Smtp-Source: ACHHUZ7d13R/4s3sMrjF0bqn81c2bBX5qIzZ4YPQLulerCv9LdqvYx0QqQG1LEiyAZhhRtZIYeV8ZQ==
X-Received: by 2002:a17:906:c14f:b0:94d:a2c2:9aeb with SMTP id dp15-20020a170906c14f00b0094da2c29aebmr41629990ejc.49.1684273357168;
        Tue, 16 May 2023 14:42:37 -0700 (PDT)
Received: from krava ([83.240.62.62])
        by smtp.gmail.com with ESMTPSA id ku11-20020a170907788b00b0094f5179540fsm11169179ejc.83.2023.05.16.14.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:42:36 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 16 May 2023 23:42:34 +0200
To: Ze Gao <zegao2021@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 0/4] Make fprobe + rethook immune to recursion
Message-ID: <ZGP4ypidaxQGdp7Y@krava>
References: <20230516071830.8190-1-zegao@tencent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516071830.8190-1-zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_144239_826592_ED8EFF40 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, May 16, 2023 at 03:18:26PM +0800, Ze Gao wrote:
> Hi all,
> 
> This is the 2nd version of patch series to fix the ftrace rethook recursion problem.
> 
> v1: https://lore.kernel.org/linux-trace-kernel/cover.1684120990.git.zegao@tencent.com/T/                                 +++#md4c0bae6a6cae28dadf2a2c6105ff140b35fddea
> 
> As Steven suggested, this version removes unnecessary notrace annotations from fprobe
> and rethook functions from v1 [PATCH 2,3,4/4] and replaces with makefile changes to filter
> out compiler flags which ftrace depends upon for rethook related objects.
> 
> Ze Gao (4):
>   rethook: use preempt_{disable, enable}_notrace in
>     rethook_trampoline_handler
>   fprobe: make fprobe_kprobe_handler recursion free
>   fprobe: add recursion detection in fprobe_exit_handler
>   rehook, fprobe: do not trace rethook related functions

hi,
what tree is this based on? I have troubles to apply that

thanks,
jirka

> 
>  arch/riscv/kernel/probes/Makefile |  2 +
>  arch/s390/kernel/Makefile         |  1 +
>  arch/x86/kernel/Makefile          |  1 +
>  kernel/trace/fprobe.c             | 72 ++++++++++++++++++++++++-------
>  kernel/trace/rethook.c            |  4 +-
>  5 files changed, 63 insertions(+), 17 deletions(-)
> 
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
