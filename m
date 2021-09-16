Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCF9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 15:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC2B6120E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 15:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EC2B6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=olfwdNhgp4kYF92cNBwjt5aHih2uZ3EXA+yF1gTchYg=; b=uVW7KB0XI9BMs4
	HFcYFu7rBZQOWhujFIz35x2ZhezrYZmbP2o0dGNPu4Ej9Bp97yYI7mHm1aKtJpsGPZcbIoAKC27iO
	+Dc/jEEZH5kx27rDHcjXsXivI6fmEAu9YyMv/tMfu98lQismmkDviQFy/9v82+XvpGIKSMC0oLSfP
	N7SLOfntxMCckbuo3q1sdRf3rw2n/YdN2FaEd/8z8xsMpB9fZ4JL1mtLgTMAymuK0jQfCl0gJAAHD
	5weMRIo5DTc7vRoVySkxPbXNVx6393TMBYOqHKZEMlF22HMjLjmehk8WKk7OwhWPCxnZF4l8+7cTy
	S0eg7ut7xCkypcJBK+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQtUL-00BUrK-Tm; Thu, 16 Sep 2021 15:39:49 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQtUI-00BUqT-Sz
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 15:39:48 +0000
Received: by mail-yb1-xb31.google.com with SMTP id c6so13711469ybm.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=S4fJUg5ms4/EqfwZhaCu3UmtJz81M+lJfZD+KGvYqjc=;
 b=QvaUWviPRtfFLkgh4ty31oo879t6ZvO+llcKHhtjQeO+B4LRBfQU4SAFrFNswKe93x
 QT0WXgh7BgJgJEVz3IEECQDIARSps3MQxPZx7j1i3f9CmSJvGL2Iq2YFYW8Rv5bfj0CY
 sA1L3y8O2JhhV6vv7rQvov5He0Um3cmQOJSKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=S4fJUg5ms4/EqfwZhaCu3UmtJz81M+lJfZD+KGvYqjc=;
 b=6wtXOA8e/VJ/VcHiBLSo8ILmh+1dTupb8ACruFr0ZuQ6jJovDupAlMusctwavaS4d7
 PM0faE6Jwlv3DE5imm13gLoal0p0ijXVsIvuGeLuDByi4MxHaWChqzBVExWSWw+k1KUz
 swDKd7Ej5KCJQF6glb6cjchGkCAOusy9ysKlg6A8/vO9wP1bBFvofvnEplaRgfvNqRyY
 KKo3l4GA9ng8zOqacNcHKFTcLbrZm0H/WsIK3eS1R6YKRkkk0RVksQQwPqnjH3fcRTb7
 tuUMW3sTJ4mnBjIanRfaRjoxaCzsA3iq2HdCf+UIGyW1FVqsvTsSBe4aJEbR6Hdw+0Ml
 zrsw==
X-Gm-Message-State: AOAM531BBkjIMf+B/AIbm/lU8J6KqXlhVzJYWOYeNredo3HIhktKUsOL
 JSehRgy3ahmMP8iTlK6UEK1auxANsczxyGsq2fJRFfAOOBk1
X-Google-Smtp-Source: ABdhPJxKpHADTZGoNhCrE1aUOJD1viamPxGHGgSlmrd1csAg3VNM2BFz1ejfrNTXgU/UB3Bn8ycEyWo844r59isc4Ck=
X-Received: by 2002:a25:1683:: with SMTP id 125mr7617342ybw.164.1631806785348; 
 Thu, 16 Sep 2021 08:39:45 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Sep 2021 08:39:34 -0700
Message-ID: <CAOnJCU+6Fxqt=-SrN7su4DEaG9Rhp3rx_+ZA_hxMtVj87qRDtw@mail.gmail.com>
Subject: RISC-V MC schedule is out
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Kumar Sankaran <ksankaran@ventanamicro.com>, 
 Al Stone <ahs3@redhat.com>, Andreas Schwab <schwab@suse.de>, 
 Philipp Tomsich <ptomsich@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_083947_031486_023033E1 
X-CRM114-Status: UNSURE (   4.61  )
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

The official schedule RISC-V MC at Plumbers is available now.
https://linuxplumbersconf.org/event/11/sessions/114/#20210921

We have many interesting topics that will be discussed including the
following draft specifications.
[1] RISC-V Platform specification
(https://github.com/riscv/riscv-platform-specs)
[2] Advanced Interrupt Architecture (AIA) (https://github.com/riscv/riscv-aia)
[3] Advanced CLINT (ACLINT) (https://github.com/riscv/riscv-aclint/)
[4] ACPI for RISC-V (https://github.com/riscv-non-isa/riscv-acpi)

All of these specifications will be moved to a wider public review
phase in a few months as well. We look forward to your feedback on
these specifications. Hope to have a great session next week.

FYI: The registration for plumbers is still open if you have not
already done so [1].

[1] https://linuxplumbersconf.org/event/11/page/112-attend

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
