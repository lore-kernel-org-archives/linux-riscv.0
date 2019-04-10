Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8D3C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 06:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA332083E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 06:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJbXEGKP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="03zhtP3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA332083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocWJrCKCt3LvqptVtoGVJnI1rfKZM4t6P1rt2WCssW4=; b=DJbXEGKPikYIGJ
	vCKl2AndGZZlIMRMb9ppg5Q/2o3qiiizf2E4Jkz/lsmkQ1TVItRBSK7hHdO9xsHGUmP/Sisd8+/Xu
	08DazcTQ84nVU3A3xxzB7+xSaPfIKLWp4FezIEeIWvLz4USssXD96mRma9S2zevuLcJeKr/ueXaWR
	BOy6okuRMOYI8ORtnnAdveLTZc4Vu8ZisU5YQAZqT/Jxdm5Ri1B9mAL6XNYiB7CP7CKLq/b7nwJnl
	oSIBbxM+2tXuDba9mvLELmpViMllFPNTt8pc6NgAm8g0P2wSaLjWaeEAe41QuNfiEqBrSGn38x0HK
	AVJyFV/vN6YZ7Axt2+IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE6QD-00060m-0w; Wed, 10 Apr 2019 06:09:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE6QA-0005zg-5N
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 06:09:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id s15so1311734wra.12
 for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2019 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NA0KH+84Yze/o0gKU4OJJ1enqUC1AklFzqfQAGl58rs=;
 b=03zhtP3hjGilRQUkBcV1cNKSgX7z2b5GRHf1ymBh/GZlNqm5s2d+DrUV8UKkVC/gXR
 PaCLH1oZEfRhwXZeeU5YRiGnbI2kZKGoQ4xOERU2HkgDgMVhzc/Mex5eh1cTkXD1hwWn
 h9GL4PYVxzAxC+TeTiWbBEYHNRKPGQySw+fKF+u9vNnN/CUGFa8PaRfvhv+CmvbBO3Jr
 vaBWZaMFKUAAkoXBeaaWGH9C/6uXfV5VhnZNqL11WR+SaZ7MC4xd4kD9ReLRxFgt1FOb
 VmlEywxpHr1XxM7LM6vvCiHwqgwKWaN3JnLU4hCS14Ct/P8hDhepmuKb3mTEi3Q11qVT
 VEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NA0KH+84Yze/o0gKU4OJJ1enqUC1AklFzqfQAGl58rs=;
 b=k1Ly2lk4tofjCiY3okCa8mG9fPSoEWK/g7oGJiH5a0Fm0o5bV4iZ/+0hJ6vYmsGudY
 SnI653Yz/vyRwE4x2CcFkhc2ek273oWbvPQIoIC2niPkBk06Fh2RF636vrb/iZxsLVHd
 j/FQYOByH4rb9CjFO4Kn+Y5/Zg14ywXJ5qiYHWF4Idnc1wBmrpiCnTuQRSRsQmdgPUZ+
 /Wwk72U21aZpM5raZ5WXfoLIJNZjRoSj365GE6aGMdU6IY6JgRoP0RZi5hG+OzTM+kFJ
 OFX8RORxmsUWoooL2yUjy3Ki8Cmcac31bBSm0u/7DTF7zKWlb6oql+V6kgPbh3QJd0O+
 PJSQ==
X-Gm-Message-State: APjAAAUHqP9VIOiDjDGKc6e0HVLvmdCsez/c4I49nz39DG8VEqpwa68m
 dlbQMFEgkCOs6Z6ucTYPeEnwj3zgkYtcD1keQTdq2g==
X-Google-Smtp-Source: APXvYqwGsVM+lp4TTutXtH2uxGhqQuhFdsD+/tvxC3JYLlOvD13BeFR7y/2cQJcno8YdIZdoNpSM/QAGK99XEXzYIIg=
X-Received: by 2002:adf:f110:: with SMTP id r16mr24701189wro.153.1554876555377; 
 Tue, 09 Apr 2019 23:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-2-anup.patel@wdc.com>
 <mhng-02f905c7-fb28-4997-9769-2cb88c581881@palmer-si-x1c4>
In-Reply-To: <mhng-02f905c7-fb28-4997-9769-2cb88c581881@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Apr 2019 11:39:03 +0530
Message-ID: <CAAhSdy1UZ3VZAa+Gtf0KQUY9Ebwm7p=qAB+Xv7HDAjfUYpFuAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: Add separate defconfig for 32bit systems
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_230918_264493_AE544C70 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 9, 2019 at 10:14 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 12 Mar 2019 15:08:12 PDT (-0700), Anup Patel wrote:
> > This patch adds rv32_defconfig for 32bit systems. The only
> > difference between rv32_defconfig and defconfig is that
> > rv32_defconfig has  CONFIG_ARCH_RV32I=y.
>
> Thanks.  I think it makes sense to have this in 5.1 so I'm going to take it
> into the next RC.

Thanks, Palmer.

Can you consider "[PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB
option for 64bit systems" for 5.1?

Refer, https://patchwork.kernel.org/patch/10886895/

The above patch is also required for 64bit system with more than 128GiB memory
(i.e. server-class system).

We can remove "Maximum Physical Memory 2GiB" option as separate patch.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
