Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA9DEEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWRcmzCFPOJMWpJN6XtClA1edAuvG+/WdG8EaTT/Mn0=; b=xCoShz0yiu84FO
	WeMLTrqqteECszOjnmqiN0J+GZ+07kmZBG0HnZmA6X5C/5+zl4kCDByWjB407sc2hce3HrbSeMtcI
	kcM/Ite3hDbn7AInIb/0SCFXY70v7J8zf6ySQN5P1YlKudh0jLjg4PcEiWvdWzMo8djHJq4R7G9X9
	jjUitRUltZUja+IWAewEhQncCOuRfmOlvM4GvdxODk75zTSFdi2rFskUv1ZbztqAhyg2F3+mswsf5
	2iFZu4MpPG27OzBSCq4b14g+xWrFiY3jmTfvV6op9Az3GZG8zoOGW/FjbSdE/3pMLxKPyg1RHKWYJ
	k0rvAYjZ1HTlsjqTnq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhIq-00000002nVk-2mJA;
	Fri, 13 Feb 2026 00:45:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhIo-00000002nVQ-1oI6
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7A0040C14;
	Fri, 13 Feb 2026 00:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07472C4CEF7;
	Fri, 13 Feb 2026 00:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770943497;
	bh=g8/MURX5BVuJlu5X4C6R8U/C0zgT48vc2h9gjgfiqtg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IKEcAA8nYgh4dA31hgkHOHGv3vzzMsSNUCiWJ/w+2YS+XYe7+Nrvl5m+ReS4zgqD6
	 QdSAInHeX8txKkQ2EdMUw+wDBEkKMFLDTXOVAS+rGat7/DkbBN/7ZSCL3F5WOBHMdS
	 kkihJBg9cC2dI2G7c8q3XLSpU/YC4Una96oOSple/eF3wEjO25ZRd4mPb3ZfW6CaVg
	 BEvA+5HZkfQzQnoIVPGpfgOEpbLOfkeYmMAcuoLmgdaHuyXGoROJQRF1DCj3zwxaDJ
	 BIys4L/X1GBNmuLXOw/tTOTvxf3Kx7V5g40EfRaF1Hr4YTRDWZw3lDHdKgn4TPt+ek
	 6/JW0MsOAyjhA==
Date: Thu, 12 Feb 2026 17:44:56 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    austin.kim@lge.com
Subject: Re: [PATCH 1/2] riscv: move kaslr_offset() to page.h as a static
 inline function
In-Reply-To: <aYwJ76yHaMbbQVJA@adminpc-PowerEdge-R7525>
Message-ID: <ced36cc9-ec5e-12c2-715b-ea38cebc7f42@kernel.org>
References: <aYwJ76yHaMbbQVJA@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_164458_511746_5EE3F40B 
X-CRM114-Status: UNSURE (   7.29  )
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

On Wed, 11 Feb 2026, Austin Kim wrote:

> From: Austin Kim <austin.kim@lge.com>
> 
> The kaslr_offset() function is a simple accessor that returns
> kernel_map.virt_offset. This commit change also ensures that kaslr_offset()
> is consistently available across various kernel configurations without
> requiring explicit linkage to mm/init.c.
> 
> Signed-off-by: Austin Kim <austin.kim@lge.com>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
