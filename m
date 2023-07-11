Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1FCEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtbBhN9DiBtNObILq/GHZer3q9Ae5ovmvW/n2dVWxPM=; b=V2TayWZ/x6YCDk
	DslwCgtcuJybVoTU8BeSd6X+9HdMph/6mOtI0vUcsSJqX/h1CeeUpxZTFybHHRA8+J50hJoqOFY2+
	CnSjKRD9N8qLen0/1JN51x4ePWkZ/6aF7ZQrM9zeClFNtkPgaONU4a48KqqElOWvVhuILxthnhcci
	J+MLmOQJCTjZjW+ci0dRf9a+mPBnv8GnAFyzkQuTbUFuqABdc0laqgdxwDZk5N6MGdEzp06iT3yoU
	BVWomLjEwH0vWVZ089B5e8/4WkhGLaI98+bOARyuD9823zcGwy7o7apolifwI+UGtpF9fiiGaimlA
	rC0eJwXaOccSEpENRMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGzB-00FUbt-0h;
	Tue, 11 Jul 2023 17:17:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGz7-00FUbI-2K
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 17:17:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-307d20548adso6038192f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689095826; x=1691687826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKFZ1fsOWMTwkYmCF5xZHlaiZPqOrQjG51XkXG8xsuk=;
        b=D5y3LWruBfCLfjEqzVCNKUET3kISp5tN0QhzQ0iP6goxPbl+uI/RYpL2N0LVcglj2X
         0lEe3icLlxNx4dmUGdWBogGMZxmkMerhMKo2z8Taa3yXYB3F57C+Q2sZZ9VXeCqZ1vq3
         IfL9lqdd5K5jEEB9K4m63l4Kg4qdSuit0mNh1SO1qcpywK/UyGuuA0teNwWRy6oTR7Gs
         wLcYjMziDvFC8xmLXoA0agYIot8X/qnhT+7xau9EO5vMz5j9yHLUmsY6lbF5hdrTb5mJ
         DUY5ssopkfJz2b5PCInx3UMPHhbXj3vW8qRufrU2DYx+0RSqiK1S21dNcjePJd3seafz
         PqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689095826; x=1691687826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKFZ1fsOWMTwkYmCF5xZHlaiZPqOrQjG51XkXG8xsuk=;
        b=R2Bha6Z7qxAlpt4UQdmTLUfCLXT8zA+aiWl8EzwqIGkVIC14ZDj0RWtJ5P2iM0DubT
         uyZBzQz/aYGe9BfEsGLUXzk5RvhDh+/yP2ySb8jndrscjqJt63a6WDnXgYtKxkljMyni
         lmUanLg+r6nx3BCHKGVow9nYRCKRxkQhu8nqgaSfbZ9AuzfOe6KUtiGdDvtlr2EKflyo
         vBrth7Dw7HLdA3iG5g2I6I0Sqds3J8+VU4t0BYMYdNbLNQwbPsZGk5c/0QkeyslUOWTx
         XvnD1MXnTDveNqs0rMLVEeW+/wffGp6fJBPZV9Aab330pe9wwuQSJ8vAarXxqfUiBt2W
         MMCA==
X-Gm-Message-State: ABy/qLZfsfsNa01FNTsM7g0B60TCTR7YKgeVwRJbal9e0+9eHAAaDDgx
	EpdLgUm75DkNAhicMLncVn1qkA==
X-Google-Smtp-Source: APBJJlHP0y7SeY1nrbv57HJV7f8WoCTfGdEzwRBf4kmtBVsQ6FUsVRpK3RM24Y5TlmLXsB9e6E8P0w==
X-Received: by 2002:a05:6000:150:b0:306:46c4:d313 with SMTP id r16-20020a056000015000b0030646c4d313mr13962528wrx.28.1689095825620;
        Tue, 11 Jul 2023 10:17:05 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id d3-20020a5d6443000000b0031433443265sm2783203wrw.53.2023.07.11.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:17:05 -0700 (PDT)
Date: Tue, 11 Jul 2023 19:17:02 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Heiko Stuebner <heiko.stuebner@vrull.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] RISC-V: Implement archrandom when Zkr is available
Message-ID: <ZK2OjvchhqzEKZWR@vermeer>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-5-sameo@rivosinc.com>
 <3566075.R56niFO833@phil>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3566075.R56niFO833@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_101709_974500_9D167F64 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Heiko,

On Sun, Jul 09, 2023 at 04:06:16PM +0200, Heiko Stuebner wrote:
> Am Sonntag, 9. Juli 2023, 13:55:46 CEST schrieb Samuel Ortiz:
> > The Zkr extension is ratified and provides 16 bits of entropy seed when
> > reading the SEED CSR.
> > 
> > We can implement arch_get_random_seed_longs() by doing multiple csrrw to
> > that CSR and filling an unsigned long with valid entropy bits.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> > ---
> 
> > +static inline size_t __must_check arch_get_random_seed_longs(unsigned long *v, size_t max_longs)
> > +{
> > +	if (!max_longs)
> > +		return 0;
> > +
> > +	/*
> > +	 * If Zkr is supported and csr_seed_long succeeds, we return one long
> > +	 * worth of entropy.
> > +	 */
> > +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZKR) && csr_seed_long(v))
> 
> While this whole thing looks really nice, I don't think you can only
> check the ZKR existence though.
> 
> To access the seed csr from supervisor-mode, it looks like the SSEED
> bit in the mseccfg register also needs to be set by firmware.
> And in the kernel we will likely need to check this setting somehow
> before enabling access.

We can't check it as msseccfg is an M-mode only CSR. While reviewing v2
of this patchset, Stephen suggested to either document the SSEED
requirement with the dt-bindings documentation, use the SBI FWFEATURE
extension to ask firmware to set mseecfg properly, or trap seed access
and feed the caller with a virtual entropy source.
I'd like to go with the second proposed approach (FWFEATURE) but that
requires the corresponding pending patch to be merged first. So for now,
I will only document the SSEED requirement when passing the Zkr
extension, so that we at least have a contract definition for firmwares
that enable Zkr through DT. When they do, they're required to at least
set SSEED in MSSECFG.

I have a couple of pending patches ([1],[2]) related to that, so that an
OpenSBI+qemu+linux combination works as expected when enabling Zkr. I am
going to submit them upstream as well.

Cheers,
Samuel.

[1] https://github.com/qemu/qemu/commit/2a146057099ada946bf4a9c2e355a5a290c23c80
[2] https://github.com/riscv-software-src/opensbi/pull/315

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
