Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0180ACCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGRpF7HXUcMfH5eO0zQTTsFkY5/BAAeyGoshtFpSLzM=; b=JwS225GYK0oJu5
	jUw+SP8Ryui7Qa9MFT8bGtAVnFsSHmQdwsCldUUZIPZpEVIGEo5IsVFJB5qu11QWIYC9dO6dU5mq6
	WtoA6GJi0/D85E+tgENHr5sTLQsuLd+U3bFt1Qwmu86y/o3FnTQe4hHm92YGQWT2VonKVj5mtlLuY
	krmmN92QVaGHOY/cYCGA5fukZGw6sn7F+DxNJb1aSfx3Dejc6X/lj7XokszB9YB529wEtIvU36WCf
	38365x35rtrzabfk6XpofY5ELsrlYDLr3MPdsI+gD3GkUw1bj/49Jk4Ixsd4igYUmezglbMS6jwSu
	247hq2EVfGZZ/SjNPSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBYB-00000002WrZ-0X4n;
	Wed, 29 Oct 2025 19:09:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBY8-00000002Wqu-2tZa
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 19:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB6FD621E1;
	Wed, 29 Oct 2025 19:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB87C4CEF7;
	Wed, 29 Oct 2025 19:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761764975;
	bh=pddlYHbXyxvJ+sUApRo5BWMGEDNsVZD5JUsrd2Csd5U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RKbiHL23l0qCb4nwGP/5qMwMah4pg1Letgr7ec8WjfOvoVfGe3Bk2G9ovs/tzEEhj
	 oPbpXTZDgDrInuMnfuwfkOgsd2pQFDbffaE0aUsTEMoqM4Z+6xmLMG04a5QcLKlnLf
	 7jOB4hgPmfrAJsU5kk5lM+hefy8VI9uZbNlmyzyoQdF19MET8Lh6lRRJsCKoDeHQ+s
	 k6pDOBrEFac9Khwd6+xQeRAAqH5PVcwIm65uFMxKpy8W7AlTMnrTfvX77NxvCdtTUr
	 wNc9eEsew2mcAFJsLvK/KqtJyviWTMPr/xj71+LCaC+yyNOrxZDts6FDmeOMKpCJEC
	 QtFhxZj+p35TQ==
Date: Wed, 29 Oct 2025 13:09:33 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    emil.renner.berthing@canonical.com, nicolas.schier@linux.dev, 
    masahiroy@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Remove redundant judgment for the default
 build target
In-Reply-To: <20251029094429.553842-2-jiangfeng@kylinos.cn>
Message-ID: <84a130c3-4a06-44f0-2282-6b05f38fe661@kernel.org>
References: <20251029094429.553842-1-jiangfeng@kylinos.cn> <20251029094429.553842-2-jiangfeng@kylinos.cn>
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

On Wed, 29 Oct 2025, Feng Jiang wrote:

> The value of KBUILD_IMAGE is derived from $(boot-image-y),
> so there's no need for redundant checks before this.
> 
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Thanks, queued for v6.18-rc fixes.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
