Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6250C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 01:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B1D61159
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 01:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71B1D61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fYSbooJcAPgsQ4taGFH6Bkx3gKdI5OPy/2N5aG/1yjU=; b=nG/
	Yjlx/TvmEY7WYdY6WReKn4s4EUZA3cwtDROJB1lj0PaOuDArNw8wR/g8Vo8Y4C+0nJEVaef5gLyHo
	zbxzzxUMya2isQM2In5f3CtX6SFj/2aHSh+u1jJV9/v6DYd9iOxRlPOkryOSWCnL1axvXqc2GrOjA
	SASobCP75nn/3oj49IVhcq9knaIwBwbsIKd5JJnDd4mGiyEXdvrIiCroWnwzjqnTLvdALlq3D1sVu
	LAzHRqWPtLT3LS9+d5fQOESPbJf2F3WCg/sEnDe7nThgakTdpuH79aiaRqR8EwrAvQwrG1ZaBhz3G
	wQjR18lBiTwMZJfrk+4iDsRPZM6QjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSrUY-006ZpY-5A; Wed, 22 Sep 2021 01:56:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSrUV-006Zow-JI
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 01:56:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id u27so3634175edi.9
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=iBgok2uz07w8Tbbb6DCL1rgy3HjELumr9KYsaUBVkg0=;
 b=YcMU1QcaVmvXJduzv7VblB09oJneoExOXYv2pF77V89oNStDclEepY9KJWJyy3VnFT
 5I8UT7GdNeUuzt/79gsTI2+dwpOHGc/skVLwiUDjbvnt6B50PMTs22udPr8Pr8P/Lg/c
 F4PzL9cf5FrPzTeqmN7dyXTbQlGvkyRw6DGORdbZ84R9uR5FV5u7ZAr60u5rKU0i03JY
 SaPcP1jib6OTOxFEkTW0Tbdw3cqk9P628lG1hbGqCBEqTekkAOgrp+4+bw1rcmXO+a5C
 efm7HYYWT5G0QfO2lP9dDdq4o9RYcwy6gJXlUoxN9ZoshDRoSsWjmbxrdOfXjckZ0ud2
 Bhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iBgok2uz07w8Tbbb6DCL1rgy3HjELumr9KYsaUBVkg0=;
 b=2joZhD11/1JTQWRut956WfJ3jY0YpluyBDsqDTHkIX8odC61OYePEZ9V/YK/6Rw4n3
 dDvJqzz7qUcZ4jwkzQy5NMmKre0GB6KrhCvZ2fWSVkw8pBjKcpRqWyjsKKVFXeCgF5nf
 coXP+9lpRSleeoVLHKqY31mDAnJV3aURdwk9olrsWrNuCGYO+K6u23SDpomvAiRJJZdk
 5614p9TFf5Vs/B+rsAUWh6hHbsIbaOfJw4Tz1cbkb76+Vydu2Z0jiaAG9myTIXzFtzOX
 hyCm5jbNfvyPA/KixgllJBMrWbSCNCxmih1X4aYAg9rlCAkJPTbwbaIu/LDy6kDbpL0w
 2Oqg==
X-Gm-Message-State: AOAM531LD1pbmHGcYrz5tJqiA+60BKatonEiAqmWwgybVNC4s5Y5yFbi
 nulcSzju3iHftyLQG+LVNVia3H//jTTK4s6d9Kh+8YoqlG0=
X-Google-Smtp-Source: ABdhPJwIA1WyczllEJ6jBZhid/VLEWJ1IuiETxlTKB8Q6kAquT25uhP6gCIfX9GoRUE1TQGwQD81o70gk08NcIMJmRo=
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr37206804ejk.411.1632275765072; 
 Tue, 21 Sep 2021 18:56:05 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Wed, 22 Sep 2021 11:55:54 +1000
Message-ID: <CAEg67GmLBSqvLPcSVj-+YwF7E2WUPHBR9jO7YXxr-7x_SRgELw@mail.gmail.com>
Subject: Real-Time Linux on RISC-V
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_185607_675403_52143893 
X-CRM114-Status: UNSURE (   4.99  )
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

Hi,

are there any plans to support Real-Time Linux[1] on RISC-V?

Please CC me on replies as I am not subscribed to the mailing list.

Thanks,

Patrick

[1] https://wiki.linuxfoundation.org/realtime

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
