Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B330CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ET5VsIjZ9hau0ymHA6iAo58o320NcHn6NFidrEYVIaY=; b=2TGntdt/V/K673
	AMJuCggmhCA+BVe6gxqRgnxRjL7OU8fNqCDPve7kNGxuZXrT3iCEx/U3I6oD0K52hs/JduM7mMUeT
	7sHZmDpxN73sPHq7sRUMyClECzeO/f//RCzQzQDCzWsLfI07eHxpmHNEDQ2Ky6Quc74DVh8p3WKNf
	+1/kcRvBp0hJnXL6dldoSUfptXSV+ojQ20lPJUDAw+r93madNG1iLsUsnDKADdEj4cPGsbl/j2x9U
	7Z7w8tSGfCsbnruls1RISljFC9mHyKveMYqk5ZybjtI1iZbg9qlThXrqtE3/fJ5MRqNMCdRl+dRPo
	/TaqLN3N8BLmj5oEMLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqhB-00000005YIQ-3J4c;
	Thu, 23 Oct 2025 08:29:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqh8-00000005YGm-2Xkj
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 08:29:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47117e75258so3665595e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761208153; x=1761812953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
        b=lrLblffOugnHMSyPnRaobFLUA0ok0eqaNHangL/WfJ1jyO+nkq+OuAyCRBIvWDSjMb
         +Ux7xHEgVp95oc70ZuYe8zKpgI43T1oIOJXBAKlRAas6+XaczRJZWshjeai+p+wXFRQb
         5wNaUXj8Jgefbo29zDFqcSK8YaEJq0YToS8slPFTIiTAMNQ3DtdGzEVN88vyfNTDfby5
         gDtUSKel9d6BY9CPen9EBoGp/EjdZ9wQ/NUsgFOESJ+y7PzLUhSFwZlemJPfTAh5iOMJ
         R58d/ZatTK88a4eov1oG5KHX69u+QCTwWzTZgBF1HCqpVK3YfMvD+VjEA4fT112wFzlR
         PO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208153; x=1761812953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
        b=s/KWYQMqNw3CQsbD6+xCG57AcXFpG4IGfPiDlRIoBIZHt+5tR4XbNooGzYKYC2ecbq
         zbYmkeNG4QiNCK2WVdfEvDPgNPXCU2GRzjJfiI9jOytjK1sD+sIYqrcfapXNwXEsmMzb
         wuZWq31wXe1QARvWl0B5LBlCXp7XUGdGgKzKsEDj3AJqinMM2Xsa2caWcz99tjlRjtbd
         vQc/Lw1FvSkx5ebqHE3K3FtZy9uZJC++xnhJWDp51/mew7rZ4ghdBNIV1K7pIWfWTy2Y
         fGYyC6XMjaTKvAu+aSXWc5oTqcEOr/shQ08Cw7gdhrnsCBaZhkTQlUB6e1uukgGAKQkW
         Lujg==
X-Forwarded-Encrypted: i=1; AJvYcCW3gmVOzl9hhO1J/ZydSxmcITQf+yVpu5hQBIzJb95D0dBknEq0WchBI6vxnSUIZkef84S8GegfLdinZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxY5rRSLf5pUwg7QvloMlvY5E/BFK4lexk0g9c2egx1Ml6uQfV
	JNiiRb/juBMLuaLlpzLFjz5m55bNSAJ5WsTyQ3YC131/m4lEBd/9GSZW
X-Gm-Gg: ASbGncvBWjF2z+y1KxlZ7rv7RM7Gb4we9Neat0sAqGBaKUM49Wsg6P0nCj8Z1UfiAJG
	TeiA3C+xJnAGtJUq21zlwd/cWCwbyngGJMP4twvWm932J/6V9p9y+P+Y2klL5vT5CX/+BwqdJza
	ff0k75ANAZ9LQLVTv+6bhDvgD5nktKy/PGTZ2lotee2kaezrbN4hLXmTXtfKCkQjQwoO8r/VYZs
	FUNPxj+cHZD9a4jSZHr6inu8f5EhNsBpHfo6LOpE/NIRQrGG4F42GzCVUAj05BOUf2bslRfgOAO
	2vQP7ccTke/pgLLOSHb/2DHtjWKtLWK9qJ6N50XzY8dDclVTpkShUQ0yDOzfkairZphxWj+9/Yb
	5jMzJMACQ/iI9nfNMiSB5q7IryCBApQvxGliIhhJS41kLVeFpwCx6pPOI/b4Ianebb+mXkF+GE1
	K6pEElcke8QnM4yk4QiEWOlGTX9jxLbmx/9OdhkB8Mo70XFDoyPtY/
X-Google-Smtp-Source: AGHT+IHSgtH949jpIYqvryVHE7ahULmbxvweEBq1Xh1WJbPJkG9goEBlMqfaTmrq4Q942DJtzk78Aw==
X-Received: by 2002:a05:600c:8b35:b0:471:1b25:f9ff with SMTP id 5b1f17b1804b1-475cb065415mr10429885e9.39.1761208152472;
        Thu, 23 Oct 2025 01:29:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf4642fsm23356135e9.17.2025.10.23.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:29:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:29:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Christian
 Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti
 <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet
 <edumazet@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
Message-ID: <20251023092910.2ed9cf15@pumpkin>
In-Reply-To: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
References: <20251023000535.2897002-1-kuniyu@google.com>
	<20251023000535.2897002-2-kuniyu@google.com>
	<CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012914_663827_79B2E36E 
X-CRM114-Status: GOOD (  19.55  )
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

On Wed, 22 Oct 2025 19:37:27 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> >
> > unsafe_put_user() can be used to save a stac/clac pair, but
> > masked_user_access_begin() or user_access_begin() introduces
> > an unnecessary address masking or access_ok().
> >
> > Add a low-level helper for such a use case.  
> 
> I really suspect that you cannot actually measure the cost of the
> extra masking, and would be much happier if you just used a regular
> "user_access_begin()" (perhaps the "user_write_access_begin()"
> variant).

Or wait for scoped_user_write_access() to get committed and then use that.

	David

> 
> The masking is very cheap - literally just a couple of ALU
> instructions. And unless you can actually measure some real advantage
> of avoiding it, let's not add another helper to this area.
> 
> We spent a fair amount of time undoing years of "__get_user()" and
> "__put_user()" cases that didn't actually help, and sometimes only
> made it hard to see where the actual user pointer validation was done.
> 
>                Linus
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
