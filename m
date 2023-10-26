Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE06DC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 23:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Y96qNjAhKq0samzzISuSgJTy17czQy6enn6oxx1WiQ=; b=QSkZGopOFUaBh0
	IYX96i3nSDyRJ35afIr7m1SBBT0qgKsu4I+uR/X/4PkQQaFC9xUjNpxZhxhKR58uKC0NMLxmO5ibd
	83oiFm+3CKG3xr5KfyywMqppjzIGKF6u/MP0GMlRl/mzo1ug6E62FB/jDaadbiMxnV/9yHxWl3F8t
	ka3yPdOg1Bzl03gj+nGitoMKddafbmz/+P4B/Iepnjat+9Fwpw6983ubm3Mb6Q0X30xbjPh+21Nt0
	O/H7QF7k7Ai23wCNyTFIMgIufdkU3XenIu+Vj0HuzbUKUaUejZS4LOtxBnvA5C9Jh5DE6iqs6D93N
	eF5Vm+AXE3JGCyWdhkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9yl-00FKMY-2w;
	Thu, 26 Oct 2023 23:41:31 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9yi-00FKM2-1z
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 23:41:30 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-458d30d63deso708392137.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698363687; x=1698968487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjBrI9YmsLIbi6PERsecmQp7XtKn0fCbk7lkuucm0CI=;
        b=jFHu0+4cKEtYOtn/I/imZXoidcclgMtGGecoSyuvnMNolYzBuOwvlIP/a6f5R7XA5Y
         lrfkhCcutenRx7jbXs7tNhNxwWudWip7dcD9IenCulhUAxNG+7ngwJ+7JW2nTD+FUglB
         bVjnSrNfm8AXNxWSUzCQBIDSHFiLf2hrA5LgNWyWvXkX7gWzfdC4piTHZOFW3aH9yyjA
         PlUOq4+ZwjJkEeLiKlPJaDMOxZkB4IJwWvt6iteR1Fluu4ZX3xI83XhP9He6wS2uXpwV
         VV5kBOT/vfPdO34xUpHtVwyeCMX/Jl1LwEEziFSI5vcN1N1SlLejJc++hHk97XoiX75D
         Tgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698363687; x=1698968487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjBrI9YmsLIbi6PERsecmQp7XtKn0fCbk7lkuucm0CI=;
        b=CSH0rbSt9fAnPEsRZj+2JrcsHTxahKSUa9A+9fhxL/30d1tQInU5q7gMvIjt1on4IF
         oZunt+R6tXVt3Fj7mhBwpCq9kX4dEz2y19zSx9MHsrQzd7yqmbSwU7l8+FzUY3X7OG9q
         44h0Po+Eyy3BVbgxQXZmoVlqK/sMuA8OeUCASBT3P4m4B4+kTiFWIhH8tVLN+dtCAQYj
         Y2EWDgNqGeRuqDVMamxOl3ATthwHE6CaXT0qMbNoEfj2EkFfG94RZhhBjaBvCdunJSJR
         YdTNf4c2lW++pc4AQiCvxkQ9gIYRaSEfsCCcRqGe7jm4BwousESnDm60MPn1MrXSpys9
         r4cA==
X-Gm-Message-State: AOJu0YyPr5eCjWaLk46VuI9b9ct3Ij9d1kTTdTQtKMXXxek4yVLK43iA
	niVFkQKHKkkJ0u0XZrsU6SI22/C8yDe7DIQYJZZXKQ==
X-Google-Smtp-Source: AGHT+IGXh1dtqLyeV+dAZwx6xwPRfo8Ss9CVmJmQjkA6Te17SBEjqowXaFoKDQg2vw//qtBqDH6nO2/AkjaqjNtQe/0=
X-Received: by 2002:a05:6102:22c8:b0:452:6465:4a35 with SMTP id
 a8-20020a05610222c800b0045264654a35mr1154073vsh.11.1698363686704; Thu, 26 Oct
 2023 16:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <d65bddf3-c58a-1420-bff9-8333c10edb56@microchip.com>
 <20221115221051.1871569-1-debug@rivosinc.com> <98eb5bc7-dee4-b36e-a219-17b1e08d85f6@siemens.com>
 <ZR5JvCSDZwTQAucC@u-NUC7i5BNH>
In-Reply-To: <ZR5JvCSDZwTQAucC@u-NUC7i5BNH>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 26 Oct 2023 16:41:13 -0700
Message-ID: <CAKC1njRRnerL3vF36DX9cAdyO4pyqGE8g35q8U1-D71gKW2jKA@mail.gmail.com>
Subject: Re: [PATCH v5] scripts/gdb: add lx_current support for riscv
To: 20221115221051.1871569-1-debug@rivosinc.com
Cc: ajones@ventanamicro.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	jan.kiszka@siemens.com, kbingham@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_164128_652784_C92B4223 
X-CRM114-Status: GOOD (  42.14  )
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

