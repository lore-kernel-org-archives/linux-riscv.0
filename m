Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AB8C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9R3jEyT5hJ2PzUkuVvMTWbSH6HuSEQhfuVTBaSFy7hI=; b=jSim3wn06D1xrB
	4ViMcLn00HfMrAPE0yOi1Dw9HCXWcSUHwm2uM4kpRSbIeALK3Ef1ATQ3BjbvMAAib9HXepgTt0CLi
	QvfCMAqKCkg1zwxQPt2z6+SjsaLSRKXr9xSZTCQELYGQ19FxXwzkfiXUWDQSoUd/XSxNLROSxgeAI
	C7lXBIIq6oN9gVqdE/CjCjhD3yM3rQzNF73TFy6Qck/605pwvKSRj022d4IbRPDB/xX+E4H9j3gsJ
	Vzgm9lWoHC8qGgwqBiT4hLAD+pZNCB+i5SfSmczX78Y9z273DWmO/CxQOHCOtEKfX7nb5dUpjimJ/
	kAtOLwz2gGUFAYt+DP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Ob-00000006dGv-2GkL;
	Tue, 11 Mar 2025 18:32:05 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts44S-00000006Zku-3z32
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:11:18 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso8314829a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741716675; x=1742321475; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41PVLFX1AYbFOO8iSJTaDeh8JCGVoEDoLLcodvBXC0M=;
        b=JalM0ky6EXQtnXSSdFqdk8a8Ebks9+vUa+cfbpAPRnXXVShjnCcij6Sb2a+cWzNHvu
         ogQBJEzlfxaAsFwjfxpxFE9KZgD1CCPOUPU7Gk1JXXuxgOdDJFnWWAX2h2zJi6cTMwD0
         6/F1O+nDhb6ZZSLbjPXfWE8Bx5EzITz9g2+dRjY2D7CGV65QmDLVLjYt3G6Vbvtrdv93
         rcfSurilCJZ+tRQBEyNFF2XfoBJjaSngfIsYpAHIASnv9cCPXdKJJM5hKcuE4GOme/LZ
         4Ga4QHnML31j0bokkZ0+whKJlMLixFU6fGGeDVyG6rtrVnoj/5B5Daq1tS+85urd1bgP
         Jc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716675; x=1742321475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41PVLFX1AYbFOO8iSJTaDeh8JCGVoEDoLLcodvBXC0M=;
        b=delMIVVusgpTeCgnW4VqxNDkE2CsZNI9HNWvVVrMuGJhUbSZVqK+S+L9qic/ZZkaBH
         fJTpwSJ3YbRONcdwMxhlC8y6S0f4i46UwhXaHRiDF8dugNskSOKTGWUttR0QAV4Hs0SC
         Mxktzw/VN9MC7XxAoh66KRRpI1mmScIoZawQSpjxwUXyEOGY1pl1zDDNkJiS1k5uJC0i
         YoMkhb3sxB6NGJ8hc0nbT0K13hyi7IgT40A9+L2+09v/xQPdQuvNliV4rVFBxQjaPifW
         HokZrGgHXedH1K2KyJK4CQchaTRZWbBwqWGHdX2z4h5s82NV7B9Ys1GLYXqb1uUnMyuG
         uTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8n3mldk3lm37vjmPH2RYroMLmuUrbfcQpV3vix4U7NVW99mEIjfn7nSjtLkQNqVOJW9gqQcQWUTz0KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKVTzRulWWlHwwXvxN/NEnlCZJ5pDn83tjqeqDanbtbxjTpQMK
	KTtpUw7jqTtLQoeb58MApwdwoJJEerjWM693KO0ZRo8+XnZhDXuU
X-Gm-Gg: ASbGncsXHByZ83FMOMxv2eqO2OLLAtdkGpTZqdL1zgbpFhEDvBR0Z1bNdZv6j9V6JH7
	w4d5l0kYY1D4+/RROpdZpZEpTu6/vatkJAul6qPUxt1UV70Fdwv+V1eZjFvuIYatrF+3GEjSxTQ
	FzKeOgZsb2b5vTz9knD/GJjb8FtppcyUwAe3zKsg+ilbyx1MbxXt6vO7IrazLsFDMsXzmdPd/IB
	jlHZQUv54lwlxWmI852Z068w5kFX/Jb7YmwWdtjpexYHIZW6Tzp/2Nrd9WD6y4qC12A/BBtgqu+
	lBPhx0g7RgIb+QhXzi2RVn3leqMEIEd+RUxsyi4M
X-Google-Smtp-Source: AGHT+IFuf5jV1z/9Zb7FeABCoFloU76Yb/dVd5w+lI7W53ONofj3nILLix1YBAW9+jdvFrRC0/U+iA==
X-Received: by 2002:a17:907:c10:b0:ac2:7cf9:71a1 with SMTP id a640c23a62f3a-ac2b9ea16d2mr676508866b.41.1741716674872;
        Tue, 11 Mar 2025 11:11:14 -0700 (PDT)
Received: from andrea ([31.189.82.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2929390b4sm453700066b.75.2025.03.11.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:11:14 -0700 (PDT)
Date: Tue, 11 Mar 2025 19:11:10 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Andy Chiu <andybnac@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bjorn@rivosinc.com,
	puranjay12@gmail.com, alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
	eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel
 mode
Message-ID: <Z9B8vgdTq1M9r3_k@andrea>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-7-andybnac@gmail.com>
 <87ldtck8k0.fsf@all.your.base.are.belong.to.us>
 <Z9AwF5hwF0ES9Grl@andrea>
 <87ldtbwrdb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldtbwrdb.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111116_994675_2B56F3F0 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, Mar 11, 2025 at 03:53:36PM +0100, Bj=F6rn T=F6pel wrote:
> Andrea Parri <parri.andrea@gmail.com> writes:
> =

> >> FWIW, the for S-IMSIC the write is already writel(), so we'll have the
> >> text patching and IPI ordered. Regardless, there's more than one flavor
> >> of IPI on RISC-V!
> >
> > AFAIU, this writel() is intended to order the insertion (and the initia=
lization)
> > of the CSD object before the MMIO writes; so, the "right fix" seems to =
turn the
> > "other flavors" into using a writel() or providing a similar ordering g=
uarantee.
> =

> Yes, that's probably the right approach, or maybe follow-up!
> =

> > As a bonus, such change should address/fix all current and future occur=
rences of
> > the message-passing scenario in question (the patch addressed the occur=
rence in
> > flush_icache_all(), but there appears to be a similar one in flush_icac=
he_mm()).
> =

> Indeed. I wonder if the SBI remote fence.i needs it?

Ah!  So I am not alone: AFAICT, that remains a matter of discussions with y=
our SEE
team/developers.  :-|

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
