Return-Path: <SRS0=JPD3=TA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742EFC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2019 17:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4258120651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2019 17:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYaWRuzI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YkcFR/uq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4258120651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kt2adRPmx/raihqACVj5WARaPe5lBvEK4oU67m6WZFg=; b=ZYaWRuzIbmMx7L
	LzCu1Ok5+oU6LrrYAN+nz8YPLmqKqjahwuM2Uq0HyQo2mEdkRJwzFyiHj2aHcvxy7sYNCpI/SG253
	heQ986zVFcTuMHB406+YgXNoORyWYiwYptAog1B3/prbvTI/HSKxzNHAzQ+Muujp3pxjFVOoSCBjk
	hOxGKQSny2BGEiE2rVmhpNsW1k7aXxSc4LNvauQh8te/6/pg/Tbmh0X7wfWQsYZPlB/C93CeyyxgG
	wkM32hqexHCM9Pr7L7vvaoe27srtN+UEcEwIxU+yb+9J8/SF2dP9bdTjimObFiKFlEVnHLTeD/N+I
	06Wx5QWNC5b4i53Aab1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLWQ9-0003z9-Nf; Tue, 30 Apr 2019 17:19:57 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLWQ0-0003oS-R2
 for linux-riscv@lists.infradead.org; Tue, 30 Apr 2019 17:19:50 +0000
Received: by mail-io1-xd41.google.com with SMTP id v9so12872049iol.10
 for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2019 10:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Pv9s52F3I3LTh2VPQsZjNjyJ0DVTJR+kD/NTUkgR0S8=;
 b=YkcFR/uq4HcHwd3D84lUTjLRHG1YztZpclAPb4MLDMq/RCzq11vaiV92gO1/bh21Ys
 4BV7ad77tDVZl510QEjIchwpZbRK69HFYSSfHfunwNVeQ0dFEStx/pJ6zi0iwrO7nlmH
 LXM2q5HUaZEJ4EUhEGr/laqrXSpbt3iNghk3pa5FK1rVuQdg3GIvRrw5kK0NtqXbPlnu
 +mjDRbISVUY1Q2PzQWudRQRuu03mDOIsYDnGBFi3OChnrKExujH4zRswIJY2kmYOeOL+
 hkR4RKy3wnjFPhWyHs4Kh4vPM93lFLtZ+FJh5BESoXP6ELHE/0RWoaK+hvd+WVagm2vN
 nOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Pv9s52F3I3LTh2VPQsZjNjyJ0DVTJR+kD/NTUkgR0S8=;
 b=PxbtcLilJAl2JaJDrOMyYYUDPpXBiO6PCig2Xgzpz/BuowAEMmu2AiectVZi76da55
 YqRKDPRIHXS+iIdkpuBqlBSI6GoufEbe0SFPy8KQu3ZcCN9adwxld98ZGwbwoknJpQPy
 Qxqp6OrYFx3yhuZlDnGrV4fao5cXIWVfRDycNXplLGdR9UMh8Ds32FG3npneG8H0Scz0
 7Lby2Cylc/h+Xs/uCxgP20ymDrxdSD35ZNwQxSA/e1W8mFX9JdjujevTvdR/PZg1TKah
 jyP0TEbO1aHGajptP69jcNQzWEr1zba3jRhCe6wZa8OIaB13on3aw1n/jemDrEH5WrtZ
 XtWQ==
X-Gm-Message-State: APjAAAUMJ6kaTUh4EH80eOehKTF87DAu9RIaqXeBkZQW9wkE5twD/FrI
 Rs3XUoE2+NErvh3HjUQ0jNk4uw==
X-Google-Smtp-Source: APXvYqyU63AjN+GAZxxgezAz3u9ZMLLzLHCVYufHMiS7QiGi9a4cab8wPA8oBEa+cKGAzdZa4BXpsw==
X-Received: by 2002:a6b:8fce:: with SMTP id r197mr1003458iod.255.1556644788015; 
 Tue, 30 Apr 2019 10:19:48 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 w184sm1661014ita.9.2019.04.30.10.19.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 10:19:47 -0700 (PDT)
Date: Tue, 30 Apr 2019 10:19:46 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: add locking support for is25xxxxx
 device
In-Reply-To: <alpine.DEB.2.21.9999.1904301004060.7063@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1904301019280.7063@viisi.sifive.com>
References: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
 <1556474956-27786-4-git-send-email-sagar.kadam@sifive.com>
 <alpine.DEB.2.21.9999.1904301004060.7063@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_101948_874005_4044FAFA 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: palmer@sifive.com, bbrezillon@kernel.org, richard@nod.at,
 tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, linux-riscv@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Tue, 30 Apr 2019, Paul Walmsley wrote:

> The above sequence indicates a kerneldoc-style comment, but the format of 
> the comment is not in kerneldoc format.  Please fix this comment to 
> conform with
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/kernel-docs.rst

This, rather:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/doc-guide/kernel-doc.rst#n57


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
