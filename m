Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEFEC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pPA/BFh2+YCWagBI0AHdQyj4PuocLZZJqW809Xp8fR0=; b=IXYjmEmOTswRV09MEESaoyqcCm
	8/Ns0vHxsyerlbMgdGHZ16o0+3mF/RiJu+2ihqKh89Na3Zc7zpT8VJfokQ1GHu9dumm5vCHGkEZ2n
	H7ex9qc2qxoRznFkzxkpIi5MPi4Vt4xQCXBdyvgpW9R9vwp0D2ZcMnzibdRokho9vFXc/tL63hIBg
	SvJA+WPd09sVStzccoF0W613MLG1fx9X01do8uxFyiJ6gNdftvGG5620tN9bCcm29No9SsT+SuY7d
	5w2kuTPeIwPoJennHOiaYNj/rtT8vChCqU8fWGgFoa/8tbmDtrqFgY6kIh4BCN5tkpMNoBqnYKhMs
	mtjoiLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2JvR-009KHB-3m; Fri, 17 Jun 2022 21:54:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2JvN-009KBX-EF
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 21:54:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d13so4897698plh.13
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=B20NxaTIV7iSP2+7NwcovSUVk+Wiz2v0PtTe6/8HeBw=;
        b=j/JOJXznNhMM1mZgV5AFF/2Lv0AEaO/KQtQZs9DlCbCQhDNvFfa2xDwA/sEDOR7sRx
         0Es8ohH/MMEF2PN5te+itmc6XO2RetMU9DyxyWDYISYn4AADH4sdgbz0y1OXS+psa9AH
         laID9nNoQIG4XMWqfWr6fH+sNDN07ETg1pA/VyzdH/1C9DUtZa8agc0Tz8gBwFururld
         qrvzN0/9GNrKnUG01NPXrKDnFJURMrPXGfUNg2W+uDY9ImDW7W3IGuRhDJIcI8SR5eRP
         f0t47S71uH898XaFSkOVjMSFdwrR/9bxYa7gHEFVQwZGaV7CkAlCsSFIFQCVAmNqKN3Q
         3q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=B20NxaTIV7iSP2+7NwcovSUVk+Wiz2v0PtTe6/8HeBw=;
        b=B32li4gaqRtVtto/DSGYuxOeRmeyNKmqc7P8JNpNx7wT/d7gQUC+yddL71cqrArV9p
         xO46rA5T0xaZ7hSJCSwWPe8Bya4Vh1tv+7xK4rZcyOPKtJFo8PTtnZ5fu7+bMHis3R7W
         3OOzivZVGKOHBxXrf9roQKr34qdaNhW8TWb4jvDnb8KN7/0XOC9bAhLGdKubJRmgNlxO
         mDUTqKP2y60/nQbK9BEhOVBhOAcJF/YncwAQfosfm8Hz+kcXGEtfkFy5tD06I4EDA+Rr
         yfHSByvgAXop5GPO4W9wPgJJ11LAICSbBoRimJqjN3KpaegwXSQV+dubZmG3gV3fmP42
         qhUw==
X-Gm-Message-State: AJIora/kU/LbVsC61a3CBU6KGEvOqYnRzknmpfYwjY8rmKeTVJ0Uoyqw
	1WPZ+vhDGQTjO3EChKrVPp6MhQ==
X-Google-Smtp-Source: AGRyM1t20F4Ae1TTP81tCRTTW+SCXGmBjvQRRtexdZLNnC00KvWq6b4Mblh8COX7Ik869P06T8RcEw==
X-Received: by 2002:a17:90b:3912:b0:1e8:3cd1:82ca with SMTP id ob18-20020a17090b391200b001e83cd182camr12719977pjb.18.1655502878112;
        Fri, 17 Jun 2022 14:54:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id gb13-20020a17090b060d00b001ec86b3f7bfsm162136pjb.24.2022.06.17.14.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 14:54:37 -0700 (PDT)
