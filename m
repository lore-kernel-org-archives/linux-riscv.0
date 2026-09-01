Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6098C61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 23:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lo49IMO5gawzwo+lVMh/C8Toghbo55wwB8vOXeNmUyY=; b=qgCmtL/r/NGDPT
	ahh00AWq7zXFiezHuARsYnNpZeQw7Hd9VZIoxU3KUDIDI7qADFrqjt9NPdKkVkcGPz6ZOdPdRidvO
	d/yMQHJqVultAn5F4uN6sFj0qWX+nM89J7Kpqf3jZX4kb4rNGdFKmrN+JlnxQdW1Pm4WEnEc8EgfM
	r/emk0BloMAhRNDCQT6iNMICI3feraMJueVJvjM/l0HjEo2SqxJy/vyOwnswcWR/IdfFYzq6mSYbK
	9pumd70MAgaaweXmYHO0TIy7P9oSLX1XTOluzqbJbmwxsmhXX50RZnmN93TMjsL44x3Ea2sAKXw/E
	8A5vlqudhTKkj3KWB+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Xn4-0000000DWnW-0EAF;
	Tue, 01 Sep 2026 23:21:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Xn2-0000000DWn4-3AwE
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 23:21:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C397060052;
	Tue,  1 Sep 2026 23:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2E41F000E9;
	Tue,  1 Sep 2026 23:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788304875;
	bh=fg8HYCic2KvD6ERFxLi9YLdZaM4AaREOJ+wz6dO3tRI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=fCC9iU6aAOY4JY0zSYKbNrEJsY9OQa2tu5LBsjyKnn0CiSrtYX90J6Z0+eylTWVLb
	 LRUyJvMmzt+GsS7mk4lX5ias2MHl+nEp+RTDzmyP2OwyLKxmZ2MhrANfEMDSkga8t1
	 vwsdJiIQqsRFbg08FCyO8NDpfFI6vHdG+62vlSjESFQ97t0+EYfk3QdoXWS3B0DzOA
	 WJEU4LN6ymUsc3yagGOTvR8pISEUYJdhosGuX+JIKxnRkGdQpxB5AJqohzM5Qit/oI
	 T0Lquxe6t9JSfpN5W94+4PkeH45fRTZ+A+zZ8dXSWcBwY5CFDpb8rh3sAVj4n+cHuN
	 K3lotUhdaIljg==
Date: Tue, 1 Sep 2026 17:21:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    conor.dooley@microchip.com, schwab@suse.de, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: simplify has_fpu() to check D extension
 only
In-Reply-To: <20260901013746.19386-1-skunkolee@gmail.com>
Message-ID: <43f90c0e-239b-7b8f-2359-ee72bf2ecbd7@kernel.org>
References: <20260901013746.19386-1-skunkolee@gmail.com>
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

On Mon, 31 Aug 2026, Ivy Lopez wrote:

> The kernel never supports D without F, since D depends on F. The
> D-extension flag is cleared during devicetree/ACPI parsing whenever
> F is not present, so has_fpu() checking either extension with '||'
> never actually produces a different result than checking D alone -
> F without D cannot occur in practice, and there is no observable
> impact on RISCV_HWPROBE_IMA_FD or userspace.
> 
> Simplify has_fpu() to check D only, matching the expectations set
> elsewhere in the kernel for this dependency, rather than relying on
> a redundant OR condition.
> 
> sys_hwprobe.c already calls has_fpu() and needs no changes.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Andreas Schwab <schwab@suse.de>
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>

Thanks, updated to apply and queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
