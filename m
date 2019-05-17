Return-Path: <SRS0=meFw=TR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F7AC04AB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 May 2019 17:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A40D20848
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 May 2019 17:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hU7dr6nN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QoXQysgM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A40D20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNN0uj0o6PqbF8Tnl5/74pcw3TObLSm5lJE+eWf8uHc=; b=hU7dr6nNdsXlUp
	LYHBjGJGLRZOxzqcAiAGlBdwEii3eLxulwP56chJRZ9utbNoG8hElruUAT1nd/J0wYUKfU9PiataH
	yXGv59sw8IXXl5hmPqspacegCPrAVMguvHabcw6l1GaUtD9Ep4KccAzbfVApqOeCVu2QM5f5s7Soo
	0uFQirt6TPbTcUFHIggvxjtqqdheCpVsELbFHODARxAUwdcPuTHiczZwgwEWoY7hAQzQqpa1JJJoO
	bjQHTZDNYKNpx6PltrO5diH24OXtYyFDylaiv/EsBUMwdl4PDfnV8sJ/O6k4Xe+ezJXJSaVllQ0IX
	BeX8weSQWJ0UePejNTIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRgpU-0007Ep-Qs; Fri, 17 May 2019 17:39:36 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRgpR-0007EW-V4
 for linux-riscv@lists.infradead.org; Fri, 17 May 2019 17:39:35 +0000
Received: by mail-it1-x142.google.com with SMTP id u186so13325819ith.0
 for <linux-riscv@lists.infradead.org>; Fri, 17 May 2019 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=sjlzL8sYzuwHRaKiYXlCL9BHKp701p8pybnhyPt408A=;
 b=QoXQysgMhGAQhTO1LjXz8Ww4aJB4vAaO5w19dLg7CJHuNGCNkFQaHGo6RXZq259AwD
 5nPkXc2b7LBEnTtOOrI+WLOp+5W0xiXJ0rP7H1H1dxERDC6982aIH4sObvHmRwdokojd
 KIw8ZLBZHmqTpNMzajYjFTGD+cYXryXtJn1sGNI6pCEICSkG9oP1Ro96TNLaPerwlJuS
 joPFC7DKURMrOVCYXjkJSKemvJ1sUtSL0ISluneoSOehPdly8ykqRrmSR2VyCYjLRn1V
 rgOnrVQtLQb30diSBsABdhkRYVjVlKhomzbH/5Z68i7jnaw6LqMLE1G0aWjZhKe5l1Eh
 G1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=sjlzL8sYzuwHRaKiYXlCL9BHKp701p8pybnhyPt408A=;
 b=Gv6yJq+fWUvr1T2Vt+2G+hUQtdrJaczG4fz3jjJubXMuo9amzV3iCu9pA5TVEUWGlu
 Nl5PfI5z8ao8eT3Bhh+yhV0z1Pe1Elj4U3U7sPQy5f58rgcY4jIhBmG0YbkIUpqn2sPT
 sWnUS/k6Hghh761wBX/LrjyftZY+Qrxf1n4IDj8p7lVjh5/6U49k0bG4lGgaV1HDwR4a
 p6aqmRyeqZEDaymcgSbuYVDAsoiOlTv2erPhQJzWufFmYn7QLxVYlCyP8qSI1MLs6kPO
 8GEcNuZcktturnv+YH6vih/arqQDZSeZ7+lCWoZHm+yBgHfbnzRqzac4wX6eOLVyQrnC
 Megw==
X-Gm-Message-State: APjAAAV44JqOxOjU52dTtaNubAKBZN5AifLS1G/M2t8eEGRTOp1fxvxS
 5ti61kRBDpDH5rNFBuql7vtkbw==
X-Google-Smtp-Source: APXvYqz3C1G85l/Iijqw79DjIedtJARC46pAFcwSo2FJ+khWMuvvNQiU0ee/YPbw0XfRYFsR2ABxbQ==
X-Received: by 2002:a24:6588:: with SMTP id u130mr3713595itb.138.1558114772807; 
 Fri, 17 May 2019 10:39:32 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 d7sm527923itd.32.2019.05.17.10.39.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 10:39:32 -0700 (PDT)
Date: Fri, 17 May 2019 10:39:31 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v2 PATCH] RISC-V: Add a PE/COFF compliant Image header.
In-Reply-To: <20190501195607.32553-1-atish.patra@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1905171017510.9104@viisi.sifive.com>
References: <20190501195607.32553-1-atish.patra@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_103934_061523_EF591F01 
X-CRM114-Status: UNSURE (   7.38  )
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
Cc: mark.rutland@arm.com, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Zong Li <zong@andestech.com>, merker@debian.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 1 May 2019, Atish Patra wrote:

> Currently, last stage boot loaders such as U-Boot can accept only
> uImage which is an unnecessary additional step in automating boot flows.
> 
> Add a PE/COFF compliant image header that boot loaders can parse and
> directly load kernel flat Image. The existing booting methods will continue
> to work as it is.

One other thought: as I think you or someone else may have pointed out, 
this isn't the PE/COFF header itself, but rather an ersatz DOS stub 
header, that is apparently quite close to what some EFI bootloaders 
require.  So from that point of view, it's probably best to just write in 
the patch description that the idea is to add something that resembles an 
MS-DOS stub header, and that the motivations are that:

1. it resembles what ARM64 is doing, and there's not much point in 
inventing another boot header format that's completely different

2. it can be easily converted into an MS-DOS header that some EFI 
bootloaders apparently require, by tweaking a few bytes at the beginning


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
