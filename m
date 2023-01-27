Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8081C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 01:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLG0+HZ6xrKeGH58QH5aI3N80LtStF/f5GMGZVJF4Cs=; b=fHJyaJjxULB0dA
	kGybbL9uOy64zzgEzerbfT7aLwBKCa8zt+VVhESIdTtVB/KV8wAWrKpUtuZQ+QKNu4fxC1MuxSGvk
	AhuX3/JlVneGvbqY4eMb9DCeXTnoPqzl2ktuSuUQfOqKe0LJLDA7jm2nsHL1sfBEKylMEjvpPwNWw
	Doh5MAojmgzNjbSKkUtu4Kc92uFbyOIs0KrLSUlMtsHrGB5g91iQ3LLJgya8/7PzhwuIL7gZxxBy4
	EzcMCzBCWgC0tAIbaPNnBTXg5ThF9ogD6NhDDZLQRbIek5cZgX/o+Q42SBuhh6Xg2VKWQvj31Ib3y
	txGNFg3SmJFbWLF2ZcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLDyA-00D65P-Ud; Fri, 27 Jan 2023 01:55:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLDy7-00D64q-13
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 01:55:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B3B361A2A
	for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 01:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4F3C43443
	for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 01:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674784553;
	bh=xIIQl3ZB2+RMmaEg43n6+TKITV6u4wlncwDLBsaGFaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cxeuf73iBkuC5Q1eWaPdve8MXg4Zo+zL/t8ThUMvc3T4WK386eCOn7bfLm+If8SYY
	 BRSKursGk+DKwaK6CmjOOF1icaUfAzS0J3XkTj6lysjatWrnfErfj++vzxlSSczvtE
	 mTFzJ/NdDIoxAk9UkiG3QpzNxFPP7r2hnKdzhpeNtoMqNylWS7k2nEW99zEi4uhB4p
	 kumuloqt78eP6C98mP/HeAR6OpSl+4toQryT2IwKTh29YtHWUCiNYyGs2T5tDmwMN9
	 DfibtbOc1CfRk4EdQfuZb0LIiiGi+mzfYMg8lIOzC24vWwxJeT1CdealniNAlPHlCL
	 GpbmqiHFLtTUQ==
Received: by mail-ej1-f52.google.com with SMTP id v6so9992757ejg.6
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 17:55:52 -0800 (PST)
X-Gm-Message-State: AFqh2koUDXg/zDTt2QnN3dImdnUyU+jleZYhtDPDa2cOWS4ryBGUb2+t
	vm1yQmSY0NKbOfQoKI8LQYFMWx/lLI813wyXZ2o=
X-Google-Smtp-Source: AMrXdXvopK2g6QSnHhoWKIzgYgeptPf/W6Irz4d4w98uaPvM/YRNF511bGJiZPWLeks6aVTKf88CzEoCM6lvCrnsi7Q=
X-Received: by 2002:a17:906:bc54:b0:871:9048:b7e9 with SMTP id
 s20-20020a170906bc5400b008719048b7e9mr5464421ejv.120.1674784550987; Thu, 26
 Jan 2023 17:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20230126172516.1580058-1-guoren@kernel.org> <20230126172516.1580058-2-guoren@kernel.org>
 <CANiq72=Srm7aBu7Stz8-t1PkhFsPXUyoxaLJCLJHG9b6mVc8sQ@mail.gmail.com>
In-Reply-To: <CANiq72=Srm7aBu7Stz8-t1PkhFsPXUyoxaLJCLJHG9b6mVc8sQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 27 Jan 2023 09:55:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTATWUHuCLWfpDfh_d-Wq72ry_=RnsDS_tFCxkgvAm99g@mail.gmail.com>
Message-ID: <CAJF2gTTATWUHuCLWfpDfh_d-Wq72ry_=RnsDS_tFCxkgvAm99g@mail.gmail.com>
Subject: Re: [PATCH -next V15 1/7] compiler_types.h: Add __noinstr_section()
 for noinstr
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, bjorn@kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>, 
	Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_175555_135487_F52844BF 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, Jan 27, 2023 at 3:14 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 6:25 PM <guoren@kernel.org> wrote:
> >
> > From: Lai Jiangshan <laijs@linux.alibaba.com>
> >
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
>
> If Lai is the author, but you are submitting it, shouldn't your
> `Signed-off-by` be after his? Or are you co-authors? (but then it
> would need a Co-developed-by tag)
Okay

>
> Cheers,
> Miguel



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
