Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60FFC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 02:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAULPch7BFbqoNLBAJ2VLtPLoL1vNmXtBr/PtBRlllA=; b=dmTyPb4ctIQAem
	SBO3li42DgMeE1DmIE5n2tBEbfHJllNibJZhcjmbT9XLNn1h7+A3Y6ahg3Ty6hO+4VU6A6VtxCX35
	d0Bm8pyDCDJ4nudwYuItw3QFo+v7+zvdKAHOJ8immuxFFdPM9nJxdC8LWNDUWaVMDg9tgeJD2CmU9
	Cj455OGUpctHHS4MSSJqc8Mac2tz07pRFOS0o82ljxaPcWCQ/7stvJG6djYX5Rvh3qqT7yzM//QFt
	J/fp3gk8UiY8pDC5O/Tce0TyYsKz7DvaKh86eK0MuVBvTUynzj4BXCciJnQuIDQfhUrYc8p6A7E7w
	pOL8tkufKt+X2pIado1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4une-009d3b-HE; Tue, 13 Dec 2022 02:13:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4unV-009d1e-2l
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 02:13:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id u5so1821354pjy.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 18:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dytxSctGH3/JU5+VUvCXKRl3djDPMXaOjikH1n5CrMU=;
        b=CBf3R1fmXIZ45yTb+WHxJdiyNOFL2h5rhe7iuVz+maaKt1rkPLuLZ1Vg6SAm23HMHG
         vQ6uXPH/ty7wkcdAYuV/Lh/0nTI9cyJfrD99XFzYtkzgINZ5bTa5LBeoIBAsqfn4QDC3
         6SVFH94xQAmltYML5ctohPuMu25umC/aZZCO6gUijQK+8crcDBG5bvbVDVdxF3bugd0O
         rtoRLMRfttq4YtD01i5HrnVdRJstwarVuJG/T6s79sxcBeqvrkLe9Nt+5avTs3+UOplZ
         FkjJ/F9aFkiOlaZ3Av0iqu9jA/E5UOfBI4ocgDHSNbxKS74BDaooa/RlqBvBkybckhx2
         eXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dytxSctGH3/JU5+VUvCXKRl3djDPMXaOjikH1n5CrMU=;
        b=M9T3vWSHtiKGUhfcUC3cfoP47A7SbIJRXd6tWP9bjs3y5JFCkg9Iemzl1h+iK4YIWB
         CysAPQz2fAYogIOSPDaJLJIq3QHj61Z6aU+kObgpVPGBGkwTpp6G2IDL6t/BSTGsm7RQ
         bWinUuviAIcKaXUDVf8O4spLrTHPgm2izCmX2kLrH3KB2MSGYiT9yzlbpLMvrTO6SpHO
         SdMto7DE5+nuyFsyShGgj0s3lzqb0wshAOjKyQTTKtjpakIK/vT579AUUI4p67B6ru1t
         bRqwGugOuIxvIIL590kp5YkYy5fj38/+J8grL7y1VoI9moUYpyfKcRMMt1r2XWOw4+Sy
         YFbA==
X-Gm-Message-State: ANoB5pkzW33Kh6NcwG/zt9xzKurk6k74ezmyDT4vMgcjjxOIaE7WSJSZ
	xkLmdQJpUwBz7BNpYMrHyxQsBg==
X-Google-Smtp-Source: AA0mqf5lyAQrJvHm7xnE6hLi9O52SD019Oq6Ie+uJ0eyRDJIM2Xscc/SexS//WPdt/sgq2p4vlI/tg==
X-Received: by 2002:a17:902:7b96:b0:189:858f:b5c0 with SMTP id w22-20020a1709027b9600b00189858fb5c0mr90604pll.0.1670897608745;
        Mon, 12 Dec 2022 18:13:28 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902654900b00176b63535adsm7060787pln.260.2022.12.12.18.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 18:13:28 -0800 (PST)
Date: Tue, 13 Dec 2022 02:13:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH 11/14] KVM: selftests: Disable
 "gnu-variable-sized-type-not-at-end" warning
Message-ID: <Y5ffxebJ/eRzEXh+@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-12-seanjc@google.com>
 <CAKwvOdnRQQb9YbH=MgDymBmmjYgajc8tkyjbJVxjpA5zDZpNTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnRQQb9YbH=MgDymBmmjYgajc8tkyjbJVxjpA5zDZpNTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_181333_139413_62FC0597 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, Dec 12, 2022, Nick Desaulniers wrote:
> > diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> > index 2487db21b177..9cff99a1cb2e 100644
> > --- a/tools/testing/selftests/kvm/Makefile
> > +++ b/tools/testing/selftests/kvm/Makefile
> > @@ -196,6 +196,7 @@ else
> >  LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
> >  endif
> >  CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
> > +       -Wno-gnu-variable-sized-type-not-at-end \
> 
> This is a clang-specific warning. This will need to be wrapped in a
> cc-option check.

Not that I'm against guarding this code, but I don't think cc-option() will do
anything in this case.

AFAICT, gcc stopped treating unknown "-Wno" flags as unconditional errors starting
with gcc-4.4, and the kernel's min supported version is 5.1.  gcc-4.4 through
gcc-9.5 all print a mild warning if there's a different error, but otherwise
silently ignore the uknown "-Wno".

  cc1: warning: unrecognized command line option '-Wno-gnu-variable-sized-type-not-at-end'

gcc-10.1 is even friendlier and notes that the unknown flag may have been related
to the error.

  cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end'
  may have been intended to silence earlier diagnostics

Because cc-option() doesn't have errors in its probing code, it will return "true"
on gcc for literally any "-Wno-*" input that gcc deems syntacially valid, e.g.
gcc barfs on

  depends on $(cc-option,-Wno-)
  depends on $(cc-option,-Wno)

but happily succeeds with

  depends on $(cc-option,-Wno-lol-gcc)

Various man pages suggest -Wunknown-warnings is a thing, but no gcc version
supported by godbolt recognizes it.

So unless I'm missing something, trying to detect lack of support will be non-trivial,
and the worst case scenario is that users of older gcc version will see a potentially
confusing warning when the build fails.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
