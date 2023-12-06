Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2104AC10DCE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAXsixWfQkPAW79jsRbnppzBBzxk8BNZ2XxiCJS+IPs=; b=ZXK7cakkDQjp5T
	pOhq2+LXgN8nzYYDzfI5CXeE57Mm7fNZ2+X+tBPmabSv+pFS8PTEJCVWftcKnE23An/YKpTRAF7Vi
	/fYnHevexwKEe2bNC0c0MOGvLpoEzkha/uE3Ljz4NeLiEbhJQTnXNcT7ESJ3MU18Ne5Msy5+q6kzh
	xRBNWKgaTEX3LDJz30tFt3ZyOu4HV96Lbv1DKqBYUl3NwRemuyEprEdLZPtWASr+cOvQOyWTTTfxZ
	kQ+Z6vwhDY8KQcuUFH5JtokL6SdXq8eUXT2gcCqVOPyLjbXHQlgRr0BIAHKsWbc4a96ZWB7Yfkokt
	wFJ55tyL9Ybl0/eKHJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgDu-008kJt-2A;
	Wed, 06 Dec 2023 00:57:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgDr-008kIt-1D
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 00:57:09 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ce6caedce6so1119360b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 16:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701824224; x=1702429024; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWAAiSe8+A1VbsHX4/sTLd9FUASXF/9Ffo3lwz2GCx8=;
        b=JEnP7PcFotjr0DA2lnEL4+ZVl1tE92ogxvzD21zHkiF6JGoySYOQkIvCzhvMDfXM43
         SYzN7vH1FFz53MiuYJ9H58hW5iC48Wa9aPpWee8UtOsGhbo9PRb+4KBZ5bYfQRyyu2nn
         p2FzYW+iV80/pC/BBeKA0ojTqrsnY5Lb8miRUHYke2kdaDZriNzAe/gC6TKzJ+NscpEd
         vFx2bjad2ZSYUqbiiuccm9KsexrUb9dCaUMRS9z+BfmrpYWBoLK8vup/vM1qkKMez/C2
         BxW763FcTh7idWDlyaf5PRj3Ykhrp5a40CWasMLsiJ4VeZWvEcr67Z89ga8iBHRaGmrC
         uAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701824224; x=1702429024;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWAAiSe8+A1VbsHX4/sTLd9FUASXF/9Ffo3lwz2GCx8=;
        b=URo+5gFXltIu3YE+BbEiwo64sLHSoUfzUHQj2rwWFK8P8AntdY/vSBwe575QtoyaK3
         J1dDlAfX0zTrHAHqQcElvkSrAEbds0PNbFnjPvG8hm5Ql9XtNpHTAD+SjhG6zRcQguWj
         2TkO/BIDry352E1MtfH2idgpBcIVCj7xAehT8vpLBdDg8EQhqBH4rnUCRaN8qV6TRlx0
         kGa0eI4nH8Lmkqq++VzxzyQcoUjZ8ctoDcKZY5LDKXVkzu1XNV8STXv4WzMD7F5XqDHH
         QmNdg2jEM8Rhcw50QNbc7bOAgUQKbZiODHPxtWtI9e+ZuJ+xWJ9cR48+6WdqYBzKHq2V
         bmgw==
X-Gm-Message-State: AOJu0Yz/vM7e44REN1XfgxH8Ym0FA3qv5RAenMl/NkL2LHZuB4ulVVDq
	HxAS53hfLgExSkaN9c44/kk=
X-Google-Smtp-Source: AGHT+IGZHifqxyac6FpyylqwcZVy2fMmFBFiU9TY4T5h0BVUiNqz8GDECwupcB5WjfentWWxxLxorw==
X-Received: by 2002:a05:6a20:442a:b0:18b:37b4:cb6b with SMTP id ce42-20020a056a20442a00b0018b37b4cb6bmr43187pzb.27.1701824223851;
        Tue, 05 Dec 2023 16:57:03 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a801:efb7:8c5b:a158:7e49:e10])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001d06b63bb98sm7291478pls.71.2023.12.05.16.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 16:57:03 -0800 (PST)
From: leobras.c@gmail.com
X-Google-Original-From: leobras@redhat.com
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu,
	parri.andrea@gmail.com,
	andrzej.hajda@intel.com,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
