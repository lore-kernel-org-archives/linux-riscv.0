Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44538CAC5A5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 03:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uya9l7L2e5v1vNcOWBeYVtvkGVJEgN1o1gnXnxgc+JI=; b=Vfg0qSpKdttfgifECyjGXK1dUp
	zZ7hPYfO+wEm11WoDASbKfVh6tP6ix0tvpH477i4mmwVcaMh0XYcaN7Ys9ywJfix0kZ8QSnuZCEt+
	3wzJ23pLr8o1ZZHp1lRUDFlWtYkFoxVQpubyqYIP3UqQ0GPJQy48S1tJpal1s5QuIFQ0b1nccxI4B
	totwN5LL+/BITR+TdDCkMw4P2jgFk1ktsQ/SNhDU0FutIxwE+AiqwSn4EW308V9O2roO54q+ORUSl
	qRyQV6F2tfaadsJ3dPOyzHHSzpogijYfODVQ5Pw1GdJwwGiy3xeF+e7fWt/hPwg/uX/buqv9HyYBV
	mPnkcjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRe3-00000001j0M-3ErO;
	Fri, 19 Sep 2025 03:18:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRe0-00000001izV-2hOj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 03:18:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32e74ae0306so2118432a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 20:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758251917; x=1758856717; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nIkn8MOZTzpunLL/LuuQCeetAKojVprXC6dAWsG/zRA=;
        b=bMEhBZfTtxXaPI9QCP4Ux5zGM5OZeLVoZ5iW2J0ldq0HMWhxM/erbspMdUNVPlsCDY
         DR2xY5XkXzU9djzkL7yMAPVyLjxfdh9F4CerdEMDZ9NKLNPHFF1L49lj3/RGrjbojBIv
         XAmhjarRowIGEsVAZ4R0bmo1MO5DfkqlVmN8WLnX40EDXt5lEIz1/L9DnxpeO95GGkic
         EYsnLBxVJHOGP50r4mxlM8NhLOyfItZ5akFFw46xxwPkJm4j4gTuqG1ecVqgMxeRmUAv
         8qrKL6MBBIy+SnI5sEJcn/NBfv7EtSBXnV4TFoBZQWe4x4BEeMNBJsQXQ8nPP50gMV4F
         uq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758251917; x=1758856717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIkn8MOZTzpunLL/LuuQCeetAKojVprXC6dAWsG/zRA=;
        b=oMcIVi1cW3esM3KpCcGrZAAiH/YUgisi0DUuYSgVQVoqsmCDKeNLsRyr7fvBUiLIEH
         eRbf1vUrOkJe2UcSUO/Z2qnbUhdXckanBjBeSE8ROrW2juMAizsqqXyE8+48iCbS0Vep
         S/wkqGHj8jOj1GBX65gokVEc+GzA3V31BfeA/0Di291rCHlBR5DG33h2GI9j4LL4jbwE
         Y9mxkQRm2AkxeajLVTdJXB+HlTv4Mhl3Bw2ClzDbtQ7WckqXWheRcebS/vdx36xril8q
         swwVj1bqJtx4bX+IWbfWuDAiygALBcyM6DU73zIKjtkxLNs0eKMgOwIO4aLu+mmKDOfC
         xZLw==
X-Forwarded-Encrypted: i=1; AJvYcCWI421mGQGnPROS+btQWMvnJC7QgJCS+WTz7WA929cxxktR3u7WKKMPJ0XTFjY/qKntQSZw1BxD/+1dWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8bOXQoSmT4yHLyhljrdKhUYwlZfpC/LopjUtdV+OouSowJVqN
	GFXIR4q65w+6m38ijnUrIfVzRkf4ktUvpQz9poja5A7gyLrf0V9Ug4zDKGb/Zrtir5oXtaUbuXM
	jY2sOYj9xJq9ffge3wSj9/Qb/zKT5iqY4CYyquc2/lg==
X-Gm-Gg: ASbGnctUY/g3Tn7Gpe4dsAT959KzM30P7NaQAblkK77UfB0UdSQdRHeQbdV12OJk+MA
	EiAsWVJxfnTVpHhtY8EGG+WlexwhJhWQ/GVmx/0o/LOeJ98+/mBOTN9WP8CCfO8apbqt3m7MemG
	y0xJsGtbznk7d43oZ0UTvMxz12lzuN99JqEtG92lneqpjOMe1lfrUUeM4U99V3yjBQd58nSGF5M
	NBDbGhxM82BzMnjqpyoEubC/LRjlzT7tfei5luV3ScH9tuWV0gkMHK5xyVbsQ9FduaGqQ==
