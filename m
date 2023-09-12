Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCBCCA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7vBMTTc/RX0d4GwplaSpTauAxYmGQVm8u1TQeqYQC8=; b=BFll/3RNgVnAa9
	yc2/rBK4u1lx9sUjiW6izc4m4v5OzVYlD2UQ4dW1aJP1k2CDYP4sLKF7nvAXwFeGWukxh1F1csoiP
	Olhi42E7lF7vXuwIldfsQ3yDz/KQ/yF2tz2rqs8aY47fzlR3hp0pG4m2XsyUFugn6j+/FWMwNPKD3
	d57w9xKJfi5rb443EfvRiOhO9sYGoXFY3eSFjIGzH+Er6f27LlW2flm9tOoCxWCWyR3wBV22xRHYh
	5BkPM5JL6BC9TXHpKEj0VnfGhFEtaPUldUduPh+kRFthuh+kT1QtjF8lltmBwVc5NyS93j0poa0b8
	KpeuTdqVEScdKDoSXERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzPl-002gD7-0V;
	Tue, 12 Sep 2023 09:10:33 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzPh-002gBr-2s
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 09:10:31 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-58e6c05f529so53733527b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694509828; x=1695114628; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wS5QgdUOCC9VaeBKhtLVMz+PTz3QdvRlZVKaTgTJWE=;
        b=tV05hViCj4/vzOtY0Fztd4XR92lSZ+IDpoGiLwBC1wyLcwaXWrxAlomDWETj4SMaIS
         i0/8zP4vehFl83A9Xb8Xkf6jQpqeB4GK3uWlKc1mBRvFnt4E+8tv9gwvqKENTcaN6uJw
         X+nQPLAtolqSOKshIFoXJrzQqd+StNeE8kBaoL7VRRbAjFLajWxHZGKSMd/SOeh9cNPL
         sFTMe3IMsvL99DtKB3I02kjG8jz+hPxihyuwwwHMY1m2V4MLLkUhw0T0d1Nh5Suca526
         6F5l+oBAICeHrAQwD5H3l2oQ+w2XGudfHuQViEPNFNrGVkrgShAbeLN+5nzB/VNUk1zK
         bPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694509828; x=1695114628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wS5QgdUOCC9VaeBKhtLVMz+PTz3QdvRlZVKaTgTJWE=;
        b=woV2xwGPTqwYeKPxQ7veXoGLhIhfbt9Fx3UH9VwwT6PRHv7heFMbOhb/2/5dfIMGUq
         Lr3AH6ZwrWAoXcKmwfpLYdJgxBm2SNtHYjy8wqBP+Fu1E9o9LoOiEvSgF2GTGjiRiXJW
         RPEaG6KryQbLGrDlm/2uQLAuv9rLMRtxsuHbe5bMWNvUre6N+apeQ6KJjS+y+YrRb5mv
         KhabwO+97tw6iDCeIP5gJDRNwcMGcSDCV8THL92wOvSXPuh36dtkwocf/tLTJg1h0OCH
         zZCY6YNOY8qtcz0EV3muV+UkiydvrRU3rND/Hh8T9CfvXi/YlNGsuqlnoDHw1XH4x6DU
         BNrA==
X-Gm-Message-State: AOJu0Yy6VCAD4s107jPnqzSlKZ7LD6m+RWNQXIhmyjsfXORr33Cb6yPX
	KPyUkyEji7x2XXVMWVzo52W2sQJm2TIeW0o6PG11mw==
X-Google-Smtp-Source: AGHT+IHaJe8TVI8OD48JzqiIz2fgcaPOPkTxwV3k9ta7dUaBVJiSwzwwTaqTlLeLEY/v/DqmQCJAEEnkVBsSvzdrZo0=
X-Received: by 2002:a25:2409:0:b0:d71:8729:23b8 with SMTP id
 k9-20020a252409000000b00d71872923b8mr11479439ybk.13.1694509828307; Tue, 12
 Sep 2023 02:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230911-scouring-squash-3ef2cc8b1ee2@spud>
In-Reply-To: <20230911-scouring-squash-3ef2cc8b1ee2@spud>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Sep 2023 11:09:51 +0200
Message-ID: <CAPDyKFqB_2KiqYy1Li1sGkXPiEAnc2GOUO7SdqCxy5G+YkeLcA@mail.gmail.com>
Subject: Re: Missed soc/genpd PR for 6.6 mw
To: Conor Dooley <conor@kernel.org>
Cc: arnd@arndb.de, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Walker Chen <walker.chen@starfivetech.com>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Jia Jie Ho <jiajie.ho@starfivetech.com>, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_021029_928760_75292980 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, 12 Sept 2023 at 00:11, Conor Dooley <conor@kernel.org> wrote:
>
> Hey all,
>
> So I've been informed that I made a hames of things and forgot to send
> my soc driver PR for the 6.6 merge window. There's not too much in my
> branch
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-soc-for-next
> so I would've kicked the can to 6.7, but the majority of changes there were
> made to the starfive pmu driver that has since moved to the new genpd
> subsystem.
>
> Sending a PR to Arnd for 6.7 with the pmu bits & based on v6.5-rc1 doesn't
> seem to make all that much sense to me, since that stuff is no longer in
> drivers/soc, but rebasing on top of v6.6-rc1 would make these genpd changes,
> with a different path to Linus.
>
> What's the best way to rectify me screwing this up? Should I split out
> the non genpd patch and send a PR for that for the genpd tree for 6.7?

Yep, that seems like the best option.

If you think it's better to re-post the re-based genpd patches, I can
certainly pick them up from the mailing lists too.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
