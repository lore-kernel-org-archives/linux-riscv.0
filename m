Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11554C25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1THvAiQEbGetBvGHvPVfYZPpcK2bRS57FtA2ZsaP4w=; b=WBJ9w2Cs9rFrqq
	CbTeRQcurlrR+LMz46OENw+akfZspZS+E+eS7FmMbBtmOY4bdbCPB1EnFY3Wvy0UVif5LEmVowo1l
	M9Ps93rAalVKDbp/yikruwnj2zlHCnwi6ZrSIJXtSO2xSePhTJCVfW+Ssc9rEveo/ggjhIZSzfDei
	SgR6/Q/PaCmDhiKtKh7nHJgxJmQBUHP50HDXdDsiNPOTwEkh+UdkNnO7PvCEnovYsntlIspxKNsrt
	J0jfSkX4MXOeXnVD3WEuSM//0KIvpb5ff3GOv8+J17dhsFsjd4a3PCFGDSTTsqO3g94PjuY5oLeai
	ZC7bIjcLAB8f/mb+70YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw4MS-00EwDi-2e;
	Thu, 26 Oct 2023 17:41:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw4MP-00EwCi-2P
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 17:41:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso189857966b.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 10:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698342091; x=1698946891; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ITpuqAIYuX9E93fc5T+jENg/qhVTutVfi31bFRSkPpE=;
        b=CcV950TL34xSlBlEGPeuUsaHQx8Eao7NGWPh6ARL78TitkxVwCEaMBR2hyLGvFYWJL
         VvD6HjFrkX3Vwdd6u5h0E9lnB62SK8HwQ/IE9LSvuFKl3I0K9sFWiqTCObyV2d3rrGo1
         +tUBUY6zlF6ajbfavpucPR/RczLr7mblhY6Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698342091; x=1698946891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITpuqAIYuX9E93fc5T+jENg/qhVTutVfi31bFRSkPpE=;
        b=KwlxJ71cJiICq3L5ucZPZr/1k6p2NLpL2zKt/3ZqK86t2DzrMn7iLdB5n2lhRDTY5s
         R36CQ4yYfs1iT2hsmejCuuxgGvo9NUTlIuDejnabZJGUEexW6LFUIK24/ik3IoN3Vf73
         /2aKZRjLpjto4UkvpPwWBIAw/F5Vo6H9Weqw61qtQJ7uSChocbTSB9jZWDH8nQDG5CpR
         dVQ/E5PfLp0BDlittrqfB2mTMQNEtkx3oNyghRebXVgUA/us/WKwl+Ue8hdbH4JD1Js0
         lweLZ8NiCj44yEOmjYaPxVzRGGMSNQeltBRmZkgWRgEFQu/UFbjwvOBl4p0kJyI1KF1C
         fLaQ==
X-Gm-Message-State: AOJu0Yyjuk4fUA+R2juUb6PVCShHWGnv9FpUjZIB3JFTdWe+VmOc7pgX
	1ndvdZhQwAVAFZQINSveMLhmMnhT+1Nh++ltEDhoZL3d
X-Google-Smtp-Source: AGHT+IHLh7VWlkXnh2ivVyMu2VqWqL0Y+IlQtzPtlz1z/pLxzxm8JjAT/TIW+NtRbjw4vDMCAOEEqQ==
X-Received: by 2002:a17:907:2cc4:b0:9c2:a072:78c4 with SMTP id hg4-20020a1709072cc400b009c2a07278c4mr322510ejc.25.1698342091572;
        Thu, 26 Oct 2023 10:41:31 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 17-20020a17090602d100b009b2ca104988sm11953076ejk.98.2023.10.26.10.41.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 10:41:31 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so1922200a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 10:41:31 -0700 (PDT)
X-Received: by 2002:a05:6402:206c:b0:53e:ba3d:acb9 with SMTP id
 bd12-20020a056402206c00b0053eba3dacb9mr382618edb.24.1698342085802; Thu, 26
 Oct 2023 10:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
In-Reply-To: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Oct 2023 07:41:07 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjjY4h1TFir3V3DWSboF4=7buYezo-ZiTvQmMDeAK+30g@mail.gmail.com>
Message-ID: <CAHk-=wjjY4h1TFir3V3DWSboF4=7buYezo-ZiTvQmMDeAK+30g@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.7, part 3
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_104133_790630_BB9D3878 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

On Thu, 26 Oct 2023 at 05:23, Arnd Bergmann <arnd@arndb.de> wrote:
>
> ARM: SoC fixes for 6.7, part 3
>
> A couple of platforms have some last-minute fixes for 6.7 [...]

The "last-minute" makes me thinkyou mean 6.6?

The 6.7 merge window hasn't quite opened yet.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
