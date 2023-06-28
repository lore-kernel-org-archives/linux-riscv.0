Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA58EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbGkXAolEV0eWYMkueOavRotoBNq5miGUxfec0qEl58=; b=SlEKJxucIN87xY
	Ms+uu0OzI8C1cTUcgK4effPGLP21BpKO/F8VASru50rh5vsHW6mXhRdENKVtnDfwVLg97/98pOQRM
	sCuCtk96ooIaw4OmxWaNw2E8szWAhSbGzDFEMgdE5U6m2pARuCyCs267ktJkOpP+DfiHjjVCB7Upv
	lWWxTJc5T3du7eLkXTHK/wY1TfcBpNIg1loV76KTyJ/YmqdlX7+cwgazfG2oNQR+9lfNQGzyeeWMB
	nj/VKHdeCG/Hn+rBhNvPkQr5eXg3yDiQgGQoL0YHfFrockJRLQDYYaAyQIdtdF+r3tbFT3eQVEflu
	wFaXrUFai2/KaxAgkDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qES2X-00FJT1-1s;
	Wed, 28 Jun 2023 10:04:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qES2U-00FJSA-2f
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 10:04:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so8048975e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687946678; x=1690538678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gNv3Ntjw9a9SFPntTfDiSDFYXpNEEiDMU1CtBPXnFDI=;
        b=yqJPLfLINGBtelqfxwJSt7xu6/8kFt9kkGN4kwBaILn2nd9bRot6papzGlFBJfARPM
         JNQQM9Br9MY4Qx3ugVI0a6IsYGSiFpyB7eBPR4160ZgZW4tF/S3CPQKHB9lrvR+Na76f
         +vKdrF5zeVoupbJWu9ZXSXHghxD4NNMCxJM+KFonVJ8gY/nyVvOBMjPCOpr0HW+otC3C
         8kZm37vwNMkTYdBn/MNZ84cVPz7hDAW/X32wlC6JBB0Dr1CfkpaH8BXKQogZmI5s9MDX
         hHbfHB6hanUgwCsbUeqbAuAktvK6M5wY6/R3t9SlUg4PQ/Bbp15EKSoxcI8chxstHISm
         jvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687946678; x=1690538678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNv3Ntjw9a9SFPntTfDiSDFYXpNEEiDMU1CtBPXnFDI=;
        b=DJuJ7xrfCMXQLd3u5l1uvmcPOMOE1fHSuveN7e9I8emRkdxTpgRF7dI5rAkphEXAde
         2rGSug0ioNTQLBCOtbqwpDU0ZNFO4xgc2KIEtmlDPEgyNBkrAivHJ17xSDNSOdeB3+LW
         aNBRENJTzpf3d+Ndyaw9Fx9FjM1hgXPwkfA/WUDPX2Wpl4fgTbxY7PjXPBpTCQL0U2YS
         LwextlkvHCB6pHMhs4QB+Eaf+wguMZD7DsPFsCysJ96VhxnXo9ah3WstZUI9tOzR5piM
         5YUuk1qv6Y9HtHMECh4qHWz+2lichMODRaoBESLMEvTNaz8CzLcX3bFOH3SVExmEuGLs
         FJug==
X-Gm-Message-State: AC+VfDzUohVW6wsJHCPrMvxc+IpQ4npJuvuTCzwvCuv+5Eph9mHKo01s
	W8wuog51hvfFGdGRK0x5xtLxLx+2KtIMZ7cCy/hL0w==
X-Google-Smtp-Source: ACHHUZ4aCnUdPUOic31Ieac5lSE1bqzM8QBjgtRCj4W4up43plvOVO1AEBlDbszwZzebaEIgfmPlWw==
X-Received: by 2002:a05:6512:3ba5:b0:4fb:8fde:f60d with SMTP id g37-20020a0565123ba500b004fb8fdef60dmr1389496lfv.22.1687946678416;
        Wed, 28 Jun 2023 03:04:38 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id j9-20020a5d4649000000b0031118d80246sm12862873wrs.29.2023.06.28.03.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 03:04:38 -0700 (PDT)
Date: Wed, 28 Jun 2023 12:04:35 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto
 extensions
