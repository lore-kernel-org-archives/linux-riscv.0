Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B158C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovllYfASXIdjl4hNigaGRy7F3XsVz3NmeCGT8Bgc1C0=; b=oDQ6ewFfleXhlq
	i3KiYPGezj3re6Ep8lDTI9AaF6fKnjRaEkyNQwY/wWgD01fd3leUDVbC2p0oiQ0n8s7X3ztSOI45/
	ta2+f/Y0myMWXGQO/Nozn7TXats/pt/VdzfFL7lVqK2DdtCa5UKZUQ01LmVcazgN/4osOp8G3o8IF
	0XFw/nkiHxF0EXgNqfTswfcM+6MtW7lplPNhBcVhDHVNNttbrTFvAdkpTQf4F3Rc+mUnJnH33wrb2
	HWXlA4sA37ZDaIp29KU52rorW1DV8HyyQlQTyc9Ywz9ril/6lgeO2pjOm1RfNReuYtuSrApDReWK9
	IRwnIabJAk6SiZLJvaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5C1V-000000034IJ-04xk;
	Thu, 09 May 2024 22:13:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5C1R-000000034F6-2cm7
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 22:13:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so1293510e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715292822; x=1715897622; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRSL46L55+uENHsYnWvAaZAK+afK8O+3lWdrxjinDKE=;
        b=dcjl1jPDga86DcoOhLO4gmvQ/A5GlsyuhMr0StXFK/5p/frNsGXobgW7A6BkTREpUc
         AJKT/pLt1f+KDOUzaaeSByQe3480AoTXxDYtJGv98yM7RDqlOtAE0DeBjXKI19yJx8+u
         thN5vVdsuZ2OL7YZ9QMQwNaOTb2Kexw0/lVt4GxWNCLwY77gaXOF2SPKppy8Nyrby2Lk
         +SdxQTHLCxAItcpTMoMB5Bg1XhbnBhSq3xQmAKnNRg8YpoZuLFab/Mk8XJljLnzQPlHp
         l+WQxY9+Yiam5gav5k+/HLV9zC8WkPiqOKcARlG19v3sOnA/tgpshNCHf5ok9aee78Sp
         LeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715292822; x=1715897622;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRSL46L55+uENHsYnWvAaZAK+afK8O+3lWdrxjinDKE=;
        b=fQTQyJ/R4UKnV2P4rLU/s3oiWk7Hmolud4qagZeNS6BpgKLbAZfNdkWyrrFLITVw3+
         DhwMR542KzdUTV+Vor9+sk0+FpUHCkUfUKiLWYL5iCRB3IA/N+MApgql1f4UP+XybctQ
         ojgqRruilbsVl3DhnY+RZhQDeYQjGw1rGCTkLkWHQvqYmVlJC5Re9WnBFcY7IvHXJUg0
         2VYAw5wn8f5xRjcHfCyOEkOXg8RqSHG1VCIlb5chZMU74RAlKXxkcIjearCTYyGZw02g
         Ll7iYWLZC4ZyXL3jCZHT3oVJLWv+7++nPNbr9SA5CzVXXnv4fmrKqJZQO8L8DfJfh2iT
         rgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJDsM9EtrI4VFgyTI8KnpERhlIVKEyqey5IvPpNasKV52ZRWN2U/kPrRG9+pj0t8hfQAnyb6NVGTzdyP6rsYPEu7KxeVY4veWzBBfEU78p
X-Gm-Message-State: AOJu0YzYgyxz8C8xTjsK3HtIUDbRItMySez0FLhUl+smBwvnR0mFRFTl
	CtqVSP7RCI11rRAYoP5OIqxlv47W392ExArFUpUD5PBNOB5L9oF+
X-Google-Smtp-Source: AGHT+IE74SDQHxIevu/XazE4Z2d5xEoP4CjfKywq14V4ady5b7Of+F2cJ3ddmbito2hVp9T+wHijvg==
X-Received: by 2002:a05:6512:2205:b0:51e:1391:9bf with SMTP id 2adb3069b0e04-5220e58db00mr274533e87.22.1715292822198;
        Thu, 09 May 2024 15:13:42 -0700 (PDT)
