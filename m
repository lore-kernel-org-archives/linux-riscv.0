Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07434CA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wCjh3gdclX3xTGukSAGn7R7zq6TFXNW/jD6oX2uZvw=; b=DqBUio1ol2cWqa
	EnHFpdokLQYOOQFIJZEh+pvGNFweGqvdsaK7oZTOABV4G8qSW/CLPDr11hSVhKw1lqEqDlh5W8fCO
	/SkOBCkl+OL+mZONnH+RQeAOkS7hAOe4Q6OnivTLDvUGDdi5+E5S4xOdzFEYUXUwrUkFWStuyGEMT
	b5JjiWLn6O7BL2sPwvn8iMM287YMwzl5g7+Oj8V493ylst3L0anr27X67uv+GZKYotgnit96s3Wq/
	NeR2o5WDYC81K2agM78voTlngP9MoYfxWrZSDYIoDEcKnchZWwjDB0nBauO7MVmXjsAros3YQaxQi
	RfeYxAM5BWxHlhuNgucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5df-0000000HWib-3k2f;
	Mon, 28 Sep 2026 07:19:03 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5dd-0000000HWgs-2CJF
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 07:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790579939; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=5us/RZ+l5WokJ2odPZKdeAklrp3izYT6SAUkDcn6wMA=;
	b=mNDdEeynT9RkO+BOOArjDlR5u9uQtCTdQ8T6Li2SuVwIf5saihioJKN77i6E9AufDl4RIWFb0NmQdkbTc2nyz8u2Ct9REtvTf+7yxrmmhGDru0qiF37TJ0jfml+o5oyZa8XzXTZZy3mle2porBIoRhMZvF2QLaUWkOBsbCREttE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBjcVQ2_1790579937;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBjcVQ2_1790579937 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 15:18:58 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 3/4] selftests/bpf: Enable gotox liveness test for riscv64
Date: Mon, 28 Sep 2026 15:18:44 +0800
Message-ID: <20260928071845.2432-4-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928071845.2432-1-cp0613@linux.alibaba.com>
References: <20260928071845.2432-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_001901_725640_809B761A 
X-CRM114-Status: UNSURE (   7.58  )
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

The riscv64 JIT now supports gotox, so enable the gotox liveness test in
compute_live_registers.c on riscv64 as well.

The guard is 64-bit only because the RV32 JIT does not implement gotox.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

 tools/testing/selftests/bpf/progs/compute_live_registers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/compute_live_registers.c b/tools/testing/selftests/bpf/progs/compute_live_registers.c
index 941b65fe7c07..e482c10004a0 100644
--- a/tools/testing/selftests/bpf/progs/compute_live_registers.c
+++ b/tools/testing/selftests/bpf/progs/compute_live_registers.c
@@ -467,7 +467,8 @@ __naked void subprog_ret_reg_pair(void)
 		::: __clobber_all);
 }
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)
 
 SEC("socket")
 __log_level(2)
@@ -506,7 +507,7 @@ void gotox(void)
 	: __clobber_all);
 }
 
-#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 */
+#endif /* gotox: x86, arm64, riscv64 */
 
 /* to retain debug info for BTF generation */
 void kfunc_root(void)
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
