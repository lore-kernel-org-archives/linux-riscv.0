Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5BCEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 23:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LVvUNyu90AIhL5G3SKYsG7BR4K1HuEzBpMnBklmn0nY=; b=1bKbvATmliekCJvkj7raLFw9lM
	S6eRMui8nU0sjNzdH9UFUvH+QQQZBs2wVOltKJ+AeCatWnF9llx8+X7+H1fWWtcUglZUbBLBDohNe
	AYfAe3vb3qR6dFJ7SDDBvBDKHxWZikILSL5l8Fw/DSB9RaXM8UhUJZsvDjKBpW0kdCbF7He2VmMoX
	OeOaCyRTBAhK6xZrgl5DA7VcF0+3bkYEPLKjRhJhg0TNAi0/7xTqH8SE+WBFpZa6edbsmD/TqMoCj
	7M1SYGV9qQgy8tm+S3Cm8j0ZiIhgPcKuxU2aIoqLJ8t4EfHFxHdc6uAby9r3C/XxXnQf2IH+Os891
	euztbbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC74G-00G123-2h;
	Wed, 21 Jun 2023 23:16:52 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC74D-00G10x-13
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 23:16:51 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-39eab4bbe8aso4324866b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 16:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687389408; x=1689981408;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4rVo+mVuxwtsu5V/lfGRBX4yPfbkTSPEFbP6fD5ewc=;
        b=ynlXNaUoh/2z3rEdd1Va2R2axXixILIPeHORpLCzMZFE4V5uoPzD6gTlz8xvGi7FLw
         +VRVTQYk/pcqdjxOvJYSGgg0swZPDjpZiJatNrSWftPI41PnMZDHh8sVzH0r4ggzZAgM
         Iiv9tLFyNubuodIKnHaT1YYYAVw2SYUPnLG3wJ5TNr6B17otEm4BgQyBE9hB+41xUKz0
         9oi0CRc3jOzbiD2XLIxegSmBkuLzWq7hwxQnE+N1/CL0YdiqdSV3JhJ5/SRpkXdxTYv6
         sBX531AaxRF/fVBfP6jHV1N9v8xWdbltKqut2dfIMIkPnUTPix9LpjZwtS8hg5N8XneG
         dWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687389408; x=1689981408;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4rVo+mVuxwtsu5V/lfGRBX4yPfbkTSPEFbP6fD5ewc=;
        b=Df9sY0qBcYH5eYc0OpurLnGDwNK5RpGeEgLrqZG0e9v7nxYvEywspGMMBU2vsZrbl7
         ukx+87dIgiASaWPrO9oPB6/q22UpYruLU9UQDbstbzFEk56hhuZnzfuN6no37d7Vv7H8
         ffSgzqt9IpqzXG1HyF38x9amLm35MhHSyE9CtAq1vF9OVyY/Vn09KRbQ7vV2037PqJ5S
         bit7PGq6yXKjP8zWW4BLTY/NoRfFsOmcVHL8hsVa2eWOesu3Gdfk7NGKoEYdT7vZ6kPT
         6rRJtDA9Lk10jq3icLDUhoBxLpUXanM3UKoqjxWSSiOKgd1ukeJRt9b/un0S4RorHMB0
         8p+w==
X-Gm-Message-State: AC+VfDzrVHdUfkFL8Xc2HjmFN2p5I6iwIZ4Nlw1rtTs3VGechY5+7083
	rWSwOyju0WwZu2WEsQB2jCnzFHTugMkB2/5Mwxo=
X-Google-Smtp-Source: ACHHUZ7FzNIAt4g+zr/JDyKcWdgMUIdnWlvI6D6LcF1SXHZE1wWG50I3TVQxeb7L9o0KolDHaB+/Bw==
X-Received: by 2002:a54:4095:0:b0:39e:e048:410 with SMTP id i21-20020a544095000000b0039ee0480410mr9145253oii.42.1687389407789;
        Wed, 21 Jun 2023 16:16:47 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l3-20020a17090a72c300b0025930e50e28sm9355230pjk.41.2023.06.21.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 16:16:47 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:16:47 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 16:16:07 PDT (-0700)
Subject: Re: [PATCH v1] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
In-Reply-To: <20230621-grass-pregame-8fa7cd7bdb96@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  rdunlap@infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  jszhang@kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-462c879c-bdd5-4b0c-8144-4618bd2e0499@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_161649_581294_94CCDE5B 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, 21 Jun 2023 13:00:38 PDT (-0700), Conor Dooley wrote:
> On Wed, Jun 21, 2023 at 12:57:02PM -0700, Palmer Dabbelt wrote:
>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> I don't have an ARCH_THEAD, though, so not sure where this is aimed at.
>
> I need to take it, I applied the patches.
> Sorry, probably should have said it below the --- line.

No problem, I figured they were over there somewhere -- just kind of 
hard to keep track with how much is in flight right now ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
