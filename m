Return-Path: <SRS0=YSHk=ZG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1925DC432C3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2019 07:40:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C0C206DB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2019 07:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTJKEfqu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="V5dSsQTs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C0C206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oe5jMZll08QIQHzJLZrGGfjO6vmyTNPT2CofKdK7clQ=; b=OTJKEfquc8ZvCd
	wzx0O8pOnIEpVoPNpwDC2GCi/fbtRcFVqx718o8MECdIMGcUDDHKjjbMFcWyZts/qRKxV3ycKjU9o
	KegiZ1WqXUKoleuEYepEGX27poK9aibDsc9XTRl86K3b8t8cuJGCmJ6t+I6Khp9OGP7ItD8LhfhH7
	gB72F3Gv7s56pDqHBoN2AGf2aRwrjAZqjvP1rQdgE7AzUE/dYGnkoml8iJzUNih7FhQUYAf95E6yt
	0VfvMZr/3xXVrlOTX3ZZ4hdgNoQTZh9tWwF37FT1r3d44Z+Z57khq7LnYJPB4njpZzgjqt0OM6T22
	+SLWMBiBlesIS2zgGv+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV9ja-0004EW-DS; Thu, 14 Nov 2019 07:40:06 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV9jX-0003gO-TY
 for linux-riscv@lists.infradead.org; Thu, 14 Nov 2019 07:40:05 +0000
Received: by mail-oi1-x22c.google.com with SMTP id a14so4429523oid.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2019 23:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YMn33D1fvbsOQjVLRYkAXXQ5Mr3LhRnG3fNN+0bZFqc=;
 b=V5dSsQTsDt8RrkZGi2u+8jj4+O7/AdchvYLEDWZDIOo1jiwBEUk2EHUk6GJPamFBX/
 tWExz2iSLQmnLRTubNgcib2g+uFBMXKV1hEHa6B1IfSZOLE/78A6OqjnSQ29HNCCnZe2
 tW8TTwxPNcHaAT88BCFrfQjGvlaTOlX8aOdtnIgUssLBZGT8jNu5wFyDkEILEjpHaFXz
 3pnf0wpm0xbiKozJpO3b0XhQQi/CdRLoWJXu4EZ7RkpFejjgDD6Hm1Yru2qwY7RsBOfd
 fPzpuVIEuehujelxjW6Cg7zZ+Y3uhKVikM6ijBx0d0hyWqRQam1VgA8FnsyR9FwvIBr5
 22WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YMn33D1fvbsOQjVLRYkAXXQ5Mr3LhRnG3fNN+0bZFqc=;
 b=Yjw5wUhf6SyXMrQ40UWLm6y6tdQp/n1DqJPcm1qOqPp/CzaIOW0W6wHUiyc6dd64t6
 UZwXYkV4KksGURJexlnimPYOLzJUKlIfipfx3DAwzOaUjiDZfFC+A0gXoYvzzGzx+pGg
 4w8oR+51AmUBbO7AeLhQgiOCwcFPGSYCA36MQ3AlmmvBnTwUFV2GSiD89yI8DBR670Zb
 TQEi0btseVftEQXs4KAN+tP/SZKWguQ91/Sv6IgzQ0WL84Dp/n8d+9H2xs5PZ2GWwGl0
 COzxP2z5gsHRV2rTf7ynl5uAESOIFXhU4iOTNBl+wxR6A5uS2+WeZd2xl74sKFGl2fSZ
 Oo7A==
X-Gm-Message-State: APjAAAUgIEFEBMLU794hZZASZBkFZ0sg5GmM6AeLjmZR1OFVICU3sJEY
 Bdjc5M21y58AbxOWUfjyG9HYNQ==
X-Google-Smtp-Source: APXvYqwXkyMYI6Uj032rQa/wu9B9wzzpL5hREfSXGRjGQISEHzEQE1lpJRaydPGwDIIazZjbtphGmA==
X-Received: by 2002:aca:6c1:: with SMTP id 184mr2296358oig.84.1573717202583;
 Wed, 13 Nov 2019 23:40:02 -0800 (PST)
Received: from localhost (wsip-98-172-187-222.no.no.cox.net. [98.172.187.222])
 by smtp.gmail.com with ESMTPSA id
 e19sm1564350otj.51.2019.11.13.23.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 23:40:02 -0800 (PST)
Date: Wed, 13 Nov 2019 23:40:01 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/15] riscv: read the hart ID from mhartid on boot
In-Reply-To: <20191017173743.5430-11-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1911132339360.11342@viisi.sifive.com>
References: <20191017173743.5430-1-hch@lst.de>
 <20191017173743.5430-11-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_234003_966423_2DD28400 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Oct 2019, Christoph Hellwig wrote:

> From: Damien Le Moal <Damien.LeMoal@wdc.com>
> 
> When in M-Mode, we can use the mhartid CSR to get the ID of the running
> HART. Doing so, direct M-Mode boot without firmware is possible.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Thanks, queued for v5.5-rc1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
