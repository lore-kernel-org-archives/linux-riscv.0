Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CBBC369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/cZn7B38nhui420BKdGlBireCfJjrkXZbASaXcnpYU=; b=JfZkj69vX5bYlo
	1qsMFWUN5FYCUC/FSJqU0z9xV0xGGxFeP1OAC/eUb7zvz1m8GwAnLWygnSBEg/rv4bvJ0LW8nOXnG
	pD6ChIdP1axk1J+AnOdXN27bZeWOLkO0Tklpl2ois9iiH4sTZEJX608X0wzE0diAsR+bmG6FqWIGR
	ZCAh5vTg5rT4kELJfCkWnJcIr/ZOBPd+0gKYc63uO3rADLgM+wGe7KcyjeFYR9T4O2xKg46UEef2d
	mcF9E1lBy/x8KyF8pu7D9Qit4zcfp8+oBsXhm5MQkTphPQWqyYLC/9Shv+SmqRfZbqG7+w9CyWxbU
	bHYUD39QQVgoaGK5qhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gy1-000000094MM-1Ohq;
	Tue, 29 Apr 2025 09:09:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gug-000000093qw-2lvF
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 09:06:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c0dfba946so4168501f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745917560; x=1746522360; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KatqGhsrZH+ZioIyyPM0GHZkF6RidX+RSSACu/Ebkcw=;
        b=dITa4Mah38rwpnWjCqlK7+AavK/KCFIQJgSoy16R6TWuQHb1Mjj+KtQVB+X3KYRRy1
         hupeu2Z8Qmi52kCsYkSJ9gytnNCTbweGoxCKEXar9IT33HTAOngGoYNaRX2bAVIGKQGN
         gKTgPraKos1Go8bxxwDigGnBh9dN38WmrCvcSuXLzjn1oDWkp9CzfoMQxPESxumb1tH5
         C2u/XBzbXaDUB6wBx41J3QdSN0vcdbMK5fDbMRJaDCl3k+37HlUMkAs/gzXJ3z158F9h
         UwwYz6LPhv9GNShx+yC8mqDByOx2ARu2UQa8FFfiTQHCRDOgJJoURR8qad2X9Mmx6hcG
         bSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917560; x=1746522360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KatqGhsrZH+ZioIyyPM0GHZkF6RidX+RSSACu/Ebkcw=;
        b=WGmwHVZWCSEMuAcVcExIwVllqPw/dpIpJRt0Ech2UWBTkQT/9D2WuZKSL1uCIOvZ6z
         DMn2v4TyzbOofSUoB7JOZEkJQeAWlU+ajq/MNEN/6qpmeBt0buswrf3Zr6MXIi8PIy63
         OOutBO2QP0NU3RZ1PywYxPDc+IR0E8unABqjsupdMpo0VJgxDnl610ti6iqDefZGXU9B
         Sj08FrCgkTKT27/tAHELo2+zv4lMKTeTKPTV8OZyigtjNPMmbL7QMfh8utlPQEX2Z2u3
         eV60j21z//AhWbWF0LsiJk2BqnAv6FchjwyXwA05y0nuJT6r5DctyOVxPS2BduMB3iGI
         ZN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIt2mpNdhxbmBj/8r5xo3839UjibkLc45arJgoC0z24MMd/9gMYd62gd+2MZ1S0ClekzgVw0gp1/lwyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZIvVIMbfiIDqFgqKGOBYYZCXJl2uszqL8xgx6vVSAiH9+BxOb
	10sqai1S5PjQ0ogItVoI2gq/173+E6j23Qx4d2N1SG7214BIAguxmMdgXMxH2mg=
X-Gm-Gg: ASbGnctaXyB6Y5hxVShT6T8zGxFARBpvzv27wOmzOT/P5chJfUn5dHsALQCIQUYR4Qw
	+Lglw2zPLbnH8BpDtd1VoXGHKPiu53O56fGodQSWRE+udYcTzUmjN2ju1zK++S4RfP7gm0pxDax
	A/uCCPFn8IlKQOFUlUmIQe33mgPAOyxuwMtvKdNhTzTGf7vubL4mcCDKqpy6Nm6WreeYDcEkl3e
	Rj0572g68VVn8gc3LZrLmssTFqBsfumPYOXj45MYh40/SuFeiOWXp3Jvm7ViPHXyHD8pS+lHXOW
	lnBccizlnWiS1ffPQc8YbL1gRghk
