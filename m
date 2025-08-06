Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE9BC87FD1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Date:From:To:In-Reply-To:
	Subject:Mime-Version:Message-Id:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/G90f4EZcLN4aL1dL0fk1hLgBhrJgxXYzOF862I2Q4=; b=qvStino/ORvDIt
	3vXUlI5FMjRIBR1Nz4vaZ4zQY8hw6tiR3sU5AmkKQd4Mbi2IYlrFBDhzS5kpEi4jDDPf2l4Pilo7R
	GOLUHUO9WS73xVKXZdjOwVczaxVauWyP32mIjJeh5GfV3+ttm1/tFdmsuB4hrMpBimgquSWuuYus7
	hPj8N/l5GCUZ6z51YWoPLIBh4BUeBgnumbiErNOVeR8KroqfrVyOw9MYf9ClG3gLjgmOu4Km0VFom
	ecG4dEP46vmpKioH8pEicJl4DEy6Sn+9DxXMoTmFQ0ppzECgTcTKGlO8FQyzgci62m2iwY49mcAK6
	LJZ68VlvI9zomEoLNhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbCT-0000000Es2O-005a;
	Wed, 06 Aug 2025 10:16:49 +0000
Received: from sg-1-17.ptr.blmpb.com ([118.26.132.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb9d-0000000ErlL-1hsm
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 10:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754475226;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=N6l+1yHhMqXCPPSV577+GHyz1ZJez474BAHAo4bn/W0=;
 b=PBnTemmGDtL8WKUAg4buc23CSkgO2ucFQD5y3zZ2aM+7kiOoyfsiKt5TuyfEfbmRsH9r3V
 M4/rV30WLymf1TX1b1z7A/kB9vN+hCX4e1w4+EJo2Rsp1c5udE7h6KWW9xkw84QbIUOwre
 YDY5g13myROwr+OLymIqYWp7YG0iLzEJql/ckASP+hmQyMcj8z0EDUyPSSbrEveYrZm0cV
 ouovMlgCksGzDUsVpG9E0WmoKfHxHiQB2AmMx+VrnZozTPkUDO2omfcjBOSNtcKqyGxAE4
 7OGhdRAzmioLO9NhRNqe9Iqtsb/T/J7AFAC1bmiBRDDi8m32m/1OegA0DudRwA==
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<huangxianliang@lanxincomputing.com>, <iommu@lists.linux.dev>, 
	<joro@8bytes.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <robin.murphy@arm.com>, 
	<tjeznach@rivosinc.com>, <will@kernel.org>
Message-Id: <20250806101337.3350-1-huangxianliang@lanxincomputing.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
Subject: Re: Re: [PATCH] iommu/riscv: check pte null pointer before use
In-Reply-To: <1f419739-4233-474d-b00a-4e1237352691@web.de>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Wed, 06 Aug 2025 18:13:44 +0800
To: <markus.elfring@web.de>
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Date: Wed,  6 Aug 2025 18:13:37 +0800
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
X-Lms-Return-Path: <lba+268932ad8+938cba+lists.infradead.org+huangxianliang@lanxincomputing.com>
References: <1f419739-4233-474d-b00a-4e1237352691@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_031353_628258_46F5686B 
X-CRM114-Status: UNSURE (   2.01  )
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

Sure, will change to "Check the pointer before..." in a new version, thanks.

Regards,
XianLiang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
