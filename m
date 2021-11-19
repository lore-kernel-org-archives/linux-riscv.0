Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0ADC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7632561AF0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7632561AF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E7OwrUAgNnW7jtCfOilcjCHofPV45siKdBzC27M3iJM=; b=nfKo984i57OJNT
	8McaNb4IosEa+VfecsCSwmMHca1CsbJsGkm7SHzp4X8a+QeL7Mzw31GyNaImeGpiLOqHouOURSIo/
	NxfizJgSodzINKhTKX029RWxjhHcdLpEpXlRD9AspROty+ZD4qVnLe54AFOP4qWmWWGp7T8QO7S2D
	WExOY+UaBWn92y9+I7X3mdO9P7jTJgUPm806mxEf7ZNGGfeJDV3bhpU0MfKNHbgz6bhCPRq8RiUNC
	9+DN/DRSOIEdStS/57rkWtCQ3TyOsLgkoWgE0L7J+30AqixVcYJ4Zl+NrWHf7dwdHmZ6yAK6lHVNK
	VSKVqSiWDEczc+he/Gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70I-00B5cj-BX; Fri, 19 Nov 2021 16:44:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70F-00B5bA-Ag
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:44:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so9252980pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=iaUYOytQ4CzTASh/0HsfVOpxwQKfPG9Q/UWHcdAuKg8=;
 b=7QZB70djv9ZmONgMWpzDrNHLi8Ia6mpxOQMSbYujLwCBXzg5+GyNrj7OmBWY6Ay7wk
 /VTAO8rstw9DtpmIypszmw2wepOutvL2b+LvnR4BoY2isCkax54KUsMAcYoWyPvZtExX
 qPpAc6khXoXZymJlV6kDTTIX5Ozoz8QlHNer00fk+AEwnmOme9ZlcNL+QGKhvV7D6/SZ
 tFyTXVDXAvTXRUTvnz4lo/XxdEJ2jgJ/Ej1grbY5cX1O2z9kdlE0ynQPPlhQkC4m26b1
 ogc3+sBTs2wfzjHW1B6Z5g6LBnJKCMTaNtdbEICcQiOhOkHSM1c9F+krylHBDjh+TMfW
 pDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=iaUYOytQ4CzTASh/0HsfVOpxwQKfPG9Q/UWHcdAuKg8=;
 b=yifQCq76GB3hVR14X4CYUSvZ0PaglnZEvhy3gTgWoY2PJu+PvhTayNKMK13nZ9ZG4F
 L9hac0LzCrd/fbpNB1Sa172ZkZqieGW84Tsj6g1Z8T4S4ZkN7+2NjWRdO7kluau5oIfT
 h/AJQP8OKlGyrEooEM+nZ4OkD3ZxV0O+ILN41jWq4eDickAzW7DfvcJogGE5yTPsO2IY
 197umI+n/s1T77CmL9Y/Hs/8GicxB9w0UPqwvpdyQRcwF2h8pUEwqmgB9sIR/g/B/oJ/
 VZCso++jiradOnnfnsqoXKS7gl4q21llbU8t05wenzhRRCHQjxMY52ddKG7O0EZL2LfG
 oihA==
X-Gm-Message-State: AOAM530oWdWp+KQPn3TF/cxxHcVZwxGKRF3iEHooJq72DAPGsoMo3Ivh
 YSJIarpIFx/1fwWH10qB5qG5tw==
X-Google-Smtp-Source: ABdhPJzJNl3mb5xDK9JGkYGImUGtSE424YEbPc3JVtF3+D8k2G5mMHaRTCWukgTULvW/XhOEDdNxMg==
X-Received: by 2002:a17:90b:1644:: with SMTP id
 il4mr1178367pjb.39.1637340282742; 
 Fri, 19 Nov 2021 08:44:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w189sm182817pfd.164.2021.11.19.08.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:42 -0800 (PST)
Subject: [PATCH 0/12] RISC-V: Clean up the defconfigs
Date: Fri, 19 Nov 2021 08:44:01 -0800
Message-Id: <20211119164413.29052-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084443_386276_7D684146 
X-CRM114-Status: GOOD (  11.23  )
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

It's been a while since updating the defconfigs, so I figured it would
be good to go through all the diff to make sure nothing was lurking.  It
turns out there were two minor issues, which I've fixed with the first
two patches.  The rest of these are just cleanups that should have no
functional change.

I don't have a K210 (I might somewhere, but I've yet to boot it) so I
can't test this to make sure, but I think patch 2 is the reason we have
a special !MMU PAGE_OFFSET config.  If someone does have one it'd be
nice to be able to remove that special case.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
