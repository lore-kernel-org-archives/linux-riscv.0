Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D39BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ouEVMggLgjeDpU6Tf8atGm8MNPI9otgFHwjvzX9EANo=; b=b159Yhhs/JZSwPg99J89GW/46C
	plVMwlbZcVt3yWym0ynxs5VfIr3LhT4QMwso9V+/PQuEGQV1JkU7P2eM4D5mPiXz+PPFkayeg0O+W
	UDmTiN6QK+kTykN+69vg6mWfwH2Gd1M7OXZ7SuS2fmgkbeQV+gBWXBCeElpZTsJS9hCsONWsh/tzk
	TaTtkq/6F7fVEkbOtgMAIcvAjNAplaPEaa2hD3YRQQlz66Rjrb82T01TMS+/fw17QqHe8TdVijfX9
	IxrDYk1oK7rBi39XBebNs0AWXvOSNTzPwni5cmT3V5JDmjP6CnxJl3VZNPsClNerJ1riu6nl39VMc
	mOx3tVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr4S0-00FtAH-Oj; Tue, 17 May 2022 21:09:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr4Rw-00Ft85-Ic
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 21:09:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so36643pjh.4
 for <linux-riscv@lists.infradead.org>; Tue, 17 May 2022 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=R/7z8eWZxiYe9S0To66yjly59RWl9dyPFi7uANEALSM=;
 b=vkkR5tKDxiQQYhXSKUjsv5XIK18wcJvUl2NcE2t/3wUFdjG/1uvIQXQf6lzhh6NsNx
 aakGM81RtKLwz51MPDh8PH/xVqKHMKxkDEvwrdPyUNQ83FT9e7LelTlzO8A9mLjM0EId
 WlL1qs5ogPv3DNH1y9e5cPMdBh5L/h6zQx6WNi3PPzOd9JAonlNbTMqSLRIffRH7mvdt
 mSgIgITy+2Y0iZEm2K8Zy9VdalWT+F0xO8loMKOrwUAsDF2VEJfYzf55XI+kY1Qo6nzK
 0ds/FyoJVy17vFeNh0HbIiveKB0Z4Dri5+U4gGRYaWbl3qCUE3+yO4adbX1iAu0GWNOo
 eX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=R/7z8eWZxiYe9S0To66yjly59RWl9dyPFi7uANEALSM=;
 b=aWBYD0dLof5fGW0iCNzf6t3IyehUWa+t+U+KU3Yt+3/wtdmqje7vjUq1zW+u6h9Eie
 yDVsGyPL2pcXYmJKY2r4rQ83MJalHxRWCQ+H2f3d1age/XtRvOb/+JyhbWLN18qDBaRB
 HmdaSdlJuvHsd6/rusa7Yn44PJJalvyJ6sEV9m/ujfPBfQ3wcV45vMKUCYKlqzkDeY5I
 +RdJxIB6LIdZS2cgoweoMLO8S7RFbEydFSYZt6TctW6RdQqmz2lWdXSyujm6J76pOtH9
 7OtmyCuQZH6TRpA7ERmTnGBgYv/SDDFVSlEx0F/uzKF5zCMjRYXmpmu8xWQhibPYlUSW
 x8sw==
X-Gm-Message-State: AOAM5334VfebXnobOGz1A5fH6BSsQO0Cs55ZnqeoLBuHSQcv7kBe2Jmj
 K2OtL2JYjqIWSDNTQKSqsyzYfoTgV+V3Vg==
X-Google-Smtp-Source: ABdhPJwyZDjPxyc5RmbaiaP1rkSweQ2E4F8JTK4aBmp1Io0axoQVTBsN13qBX6XYwUbLeDAc7Vck/w==
X-Received: by 2002:a17:90a:6f44:b0:1df:7cfb:d9f9 with SMTP id
 d62-20020a17090a6f4400b001df7cfbd9f9mr6854344pjk.201.1652821785698; 
 Tue, 17 May 2022 14:09:45 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 1-20020a620501000000b0050dc76281e1sm162511pff.187.2022.05.17.14.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 14:09:45 -0700 (PDT)
Date: Tue, 17 May 2022 14:09:45 -0700 (PDT)
X-Google-Original-Date: Tue, 17 May 2022 14:09:43 PDT (-0700)
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2022
In-Reply-To: <CAOnJCUKjSCrRNT4841MzO3vWmYszX5CSmvtPoRLydzG7FFm7kA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, opensbi@lists.infradead.org,
 linux-kernel@vger.kernel.org, sw-dev@groups.riscv.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: atishp@atishpatra.org
Message-ID: <mhng-1b49d564-a55c-464c-9834-2ac4a334b930@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_140948_640132_281DA9B7 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, 03 May 2022 18:30:46 PDT (-0700), atishp@atishpatra.org wrote:
> The CFP for topic proposals for the RISC-V micro conference[1] is open now.
> Please submit your proposal before it's too late!

Due to all of the extra complexities around hosting conferences right 
now we're going to try and get our schedule together a bit earlier than 
usual this year: specifically we'll be going through our first round of 
acceptances at 10am Pacific on Friday June 17th, to make sure we can 
give adequate notice to both the attendees and organizers before the 
schedule is set.  That's quite a bit earlier than usual and only a month 
away so sorry if it's a bit inconvenient for folks, but the goal is to 
remove one source of chaos from what will likely be a high complexity 
set of conferences this fall.  As usual the deadline is soft, but if you 
miss it then it just luck as to whether your talk can be fit in.

Also including a reminder to anyone planning on attending that the visa 
process is likely to be even more difficult than usual this year, so you 
should plan accordingly.  If you're from a country that has a complex 
visa process then we're happy to help any way we can, just let us know 
via email.  As usual Plumbers fills up and late registrations are a 
headache for the organizers, so be sure to register as early as possible 
and let us know if you're running into any issues.

> Here is the announcement[2].
> https://lpc.events/blog/2022/index.php/2022/02/04/cfp-open-microconferences/
>
> The Linux plumbers event will be both in person and remote
> (hybrid)virtual this year. More details can be found here [3].
>
> [1] https://lpc.events/event/16/contributions/1148/
> [2] https://lpc.events/blog/2022/index.php/2022/02/04/cfp-open-microconferences/
> [3] https://lpc.events/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
