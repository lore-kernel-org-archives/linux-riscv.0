Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18842CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=slZM2b9AeytVLUxim0wmvTOTbZHb01iDvjzdWaI1hGA=; b=RqJxWRV88R4BmwjCWRiOBllwMO
	h6a2pJ92n7rhUe8d4Lqi3+yzWYHjdRxhyWI227lOe0SKy1pzYh/Z5AsJlnVAreBakHwpTBxPc9Qdw
	5Jq1Ml6S7JfomIfHwPIXThaWNfWnWcZOC3t5RwyxzQ8sscD9FxDN1Zh38MwTDxk7Fo+c0/5yv4VIL
	oFawnjDlTwyweBmn4egJeGhfGP9w4L/S37qOUwPbIKrhcxRYKTgT6qp32488HO1OKsN9SNMEeVZTE
	uwqPtZvtUCwKkoPlb4g1L2F+w7UgClr0Wj1LXLCkscDy8wANK356555sqPs8eYWfOP004YSgR9VW7
	JiVHnXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOLC-000000035iU-1nar;
	Thu, 04 Apr 2024 14:45:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOLA-000000035hV-1QKD
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 14:45:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e0d82d441bso9756465ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712241918; x=1712846718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEtA7ue1KjE0okJsvDxQ4gU3UMWQ6K77fPKwSzlZjUQ=;
        b=TETV0TgpoFoO7ZebN+tWeiaJyl2ZyjQw0se/A2QcQhtnypEGQs6IfKsnXPZcCQUBwO
         qTKfd21zsaspci51uZczqBRBFQHV2QQP8BmCu6QgpAF63pk/PpomY2Bqo3dTNLPjV+Of
         ImEjpwgqKNrBrRN9xTnRhu3H87MpcmdM0KgFkDXLLzXlGtnENpfJpVgDorC/Mfoew0EJ
         A55E6R0H94M61MutHXtioDJnv+vtuqK3Wuv2sVInjIjoTKyw3Gek58rGURocP+IUD7LY
         ZY0Dxc540bixCFYHPpkM4lmddgTg23Z33iX0ArhoEZ+Im7C/ruM0n22DR0eckoqKOF+Z
         w58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712241918; x=1712846718;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEtA7ue1KjE0okJsvDxQ4gU3UMWQ6K77fPKwSzlZjUQ=;
        b=p2hhrk3dGOW2SBy6PqiaJWyTVH96BpF+0a4ekeMeKau5Sjw0CFJatNEOqmUM/wDf4j
         Ak1WULYl8wMW8j11832qHr7LPY0BJBxBzv0DMMCYdEKv31Z1t2qXXPXmbIiAGQ+8AqC/
         IhLpTwlmPjh+ybJ4Nzr6i1adIRjvOsxpv+DMzP/1hhHiHJsmBg56Xpm0u2qGNscgKEcj
         xd7Mbff41n8lbSl7Q/lj7YHnje/QTiPKEqJdf794iox3AcMozIKCwiXU+F4Z3+zEVHe7
         Fqiz6UWrvoKHtPOJ+yXJ0diRLwFYOfapsqrj1GyoHnwWRZ4kq7Gl8t+53ugSjpGo9C30
         nI+g==
X-Gm-Message-State: AOJu0Yw0+ikGBNsUHlCqyX2fEZZBzCuk9suFOl901IoXaOotS3RIFql+
	m3vpXvgqc2Jr7TwQ+ofMbktLZkseO2kaDWkdqxiE3LAAJsJ6QoyuqjMM3t3baj7y9BfsnvwlvXu
	+
X-Google-Smtp-Source: AGHT+IHwy78cYmNYeVvfhGjPLhIMRbEB6HnpVGkbCUio/Ffr7v+iXHwkKs2oMzYWsj/nY7zb8c1Upg==
X-Received: by 2002:a17:902:ec8c:b0:1dc:cf38:3a77 with SMTP id x12-20020a170902ec8c00b001dccf383a77mr3314598plg.55.1712241917705;
        Thu, 04 Apr 2024 07:45:17 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id w20-20020a1709027b9400b001dca3a65200sm15555320pll.228.2024.04.04.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 07:45:17 -0700 (PDT)
Date: Thu, 04 Apr 2024 07:45:17 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Apr 2024 07:45:14 PDT (-0700)
Subject: Re: [PATCH v2] riscv: use KERN_INFO in do_trap
In-Reply-To: <mvmcyr5ckit.fsf@suse.de>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  cuiyunhui@bytedance.com, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-44c24766-aac1-4deb-a487-076a4315bd4c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_074520_400399_17AF76BB 
X-CRM114-Status: UNSURE (   7.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 04 Apr 2024 06:41:46 PDT (-0700), schwab@suse.de wrote:
> Ping!

Sorry I missed this, I just put it in the queue for the tester.  Unless 
something blows up it should show up soon.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