X-Google-Smtp-Source: AGHT+IFRWm1rtEbNwR3KFGPErRdd4R3mVRRvu48MrjC5a8f6eCYbxLpbuUvGVcgYOFHQ0WWKCVTztLX1ywhALcobmiU=
X-Received: by 2002:a17:90b:53cc:b0:32b:d8a9:8725 with SMTP id
 98e67ed59e1d1-3305c720a3bmr7519323a91.18.1758251916956; Thu, 18 Sep 2025
 20:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea> <aMoyntAydNMtcl+3@gmail.com> <aMw3504EwlnDOJI0@gmail.com>
In-Reply-To: <aMw3504EwlnDOJI0@gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 11:18:25 +0800
X-Gm-Features: AS18NWC5wNl-OoaIA1pu7i6YWk6e1w0Ks7T1bU_3DmOuyDn3wFuQceusY1o8ZPo
Message-ID: <CAPYmKFt=5=t_nxY4FadG0_vSgAu1tXyO15OCvo5x6QorqM+BAw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
To: Guo Ren <guoren@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	brs@rivosinc.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Content-Type: multipart/mixed; boundary="000000000000efcba9063f1eec9d"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_201844_866802_1203361C 
X-CRM114-Status: GOOD (  32.54  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--000000000000efcba9063f1eec9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guo Ren,

Thanks for your advice.

On Fri, Sep 19, 2025 at 12:48=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Sep 17, 2025 at 12:01:34AM -0400, Guo Ren wrote:
> > On Tue, Sep 02, 2025 at 06:59:15PM +0200, Andrea Parri wrote:
> > > > Xu Lu (4):
> > > >   riscv: add ISA extension parsing for Zalasr
> > > >   dt-bindings: riscv: Add Zalasr ISA extension description
> > > >   riscv: Instroduce Zalasr instructions
> > > >   riscv: Use Zalasr for smp_load_acquire/smp_store_release
> > >
> > > Informally put, our (Linux) memory consistency model specifies that a=
ny
> > > sequence
> > >
> > >   spin_unlock(s);
> > >   spin_lock(t);
> > >
> > > behaves "as it provides at least FENCE.TSO ordering between operation=
s
> > > which precede the UNLOCK+LOCK sequence and operations which follow th=
e
> > > sequence".  Unless I missing something, the patch set in question bre=
aks
> > > such ordering property (on RISC-V): for example, a "release" annotati=
on,
> > > .RL (as in spin_unlock() -> smp_store_release(), after patch #4) pair=
ed
> > > with an "acquire" fence, FENCE R,RW (as could be found in spin_lock()=
 ->
> > > atomic_try_cmpxchg_acquire()) do not provide the specified property.
> > >
> > > I _think some solutions to the issue above include:
> > >
> > >  a) make sure an .RL annotation is always paired with an .AQ annotati=
on
> > >     and viceversa an .AQ annotation is paired with an .RL annotation
> > >     (this approach matches the current arm64 approach/implementation)=
;
> > >
> > >  b) on the opposite direction, always pair FENCE R,RW (or occasionall=
y
> > >     FENCE R,R) with FENCE RW,W (this matches the current approach/the
> > >     current implementation within riscv);
> > >
> > >  c) mix the previous two solutions (resp., annotations and fences), b=
ut
> > >     make sure to "upgrade" any releases to provide (insert) a FENCE.T=
SO.
> > I prefer option c) at first, it has fewer modification and influence.
> Another reason is that store-release-to-load-acquire would give out a
> FENCE rw, rw according to RVWMO PPO 7th rule instead of FENCE.TSO, which
> is stricter than the Linux requirement you've mentioned.

The existing implementation of spin_unlock, when followed by
spin_lock, is equal to 'FENCE rw, rw' for operations before
spin_unlock
 and after spin_lock:

spin_unlock:
    fence rw, w
    sd
spin_lock:
    amocas
    fence r, rw

The store-release semantics in spin_unlock, is used to ensure that
when the other cores can watch the store, they must also watch the
operations before the store, which is a more common case than calling
spin_unlock immediately followed by spin_lock on the same core. And
the existing implementation 'fence rw, w' 'fence r, rw' is stricter
than '.aq' '.rl'. That is why we want to modify it.

I have reimplemented the code and it now looks like the attached text
file. I will send the patch out later.

Best Regards.

Xu Lu

