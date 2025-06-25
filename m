Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A6CC7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwrAzf44ObTV3VeAa0kSl2Adgax6arhQGz3z5HXcsoU=; b=3+7TZatQNz2lmP
	dN7FAJ0r1SrC2q6A5/u4cRzqBNc+yeFUEbe1lfT20D59yUx/HayMeVFZkn8lTRWsN0GJH0Va3XaUI
	uilLyfrJVV9NzTzesY+MePIvsJsOR5gpp3Bt7ArcyinOWWLk2Jpn3xC9/ZV5sFRT2SMgO8IM09mOq
	71m4UTTqs9kwJ67jQ0DSYKWIz1zwawX3BQfUBgy4j4/XmbJOvfJ/QvE9ShsCjmNReE1Gchj5vlZQp
	WnT00apKsVR0v+lpV0R6rMd9PgsvBlaq4bxUNWssxUNh6ib9pDjrMxa0dD9XplN+iysxVTHJDJNJj
	igERXUhiW+rvjGlUJiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNyG-00000008Q6B-1Fcq;
	Wed, 25 Jun 2025 11:07:16 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMzX-00000008FIf-1XBG
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 10:04:32 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so5746694276.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845870; x=1751450670; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2FoYZ4Nr01R53huec/tf1xznQvupBhVO4tbylq2xKes=;
        b=AOOl2UGyqEzDQWMThw52s0fhHroBKN6q7+Jr2RNwqsdH0RzcdUOGNLZgDzLcoJGhKR
         XxKW2RmjyKnzPdP0lenOiA/BCch9k13UclnscJ0AQR4dGrnmWNw53bI0n2o44jw8YWXu
         mIDOXYeMrOxsfqAON2rTZ0PzpN1wbtrZGXaKMWhfovWp0x00OpdYzFQmRPpDN/t0y1Ik
         yb9SAzyoTEKLov61N1osYuO1XG1zSF37DsF841vJkS2dkek5aV8VNA++xaWPhcbDvYdD
         9PQ+mIFg30Gh+HE1Ax4MmBLEycmGzrjdQ47qya9+d0V0sg+Qu94l5kMPhkrjVss3C59h
         N5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845870; x=1751450670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FoYZ4Nr01R53huec/tf1xznQvupBhVO4tbylq2xKes=;
        b=M0b6PhO04ScFK7Cz58MGLxrp9dVZeTn9wXriv6+8SQan/M10O53fu9oGMqQtSWP2YZ
         Q2hs9AcgHlgElcW+1SGVMxkdgaeyBw728jdz9pnqyaIzceOVyoqfjey29x1GbEAlalyp
         VLUVkev/3sUb9BXpb6pKb6J8zfS4Js8DjlyGa9Ro7e6Ui6oz+iz1H37h5lRCPPnrQ57f
         a1/bVz49eAogbzEsj+DDfcZgDP6z9lj3pczx1Q6tbmc4+377TERv/pTiqze4JSyYWJXJ
         vYRtvlBNI7LSDGjgTzQltL9QTRRyH5hT665wN5zOYJCqT2154MWpb872c4eXQ2o7+Ii+
         yqoA==
X-Forwarded-Encrypted: i=1; AJvYcCW14z+5k3/VPuHWG+GWOtSZXFIwTfeKkVW8tj6n0B+p2gQGBitYAssj5xtYRfdcpGQsgcZqBAvnzS9Zug==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOPHBYQU2UmczHyZNWU/2RtTiufj5JHFk39io50uFWSsm3W24G
	yKxOnfYUQLSft8N4m88+CJKPHzFFMbXgovCqfSPoGJ5XvZBVghep2C92fFdjdcHCLRZQOMP8s87
	ZsOxlzwr1c54uPoSd2MO7f4jzj+mFTwvMTMOw0kFy5Q==
X-Gm-Gg: ASbGncu5RJpQrqgOo2V5ItIzwq+OcPTL48wMfYeO/UJfCO+aFvPWgw8pzq/DmCN+AcK
	RymzF2N00tLznhJ2zMnSOdEZuYlD500+PMUky+yy+1Mbt5PHiCjiPRmLPMql6vkWPhDR2iYmvda
	21h7ZLl9DWr+DXBrwH9TB42KOH07QZTBcY310keuCeHi4=
X-Google-Smtp-Source: AGHT+IGEwF//unOd8KqnIb3kUSk3TkEl6eAh1VfDQazORQUWho3pyKqqzApD4UjhgThjUzADzPYQsRLphHC9Om0O8cU=
X-Received: by 2002:a05:6902:100e:b0:e81:4a97:b8dc with SMTP id
 3f1490d57ef6-e86019b93abmr2658200276.48.1750845870308; Wed, 25 Jun 2025
 03:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:03:54 +0200
X-Gm-Features: Ac12FXxb7NJQLDFAGAZjqxBIaCwRE2IAI0_rkmMKymSaefvVyWHj4pimfXs-K_g
Message-ID: <CAPDyKFqUZ4pVPgrWfCjH2dDBPRs37L9nc_tAqOtUR=0hzweKVA@mail.gmail.com>
Subject: Re: [PATCH 0/5] pwrseq: replace magic numbers with defines for
 match() return values
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_030431_415875_8570B291 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, 24 Jun 2025 at 16:32, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> We currently use 0 or 1 as magic numbers returned from the match()
> callback. It's more readable to replace them with proper defines whose
> names indicate the meaning. While at it: fix a build issue with the
> thead-gpu driver I noticed and extend build coverage for the drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (5):
>       pwrseq: thead-gpu: add missing header
>       pwrseq: extend build coverage for pwrseq drivers with COMPILE_TEST=y
>       pwrseq: add defines for return values of the match() callback
>       pwrseq: qcom-wcn: use new defines for match() return values
>       pwrseq: thead-gpu: use new defines for match() return values
>
>  drivers/power/sequencing/Kconfig            |  4 ++--
>  drivers/power/sequencing/core.c             |  6 +++---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c  |  8 ++++----
>  drivers/power/sequencing/pwrseq-thead-gpu.c | 12 +++++++-----
>  include/linux/pwrseq/provider.h             |  3 +++
>  5 files changed, 19 insertions(+), 14 deletions(-)
> ---
> base-commit: d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3
> change-id: 20250624-pwrseq-match-defines-aec46817e69e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

For the series, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
