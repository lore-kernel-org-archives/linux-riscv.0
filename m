Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF7BEEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVHtBRkQ8SmRyPdPyuuPbiHxglB3sUFP3GFF6moWv+E=; b=FiRLzTxNygAwHf
	HVzq4ges2mltT/My35/7Z6W7ShDJtRriVr00JdWmsyjqdyKGnByfCKEFb/upF0j0+fGZA296fH0Nh
	jAXf1gdSWPSFaJTHdvAzLMLFDkaJfeimrbqB/WokczGHU6Z46j9o+rg4wmsu/GY5C2JeWrm7n5CS/
	mLSSDfX5ZTiApftNfEM4ADWg3fvN9CcnV2n5w/H3FgGsRBHfx3JkcaulzQy2aRiLvaGVvwz25u40x
	jYcIT9IlgGKGG2CwYU/xuXRPcVi4+i2VJS+9Xou7eTLKcJzDGyNvvo8p1D9P/40dJLlMbwSYoVjXV
	Tpd7y+yM8dUmGQzArifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhQ6-00000002nyA-0bXV;
	Fri, 13 Feb 2026 00:52:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhQ3-00000002nxp-42Xr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:52:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7805140329;
	Fri, 13 Feb 2026 00:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C701AC4CEF7;
	Fri, 13 Feb 2026 00:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770943947;
	bh=uu1NxSZhYoIgaWtt0fArch1Cgaq5w6gURv3CE33SuOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OiY6maEhLLyD1GB8nc2clUujo1Ds2RG0KqxBYLN7entB95FAxOnXeceCQeKs3nDF2
	 S3xEhA+Mok0NosyA9MBb9cIpR5gzQBhniahk4M9M5w4u+DOrEiR5MeOH/BUEMbcbV/
	 h9qDTiCpOFH/5SZITrVaUw4th056wlGFqj8N2UYutof9b9wo7le2s18uWmBBqM5DJM
	 XNj5BXt5ko/8LDcE3vsNbyT2dHxPU3zzwiUxWrFPCTeCn2uLwiaJOhaPXZGcAyMBvd
	 OFURddh/ccxZK4YSVh7cd4WdsTtsme7ZHFS0+GSh3bHPvUQwIXXb+bv43uNyiY8xoi
	 yJn8TtWS8zsLQ==
Date: Thu, 12 Feb 2026 17:52:25 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: increase COMMAND_LINE_SIZE value to 2048
In-Reply-To: <aW3gFmOlA/Z4kmfJ@adminpc-PowerEdge-R7525>
Message-ID: <55cbf9fb-6d13-a893-e8b0-429fe972e207@kernel.org>
References: <aW3gFmOlA/Z4kmfJ@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_165228_026386_1773897A 
X-CRM114-Status: UNSURE (   7.35  )
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

On Mon, 19 Jan 2026, Austin Kim wrote:

> From: Austin Kim <austin.kim@lge.com>
> 
> SoC people may send many parameters to configure the drivers via kernel 
> command line. If COMMAND_LINE_SIZE is not enough, they may go through 
> unexpected error.
> 
> To avoid the potential pain, we had better increase COMMAND_LINE_SIZE.
> 
> Signed-off-by: Austin Kim <austin.kim@lge.com>

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
