Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4208C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 06:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2EFC2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 06:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HgvX5v0u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="p9NpB8BW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2EFC2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CtbN1odHcP7tluPs5zZU9LM/v6GSpLNP18QLxoFps8=; b=HgvX5v0u1qFlWi
	YqhzU6zKCRe+XcXw6SwXIR7NDpZ2wJn5+JkwUu5CBtZXS7gAJCgwYLvlXm94H7GNoFqpLtJHvpcuX
	7HtIs9zMRYMZ941QknfMBTKUx9OYkQ2HuQOgqWc8au6yzZ88ABBw30ZUsqjaJ/SP+h1GedE1bQVJj
	2taDCzIf6GKU6QXSrmSCy0iiVecec9vOr9C//+B7f/hWWjo6yMhH/4GeE7PHwv21RrCzv8zTi3eUb
	CnsH3K6t2qZW+BbO4YwbArM1OP8bj7AnOJGQUv48q1bxTiNwO/YgoCnl7ZP/d2hArhRxqnZiWLY4b
	Ea7trfKiQXoxAWPNZqvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9lMO-0007X7-93; Fri, 29 Mar 2019 06:51:28 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9lLL-000611-Bw
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 06:50:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id y7so1142844wrn.11
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rk9Tjh9bmBsApmUPV+4Ng0H24HMGN/q1wBY66W9cA0E=;
 b=p9NpB8BW/snbMT9Z9LvxO17RKtk/8U3XFViiFz3CMJFqaFoNNL/QgAsxqhaogZEqJh
 bDdogWjHLqd2YlMw5o15c2DWxE1ttH6mfMbkJMWxWF6yws9fIsxRNx720RCbMyAHmkWH
 vEJsI7cYA3t4H0nEgBO6m+4/c3C+1xzDERsRyviDhlW4b62Zn5syw9IEuYPdzxA6fR4j
 bPxWUfcII161QwVI3aGqI+ISLsItsiFOLZoU9rIrTjIh7bAbVAGnVWm21hBJ45FxcS64
 aTqfmxRR77m1hulzM6PZWsrPbkN+s716QZNni/f2Lle6eVJ87T06FiWSlhIsRLasxbPk
 D3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rk9Tjh9bmBsApmUPV+4Ng0H24HMGN/q1wBY66W9cA0E=;
 b=aRHA9bYoE8Lr0B+WxbZr/TV58edspeRXH++cOTvJxmVlJvSez/S5aO2zFI5YfMk4e4
 gFyUPTVTgPsV+THRYkmNmmUWLFZzxHEW3H0M3tr6oI4P7duENnjFmGkHS9psk8zRR76C
 XyeiOcaUcy+tc5f+HQe+cwsyUw9MjxAb8BHk5YjDjbjL4e0yVm1qbVuVOHhcmnHLjI+r
 OVIZxT3+6emmbHJlUD64aY6DYu00Il7PAGLlC5vTLREF9znDi8ZQmD0rOW+MQrspSpda
 s5WnG8mgoKmcpCOvhZXXXII5sMtOwziId5Dfu/JP+/7j1Jelz24DkHV5CZb62UaMX0F6
 /0+Q==
X-Gm-Message-State: APjAAAVAx0hID1AQDXlATd0fFWA6H5HpapjAgWGB3Fw5zGLRM4OeiX5Z
 riIa6lB5CmHsFr0TfPMyiluDcem30+8t/nuTQBKEtg==
X-Google-Smtp-Source: APXvYqwCj5geTzE+H/keNYztYw/5CSD4uWVM3FMR2KtG/Sk32SMr1m7buPmPFfvCSnKyPwPrlNwz1rbLAq5dya26RMU=
X-Received: by 2002:adf:9427:: with SMTP id 36mr31439937wrq.128.1553842221523; 
 Thu, 28 Mar 2019 23:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190322132509.GA19263@infradead.org>
 <mhng-05d2bbbf-c808-408e-8fc3-14c00ac167b6@palmer-si-x1c4>
In-Reply-To: <mhng-05d2bbbf-c808-408e-8fc3-14c00ac167b6@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Mar 2019 12:20:09 +0530
Message-ID: <CAAhSdy2pqVS7LPfiaQzw90=kvaJDL63KbMXEiqHg_Raa_LiNxw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix FIXMAP_TOP to avoid overlap with VMALLOC area
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_235024_091429_736BCBEA 
X-CRM114-Status: UNSURE (   6.20  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Fri, Mar 29, 2019 at 11:48 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 22 Mar 2019 06:25:09 PDT (-0700), Christoph Hellwig wrote:
> > Looks good,
> >
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Thanks.  I've added this to my fixes list for the next RC.

I have another RC fix as well:

"[PATCH v4] RISC-V: Always compile mm/init.c with cmodel=medany and notrace "

https://patchwork.kernel.org/patch/10870605/

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