Received: from localhost ([178.252.71.110])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8dcdsm454028e87.229.2024.05.09.15.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 15:13:41 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 10 May 2024 01:13:41 +0300
Message-Id: <D15GK3WBJL0X.BZR6XW0XXG8J@gmail.com>
Cc: "Samuel Holland" <samuel.holland@sifive.com>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: stacktrace: fixed walk_stackframe()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
References: <527dd4d8-f1e5-4581-b1e3-aa315fea8caf@sifive.com>
 <mhng-594655d0-d6a3-4705-a107-893507542f01@palmer-ri-x1c9>
In-Reply-To: <mhng-594655d0-d6a3-4705-a107-893507542f01@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_151353_699867_B4F8DB6B 
X-CRM114-Status: GOOD (  28.71  )
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

Thanks for taking your time to review the patch!

On 2024-05-08 06:51 PM, Samuel Holland wrote:
> A better check would be based on frame->ra, which is always pushed. For
> non-leaf functions, frame->ra is a kernel text address. For leaf functions,
> frame->ra is a stack address. So checking if frame->ra is within the current
> stack (between `low` and `high`) should be sufficient to detect this case.

I've came up with slightly different approach. Checking that frame->ra is not a
kernel text address seems like a more compact solution. Palmer, Samuel, what do
you think?

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..e63bb926d3d9 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -55,7 +55,8 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
-		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
+		if (regs && (regs->epc == pc) && !__kernel_text_address(frame->ra)) {
+			/* We hit function where ra is not saved on the stack */
 			fp = frame->ra;
 			pc = regs->ra;
 		} else {

On 2024-05-08 08:05 PM, Palmer Dabbelt wrote:
> I was just playing with this, looks like GCC is treating tail-call-only
> functions as leaf functions.  So I think whatever workaround we come up
> with loses the tail-call-only function in the backtrace, not sure if
> there's any way we can work around that as there's essentially no
> frame remaining for it.

Yes, we definitely will miss some functions. But at least we can observe
underlying call stack in older compiler versions.

On 2024-05-08 08:05 PM, Palmer Dabbelt wrote:
> > For the kernel, since we want frame records to be available for stack
> > walking, we should pass -mno-omit-leaf-frame-pointer if that option is
> > supported. If the option is supported, we know the ABI is fixed, so in that
> > case we can omit the workaround described above.
> >
> > We may still want a compiler version check, because there is a much simpler
> > GCC change that would fix the ABI incompatibility in older branches without
> > adding the new option:
> >
> > diff --git a/gcc/config/riscv/riscv.cc b/gcc/config/riscv/riscv.cc
> > index dddd72aa237..58722507dcb 100644
> > --- a/gcc/config/riscv/riscv.cc
> > +++ b/gcc/config/riscv/riscv.cc
> > @@ -3894,7 +3894,8 @@ riscv_save_reg_p (unsigned int regno)
> >    if (regno == HARD_FRAME_POINTER_REGNUM && frame_pointer_needed)
> >      return true;
> >
> > -  if (regno == RETURN_ADDR_REGNUM && crtl->calls_eh_return)
> > +  if (regno == RETURN_ADDR_REGNUM && (crtl->calls_eh_return
> > +                                      || frame_pointer_needed))
> >      return true;
> >
> >    /* If this is an interrupt handler, then must save extra registers.  */
>
> IMO we should try backporting the option to GCC-13, that's a cleaner
> user interface.

Agreed. And what about older compiler versions? Is that a good idea to move
unwinding logic into the separate function which can have different
implementations (via conditional compilation) depending on the compiler version?

Now speaking about the implementation. I'm not sure where
`-mno-omit-leaf-frame-pointer` flag should be added. Do you have any suggestions
for a proper way to do it or maybe related examples? Also I can discuss it with
Masahiro.

-- 
Best regards,
Matthew Bystrin <dev.mbstr@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
