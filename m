Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E0DCD98DA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 06:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCry95rWS4tEZWYsBlx4w5FW8axC1hZp6YZjL1FxGEk=; b=Gq+BrTe1xeSZFi
	Gkv4bgDMNXGrnO4ujjA7C8exuEzJVPSMobGA86HH2UTi4tR1d7CHTV17pDJu4Bv8UiMqQlNzo5eqS
	QBdDmlwbnn8did64gddz3Xln78dSoR7ugDev/znISEF0ktT+gSyjyDFLhWvYmrik3NmOLHvLJww3A
	24KRl9WosqHEviqak9azyV1Ner6nMSupPxC4k1SE1tU3DnqFvDUfV+TMaI5+WUehNPOOjNu78gdrf
	uzPpISvL2pK4L70aS93TleNmRlezDxxxCAnfCUsUMSA9c17Qfq2HYB6vRj9EAUfE9np9wLqxdrBOn
	Gk8LBN47flEvAB7tWKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMwY-0000000FHiV-2St7;
	Tue, 16 Jun 2026 06:06:38 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMwV-0000000FHh7-3SM5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 06:06:37 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-137ec563a95so4523573c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589995; x=1782194795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYT2HIZ/TljEaPuQNyUPwKuwE+O4A3F++I0Be4tA0UM=;
        b=Bv5N4JKWgxIzfHSkJbJSLWfq4G6AFxPkWLZOijSs9KkEPwBPbY6Rarnw9axNViDHa3
         To5IHfeakl0hGtzd/4C/TKyat8ceGndCRMjRKIfPL4ew8apEq0GJ8EzRYBwFmibBuTj3
         Vucy/mL9ZFXZP6VtNpZYVHh0/rpVzi7TX7p5ppUHDzM3reSv+RyIpkVhXCd0SVpj6MBI
         dM4O5K8rGcGZ/EHBEhSpyvo022JNoD2ANFzAI/MWAwMvP4jSsjtsIGg1PY+voLDfPz9I
         smPsJYAdOIP2tp5CXuI6XtVh8cipqAxmziT71SjslLClReJ25YqmJW25s8LgRSD+w7Py
         idaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589995; x=1782194795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYT2HIZ/TljEaPuQNyUPwKuwE+O4A3F++I0Be4tA0UM=;
        b=qbtcC2KLDksrYYQiAMPPYUg6Xik7V6tdJCmh/8SGxUHqMIk5eLstrPjhn2N8OdAYy6
         pVASFiLUcqZ3csh5nnl12eviYKANDAahZWyPGGDQbt52Qzcau49fvBbJJVwHaLGhFWTg
         p8SFimP/1MQMk+RXs3j4879yi9kTkDh6jHZLMedkpXRnlGmrJR5f5U9TMINVoCuW41q9
         Vj7wvZbaSSkObmSOD9CCoxTuvV8qJefK3OD6hQ+EL6GGrFHpXuhBs3IKxzyTQLNKoFAV
         UYkaklPXC09OhZNuWku4k2+pJnb70drVtvIubJJB8CECk0FSLBsYfeoerTQaX/7Kt6MK
         gYEg==
X-Forwarded-Encrypted: i=1; AFNElJ+D97EuIgiiNFcOytlkw4hQvNWH8r9Pf5zMi/puqs5fReFKReQoyddAiZRzAA1Jrs/MKj22WXVEhNNm2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJTl9CcEKMwhQPiAZ2d4hiUBlc6JTqIM/498XWTnh9lt9TLK7
	CNdEZcRRopoJkQUr3Bxen32nWfJ4haJ3Px9zVCB1YNTD5TNqI0aFeX56
X-Gm-Gg: Acq92OGfuQcNilLKf3i7CJSM1O1tVsvTjCw1GxJgZLBVvqpct2Fgk0h+7GP1oNPeN0z
	eVTKK9wtbgIN5ogiCnMAzgsVZWmotWcodrmuO9/mS5G5vVVhyIC37NVB4U0AftA6eCL2D4LEXbr
	gzTSWte9F6iHPgjHdp1IHhH1e8oQmSDPSRRjAVoEy3dmcGMV8d3UAsbWupPGynTAYSDrLWd514c
	MORN6wnwLcuPdoQjnFYR0AiQbcERngtA0Qp0KPhNZGwneBM3Eltyt19AqxN12iMYkPCCBdZOLZ7
	7MPDVRpiy4P/At750qKj8CTxF8DTOndsty2OEGUB8S4MqNpkgnyNv+/uP7AFJpanSpCmuSXrk+e
	CtS+0i41QLZev2YHsJP80ux95j+9mcivsyCIhiNk2zmtiUOYLSp5p8QqA1m1ogr6DP0n9JS0sMl
	Q6kItrgD4JLU4=
X-Received: by 2002:a05:7022:305:b0:136:b370:64de with SMTP id a92af1059eb24-1387901e454mr5481988c88.32.1781589994812;
        Mon, 15 Jun 2026 23:06:34 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm12930812c88.9.2026.06.15.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:06:33 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:06:30 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
Message-ID: <ajDn5oINgUzKhELv@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87mrx1eh8c.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mrx1eh8c.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230635_866236_DF2E79A0 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, Jun 11, 2026 at 08:14:27AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> >  bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
> >  {
> > -	return simulate_c_jr_jalr(opcode, addr, regs, false);
> > +	unsigned long next_addr;
> > +	unsigned long *regs_ptr = (unsigned long *)regs;
> > +
> > +	next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(opcode)];
> > +	instruction_pointer_set(regs, next_addr);
> > +
> > +	regs->ra = addr + 2;
> 
> c.jr does not change ra.

Looks like my tests need some work :/

> 
> > +	return true;
> >  }
> 
> We have CONFIG_RISCV_KPROBES_KUNIT now, please try that.

I can try to extend those to cover more.

- Charlie

> 
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
