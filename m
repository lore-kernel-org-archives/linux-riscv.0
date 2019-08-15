Return-Path: <SRS0=oAuQ=WL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE943C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2019 01:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F58D208C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2019 01:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKECjVzn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="k0n8568w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F58D208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=1ZrvJA9CxcuKX5SYF8VRpl6JXSSxzPl/H1ACX1pZPs4=; b=BKECjVzn8ccNC/GU6Wh8QcCVf
	1oe+kvxWDqNxWrhwfZMm7d1CcpyS6I5jq3SxjIrh5BWdNKFvNLTRxQtikVMpZUmAHBVoAvgVwbbmV
	hlvYSqIh4X2jTe4UeGcQCAJ6c3kmDNFpqQpvoaex8EwoAVSDnTieDEzBrXz/fNJhT+1cBBF0GJ6Q0
	YLU165qd/jN4kCC0hdZmWsUTkehczV/KwL9ISb+6m65sjU0DkO598tpvTINppo8/jAKxocaMlIf7R
	3kAOou+AHYAfEFLLbpA6+ttlCJvfrQGmC900qSXzVuaJSselFntldwb/YKf6rf+a+c1XirsaCyKCx
	gWSARCFQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy4x3-0000Ce-04; Thu, 15 Aug 2019 01:53:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy4x0-0000CN-C2
 for linux-riscv@lists.infradead.org; Thu, 15 Aug 2019 01:53:15 +0000
Received: by mail-pg1-x544.google.com with SMTP id n4so577308pgv.2
 for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2019 18:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=B+urqSWm85wzvKtnrzAL/ED40jwSYxyNjNBdxhrRvuU=;
 b=k0n8568wNHHsx6zXvAubvU8j+UJLpdwV3DXPjhBjHWiytO90eILwvNbmMyhHXPvvFh
 OmQRZw4zukae4HtVxY8cxBgO55bggVvef2Bmci6q+mRJn7GGHoWlhcA85DFwziG6hSom
 jd9nTZqqPAiI2dNUWoyDdDWXoRt+M5UuLrLedkgh9vJ7/NCAaPE7PVaUNQhQ07CXhWPX
 OXBnh7s9ZiG+CFkFPzUd+zlaKrTTtmkLznfpe1kjOGy5yuNKyXCvus0rU0aNddN2Rdgn
 1HpqOysxM8ZTMBz3CBELPSDLWAXHgfRsU0oggWry1iThcBbfLvZASjqxukZoZsF5IOBJ
 zg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=B+urqSWm85wzvKtnrzAL/ED40jwSYxyNjNBdxhrRvuU=;
 b=pH+JdrNNyAOc21RwhHllNUiQWCgihAyTTLc9Gq5blFWblRsmErVbS+CQBYEkWD/GDe
 9o5fJzU/a8Jk2j5miLbGBdLTINRtNbzV1Ke3Kquvr3hgOXNDNz3zTDuGhGpHl2FEwu6O
 tO1agYFYJWgBm8fvm7dO492gwiZ4Lubhkt6knCdoBsE6L1251S9Xc7PLJuVuC1nODypJ
 I7z1KWgDJxcw4ArDTK5wd9dVqQzX3YznCIepQnrKMVBvF/F1Y/ywbfbcmE3bbL4heFdS
 cdrnrDQgTvh5SaU+GpubDw1/zDOPIiokF44UuaglYPolHNqyPJw83xbPgtaSNcmYFfa0
 MuWw==
X-Gm-Message-State: APjAAAV9X1tcN7SXVtCg0x9QVN7x4xcZ+vUK1LvYiXe8Wo3tI5lRIrsl
 v3L/ew84kXSTwaW9xcafTvDtRA==
X-Google-Smtp-Source: APXvYqweNZweFB0WkL9RkgxC0FIbRYfV4E4lwj7UZo12deQWJbuFOYlGUuOtHlqdw3Q2kaXl0/yDgw==
X-Received: by 2002:a62:76d5:: with SMTP id r204mr2959889pfc.252.1565833992329; 
 Wed, 14 Aug 2019 18:53:12 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 64sm1187819pfe.128.2019.08.14.18.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 18:53:11 -0700 (PDT)
Date: Wed, 14 Aug 2019 18:53:11 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Aug 2019 18:49:57 PDT (-0700)
Subject: Re: [PATCH v2 2/2] riscv: Make __fstate_clean() work correctly.
In-Reply-To: <87mugbv1ch.fsf@igel.home>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-cde08804-6424-4966-84cb-359f3ae393fa@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_185314_422389_323B03A7 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
Cc: vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 14 Aug 2019 15:17:18 PDT (-0700), schwab@linux-m68k.org wrote:
> On Aug 14 2019, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> On Wed, 14 Aug 2019 13:32:50 PDT (-0700), Paul Walmsley wrote:
>>> On Wed, 14 Aug 2019, Vincent Chen wrote:
>>>
>>>> Make the __fstate_clean() function correctly set the
>>>> state of sstatus.FS in pt_regs to SR_FS_CLEAN.
>>>>
>>>> Fixes: 7db91e5 ("RISC-V: Task implementation")
>>>> Cc: linux-stable <stable@vger.kernel.org>
>>>> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>
>>> Thanks, I extended the "Fixes" commit ID to 12 digits, as is the usual
>>> practice here, and have queued the following for v5.3-rc.
>>
>> For reference, something like "git config core.abbrev=12" (or whatever you
>> write to get this in your .gitconfig)
>>
>>    https://github.com/palmer-dabbelt/home/blob/master/.gitconfig.in#L23
>>
>> causes git to do the right thing.
>
> Actually, the right setting is core.abbrev=auto (or leaving it unset).
> It lets git chose the appropriate length depending on the repository
> contents.  For the linux repository it will chose 13 right now.

Awesome, thanks!  I've updated my config :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
