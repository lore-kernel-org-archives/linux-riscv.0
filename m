Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E310D3EE77
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp/RYC8vt0JffubVMPSqhLhiBNtnKLa+KNw6jZQCvmY=; b=Toi6gOTvt+o/w1
	C3RXvQQjSRyOelCRJCmykcHpkpkuB1BAsh4bua7H9GSIEDDTnrq4lLZQs331mhOyFFlP7U1mvQfSp
	pHCx7hl9TKJcOlFrmivxqZ5syQgxNucYsUEuLy0C6J/3eeQzWaoc9KpUiAUVopX+rkJkTxxk5/L/z
	rgmmx3DyECxVsRkGb6zs7yVTdDDE1+ncLjswuFcP2zRUU93HB24ZnUOlDBGm5+KdZkeYRDDkyU0qu
	w+cIPjBJ8VF+uwCSBdSEIqiYBdfCt/sTJlAa5yDagfORieHR1OtxRinZOt//dLwyvn24sLEioB2G4
	9L37hAoogIqTvWIHSQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwe1-00000007LFD-1KVH;
	Thu, 22 Jan 2026 15:30:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwdx-00000007LEV-32tE
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 15:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E72D3408F4;
	Thu, 22 Jan 2026 15:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D54C116C6;
	Thu, 22 Jan 2026 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769095844;
	bh=ANg5M9bdXUHW9bMx19M0GjytrhaC2dSQ5F7F+spFkJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IYhT1yn4Bjgk3YWlRzOiqht4ndOe/2FortRNdEusRVbggBT0EGruRInA2in7lfeX7
	 lPZraa64Lz7NL4cseEA9rPcU95OYYPE1ho7FENs/kGc70IpaXjD3zgFItBDhn92Drs
	 BPlkJ5arVrS8FG17CLSc2RvrXaB5DZbz+e89cBl/y/+W93VuM6+J+sRsGXYvCqkS3p
	 DC5OMHBNauNWCys0NP8G7nGji3PLMPvwzx6R/N2jTxX6UuT/cPUg9OMJteSheyFsU5
	 +UeGqXJPS5Uya+qNfPnkDWn+qDTLjkbRhvK2csnMyL/16eUDhTeKwny/Tq/5+cdc2G
	 Q4KnaafOpi8eg==
Date: Thu, 22 Jan 2026 07:30:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Yixun Lan <dlan@gentoo.org>, Chukun Pan
 <amadeus@jmu.edu.cn>, Michael Opdenacker
 <michael.opdenacker@rootcommit.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: spacemit: Clarify stat timeout comments and
 messages
Message-ID: <20260122073043.3089d435@kernel.org>
In-Reply-To: <5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
References: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
	<20260121200439.64c22125@kernel.org>
	<5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_073045_790024_28B0953C 
X-CRM114-Status: UNSURE (   9.80  )
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

On Thu, 22 Jan 2026 18:39:06 +0800 Vivian Wang wrote:
> > Because if it's the latter we should be able to skip reading the stats
> > when link is down (still racy but better than waiting in cases we can
> > detect?)  
> 
> If checking the link is definitely up as a condition for updating stats
> would be acceptable, then maybe the original patch from the linked
> thread [2] can also be adopted?

Yes, speaking under correction if Andrew disagrees, but could you
squash those two patches ([2] and the v2) into one?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
