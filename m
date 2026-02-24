Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C7AEFB80E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Saif7ko+2xPD10n0dvOVgEi/Tbc/OSjiNanSg9IcLF8=; b=q32lyJw0yR8yvD
	Y5wYbMqEUcC9H0s31A4Dt2Pft/EfsIgtsUBE1sjVsltigwS5BGgGFKBMng9QIRHA0FNWaO5h1APa5
	ef168sWIa1zRtWxUfufhWYGIfat9SWzPhMLP6HgeCMxi6qRsabY522/h51KRO1O/b1GPdCBuJfPIC
	+8xLHQq0oruVxRE1lLfP0tEtScuMDVeMFbwnadixx2u5hXJlUFW5sGluHg8EzgKm1N1cJZEQAK+UA
	QzA0qTvQmnHu+3ulQd2Kc1U40oR/t+S/E7C5Dv1RLSELCw6Go8yPJ4mH6lwnYj216EzC2oQGRZpP5
	33dA/scWurqAQTT8cTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumbA-00000001Z7o-1JWg;
	Tue, 24 Feb 2026 07:12:48 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumb6-00000001Z6r-1a3s
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 07:12:46 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 61O7Breb066493;
	Tue, 24 Feb 2026 15:11:53 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Feb
 2026 15:11:53 +0800
Date: Tue, 24 Feb 2026 15:11:48 +0800
From: Mina Chou <minachou@andestech.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        <ben717@andestech.com>, <az70021@gmail.com>,
        Charles Ci-Jyun Wu
	<dminus@andestech.com>
Subject: Re: [PATCH] riscv: fpu: refine FPU save flow
Message-ID: <aZ1PNEZC7XJQUUPG@atcsi01.andestech.com>
References: <20260205055342.572379-1-minachou@andestech.com>
 <3ed8b576-723f-4c3b-8394-cd9255c2b63c@iscas.ac.cn>
 <aedfd0d8-271c-4b98-a826-a21f3a244a21@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aedfd0d8-271c-4b98-a826-a21f3a244a21@iscas.ac.cn>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.32]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 61O7Breb066493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_231244_764750_EC6ED9E1 
X-CRM114-Status: UNSURE (   5.43  )
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

Hi Vivian,

Thanks for the review.

You are right; the sstatus was caused by task_pt_regs(p) being incorrectly
handled in older kernels, but the issue has already been fixed by:

riscv: prevent stack corruption by reserving task_pt_regs(p) early 
(merged in Linux v6.5).

I should have checked the latest master before sending this over. 
My apologies for the noise, please ignore this patch.

Best regards,
Mina

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
