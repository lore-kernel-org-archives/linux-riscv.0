Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202FCC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L52GDw08uaU+eIBpG7yOsxelZGDIC7m53/FDjTnT/jI=; b=SOKR8p9bG4gbFg
	JwHEMIQ1pLvM7KyQ2zxQ0tehtyblh/NgzJ7aW0DP1oZSJ6hPwxfGfRPplAN9tKGNtakLwGBYU7JyC
	1UuRd+/csSijZASomMX8h+In98Eht3kv37uc8GhuhkmlrUZwaf8gV9wh9tzsEVW5JomwHJSHjYlWp
	1YdJFWfEb8bBPOS5iu9HsPBfkiHaT+LFFzO14ePOuiNgK9LBSXziwfv8xLD2F0Y+JiMkuPhFQ2Xl3
	9IxG+lSmo7HUEXt2FfRZH5wbzlnw3sYLUhwu7sakg9ZpVTGtxM/xKzF/fXJDY9rkrA2zLLDY04m0q
	esw8YVXfKn03WTgMI4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iEY-0000000Avvx-0eNr;
	Thu, 24 Sep 2026 12:07:26 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iEV-0000000AvvC-27GU
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 12:07:24 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1E6AE1C7465;
	Thu, 24 Sep 2026 14:07:21 +0200 (CEST)
Date: Thu, 24 Sep 2026 14:07:19 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Zong Li <zong.li@sifive.com>
Cc: tomasz.jeznach@linux.dev, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	mark.rutland@arm.com, andrew.jones@oss.qualcomm.com, guoren@kernel.org, 
	david.laight.linux@gmail.com, zhangzhanpeng.jasper@bytedance.com, yang.yicong@picoheart.com, 
	nutty.liu@hotmail.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v14 0/2] RISC-V IOMMU HPM support
Message-ID: <arUSRcgzWurL-YrL@8bytes.org>
References: <20260924100106.2054127-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924100106.2054127-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_050723_686073_54E018C7 
X-CRM114-Status: UNSURE (   6.70  )
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

On Thu, Sep 24, 2026 at 03:01:03AM -0700, Zong Li wrote:
> This series implements support for the RISC-V IOMMU hardware performance
> monitor.

Do you have a link to the specification of the HPM (and additionally the IOMMU
itself)?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
