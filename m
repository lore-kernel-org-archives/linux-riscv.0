Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10EAC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 05:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2ZJlIUw1YvvmekeJAjitx+pXVAtjOM+MWOOyr3LgUo=; b=Ap6iqM6yD05drB
	3ZZPFtm9nzHpHfp+GBv/ASWLRzZC9CiBROkXBO7FVKYjiDyIrZCrL0QEnvgRf0Iu6pCfeoXyZpopg
	6xzVF58uJBHfBvHfyS7PoTDx5NJ+hMTXotW8FlGRY/R2PbpFWsze266OdUl8GfLB3PubgP491akwm
	0t3urqUbWPFUSWVhOalbWmd0yQzJzMr3bFZIUt9S+4RSPDPuqwG2ZF4uvJSAoEXtMPT3pl+9P0900
	SScdj0w3FN3/i1aqPpO4B2ZCcQltsrEMAVJIVThfycHX4ogpE+gkyrT/YNJXNiQHebTKDOdnZ1IQB
	DdHxPnfpkjz1gbyEJ9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPGWD-00As1O-51; Tue, 07 Feb 2023 05:27:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPGW9-00As0O-0s
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 05:27:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id h3so4585834wrp.10
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 21:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pic1LJjyWpfcct/+zv0Lpg3rt8hI2DLNXSbKvivh93c=;
        b=nBAR0KjH/l2jjGcR9Xr1ro21SaZgBCarJ3rN4CtCCjKhhOeugF8ulgXTDxmRT2f+J6
         Nqwx+cPmPJZAwFnU80BRUDXsG4BQqc2gbEwAbYfrr3FKKkay1UPmQcnrZx3vbW86BINX
         fy2M+D1eprGv783ZlJSOj9yA+ZUMF9hwnaXDF0VgpF2RhDk1TZcvNnEov9/nV+9Wu8cK
         pGVKRuA9ESqzx+KqvQbpH2NmLQLuDL4LwpIY4hslMHAhP4geeVTq5P7C8wkU7vQ1vOB6
         b5W01RhWscT6VCpAB3BstdhfgatVEWxO7LpExyAzRRA7A3Ayv94T425r04jC2q7Yt9TA
         vzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pic1LJjyWpfcct/+zv0Lpg3rt8hI2DLNXSbKvivh93c=;
        b=qdPwtZRrbuSW8VSuvUSHHE6UXrsRM/qRIJJB8ZCTERG7UEs91VZEb3Hs4PXS1yC+LJ
         OstyFIfHdHGYYgItw73slGZ3SRHlTaSqQQub4a5TFZDTfcXKs8LDk01FIbxZ+bjAtp6E
         kgdz+2SlLl1PIbKNtKRil8XZy4dB+7g7pt1ZccpUVHda/aqZ/nin8iDrq1jhKxpSjN7s
         Ro89spY+0FOXBmbd5/lJYOkw4K36Exuu6rcsHfdQVC3OCuIqyLfeF2jg82T0jYczB5S0
         FycKlX0TCq1K68pukf+O/bdKfYZNt17+b8IGYEMcv+GSYRke54hTSEon0MnhSCP80jpB
         V5VA==
X-Gm-Message-State: AO0yUKXTkwDkRk3GsNXBMLflTPnzG/i04ncCrKELzAc8BeTSlaHRiDFe
	WI4UO2ZownVeWdWhku/WQSelg3+iXTNqB3Rl8v6pWw==
X-Google-Smtp-Source: AK7set9lQaGexiAgaewKZPShLQdX151xlXRI4LpyIUWlNBRZu/5KXeQ28JBNiCY5jw1nxP6ssLpbcGJ1Mki6x4ZRQ1c=
X-Received: by 2002:a5d:5272:0:b0:2c3:e046:57a8 with SMTP id
 l18-20020a5d5272000000b002c3e04657a8mr41876wrc.55.1675747660689; Mon, 06 Feb
 2023 21:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-5-jeeheng.sia@starfivetech.com> <Y9hTGo6dfgeusW4B@spud>
 <CAHVXubgoi8FsfdAXVocL=ZcfGT=mA72uiq60jPVJB52ovKhdzA@mail.gmail.com> <167319074e1644868e0e5461590f7ada@EXMBX066.cuchost.com>
In-Reply-To: <167319074e1644868e0e5461590f7ada@EXMBX066.cuchost.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 7 Feb 2023 06:27:29 +0100
Message-ID: <CAHVXubiW5grsq=nDto8HdiHiRXv3H_A2GtJ8+UL12nDvZj-NOg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Mason Huo <mason.huo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_212745_297363_FAAC1380 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Feb 7, 2023 at 5:58 AM JeeHeng Sia <jeeheng.sia@starfivetech.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Sent: Tuesday, 31 January, 2023 6:00 PM
> > To: Conor Dooley <conor@kernel.org>
> > Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-
> > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo
> > <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v3 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> >
> > Hi,
> >
> > On Tue, Jan 31, 2023 at 12:30 AM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > +CC Alex
> > >
> > > Alex, could you take a look at the page table bits here when you get a
> > > chance please?
> >
> > Yes, I'll do that soon.
> Hi Alex, do you have any comment? I shall send out the v4 soon and you can provide comment to the v4 series?

I'll do that today!

> >
> > Thanks,
> >
> > Alex
> >
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
