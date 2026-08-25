Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86810C5DF81
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 00:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9JNwpKirzckwEEUDH3WGugoScsqRx7l9KM31QVpbi4=; b=u+ph9hZ7CLRteZ
	F20SVdx1sVaJfAObGXrOGFKmo4mHtQ6Fxo7aFsqAWZrzQr2VUQQBEJhWJIWaTElrdMyxP5NHI/AfD
	s1iqMkgKh3eT6m7/hWNB5V0bf+xghYYxZJhOal8tnukCQ5hSQeKHT2KYvAM5gZ5GW+iUcsRfHIKhl
	aZk+WVnVO4nKMx2gQ7fG1wZexla6E4kf0vU8S37thgbT1nW4ey90gdzikW739AhNgAe2HIaqoFONs
	/hE+lOLuT/DWEfFKRFFlXERx/N7+eIbIYupfyBlOqbM3PG2Ou47nN2JyN/Y7AG+aLVpgZEla2YurY
	v9WHF+Je62oZkStfYtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyegp-0000000HW2d-2QDq;
	Tue, 25 Aug 2026 00:06:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyego-0000000HW2C-0BWO
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 00:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3649F4004F;
	Tue, 25 Aug 2026 00:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E671C1F000E9;
	Tue, 25 Aug 2026 00:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787616413;
	bh=QnuYZNv7kotyg2uHJquSFJASkxV6zyfBg8U1vDPIMf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=PoHm60YON2M1h7k3mi36m4l8so2JaJ72kg4GFqWipeiR8s00c/X6UMa0as7Zy5Nnz
	 qI8/EfX67jB5HSZLZT7bdZiMJmLa2tvXv4/BPY4809njtKcxSiiZQU7zDyaoGBnKo7
	 YIXsXYr8LcEM4w+XqIRu1D/568a2VKOhQozb/LBVDpxLv9MBYKtaaOoCFlVgoFEbCg
	 JOeDO4ae9pFmm7chJg7GovSxHpzpjDnaQGnnZAgRQJ0rd5vH5yDIHR2jbSVK7JKCkq
	 6XtcCXO/Mu/HrmJG3Eu5et+cDaLfw+qmoOZM/re+6YlzdQiOm10whk6v/4F2kIrw+n
	 UqlpgR1BbcA9A==
Date: Mon, 24 Aug 2026 18:06:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    linux-riscv@lists.infradead.org, wangruikang@iscas.ac.cn, 
    ganboing@gmail.com, geshijian@picoheart.com, niehaitao@picoheart.com, 
    cuiyunhui@bytedance.com
Subject: Re: [PATCH v2 2/6] riscv: insn: Set sstatus.MXR when reading userspace
 instruction
In-Reply-To: <20260728094627.94975-3-yang.yicong@picoheart.com>
Message-ID: <6108297c-73b7-a04b-67d9-2ef444eecb60@kernel.org>
References: <20260728094627.94975-1-yang.yicong@picoheart.com> <20260728094627.94975-3-yang.yicong@picoheart.com>
MIME-Version: 1.0
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

Hi,

On Tue, 28 Jul 2026, Yicong Yang wrote:

> The __read_insn() uses get_user() to read userspace instructions.
> Bo Gan noticed that get_user() is insufficient in this case since
> it's possible for the instruction segment mapped as execute-only
> and get_user() doesn't have permissions to load it. The architecture
> provides sstatus.MXR for handling this so set MXR when reading
> userspace instruction.

If this patch fixes a bug with the preceding patch, it would
better just to roll the fix into the original patch.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
