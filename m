Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E240FC02186
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpOkiOQu9kjX107XX7/80a9v7QI92YrddMsj/gjZcJA=; b=l6UNYjQ0t6T410
	OBCVqlWQIIe7C6p/YB7j70ACzoUB/supdc8qyHfEPZDIRmiPVBcOu5vphDrh5pZ4XSVFLr9OtHt1M
	nyHAK4oTT6xxTRSliCOeh7aVaGc/uMtTexKukaQqINBCwyRuPwejZFq9wo3hI1r+p5LhMu+/zJSr0
	I8xe++PhX/rJxl611QF+0EWRRbZh3p0VCtZAJ8daIpLyT9GwS8n5914f4GgzWGYQ32gLAdrTlscKJ
	eTSpciOSEuyaG0aXu4KWVyygpxVShBkEZCdpsuC04ywyRam8OoD0ag0ZqfR/NLRl6ofs07MDMWV9i
	96szk+AcGTySRPPAKSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkI-00000005jNy-2xdy;
	Mon, 13 Jan 2025 15:52:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4b-00000005YxJ-020O
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BC6EA4054A
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 15:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E139FC4CED6
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780987;
	bh=ySZhrV7KxoEoceQ7GO1oMNQ6hJVR+4rWEVsbhAzW6xg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q0kFRQ2dWCSaUoXOl2eVB/tWlbeGYAgdrPF2xWrir0QIZwcTXRng10Ynb7GskjCTt
	 ynnIxQ2FLURIP4I4PDkqEPU+3TPpg+YTTKUpGa7jGzg6foD1xgFzVn6by+vnxiwSDm
	 mACMwVaULUom5fP1yMXBc0JYW6/26b2F8DARMG9UAxfg9cUWHr41wDbDAvWQIlEWQn
	 tNrH1eC00V4+Q35Oq5ZzxJAThQqP+p06aBiOl4okEap2sKwWcvjdm765085op+5b2+
	 PycxsJLItwsj+Z/HqA7PevddE0dkOAeNOJvZHQqcuNZUa6jmp9AcpLE3kxMA3vThIq
	 DQuAyB46GTcWw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613037309so17841181fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:09:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxmxriAScazO0GGBtmkh4kx8WH9TsUO+pW0YAzpUq8DkqHuctZ81sG3q727UadUnqIFyG30me6ZFPCQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXrf7JWwfwfUmB9rBxmH3sv74JVhjk4ongxLbMNELXP4dqn9hA
	ITlZaKvDDmArenNvcsEadJ9PoZ2lRVAJwRIzehBLhzNCDy55IkWOjeuHv8zYEdStyUwUrAw2wu3
	1rypxBE91OgpxZBufbMOA9PlzEQ8=
X-Google-Smtp-Source: AGHT+IGbUkOcXb0e6H2t3vy22I/KxhY5cdwF9uFWxpJILef6hsn0LJJk83aecUNNIJFWk9t6jD5HcQSKaA5naE5eaek=
X-Received: by 2002:a2e:bc89:0:b0:306:1501:b18c with SMTP id
 38308e7fff4ca-3061501b3camr29624171fa.13.1736780986298; Mon, 13 Jan 2025
 07:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20250113143222.1868692-2-ardb+git@google.com> <82c4c224-1e3a-4fe1-8bec-a9a3d82cbf3f@w6rz.net>
In-Reply-To: <82c4c224-1e3a-4fe1-8bec-a9a3d82cbf3f@w6rz.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Jan 2025 16:09:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHfD=ZBgOBZpAB97i210N7vtHd2_UPbE_2oAmdMA3Ya9w@mail.gmail.com>
X-Gm-Features: AbW1kvYpyJxTd8iahwxjc7X9ci_8FA4gjYXt6Ub8WEY5hrXC34Ji-2-m_yKfHRg
Message-ID: <CAMj1kXHfD=ZBgOBZpAB97i210N7vtHd2_UPbE_2oAmdMA3Ya9w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Strip runtime const RELA sections correctly
To: Ron Economos <re@w6rz.net>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070949_173793_C050261F 
X-CRM114-Status: GOOD (  21.69  )
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