Date: Tue,  5 Dec 2023 21:56:44 -0300
Message-ID: <ZW_GzKUoqO4fD4Je@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com>
References: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9> <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_165707_416998_B3B62ADA 
X-CRM114-Status: GOOD (  44.07  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Leonardo Bras <leobras@redhat.com>

On Wed, Aug 30, 2023 at 06:59:46PM -0300, Leonardo Br=E1s wrote:
> On Thu, 2023-08-10 at 09:23 -0700, Palmer Dabbelt wrote:
> > On Thu, 10 Aug 2023 09:04:04 PDT (-0700), leobras@redhat.com wrote:
> > > On Thu, 2023-08-10 at 08:51 +0200, Arnd Bergmann wrote:
> > > > On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
> > > > > xchg for variables of size 1-byte and 2-bytes is not yet availabl=
e for
> > > > > riscv, even though its present in other architectures such as arm=
64 and
> > > > > x86. This could lead to not being able to implement some locking =
mechanisms
> > > > > or requiring some rework to make it work properly.
> > > > > =

> > > > > Implement 1-byte and 2-bytes xchg in order to achieve parity with=
 other
> > > > > architectures.
> > > > > =

> > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > =

> > > =

> > > Hello Arnd Bergmann, thanks for reviewing!
> > > =

> > > > Parity with other architectures by itself is not a reason to do thi=
s,
> > > > in particular the other architectures you listed have the instructi=
ons
> > > > in hardware while riscv does not.
> > > =

> > > Sure, I understand RISC-V don't have native support for xchg on varia=
bles of
> > > size < 4B. My argument is that it's nice to have even an emulated ver=
sion for
> > > this in case any future mechanism wants to use it.
> > > =

> > > Not having it may mean we won't be able to enable given mechanism in =
RISC-V. =

> > =

> > IIUC the ask is to have a user within the kernel for these functions.  =

> > That's the general thing to do, and last time this came up there was no =

> > in-kernel use of it -- the qspinlock stuff would, but we haven't enable=
d =

> > it yet because we're worried about the performance/fairness stuff that =

> > other ports have seen and nobody's got concrete benchmarks yet (though =

> > there's another patch set out that I haven't had time to look through, =

> > so that may have changed).
> > =

> > So if something uses these I'm happy to go look closer.
> =

> IIUC patches 4 & 5 will be used by qspinlock, which may not be done yet, =
so we
> don't have an use for them for the time being.
> =

> Otherwise, any comments on patches 1, 2 & 3?

ping

> =

> > =

> > > > Emulating the small xchg() through cmpxchg() is particularly tricky
> > > > since it's easy to run into a case where this does not guarantee
> > > > forward progress.
> > > > =

> > > =

> > > Didn't get this part:
> > > By "emulating small xchg() through cmpxchg()", did you mean like emul=
ating an
> > > xchg (usually 1 instruction) with lr & sc (same used in cmpxchg) ?
> > > =

> > > If so, yeah, it's a fair point: in some extreme case we could have mu=
ltiple
> > > threads accessing given cacheline and have sc always failing. On the =
other hand,
> > > there are 2 arguments on that:
> > > =

> > > 1 - Other architectures, (such as powerpc, arm and arm64 without LSE =
atomics)
> > > also seem to rely in this mechanism for every xchg size. Another arch=
s like csky
> > > and loongarch use asm that look like mine to handle size < 4B xchg. =

> > >     =

> > > =

> > > >  This is also something that almost no architecture
> > > > specific code relies on (generic qspinlock being a notable exceptio=
n).
> > > > =

> > > =

> > > 2 - As you mentioned, there should be very little code that will actu=
ally make
> > > use of xchg for vars < 4B, so it should be safe to assume its fine to=
 not
> > > guarantee forward progress for those rare usages (like some of above =
mentioned
> > > archs).
> > > =

> > > > I would recommend just dropping this patch from the series, at least
> > > > until there is a need for it.
> > > =

> > > While I agree this is a valid point, I believe its more interesting t=
o have it
> > > implemented if any future mechanism wants to make use of this. =

> > > =

> > > =

> > > Thanks!
> > > Leo
> > =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
