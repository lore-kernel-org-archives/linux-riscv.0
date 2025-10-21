Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D31CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOPwh3vGWQiszbEd/QkAuGr5NQkSZA8AU4QyrIe2J8A=; b=SdvZ9fCtbWfKU2
	UUnSfzLW8fluj1ap4QCyv5+adMXAImVSAkJq0JI+DW8YvYFMrDnfGxzOgyh5OXbfCuiAu1Ue0Z6cR
	WPjJdcRYXPA1za1ouPSu9AgFttzB06/jMtBplwndVCzcUxF9cFaUT4FooOCUGfbY4F/NDzATvl7pl
	2yzA71xBjSc84hBeIpGKEbKYa1h7ryBI16m/KBW6ovk9OC8nSvRHuhHq2lRIn9LLWAYR6SCmETCzm
	xruiEmkp3XRt8rnXoIGLmznkgMmO1rGIHz2zzCZvP6A6ToCdd1y46ALKP6+F3VFY60Z8W9kgPITJ8
	GJAaEJrg25VgMaNi8ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEfM-000000000fa-1ntC;
	Tue, 21 Oct 2025 15:52:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEfK-000000000ed-2rhY
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 15:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB5CC44BC1;
	Tue, 21 Oct 2025 15:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2FCC4CEF1;
	Tue, 21 Oct 2025 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761061969;
	bh=9P/Lr1X/j2n5O/qlIBo0JOjK9tJma3uiZrl+5Xsi0rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upolYJBSCVJF+eeYRQIYKE+kpNWegk+mfxlJoVJh7A8sVpoL8S/tOLipzjgM4mrTv
	 CjzKe9FpqbmSInniXQu0/MbsOEUBvpysE+hTSjQWDLTivvqIUCgnkKUgODJpByYQ7a
	 BrlRt6p2HWgRwc3c9ndd6aqLHlAJwvR8UfLai/TbQNIeuTtcRypRJwjsX4bosumTZ0
	 ydGix5IsMZ2INTcHC9f8AD9084OP1U0U3b6fQrHD6o9/1F4w4Av40TWSWT7FwtqxWw
	 i6y8c9Rmi+bK1CFR26tL+KOOfqFNrmAlfJvUTdwq9WTqc/dQ6qqhaIeVF2OMEgNKOp
	 qpKnQ/A4bKJaA==
Date: Tue, 21 Oct 2025 16:52:45 +0100
From: Simon Horman <horms@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] net: spacemit: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <aPesTcpvIS22R8YT@horms.kernel.org>
References: <aPd0YjO-oP60Lgvj@kspp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPd0YjO-oP60Lgvj@kspp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_085250_737498_086D91D9 
X-CRM114-Status: UNSURE (   9.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 21, 2025 at 12:54:10PM +0100, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use regular arrays instead of flexible-array members (they're not
> really needed in this case) in a couple of unions, and fix the
> following warnings:
> 
>       1 drivers/net/ethernet/spacemit/k1_emac.c:122:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>       1 drivers/net/ethernet/spacemit/k1_emac.c:122:32: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>       1 drivers/net/ethernet/spacemit/k1_emac.c:121:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>       1 drivers/net/ethernet/spacemit/k1_emac.c:121:32: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks,

I was able to reproduce the above build warnings.
And agree that this patch addresses them.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
