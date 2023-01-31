Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41154C636CD
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KNgeIAEK1bajnFdysAxX3a+1dAxwYKx5SSzh0fMUOo=; b=izouq0LwHjMdXv
	HMTGNrR2dOBEv3eVNjcDeWQ7YbSGFk5Ar1US05nBBFpoThS85v5ay27lWkrZTmNHdAoo4yIfTy75o
	0GHqWD73GI2aNr7MBIlgUzaG7Loq9Nr+20enFebXeIAZTAOA60GTOkFc5Gd0vazYhkTqIilYLc0CU
	4wyYS5a6QaARy57vFfiszthL1QphkZcTJCY0JmbFTyo1ngfcGozIH+gGB4pYF8XWPFM0m2zm5lZp6
	kLGFvlyUSPTQWUn8k3hbdwJSZTRlzkvpVq5bJvuprFvs4uJ4SzDvO6LJ5HDhiZJdPb7+m55inI2hy
	MefnzevZNDdUtcUuoEqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxBx-009GQd-2T; Tue, 31 Jan 2023 20:25:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxBt-009GPn-U5
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:25:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id mc11so22677272ejb.10
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S9zE9SYxpAWSxHcA5MCfO5n3twTThlqtds31HX8QFBE=;
        b=aemAfuUnY1ELoSc7IUGtDXonWc+4QG8ERZrpu/U/YwdqE2n2Bpj6luJk/097Q/K8OS
         SFS8Qyyo49VnqHVfbtwXR+U8XaDW2zSatg93gi1FCf1KUp4bR5ZA07l/sIwPOxGMY5Bj
         z+w6W/Yy+ZuDO8CKrXR/rYMxzOKxWFf0lPOEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9zE9SYxpAWSxHcA5MCfO5n3twTThlqtds31HX8QFBE=;
        b=ko7/GVBnNwkizXqhFdbVtELPWbkeEfaEMmr0c61UFvZ+NkFb+MfZDRfdfnTHPe9JGk
         x8+P07RI5uLHm5VAenFaThfnTJfwzhSmpNCVQ3B2+KC38koLqC5c8zWiIibNeKEK7vIk
         xGz73VA6unq+z9y4gKIBs6mmXfTQSDwnefvlRdHIUMT8B8C4xfXDJ00q4aeQQf7E1CC9
         HaKyPO8k46pU9FhoBigwG6LYdFuisHSkEOI2b5mB+0nNglqA4jSLPFqoFIcTXbyxJosh
         7hRAJhAiooHb45JoQdGDCsam8NCyt5LMEspwRtopQeZJDAiKTPfr2tzerfng1KUtQp4s
         N8Ug==
X-Gm-Message-State: AO0yUKXbqdDCwf/asBi+9MY+pCVTsF13xQTDy7LQvqFupXolsdrrHMlC
	/fYiMCTZGw16o5GvxHWTmxaPzHZFUyOIN9/EZAw=
X-Google-Smtp-Source: AK7set9kRsTO16J54v5IbJ1/stye7/cv7OAgMjQMUaayqnrJb4Rs/npmvutAuC7NttBELATI2Bp7cA==
X-Received: by 2002:a17:906:6a03:b0:88d:697d:a3d2 with SMTP id qw3-20020a1709066a0300b0088d697da3d2mr866007ejc.54.1675196712777;
        Tue, 31 Jan 2023 12:25:12 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id dk2-20020a170906f0c200b00877e1bb54b0sm8907483ejb.53.2023.01.31.12.25.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 12:25:12 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id z11so15646925ede.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 12:25:11 -0800 (PST)
X-Received: by 2002:a50:bb4c:0:b0:4a2:649a:72eb with SMTP id
 y70-20020a50bb4c000000b004a2649a72ebmr1579842ede.70.1675196711395; Tue, 31
 Jan 2023 12:25:11 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV>
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Jan 2023 12:24:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
Message-ID: <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To: Al Viro <viro@zeniv.linux.org.uk>, Peter Xu <peterx@redhat.com>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_122518_015713_574BCC7C 
X-CRM114-Status: GOOD (  15.75  )
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

[ Adding Peter Xu to the participants, he did a lot of "add generic
helpers" code a few years ago. Peter, see

    https://lore.kernel.org/linux-arch/Y9lz6yk113LmC9SI@ZenIV/

  for context ]

On Tue, Jan 31, 2023 at 12:03 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> However, it never had been done on a bunch of architectures - the
> current mainline still has that bug on alpha, hexagon, itanic, m68k,
> microblaze, nios2, openrisc, parisc, riscv and sparc (both sparc32 and
> sparc64).  Fixes are trivial, but I've no way to test them for most
> of those architectures.

Gaah. The patches look simple and "trivially correct", but I hate how
we duplicate basically the same (complicated) logic across
architectures.

Peter improved a bit on things, but I think we could do better.

Yes, all architectures basically have their own special code for
special error registers etc, and for various errata and/or special
handling for vmalloc addresses of vdso's etc.

And they aren't always translated to the generic flags, looking at
alpha, for example, we have code like this:

        si_code = SEGV_ACCERR;
        if (cause < 0) {
                if (!(vma->vm_flags & VM_EXEC))
                        goto bad_area;
        } else if (!cause) {
                /* Allow reads even for write-only mappings */
                if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
                        goto bad_area;
        } else {
                if (!(vma->vm_flags & VM_WRITE))
                        goto bad_area;
                flags |= FAULT_FLAG_WRITE;
        }

because it uses the alpha internal "cause < 0" logic, instead of
having translated it into FAULT_FLAG_INSTRUCTION.

But *if* the alpha code were to just translate it into the
FAULT_FLAG_xyz namespace, apretty much *all* of the alpha
do_page_fault() could have been then done by a completely generic
"generic_page_fault()" that has all of the retry logic, all of the
si_code logic, etc etc.

So in a perfect world, we'd only have the special errata handling (*)
and the "translate to FAULT_FLAG_xyz" code in the architecture code,
and then just call that generic_page_fault() function for what really
is pretty much generic.

And then we would never again have these kinds of "architecture got
the retry wrong" issues.

Would anybody be interested in trying that? Just converting one or two
architectures to a new world order?

But if not, Al's patches all look "obviously fine" to me, but that's
because they basically all do the same thing except for that odd
special TSTATE_PRIV thing for sparc-64 - why can't that use
'!user_mode(regs)' like everybody else?)

                   Linus

(*) we really have a *lot* of architectures that have gotten
'prefetch' wrong and have errata for prefetch: alpha, arm and x86 all
have magic "bogus fault on prefetch" cases.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
