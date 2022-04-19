Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31BBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3fwUOkut9yHV89q7pfrWzO/pyNt2cwNLpVTo29jiKmg=; b=CYSXLwlwAljtBk
	Y8hP7KtHtg0qfy5O5nf73ovDWJkpKMvuOovPBCKLId7LXXxr68aAFlmxA3tuHrRI49doZXmDCjUqi
	1DvNNcCdQb1UP6hP00qRrkgBVo25ZEtWfht36DELVkptTuLomvduJ9eAdD3KMYYoOzAgARjCLFrVZ
	JBDMFujnpEW3he4D3DHcPOviTtNNJ1z/h+4qJ4VHAyBkKt9xfAR+YL7soj8BW0MsECsiy/vmycfdI
	pai7kOW4CCtxDKfmMrWeMd0Gr08PI9r9ML9/nV4Xpu1QCH1ogt182j6W0FV429XwpmMfiusca1G9R
	kp7DSu88GbrtQ71Cq7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpXd-004YiS-QG; Tue, 19 Apr 2022 15:13:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngoli-004Eab-W7
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 14:23:53 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KjQvt5DVQzFqS8;
 Tue, 19 Apr 2022 22:21:14 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 22:23:44 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 22:23:44 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <andrii@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <kafai@fb.com>, <songliubraving@fb.com>, <yhs@fb.com>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pulehui@huawei.com>
Subject: [PATCH v2 bpf-next 0/2] Support riscv libbpf USDT arg parsing logic
Date: Tue, 19 Apr 2022 22:52:36 +0800
Message-ID: <20220419145238.482134-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_072351_288260_680B8C2A 
X-CRM114-Status: UNSURE (   4.38  )
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

patch 1 fix a minor issue where usdt_cookie is cast to 32 bits.
patch 2 add support riscv libbpf USDT argument parsing logic,
both RV32 and RV64 tests have been passed as like follow:

# ./test_progs -t usdt
#169 usdt:OK
Summary: 1/4 PASSED, 0 SKIPPED, 0 FAILED

Pu Lehui (2):
  libbpf: Fix usdt_cookie being cast to 32 bits
  libbpf: Support riscv USDT argument parsing logic

 tools/lib/bpf/libbpf.c          |   2 +-
 tools/lib/bpf/libbpf_internal.h |   2 +-
 tools/lib/bpf/usdt.c            | 115 ++++++++++++++++++++++++++++++--
 3 files changed, 113 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
