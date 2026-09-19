Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DCBC982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 00:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73FojDuDFX1+IEL2WH0dVAfFKIsQooQui17pMCsWVGE=; b=h3lF4wpdhTYq+V
	z6hnJNSK7N83nLMJxyIh4xaDx4yCb3RxaJ8G9dGYqyj3FWiciySRn4MppGoYaDMWQigiGyYhUEPSi
	NeyjF/ATRgLOrO7xXtupOpk3/fi2Tnn0/4c6ZYB3cs5E4wDYQBuiM4hZbYGgJz6i7TtnFo1zIXb6B
	b5n6Waul8xaGko0zF6Vh9a9UoMosNR09QxEqjwpLT6vRIF9sd7P0zDl89h4iXCpzXN5LqbWNo9uGi
	PUJgWkoAFK9YY9rRgjwRGkQWJZht9GWjcVQwhulJ8oiIiDbKG+w9TwgRqnhI2qgJA9GQiziBU6jIh
	5Mi9ArS8JChuJV74RkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jES-0000000Fmz7-1HNm;
	Sat, 19 Sep 2026 00:47:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jER-0000000Fmyx-44Ip
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 00:47:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E0B76053B;
	Sat, 19 Sep 2026 00:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B681F000FF;
	Sat, 19 Sep 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778826;
	bh=0+tRIUSk/vz1y8ca3AElj8USwRZtbN01B6VHqlMiGYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=TUIfR5GPGnxk8JG0Y0+CMgb86/tByNuCgghAHDo2YgtZKCh6Rf8mHSb/oOAk+V+5A
	 IWM9EBnSpzq1+jQCedXGyY6nb/9qAUv/kYyZtSIikJuvdGLDkaURny7YsTQsCkt8nF
	 QtknLanwlcXaSv3qhj4cOGSoeliqqAly6FqDBppJSvaGWa9UAbMwMJrOy+jDVNX/vx
	 9gJmgYW6Ln161BJ78d6m1qLVjjErl8tjCvdW984+GujP0YeAtuM0jjxD/wzCK+rMrJ
	 8Sptfn1eiXBvR65P79iXCIl3NdoiY6DWjNU2naQnND/+CXgb4ph2Q0WYOzxmUGRYHR
	 qg/IhqLwabtwA==
Date: Fri, 18 Sep 2026 18:47:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zongmin Zhou <min_halo@163.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: hwprobe: use _BITULL() rather than BIT() in MIPS
 vendor uapi header
In-Reply-To: <20260917062306.46978-1-min_halo@163.com>
Message-ID: <795bd810-d382-3b80-bd3b-041b6742fe93@kernel.org>
References: <20260917062306.46978-1-min_halo@163.com>
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

On Thu, 17 Sep 2026, Zongmin Zhou wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> BIT() is a kernel-internal macro that is not available to userspace, but
> the MIPS vendor extension uapi header uses it without defining or
> including it. Any userspace program that includes this header and uses
> RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL fails to build.
> 
> Use _BITULL(0) from linux/const.h instead, which keeps the value at 1,
> so there is no ABI change.
> 
> Fixes: bb4b0f8a1bcb ("riscv: hwprobe: Add MIPS vendor extension probing")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
