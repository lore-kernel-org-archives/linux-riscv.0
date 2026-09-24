Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE4C9831A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KeQgTiz2dYS7bAZF+gi6TXFGTk0DMf8eDIjTFmunZM=; b=XmOe0pVWtdvXgM
	e0f4qphQkDjV4kVO4xRTNzgDR42igV6M3KH5zpvoW6BxuSBg72JjJDtCJcTpWH28JUB+77yGaXxeu
	cCPD4bOY6IXmQh7ie2W4RSTddbVPqLAi0O6/fKSCGYVXqOoAqnd3KD6x0LpejN4z3Gt5MFKPd1AB9
	Jm1teMgi/4oMtAJH6nZQsRtY2SAiN2aUPe3mvg4Q9IKe+lnerMzpQtizPdOnKHEoH+2qk4IfJ7sod
	Sit4lthPcDIZ1h0TyHVlFYIe3xQH1XFPhu9LYtYIxpp05lg/uBJB8sfl900Fzs8Cc5K9RYt8pLodQ
	bEZt7bwz2WOcI/tfp+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hUV-0000000AqPO-2eUn;
	Thu, 24 Sep 2026 11:19:51 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hUS-0000000AqON-2jk4
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 11:19:49 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CE4C31C7465;
	Thu, 24 Sep 2026 13:19:46 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:19:45 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jgg@nvidia.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com
Subject: Re: [PATCH] iommu/riscv: Report cache coherency capability
Message-ID: <arUHQrcUWgU5nbVE@8bytes.org>
References: <20260821112100.572037-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821112100.572037-1-andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_041948_832003_EB60C2B9 
X-CRM114-Status: UNSURE (   6.22  )
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

On Fri, Aug 21, 2026 at 01:21:00PM +0200, Andrew Jones wrote:
>  drivers/iommu/riscv/iommu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