Message-ID: <ZJwFs2O85pvjCLXa@vermeer>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-3-sameo@rivosinc.com>
 <348f624f-3be0-4df7-ab5d-4a912197d82b@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <348f624f-3be0-4df7-ab5d-4a912197d82b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_030442_864462_BAFC4B91 
X-CRM114-Status: GOOD (  24.71  )
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

On Tue, Jun 27, 2023 at 08:34:20PM -0400, Stefan O'Rear wrote:
> On Tue, Jun 27, 2023, at 10:37 AM, Samuel Ortiz wrote:
> > Zbc was missing from a previous Bit-Manipulation extension hwprobe
> > patch.
> >
> > Add all scalar crypto extensions bits, and define a macro for setting
> > the hwprobe key/pair in a more readable way.
> >
> > Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> > ---
> >  Documentation/riscv/hwprobe.rst       | 33 ++++++++++++++++++++++++
> >  arch/riscv/include/uapi/asm/hwprobe.h | 11 ++++++++
> >  arch/riscv/kernel/sys_riscv.c         | 36 ++++++++++++++++-----------
> >  3 files changed, 66 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> > index 19165ebd82ba..3177550106e0 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -72,11 +72,44 @@ The following keys are defined:
> >         extensions.
> > 
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, 
> > as defined
> > +      in version 1.0 of the Bit-Manipulation ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBC`: The Zbc extension is supported, 
> > as defined
> >         in version 1.0 of the Bit-Manipulation ISA extensions.
> > 
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, 
> > as defined
> >         in version 1.0 of the Bit-Manipulation ISA extensions.
> > 
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKB`: The Zbkb extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKC`: The Zbkc extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKX`: The Zbkx extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKND`: The Zknd extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKNE`: The Zkne extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKNH`: The Zknh extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKR`: The Zkr extension is supported, 
> > as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKSED`: The Zksed extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKSH`: The Zksh extension is 
> > supported, as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKT`: The Zkt extension is supported, 
> > as defined
> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> > +
> >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains 
> > performance
> >    information about the selected set of processors.
> > 
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h 
> > b/arch/riscv/include/uapi/asm/hwprobe.h
> > index 006bfb48343d..8357052061b3 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -29,6 +29,17 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
> >  #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
> >  #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> > +#define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
> > +#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
> > +#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
> > +#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
> > +#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
> > +#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
> > +#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
> > +#define		RISCV_HWPROBE_EXT_ZKR		(1 << 13)
> > +#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
> > +#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
> > +#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > diff --git a/arch/riscv/kernel/sys_riscv.c 
> > b/arch/riscv/kernel/sys_riscv.c
> > index 26ef5526bfb4..df15926196b6 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -145,20 +145,28 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe 
> > *pair,
> >  	for_each_cpu(cpu, cpus) {
> >  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> > 
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBA;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBA;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBB;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBB;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBS;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBS;
> > +#define SET_HWPROBE_EXT_PAIR(ext)					\
> > +		do {							\
> > +			if (riscv_isa_extension_available(isainfo->isa, ext)) \
> > +				pair->value |= RISCV_HWPROBE_EXT_## ext; \
> > +			else						\
> > +				missing |= RISCV_HWPROBE_EXT_## ext;	\
> > +		} while (false)						\
> > +
> > +		SET_HWPROBE_EXT_PAIR(ZBA);
> > +		SET_HWPROBE_EXT_PAIR(ZBB);
> > +		SET_HWPROBE_EXT_PAIR(ZBC);
> > +		SET_HWPROBE_EXT_PAIR(ZBS);
> > +		SET_HWPROBE_EXT_PAIR(ZBKB);
> > +		SET_HWPROBE_EXT_PAIR(ZBKC);
> > +		SET_HWPROBE_EXT_PAIR(ZBKX);
> > +		SET_HWPROBE_EXT_PAIR(ZKND);
> > +		SET_HWPROBE_EXT_PAIR(ZKNE);
> > +		SET_HWPROBE_EXT_PAIR(ZKNH);
> > +		SET_HWPROBE_EXT_PAIR(ZKR);
> 
> Does the presence of a HWPROBE_EXT bit imply that userspace software can
> actually directly use the described feature?  If so, we should probably
> not set ZKR unless mseccfg.USEED=1.

mseccfg is MRW, so only accessible from M-mode only afaiu. So I don't
think we would be able to check that from Linux in S-mode.

Cheers,
Samuel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
