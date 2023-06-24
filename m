Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D2EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhPc9DLBbKImBrXASqizf/3PzxrgDxjXXbp6mfalXgM=; b=WZ2kZHoNYzk8aW
	fjlg8jwImsr6FQNTWSljQvW64SAmqEa3Nak/2CiYKlVeyOEl6mb9p92ZllRkFusOe4dfp6ORcnf4a
	THO62tdBlHWxxW+yCdTShx1y8O80T2zo9D/0qdTMWRspH9UgHXAwYNvaKRh1rrDsko4cZ2UjCKJLm
	9xzzKPQdnU12FVFjx5S9Au2p3PXdfFRmjwnuiw0O9OfMChmJyBhvsTJMvDKt6DRFbeHEgDkvwOhn/
	m5Us8XK+K3NO+1K9DSxx4kzjc37LRxc3+ILiKM95iJ2kRxcjQkAxYI8zGfueFxWW+hon8E5xtd6jd
	+Yvz3y1KpcBrr0a3ffQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD0zd-005rrU-1O;
	Sat, 24 Jun 2023 10:59:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD0zZ-005rqz-2r
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 10:59:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98df69cacd1so21739966b.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687604383; x=1690196383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pnhb5E9gx1rgoSmnUX9zo1/G7QfayE+d3qTYxYfxz3k=;
        b=O6xneCpCK/MO2lYg5yqQGCYU6udA+4Z/lEP/qpi0HL5arSlctbESRE35qh35JCxBVx
         6gKl/+yDm2ipvTlVx4LlOz1uufewOVAzRJYUFqHEj4HgYxpk15mzSt1W0t9PwhkT5tfZ
         U21wQaR/0JzawOdoeFCnx/REdIz33qh+u739EMwDsxd47cs+ePxxYBeOcyNjanI/pemV
         CUItyCuytexALKokrF/zwRcKFbO3p8p6+VZBnvDMpF9UN5vEjmNVjB/BKXosl/jrtE0c
         KMZxPx1DLzeogr1D6isrhiaM2ZS2KB4Q6e+1roTaRu45QQ2O6DNJxMNZafpbKc17cnDL
         Zukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687604383; x=1690196383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pnhb5E9gx1rgoSmnUX9zo1/G7QfayE+d3qTYxYfxz3k=;
        b=RG/r3W02gya5S6XzBI+yYbJKwZzmnXsQdL0JnS3zXrCsgpQ/ViIkgPvF83AHHRk+to
         61uKViePQP92J7IFP8c3FD/+HhMtdKjoQdU2oLMxXQtfwCrE8A3xWWH4fRvp+RGppn2e
         9mxqxzeAg/iKMSiI8q8bWVFMGymUdJNvV1cLpQDITimSgfk1aY1heaIkpOFsK2rSDyHn
         r0mXBOG/xvp4fCtf9XYGXop3qQU9hCbGkrhkWYMUCD86zePIZ5MjKa/bT5x5YeWICIwl
         Zft5Ho8JV1HOiN6Z7hc9NgdRBYoliqAVs4NMbiE+OortRX6cJjNKL3eGw7NKA7ltKLU1
         J7CA==
X-Gm-Message-State: AC+VfDwhvFay7in5PNi+TZuwsPcVPYxvNIFqyDWZRC5tW5gNgeVShs9l
	i5VNZcUXi/RMemkHrI4iP72nPA==
X-Google-Smtp-Source: ACHHUZ7j/wQdbOXoAly2yzV0RB2hgI+s4QGOQglWcWAJ27nlZv0Uo0/jXkwDaDVOT/+CBOVHhtohFA==
X-Received: by 2002:a17:907:9305:b0:96f:8666:5fc4 with SMTP id bu5-20020a170907930500b0096f86665fc4mr21756260ejc.50.1687604382670;
        Sat, 24 Jun 2023 03:59:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id jz3-20020a170906bb0300b009829d2e892csm775425ejb.15.2023.06.24.03.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 03:59:42 -0700 (PDT)
Date: Sat, 24 Jun 2023 12:59:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, paul.walmsley@sifive.com, 
	linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org, 
	christoph.muellner@vrull.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
Message-ID: <20230624-844c5c4701e8acf9bcf150aa@orel>
References: <20230622231305.631331-1-heiko@sntech.de>
 <20230622231305.631331-4-heiko@sntech.de>
 <20230623-excluding-sprint-aea9cca0cb02@wendy>
 <1908808.taCxCBeP46@diego>
 <0904a831-82c5-47a0-be55-f1a59d0115c2@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0904a831-82c5-47a0-be55-f1a59d0115c2@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_035945_950979_A9DDBA2A 
X-CRM114-Status: GOOD (  17.46  )
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

On Sat, Jun 24, 2023 at 01:18:26AM -0400, Stefan O'Rear wrote:
> On Fri, Jun 23, 2023, at 6:40 AM, Heiko St=FCbner wrote:
...
> >> > +
> >> > +/*
> >> > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses a=
n older
> >> > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction =
for
> >> > + * vsetvli	t4, x0, e8, m8, d1
> >> > + */
> >> > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> >> > +
> >> > +/*
> >> > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the =
same
> >> > + * encoding as the standard vse8.v and vle8.v, compilers seem to op=
timize
> >> > + * the call resulting in a different encoding and then using a valu=
e for
> >> > + * the "mop" field that is not part of vector-0.7.1
> >> > + * So encode specific variants for vstate_save and _restore.
> >> > + */
> >> > +#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
> >> > +#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
> >> > +#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
> >> > +#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
> >> > +#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
> >> > +#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
> >> > +#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
> >> > +#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
> =

> .insn isn't supported by the kernel's minimum binutils version, but it _i=
s_
> supported by the oldest version of binutils that can assemble rvv 1.0
> instructions.  OP_V requires 2.39 so I use a literal 0x57 instead.
> =

> very untested, and I leave it to your judgement whether it actually impro=
ves
> readability:
> =

> #define THEAD_VSETVLI_T4X0E8M8D1  ".insn i 0x57, 7, t4, x0, 3\n\t"
> #define THEAD_VSB_V_V0T0		".insn r STORE_FP, 0, 1, x0,  t0, x0\n\t"
> #define THEAD_VSB_V_V8T0		".insn r STORE_FP, 0, 1, x8,  t0, x0\n\t"
> #define THEAD_VSB_V_V16T0		".insn r STORE_FP, 0, 1, x16, t0, x0\n\t"
> #define THEAD_VSB_V_V24T0		".insn r STORE_FP, 0, 1, x24, t0, x0\n\t"
> #define THEAD_VSB_V_V0T0		".insn r LOAD_FP,  0, 9, x0,  t0, x0\n\t"
> #define THEAD_VSB_V_V8T0		".insn r LOAD_FP,  0, 9, x8,  t0, x0\n\t"
> #define THEAD_VSB_V_V16T0		".insn r LOAD_FP,  0, 9, x16, t0, x0\n\t"
> #define THEAD_VSB_V_V24T0		".insn r LOAD_FP,  0, 9, x24, t0, x0\n\t"
>

We have the INSN_R() macro in arch/riscv/include/asm/insn-def.h for stuff
like this.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
