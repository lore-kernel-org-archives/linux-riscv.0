Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B2C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4NF5FiS2cg6kO2G49Yx8CO/aK2lCjD/xP+jygOOnDQQ=; b=XXZQ7KM9qYH6o7TmlGRQPmDUIh
	qmO0C4QTlsg7hqdpbgm7MHAlXPwcE1ALwhdnzbsHRd+7zpNZobTy1jl1G7SclS0LTMLPD6XVRc6gS
	8qRyDP6+hK1kxkn5up2kuiUjiSfmjshVlVZyrj169yNafJAz/puPomn8sBJP5YB32ZIObuSnzI+J7
	rEPIIXasZhJGp0zrEyAqtYOoEfjNt6Wmb8q40T88FEBFQwsUM6mKWNEOeSwvz+U7DI6oQ+lRwDCx7
	MyHAtY5PTchE6SvLQcvC/Yb202vNP8edKJLnHnKY9RqLD3QGj/njA/J0nyr0qbwx093Ye+i+fd3tE
	pM8W/KFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUlL-00A9F3-91; Tue, 22 Nov 2022 15:00:39 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUko-00A91e-22
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 15:00:12 +0000
Received: by mail-pg1-x533.google.com with SMTP id b62so14336864pgc.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 07:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8Tw5fHcTZzbSzK7WDa8C+XaUgJaXo0qN5pr/H7EMQA=;
        b=kkmL/Pp+l8cRUF1T+0CM/AEUlrcG+6/tnZorn1meU+SYKYzMtn4tE9qzuJlXl2024P
         sQ/PQqLJdNLjfUueWVQlNXIYFQ72gaWL+OfYfPelScZtSMZzAJv/0SOtLgc9jZKY4BK6
         9uaJf555bvV21mMCVLCe2NIPRzmrmtmZ9AKvkPvKXMSw1v8HguNO+OIghconMdmcSPr9
         6Kk//ml9VJGdhD4bVtDXELzl6unlUzBrhZ48U23buoFzxKvfUvcHIvMZl7UJw3ImuX17
         sI5RCLbI4XzvHmIvs7E8aSUAyfELUXhhy95CLKev0YRrNdDVvZ4NNxbdW/yB8USTVRrd
         PrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8Tw5fHcTZzbSzK7WDa8C+XaUgJaXo0qN5pr/H7EMQA=;
        b=qi98reExdG4AMAME28OCmJbq8yIdoREpuAolbqwo8jJWq8/02VlEGM6YiSEl/QHqYy
         Co4YuE/N7v/G5lHayl50iN/8OIwZkIkWWKdjd4GybrLEut44QT/eHftAte77jxZmGDdz
         rnisJtyZMPU06Uj/p6DqgqDZNPnjP6/PWMocWWyRb0R1rg+T0S/3OajeNr7TNeAnDqAL
         YNpgHeeT049N15V6WWe9/8O2Y38UAlQ+URTdfZ6hkhJbzhgVHlzEC0TsjMaHb8D3aI+z
         zlapSYLpkMyBMJrdOYq27npGqL82hyOH6TseMaANw/unQ/6i3RY/gnG2ZgvE+id+nT70
         p1sw==
X-Gm-Message-State: ANoB5pk9+HB7Ms/U6KzM3xxxJsnETtRP+pqsiMYcEdf1wLoY4ZFzsP1L
	RKKDC7ViStEtSxFPZDaMDDxJn8fhlLWFJQ==
X-Google-Smtp-Source: AA0mqf4037s5rz87VCZs9Uvr65SLGN1v/kc7w9QZZgbAlTMorOm/8jwJ+IHL+EDqUCDDg1jTnyj0sw==
X-Received: by 2002:a63:485a:0:b0:45b:f8be:7402 with SMTP id x26-20020a63485a000000b0045bf8be7402mr4655631pgk.484.1669129200511;
        Tue, 22 Nov 2022 07:00:00 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a0a9700b002182cd64b1csm12376501pjw.1.2022.11.22.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 07:00:00 -0800 (PST)
Date: Tue, 22 Nov 2022 07:00:00 -0800 (PST)
X-Google-Original-Date: Tue, 22 Nov 2022 06:59:58 PST (-0800)
Subject: Re: RISC-V SoC Drivers for v6.2
In-Reply-To: <608037ab-1e9c-4f70-b85c-5665a4bb1769@app.fastmail.com>
CC: Conor Dooley <conor@kernel.org>, soc@kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-3945534f-98a0-453a-8a1b-3e1c8f3441a4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_070006_367795_7F7292E1 
X-CRM114-Status: GOOD (  28.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 22 Nov 2022 06:38:40 PST (-0800), Arnd Bergmann wrote:
> On Mon, Nov 21, 2022, at 18:24, Conor Dooley wrote:
>> Hey Arnd,
>>
>> Same stuff applies here: lmk if there's something you'd rather see changed.
>> Perhaps you'd prefer to see PRs per vendor? Although I think that's less
>> likely to matter here than in the DT stuff. Again, I'll try to get the PR
>> out a bit earlier next time.
>
> Applied, this looks fine, just a few things to keep in mind:

Thanks!

> - please add "[GIT PULL]" to the subject line of the email

FWIW, here's the script I use to send pull requests: https://github.com/palmer-dabbelt/home/blob/master/.local/src/git-send-pull.bash

> - Splitting up a large pull request into smaller ones can be
>   helpful to make sure things don't go in unnoticed. I try to
>   (briefly) look at each patch, but if you have 20 boring but
>   large patches, and a small but important patch that I may
>   need to comment on, that is a good reason to split.
>
>> Not too much to see here, Yang Yingliang has added some error handling
>> to the setup of the driver that reports SiFive cache topology
>> information. I've put it on -next given how far we are in the release
>> cycle, feel free to put it on fixes if you disagree :)
>
> This is fine either way, as none of the fixes are likely to cause
> any real issues. I usually like to err on the side of having too much
> in the fixes branch instead of risking to miss something, but I'm
> just as happy to follow your preference here.
>
>> RISC-V SoC drivers for v6.2
>>
>> SiFive:
>> - add probe error handling to the ccache driver
>
> Since this tag description becomes part of the git history, try to write
> it like you would write a commit log in the future. Ideally that
> avoids bulleted lists (I know they are easy) and instead uses full
> sentences that explain things about the state of the patches. If there
> are bugfixes, are users likely to need the fixes or were they found
> through inspection? For new features, explain who would have the
> corresponding hardware and what it does. Again, what you have here
> is not wrong, but it can always get better.
>
>       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
