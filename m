Return-Path: <SRS0=MOMo=CC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D587BC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2020 14:20:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E22A2074D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2020 14:20:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3XpzOsqq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mab-labs.com header.i=@mab-labs.com header.b="Ky2lwH+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E22A2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mab-labs.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jN6PpZDayg7SR4wkADz2C+FM3l5MDow5ulalUknF0qc=; b=3XpzOsqq+sY5qbLzYRE/QIjmQj
	i0EYRgXHyFlzIGHUDkWaGKoFKPuCxWta3ZqPgekDZ9CdXdah7LH8ET70D2CM2+cOXzE0+9BsNXxVL
	A6e4MAMgYiJzJ+eKuNXjEQoDBzgtB0cVKbt264D8GuRfQkE/PsC5NgHntzP7px2Tx45wl+85kCS3N
	bhtWnee+qhRVNe4xYOces+UpUCjh2h7VnbFR2rhnZllEIYe9hzh1YKuSN7g0yRYwO2f0AErhPsPxX
	1jDETjGNhGsyNPcP/IZiG2QNio7BZ+sJahzZLJhki2VlKGVYAmgrwu1tCOUiAKK52ouKE9ASciXYf
	EPAj81Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kADKx-0000ex-AP; Mon, 24 Aug 2020 14:20:39 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kADKv-0000e5-5G
 for linux-riscv@lists.infradead.org; Mon, 24 Aug 2020 14:20:37 +0000
Received: by mail-oi1-x244.google.com with SMTP id n128so8390783oif.0
 for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2020 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mab-labs.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=DrrrTD7krAxD/+M9so0Zn9tg7xdUSzsctM+lxBHh9pw=;
 b=Ky2lwH+jWwCprjKWesVh6QMG13aCI8lUMP+rwGrkFzu4sAeb3AtrGfTbnSyB+FFXYN
 bQkKiMbwxngMDUhyGUP9SZav/iEtyOW+7Bs/Swxc5D8RKzsZFeJ/Gp+clJrKLXH3VIRZ
 3+Nfe0X8wcWz2hiCZAoDtZ6XxV68QKcsoh2bhAYRkRfU9FAR/uA/GBKuEMeUdniC3f7l
 QFRb2lBIF1CTkOZOsEScNuqikZTBryfAkviHav1aSdBXuu5/Y5s2rKux73laq70cGaJt
 LsG5bNMET4DKvXaLqHwXc1YDYeG4NGBzfasI8Y+xotD/dyntd9smcRjZlkf00NKHHhX0
 CJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DrrrTD7krAxD/+M9so0Zn9tg7xdUSzsctM+lxBHh9pw=;
 b=ga6O0LY2wZPgbn0H1o9zuACCpEhxsgqhw4G70UKZ8NakLNS8QuhKnMHnLLNJyvmeeO
 n839Te7THD6+caybXChYbjpEnjNve/tZLnmcCQaA3WVNOAOFAuuORFrXUoa4TtCcHDj1
 hl+FqcRU0H5juaUN9EWDYnvz5HBVjJG8L9J4V+cIpqu3izeVJ6xxRCx1ELCg9lC0NovR
 CgzOcSs80QC///+Hh3DacAqUdOLSqsUO0gqRRngPelbZ2zz/wT3j1LZQBpH8d02BOL6O
 iZKVQ853nY6Yg/JkmclKs7cFfVF774+1Rg/OeEcLpSE0bmLJsSsECrKdTdd/WYoITRfm
 lIKA==
X-Gm-Message-State: AOAM5301K5/hEUYjb8E5VpIpM1krCeyMUVt6FrXvuspS25T0c4oeA39q
 Zfh4TA27rM2YJfwevJb9u4gX67vycHAzzUo6OUs/GzvEQyuR+w==
X-Google-Smtp-Source: ABdhPJzUbCf5Dbb45yYzgnBKhNLkw2z6PJ10hWksnbqjKcgSGWkA//16uqfrImxZuuIoQP3iBGxSi1gbeNerv3VFnWQ=
X-Received: by 2002:aca:4e0c:: with SMTP id c12mr3074062oib.74.1598278833606; 
 Mon, 24 Aug 2020 07:20:33 -0700 (PDT)
MIME-Version: 1.0
From: Mohammed Billoo <mab@mab-labs.com>
Date: Mon, 24 Aug 2020 10:20:22 -0400
Message-ID: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
Subject: RISC-V testing needs on HW?
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_102037_245342_1599433A 
X-CRM114-Status: UNSURE (   5.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

My Kendryte board should arrive this Thursday. Is there any targeted
testing that anyone would like done, or should I just build the latest
5.9 rc for riscv, load it on the board, and see what happens?

Thanks
-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
