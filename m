Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1340CC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 07:22:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E6C20825
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 07:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x73U0v0E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iqd4cqha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89E6C20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZSC4TgidkwtSF6VgoHMnLt17zVII5gbUpj2W58HtIww=; b=x73U0v0EEfOdcUryz9e+t/xBR
	gKJ54ZSvX2ecOdyzQ9BaKv69oMxND9oEucDbCof6OOBXVX00CaVkimGf67Hb4GVQSYvm7pV8QOUaK
	FzoKslW7f7GzM+2+ZVJHomtM6MTp0pdM46s+9Er5Acke0Y1G0ezjx4L/1sxmguOwZktAGq8HqFQCl
	vKeyALD6IfAiB347iBcyI0DsUaLuotxSujAaSAL2DbKa29Yu07Y9uAD7mxvmee3+N4e/hFScRKuNr
	yUcOdw/rFj6nJU6W1laTCdSpcYTTzAMdkvxA90I3efzEzJFjJWaQUHy2Y1OLxsfFSi+/XWSqjgGo/
	zFoyoIACw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaZbJ-0001xY-N0; Thu, 05 Nov 2020 07:22:29 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaZbG-0001wh-P4
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 07:22:27 +0000
Received: by mail-oi1-x243.google.com with SMTP id w145so703661oie.9
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 23:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSZ3+zLaojBm8Llmv8mdwwh1sKAbO9V1JJ7VIGY5YaM=;
 b=iqd4cqhaOURh+RJCIK7wwSnQuhnxujTo2ztBt+aVcxykRvNrG9uuBde3XzAhI2pjP9
 OOE6bjCaG65Qow41L4PK7cMY5hA3m5pLHsAATuQziti/UZ0+bTHycJBzTs1WKnnc8giT
 tkB9OA/hvZS1dUUOu23LMJteVg7jYwg6J+RJ2kp/63ti20sl0YrPLjk0haMozMXNKVmb
 64oS4WIeHb6RrS6tGBtkbjyiyJUWaKycGNBbqPgg/xgAza+dbfnEvHcJaDQsqkpGWLLs
 6VgB5i9La8YVUm0i1paX5ZOAA2//pHVk34C21OIjBlBwfU8aA2aZhgSn9VPAQ3NkOpXw
 LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSZ3+zLaojBm8Llmv8mdwwh1sKAbO9V1JJ7VIGY5YaM=;
 b=hGI7n2Y4vKpUNyy6gwXD+HgFHyl6h/xZQ++VSkP+bOFUN5/jvDtqSDtDj91nEqRbT5
 zmslUgooGw49IF6N4CPB+g2gszE0Rj91UdPFiQA8aJPfDRCixUl9Ir8v4YV9UuyiDw8N
 D0i0d2s7+hzLxVfx6EwHqbAcwOGDPQJ9v0A6KMh2U7JOsl3EV1Wk+6d2/WI2rZMHUUX9
 fqKEu2rvZ0CNjPNDnl8Lz4a0ws41IwjRbhghJDAue8uAEgs/QqvUMnTHuCYvv+Z1ah6L
 Qg8GdqRfeVFNT6sX7hx+yYLSODxNO1iqToMIxz1uvQM5gmWXvxUJDFrkB8S9XGwbcMDC
 2Hpw==
X-Gm-Message-State: AOAM533H9PPhjjoLDL77vlaVzIhlRFzO2RqdjR5snAKJ1mp0nhESPmDb
 bf+/xfEk9zgUz3VUk7AQO6g9So+gyjRV+fDc2jV6Kg==
X-Google-Smtp-Source: ABdhPJy0F5JCc98tp7QNjA610x1Eqz7f1L3ylLULpbwz+DrTYw2meMBgEMIwHINr6f0EPsTptlEuoAYI6lV5pfkWL5c=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr750400oia.35.1604560943669; 
 Wed, 04 Nov 2020 23:22:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com>
 <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
 <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
In-Reply-To: <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Nov 2020 15:22:10 +0800
Message-ID: <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_022226_864576_E8BDAB5E 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 10:45 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2020-10-16 02:18:23)
> > Extract common core of prci driver to an independent file, it could
> > allow other chips to reuse it. Separate SoCs-dependent code 'fu540'
> > from prci core, then we can easily add 'fu740' later.
>
> Please indicate if there are any functional changes or this is just code
> movement.

There are some changes for common use, not just code movement or
copies, I would figure out the changes in the commit message  in the
next version.

>
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/clk/sifive/Makefile      |   2 +
> >  drivers/clk/sifive/fu540-prci.c  | 586 +------------------------------
> >  drivers/clk/sifive/fu540-prci.h  |  21 ++
> >  drivers/clk/sifive/sifive-prci.c | 409 +++++++++++++++++++++
> >  drivers/clk/sifive/sifive-prci.h | 201 +++++++++++
>
> How much of this is a copy/pastes? Can you generate patches with
> format-patch -M -C to try to find copies and renames?

I tried to add -M and -C option to find renames and copies, but it
doesn't detect anything here.

>
> >  5 files changed, 652 insertions(+), 567 deletions(-)
> >  create mode 100644 drivers/clk/sifive/fu540-prci.h
> >  create mode 100644 drivers/clk/sifive/sifive-prci.c
> >  create mode 100644 drivers/clk/sifive/sifive-prci.h
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