>
> >
> > asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",  \
> > -                       SB_RL(%0, %1) "\t\nnop\t\n",          \
> > +                       SB_RL(%0, %1) "\t\n fence.tso;\t\n",  \
> >                         0, RISCV_ISA_EXT_ZALASR, 1)           \
> >                         : : "r" (v), "r" (p) : "memory");     \
> >
> > I didn't object option a), and I think it could be done in the future.
> > Acquire Zalasr extension step by step.
> >
> > >
> > > (a) would align RISC-V and ARM64 (which is a good thing IMO), though =
it
> > > is probably the most invasive approach among the three approaches abo=
ve
> > > (requiring certain changes to arch/riscv/include/asm/{cmpxchg,atomic}=
.h,
> > > which are already relatively messy due to the various ZABHA plus ZACA=
S
> > > switches).  Overall, I'm not too exited at the idea of reviewing any =
of
> > > those changes, but if the community opts for it, I'll almost definite=
ly
> > > take a closer look with due calm.  ;-)
> > >
> > >   Andrea
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >

--000000000000efcba9063f1eec9d
Content-Type: text/plain; charset="US-ASCII"; name="zalasr.txt"
Content-Disposition: attachment; filename="zalasr.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mfq9rbsu0>
X-Attachment-Id: f_mfq9rbsu0

fC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18CnwgICAgfCAgICBhcmNoX3hj
aGdfcmVsZWFzZSAgICAgICB8ICAgICBhcmNoX2NtcHhjaGdfcmVsZWFzZSAgICAgfCAgICAgX19z
bXBfc3RvcmVfcmVsZWFzZSAgICAgfAp8ICAgIHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLXwKfCAgICB8IHphYmhhICAgICAgfCAhemFiaGEgICAgICAgIHwgemFiaGEremFjYXMgfCAh
KHphYmhhK3phY2FzKSB8IHphbGFzciAgICAgICAgfCAhemFsYXNyICAgICB8CnwgcmwgfC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAp8ICAgIHwgICAgICAgICAgICB8IChmZW5jZSBy
dywgdykgfCAgICAgICAgICAgICB8IChmZW5jZSBydywgdykgIHwgICAgICAgICAgICAgICB8IGZl
bmNlIHJ3LCB3IHwKfCAgICB8IGFtb3N3YXAucmwgfCBsci53ICAgICAgICAgIHwgYW1vY2FzLnJs
ICAgfCBsci53ICAgICAgICAgICB8IHN7YnxofHd8ZH0ucmwgfCBze2J8aHx3fGR9ICB8CnwgICAg
fCAgICAgICAgICAgIHwgc2Mudy5ybCAgICAgICB8ICAgICAgICAgICAgIHwgc2Mudy5ybCAgICAg
ICAgfCAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgfAp8LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLXwKfCAgICB8ICAgIGFyY2hfeGNoZ19hY3F1aXJlICAgICAgIHwgICAg
IGFyY2hfY21weGNoZ19hY3F1aXJlICAgICB8ICAgIF9fc21wX2xvYWRfYWNxdWlyZSAgICAgICB8
CnwgICAgfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAp8ICAgIHwgemFiaGEgICAg
ICB8ICF6YWJoYSAgICAgICAgfCB6YWJoYSt6YWNhcyB8ICEoemFiaGEremFjYXMpIHwgemFsYXNy
ICAgICAgICB8ICF6YWxhc3IgICAgIHwKfCBhcSB8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS18CnwgICAgfCAgICAgICAgICAgIHwgbHIudy5hcSAgICAgICB8ICAgICAgICAgICAgIHwg
bHIudy5hcSAgICAgICAgfCAgICAgICAgICAgICAgIHwgbHtifGh8d3xkfSAgfAp8ICAgIHwgYW1v
c3dhcC5hcSB8IHNjLncgICAgICAgICAgfCBhbW9jYXMuYXEgICB8IHNjLncgICAgICAgICAgIHwg
bHtifGh8d3xkfS5hcSB8IGZlbmNlIHIsIHJ3IHwKfCAgICB8ICAgICAgICAgICAgfCAoZmVuY2Ug
ciwgcncpIHwgICAgICAgICAgICAgfCAoZmVuY2UgciwgcncpICB8ICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICB8CnwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAoKKGZl
bmNlIHJ3LCB3KSwgKGZlbmNlIHIsIHJ3KSBoZXJlIG1lYW5zIHN1Y2ggaW5zdHJ1Y3Rpb25zIHdp
bGwgb25seSBiZSBpbnNlcnRlZCB3aGVuIHphbGFzciBpcyBub3QgaW1wbGVtZW50ZWQu
--000000000000efcba9063f1eec9d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--000000000000efcba9063f1eec9d--

