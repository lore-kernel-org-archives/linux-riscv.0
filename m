Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FBDC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 21:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n33ThEn/7HF4rSWQeS3GMIt4ZHwKvFE30gU9raboaCc=; b=04KT1JIoNovC/T
	feA0h5GFsoCZ+C36u64OT1ervqtiTD+Lg/X3wkf66RYQa23m6VwRn1fssG9c0YtYj5M+knWtGuzyN
	1ZxgDoscNpmR0kwV/a6zHgy3j85JTRh/b2k+mW0OszUlVL4xZuXdBpvCQsx22yIqM4n7J3xMH3JNv
	s4LtKvcEnl21T4MyONvT83cqN23AFyZiLIyYYleINUPNWW+BS0u0X50lCs7EFpWJJU1mKeAAOdO+d
	Vg+lM6EL2Rh6hbEJaUczmZgUiShsp6uWjWbM2Ti7DanPDfHAWuPjvsI4EFW/bFcu9yHYHtud34HGG
	MbbNEmZOphetuGvmyA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQb8F-007g6I-5l; Fri, 10 Feb 2023 21:40:35 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQb8B-007g45-Fl
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 21:40:33 +0000
Received: by mail-qt1-x82f.google.com with SMTP id v17so7438231qto.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3m9mzJgOmnFAF5E0Gh0vvMFl+gWOnJrG3P7Q4uZSJpM=;
        b=FOi8JipCBRS4V2YpboOf6h+LHfc6tY/smSivYw/m4bY4jZrzqvh3gz2idzc5tQB1+t
         hQRjx2QqCo7xme8NhWMMW6u5qbmNOvEG8okPyM1dxzcQoTbqto0ouvsGAagiZOQhQpMi
         MiKCe1lWZH/9GSRVrlkAflx2j8L0KUq9c8HRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m9mzJgOmnFAF5E0Gh0vvMFl+gWOnJrG3P7Q4uZSJpM=;
        b=WN6ivdNtjgMHedgXKW2fTDhKpfmB4rx0aVP/re26WSYTOIr3EN4LK68YRQzzhZCrO2
         q2PhUULS/HuufwHdADWAIcPNAAjdfoF1O+ORvd7Wox7M0e8ULYmDb99V4LpXYQ6Tzu8r
         OJIfZ5KIxZUjtWpo/y/8GGitekngtLfsaPjWF4OMdY7fViKRZARmbU2Gt+vRCIOAxYFJ
         V8Qzaj/WvL6kJUzIrHaCpbzsTT2r34I3v9ZSGbzaJXS2gBTqMOhb3A/Y4lF9DPRKW9ZB
         2Jt2JmTjZgWGA/XD2oKME0Cp+puj54RSj74YuSPppXxULjhsqTZqGWzH6grxCrE2b89E
         8yZw==
X-Gm-Message-State: AO0yUKWqt1QDFceXziPwaBEtoja8Qk8UOb2/k+k+ygWuRyuLcDB6hghQ
	+4Rk6k7D8SIRePf+mSeWaDgWkg==
X-Google-Smtp-Source: AK7set/7a0yNk56qgYviH/1+i942jj2RD2aQW+Bo+LGwkbPTZQ+WzHt/8LIGq6IOB3WUmRtbiXvGwg==
X-Received: by 2002:a05:622a:4c14:b0:3b9:bc8c:c1ff with SMTP id ey20-20020a05622a4c1400b003b9bc8cc1ffmr12609691qtb.10.1676065222795;
        Fri, 10 Feb 2023 13:40:22 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id b65-20020a378044000000b0071f0054b094sm4266837qkd.43.2023.02.10.13.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:40:22 -0800 (PST)
Date: Fri, 10 Feb 2023 16:40:20 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: RISC-V Patchwork
Message-ID: <20230210214020.dyaqddrjlymh5i5s@nitro.local>
References: <Y0ifX4gYDD0DIkYd@spud>
 <mhng-ec7cf859-caaa-4b72-8dd9-d88e81d6126a@palmer-ri-x1c9a>
 <Y0moBigLHn5HulNi@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0moBigLHn5HulNi@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_134031_558259_203D4721 
X-CRM114-Status: GOOD (  17.72  )
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

On Fri, Oct 14, 2022 at 07:18:46PM +0100, Conor Dooley wrote:
> > > I just copied the suggested scissors format from the git-mailinfo man
> > > page and pasted that. I didn't know this prior to 5 mins ago, but
> > > `b4 mbox` splits it on the scissors line, into a patch and an email
> > > inside the mbox - but for w/e reason, `git am` (or `b4 shazam`) then
> > > seems to try and apply the email instead of the patch? Or else pasting
> > > the patch into mutt was a terrible idea? Maybe it's worth mentioning to
> > > Konstantin that things get messed up here, I'll do it tomorrow if I
> > > remember.
> > 
> > If the man pages suggest doing this but the tools fail then it's worth
> > fixing something, even if it's just the man page ;)
> 
> Konstantin, perhaps you can shed some light on what's happening here?
> FWIW I see this on 0.10.0-dev-d8d41.

Sorry, just going through my old mail and I noticed that I never followed up
on this. We added full ability to support scissors with b4-0.11.

Cheers,
-K

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
