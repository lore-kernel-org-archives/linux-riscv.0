Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C94C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:36:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899546102A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899546102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4XXwqx5wFZ6O734huLjgRwKKdQxn+Qo9LpkfG6kylpM=; b=fcSh7QwFD6fM9XVTTLbbCfugL
	hQM51OiwTCBQ3KailFwJfo+YiaFwSO27DmdwLdvkC7gLrE/OUOptDVfzqvFsu2KpXE6ONUxoVgGPo
	EpxECeD92oA2OtBJM3wOuLiF7/wE7LTIVXsa6Xu6QVeFutAZ63jbwfir+zBMkWWspKDmGp/3yrNfs
	+DJavvzbOhvMFtfoPEy0BkL3CgmsfLL7yAbc28RxJ2fvcXfIYVjQV46jjn1FLkZWWzSSa5d0vU9K8
	3M0p2nv2B2HMIx1+dednHlQPVOlvzQWQUtvmZz7kFfJ0xs9OSvf+g4lxvY3nzr1t2cVEbTwbNbNtA
	BE6MF+CUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZsq-003zsq-1E; Sat, 17 Apr 2021 01:36:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZso-003zsh-20
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 01:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Cn/cJuEjJ9HZKaS69dSlqETG9/fZ0WAyDEPOim+PInY=; b=QtOOEf6WKqxrq/GJdqZQQXo6wL
 zMuXux3D3owtedf5osVvpwqJiys+IMaqRsfJ6O+WwQi8XcwyJd5teZhfByZHsc8x660fpfeqnAE+z
 btUVB095KOiy6QtzAES1tv7pXiZV9xLoziuOgPmSJljmJIFZvs2JoCRJA7zkVNaS16AAmUbf6ZTW1
 HtgTGaJQIQcW3kWin6gi9BBjaS5f07+qnxdFTy0A6q8JQqi0fymGejyEMrs4S9b1AaJUhIpN6KXOy
 tm0GQHanL1gZ07FEvMtK61Uqv1oqN5VqZpuxi8RUoAC8A/ZW2XtBQi2G9LF2L0KyXLOui+F9q/hwe
 hEeOjBNw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZsl-009pNC-Bq
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 01:36:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A3F3611AC
 for <linux-riscv@lists.infradead.org>; Sat, 17 Apr 2021 01:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618623382;
 bh=ZGiW7XjMqPnX23vPoAublY1GvetP+oWUwxHm3Gl4bys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WYWIrAO0aznXudfwyArZZchGzW//lTcOIanP2Dwv4MwsOGn6vnJEiw/4XXM/6/tSP
 jfom0wQ/Wj/VtkFvJKIzn7/oIXwHz71T2CRQ6XeIxheHO0qw1h+w5WM8Zw3LEvxmTJ
 e/jf/DdexeAeRRm9CsR8N4jgNSt4Cz2q6YwjsagB8zb8P6/wib1J1KWliDaVv4x4Vr
 uvvtPDHzqTYHEFgYdV7x7Eg7nOqy22WUbVg/39LBgX2asBS5K2qEy5fgVAJIMnZ/9K
 r0NgoVxjbVyrFtpCEkPjnoFwM36Wy9C2yW/gN0PGaTaXzvs4efl+7WYR8SXKKqiaPV
 iP0W0AMhSjGXQ==
Received: by mail-lf1-f42.google.com with SMTP id n8so47621620lfh.1
 for <linux-riscv@lists.infradead.org>; Fri, 16 Apr 2021 18:36:22 -0700 (PDT)
X-Gm-Message-State: AOAM5339CV3mMUt+GR72cshXJ4FKWAUUVcws8GeHqb+cDEW3WlPbVAlt
 voUUa605UWkwyTDBqeMdsaslCc3BKsaO8dX0nOQ=
X-Google-Smtp-Source: ABdhPJxTCiLOcyZP0px1a402RFobt2UPKd4ESZA4RmjuKj/Df+3QjO9s2AEmxJ7uCDt4RbfEfMedzHX8FW2hLzoHu5c=
X-Received: by 2002:a19:e34c:: with SMTP id c12mr4894188lfk.555.1618623380992; 
 Fri, 16 Apr 2021 18:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <1618472362-85193-1-git-send-email-guoren@kernel.org>
 <YHf+z0AotZmjvaJ/@hirez.programming.kicks-ass.net>
In-Reply-To: <YHf+z0AotZmjvaJ/@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 17 Apr 2021 09:36:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQkPauGnLXUfs4sPvDx1MhXvCmb9ouGOAANsuEFU2qz1A@mail.gmail.com>
Message-ID: <CAJF2gTQkPauGnLXUfs4sPvDx1MhXvCmb9ouGOAANsuEFU2qz1A@mail.gmail.com>
Subject: Re: [PATCH] riscv: atomic: Using ARCH_ATOMIC in asm/atomic.h
To: Peter Zijlstra <peterz@infradead.org>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_183623_440863_C6E3606B 
X-CRM114-Status: UNSURE (   8.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 15, 2021 at 4:52 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Apr 15, 2021 at 07:39:22AM +0000, guoren@kernel.org wrote:
> >  - Add atomic_andnot_* operation
>
> > @@ -76,6 +59,12 @@ ATOMIC_OPS(sub, add, -i)
> >  ATOMIC_OPS(and, and,  i)
> >  ATOMIC_OPS( or,  or,  i)
> >  ATOMIC_OPS(xor, xor,  i)
> > +ATOMIC_OPS(andnot, and,  -i)
>
> ~i, surely.

Thx for correct me. I'll fix it in the next version patch.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
