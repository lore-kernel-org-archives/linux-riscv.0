Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F4FF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgF5vBBjMhpAQV5xSLPSZjhmB2Y5PD4yopcG1G5eez8=; b=Fi1l9aqPP9b0qF
	EwYfqdmuq72+Ex2DzdjvuTgo6P/8aw2Y2/jmiwKJ0f9TSxjcTxj8BHPs5iK/ei/K3DkGf1PosJDvM
	cb6NfrkzLnkPvVQm+kzrlBoFaiEKn6EvcWZJYNzsXfHnK6QQ3X2twq6wvLFCXXXuPP1RLeAmYecFt
	bc/oEeN7GIkC5tFcw4J+AxS1gsOTPuam0SqPNmpvXvyehSRjXe36oqW8Hp95SUFDyFYzKPNyPvqcw
	YLafwe/RYobygZZJLeLoMpvazpdjGDv4WNLQuA8FltqENBACpV2iMbTjpRSy+Jm1K8DApNDyV3iJY
	RJIxnQBB4meUuquvz80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLeL-0000000Gy7r-1TLV;
	Mon, 27 Apr 2026 13:05:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLeK-0000000Gy7j-0lTU
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BDCF6014C;
	Mon, 27 Apr 2026 13:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3736C2BCB4;
	Mon, 27 Apr 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777295118;
	bh=Lza41XMlgAORgTPrOIxx0mVfW7vjfttcam+RAcvjn9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oyQ42UYK+wc4DTgrP5KucNJkM8LJkCpiocvs6+K2rvScnSoSLgwPDltTjJLy0S47u
	 Cuju+LoaIUnsNa+otM4IDuE69/NDK6OrTHKkE9InTm66ySgQyTwJbRwIoZ5BeZ3ZQM
	 8niiFZ7o/WlAjMgMJmCr0oV0KQgHUJ3SmMJkGQ31rSzWD8Vt2sZJ7WnnDtpdktc+Ui
	 YVG06+iOSQjMW8ViqkoMtoWRJapf7HhAJGOyDmwv5QhLraeMRYDP9pteBWqn8EOJic
	 UdFrvk7HqcAJFjLLPyshwtSK02PIyy2FA0Q7HB6GcT9Rm7Y3XTw1pmvNQzkO0J8a+W
	 kwnBpvjNWY10w==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLeG-0000000Bxxi-44yE;
	Mon, 27 Apr 2026 15:05:17 +0200
Date: Mon, 27 Apr 2026 15:05:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti
 <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v3 00/12] Auto-generate maintainer profile entries
Message-ID: <20260427150515.3ab3d3c4@localhost>
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Mon, 27 Apr 2026 15:00:00 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Jon,
> 
> This is basically the same patch series I sent during the merge
> window, rebased on the top of post 7.1-rc1 docs-next branch.
> It is tested both with and without O=DOCS.

Please ignore it...

> Mauro Carvalho Chehab (12):
>   MAINTAINERS: add an entry for media maintainers profile
>   MAINTAINERS: add maintainer-tip.rst to X86

... I forgot to drop those two. They aren't needed anymore.
Will resend it soon enough.

-- 
Thanks,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
