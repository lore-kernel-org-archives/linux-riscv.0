Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843EDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RqCXj5hu2liQABI7yXwE+SVH5yeJSz8+ZeiQIUczpe8=; b=HiKH2U4uUVthjW
	fwWo+60aggQUa1kbEqiTiTa5O2Zus+l7Xo8FYkqVwzARn39lBL8H528k5pHzUilLHzl6fWPXTOgL4
	BXdkgPEQYcRIkjYJKI9q1TuiGMlwyOz9KQrZO93EYUBsEYBGpwOezOoKiX1PItdWKjcjZtIrcDaGF
	gwx3F0SPLJ2pfBE/ILQJeER+8jtoRUJkP14bCzktpcYFZtH8Zuh2+BcvljiX66R3fpc7sCC77fazw
	HsroOdPIx9Dyy8nEcIGFd5KF5M0x9G2qljeskHoljXl6bcgehc3tpSi2b9XCbpGmezPV+YpZJQGkc
	zunxl5vbGoNwr7NI7jXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLQx-00Eg2U-7v; Tue, 26 Apr 2022 13:40:51 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLQv-00Efyi-6n
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 13:40:50 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Knjfv4Dylz1JBl0;
 Tue, 26 Apr 2022 21:39:51 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 21:40:44 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 21:40:44 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bjorn@kernel.org>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <kafai@fb.com>, <songliubraving@fb.com>, <yhs@fb.com>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pulehui@huawei.com>
Subject: [PATCH -next 0/2] Support riscv jit to provide bpf_line_info
Date: Tue, 26 Apr 2022 22:09:22 +0800
Message-ID: <20220426140924.3308472-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064049_458354_A104E829 
X-CRM114-Status: UNSURE (   4.62  )
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

patch 1 fix an issue that could not print bpf line info due
to data inconsistency in 32-bit environment.

patch 2 add support for riscv jit to provide bpf_line_info.
Both RV32 and RV64 tests have been passed as like follow:

./test_progs -a btf
#19 btf:OK
Summary: 1/215 PASSED, 0 SKIPPED, 0 FAILED

Pu Lehui (2):
  bpf: Unify data extension operation of jited_ksyms and jited_linfo
  riscv, bpf: Support riscv jit to provide bpf_line_info

 arch/riscv/net/bpf_jit.h                     |  1 +
 arch/riscv/net/bpf_jit_core.c                |  7 ++++++-
 kernel/bpf/syscall.c                         |  5 ++++-
 tools/lib/bpf/bpf_prog_linfo.c               |  8 ++++----
 tools/testing/selftests/bpf/prog_tests/btf.c | 18 +++++++++---------
 5 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
