Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86C1C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vYxb7/kRsR0XzK0GSn3ehjS6HtF2WDELRJ3qUPFUjc=; b=VUQ0JjmykDgkRs
	hMFcgKSmXcnKLavuyrov+NeWF5CsdhykJU/tzd/CdkAvGxVXLGJixVo8538MunVXJ2lc2e75TAcGx
	XbUjy2Aj6kjL/T/dgA12ptv4c4Xg50BwOSskXatbVu7fhkQcqRHV33xdcTQx05WpvuxE0mLRQdxyE
	crezRICNNLIKYxkZqA8eM/TC1T5jnlRP3K3Kxf04H5VdFxTzdA7lkGVHRcRUVdMP5IvDs2TUnxZ4C
	NU4IKPyVcEb5weWA3N8UuxVRCTzr0uFxsQpkKxucXoqnFkTUpbt8dczBotlo+hxHZompE61wRGRU+
	oUCK+3N9vkmx7ya0g/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q44Lv-00EuPw-0F;
	Tue, 30 May 2023 18:45:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q44Ls-00EuOa-0X
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 18:45:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9700219be87so877300766b.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685472334; x=1688064334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uToXJ+fOWkpnn5Y/56EQgrrTUY3apSu6OqRigzUlyIc=;
        b=Bx1VXp1lL1lr/7Wg4nAZ/8axfexaAsOa5wdsT0oRkjQoSAlr/s2ZxkRzDYWGF5JzY0
         jgZC646MNyQRsm7TAkynXNGDr7V04SO4B0NwGP2V3vPF1vhSesCmL3/mEnMJTQw3Ujdk
         /REcVYg+ph1BCux4hWvJFck0XFyK9F2a2yr9unJoLygRbFoT3c9bguF4D/hDysaxF7a5
         7kNhXL6FfSL6x15DosMBfLRZsS3njv/j7lchGd540xy5yJok7PXaQyS5sEBQIRWD5MK2
         V7/uC3cHqK8r1oRZSTuGH4dZ/3a5iq+VEkvHfuxPigsc9H3qbtoz84wxK5yO/myq+lQN
         Bcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685472334; x=1688064334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uToXJ+fOWkpnn5Y/56EQgrrTUY3apSu6OqRigzUlyIc=;
        b=KYLd3bo3C1osWSk0oEnBMOXFi5JaI0+UDeD/7xUs1J+F7SzMyP97CjFw1X5Rr05flh
         VdH7krtMRe2cPVN2PFbLyYVrY3TmZSm+au0PcmArF4caCvY/0F9/0TAoIdag574G0/6o
         tVcJJStzaFkseXsERPMOPu8NCXPgH5FT3Lnf0NOlLxpXRrfLr6Ef5XDNYkiYdYq41reX
         dNHkQvXp3CrQL480VD2of1e2xrrYBFAeYSQIT6WVvbEQawp9f25zCNpY1A9gzT2JrNiu
         E68wnX1+OwbjcsDBCyLKY2k1uUuZzI8luJDFkJ4achhjYaPr2RCzMWwuiiLa6IGTQCt4
         sIgw==
X-Gm-Message-State: AC+VfDxULDnqiHGf6hCFvp0mvr7Bt4pHjyE/aDEi8Dk0L6TcJggTHwt1
	owbo2yy57eEyYzkPahYNLRA=
X-Google-Smtp-Source: ACHHUZ7iBBEKE+toubaVfH5MLKrEnuzzySKWPjZ7fHNs67mYDXW5fh0fbYrECQwxAPCIA3fJeHK3YA==
X-Received: by 2002:a17:907:9609:b0:947:335f:5a0d with SMTP id gb9-20020a170907960900b00947335f5a0dmr3678436ejc.62.1685472334056;
        Tue, 30 May 2023 11:45:34 -0700 (PDT)
Received: from andrea (host-95-247-65-76.retail.telecomitalia.it. [95.247.65.76])
        by smtp.gmail.com with ESMTPSA id f6-20020a1709064dc600b0094f4d2d81d9sm7726268ejw.94.2023.05.30.11.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 11:45:33 -0700 (PDT)
Date: Tue, 30 May 2023 20:45:28 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, heiko@sntech.de,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, christoph.muellner@vrull.eu,
	David.Laight@aculab.com, heiko.stuebner@vrull.eu
Subject: Re: [PATCH v3 2/2] riscv: Add Zawrs support for spinlocks
Message-ID: <ZHZESDWJZvhuJ3Af@andrea>
References: <20230524-35efcabbbfd6a1ef83865fb4@orel>
 <mhng-d92f84d8-03db-4fb1-93c3-0d5bfbe7a796@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d92f84d8-03db-4fb1-93c3-0d5bfbe7a796@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_114548_208865_C40B3C00 
X-CRM114-Status: GOOD (  19.18  )
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

On Wed, May 24, 2023 at 04:00:43PM -0700, Palmer Dabbelt wrote:
> On Wed, 24 May 2023 10:05:52 PDT (-0700), ajones@ventanamicro.com wrote:

> > I guess this peeling off of the first iteration is because it's expected
> > that the load generated by READ_ONCE() is more efficient than lr.w/d? If
> > we're worried about unnecessary use of lr.w/d, then shouldn't we look
> > for a solution that doesn't issue those instructions when we don't have
> > the Zawrs extension?
> 
> It's actually just a consequence of how the Linux hooks are described:
> they're macros that take a C expression to test in the loop, and we can't
> handle C expressions in LR/SC loops as that'd require compiler support and
> nobody's figured out how to do that correctly yet (there were some patches,
> but they had issues).  So we need to do this awkward bit of checking without
> the reservation and then waiting with the reservation.

I believe Andrew was really just hinting to something like (from
arch/arm64/):

#define smp_cond_load_relaxed(ptr, cond_expr)				\
({									\
	typeof(ptr) __PTR = (ptr);					\
	__unqual_scalar_typeof(*ptr) VAL;				\
	for (;;) {							\
		VAL = READ_ONCE(*__PTR);				\
		if (cond_expr)						\
			break;						\
		__cmpwait_relaxed(__PTR, VAL);				\
	}								\
	(typeof(*ptr))VAL;						\
})

where the __cmpwait_relaxed() would issue NOPs without Zawrs, a
sequence "lr.* ; beq ; wrs.sto" otherwise.  (with the "dangling
reservation" when we branch, similarly to CMPXCHG)?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
