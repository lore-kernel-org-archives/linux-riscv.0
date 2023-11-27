Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6888C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNPE+QTjo1Nnqy94sJWYUfKrmBD+MPi4RbHSiysRMdk=; b=DRgGP6rP4wyroY
	A22SNgrzFBCTiEJbPVawJabDqTDXPYZHRuEzR1m1+dZ/r0x5kbhIoAEHE+/AoZFg7FprHvdELeBae
	/WKqJrNNEP+D75qKTHbnphAg/5z+GTJcILo/mKix5K1CBm3U2JW3xiJYXUyBNky49KjqmI8fQNM8A
	0lgyQydqUhxgN97xbM6OcawgSRiUbxGcw/QhAwloebCJBLMPrk+EEw5GUYgoh5ObcmgWK9jHJgyEh
	8/YKTPWzajpg4zIDeFDSPLOxiGom/s5vL4/rS2ZhLNKno13eYkI07MJDWJfA7QfAbdMCaGGk1yEPK
	09mYS9oKkxI++KSD8vhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7g9P-003Col-2g;
	Mon, 27 Nov 2023 18:16:07 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7g9M-003CoC-1f
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 18:16:06 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58d08497aa1so2769698eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 10:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701108962; x=1701713762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxoxtfZyYEABjHZ6RtVtSj3aKhK7A/US0jtAU3g5OGk=;
        b=1tm6g9gncvY7W//eNaydZv8FPGp6DTqea8Pwauzk+s/gBdRijyVUWtoINKZwIn4Pp0
         r4ELV86f8GT7V4r8xjsCEgEN+IsExkWcunjp5q8nZJHEp9TKGLtR74J/IjoP0OX39c8L
         YEUC5sP24hadDZO/Q6tPQiC1byAPt/51nYUEyws7BfjPan9+TfHZUYQkYTTu/AmLh3wC
         ikCaE6KKDioo0HCRo2MKwznOv5kbrZwCIBx2dGBQYbVUQpLaPutvAgXoOj8E1EIE5JYc
         Yg3st6BVfOqHCGORSvUxomrbAYU5/+nFzsWiTFFRDi9Yv/8sVyrJYWXr4Dij1le8Z7JN
         ijLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108962; x=1701713762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxoxtfZyYEABjHZ6RtVtSj3aKhK7A/US0jtAU3g5OGk=;
        b=YP9FE3c0JsjS0WndvILXHJ5h8JzinJgJC9kotrUiZzcxaC8YELyOf/BxFZvZIhv7/i
         tsT6rtaqwsMoO2lXmp/ARQpDOMTlEGW3X1M1tMoWAGb4X4v19TDNn5z4xvwJhv44yzt2
         LmqQlMAcx9+cLqWed6x69mH1aqulOgjI30VAVIk/hzL0Qvmj0pEOm3nAlY4c2vtKcELc
         0VBojTB0tfJBwBneI8LqegvygJ0BJBHYSeAFYD7b8xytRWmQRP6TAXhMDhl3OLtCDqbC
         JIyaPh344suSqewqFONfAYqrUkepvosQjj+RWuPawXjIqmMJFT3TXbC4jhU+iJN2kweC
         8eZQ==
X-Gm-Message-State: AOJu0Yzc/4/YEDURixiLQ2EKhdgzS/PttDSngWyv8PEH5fjabKwG3xQ+
	rpxqFt/8UFN/g2dXcZVnV8vZIg==
X-Google-Smtp-Source: AGHT+IE+v6fFB7xdHxMtYP8G0Nfw9Tf/7BYotEm3H1gVkhmuH+mh9vYsMGoDKYeeMoWzyCVVgNRotw==
X-Received: by 2002:a05:6820:809:b0:58d:a6ed:5601 with SMTP id bg9-20020a056820080900b0058da6ed5601mr1113420oob.1.1701108962609;
        Mon, 27 Nov 2023 10:16:02 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:a896:28e0:13ca:92d8])
        by smtp.gmail.com with ESMTPSA id b18-20020a4ac292000000b00581daa5c5fdsm1572457ooq.29.2023.11.27.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:16:01 -0800 (PST)
Date: Mon, 27 Nov 2023 10:15:59 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZWTc3/FeBbXHs7aM@ghost>
References: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
 <20231122-fencei-v1-1-bec0811cb212@rivosinc.com>
 <20231127-epilogue-frying-4d5ba926617c@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127-epilogue-frying-4d5ba926617c@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_101604_753309_0EC37B37 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Nov 27, 2023 at 10:44:54AM +0000, Conor Dooley wrote:
> On Wed, Nov 22, 2023 at 05:03:20PM -0800, Charlie Jenkins wrote:
> > +
> > +/**
> > + * Enable userspace to emit icache flushing instructions.
> > + *
> > + * When in per-process context, there may be multiple threads using the same mm.
> > + * Therefore, the icache can never be assumed clean when. Multiple threads in
> > + * the process may modify instructions in the mm concurrently.
> > + *
> > + * In per-thread context, it can be assumed that all modifications to
> > + * instructions in memory will be performed by this thread. When the thread is
> > + * migrated the icache will be flushed.
> > + *
> > + * @arg arg: Sets the type of context
> > + *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
> > + *			      emitted on thread/process migration.
> > + * @arg per_thread: When set to 0, will use the default behavior of setting the
> > + *  icache flush context per process. When set to 1, will use a per thread
> > + *  context.
> > + */
> 
> FYI, this is not valid kerneldoc and breaks allmodconfig builds:
>  arch/riscv/mm/cacheflush.c:159: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 
> > +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
> 
> 
> Cheers,
> Conor.

Thank you, I will fix that in the next version.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
