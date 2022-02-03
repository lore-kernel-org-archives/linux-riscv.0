Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5476C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Feb 2022 01:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PY8I9MyMqGc2bmBBnpK0EPvfiGAot6sHa+q7IhO/+dM=; b=NsjGe/kaP8qSQx
	DfCyetiYSq7jW1/VRFtNxTiR5ETe2L2joENnbn9GPIjNBYQNW61yvkn+SJeFxBGMAJC79Fj+fQuIX
	lRqrM95OTM3sQSBesP/lhlZV4dO7GtezWWUJpZe/Izj5oj1Ed7OSXT24vsZiU+R6yprTbxHVQCq0P
	GT68SEi2jsOauwec3U0LWpDScXErNFfwvuCp6Tmgz/pPaOAU6RA9eyD8nM+2lHzjFflq7r/uNG1x/
	jj2yEsiBzQ9MR1Ah27/pKInVBDPontkQNXaDMCBz7RGSKVVdjKF1UPwICv4XOlSymLYF3214lrW8h
	2imJYnR8FjlUecUKRhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFQVC-00HGa7-A7; Thu, 03 Feb 2022 01:01:34 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFQV9-00HGYD-KV
 for linux-riscv@lists.infradead.org; Thu, 03 Feb 2022 01:01:33 +0000
Received: by mail-qt1-x833.google.com with SMTP id r14so892786qtt.5
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JagqMAt85QEq7QG/F+4kNGpe+G2br22d2RC2rhBOnF4=;
 b=CtDJhAre6wbVCyp6Ck99vBgoZfbQxqvxD1vAHFQ2K2m89AomkhHPZEV8bcQHOwrJmh
 Ld8hSyr5YPDYM6/V3H96lEkfy7k1p7Vs2nZM1su/dHkxdsww3Q+SWsWM/PWendaCXkCE
 PSg91X1AStkrdpnKlYE/VYfHFCDwn5tkVxD9sv4L3udMbHacXqp9z3mca89OEqCbfhTq
 PjeLyEob4cyq5zZMWKTstnDZ9QqfMONkqXm9vHjMBL9v/hoTTuKBVerXrDSx4h6B6RMS
 4m2xe4SIlPg78t56A/8eCtdiwKNrb6I4JT3va2InIPcNO1sHhgLw42wnvqQ4tiZWGc78
 JgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JagqMAt85QEq7QG/F+4kNGpe+G2br22d2RC2rhBOnF4=;
 b=UHLoH1d2BEtIJussCOjbamscuYaqwLOJ5q/2++oQCWqF+jEl9QP+l9I6YjIxDfSyIf
 iqOGb89q2zLRMs2+Bqoygtg23zfSu6CcLN/mKdpUNKFIZXQsmpKhhL4mXAHIwOdiV7bz
 MuFP0at6Le2/3/CogZyuxRNVf5dRNr+OK9bCbNYz2FgnHWmHcnfTTBZhuRUZp5/Osq18
 0FcksJZQ8UYMUYe3+hHCLY2/ezHgw96mFBQKdRXRl/hvt2WmHu0YnWQMro2mwxPPcFax
 SQUymKmU9YZ5XOvq1LmUFiNbdO/IxLyUCJ7Qnlz15TX/0nuay5gSkPfaeYvABQjG6QGc
 gXvQ==
X-Gm-Message-State: AOAM531d0Mqn0jzxfaYgR8eArpgdsJYYwZXKg93/oiIxZA1o39H5YfzN
 J7kXZROydGAVcbpCqrG4Uf4=
X-Google-Smtp-Source: ABdhPJyaHUHRoJ/EkOknro4ewQtKipU56FxmHyAl2nWgInj0hR2lQMWqI7alLaEn8xYPIaQbX5IX5g==
X-Received: by 2002:a05:622a:130e:: with SMTP id
 v14mr25101910qtk.355.1643850089839; 
 Wed, 02 Feb 2022 17:01:29 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id j13sm10149462qko.46.2022.02.02.17.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 17:01:29 -0800 (PST)
Date: Thu, 3 Feb 2022 09:01:23 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Changbin Du <changbin.du@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
Message-ID: <20220203010123.yo3go6lq5t7hglor@mail.google.com>
References: <20220201013257.17926-1-changbin.du@gmail.com>
 <CAKwvOd=fCCjSfz6tW3514ifZOMw2PT4AZiFExq1qqG1rxf5fEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=fCCjSfz6tW3514ifZOMw2PT4AZiFExq1qqG1rxf5fEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_170131_715023_75AE2E60 
X-CRM114-Status: GOOD (  23.94  )
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

On Tue, Feb 01, 2022 at 11:42:59AM -0800, Nick Desaulniers wrote:
> On Mon, Jan 31, 2022 at 5:33 PM Changbin Du <changbin.du@gmail.com> wrote:
> 
> Make sure to mark the version of your patches (this is v2, IIUC). `git
> format-patch -v2 HEAD~`
>
Sure, I fogot to add version NO. this time. Thanks for your reminding.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> >
> > The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
> > '.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
> > And they might overlap with handwritten symbols.
> >
> > Before this change, a dumpstack shows a local symbol for epc:
> > [    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
> > [    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
> > [    0.040452][    T0]  ra : restore_all+0x12/0x6e
> >
> > The simple solution is that we can ignore all local labels prefixed by '.L'.
> > For handwritten symbols which need to be preserved should drop the '.L'
> > prefix.
> >
> > After this change, the C defined symbol is shown so we can locate the
> > problematical code immediately:
> > [    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
> > [    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
> > [    0.036567][    T0]  ra : restore_all+0x12/0x6e
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  scripts/kallsyms.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 54ad86d13784..8caabddf817c 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
> >         /* Symbol names that begin with the following are ignored.*/
> >         static const char * const ignored_prefixes[] = {
> >                 "$",                    /* local symbols for ARM, MIPS, etc. */
> > -               ".LASANPC",             /* s390 kasan local symbols */
> > +               ".L",                   /* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
> >                 "__crc_",               /* modversions */
> >                 "__efistub_",           /* arm64 EFI stub namespace */
> >                 "__kvm_nvhe_",          /* arm64 non-VHE KVM namespace */
> > --
> > 2.32.0
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
