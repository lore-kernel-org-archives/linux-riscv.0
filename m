Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9309C83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeQmAI1ubwjwDn4lvh22QY7wvt1GJsdUSeHOlPQus+Q=; b=O+Eh3YiuUZcZwc
	1wJGXdi2+eMrQudmvZTwV4gtaMrokIn0aU1GhvOnOjsxaNlk+dbjfmjc7PVIuFNXAJZdMLeaXIk+6
	yhHBlfDnl6Iz5fGLla8j7pVG7c2FCJhtM0kc5rKbfO6wyZIN/j0OB1Vl9lnxYZfv6PmGLgxwSrtEz
	R/k9er1/nqKNZhojonp7bQ76uGB1mrTuQdYFcozuM3pgkGnkGhRHkfOl7MqLnqP5m/PfAqwa4NPXT
	OyuY98UrojlC5YlJ+M4gnYSiP6V6agCcbT7uRnML8e/SGXFj2Q+FXKWWrp97RJLcIb/s+DVUSlsVz
	Uwdzd3lE9/964Gt5KmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaLdg-008PHa-1z;
	Sun, 27 Aug 2023 19:41:36 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaLdc-008PGr-1t
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 19:41:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99d937b83efso327215966b.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693165289; x=1693770089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dtOReuCG2LtJLkXPBZy6w7ZugfLsBr/nQL1Exzye5GU=;
        b=n7YgV6+/nEe+PNrDk23EBtXJvDDNU0Hb463SEN5j8ZUetCL6rScYet10m0Yl9Z+Bde
         weDhz+IoDPP5VfYQkholj3zXBCmhFT4HmBSIOwSPCLFMiIoOBCIO64JsvEYg1eUmu7Fm
         LFOC77ONbKSwNgUeKMWwkgqxIZbeU3q+SJK+xytRz4NRHgkAxv+S041RdwO1QAspi9R0
         qaArqDV+uQF6e+h6FNZ0BlUYChtct+xKWxxjfIRDp4svBSfrhUOEbwWDEyZG+ooTG6kh
         w306AP1tP4ONK8Mz7FMWp3CJKZYOCLbLX/qzePUihArVALKf4RiJQ0+ZURKbW7kQUGVn
         HMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693165289; x=1693770089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtOReuCG2LtJLkXPBZy6w7ZugfLsBr/nQL1Exzye5GU=;
        b=S/oDoN+jr6SxrR5+hwFJuFLOzP1ZHGEOuhytOfVRR18L+Fy2Btz9Bh9F04PmUrLShA
         BwrfnlNWvP3PXF2rQSZKNhpCRSDZmC+3LdF6VOvHDxMcPjN6aennrJ2cM+bRYK/sJJjT
         jYsCkUtQDRa1pTwudwCKe6SmQznxn1nQ/8ixVp4z0NwNvg2yX0nAA1rGPSWWWq80Sjlc
         zPP/WrlT1FQRRyhz+F65sOZpvGJ8o0o/XyjH3fJYhatxpKWDhy+3DSpXdsXRcuNwYKL7
         fTO9HhfNqL8h3ZmdvA4/4jEnlxbtv4n9E3ggeMhhYg0r/ZS3aM9Aw9YCtJuRzhgnvfTF
         bD6g==
X-Gm-Message-State: AOJu0YyfNLBKDsEDOrsFGD3f4hq+1ekS3DxvMxuxGlUJhpjyrhTL43ZP
	SU1I1LfMH5VC2OitQBspNfQ=
X-Google-Smtp-Source: AGHT+IFuqSmkJLo+RTdqdoTG5olx7LlmPyAs+/AVl64S4Q9zFjqORp2696DtLCW63gWIrAkWkSCf7Q==
X-Received: by 2002:a17:907:2be0:b0:9a5:a247:5bbc with SMTP id gv32-20020a1709072be000b009a5a2475bbcmr1868830ejc.28.1693165288863;
        Sun, 27 Aug 2023 12:41:28 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id a1-20020a17090640c100b0099bcf9c2ec6sm3720828ejk.75.2023.08.27.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:41:28 -0700 (PDT)
Date: Sun, 27 Aug 2023 21:41:27 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
	yonghong.song@linux.dev,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
Message-ID: <ZOum50Py8Vki+Nd3@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
 <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
 <ZOsKukBz8i+h4Y8j@nam-dell>
 <87y1hw7t5p.fsf@all.your.base.are.belong.to.us>
 <ZOsZtH+5P0/R6kvd@nam-dell>
 <87jztgwaur.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jztgwaur.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_124132_747725_00095224 