On Wed, Oct 4, 2023 at 10:29 PM Hsieh-Tseng Shen
<woodrow.shen@sifive.com> wrote:
>
> On Mon, Jan 02, 2023 at 10:09:01AM +0100, Jan Kiszka wrote:
> > On 15.11.22 23:10, Deepak Gupta wrote:
> > > csr_sscratch CSR holds current task_struct address when hart is in
> > > user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
> > > register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
> > > "tp" with expected user mode value and place current task_struct address
> > > again in csr_sscratch CSR.
> > >
> > > This patch assumes "tp" is pointing to task_struct. If value in
> > > csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
> > > is correct address of current task_struct. This logic holds when
> > >    - hart is in user space, "tp" will be less than csr_sscratch.
> > >    - hart is in kernel space but not in trap handler, "tp" will be more
> > >      than csr_sscratch (csr_sscratch being equal to 0).
> > >    - hart is executing trap handler
> > >        - "tp" is still pointing to user mode but csr_sscratch contains
> > >           ptr to task_struct. Thus numerically higher.
> > >        - "tp" is  pointing to task_struct but csr_sscratch now contains
> > >           either 0 or numerically smaller value (transiently holds
> > >           user mode tp)
> > >
> > > Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py
> > >
> > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > >
> > > ---
> > > Since patch has changed a little bit from v1 and I didn't include
> > > changelog earlier, here it is.
> > >
> > > v1 --> v2:
> > >  - added logic to locate task_struct irrespective of priv
> > >  - made locating task_struct agnostic to bitness(32 vs 64).
> > >  - added caching of ulong type in scripts/gdb/linux/utils.py
> > >  - added more descriptive commit message
> > >
> > > v2 --> v3:
> > >  - amended commit message and source line to fit column width
> > >
> > > v3 --> v4:
> > >  - amended commit message and remove whitespace in source
> > >  - added Reviewed-by for reviewers
> > >
> > > v4 --> v5:
> > >  - changing the order of changelog and sign off/review tags in commit
> > > ---
> > > ---
> > >  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
> > >  scripts/gdb/linux/utils.py |  5 +++++
> > >  2 files changed, 20 insertions(+)
> > >
> > > diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> > > index 15fc4626d236..14c22f82449b 100644
> > > --- a/scripts/gdb/linux/cpus.py
> > > +++ b/scripts/gdb/linux/cpus.py
> > > @@ -173,6 +173,21 @@ def get_current_task(cpu):
> > >           else:
> > >               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
> > >                                  "while running in userspace(EL0)")
> > > +    elif utils.is_target_arch("riscv"):
> > > +         current_tp = gdb.parse_and_eval("$tp")
> > > +         scratch_reg = gdb.parse_and_eval("$sscratch")
> > > +
> > > +         # by default tp points to current task
> > > +         current_task = current_tp.cast(task_ptr_type)
> > > +
> > > +         # scratch register is set 0 in trap handler after entering kernel.
> > > +         # When hart is in user mode, scratch register is pointing to task_struct.
> > > +         # and tp is used by user mode. So when scratch register holds larger value
> > > +         # (negative address as ulong is larger value) than tp, then use scratch register.
> > > +         if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
> > > +             current_task = scratch_reg.cast(task_ptr_type)
> >
> > Why not if-else for the assignment here?
> >
> > > +
> > > +         return current_task.dereference()
> > >      else:
> > >          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
> > >                             "supported with this arch")
> > > diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
> > > index 1553f68716cc..ddaf3089170d 100644
> > > --- a/scripts/gdb/linux/utils.py
> > > +++ b/scripts/gdb/linux/utils.py
> > > @@ -35,12 +35,17 @@ class CachedType:
> > >
> > >
> > >  long_type = CachedType("long")
> > > +ulong_type = CachedType("ulong")
> > >  atomic_long_type = CachedType("atomic_long_t")
> > >
> > >  def get_long_type():
> > >      global long_type
> > >      return long_type.get_type()
> > >
> > > +def get_ulong_type():
> > > +    global ulong_type
> > > +    return ulong_type.get_type()
> > > +
> > >  def offset_of(typeobj, field):
> > >      element = gdb.Value(0).cast(typeobj)
> > >      return int(str(element[field].address).split()[0], 16)
> >
> > Looks good to me otherwise.
> >
> > Jan
> >
> > --
> > Siemens AG, Technology
> > Competence Center Embedded Linux
>
> This patch had been pending for quite a while, and not sure if it's
> still acceptable to be merged, but from my testing it's working fine
> for me. Nevertheless, the v5 patch now has conflict with the current
> master, so I've slightly modified for reference. It would be helpful
> if Deepak can send v6 later on.

Thanks for testing it out.
I just sent out a v6 based on v6.6-rc5.

-Deepak

>
> Tested-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
>
> v5 --> v6:
>  - dropped cache type "ulong" in scripts/gdb/linux/utils.py as it
>  already exists in the current upstream
> ---
>  scripts/gdb/linux/cpus.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 255dc18cb9da..f8325cab5f1b 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -179,6 +179,21 @@ def get_current_task(cpu):
>          else:
>              raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                 "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +        current_tp = gdb.parse_and_eval("$tp")
> +        scratch_reg = gdb.parse_and_eval("$sscratch")
> +
> +        # by default tp points to current task
> +        current_task = current_tp.cast(task_ptr_type)
> +
> +        # scratch register is set 0 in trap handler after entering kernel.
> +        # When hart is in user mode, scratch register is pointing to task_struct.
> +        # and tp is used by user mode. So when scratch register holds larger value
> +        # (negative address as ulong is larger value) than tp, then use scratch register.
> +        if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
> +            current_task = scratch_reg.cast(task_ptr_type)
> +
> +            return current_task.dereference()
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                             "supported with this arch")
> --
> 2.31.1
>
> Thank you

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
