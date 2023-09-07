Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD56EE14D3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzHH9uxqulgg4ddzhLG4hRUrhm9JSO6llzeStLYooTU=; b=IkYyGQ4wobxJMl
	KA6fDJ4vnS/k+AWQ8sD9XKb0G9RRd4baVZgw5kueFU6qu31c+vUFbGo10IeP8YKE3xYjk7TRN4f0q
	/mcc2MGWD7brIIFYFUnIu90AxiMrKiLZx07yZtZoqVeqGV1LyoBzkGVEWXSkr3fnJYGwpjZfRkIMi
	/eA/mdhAI/9+iCu5WbIE5ZU0GJ8I4zHA0ALbbw2Bo2iyaUd6vmMaRkPP7SDlcEVuNCPPX0vKuwtZ3
	pBQVEEFRHLWL3hAfTSBEID+lRrt5JwPNNJ18j4ccBUBur8+Y8KxWwjwCy0PRVaAOiAI8YqYaWF1Wb
	iUN0PyUQyubmeh8pCHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAk8-00BcPh-3D;
	Thu, 07 Sep 2023 08:52:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAk5-00BcNz-2B
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 08:52:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31aeee69de0so681742f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694076711; x=1694681511; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeBbVRtX/aIWzlXHiHUn4OCigEvkTh1dLDX2VajCG9M=;
        b=SpcBkvhC1J6R2VCcCXefk0ztqm7otIcD7nuyY2YmwM30efsoJv8Of1ZqnRAnAuDIDB
         5vuoGapPgndJplUxVsU/mH+3I8MfPs+iwv+ZJyPkueLtqkhWjPegTJYqtMmNeMpMrAtm
         PmFDsGDkw+bvQIsbTVsC+U3ti/Uky4DHHPPy2KBiCqW1q75iAgIr3nDCOe9yv/011MZ7
         J+x7Qpr5XuWMPNlMWIBfEZoLWWCRehZWbdgY00RJJ1zsgPdY672jF0b/WfR3bWSq2phy
         exn22HB+bINPnLLrnrpjDxkqKrsLIB15JhsrmkF1FgvZK0ApBGmovSAuAwcSIP5uVSiL
         RoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694076711; x=1694681511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeBbVRtX/aIWzlXHiHUn4OCigEvkTh1dLDX2VajCG9M=;
        b=hY7iqPlBCRq5EpIeS8LAAOWpMf/4diXQHYE98CoRixFDoCAd82U7vW856ruQNZcLVo
         XRkS6b57TIqyd3oOsHMfqb5cHFjweg3MJQ0CqwP3fycndz/rwjRq3gzv3NKwo3he2872
         zscqESmOtNHzhdsPOEbCpq04vDd9+iegUTmI1CTqVdEu0RfstoY3/NJSY+Vn5rPVaNnt
         J/xqmHsDPyGnDpkcYKedaNuNb3HGzTAJD3X9BXCZnmyF83t70c2qoje/0aE7gW00+H4r
         AARAnqSAsAjqmj3lhjyQMxNImqGcSD0XEVPU7o+q1GTr6gwYNildvaNv0LYkLTVfvzWR
         NmfQ==
X-Gm-Message-State: AOJu0Yy6Jr8JKZ9gNIvilSxFjmRdBdo+jVfF4r4vdpJMNvf3Vc9BMO+7
	PYThHJmQ7Y6+bkoj/sEcb95XAw==
X-Google-Smtp-Source: AGHT+IGEGmreaznUgLT0wco7186DbxtRAxnnEI6albp1jZXrz+2WijzMa2iZXNVK2n5/iINTQ0Yxlw==
X-Received: by 2002:adf:fd4d:0:b0:316:fb57:26d1 with SMTP id h13-20020adffd4d000000b00316fb5726d1mr4496582wrs.8.1694076710917;
        Thu, 07 Sep 2023 01:51:50 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l21-20020a1c7915000000b003fef6881350sm1853914wme.25.2023.09.07.01.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 01:51:50 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:51:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jrtc27@jrtc27.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, bpf@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, Ard Biesheuvel <ardb@kernel.org>, anup@brainfault.org, 
	atishp@atishpatra.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	bjorn@kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com, namcaov@gmail.com
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
Message-ID: <20230907-304f53e7de4e0386d04f4dcf@orel>
References: <ZN5OJO/xOWUjLK2w@ghost>
 <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
 <20230818-63347af7195b7385c146778d@orel>
 <ZPjKGd7VstwIKDV5@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZPjKGd7VstwIKDV5@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_015201_716881_9060DCC9 
X-CRM114-Status: GOOD (  25.18  )
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

On Wed, Sep 06, 2023 at 11:51:05AM -0700, Charlie Jenkins wrote:
> On Fri, Aug 18, 2023 at 09:30:32AM +0200, Andrew Jones wrote:
> > On Thu, Aug 17, 2023 at 10:52:22AM -0700, Palmer Dabbelt wrote:
> > > On Thu, 17 Aug 2023 09:43:16 PDT (-0700), Charlie Jenkins wrote:
> > ...
> > > > It seems to me that it will be significantly more challenging to use
> > > > riscv-opcodes than it would for people to just hand create the macros
> > > > that they need.
> > > 
> > > Ya, riscv-opcodes is pretty custy.  We stopped using it elsewhere ages ago.
> > 
> > Ah, pity I didn't know the history of it or I wouldn't have suggested it,
> > wasting Charlie's time (sorry, Charlie!). So everywhere that needs
> > encodings are manually scraping them from the PDFs? Or maybe we can write
> > our own parser which converts adoc/wavedrom files[1] to Linux C?
> > 
> > [1] https://github.com/riscv/riscv-isa-manual/tree/main/src/images/wavedrom
> 
> The problem with the wavedrom files is that there are no standard for
> how each instruction is identified. The title of of the adoc gives some
> insight and there is generally a funct3 or specific opcode that is
> associated with the instruction but it would be kind of messy to write a
> script to parse that. I think manually constructing the instructions is
> fine. When somebody wants to add a new instruction they probably will
> not need to add very many at a time, so it should be only a couple of
> lines that they will be able to test.
>

OK, we'll just have to prop our eyelids open with toothpicks to get
through the review of the initial mass conversion.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
