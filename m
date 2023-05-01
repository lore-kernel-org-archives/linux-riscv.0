Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AD4C77B7C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/a0ZOSJz+JXhWj6q6ZFRJoszZLL2PRJam54g8GcgT00=; b=hQPfF7776F4B/r
	TmPiBB5qv+2tlEtsCib7x3ZkLT5XCtmgcYxLd4RiBOlhOWv7HO7nlI/D6u+V4l8lJ+cqGkLYz046d
	PYXaRkVi90vAn8pW4YWxTou/5VWhNM3bHgAVCmljUcfKpa2f0H6H1czLyP5NLlDXxOmzMoRPwAbKf
	Kog7Y+0nBL9PQtdeK8dlF0WX+IfSVHq1hawC8/z22ByLo+iUnMBiUTriIK8uJhXCEJcfqZzjb8Aqk
	SVB8sTT4/1J4a2Fdxj2+BDxOIpbkSrg4m3OvSZWunjtupSGJ2NprotaSUoVdZv28p94ciAHCm5ddm
	IIxnNwV3v6qFC8bMG1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZcI-00Go6t-0j;
	Mon, 01 May 2023 19:55:22 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZcE-00Go5J-1v
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 19:55:20 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9d8730fe5aso4530561276.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682970916; x=1685562916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A6/Qwr73DpjqVyRdRECBbxXjLLTahq/uJGnivC6mAq8=;
        b=ClYnXBf5j7IE84eCufhh4j+Q1v3QrVrduert9Mwp9P2CgxoEgS9X0HaB4DoiWBD0TV
         ib2BW2YhVc94eouXTJme6+ctMvsGMzVAwgXzrTZmaGnOBplLpIdGyh+siSb+aI31Pjz7
         QeKaYmUGhlMxMD2u1kkCeWDoObDA4YYwSNhqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682970916; x=1685562916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6/Qwr73DpjqVyRdRECBbxXjLLTahq/uJGnivC6mAq8=;
        b=Npgdssy3zFQxB3/4QQmD/0EU9xUqAXRL2uzdXXFj371v7YOPx7tN3y4yhG21/zisac
         T4whKo9yuUsHgcO8vEtfwF+m5pbA9dhsHa/m3KHZ8ReWQShNSoTc2t+WUCiwMXwqSrjv
         HS8lkDOMbWQ2gxQzQhGnMAiA6AINEoCwOqvSHgKzFittu1VWMqcjZDMWNS0GUeMHh6d8
         VZKcjyRnCyi0dYjSG2I1fNOAi0LxdoSQmzlAisn/SLq1lYZlSTuIGBHKmdwC4Agtzt1H
         r58ULsRTOpQCUVqJUyybZjG/iMzhkuNdRfbWERKAMvGDEB2YMCEw1uuSfJ/iVxNqCD4x
         7inQ==
X-Gm-Message-State: AC+VfDzMUz7upWteIDrTRfXpstshX8lf5uCvzXW22/a5FwsIA2BK939H
	oCZIIIojWPHMikswRD7EglGRv4rrhBqa916+y3txng==
X-Google-Smtp-Source: ACHHUZ6mXHBbh/gghSFHt9MMqjtNLExU37HqKLYSXLE/DP0k1nNsS5rB1J/KXb3q/MO7YoUNZy28qQ==
X-Received: by 2002:a25:5808:0:b0:b92:6590:5127 with SMTP id m8-20020a255808000000b00b9265905127mr12050581ybb.4.1682970916537;
        Mon, 01 May 2023 12:55:16 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id s3-20020a254503000000b00b9ba6a3b675sm2361865yba.50.2023.05.01.12.55.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 12:55:16 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b9a6869dd3cso4512414276.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 12:55:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:a28a:b0:e6:f7e8:1e4d with SMTP id
 a10-20020a056a20a28a00b000e6f7e81e4dmr13625249pzl.33.1682970895325; Mon, 01
 May 2023 12:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org> <20230501-cottage-overjoyed-1aeb9d72d309@spud>
In-Reply-To: <20230501-cottage-overjoyed-1aeb9d72d309@spud>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 May 2023 21:54:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCufbm80g4AqukpiuER17OXhD-yRNmTZRz7s_x-Xi9BDCw@mail.gmail.com>
Message-ID: <CANiDSCufbm80g4AqukpiuER17OXhD-yRNmTZRz7s_x-Xi9BDCw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Conor Dooley <conor@kernel.org>
Cc: Eric Biederman <ebiederm@xmission.com>, Philipp Rudo <prudo@linux.vnet.ibm.com>, 
	Dave Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Baoquan He <bhe@redhat.com>, 
	Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_125518_635689_0DB3BD0D 
X-CRM114-Status: GOOD (  25.17  )
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

Hi Conor

On Mon, 1 May 2023 at 19:41, Conor Dooley <conor@kernel.org> wrote:
>
> Hey Ricardo,
>
> On Mon, May 01, 2023 at 02:38:22PM +0200, Ricardo Ribalda wrote:
> > If PGO is enabled, the purgatory ends up with multiple .text sections.
> > This is not supported by kexec and crashes the system.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  arch/riscv/purgatory/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> > index 5730797a6b40..cf3a44121a90 100644
> > --- a/arch/riscv/purgatory/Makefile
> > +++ b/arch/riscv/purgatory/Makefile
> > @@ -35,6 +35,11 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
> >  CFLAGS_string.o := -D__DISABLE_EXPORTS
> >  CFLAGS_ctype.o := -D__DISABLE_EXPORTS
> >
> > +# When profile optimization is enabled, llvm emits two different overlapping
> > +# text sections, which is not supported by kexec. Remove profile optimization
> > +# flags.
> > +KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
>
> With the caveat of not being au fait with the workings of either PGO or
> of purgatory, how come you modify KBUILD_CFLAGS here rather than the
> purgatory specific PURGATORY_CFLAGS that are used later in the file?

Definitely, not a Makefile expert here, but when I tried this:

@@ -35,6 +40,7 @@ PURGATORY_CFLAGS_REMOVE := -mcmodel=kernel
 PURGATORY_CFLAGS := -mcmodel=large -ffreestanding
-fno-zero-initialized-in-bss -g0
 PURGATORY_CFLAGS += $(DISABLE_STACKLEAK_PLUGIN) -DDISABLE_BRANCH_PROFILING
 PURGATORY_CFLAGS += -fno-stack-protector
+PURGATORY_CFLAGS := $(filter-out -fprofile-sample-use=%
-fprofile-use=%,$(KBUILD_CFLAGS))

It did not work.

Fixes: bde971a83bbf ("KVM: arm64: nvhe: Fix build with profile optimization")

does this approach, so this is what I tried and worked.

Thanks!
>
> Cheers,
> Conor.
>
> > +
> >  # When linking purgatory.ro with -r unresolved symbols are not checked,
> >  # also link a purgatory.chk binary without -r to check for unresolved symbols.
> >  PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib
> >
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Ricardo Ribalda

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
