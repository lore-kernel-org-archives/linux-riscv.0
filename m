Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E37EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 20:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VD/3WiAGNqnesnwfJkmBFnrK2FvodE2tvCROjotpQaM=; b=RuNYCrfKQ0QwvLvoLy/kQdzEPP
	6A5Z3XcyVKkclz8DxhDIsh0vEJm9eeV1c+64rPd2oZ5H1wBizniXGfar1LKpSze9ibetPtnUJ06z4
	YqijqiKXmEWOyAuCLMXmviAnuUBvVtyZBOSHmLwJ9zWrL9D2La3ii1aOcLbVAHEWPSS1lDMPNU+WT
	kDzwl1CiX/6ee9UusRjDo2B1rPON93i8Dy520n+9jQBtu3x/cR5SNzoKl0CTTlTo0D2Qe8uiH1EFJ
	FdfBcDAD2ghVG7Kll91ogjPnb0u6YpcbL5n6jIBU0Cuk0KFqUH+qzZMrnqVzwsVYb7zVgjxfzZKhd
	dJ3HjP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFKro-004VQX-0c;
	Fri, 30 Jun 2023 20:37:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFKrk-004VPn-00
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 20:37:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666eec46206so1929330b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688157434; x=1690749434;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1Ru2lOmb0NqW9hbm2Sv72Yt+Z+Y9WgQ7hXdVcdty+Y=;
        b=JEYPpTRlCIWdLensKvqlFxFMuCRSwKryhy09mNW8qvn5xo1uXCis8mG6jrxZpYz0EZ
         cVTeRQ7BIPec3vBRm7MdMXcZtbJmYalRW9uB9w1CUAMxMH83w2pEcZWlswSnKxlDLhxk
         KwqQBJqvQMuB67POi/zYaC+mk5FHVIeFnrBAAtqemRp3Ui35iqXfoWZCJ3LP27Sm1liM
         D3NpBSMBA90l16mI5xiABWKK/NsImPhn25kEl+Y0kn4X9OJXtarDNrrsuy1XpPX/dHjv
         4QVrlcwK+EHGdU5TZfjsTNf2USSDadyOqBnj2M2RJQ7eF2PBw0yk0ha1PpoIse0gy3Xn
         7gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688157434; x=1690749434;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Ru2lOmb0NqW9hbm2Sv72Yt+Z+Y9WgQ7hXdVcdty+Y=;
        b=cklIaH6i9W095bLcZBABCwJpyzsY74G7wySvHlDgykb0G637R64OTvx7qTqPVcnX3V
         Ov4w7hfP8Y6auhQWPLVz3MMZ3hw6IdEnuT681aaagqapVDAJxwnDO7r4pvRbUrSO+j1G
         Ce/n1Tiqc1XF+aOcx9EvANLSXhgssxYEPEzMleKR5vTL6DLRMZBUpgFo2p8R4q/p2QlH
         tARPLmga8hVk4rn8ksV1kf5siJaqdooXBuvJr4B1iY26hqBOjWU1UZdxV3bQ1/y7wR28
         SWQZbeDpfWhvcPg2R2cZTmC/RvouyrOCMMip0R5EFpp3kGf3lLQ9Dvzp4KYl/ILjvqIx
         JljQ==
X-Gm-Message-State: ABy/qLZpGLzB2uCQZvHw7j3Vsnp0gk7gZq5RgxhKOe5dBgxiMPl5bSqs
	hG+Y9RD0uDPjO2hPl5+Vc+uTUTQlQK8u2oPhQV0=
X-Google-Smtp-Source: APBJJlHOzysRvFqwFy04EuBbQxV+P9VXkB2haEL3mC/IgKKQMu6vNqA+hYF0AO/FQAlXnPZGuIcffA==
X-Received: by 2002:a05:6a00:148b:b0:682:4c9f:aa0 with SMTP id v11-20020a056a00148b00b006824c9f0aa0mr4706127pfu.29.1688157434337;
        Fri, 30 Jun 2023 13:37:14 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z19-20020aa785d3000000b00679efed4108sm7632414pfn.33.2023.06.30.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:37:13 -0700 (PDT)
Date: Fri, 30 Jun 2023 13:37:13 -0700 (PDT)
X-Google-Original-Date: Fri, 30 Jun 2023 13:36:30 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
In-Reply-To: <CAHk-=whzdoWP5TRA=p=monXZmzo1Wd-gH8GRpcEUKh74nmDgZQ@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c1a8b2b3-f9ce-428e-9079-019db0613d58@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_133716_279686_B36157EC 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, 30 Jun 2023 11:54:35 PDT (-0700), Linus Torvalds wrote:
> On Fri, 30 Jun 2023 at 11:47, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> Awesome, thanks.  I poke around the git merge resolution stuff, but I'm
>> never 100% sure so I usually just look at the resulting output files and
>> then just paste in whatever git says as a heads up ;)
>
> Yup. It's one reason I really prefer to do merges myself - I just have
> done *so* many of them over the years (and did them long before git
> made them much easier) that I can usually do them in my sleep.
>
> Which obviously doesn't mean I then necessarily always get them right,
> but I tend to have a higher success rate just because I'm so used to
> them.

That's great with me, I don't do a lot of merge resolving so it's always 
a bit of a special thing.

> Regardless, I like seeing the heads-up for merge conflicts in the pull
> requests, if for no other reason than the fact that it sets my
> expectations for what I'm going to see.
>
> For example, sometimes it means that I decide I'll just go make a cup
> of coffee before tackling the merge at all... Not for something this
> trivial, but you get the idea.

OK, I'll just keep doing things this way and hopefully it stays fine ;)

>
>                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
