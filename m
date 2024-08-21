Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3145DC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVfl7n9rvHq/OQl3PpoVBMi58X8CcgRvdSO+jxzMYno=; b=H/uqQ/oxbrac/E
	EUiyxHzmcdcNdTPa+xVkhmj6PzigxQa4h5oQ8BTb3Ap5pJIHC8Zj5iGt0i6sWDFJpVkT5Xvx1twGf
	a8NuZ1aXXx8XHtt5QmjBvMZhi2nqcHbAUJKFt406udafaAY3gFQLVaQZ70wxUt4KmKH5cHCo9SAnr
	0+rd4wp+bo4QCIXUiRLMAlYncRkcfTTUOPF13fb9PIeagCxVEPSIQQXB/l5v0XgiJZ+6j75pqgj4x
	r8VPMMxcQaOqTc3wd3qZzUO2HonnBNPmhSUo0RSuK1GspXugr9lozkA9zaYfWRKEAhkdFmp9kCrCk
	Dy0dm7wBAM2f1hBKmSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkHx-00000008tP7-373Q;
	Wed, 21 Aug 2024 12:18:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkHv-00000008tNM-0icp
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 12:18:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-428101fa30aso53589335e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724242684; x=1724847484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQMTmLPogZcziJOzZF5KtcmCsv9/KHWQ2nfDgqi45D8=;
        b=DOn1o9VMzQAEL2cSzAShAd2Ne8m5JGqVAkh0tcbZnGhTFCW0rbPTPlJEvPjDhNqOuK
         wB1S3m+CvLewWuxW17mWM4Q5M4rysL+Iy5jQDe3kE3tSUcGGdcmFKaJ5PFEZf9omdH//
         MfJvhy9GTRLaQxlLbUS7rikXcf1GCar+Zo5ZSzuI3C7oCQy/1QjuZ8J5rr3L8a2mQ+E8
         9JPZdVqub6iepwDir0IjVPsVDQOyNQN1P4C0CtAhJjW776x94r3SKiW2rDjOzruVQxwS
         UpI+tE5eQ5oSGQMGzWciBdFeFAtA7w2zExTNz7Gr4UaMA7CvgxqKRIF2K2ctfnBOAO05
         fN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242684; x=1724847484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQMTmLPogZcziJOzZF5KtcmCsv9/KHWQ2nfDgqi45D8=;
        b=rp1GcjZOAjreLQYOjGduWGSUoyBImLMTRZZWqkR9omAayyf17UiIpiKbUKaSfrgwwb
         miCXOyye87s7OxzlrQ5LxBmrj6Z38z+E4nQFemu+zw/IEukgVrBbQVq9hGu2VFRnBAXL
         rkb+yDYZHZoDkxlaVJm1t8mg0SOx549MmlzAdhwknmOyVf9A21a4QdOAZuM4ppWkajy6
         d21Kz59CzVRZnoJe3H51xzq6BcbakKVBLaJA2C4EAxozZIg2ugmmlgcJKnSFr0WUgHJm
         ewfEvOrtjeN12YXR1kfVEU1N3Blx4+cFDpEl57TxmEq5k52qpbwnEOSZ+LyVdVRN0f4N
         mmBg==
X-Forwarded-Encrypted: i=1; AJvYcCXFREKML1fld716zDuP+WfDwOPQCNOiRiCqyGeTZTAVePv15xsTmATiyjB6wnnJoXoloCfAD7E+Z5L2dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxic9cYQGdbJJOw5acyDG2u7AZn0fEDGC1w5Ffjm088aSEvDRL
	W5CJzAxj9zOD6IrMBY3/LnoN7WA2cpi8opu5IHSdld3/2r8GHdNb8LLq6b3OhHg=
X-Google-Smtp-Source: AGHT+IEvDLQ9JZtvl3rdFrkdWkXXNhlmpHGUQNicJFbEKranRXP1xwJjc3KOZvUilRQvOAzVR/r8FQ==
X-Received: by 2002:a5d:6349:0:b0:371:a70d:107e with SMTP id ffacd0b85a97d-372fd57f1bcmr1514219f8f.6.1724242683523;
        Wed, 21 Aug 2024 05:18:03 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371a937a694sm11257656f8f.65.2024.08.21.05.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:18:02 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:18:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Message-ID: <20240821-6befd27b90a9e9ff89f4a277@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com>
 <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
 <CAHVXubgtD_nDBL2H-MYb9V+3jLBoszz8HAZ2NTTsiS2wR6aPDQ@mail.gmail.com>
 <6f1bcc9b-1812-4e8c-9050-a750bfadd008@ghiti.fr>
 <CAJF2gTS4L6=HE_-9rgn3L8+6R7C4Jx=QgCkvOBhQHdHVGzr5MA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTS4L6=HE_-9rgn3L8+6R7C4Jx=QgCkvOBhQHdHVGzr5MA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_051807_251402_F9A33BB9 
X-CRM114-Status: GOOD (  17.79  )
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

On Sat, Aug 17, 2024 at 01:08:34PM GMT, Guo Ren wrote:
...
> > So I have just checked the size of the jump table section:
> >
> > * defconfig:
> >
> > - ticket: 26928 bytes
> > - combo: 28320 bytes
> >
> > So that's a ~5% increase.
> >
> > * ubuntu config
> >
> > - ticket: 107840 bytes
> > - combo: 174752 bytes
> >
> > And that's a ~62% increase.
> The size of the jump table section has increased from 5% to 62%. I
> think some configuration triggers the jump table's debug code. If it's
> not a debugging configuration, that's a bug of the Ubuntu config.

And I just remembered we wanted to check with CONFIG_CC_OPTIMIZE_FOR_SIZE

Thanks,
drew

> 
> >
> > This is the ELF size difference between ticket and combo spinlocks:
> >
> > * ticket: 776915592 bytes
> > * combo: 786958968 bytes
> >
> > So that's an increase of ~1.3% on the ELF.
> >
> > And the .text section size:
> >
> > * ticket: 12290960 bytes
> > * combo: 12366644 bytes
> >
> > And that's a ~0.6% increase!
> >
> > Finally, I'd say the impact is very limited :)
> >
> > Thanks,
> >
> > Alex
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
