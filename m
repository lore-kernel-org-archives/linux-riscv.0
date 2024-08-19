Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C849DC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8s7r5u4630XA+kM5joIlFvLCddWwY2oIMTQyjBy3f5w=; b=VcORWq4PB3KQ/S
	gkjmwnqcIeEBm/tyuZdybTDwgH0hQk+FyC5bSt0Sr+Mxbbni1Jnk5k/UmJt1BgpLgV3sKT+cLfwGV
	HbUVz4kCCL3OcTgATP9L0ZeEBvBrVe47SrKXuDqoJZh7kMZa+onNOuG/Wc6eC4xP7qgj93mzho4KP
	czYRlpx/mWROBCLH3PL6Gj+loo8pmJfkNnBqn1OSwDqdN3My2a3bhp0NmkSy4VOX341/uxY35ZjAq
	fUW23CqDTCQuoS46ayrzlbga1l14lSaGMxnP05nA9LfNVXAdWarAcEJw1S0V42sxJg6tJlWBMhlGs
	RXut9HOsggZkThm3SFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sftYd-00000000Grz-08kw;
	Mon, 19 Aug 2024 03:59:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sftVr-00000000Fu5-3ljK
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 03:57:02 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-710cad5778fso3253736b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Aug 2024 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724039815; x=1724644615; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b2XP9qt4WiDnxVai+yZ3Q/QEPSSxZYo1oeVtpDg2Qeo=;
        b=BtHxT+NWTkt4vRUMzb+R8lixwl0pMMMGM6paNEslmPPZernrwPa5sIry7tRQin6y94
         X+3OQ8tXWh14oPse2Mw5wqafkeHHhN9N+FjPHXliA96La+k3RfCWiMnrL3Pofm0t57MS
         oZQhIphATaZOhzfwAsgkduHzAU+f7C2QIy/q6UkmY+iiXzrs9KZdhYMWcLr5z7E5ihO0
         jJDv/gS4CH0feOalSA+FVL0zkIxbj+a6FO3tR4MgOdA3ykXItHdKuH1uxKUX81Ka8QIX
         KBQPRP/uOi6UpZAn8EohUvdIBAuW6UPKAVGwSdNEb/8SbisD7JP6ZOQ+1MwVZKGkM6on
         JN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724039815; x=1724644615;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2XP9qt4WiDnxVai+yZ3Q/QEPSSxZYo1oeVtpDg2Qeo=;
        b=VKJNswS5/GcRDYn/LA5GmCxNCO/brOApEKuFmLamF4QOazWTMdNWEe2KHby/CwCQW7
         GyjaE7nwyymQLy9GdjNn35OGlqNKC9Bxiy1LEJ1/E6saJ8LybsTsdzurog5nzeyM4aNR
         DtU4S9VuRIRyqdxT++Nu4nXlZl+kqkGd0TzoyAM61eZqVCZq8tSZ/Sljfyzt5WO0piO3
         n90AfhLK63Z2zR1REP7RPYEUE3oO0LkQoLuC+9jZSXlDSJvv7rElgafKIxK4KizLpslh
         ICL5PnQMdA43LcEZifa8n+JEitZ6vU8wVGAQ15UgEaLxgWu1pLa2nSEWLFr4tA5ZYPVc
         wo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt8e6CwR/Wf4p5rdRmT2vumQu/SGhXddUnbIduT/CQ6PgKzUdqGbIM2GyM53xstXBQqMOOA5UPeibcNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXAKR7Ft7G8OzF5oXMK1FM26iLcwxee4tAaxMkiEkhWXl/cmLP
	BXgUmzRwWA9wL6/faeOAGkdYzvyJMRAQovaDvO8Ca9LptSjbQo/riGcHncu3z15YFto1fvCggNE
	Xg3VcpvXN9JKs+rkcJCpz0WdijZ+pki9AS+SgfQ==
X-Google-Smtp-Source: AGHT+IFRmeijuWgcIPUvZe5rDsbgHAprwbzoc9Fm+JAZIl1kHl+S6Lh8Zl5U6KX1nM3J1SaiRn5Awcetq43jZJrqJWI=
X-Received: by 2002:a05:6a21:3a81:b0:1be:d1bf:a371 with SMTP id
 adf61e73a8af0-1c9050477c9mr13184110637.33.1724039815234; Sun, 18 Aug 2024
 20:56:55 -0700 (PDT)
MIME-Version: 1.0
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 19 Aug 2024 11:56:44 +0800
Message-ID: <CAPYmKFsTcurrUiWqM8cFj+GgqfRiaLqPDGOTSE+RLyKJGSKE2g@mail.gmail.com>
Subject: Some feedbacks on RISC-V IOMMU driver
To: Tomasz Jeznach <tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_205659_988063_8560AACE 
X-CRM114-Status: UNSURE (   5.41  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org, Yongji Xie <xieyongji@bytedance.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, wangqian.rd@bytedance.com, linux-riscv@lists.infradead.org, robin.murphy@arm.com, Hangjing Li <lihangjing@bytedance.com>, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

Thanks for your brilliant job on RISC-V IOMMU driver. It helps us a
lot for what we are doing. Below is our feedback on the existing
implementation[1].

1) Some IOMMU HW may only support 32-bit granularity access on its
control registers (even when the register is 8 byte length). Maybe it
is better to provide a 32-bit access method for 8 byte length
registers like what opensbi does on ACLINT MTIME register.

2) In the IOMMU fault queue handling procedure, I wonder whether it is
better to clear the fqmf/fqof bit first, and then clear the ipsr.fip
bit. Otherwise the ipsr.fip can not be cleared and a redundant
interrupt will be signaled.

Best regards!
Xu Lu

[1] https://lore.kernel.org/all/cover.1718388908.git.tjeznach@rivosinc.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
