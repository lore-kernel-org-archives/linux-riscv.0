Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D81C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 23:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D8D21773
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 23:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tazxspUs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YbkFofSF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D8D21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+MhB2VBExxpGywl8EnMoVD8wm3FN7dU6TAfIioyWfiY=; b=tazxspUsAnW2s6ZxHzqTYWTnq
	PIIgGE+IYEPnf4s/VvV1Gn9VV7oGUn0zOI6Gy5KsAmZj03bPLAvwKV/R4Z7cRtqVlOB0ONOfJnBZF
	izGvw3WuNETrbUXIRcXvsMOcO6vSA0QTp3qdaVuBLtWkfPkpF5Ae939qk6EShTuJQJHsAjxE0yJHV
	n0IK8M0tJ4L1WNJujs9jS/TfvumUf7ZSKWvrJ+fL/KMFztvHUBLD3SGsOu9nXae/w2ylnBMohUv4s
	YKL7NrtyolHXFA8gHmOcTM29mo0opknqNR6Qs0Zl1bKUu/Gwkr9ZQxV3/+PZiGWDvXlay0hIAemnb
	kT9daB8zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJREJ-0007C9-Qo; Wed, 24 Apr 2019 23:23:07 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJREG-00077C-HE
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 23:23:06 +0000
Received: by mail-pg1-x543.google.com with SMTP id y3so10149491pgk.12
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 16:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/z9H1bjGAN+NhWO4cJm4XUDJLQDERO7DpYsjfK91LLc=;
 b=YbkFofSFfog0jO7FGGCcAlnOh/4CSJOMHqL6e3bBGVQjiJk/cCD/K5LCnXZobO7XRE
 +8p7yjwtiMXTzJSk1f1kfhGLeDcmCrPBuFa3u84gyW/RbSK5hJudqYwsHX1J81Dl4FEd
 coTbWdFPhAaDYKU8rBBJUkE6yy6rCjqX+uwtG8SLGdjtXWRaEwedGp+XmhLQyw3JtL4/
 fSuZk6y7gx0Bnj6UEGF8NyReO6/g/jm+D02fBNIL4prq4ahdzYWJeCtTUxlOc06xKgcH
 cBLj6qw5LmurioHtGKiLmbIr0oktn8kcSWSEezFdBPHAvEt2Neh0YIa8J27XfY7RHAG3
 Wf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/z9H1bjGAN+NhWO4cJm4XUDJLQDERO7DpYsjfK91LLc=;
 b=Mwfqdgi3GtoTONY+furGzqnUMWKEUpn6gfNo5osPWtygDo3B9Z5ZPrs34uItCKi9h6
 4eqSqqC5DXuJk8EagZrQ5o9xBCwWFKS45LxD0xF/CULJKeAgrXr6jxPyScwAZF/31LsV
 X/YkR6rViWLPWBpNvfe6j7IRirbnUc6rw+2C9GEY564QuHHw1KTqIpzsRi6pmLx2QGwW
 cY3kbcsakw1AgcjELjPLEHc/5qPAvRNuf61a6159LfBa3B8PCa0wISPTGL+GDkT5F6DX
 b2F5+xMnyadh67lJBPEmG0DKUEQHJ7xoewH0ll6cca4yAad6wpvY8UL+ZkiyT8dgo2+D
 9+ug==
X-Gm-Message-State: APjAAAXnlE+WnA+JkXaN0aNwNDSdbf4FWT1UrIsAcvzdnnlNvyuPSYTz
 1MwVNE6u5SZuK8/3DC4SZtIR7A==
X-Google-Smtp-Source: APXvYqzjjA3hX2DuVpPR/WNJ/pnpwN5twO7NMUKFHEU2IhtSQELT5m6yP8Joaoo/kvZ0eqUdXznVgQ==
X-Received: by 2002:a62:2ad5:: with SMTP id
 q204mr35815462pfq.259.1556148183563; 
 Wed, 24 Apr 2019 16:23:03 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id q24sm27357806pgm.16.2019.04.24.16.23.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Apr 2019 16:23:01 -0700 (PDT)
Date: Wed, 24 Apr 2019 16:23:01 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Apr 2019 15:49:08 PDT (-0700)
Subject: Re: [PATCH 0/7] RISC-V: Sparsmem,
 Memory Hotplug and pte_devmap for P2P
In-Reply-To: <20190327213643.23789-1-logang@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-8e27a4f1-db30-46cf-b987-51bba8cd96c7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_162304_609640_47895C52 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, sbates@raithlin.com,
 linux-riscv@lists.infradead.org, logang@deltatee.com,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 27 Mar 2019 14:36:36 PDT (-0700), logang@deltatee.com wrote:
> Hi,
>
> This patchset enables P2P on the RISC-V architecture. To do this on the
> current kernel, we only need to be able to back IO memory with struct
> pages using devm_memremap_pages(). This requires ARCH_HAS_ZONE_DEVICE,
> ARCH_ENABLE_MEMORY_HOTPLUG, and ARCH_ENABLE_MEMORY_HOTREMOVE; which in
> turn requires ARCH_SPARSEMEM_ENABLE. We also need to ensure that the
> IO memory regions in hardware can be covered by the linear region
> so that there is a linear relation ship between the virtual address and
> the struct page address in the vmemmap region.
>
> While our reason to do this work is for P2P, these features are all
> useful, more generally, and also enable other kernel features.
>
> The first patch in the series implements sparse mem. It was already
> submitted and reviewed last cycle, only forgotten. It has been rebased
> onto v5.1-rc2.
>
> Patches 2 through 4 rework the architecture's virtual address space
> mapping trying to get as much of the IO regions covered by the linear
> mapping. With Sv39, we do not have enough address space to cover all the
> typical hardware regions but we can get the majority of it.
>
> Patch 5 and 6 implement memory hotplug and remove. These are relatively
> straight forward additions similar to other arches.
>
> Patch 7 implements pte_devmap which allows us to set
> ARCH_HAS_ZONE_DEVICE.
>
> The patchset was tested in QEMU and on a HiFive Unleashed board.
> However, we were unable to actually test P2P transactions with this
> exact set because we have been unable to get PCI working with v5.1-rc2.
> We were able to get it running on a 4.19 era kernel (with a bunch of
> out-of-tree patches for PCI on a Microsemi PolarFire board).
>
> This series is based on v5.1-rc2 and a git tree is available here:
>
> https://github.com/sbates130272/linux-p2pmem riscv-p2p-v1

Looks like these don't build on rv32 when applied on top of 5.1-rc6.  We now
have rv32_defconfig, which should make it easier to tests these sorts of
things.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
