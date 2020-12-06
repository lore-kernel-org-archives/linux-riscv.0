Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44136C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 15:55:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85B523731
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 15:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85B523731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GsT3tlt3rRGDwPqEXptMzrOjcpWd+6aN8OmvAkPnZdw=; b=MOvZCYZAdsgaYKGlWwfOMnpjtE
	FJywPBYnHxOKYVgLctK9D30eDmxmrOxiFJF1whZIDx1czpsARz+zLiw9yi3f113t6dwYkStk1xelZ
	zHtJ6PFcQaH/Dxxyrh0oeDH3YOf5Whg6P8aOFQBdNlavHWdpX4VuwX3Z/G6Zcdgs5tnt0zbaLM9Y1
	NRdEuC+82DQWeAEGJDW6iPPdvy3tjq5fiuOMlWtroQZK3e6m1lu/TOU384vcRunlEY1LSYYRJymid
	3YPjB9L7yrDVhRgdMYLdnc1MhPNvbyJJlvCAaXnSK/pxGfZk8JfdHT+F1li7o/BY3Iy6zMjwdRJyC
	iOZiljsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmIqz-0004F5-Jx; Mon, 07 Dec 2020 15:55:09 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klw6x-0001sK-UJ
 for linux-riscv@lists.infradead.org; Sun, 06 Dec 2020 15:38:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id f11so426915ljn.2
 for <linux-riscv@lists.infradead.org>; Sun, 06 Dec 2020 07:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XFi8iZWHECaf7T8C/4QfqGDkTfE9/yQ6tCKygQvbI/Y=;
 b=WBSlCBmnnabRXB4/bnpdG5c6XzxWhn7+JH4YUXn1nG0Xg9jpRAgD/0FCN7XzrwYsd/
 2moFMUrRJPYUG+sZnR5n5xHhgLYCibMWzzw1sS4qPfspKBusKeuL/uitQhBz8Q0MJYmv
 vcF0NWZmaX2ieVFTK0RsTRDNsn/eQLgJz6OEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XFi8iZWHECaf7T8C/4QfqGDkTfE9/yQ6tCKygQvbI/Y=;
 b=YWGtSSJ0um6SFkhG6UB6yu48dzV/Z7gO+A3ZNyx40b/EsCC6/gWnCJa9UADXOL5ENe
 cgrsWT78KN3/bcFAbPz2QTpRsmGJI3BCiBRorfVNdjtQYdhMaNzfaZpsVdHmorUC8ckf
 Wkn0RYpHESD7f/8R7T6UzGi+HQX7Yhky2r4OhM4jDafHFVaz6poonsLBqTWeLOVX2/bQ
 nI1FwFEVUsyh/qU/EHDaBz8fLgwlIrmyEZgwSUR4OsX99u6iH/tVwNy/Ri+ij1OglC+L
 TddUH29q8W/ZRjW8VwLjqSJ8NvOh0lHgEcIcsiSSQZCECLCU4zuvQgO/wpxLFIOVhXQJ
 B9fQ==
X-Gm-Message-State: AOAM531hjZOC3gp845189GglIzFSlnXKUniWmpjLP8+nDLvxnwjT0EgH
 FB/NW29KF2YPHHXxd4FsOGpqp/C9qWnufkYDSTSZ8rnxtf0y1w==
X-Google-Smtp-Source: ABdhPJxtRl/82paLiNG1ixCFv0dDdSmgNd8T73dLnzwQqnQrijgWQEs99uLm/4oxvwiQjVZh8pXM5GXqDu4LIr1fodo=
X-Received: by 2002:a2e:8183:: with SMTP id e3mr7420106ljg.267.1607269084434; 
 Sun, 06 Dec 2020 07:38:04 -0800 (PST)
MIME-Version: 1.0
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Sun, 6 Dec 2020 16:37:53 +0100
Message-ID: <CAM4kBBKVuyzb69jKWc_oWG8Y1u74Twv+67-8277N4rrOSXNo_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
To: atish.patra@wdc.com
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_103808_097566_26B8193F 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 07 Dec 2020 10:55:07 -0500
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

> Add initial DTS for Microchip ICICLE board having only
> essential devices (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
>
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-> padmarao.begari@microchip.com/
>
> Signed-off-by: Atish Patra <atish.patra at wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++

would it be possible to rename dts file to
microchip_mpfs_icicle_kit.dts? Dashes will not work with
SOC_BUILTIN_DTB_DECLARE(), and I do want to use built-in device tree
for XIP on Icicle. Thanks! :)

Best regards,
   Vitaly

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
