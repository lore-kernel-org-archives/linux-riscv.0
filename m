Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE60C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 21:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MXJ6w+obxziV/+CIY6OrpE6JrCaGxvL0f1ZJcigQPc=; b=eewzQCM7wXala8
	Hac0JyQQbFS9kijO43SZfUc5e++Rfm5VTzPTec5385QUh6eZLe/ra1TIbDJGUTuteGzgJ1PGfsgJF
	3FNbFtjNlijB/MbRfw4xcxJmacYV/REscdxfaHM4+UB2HBJ8mQo4UKGRuv/MZVu7TRdXyDMQiULvD
	tdp/ps0uhIff55BVRV+6qnN4CC94K8jbVQZMpYM0THRklYT0gKkzcp7ZCAgsrRXTda6UR9nv4tXdp
	zJDJd4wm29U9sA/4lPom+3MihtO4JyQZrDa77Q4q5fHDBbRZa0mucs2dxk5eqnVfOtyS1NHNoH6LL
	tEtgmU+4MHsgHos4WyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhCi-0000000Fiwh-0jc2;
	Fri, 07 Jun 2024 21:32:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhCe-0000000Fiv0-3mgx
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 21:32:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f6342c5fa8so24122335ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 14:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717795972; x=1718400772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=en5rhVQeS4jMQZ7MYT9HPVU5AsizJ4lSBaI/jISWz7g=;
        b=Oct5k/tBQQT7Ns0ZKQnfiBhi41f/kdnDy62znTS8fCyo3VpYfdQieBMs2R4qtpii0m
         mXouL2TSFt4P8IS3oWhGLfIN0SjeahuEtL2B7mDZPfAZKAVyRJXGJRCJwO8QNBEjefll
         gWipqiqhb6RGbKizh5bgutiT9WLy/je8mmumn29NaYxeH08jO9Vj3JhRbzHTBPxYE/oy
         alrOZW53/jwI7n7VrItRBcxGezGwlTt7zO3uuZalbNLfQ+/RlwgYCPV+nhyyFTgoGv+v
         cCqcSf8aFML1SDAetmzUBFaXaU3Jaiq6pRGvns4Id7jNKa0ytUVXm4iaxV3tzUmkolp+
         TLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717795972; x=1718400772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en5rhVQeS4jMQZ7MYT9HPVU5AsizJ4lSBaI/jISWz7g=;
        b=REyWsKjuh55I0pmMAvA+YrsjYOLiWlnUCVS2AmA+wTHxVktA5DPY9HrZz45YShWhDt
         udw6iXDF92Gb82nOMB+8QGJHYgqJpztZBPnqGZYQoO1ut6IkjPzG4K5uazFGPLEy6eg+
         5D0MeLDRpjhjiHiOHacTRKur3qnU82GlH/2gqwuYhuAFRO8hrXC5+HSTnK6pJK7fpra0
         MGOvAmhEnaNP2HKEr1NsFjfatakNxcWXFv3DptbYVYLCK3BgWAsaprXVhjXOoi3NTrFB
         cOsRYLUuOJkbrpW9N1ru2eWbsD6E1Glm9O2LMjuBrXklIUSlqfqgjmP3Wp5DuqpnChhl
         EDOA==
X-Forwarded-Encrypted: i=1; AJvYcCVJFTpXwMIDuUlvVG1Nr6nxG4JMgpZQ3S4yJmkxbCS6VtyWtge2Mxui6k+sA0qFMWxqLJ0BHtRQ7xIBg3fLXRMA/o0W4GNhqmoyoUHB5wF+
X-Gm-Message-State: AOJu0YwDeK8pFm19VWS2TSDc/XUzKVW5zg7XC1AamEsatKCQKKwGNmTJ
	5+0NxUXC+t5FJC7NqT+ufuTPpCySZEq+TUqNJjIimtTLqqoawh9JYqquEHinfGc=
X-Google-Smtp-Source: AGHT+IEejcYKl9fBro2kSxxk5hY4d+88L6bC3+D1SvPJuq0Hk5YpcIl8tPK8uKbkJgY2r7rnpSoToA==
X-Received: by 2002:a17:903:244b:b0:1f4:8d11:723 with SMTP id d9443c01a7336-1f6d039d26fmr43937765ad.51.1717795971902;
        Fri, 07 Jun 2024 14:32:51 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e78585desm10762055ad.133.2024.06.07.14.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 14:32:51 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:32:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RISC-V: Detect unaligned vector accesses supported.
Message-ID: <ZmN8gER4RnyoyQT4@ghost>
References: <20240606183215.416829-1-jesse@rivosinc.com>
 <20240606183215.416829-2-jesse@rivosinc.com>
 <ZmIqM3Cuui0HAwN1@ghost>
 <ZmJCq7bsglq7olSB@ghost>
 <a16ccf51-4b06-4c6d-94a1-cb43dc3f2945@rivosinc.com>
 <ZmN2U6BDAYRXxHEi@ghost>
 <20240607-wildfowl-baggage-54f622e18c4a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607-wildfowl-baggage-54f622e18c4a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_143252_969397_AE745FFA 
X-CRM114-Status: GOOD (  26.60  )
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

On Fri, Jun 07, 2024 at 10:21:19PM +0100, Conor Dooley wrote:
> On Fri, Jun 07, 2024 at 02:06:27PM -0700, Charlie Jenkins wrote:
> > On Fri, Jun 07, 2024 at 03:53:23PM -0400, Jesse Taube wrote:
> > > On 6/6/24 19:13, Charlie Jenkins wrote:
> > > > On Thu, Jun 06, 2024 at 02:29:23PM -0700, Charlie Jenkins wrote:
> > > > > On Thu, Jun 06, 2024 at 02:32:14PM -0400, Jesse Taube wrote:
> 
> > > > > Please use the exising UNKNOWN terminology instead of renaming to
> > > > > SUPPORTED. Any option that is not UNSUPPORTED implies that unaligned
> > > > > accesses are supported.
> > > 
> > > Conor didnt like using UNKNOWN a proxy for "SUPPORTED"
> 
> I did say this, but in the context of wanting you to actually add the
> performance probing (and potentially the other infrastructure that
> Charlie added for scalar).
> 
> > > Having SUPPORTED is better then assuing the speed to be slow.
> > 
> > The HWPROBE key is about misaligned access performance. UNKNOWN means
> > that the performance is unknown.
> 
> Right. I also don't think that assuming "slow" is even problematic -
> seemingly all extant hardware doesn't even support misaligned access.
> But really, just whack in the probing, it shouldn't be too bad, right?
>

Yeah that's a good point, slow is a reasonable default.

> > The scalar and vector names need to
> > match up.
> 
> That's definitely not the case. A different hwprobe key is allowed to
> behave differently, but...

It of course can behave differently in purely technical sense, I said
"need" because it would not be a very intuitive interface to have a
different name for vector and scalar versions of the same thing.

> 
> > UNKNOWN was already merged and is supported by linux so if you
> > want to use SUPPORTED here then you need to add a scalar SUPPORTED key
> > that is an alias of the UNKNOWN key.
> 
> ...this suggestion of a scalar change I disagree with anyway, so it's
> moot. Unknown should be a state that we only have internally when we
> actually do not know, and not something that userspace should ever see,
> unless there's a bug in the probing code IMO. Unknown gives userspace no
> actionable information anyways.
> 

I agree, returning slow is probably always be more useful than unknown.

- Charlie

> > I would rather keep UNKNOWN as it
> > is, but that's up to you.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
