Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20482C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 11:18:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF83B64DDA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 11:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF83B64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NGmxm/DPK14dFuYnhwUcCMHW5KnVgDH110rcy74AZ5U=; b=1zwsm0lf8Gd7G4TDvqT0TKbcq
	9sB1nYHpLAkVK3AElfbwZ1/FIxXL45xPLo49V5Z1ZjFok1vsXfC6QBnrpe6wX/2saTA2B2UuKp/ez
	/VbOiM9dFQmMrjdO6SHAg9hDmz6b9CE2sO9I48bCQImyhlHzRue9SgUm7F9agNdaE+l6cfaroxgxa
	3cQCKhvZPrxOlWM2zo5eS4Z2qGUbR8K0KUGtl0+cHWEqLkqzSIdSd1SwktV+XtAtNzSviKsmNsG/a
	JfBroZS2XqJ5cPJGvnhPgroh7U42XkeFvuR/MAUzfPE+wQJz7yLXM2FMZXNWL5jgirnDerml/tBc7
	Ehe/Nfy/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lByMZ-00054N-1F; Tue, 16 Feb 2021 11:17:51 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lByMU-00053P-Lk
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 11:17:48 +0000
Received: by mail-qk1-x72c.google.com with SMTP id h8so9005170qkk.6
 for <linux-riscv@lists.infradead.org>; Tue, 16 Feb 2021 03:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yi48HIfDpj5+7cpoyDCNHw6yQcq1pcG1ot9n73mhd0=;
 b=YxaffVO7zp8rEiGeTbUX5Ki7tJ11g4dLfSxGlgdZKFGK+KHuDT0SyDQ4UZT9KqKHnJ
 PoA1Jd/7CZfFmqu6gfGH0WTjueyUz5dR778ADBSSVfKqYgCXQYzhrrn15o8FvpD3wahn
 cZzilJtE3Y+oxQ1168aV2Ewfth8SUlPyWcfrTkiETPp5e6qIytcY4Ru3vRwC3Ret2fnY
 s8+DxfClW49UgRZhNDCa0sxVclRXzpZQ6WqMZS3krzNGOYK6niAh5aDw2gkWU8GGQkc7
 fFfyB6OaiYnO3EsONDuqdH5L8VvZ/tfU9NlpKMSddG3pc4SkYCOC98ACXwOnK6t0+wQc
 SGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yi48HIfDpj5+7cpoyDCNHw6yQcq1pcG1ot9n73mhd0=;
 b=f7B/NuVQhSMXTDptRn+U74Zdxtj3Pi97uQsyAgDu3hqjb2DyOcaA8D/BqGqYGiArRg
 swKhIyC5ICT8jZwlxPlOLIvtNqG3ck/gAtb+egfd9fdXW59kWGlmdgpAXyK4I8J4L8M7
 ojXEJASKv5xBVhr4U8Gv2Z3l6KrbB/olnZhlJetUFZjwj/sxEkQHSsIrIE9xXG3aSHD1
 qQnr3Wc1Eu+yD43xfwvViTOE6Iqd9hIYHkvOSkYg2G2DCWEHmBOLYhZqyI6Iso/bwll6
 QZKFdjYDG6E1X3uCdz5UmhBGpXuDXuBRVjGRT2xtIEKNMJ9FKvfrp+G8P2p6KboNGKqY
 Oi6A==
X-Gm-Message-State: AOAM5328DhU9FuXXsPqHWlwPERJpEDOheNjXB3xAER/hRK3kKk1EDMVV
 lbFVpWsBorCPcyCER60by8iVKF+8EG4vLc2Q6MZUVQ==
X-Google-Smtp-Source: ABdhPJw2r0P+hO2e4Iij8XvdrpsMfa2arPuuYzhNYRXRfcj44xEPwBv3l/b8pplhPflEoRK8Fk16ikz1mbXxTpXZixg=
X-Received: by 2002:a37:a757:: with SMTP id q84mr18474346qke.501.1613474262101; 
 Tue, 16 Feb 2021 03:17:42 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
In-Reply-To: <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 16 Feb 2021 12:17:30 +0100
Message-ID: <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
Subject: Re: riscv+KASAN does not boot
To: Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_061746_850352_E4DA4F46 
X-CRM114-Status: GOOD (  19.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Topel <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 9:11 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > I was fixing KASAN support for my sv48 patchset so I took a look at your
> > issue: I built a kernel on top of the branch riscv/fixes using
> > https://github.com/google/syzkaller/blob/269d24e857a757d09a898086a2fa6fa5d827c3e1/dashboard/config/linux/upstream-riscv64-kasan.config
> > and Buildroot 2020.11. I have the warnings regarding the use of
> > __virt_to_phys on wrong addresses (but that's normal since this function
> > is used in virt_addr_valid) but not the segfaults you describe.
>
> Hi Alex,
>
> Let me try to rebuild buildroot image. Maybe there was something wrong
> with my build, though, I did 'make clean' before doing. But at the
> same time it worked back in June...
>
> Re WARNINGs, they indicate kernel bugs. I am working on setting up a
> syzbot instance on riscv. If there a WARNING during boot then the
> kernel will be marked as broken. No further testing will happen.
> Is it a mis-use of WARN_ON? If so, could anybody please remove it or
> replace it with pr_err.


Hi,

I've localized one issue with riscv/KASAN:
KASAN breaks VDSO and that's I think the root cause of weird faults I
saw earlier. The following patch fixes it.
Could somebody please upstream this fix? I don't know how to add/run
tests for this.
Thanks

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 0cfd6da784f84..cf3a383c1799d 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -35,6 +35,7 @@ CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
+KASAN_SANITIZE := n

 # Force dependency
 $(obj)/vdso.o: $(obj)/vdso.so

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
