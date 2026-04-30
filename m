Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF68CD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 20:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fuaUTfyNGYwTIqzTVJoyFfHaXMmSPN7gFTI49TSWV4=; b=V9RzoZbtLm1/84
	BFcArcC5LRY49g4FR0niGhr3v6i30IRPQ4QSq64xQ7XojWuxngbXrL1ChcOeWDgJl5miGsu9Utsst
	4GJOuHIifabk74OapM98ybXbjnI+Vv3WIr0vmtN8BMAhEd4Yw2GETMnC3mH+KdgcZTvo3qNVMHSek
	9o3p04p5jr0+PTrOJI1U5gN7bcLJ3/Fz+iY8XI1lprtOytixpZMkeSbyij0+VbTJht3RtCbWSPFoe
	vQs6b9M2CZYrcfIhQ4xHf82v3suBKS94EQU7e4o7sj0TtNFuL4dPb3/WXilxULCOotoadu4g6Moz2
	MMG6ssI18WC1mEZLvf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXgP-00000005tnY-1JT1;
	Thu, 30 Apr 2026 20:08:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXgN-00000005tnK-447o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 20:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 173B96014C;
	Thu, 30 Apr 2026 20:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84913C2BCB3;
	Thu, 30 Apr 2026 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777579702;
	bh=8OtbdMRbfOue839bk+sXktHATPH+3qPIOw6xZKK7DZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fK3MhK9kCdLHmMjtWZe70Ox/VtLcx3NSz+XngQeD8SAHh6U5Xxb+SzIK/UbdLwgzk
	 Em8ECR2oxPJmPfX3jYNy8Q9qopLte3XZL4Ok/jjrdgEtqYltH3xydo7DS7w2XUnvbu
	 8ie+f/pErKfXVAgiFcixIqqgN/mjFD1R9VxC2KVQFFP6SbCLnk9kCnnWt8YiBKxXN2
	 SiW+XLvwM4MVkfKr/weCw6fCVfUDZNLl+6dQvcXvVLA0cMFHPrOZ5jnaRGCFZJ6tKV
	 vDRiYK+BocU8wh+1TSFNXQAKlafmM1sfwf6j57JAV0pzR+3zlDNeGoKHz4WOoZds2V
	 fHXoOiQ9y+KIw==
Date: Thu, 30 Apr 2026 14:08:20 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Avi Radinsky <avi.radinsky@tennr.com>
cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    corbet@lwn.net, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: cmodx: fix typos
In-Reply-To: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Message-ID: <ec533d17-0d7e-15ec-308e-0198e027ac28@kernel.org>
References: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
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

On Wed, 29 Apr 2026, Avi Radinsky wrote:

> Fix typos in the dynamic ftrace section: atmoic -> atomic (twice),
> pacthable -> patchable, derect -> directed.
> 
> Signed-off-by: Avi Radinsky <avi.radinsky@tennr.com>

Thanks, queued for v7.1-rc.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