Date: Fri, 17 Jun 2022 14:54:37 -0700 (PDT)
X-Google-Original-Date: Fri, 17 Jun 2022 14:54:35 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix ALT_THEAD_PMA's asm parameters
In-Reply-To: <YqedafxlnoXauefj@dev-arch.thelio-3990X>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  ndesaulniers@google.com, heiko@sntech.de, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev, patches@lists.linux.dev, jrtc27@jrtc27.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-9c9a8588-72a2-4e97-85d4-e843e77e3117@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_145441_736773_4FD7D4EA 
X-CRM114-Status: GOOD (  27.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jun 2022 13:26:17 PDT (-0700), nathan@kernel.org wrote:
> On Wed, May 25, 2022 at 07:40:37PM -0700, Nathan Chancellor wrote:
>> Small ping on this and https://lore.kernel.org/20220516214520.3252074-1-nathan@kernel.org/.
>>
>> Our builds on -next have been broken for a week now. Hopefully these can
>> make the first RISC-V pull request to avoid mainline being broken in the
>> same fashion.
>
> One more small ping. The patch linked above made it into 5.19-rc1 but
> this one has not been applied so our builds are still broken.

Sorry I dropped the ball on this one, it's in fixes.  Thanks!

> Cheers,
> Nathan
>
>> On Wed, May 18, 2022 at 11:45:29AM -0700, Nathan Chancellor wrote:
>> > After commit a35707c3d850 ("riscv: add memory-type errata for T-Head"),
>> > builds with LLVM's integrated assembler fail like:
>> >
>> >   In file included from arch/riscv/kernel/asm-offsets.c:10:
>> >   In file included from ./include/linux/mm.h:29:
>> >   In file included from ./include/linux/pgtable.h:6:
>> >   In file included from ./arch/riscv/include/asm/pgtable.h:114:
>> >   ./arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
>> >           ALT_THEAD_PMA(prot_val);
>> >           ^
>> >   ./arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
>> >           : "0"(_val),                                                    \
>> >             ^
>> >
>> > This was reported upstream to LLVM where Jessica pointed out a couple of
>> > issues with the existing implementation of ALT_THEAD_PMA:
>> >
>> > * t3 is modified but not listed in the clobbers list.
>> >
>> > * "+r"(_val) marks _val as both an input and output of the asm but then
>> >   "0"(_val) marks _val as an input matching constraint, which does not
>> >   make much sense in this situation, as %1 is not actually used in the
>> >   asm and matching constraints are designed to be used for different
>> >   inputs that need to use the same register.
>> >
>> > Drop the matching contraint and shift all the operands by one, as %1 is
>> > unused, and mark t3 as clobbered. This resolves the build error and goes
>> > not cause any problems with GNU as.
>> >
>> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/1641
>> > Link: https://github.com/llvm/llvm-project/issues/55514
>> > Link: https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html
>> > Suggested-by: Jessica Clarke <jrtc27@jrtc27.com>
>> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> > ---
>> >  arch/riscv/include/asm/errata_list.h | 14 +++++++-------
>> >  1 file changed, 7 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
>> > index 9e2888dbb5b1..416ead0f9a65 100644
>> > --- a/arch/riscv/include/asm/errata_list.h
>> > +++ b/arch/riscv/include/asm/errata_list.h
>> > @@ -75,20 +75,20 @@ asm volatile(ALTERNATIVE(						\
>> >  	"nop\n\t"							\
>> >  	"nop\n\t"							\
>> >  	"nop",								\
>> > -	"li      t3, %2\n\t"						\
>> > -	"slli    t3, t3, %4\n\t"					\
>> > +	"li      t3, %1\n\t"						\
>> > +	"slli    t3, t3, %3\n\t"					\
>> >  	"and     t3, %0, t3\n\t"					\
>> >  	"bne     t3, zero, 2f\n\t"					\
>> > -	"li      t3, %3\n\t"						\
>> > -	"slli    t3, t3, %4\n\t"					\
>> > +	"li      t3, %2\n\t"						\
>> > +	"slli    t3, t3, %3\n\t"					\
>> >  	"or      %0, %0, t3\n\t"					\
>> >  	"2:",  THEAD_VENDOR_ID,						\
>> >  		ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)		\
>> >  	: "+r"(_val)							\
>> > -	: "0"(_val),							\
>> > -	  "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
>> > +	: "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
>> >  	  "I"(_PAGE_PMA_THEAD >> ALT_THEAD_PBMT_SHIFT),			\
>> > -	  "I"(ALT_THEAD_PBMT_SHIFT))
>> > +	  "I"(ALT_THEAD_PBMT_SHIFT)					\
>> > +	: "t3")
>> >  #else
>> >  #define ALT_THEAD_PMA(_val)
>> >  #endif
>> >
>> > base-commit: 93c0651617a62a69717299f1464dda798af8bebb
>> > --
>> > 2.36.1
>> >
>> >
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