On Mon, 13 Jan 2025 at 16:07, Ron Economos <re@w6rz.net> wrote:
>
> On 1/13/25 06:32, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them. This results
> > in a situation like below, where some sections that were supposed to get
> > removed are left behind.
> >
> >    [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> >
> >    [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
> >    [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
> >    [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
> >    [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
> >    [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
> >    [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> >
> > So tweak the match expression to strip all sections starting with .rel.
> > While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> > single shared Makefile library command.
> >
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-s390@vger.kernel.org
> > Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v2: add missing include of scripts/Makefile.lib
> >
> >   arch/riscv/Makefile.postlink | 10 ++--------
> >   arch/s390/Makefile.postlink  |  6 +-----
> >   arch/x86/Makefile.postlink   |  6 +-----
> >   scripts/Makefile.lib         |  3 +++
> >   4 files changed, 7 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> > index 829b9abc91f6..750d2784f69e 100644
> > --- a/arch/riscv/Makefile.postlink
> > +++ b/arch/riscv/Makefile.postlink
> > @@ -10,6 +10,7 @@ __archpost:
> >
> >   -include include/config/auto.conf
> >   include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> >
> >   quiet_cmd_relocs_check = CHKREL  $@
> >   cmd_relocs_check =                                                  \
> > @@ -19,13 +20,6 @@ ifdef CONFIG_RELOCATABLE
> >   quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
> >   cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
> >
> > -quiet_cmd_relocs_strip = STRIPREL $@
> > -cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
> > -                                --remove-section='.rel__*'      \
> > -                                --remove-section='.rela.*'      \
> > -                                --remove-section='.rela__*' $@
> > -endif
> > -
> >   # `@true` prevents complaint when there is nothing to be done
> >
> >   vmlinux: FORCE
> > @@ -33,7 +27,7 @@ vmlinux: FORCE
> >   ifdef CONFIG_RELOCATABLE
> >       $(call if_changed,relocs_check)
> >       $(call if_changed,cp_vmlinux_relocs)
> > -     $(call if_changed,relocs_strip)
> > +     $(call if_changed,strip_relocs)
> >   endif
> >
> >   clean:
> > diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> > index df82f5410769..1ae5478cd6ac 100644
> > --- a/arch/s390/Makefile.postlink
> > +++ b/arch/s390/Makefile.postlink
> > @@ -11,6 +11,7 @@ __archpost:
> >
> >   -include include/config/auto.conf
> >   include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> >
> >   CMD_RELOCS=arch/s390/tools/relocs
> >   OUT_RELOCS = arch/s390/boot
> > @@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
> >       mkdir -p $(OUT_RELOCS); \
> >       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
> >
> > -quiet_cmd_strip_relocs = RSTRIP  $@
> > -      cmd_strip_relocs = \
> > -     $(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> > -                --remove-section='.rela.*' --remove-section='.rela__*' $@
> > -
> >   vmlinux: FORCE
> >       $(call cmd,relocs)
> >       $(call cmd,strip_relocs)
> > diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> > index fef2e977cc7d..8b8a68162c94 100644
> > --- a/arch/x86/Makefile.postlink
> > +++ b/arch/x86/Makefile.postlink
> > @@ -11,6 +11,7 @@ __archpost:
> >
> >   -include include/config/auto.conf
> >   include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> >
> >   CMD_RELOCS = arch/x86/tools/relocs
> >   OUT_RELOCS = arch/x86/boot/compressed
> > @@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
> >       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
> >       $(CMD_RELOCS) --abs-relocs $@
> >
> > -quiet_cmd_strip_relocs = RSTRIP  $@
> > -      cmd_strip_relocs = \
> > -     $(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> > -                --remove-section='.rela.*' --remove-section='.rela__*' $@
> > -
> >   # `@true` prevents complaint when there is nothing to be done
> >
> >   vmlinux: FORCE
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 7395200538da..f604f51d23ca 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
> >   quiet_cmd_objcopy = OBJCOPY $@
> >   cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
> >
> > +quiet_cmd_strip_relocs = RSTRIP  $@
> > +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> > +
> >   # Gzip
> >   # ---------------------------------------------------------------------------
> >
>
> Fails on RISC-V with:
>
>    LD      vmlinux
>    NM      System.map
>    SORTTAB vmlinux
> arch/riscv/Makefile.postlink:41: *** missing 'endif'.  Stop.
> make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 2
> make[2]: *** Deleting file 'vmlinux'
> make[1]: *** [/home/ubuntu/xfer/linux/Makefile:1167: vmlinux] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> Command exited with non-zero status 2
>
> I think you need to put that deleted "endif" back in.
>

Yeah, sorry about that, and thanks for testing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
