Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39930109E522
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 23:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAtFEtEF+A9JzTvWy6baL5U0hCCCk+ltMrjwoB4TGTQ=; b=0uTQZuCC4Jbay8
	ybgA2gCgr//VuCd39Hm/yaE4pFrzwn88CeJvBYqNv8wTv7LvwjbpxlRRV90c28qMLhL9gmM/n7vEe
	9drIQk8OktyiAM8WIQO+VqnP+lidI1NhghdJdAiI1CK1Hv7mjHZerci0ldALz9XCECLfNo+8vDr+9
	2dH3Ojnn4DI/BHOWqLVFg7lbS46RjYy+8k8GY63xK5bNbPoGJdZUMUE4T9zU1lV7YzHAo6V8GITH8
	Hhc+NGdb9NrR/xHo1o1zdUy2uwSDh1l08NH9AtPT1+k5YJ99qkf3hn4ZcWyO0ZXo8tC1Hw57558Cp
	ZHmiNmYFG89nsD4r7Isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XLv-00000004P68-0gFe;
	Wed, 25 Mar 2026 23:09:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XLu-00000004P61-2at9
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 23:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DB9160053;
	Wed, 25 Mar 2026 23:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9685C4CEF7;
	Wed, 25 Mar 2026 23:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774480169;
	bh=zBYnC10t2KEUQDzcpYEXzce3sc3uInT0C+rPtVmdkC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LEhVA/78qKyo/9iJst1YMdeenwhPV6n42n+ToOdV+0sQXlzbsUI6rRrKVOldeLFAu
	 nasL7dW47lBs9pnorL4YxnNtO16FX793ojVFlwFGCiP85qJ5tpYWNJbDQKKJYuKHGf
	 dJUimslhtk4I1ffmqDAHk5IdAAM5ZlZSqcMAF+EOTQUR6GC5Qrxlw7BUGsDCtFYBx8
	 CqM9PZtVzOjSVnUSM3XFHEdRHR03Lix++7XAbBFG5p1dARp0n4YdEKcnlH8s1uIfJV
	 zL3sRhtJBXcaG8yJJSvlTMzYYwP91aZgNu9YCCo/EQcRZo8HFPa7wV274rhS3CUxCo
	 S9+xu84TMp3kg==
Date: Wed, 25 Mar 2026 17:09:26 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "rom.wang" <r4o5m6e8o@163.com>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundatio.org>, 
    Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Yufeng Wang <wangyufeng@kylinos.cn>
Subject: Re: [PATCH] riscv: enable HAVE_IOREMAP_PROT
In-Reply-To: <20260306112734.108186-1-r4o5m6e8o@163.com>
Message-ID: <17838da0-c3e3-6211-72da-e986f9986e70@kernel.org>
References: <20260306112734.108186-1-r4o5m6e8o@163.com>
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

On Fri, 6 Mar 2026, rom.wang wrote:

> From: Yufeng Wang <wangyufeng@kylinos.cn>
> 
> RISC-V has implemented pte_pgprot() and selects GENERIC_IOREMAP,
> which provides a generic ioremap_prot() implementation. Enable
> HAVE_IOREMAP_PROT to activate generic_access_phys() support, which
> is useful for debugging (e.g., accessing /dev/mem via gdb).
> 
> Also update the architecture support documentation accordingly.
> 
> Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
