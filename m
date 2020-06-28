Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC28C433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 15:42:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE1D20720
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 15:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5iF65Nc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAMt9EQi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE1D20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/6z/SBjk+uQYqyMeRzn26htUpLDb4JRoswFKuHkpB4=; b=H5iF65NcoMk5QBk40h3g78jgBe
	S2TyjTO+NeBFIwuZDMRoANO4omxN6sbDiV3GaW2RejVf1uHih3rkvzYF4Gked8Sa1XaRvAXKsuXeC
	95qlL7sYCr1LYi+QbWXj/iGUREJpr/zCes7B9fmpVvWOk1WKP7p292295+Ovh+P70h1Qg/01xDuCH
	PwuntqN1pa2hm+EyeVV9gqMa4Jqzn5ToaNVY0wcyIhEmphIn1f3tFgz3GphonNfDjAIz8saalvvBt
	toOQtj9UlJZvCMANwM7lTUITMZJKxHZPTRiPT6SJNkKqqVVoBy0OLMas0k6tcpa5SVDiAsWuLDbf4
	HAiVeqyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpZRz-0004vT-6O; Sun, 28 Jun 2020 15:42:35 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpZRw-0004vG-An
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 15:42:33 +0000
Received: by mail-lj1-x22b.google.com with SMTP id s1so15415688ljo.0
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xLcB0ZPxLFOFFjSgzBXE6dyI6OPPKbauRHRST895pYI=;
 b=FAMt9EQiUHVVD6s0MJWsPz5NiZj/pUHN6AMst1HHNFGqzqZRkJT5J/vOec3To89azv
 blBCaWXEW2OOgMFdNUzlOCIXDzigK4/TMDaGNMIKMXFth6nnyE2mhkERQnmoTl/+0ZHp
 7SwdoeseEEY/9eLEp9KaDUT+tcvJaWs40/LMXKg8gOihinJlWXLMD+0cqHECOsRcvolj
 KucltpdJbIJURRDiw8kxfDo23wk0vwNn9dGdQw1DOP/9vTMg5atJyQuNJxSxjMhq/3zh
 DfycjxwMDDg+JiKMxVboAvC7kbj2JRlv7YqTMyqbq6BvgRED/pS4GCJ4IMVYDQn3SsDJ
 0sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xLcB0ZPxLFOFFjSgzBXE6dyI6OPPKbauRHRST895pYI=;
 b=NIPR87bY8RN63uZPtZigmEhcrPXaQNYlnWRA/NQil6Pk+8EoiRZZWCPyin4+JpuyhP
 WCiIeAJ9K7cdMjGjJzyvTYdYs+fkBMKMb6PzumuA/eYhOGlxF/9tTA+PJ/FUVncnrbe9
 KZRAT/AJMTFlgEo8orfEDnk7K/L5H3le82wVwzoNxz/Tye1ATJhAbEakxBVOumg2X+Ex
 dV8D97L/eS6faoC+NM91htl0rPq8if6W+Tzmxa4bejlhcNs/GIXCeWDKq+zrtqnQHOX1
 8/TSqL1WFN0mR0Sti5dFuz73PVLU9xi7/yHOydFmG38vdyNNCHmyfn/I6xi64SpAfLvc
 IONA==
X-Gm-Message-State: AOAM531UFlfnzPWoymCjWjQ45Q9G+U9aKI6LZfPVk++dEXtdK/6bwYTu
 vQLOhrV6sXFbqEBN1odmXPi8zApU3xoe6rp0SRDO7IqUqDjByA==
X-Google-Smtp-Source: ABdhPJwVPJCEPM9vadTYnEwytRPrGc2TNSeoRfJKom/k5mhc7TYmUNCH64XAZW5zM9Tva3eUNWkdp4kFTppM0npkzVU=
X-Received: by 2002:a2e:b889:: with SMTP id r9mr6187611ljp.92.1593358948854;
 Sun, 28 Jun 2020 08:42:28 -0700 (PDT)
MIME-Version: 1.0
From: Drew Fustini <pdp7pdp7@gmail.com>
Date: Sun, 28 Jun 2020 17:42:17 +0200
Message-ID: <CAEf4M_DSU3wfLcBiMSt645fOmwuBtdNzhNhJgcob9f8xVjzb2Q@mail.gmail.com>
Subject: K210 and FDPIC support?
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 Damien Le Moal <Damien.LeMoal@wdc.com>, Sean Anderson <seanga2@gmail.com>, 
 Carlos Eduardo de Paula <me@carlosedp.com>
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

Hello, I'm trying determine the current status so I can mention it
when talking about Linux on RISC-V during the Embedded Linux
Conference tomorrow. [0]

Is there any progress towards FDPIC support?

My understanding this is needed for any practical usage of Linux
userspace on the limited SRAM in the Kendryte K210.

Thanks,
Drew

[0] https://ossna2020.sched.com/event/c3Yq

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
