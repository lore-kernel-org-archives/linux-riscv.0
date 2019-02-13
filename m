Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413C9C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:43:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11B71222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WXurHWc9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="LSoGx5Om"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11B71222BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HX/j38ePYdJ/RZU5XhCLWt+wHbf+ywB7yNbyFtnomLA=; b=WXurHWc9ny57Yj
	wWofxwH54yVI4/XEvfVBtM2p8Zxb/v94qZM3kwEmJ0fcEaJ+CDDcTLCrZQdGVaAIPlJcEKwg3z4JI
	UR3pTkof8F6g/Vd4G+zNA1FkZOSI5CLlRzXIXAMT0cbZ4tS7aU6nFSeBwm2yAxuCPyZof7xbkGF+Q
	AAW7EGfzlaHwVtsUUCozwOm/1um1U18h7GCtxngCfB+R9RaVZmMgPVKNDuNpTlfSxUqNdjMPAsuKq
	m0/bhm1NBMaSCudbeSWt4TvY6Ju5FL66jdQmVAF5c9tpnK5dE6PV0dceXnlqZ8+L8GusE6rSeWLBc
	uAcDRK8K5WoVX/8xdQzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtoGn-0001qf-M7; Wed, 13 Feb 2019 06:43:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtoGl-0001qE-Hm
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 06:43:45 +0000
Received: by mail-wm1-x341.google.com with SMTP id x7so1139513wmj.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dmR0NFGNyhmtovA2tdJzy6bkO95KBp/gI439HNKvIY=;
 b=LSoGx5OmmNj09LZqF4KwNJ5BxWG5Xt6c1MYKq1Bt9KlBgOEOVnfJK9fpL6FxiXTbFe
 4caOr7tl+aFd4CEmI4eyHb6WzBEw2gofvawEUIdDRLEetnTPOx8LfKcyLDfqxQQ8/t3V
 b/i+ZnsYKsaZa5/5yJO51i5s36UfI0QBK/hp42Z5+shyjTU9dld0m3EUxZ5iIFmv4RGn
 FMkrvQruRA3JMWO7m3kYMQSu/8ADSB1Rx2QByv3FVDPVv2/WYOX3s8VNjydIq+EiE4xE
 bnJgEmR0suDrZMj0qvLzBizN/YfaSc2m0cLvSiVm5bHscTAeRMyXhmKZyJYwz0X9diaN
 IMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dmR0NFGNyhmtovA2tdJzy6bkO95KBp/gI439HNKvIY=;
 b=YaUPGljeyBHAVoc1blHA3Tm0b4KSSxhvEe2piSKwSrNX2ZswCNeq+0rkXnnRq06Jdm
 DO6x1AvpXu2XoZPw4a9s5Es6ZHB3h7UNizs42w9AjzAc0R/0RleMMRBw3SKLJvf1CqqT
 yD1Ywer/lupUqAv/j4YmzYwZB2CicPcsLkk7KqBi4X5ye3i833deElLZu2MIPfiax8Ws
 jH105xcUTPeaf8yxXFc9ujcJoQ61PVnx4l7gshbPRwZ+NDVutzaq7pdXFmaFUx6l/zU/
 MTAfk4Pqpc6nwtDyx8KX5t2zPBx4p0JH70MORW2J2lZKG0eyBlVmKgflYlzo4FrExrh0
 r5VQ==
X-Gm-Message-State: AHQUAua1IX8mw/CPBmjRUhCGeZbR++E73E+jReLV22MZwkIZsTl3kowc
 IPsJTsGam+D8p8WA1ZnlthKOe1HYERvK/eZ6YLYBCQ==
X-Google-Smtp-Source: AHgI3IY3wh0fAJ3pkBOSWL9QIIrC56NnkSdRlyBop6m4MPvrou4wIzbSQ/cYiwvqU2LGody3UpZZrkFGNemeeLsl/s8=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr1906321wme.16.1550040220679; 
 Tue, 12 Feb 2019 22:43:40 -0800 (PST)
MIME-Version: 1.0
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
 <1549969812-22502-7-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1549969812-22502-7-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Feb 2019 12:13:29 +0530
Message-ID: <CAAhSdy3fs58TyiNTxD2NNz-MQuND6gyyg6hrKScN-iYmstXfnA@mail.gmail.com>
Subject: Re: [v4 PATCH 6/8] clocksource/drivers/riscv: Add required checks
 during clock source init
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_224343_648624_C0BE5EF5 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 4:40 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, clocksource registration happens for an invalid cpu for
> non-smp kernels. This lead to kernel panic as cpu hotplug registration
> will fail for those cpus. Moreover, riscv_hartid_to_cpuid can return
> errors now.
>
> Do not proceed if hartid or cpuid is invalid. Take this opprtunity to

s/opprtunity/opportunity

Otherwise, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
