Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB646CDB474
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 02:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tFlbOUjbx0yftlnN5lYgX5ntMMCmL6eU+Sb/gC1PkYY=; b=UIXYMKSI7P1S1v
	11WB/G/NqxDkHcnJDq9ih/8G2pUaHs72+n3JJkR/lLpRXTYWT1Xu04E/oM+W6I99k1MCix0qT17GU
	gQetMz8w66/agG8Ax6rPXQppoq052wTv9pCEjXTaom3t0asGgLc2F/3fGLBPvb7fZrSUwjdcOgjG2
	Ceg38H19ox13zva/qlh1C7Hhn8BjsHtpkoGRFQqr7hzAMa413l/udDNISiWu20GLMRv451L+qz5ri
	SlqNCFWbv21Vk78dJFimr+8wYKQlxRcXjGtgk0Lj1ab1BZI0k+pGuCq/LDFZ9oabkta85000dcc39
	cA4Abgbl2Ngijdbf2cQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvwO-00DZTQ-2p;
	Wed, 18 Oct 2023 02:05:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvwI-00DZPs-0U
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 02:05:41 +0000
Received: from dggpeml500003.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S9DdG44J3zrSNb;
	Wed, 18 Oct 2023 10:02:42 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 18 Oct
 2023 10:05:19 +0800
From: Yu Liao <liaoyu15@huawei.com>
To: <skhan@linuxfoundation.org>
CC: <liaoyu15@huawei.com>, <liwei391@huawei.com>, <rostedt@goodmis.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <shuah@kernel.org>, <mhiramat@kernel.org>
Subject: [RESEND PATCH 0/2] add loongarch and riscv support for kprobe args test
Date: Wed, 18 Oct 2023 10:08:56 +0800
Message-ID: <20231018020858.1304218-1-liaoyu15@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_190538_415942_000D98AA 
X-CRM114-Status: UNSURE (   4.72  )
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

Yu Liao (2):
  selftests/ftrace: add loongarch support for kprobe args char tests
  selftests/ftrace: Add riscv support for kprobe arg tests

 .../selftests/ftrace/test.d/kprobe/kprobe_args_char.tc      | 6 ++++++
 .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc    | 3 +++
 .../selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc    | 4 ++++
 3 files changed, 13 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
