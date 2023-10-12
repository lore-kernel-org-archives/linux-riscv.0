Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56402CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rN3xFu7Xj69Fzk5sKAHV7j3Vt7IoVqHN58tpt7/1mAg=; b=EirmiHJbF3Bngt
	+Oc4t9Xqw6CGu7NK7u/Mmc359cNWv9zp43O3gMbv5XmZzQR5w1cJpmuP/KUQeGuiLWCA6A86P1FMr
	pIT0fYj/yfmZwEZhUQN1PJSx1cRksfp2GWJB5jJhh7IZ5w7YG+VETpeOJyMwfUqzulNzOP+2hXL1v
	cDK7isQsaLQmUdUgQo7X86M7WJtgtaTKtzA0UWD8ve9Hc6232K0Io2a9iT2nQErOSIYTsCRTyaJH1
	MtR4aAIjKpsDgXchruUuZOzhuzzsEYZO2+T23J2BOz5+9Jv9VpS0otmpoGz4hoej8sfEicH2+AZVq
	n4uoA7+xHmPlQsUDm7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqybc-001QL7-2R;
	Thu, 12 Oct 2023 16:32:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqybZ-001QJJ-21
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:32:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-406618d0991so12131345e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697128325; x=1697733125; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zEFAq/CRrluRRtx0eqGeEhiSqDINW9W8p+WysscBUH0=;
        b=nP4pOBWQBny66rOZh6da8PLeKgMhTdxwXHjXRrvCGd/zA8dtXYhU9HtdjfzHC07xHi
         QRxnVnluOAqRKP6q4c8xi0w2R3P3zBejjL2njuo3TK1XFzbuMBi9OHo7ZyY7L5V7WhG1
         NEn/4Sj1405whokBvjrr/n0296gO/rWHYGGNFerdrFZQGwXX0Xr12cubOeSiZmC9qVSr
         J8VcDb43zb26JDugFms8TqPzUCWhdwBbvWZ1b8PjLy1dBDLgsxoO9Vm664h8KjmJc6yR
         z+QMDddsO1lCdlkJR+VyVLB76u23fTURHe/S5BRdivEpy9S40iZygl2jWAWROQrjP4YN
         MBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128325; x=1697733125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEFAq/CRrluRRtx0eqGeEhiSqDINW9W8p+WysscBUH0=;
        b=YwKSslAGgHjvN8JhOHx5/E1RaqQDeUykYbqzw6ZGzDzVFJ8RXO/g4sRFuQFBUWvcEp
         gxUeOpCwNZmyUlDHwrXA90fp8tXYEnKzzCaHzhg9Vv/ump2yHABD0ibkPqR1vOKzRx4U
         +rPACjt8MiHafrFFj+lemC1RtQziWmGP5s8saUJyH3U5R0av8aEdE5pqhiUSArFq7ecW
         9sj09K5R27B738SkDl3NcyCcQUXRU8yqzCkM+ZPnQVivb/eesFPI3X9YLMgOCbfOJGg7
         q4NlVhAheujkvIccXIHD/Loabxd0aReG6/DT9bOPDIwCpRITmFsAGED9HBeJ8K5t52Zl
         7qVg==
X-Gm-Message-State: AOJu0Yx4gx3spoO/FKH8aPkCgGRUfkVbKVbxQgGWZFubF+hQxRDxYFAm
	2CfMFSx4rQlNLaCvmoaymOrhT6RUx+iZBGKK0uk=
X-Google-Smtp-Source: AGHT+IEMnXKlbQXLsUFxh8NA3bzTb4Kdxrf5jq7K3WHmfryz76lj4mVKcCIgczcHf9l0kFfkjrarVg==
X-Received: by 2002:a05:600c:3781:b0:405:1bfb:ff14 with SMTP id o1-20020a05600c378100b004051bfbff14mr20483223wmr.9.1697128325100;
        Thu, 12 Oct 2023 09:32:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b0040770ec2c19sm30176wms.10.2023.10.12.09.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:32:04 -0700 (PDT)
Date: Thu, 12 Oct 2023 18:32:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension reporting
Message-ID: <20231012-8d049a0366f3333ff4a3223b@orel>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-2-cleger@rivosinc.com>
 <20231012-matriarch-lunar-819c1d2d7996@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-matriarch-lunar-819c1d2d7996@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_093209_668980_1F472230 
X-CRM114-Status: GOOD (  23.17  )
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

On Thu, Oct 12, 2023 at 02:53:43PM +0100, Conor Dooley wrote:
> Drew,
> =

> On Wed, Oct 11, 2023 at 01:14:26PM +0200, Cl=E9ment L=E9ger wrote:
> > Factorize ISA extension reporting by using a macro rather than
> > copy/pasting extension names. This will allow adding new extensions more
> > easily.
> > =

> > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > ---
> >  arch/riscv/kernel/sys_riscv.c | 26 ++++++++++++--------------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> > =

> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_risc=
v.c
> > index 473159b5f303..5ce593ce07a4 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -145,20 +145,18 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
> >  	for_each_cpu(cpu, cpus) {
> =

> We were gonna add a comment here about when it is and is not safe to use
> riscv_isa_extension_available() IIRC. Did that ever end up in a patch?

Yup, it's in [1]. But that series may be hung up on spec stuff, so maybe
it'd be better for Cl=E9ment to integrate it. And, it appears we definitely
need this macro, because it has now been suggested by three different
people :-) (I later saw Samuel was first[2], but I hadn't seen his before
submitting mine, otherwise I would have given him the credit.)

[1] https://lore.kernel.org/all/20230918131518.56803-11-ajones@ventanamicro=
.com/
[2] https://lore.kernel.org/all/20230712084134.1648008-4-sameo@rivosinc.com/

Thanks,
drew

> =

> >  		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> >  =

> > -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> > -			pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> > -		else
> > -			missing |=3D RISCV_HWPROBE_EXT_ZBA;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> > -			pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> > -		else
> > -			missing |=3D RISCV_HWPROBE_EXT_ZBB;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> > -			pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> > -		else
> > -			missing |=3D RISCV_HWPROBE_EXT_ZBS;
> > +#define CHECK_ISA_EXT(__ext)							\
> > +		do {								\
> > +			if (riscv_isa_extension_available(isainfo->isa, __ext))	\
> > +				pair->value |=3D RISCV_HWPROBE_EXT_##__ext;	\
> > +			else							\
> > +				missing |=3D RISCV_HWPROBE_EXT_##__ext;		\
> > +		} while (false)							\
> > +
> > +		CHECK_ISA_EXT(ZBA);
> > +		CHECK_ISA_EXT(ZBB);
> > +		CHECK_ISA_EXT(ZBS);
> > +#undef CHECK_ISA_EXT
> >  	}
> >  =

> >  	/* Now turn off reporting features if any CPU is missing it. */
> > -- =

> > 2.42.0
> > =




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
