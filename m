Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEFEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 04:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irLIKeeihirYn63JeCZErt876T+TzYgoovSLao8QWec=; b=jVg/HsoFm9gdZO
	SpUmAdyuxk5mIgEodiuaTPpPmG1UOPmthxCt6L1sPrBpxXqF3HfMH+6wldIabmEkRQKJWs9cL6Zez
	wLI4Ybzi68O+s++/mtmmqpYRgXEuQtjfXog05BzPen6O9jk6toD97gkFWQL85FMbsR+unaGBLeMz2
	YN5zOj5xqrXZLi4xAuf6tgR4toqITozAvVyLXtixU3js4ucAysLB5J3FDYH9lzZ8miBRhp/mHWg/9
	sFwT3rUGmUP5UsrEYNnPYXQbsF21bHNajZ7NHepOO+E77WbWVthb2c89gLmWQhORvwEdcXI+IpiW/
	8NrPJWJzxHIMfwe8Uw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9gOu-000FIl-97; Tue, 18 Jan 2022 04:47:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9gOr-000FHm-Pd
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 04:47:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso1447600wma.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vbQZn4Jtn1Jk8a2/mzv3m3CnTM5iuSLJBXe/KYGd1R8=;
 b=QOZXRlND6eY5fQOGmwZBPOrtNWgku9Hstqcq29bp4x+mKq/hu5x6Z7ubXH8/+439Iy
 Zob7cD2fJoC6Otk4BiGbnWgN4dkWWeuR2wSgWgI8niwTdtdtAWr+eUY/vJ7lqSnXLsZ0
 PZZMcfQbRqPLF0laIf0OJ1Q58rd3WumlZBBzqdQQKtOe2rors0acZpKp/5O1K11AduAO
 8ZYlMFAJ2hYETAKOeP/x/xbIIcTX15hco0a09I3y1wK2HKTku+0e4p5aF5UqiHtPTFAU
 ORTVWEbo9I+0xkr7aVkm8EghaRjnPNhnr4nc3WPXKxbu6GA5tLns/2EbwyenBDhjyxJ4
 khnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vbQZn4Jtn1Jk8a2/mzv3m3CnTM5iuSLJBXe/KYGd1R8=;
 b=f0ULNVDrXDalHZDFxD8tJSWVbnYs9SvxvOXaL5pYrVstDCCAUAadMCOEco2clGd3ka
 NSCM7h0oO7bmNXfAyR/j1gTn0zyy6jlAChyOd3XIhzrLCPpPEmAlrp5J1zEhQNAlPMYy
 kPrrngj3WZC0+SIMYXV48MjdCxxbpT4gHgfke1SoW3k01ywuncc54rFLaoY8t9g+oAhX
 GagQnNHXFCeEDVtDVXaD3PFu1c29pqdtmN+sZxYQf4WMscvb9872f1omXrLrhSt6aEaw
 VPhnQQWivC+NgpeI82gKR7clir23ebMMO6A/r2/MQlz/qoJHLcI/rc15ZQQpTYV5vhlH
 d8Yw==
X-Gm-Message-State: AOAM531YolpMy8equmtkNUXkcBMR8/MG6zivzzf3TSUbTYGRxHYbdwSy
 khWqo9ROSgGQBtLUC0AKPx78Lw==
X-Google-Smtp-Source: ABdhPJziN2goAsnQIAU4ZCXYn2kOvWFxUiJL5qGU+UCb7RMCIq/uJFrgGHpvNY99OgVMyW9jlnkLFA==
X-Received: by 2002:a05:600c:2216:: with SMTP id
 z22mr1035662wml.119.1642481235411; 
 Mon, 17 Jan 2022 20:47:15 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id g12sm15350962wrm.109.2022.01.17.20.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 20:47:15 -0800 (PST)
Date: Tue, 18 Jan 2022 10:17:04 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Abner Chang <abner.chang@hpe.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Question regarding "boot-hartid" DT node
Message-ID: <20220118044704.GA3734@sunil-ThinkPad-T490>
References: <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
 <CAOnJCU+taK16cnfnQtk3QM3s-f4RCUTWENAPe8Nhs-8L29vKew@mail.gmail.com>
 <d7f57c7f-a02c-c245-e1ef-af30bc9f6998@canonical.com>
 <CAMj1kXHXFXSojAUz6EDeoTkqD5AxeFTffA=RyTu5JnsAsAHsfg@mail.gmail.com>
 <20220113094448.GA15466@sunil-ThinkPad-T490>
 <CAMj1kXFU2TeywomSK5anCUihu1Ts-=OwSDEAJS5hq+vRc82c5Q@mail.gmail.com>
 <20220113095913.GA17107@sunil-ThinkPad-T490>
 <CAMj1kXGLLd5tK+rahpMrS+OV+Abmo6bkPUs0e2Z1wZhngoyzAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGLLd5tK+rahpMrS+OV+Abmo6bkPUs0e2Z1wZhngoyzAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_204717_869894_9A78DCAB 
X-CRM114-Status: GOOD (  19.59  )
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

On Thu, Jan 13, 2022 at 11:01:10AM +0100, Ard Biesheuvel wrote:
> On Thu, 13 Jan 2022 at 10:59, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Thu, Jan 13, 2022 at 10:50:11AM +0100, Ard Biesheuvel wrote:
> > > > Hi Ard,
> > > >    Here is the draft EFI_RISCV_BOOT_PROTOCOL specification.
> > > >    https://github.com/riscv-non-isa/riscv-uefi/releases/download/0.3/EFI_RISCV_PROTOCOL-spec.pdf
> > > >
> > > >    If you are fine with this, we can freeze this spec. Thanks a lot for
> > > >    your help on this.
> > >
> > > Please don't use the EFI_ prefix, it is reserved for protocols that
> > > are defined in the UEFI or PI specifications.
> >
> > Oh OK. I didn't know that. TCG2 protocols also start with EFI prefix. Is
> > that a mistake?
> >
> 
> Yes.
> 
> > Would "RISCV_EFI_BOOT_PROTOCOL" be better?
> >
> 
> Yes, or RISCV_BOOT_PROTOCOL. The EFI is kind of redundant since we are
> dealing with a EFI protocol.
Thanks a lot!, Ard. While I agree EFI is kind of redundant, I still prefer to
keep it. Since RISC-V supports both EFI and non-EFI systems, having EFI
clearly indicates this is for EFI systems.

Thanks
Sunil

> 
> > Thanks
> > Sunil
> > >
> > > Other than that, this looks fine to me.
> > >
> > > --
> > > Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
