Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63CBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 22:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Grfk1TeDX4HjusI9/he6pRkcyU0xe36X0EAbQr9Q0Xw=; b=rNtSLZdq3nH1Yd
	ufUc0F31A0//8pCf/YflgQQbUHujtmDSPYLv2lr+WTwb3Gw0GDt9atSbVKWpRrrqUdXIKECxhGKZT
	LIh6daNAlgGF267kZCHMKpN03ag7Ern8yNun+WGchioQW+e31cETOZCu0r5+cP/hqutF/II3J/VQc
	Ug0ehtes+VMMgyhaJU30jn69WhVSs49iRJk861SW4YXHiLbimMjuLEtKOgqDC/7vrdLp7nfBD4rBJ
	oygOQIV/pPmQoUB+90d27X9LUH7a2T9WUifCWG0RhLLmKIa0zxZaDSz9Ek159ogiivZWwglA2jZ0U
	Dp4oNp53WdoI45Urq7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntcg4-009ILF-OQ; Tue, 24 May 2022 22:06:56 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntcfz-009IK2-ES; Tue, 24 May 2022 22:06:55 +0000
Received: by mail-oi1-x22c.google.com with SMTP id i66so23022085oia.11;
 Tue, 24 May 2022 15:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nazAJnmKC29W9OE3p4jtrAjcYB6KyAUjKMWBeLzTPEM=;
 b=pcnkDXAe5YvTRgJxeRg3matW3Bv2wtdSXK2Y9Hhj3sk6qgF61Ruuf0leQFCEirgQ7C
 TtUxSytvQlTV0hrf7SgFsfLm4pPUSiAEwfEAiDfG+gThPQcLXdGJSK6JHNeep3tRNJ7+
 YDxIKarQEOKdoCzcTVFB7JZVwvNYK5/lER5aExjEL2QXKzNws3LspaPVFgYSsz+Df5OO
 AwYS+zoL7QF5PiLOdJpQg4nnSt/V9RUgdEJ5wZMHdPTNEuVr8PebFOltKY2dkCe/XFbt
 Uhc/lImMGV4sNqpIxtqzD3SJUdxInK/NOcl8uFrZ2Zr5Q6VjdDZrqJ6pPfQznwY5JKmN
 CRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=nazAJnmKC29W9OE3p4jtrAjcYB6KyAUjKMWBeLzTPEM=;
 b=ekVGudhrSMKjphBbq6kEJTk8y3S/ocSLjAlnyeyGtl5Moslit+lJ20jS0EaqYsEQqX
 oLSTbvPgrAiB3d/gPtzAnBzEE8ronHR9V+iON1ObDJKbyCTP8DwERtlmujxnf+oF+ORW
 DqA+KcruiA7+MzNaArwuNYwBSRmy/JzKVkvXDg+pXLKoFTGWG4UoP4N4qNr1dyu5hkw+
 L/qXW8Sd8hsDLPHQCylRUoFlot9bQkwYlYcN3TRuoj01TAmAx87j3gjvUfpdHPDXjdRT
 KJ8n4IgenxxbrJmBVQtvN4Zx/CXt3dh0D1y0DleUDAgwmWY4LsK4BzUnxvdiAk3HXfII
 92aQ==
X-Gm-Message-State: AOAM531OnNG6OeyHTvLDG98bphbTOiM5dZelFe3TBkZ9u+RLVvW6+TpB
 H1G0sbNU5xwmGP2b8hnRfLzPqxwzvS3CNA==
X-Google-Smtp-Source: ABdhPJylOJvDhga94lACYzo4DYHszPBVfc6hKDFXDCn+ItVVcIHVwPQKrHsoO+UpMTYhmFLK0bMmjw==
X-Received: by 2002:aca:5a0a:0:b0:32b:a51:6cd8 with SMTP id
 o10-20020aca5a0a000000b0032b0a516cd8mr3580050oib.112.1653430008860; 
 Tue, 24 May 2022 15:06:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q7-20020aca4307000000b00325cda1ffa2sm5734695oia.33.2022.05.24.15.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 15:06:48 -0700 (PDT)
Date: Tue, 24 May 2022 15:06:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <20220524220646.GA3990738@roeck-us.net>
References: <20220322144003.2357128-1-guoren@kernel.org>
 <20220322144003.2357128-21-guoren@kernel.org>
 <20220523054550.GA1511899@roeck-us.net>
 <CAJF2gTQ5RS8wGfSDPoB4JLtPBoM=ainuz_EJ9Tweq0mqPM=ALA@mail.gmail.com>
 <CAJF2gTSa=roJOiKFiL8nSQ12E-emz-xrXs=RNAc4zSFaPuRAzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSa=roJOiKFiL8nSQ12E-emz-xrXs=RNAc4zSFaPuRAzw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_150651_527650_CE895616 
X-CRM114-Status: GOOD (  14.24  )
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

On Wed, May 25, 2022 at 01:46:38AM +0800, Guo Ren wrote:
[ ... ]

> > The problem is come from "__dls3's vdso decode part in musl's
> > ldso/dynlink.c". The ehdr->e_phnum & ehdr->e_phentsize are wrong.
> >
> > I think the root cause is from musl's implementation with the wrong
> > elf parser. I would fix that soon.
> Not elf parser, it's "aux vector just past environ[]". I think I could
> solve this, but anyone who could help dig in is welcome.
> 

I am not sure I understand what you are saying here. Point is that my
root file system, generated with musl a year or so ago, crashes with
your patch set applied. That is a regression, even if there is a bug
in musl.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
