Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D48ECA5FA3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63uuawQho9/Dy2neVqupSpT4V967UlRRtJH1v7MIsKA=; b=eMMWYUE0ioOanj
	ndFSStETbXHqohtOtmSrPwVBTDXPFNcqfCr+Soyh7F9THPQMJqy6bSMWLmp1TP6sHTfW+X7fFy/iA
	g08QJs8r4+ZxNUpZH90KlPCdB0n3/aWDbX9wheLeBycHA1buJKPRrpp7C5lWLWVjJ8Z3Y7Nji4JIG
	LrSbKw/Jtyji5Lam49IERz1IIkBEGgLzyKKUd94eochA4myLXbV2QSxAE/4RoefkSeWdg4R4c5dLw
	1WdhrAn86d6fed/NXuqM8XWV9bcbPGWp8yVJuGf+HuoPU2OADS+xKh8SILeFGF3NiGUCSTd09PdA9
	HsXWjOLpJZSjkvzJU/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5di-0000000HWjo-0PVu;
	Mon, 28 Sep 2026 07:19:06 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5df-0000000HWgz-18IC
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 07:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790579941; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Eft8xWUpa9VMy0zzYnsfn55YDnrUqijmaPU2DfM66Ak=;
	b=Gm+f8TKj0rnOmInbM2Akj9YBYRHkNGPBtziL2PlITHIUOk6iPAKgXmQT3FF+insgWjpajPQgjNK4ObcyKvS09E4egPTDJy8Rh/ZCxcDpq/h9Hzr7qDINCyQhi1AWoovmB1C4X727QNomQSc1oC2voUcY1SbWsMpg1oBy3q7/VyQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBjcVQk_1790579939;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBjcVQk_1790579939 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 15:19:00 +0800
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
Subject: [PATCH bpf-next v3 4/4] selftests/bpf: Enable instruction array test for riscv64
Date: Mon, 28 Sep 2026 15:18:45 +0800
Message-ID: <20260928071845.2432-5-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928071845.2432-1-cp0613@linux.alibaba.com>
References: <20260928071845.2432-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_001903_649768_DBFCF41B 
X-CRM114-Status: UNSURE (   7.93  )
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

As the riscv64 JIT now supports instruction array (gotox jump tables),
enable the corresponding bpf selftest for riscv64. The guard is 64-bit
only because the RV32 JIT does not implement gotox.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

 tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c b/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
index bfedeed24ac5..4ffe4fe6b78e 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
@@ -4,7 +4,8 @@
 #include <bpf/btf.h>
 #include <test_progs.h>
 
-#if defined(__x86_64__) || defined(__powerpc__) || defined(__aarch64__)
+#if defined(__x86_64__) || defined(__powerpc__) || defined(__aarch64__) || \
+	(defined(__riscv) && __riscv_xlen == 64)
 static int map_create(__u32 map_type, __u32 max_entries)
 {
 	const char *map_name = "insn_array";
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
