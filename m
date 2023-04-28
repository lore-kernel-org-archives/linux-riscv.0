Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99FCC77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 11:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MA4/VVzo2KzcyE+pxrUvweF4pH6uNVHokiSHHt9Hsf4=; b=uaJ93psLH4Gdus
	64CnTOC2P2MV97DYKhLnGFDttzTTGRse+UmwlT1aTGqr23JoTv4hP6KWU2cPCSw+ppL5y+wU25BCE
	rnRPHNus7BQlPeYdamV80r1iEJlBMTm4AfjygRwjWbb2uh59a4RBME6a7QAGU3RvIem/pITlfcYjm
	5fQkcXF5FyRPvFUQYEzPf8+jJOFICXidqSlyV7atfqk0X/WOo7NgKYOFABaYeOo4GG4mcKqClWILV
	R1SHs8DHDscYTOxFOccrGio6j8nrywx+tSnBWSVSr3fI+KnFKRNPIT/rOQYMW2LG3UbVn8BK0EwQ1
	iyt2r0eVkRarI70q7mIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psLst-008zse-2b;
	Fri, 28 Apr 2023 11:03:27 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psLso-008znF-2y;
	Fri, 28 Apr 2023 11:03:24 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 15F613421FC;
	Fri, 28 Apr 2023 14:03:15 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mta-01; bh=4h2SwUmKqyEj//oKvHv7L86S6YYJSISewvHhvX30x80=; b=
	I9YprWdnZflhKXzR9FlJNgaSoUNimkaPEqUmOCrInvjD2eqP3qQNzC1puhlTkUsv
	bvrG98PaHXP8VDdYa4kWDJnMrv5EExu/T1kCseRSAaUb8WKgqXTAQMThOjNpacPp
	4RSYJBm7UaxWASKu/gNBpLcNsJeE9J/xkwMDbpu+AXM=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 0C101342196;
	Fri, 28 Apr 2023 14:03:15 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 28 Apr 2023 14:03:14 +0300
Received: from rdma-x86-2.dev.yadro.com (172.17.27.123) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 28 Apr 2023 14:03:14 +0300
From: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
To: 
CC: <linux@yadro.com>, Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>,
	"Atish Patra" <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] Limit the number of counter returned from SBI. 
Date: Fri, 28 Apr 2023 11:02:55 +0000
Message-ID: <20230428110256.711352-1-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Originating-IP: [172.17.27.123]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-Exch-05.corp.yadro.com (172.17.10.109)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_040323_496241_C1C97859 
X-CRM114-Status: UNSURE (   8.25  )
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

Perf relies on reliability of SBI. If sth goes wrong the code trusts it.
It happened due to some debug process that I passed more than
RISCV_MAX_COUNTERS to perf from SBI. At the first glance there were
bloating of kalloced variable pmu_ctr_list and counter mask recycle write.
May be there were some other effects. But anyway it is better to add
extra check.

Viacheslav Mitrofanov (1):
  perf: RISC-V: Limit the number of counters returned from SBI.

 drivers/perf/riscv_pmu_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.37.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