X-Google-Smtp-Source: AGHT+IGkl5qjiabpogb2jkKx++DcNwNz6kC3SVaUoXxULD2fuawYRLha0X61n1NZ+hz8YxEyViubjg==
X-Received: by 2002:a5d:6903:0:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-3a07ab9be44mr6194393f8f.42.1745917560430;
        Tue, 29 Apr 2025 02:06:00 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da02sm13462185f8f.93.2025.04.29.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:06:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:05:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception
 handling
Message-ID: <20250429-683f10a791d9ec41b060ec4a@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
 <20250425-dc44cb547ab5e2f994c94e80@orel>
 <3b05d1a0-c873-4e61-b98c-b725d0dbb350@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b05d1a0-c873-4e61-b98c-b725d0dbb350@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_020602_695037_E0472C97 
X-CRM114-Status: GOOD (  28.85  )
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

On Mon, Apr 28, 2025 at 03:47:47PM -0700, Atish Patra wrote:
> =

> On 4/25/25 6:50 AM, Andrew Jones wrote:
> > On Mon, Mar 24, 2025 at 05:40:29PM -0700, Atish Patra wrote:
> > > Save stval during exception handling so that it can be decoded to
> > > figure out the details of exception type.
> > > =

> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >   tools/testing/selftests/kvm/include/riscv/processor.h | 1 +
> > >   tools/testing/selftests/kvm/lib/riscv/handlers.S      | 2 ++
> > >   2 files changed, 3 insertions(+)
> > > =

> > > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/=
tools/testing/selftests/kvm/include/riscv/processor.h
> > > index 5f389166338c..f4a7d64fbe9a 100644
> > > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > > @@ -95,6 +95,7 @@ struct ex_regs {
> > >   	unsigned long epc;
> > >   	unsigned long status;
> > >   	unsigned long cause;
> > > +	unsigned long stval;
> > >   };
> > >   #define NR_VECTORS  2
> > > diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools=
/testing/selftests/kvm/lib/riscv/handlers.S
> > > index aa0abd3f35bb..2884c1e8939b 100644
> > > --- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
> > > +++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> > > @@ -45,9 +45,11 @@
> > >   	csrr  s0, CSR_SEPC
> > >   	csrr  s1, CSR_SSTATUS
> > >   	csrr  s2, CSR_SCAUSE
> > > +	csrr  s3, CSR_STVAL
> > >   	sd    s0, 248(sp)
> > >   	sd    s1, 256(sp)
> > >   	sd    s2, 264(sp)
> > > +	sd    s3, 272(sp)
> > We can't add stval without also changing how much stack we allocate at =
the
> > top of this macro, but since we need to keep sp 16-byte aligned in order
> > to call C code (route_exception()) we'll need to decrement -8*36, not
> =

> Yes. Thanks for catching that.
> =

> > -8*35. Or, we could just switch struct ex_regs to be the kernel's struct
> > pt_regs which has 36 unsigned longs. The 'badaddr' member is for stval =
and
> > the additional long is orig_a0.
> =

> I think switching to pt_regs is better in terms of maintainability in the
> future.
> I will do that.
> =

> > >   .endm
> > >   .macro restore_context
> > I guess we should restore stval too.
> =

> Do we ?=A0 stval is written by hardware and doesn't contain any state of =
the
> interrupted program.
> Once, the trap handler processes the trap using stval information, there =
is
> no need to restore it.

True. It just felt unbalanced.

Thanks,
drew

> =

> Am I missing something ?
> =

> > Thanks,
> > drew
> > =

> > > -- =

> > > 2.43.0
> > > =

> > > =

> > > -- =

> > > kvm-riscv mailing list
> > > kvm-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
