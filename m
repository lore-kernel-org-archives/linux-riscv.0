Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5011C2D0CD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urTpGamv1yR/KXbzf0VUloT0mtOClMTb0IO7weMfKXg=; b=B3DslLjprCL8gV
	/YQLq6bV71RRyMjKjUCwRayhq35SbslmchEX5D0oDV+G3INr19BIEpR3QXnQI//AXQ1eDfON3npmr
	RWxdjzxO+0FZqej0ND4nG/0STpHEpA6Dpp6kSX5dhWhsYK42zqSpcMJ5vHolCHFdN933ZjT3q2n9s
	QCh0S82W3YwD8SA92sDuYBrjhD5xucUy+JK+i6VnxqwYFquGy0CBcxIUriJiDGSulz2qjCPJXz9lr
	9KV79OMalSDly8ixCLbUIcXDvzBVazeoRvIPfKT5HcFp7il1/fcYa57hl9zWy7u2Jx+JGdslDGlgO
	QuDDEiD3ElJ3S13WOJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGysz-000000092Tp-0ck7;
	Mon, 19 May 2025 11:42:25 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGysw-000000092Sl-3yOV
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 11:42:24 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso3535611276.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654942; x=1748259742; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xi4QP+tb++uj0FmPaNWal/Va1UBFazasXzcN4zOZKIQ=;
        b=hOpUoPtZvKTvaTnMXI94Eh2foZaQb0CV3GSFcTWL6ozt0039cIKNynKrojN2Nz9b7W
         nKSgCRpmcfLQu7REyYcSZG7jjJ40IKO6EDs0NWWKD6RwZ1jZWV+/aYoRcNi8DIA9lhHf
         3WT48kb1SIjk1yoeR+hcWgqcZHYuzoUcsY/mnbOizj2STUsbA5Su6OUmpjWmNZ/d0YKI
         YjqX1JcvNTvBUag+w5pEK6LBfv5Xe4D/l1MoeD5paq/qXA58PW0FzjZfiIewIJXl1/5s
         NkmrukSmj+YIbNyFdsMgNjFfvQ/6E79pWfWR9/cB+l3ORvwwm3yJ45/P9cNxiPxjZsYC
         hQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654942; x=1748259742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xi4QP+tb++uj0FmPaNWal/Va1UBFazasXzcN4zOZKIQ=;
        b=tWtopKwzV/c5uklHj+2u6d0Pg9PRJ6G+sLRGRHl6bUaC50v4ioqwLb/jZhopG4NHtS
         i477UmBUIOgNMX6+OqU6Tq+C2KV4fTHpFiYicQOnRff14RW85qD0vKiqsRAgesFSADLG
         lIfnek1jdeq7H2bQFW0Xnz8TyDHJFlI3gcLv1zKGxBl7HgDIzjzFtNq1FQBoH3Jh/qwf
         TaDYZELeFNjv9g9GxVmQBGZanCu/x9zny+915QCjppp9bNlekObCKdTV02R01+Lx4ior
         0nnij/+1lqguK0GuhUCJ4zWr1NKn8bMz8SlorLMm0o9fmURMBv5DGzxc2TJdB0+aDzqU
         dcPw==
X-Forwarded-Encrypted: i=1; AJvYcCUTNRXdAo0H8euEqZgGPI+u81fMXhUsCBjb6enOcvWyrjXTzyk5fTH12SLHtq2kYhmTKRDdYYuUxBOOtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRGRmzRqCYEBO0CqyWcOl3yWFsNdW6sowEuAwrH1MvnW6kODjU
	XeiWPPYxG8X7Xe34foBfGCGodZgzKEDIsQMSPS6tdeA+ZXkHYE54Gp66LzivegqjN+vLy7dYmav
	kIzuiJDxKzMQVj5Y50QygU2aiBtXMnTySUIPsP2CN1g==
X-Gm-Gg: ASbGnctskqUnXg/5ZLY2en26nHHUU4Mz7WN+n+OOPqyqvIWjTEKSyvukSUmRlkRaqc7
	4TJrD/uBbHixLLDeDvqix/8AUhLxSClS5i6wLHjp1y4vSs7JUQ384jmG6kzLoILZNDqOkdHfz8o
	jTm49/2BGk0xqRcC8/Eg+cMAkoxUS8+n59lg==
X-Google-Smtp-Source: AGHT+IFE9YTmql2J1EDYOQW1GURLdO1CuAEE1Qnz48P0JUcDipJN0t2wX+uqL9weWpYsYzTJL1jtg61xH036CqGhtyI=
X-Received: by 2002:a05:6902:10c3:b0:e78:f2a8:a69b with SMTP id
 3f1490d57ef6-e7b6d3dd2dfmr14389495276.17.1747654941775; Mon, 19 May 2025
 04:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org> <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
 <20250512075631-GYA517379@gentoo> <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
In-Reply-To: <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:41:46 +0200
X-Gm-Features: AX0GCFsB9fU8obeLDfkKRVtLEIl-4TRtUdQD79rwTQ1raKLz78xB0D2YGIo8yS4
Message-ID: <CAPDyKFrtH9AeHCiyJLv+F+tdVKJkhxcvcFj+wgqmAqN2CoC0jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_044222_994515_2CCB33E8 
X-CRM114-Status: GOOD (  20.47  )
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

On Mon, 19 May 2025 at 13:38, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 09:56, Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Ulf,
> >
> > On 09:04 Mon 12 May     , Adrian Hunter wrote:
> > > On 09/05/2025 16:22, Yixun Lan wrote:
> > > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > > SDIO, eMMC support, such as:
> > > >
> > > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > > - Compatible for 8bit eMMC5.1, up to HS400
> > > >
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > >
> > > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > >
> >
> > If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
> > the opportunity to queue for v6.16 as no big changes during these
> > two review cycles..
> >
> > I also know people who would expect to have a full rootfs support,
> > and this driver is sufficient to bring eMMC up and will make their
> > life of development easy..
> >
> > But if you have different opinion, then I'm totally fine to delay
> > it to next merge window, thanks
>
> I have been busy the last week, apoligize for the delay.
>
> I just posted a few minor comments on an earlier version, I didn't see
> v3 sorry. Anyway, should be pretty easy to address those comments. If
> you manage to send another version within the next couple of days I
> can certainly pick this up for v6.16.

Ehh, nevermind. I don't want to hold this back. I have picked this up for next.

Please address my comments on v2 as patches on top instead.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
