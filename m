Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2FC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 20:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B19jsQda+Of/G6NBLWk/Eo8OAx4IW7ZLHJH9AkaAQfI=; b=CmDMDLWdY6bWd5
	UBvY5wwF6HPJJqQCLFgpalEGG6meJKbhrVUcC11mEJCOsYk1v+wx0PMUPN2IkOdGXNopX1m22PWyQ
	RRjf5Tvjv7MyDAW9nAk/AUrSOSq6QSUNy+ycdrXsYitMT/DLf20ifL7RzwNejfNklrClePQZ6U4HZ
	ZFPeOzthSZFjTqfSgwFEWzwMbfUN6l5K4Ek1PWcSobHUWr6oz3z38bqbGXGrLaGaGE4uCm0R1NF6x
	2kKC9tOjQtCxOJDWIm2gG1kcfK5/JJWzxWavXVimY/pPODB7R/29CveYV6RoJ5V4veeX75f6spMXu
	J7plta4tAI3n01DXLhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNtX-00000001Gyv-2Iny;
	Fri, 12 Apr 2024 20:53:11 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNtU-00000001GyL-48Yo
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 20:53:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so1272672b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712955188; x=1713559988; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kuI1xDSDY3wZqRxOoGKgeFXQbOBRCo2OPPgj3TfcWU4=;
        b=VpCRZAOekpvX72em/uvVnoBGUda6w3UXTcI/kPkh4SeGgCfDKVncrrV6BK6+PcAQHT
         s4Ndy652ixs3HLwiFGawhqxxAwwM/DcM62E/6rUaGpPw7hHVrVz+OYevIglStF/7m8yD
         mXtNAAtqXXZ5dB8R/nCvsVEYytuqNL0sF42ndGP9pbvdj6n9CM8He7J4ruhUgV6a+PjG
         RKTmLN7t6FDM9g85RzVFWaEwcTpsL4r24HD5GuftFXsc37/6k3x24pycjNsKEQNY9NWc
         Mjxtqu61cGXrzJbPYTdJD+4ASs9/5q3dX9ZGXYJd28VPPUUrcpDVd98YZe40jhxm+VBd
         RIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712955188; x=1713559988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuI1xDSDY3wZqRxOoGKgeFXQbOBRCo2OPPgj3TfcWU4=;
        b=EId9g3CNGEFqwx5nu+hcwSeX+OVjPbefryHCn97HLR2zL9AgM17jwXRaET4BfEpwfz
         qXc9AjbsvoL7YJNYfYHlqph4LARfZj1M03TTTsLpjxW16ZPav3pqnTCuGhM2spGDhzse
         voWR1qX2CkA3EV9k3XjjhfKjzgXHg+qQpBNAk82K6X4FR0INEgVZUR+xEfb8AyOnMlN8
         QgQUyHKTsYJ8XDBCa5tTry0Y5qbKbPxmve+ee5zUxxwqPoABLcJjRZ4RJSrjVwLSbG6/
         nMt7PZBi1V2e+NX3iOlcBIWpLtISvDq+HEzeFrISRlcPvn1zEBZ6UuFV4d6RAoAEoweD
         VStA==
X-Forwarded-Encrypted: i=1; AJvYcCWrLaa1I4x1HfOgOVBBsiVHMHaA+1dZ+rQaxzFjCOurVc2MUiuoZ1mDwVLzH0xx9iaiuStlTy0E2wZvmz6GL9awrNg+rZ/WOG6Q6UGwTrlU
X-Gm-Message-State: AOJu0Yzd2UQZNLqICCgbG3i0s5HhUvWaHBcAdIjvXmprIQBtMi2y0wzh
	+YHoDftu9bD0KsAOdUcppcWDqGAAOJjPZ0FFSAsmSdEWZzKT1FUCNUWKyU+6dQU=
X-Google-Smtp-Source: AGHT+IHrp3HzycZe7Jfb+XseUZGp1zZGIQ3nFRwoibOMYKPLe2QkUbH6yPsYO0522TOlVaFgwYmSxw==
X-Received: by 2002:a05:6a00:1798:b0:6ea:bdbc:6a4 with SMTP id s24-20020a056a00179800b006eabdbc06a4mr4030047pfg.13.1712955187671;
        Fri, 12 Apr 2024 13:53:07 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id j16-20020a62b610000000b006ecceed26bfsm3264351pff.219.2024.04.12.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 13:53:07 -0700 (PDT)
Date: Fri, 12 Apr 2024 13:53:03 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <ZhmfL4Nutu8s4SMF@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
 <20240412-thirty-sacrament-db052c7fe6fe@wendy>
 <Zhl8Y+GzTB/ip7rT@ghost>
 <20240412-displease-sensually-33d91fc3fe63@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-displease-sensually-33d91fc3fe63@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_135309_054019_346F5528 
X-CRM114-Status: GOOD (  26.48  )
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

On Fri, Apr 12, 2024 at 08:00:46PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 11:24:35AM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 12:30:32PM +0100, Conor Dooley wrote:
> > > On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> > > > These definitions didn't fit anywhere nicely, so create a new file to
> > > > house various xtheadvector instruction encodings.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
> > > > new file mode 100644
> > > > index 000000000000..348263ea164c
> > > > --- /dev/null
> > > > +++ b/arch/riscv/include/asm/xtheadvector.h
> > > > @@ -0,0 +1,25 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +
> > > > +/*
> > > > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
> > > > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> > > > + * vsetvli	t4, x0, e8, m8, d1
> > > > + */
> > > > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> > > > +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> > > > +
> > > > +/*
> > > > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> > > > + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> > > > + * the call resulting in a different encoding and then using a value for
> > > > + * the "mop" field that is not part of vector-0.7.1
> > > > + * So encode specific variants for vstate_save and _restore.
> > > 
> > > This wording seems oddly familiar to me, did Heiko not write this?
> > 
> > Yeah, I wasn't sure how to attribute him. He wrote almost all of the
> > lines in this file, but I put it together into this file. What is the
> > standard way of doing that?
> 
> The original patches have his sob and authorship, so I would at least
> expect co-developed-by.

Perfect, thank you for pointing me in the right direction.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
