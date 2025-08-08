Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBB8C87FCF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 02:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Subject:Cc:Date:
	In-Reply-To:Mime-Version:Message-Id:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OISGSffBeN/iRiBGEJaPULZBU0/hY2ckWOjnz2GTSaY=; b=u3wHl5krQoHR1vWfPG+3cxc4eL
	8VbkTUQoGE0KRcsOSkErUaer+e8DMP50iV933nByyrKhLBNxjRV/8TngPEWI53m6bt38WJJiO5XgO
	1CA1azQV7HWCC9RSTvnbr7+9+ugpnrEPUneKGdQLkLS8vVOu3YomFUKHoCtqyW3d4w6gH5obvX+nM
	asSLjqHGDslth7tgFx/XlqfX2qylwmMmA6fBvhNDZMx2dmQjZZpvW9RRbXyipVeOERXwJn+6thL8A
	DeVsg7v/YXwbhJt+o3HC0nVZSDySx2FL+bfBHjPUYNcYM65UIsKvvrPXJfuEGMVSeMkvGGaV6LVLZ
	gGV6R10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukD43-00000001s02-2gIR;
	Fri, 08 Aug 2025 02:42:39 +0000
Received: from sg-3-17.ptr.tlmpb.com ([101.45.255.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukD40-00000001rzF-2sO8
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 02:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754620938;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=07ONC8WlXPk8jptQtuzE5Qmo9lm76KsnOsxW1x29sbg=;
 b=fghKz6D5f8uxOEZnZUWsXleorTqETF/thXjUiMvIqIpLC3l9kB64+slU7AWGMFx8iHOTn0
 zJ2nZC9oj6hpujGu3NRulUJhUclyHy3BD4DvdpiGPPKAkyck67vA4+34AXZECVzhTDOXi9
 mBsoxoiOycQdGeYFObju+bq8FuC8XE6Oje99k+3yeTNsojrGK4K6LwxKC4yGZfN9ETMnZB
 ySuZbtIdHjXJYi27nhe3Xi+Kx+OInPTkitBDFQEiG1iSMR+K2TTInpJnHy4r8MQxnMiCx4
 XVWw6hIIGCuxvFISJd6dFFxKpf9zkomizt5rjqbk7xQHplMonMpIUPWlNuAuAA==
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Message-Id: <20250808024203.16672-1-huangxianliang@lanxincomputing.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
In-Reply-To: <effb29be-6d14-47e5-ab71-454119467750@web.de>
Date: Fri,  8 Aug 2025 10:42:03 +0800
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<huangxianliang@lanxincomputing.com>, <iommu@lists.linux.dev>, 
	<joro@8bytes.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <robin.murphy@arm.com>, 
	<tjeznach@rivosinc.com>, <will@kernel.org>
Subject: Re: Re: [PATCH v?] iommu/riscv: check pte null pointer before use
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
X-Lms-Return-Path: <lba+268956408+bb2f65+lists.infradead.org+huangxianliang@lanxincomputing.com>
References: <effb29be-6d14-47e5-ab71-454119467750@web.de>
To: <markus.elfring@web.de>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Fri, 08 Aug 2025 10:42:15 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_194237_392111_D6C5822B 
X-CRM114-Status: UNSURE (   2.33  )
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

Sure, 'prevent' is much appropriate than 'check' here...

Prevent null pointer dereference in riscv_iommu_iova_to_phys(). Now, when
it's called with an unmapped iova, the kernel will not crash here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
