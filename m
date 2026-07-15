Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2465C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lx5tWl4R/1EPQU0x1SgWv4473UoJLfeiz7i2Y8NfcCg=; b=un5hEVAC/thfbX
	8AMPpguNVKf0yNZPR7Wgk+AZ1OJrZtQ0SJ2ge6xaOu9lQvYS3IP7zWdhWtj3YZQ5/O1b9c92kXAk5
	yO5Z16iQeLWhsPFetonrCdZfptnyjIY378Q/x90hY8HtULPwPcFh3wDTfnMOsymKxaKeUi/2BXZQZ
	OiiAnic5lfcqxt7cDiBbgWavMWbyCqJNhX0iSBoLC0uFrywqdXIM+DgKb741avgdVDcz3n8QFyVoh
	d0cB82yLATP5cmd3ps5g+mGFrPhd7FoldO+xlospaxocxT3NbRwc0F5uSzhXKVQq+w0XaMp4bNmdy
	8qGXMyFpVnnVXK1gfrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2ME-0000000FRkf-39r6;
	Wed, 15 Jul 2026 16:21:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2ME-0000000FRk3-0lF0
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 16:21:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D22461834;
	Wed, 15 Jul 2026 16:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D65E1F000E9;
	Wed, 15 Jul 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784132473;
	bh=D9crtScMd6wKRa8Dd1rnpK7lHl213SFq9ZDSAcbKOZM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YbTPT4WuylWKGZpQ1j/R8LwwfLP14NiZfBhNl1eYzLYbiPQwwKULdKfGNbeHRDSWB
	 tVPNpVIZ2gHYyON632UDTKVWp7DkGfIyHgRgCI0WrpKCm35zq/w/SS1mtQa9Vxsgyj
	 OFQEnorhcbHZvYCk9qQW2x/ahjIR1pWP9ELA0xaniWTe+yl3LHcntNmbrk5mY3m+SB
	 wrTc0wP6KvOnjTdwivwZqsFiWWqOeNYM6qTRrPDqW+oW97hmPbh7FJsKldDnAo704u
	 HSVSSnNWKmVigJYhgABIC5smTh56C5YYOHs9ChQ/g9wQFBmtlhYDmWztYoAwlxTXZu
	 QMYrtGxXX1Hwg==
Date: Wed, 15 Jul 2026 10:21:09 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    shuah@kernel.org
Subject: Re: [PATCH v4 0/2] riscv: Introduce support for hardware
 break/watchpoints
In-Reply-To: <20260518065920.872131-1-himanshu.chauhan@oss.qualcomm.com>
Message-ID: <cf01ccc8-e171-e397-f6e2-a7c05a37022b@kernel.org>
References: <20260518065920.872131-1-himanshu.chauhan@oss.qualcomm.com>
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

On Mon, 18 May 2026, Himanshu Chauhan wrote:

> This patchset adds support of hardware breakpoints and watchpoints in RISC-V
> architecture. The framework is built on top of perf subsystem and SBI debug
> trigger extension.
> 
> Currently following features are not supported and are in works:
>  - Ptrace support
>  - Single stepping
>  - Virtualization of debug triggers

Thanks for the patches.  Looks like it breaks rv32 builds.  Can you check 
that and update? 

thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
