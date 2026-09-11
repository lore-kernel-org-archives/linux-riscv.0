Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114ACC79FA1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 05:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbtwDcIe52Ab4mPOExqtijoa0qCbN1Ell6qkAhlpPbM=; b=SieDSOX4R1jqC1
	L9Y/MvNe2UTzjig51d9lGmIqo6IjYnTkPr9U/LV2jn48lGhiSnvFOoLPVGqr+7t47fnyaTQoONfFX
	ZVbpPi46wfKKE4SAsCYG9nIuYMSIPbrLf++pCneeob/sUv2QQUp6AtS1RxtjHl0c3wrokWPSYaApH
	7NmTfj4dzZLLSB2j3rmW8m4Dk7taPK3zGSF9XoicF6TXx0+vHEWpTr/nJtRvUYIaV1zFuTwl0/JUY
	1bbCMz/3T6l0FuV5iiL+UCeTCa2p/BIi0e44VyfqaSk2gXvm/L6Ti0duZVSlyGTeIiRzzKGduBgl7
	AC1mobaEQ43N1A8CLzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tcf-0000000Fqp0-3Ghl;
	Fri, 11 Sep 2026 05:16:25 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tcd-0000000Fqof-0yuG
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 05:16:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc149372c14so421049a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 22:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103782; x=1789708582; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQ54+lD2n/aIXsWwyvLa1NXcPj36AMrVbfAkkYOl2fw=;
        b=oxyIw2ixWfXfeBgrANILdb/RmUHjtUGoneCr9biLgH+y9XEWL3tK44SsVtCh5eYh/Q
         H4cYnkJ+Jt1kGioixkgEhSuuxNg4ho0wUNuVRKl79bmTGQ+lO1z7xms2Hb6mIyb3ek9t
         EPybehaQ8c0txB2P9px+qPaIYatlsBxdBaIUF7jS42oDo++8GrSEFz7KRS5Bw5HlEKCs
         XRoGZa6oUo68FVvJC5bTstm3kJLhcswEPwelh9ZjP6macH7/Fejs0U5KiQIXcNgj8ssW
         L6E0CUi9vXj2aGKgVvtZvlBJBWUvqQuAY6iPdv/6mjAjBEeiDuQ3zGHQ/Db7rfDoFN0W
         8T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103782; x=1789708582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ54+lD2n/aIXsWwyvLa1NXcPj36AMrVbfAkkYOl2fw=;
        b=YCkpe4RNHw0k8mMOeGNa5bEXvsmHDZDT+DwVjOm8FTqCIdszgZuODNoB7l70yRCRMq
         p35HofUXR2TfuL7M8f3bPv2P7SkzcCsxwuEhVPo5WS+4SMUxc8sFXnbnQYz4S00EP9c7
         pA3m4hMZLFoGO1T9/0n/hKhC5Xw2YDJlCob3sFo4oWkc2CDDqO+vczfqdIXhkzTdrTUi
         xujdQACJV/oKIMgpz5x2K1umePm4ViQViTzMMu1DqyzNQmBmBpQKVUVJbXeafnPWYjA6
         /6ZwjPM45jWQBCU1Mk+P1nWN/ZNNIfeX0eSsn1VZNLUUgfe7L9dWxu0TC8/a7FsUBVzZ
         2PrA==
X-Forwarded-Encrypted: i=1; AKwUvBx7tz7y1TH+/OdszOm56ic4YjXhwhSqzkOPleK0MOdfmZ/dgILmm8/ja5UiEY+EfSNnaoZXYcUE9Mmw+w==@lists.infradead.org
X-Gm-Message-State: AFuF++mDzxEfLR0jW2JMmrsLyCi2y2NJFl97I5wKVMl4MRbtql7Vjgbr
	+vzF6rDxSCtRR9Qi6OL1J+EWMVhR1mW82SkJdEpIHmTngjoJdbMzW8+t
X-Gm-Gg: AYBFou0xj/j/Q0+xb4H3G4dC2Y7I66MJmnSAWgvdlO75JmzQsBzQfv1hawiZrm3/r8m
	e5trCBdd2CiyBhdJXzIqRhaKldFpO+m4V3jzBnksJIFoOhyOGK6kCxirgZPKJUalThYCiiA94YT
	ZBDCteshTI7hU3UEgqj1Y9ZoqUQJ/vSWUBxjRlvqn0/Q6gjQ1LOj2wA84iLAS+EdJyJnXsOqs34
	gBgtLAYwyI6PuZnW5Wpxf3RVw/A7s14HHq/hrOF39fEATQUzYAjgZ8ZT4lO9upvSCdWji0Zi3L9
	7IPqK6tdiaeQioPuOV9WbZi7XnF8EbN40cmM1DTqIxFmapdwtt/Bksc4ZS+9oDnTEvLrjl8Vtpa
	NDiUnp+m3TzIr57RRKqP8zxjy5gI3DOG2nhJBtherj+pTZDgI1QY0FffoM15+LKyCkDuzRzVWPY
	WjikqbNTCUC2pc0JwJ3PqWG2TzvHbyTwult29gmzczfBVsmxkWt6qfk2G0h0gUPL9bd82UUNqeL
	atawfliZf3jpSmQoe1LYxfR5u9+tDTWOIqX8tEDg3Juwi8s1N/KmWSU
X-Received: by 2002:a05:6a20:7347:b0:3d1:39e9:b269 with SMTP id adf61e73a8af0-3daed15388dmr4300321637.4.1789103782257;
        Thu, 10 Sep 2026 22:16:22 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm3295201eec.17.2026.09.10.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:16:21 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:46:10 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqON9aluXdKk8nNq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_221623_301305_38604F15 
X-CRM114-Status: GOOD (  20.38  )
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

On Thu, Sep 10, 2026 at 01:05:27PM +0100, Gary Guo wrote:
> On Thu Sep 10, 2026 at 11:08 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> >
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> 
> I think we probably want to catch this earlier by have something like
> 
> #ifndef ARCH_WARN_ASM
> #error "ARCH_WARM_ASM is not defined"
> #endif
> 
> in generated_arch_warn_asm.rs.S.
> 
Hey Gary,

Sounds good.
[...]
> >
> >  arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
> >  1 file changed, 20 insertions(+), 16 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..df2183c35945 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >  #endif /* verbose */
> >  
> >  #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >  #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"			\
> > +	"2:	.4byte " label "b - .\n"		\
> 
> "b" is part of the label. "1b" itself is a label and "1" is just an integer.
> 
> If the code uses
> 
>     _EMIT_BUG_ENTRY(..)
>     "1: ..."
> 
> then the correct label would be "1f".
> 
> Best,
> Gary
> 
Thanks, I missed that part.

Will fix it and send it out.

Regards,
Mukesh
> 
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