X-CRM114-Status: GOOD (  42.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 27, 2023 at 09:20:44PM +0200, Bj=F6rn T=F6pel wrote:
> Nam Cao <namcaov@gmail.com> writes:
> =

> > On Sun, Aug 27, 2023 at 11:04:34AM +0200, Bj=F6rn T=F6pel wrote:
> >> Nam Cao <namcaov@gmail.com> writes:
> >> =

> >> > On Sun, Aug 27, 2023 at 10:11:25AM +0200, Bj=F6rn T=F6pel wrote:
> >> >> The default implementation of is_trap_insn() which RISC-V is using =
calls
> >> >> is_swbp_insn(), which is doing what your patch does. Your patch doe=
s not
> >> >> address the issue.
> >> >
> >> > is_swbp_insn() does this:
> >> >
> >> >         #ifdef CONFIG_RISCV_ISA_C
> >> >                 return (*insn & 0xffff) =3D=3D UPROBE_SWBP_INSN;
> >> >         #else
> >> >                 return *insn =3D=3D UPROBE_SWBP_INSN;
> >> >         #endif
> >> >
> >> > ...so it doesn't even check for 32-bit ebreak if C extension is on. =
My patch
> >> > is not the same.
> >> =

> >> Ah, was too quick.
> >> =

> >> AFAIU uprobes *always* uses c.ebreak when CONFIG_RISCV_ISA_C is set, a=
nd
> >> ebreak otherwise. That's the reason is_swbp_insn() is implemented like
> >> that.
> >
> > That's what I understand too.
> >
> >> If that's not the case, there's a another bug, that your patches
> >> addresses.
> >
> > I think it's a bug regardless. is_trap_insn() is used by uprobes to fig=
ure out
> > if there is an instruction that generates trap exception, not just inst=
ructions
> > that are "SWBP". The reason is because when there is a trap, but uprobe=
s doesn't
> > see a probe installed here, it needs is_trap_insn() to figure out if th=
e trap
> > is generated by ebreak from something else, or because the probe is jus=
t removed.
> > In the latter case, uprobes will return back, because probe has already=
 been removed,
> > so it should be safe to do so. That's why I think the incorrect is_swbp=
_insn()
> > would cause a hang, because uprobes incorrectly thinks there is no ebre=
ak there,
> > so it should be okay to go back, but there actually is.
> >
> > So, from my understanding, if uprobes encounter a 32-bit ebreak for any=
 reason,
> > the kernel would hang. I think your patch is a great addition nonethele=
ss, but I
> > am guessing that it only masks the problem by preventing uprobes from s=
eeing the
> > 32-bit ebreak in the specific test, not really solve it. So, if there i=
s a 32-bit
> > ebreak in userspace, the bug still causes the kernel to hang.
> >
> > I am still quite confident of my logic, so I would be very suprised if =
my fix
> > doesn't solve the reported hang. Do you mind testing my patch? My potat=
o of a
> > laptop unfortunately cannot run the test :(
> =

> Maybe I wasn't clear, sorry for that! I did take the patch for a spin,
> and it did not solve this particular problem.

Okay, thanks for the comfirmation!
 =

> When we're taking a trap from *kernel*mode, we should never deal with
> uprobes at all. Have a look at uprobe_pre_sstep_notifier(), this
> function returns 1, which then means that the trap handler exit
> premature.
>
> The code you're referring to (called from uprobe_notify_resume()), and
> will never be entered, because we're not exiting the trap to
> userland. Have a look in kernel/entry/common.c (search for
> e.g. TIF_UPROBE).

I will think about this a bit and answer later. I will answer the below part
first.
 =

> Now, for your concern, which I see as a potential different bug. Not at
> all related to my issue "trap from kernelmode touches uprobe
> incorrectly"; A "random" ebreak from *userland* is trapped, when uprobes
> is enabled will set the kernel in a hang. I suggest you construct try to
> write a simple program to reproduce this!
> =

> I had a quick look in the uprobe handling code, and AFAIU the was used
> when installing the uprobe as an additional check, and when searching
> for an active uprobe. I'm still a bit puzzled how the issue you're
> describing could trigger. A reproducer would help!

I have just produced the problem, using this small program:

	.global _start                                                            =
                          =

	_start:
		addi x0, x1, 0
		addi x0, x1, 1
	        addi x0, x1, 2
	.option push
	.option arch, -c
	        ebreak
	.option pop
	        ecall

Compile that with
	riscv64-linux-gnu-gcc test.s -nostdlib -static -o ebreak

And setup uprobes by:
	mount -t tracefs nodev /sys/kernel/tracing/
	echo "p /ebreak:0x0000010c" > /sys/kernel/tracing/uprobe_events
	echo 1 > /sys/kernel/tracing/events/uprobes/enable

(obviously you would have to edit the offset value to be _start symbol of y=
our
binary)

Then I execute the program, and the kernel loop indefinitely (it keeps goin=
g in
and out of exception handler).

Then I apply my patch, then the kernel doesn't loop anymore.

So I think it is a valid issue, and I will send a proper patch to fix this.

Best regards,
Nam =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
