Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F380DC54E94
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+MDnxOHpsryS1H6kY2t6jetNACODW/B+PPrhs/t3Kc=; b=QMnXLNnS2md5da
	vpeDECUR9u7LfQxSzLuXUm2eK6IvV0M1ksx7W9PDg2Fqolps4CsaA6dhkdzkRbRezEq4pu04kjoUw
	Fh7ZZYeHYLoMsBgWw3sPBlycW138CQ5rX+Xxls+HLHIq/e/dHqqR0YL3HwvQfhrk/O62HG6/dWKdm
	CQigmBlj0r4j/iyZZj+soxbfjQZWOlSex4caueO5PRIJMWgzr8CnunjLOBlejImLLtaoP9sRF0nzV
	cXz7VjupnxLrjwFxh4C7jyVEW7vUPdPbuDDrws6QX+g13wLH+mGErbPK1S9YQvJBK+fuHVx6yH1G1
	HVgzwaDfx9KyrijqoA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKQ75-005EFO-6A; Tue, 24 Jan 2023 20:41:51 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKQ71-005EDv-VT
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 20:41:49 +0000
Received: by mail-pg1-x52d.google.com with SMTP id v3so12106210pgh.4
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 12:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kArh2JTETPG4MZN8AtzWKM/hnB740sJiaw+6d2XmltY=;
        b=oyLp/nUpTQCOQMyT5yEtRG7o0JQPEbxztyhTTwBBWfbRApCOOFV/WkDLdIbvbSvWLz
         b1hrf5/g8Fdn++whjE9zqRHbe7cRC42175lcv4Eyj7FJEwCFaWE1ruLkzMZpzPw3MEn6
         dm8HGLCYb86tX0qQL+B4f0kcnhqKsu6O9j+KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kArh2JTETPG4MZN8AtzWKM/hnB740sJiaw+6d2XmltY=;
        b=3zyqzjvi//fQJXgzzBeUNOc8qQnKieCoi7uOlfgcKCZObjjfQGUyv3w1qdkBdrOeB8
         K25Kp8FDcXH0P+bywoJ1cJCnRP6xWMKcapXe3xjadp2SUC9cvKfJAqcASYZt91BwSMjv
         kbpSWb/SUM9mYKbyiyx2vajcj4CbTxO2d9q1A9aT9TaPN24KOAq2jbWMOavWApu8eAZS
         V3UaeGLzzJBYUNJkru+QaolCs0wqYVtqoZtX/vhBsw8zRGtGcl8RCI+WiaexdV8tiWB1
         mIEYlRPITs/q8K5SRcmceBpoE7kAGOQYUqvYUrUoVzB9PHgVWiR9ts63HT5lLSwq9qkU
         jHaA==
X-Gm-Message-State: AFqh2kohosqIJt3qqeqzsdwgd0c2uryiykArw59tP9sL+M7zEmdI5iMs
	B4CjkwESGXbnAj3GcOrtqFEFOtktuVQZDtqJ1gEo
X-Google-Smtp-Source: AMrXdXv//TSHap1rIs4T8t6FimYpSoWP8wIEH1RnksqTCs7706WWqSUBG8nxukPl0ALp6mPXwdjofzthPg+fGXMiqgg=
X-Received: by 2002:a05:6a00:1d23:b0:58d:b662:af11 with SMTP id
 a35-20020a056a001d2300b0058db662af11mr2817916pfx.37.1674592904836; Tue, 24
 Jan 2023 12:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-2-atishp@rivosinc.com>
 <20230112100608.d7tnvhbotjfctlgk@orel> <CAHBxVyESkQ9Krmn-44f-A8hYzMrZBtBfq15fdx-sHDQfkBMtKQ@mail.gmail.com>
 <20230113072255.34cnyautbwiy25p5@orel>
In-Reply-To: <20230113072255.34cnyautbwiy25p5@orel>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 24 Jan 2023 12:41:33 -0800
Message-ID: <CAOnJCU+UBG-AouAc1M4J-i9Y_nPE9RfrFZfNyLSxhKbNF55AMQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm
 counter width and count
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Eric Lin <eric.lin@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_124148_238274_128D7BC2 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 12, 2023 at 11:22 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jan 12, 2023 at 10:18:05AM -0800, Atish Kumar Patra wrote:
> > On Thu, Jan 12, 2023 at 2:06 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Thu, Dec 15, 2022 at 09:00:36AM -0800, Atish Patra wrote:
> ...
> > > > +EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
> > >
> > > EXPORT_SYMBOL_GPL ?
> > >
> >
> > Is that mandatory ? I have seen usage of both in arch/riscv and other
> > places though.
> > I am also not sure if any other non-GPL module should/need access to this.
>
> TBH, I'm not sure what the best policy is, but I presumed we should use
> _GPL when we aren't aware of anything non-GPL and then when a day comes
> that something non-GPL would like this to be exported, the patch that
> flips it will provide the justification in its commit message.
>

Sgtm. Changed it to EXPORT_SYMBOL_GPL for now.

> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
