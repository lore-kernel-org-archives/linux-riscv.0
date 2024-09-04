Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C86CD484E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8aWk2BEgjoTQMfvK7JfsR0wKfUOr9UlX+JF7Nuf7ak=; b=1L1bZJf6uZ81k8
	iDn1sAUKQEkK8AaAoY3wIBj2ZbLcKehaN2LfrUH24DIix6eUYi+1v23EUZhS04Tw/znE9N1bV8K5N
	By/xgEcs4G+4s3U5FS7vDokZyZTnZhDCVnqD1NrlVSFa4sPHVI0IjoRsrx//6GBjTkbuPqpRC7GC0
	+TYm1eScWIXzWL5tbEMz3Z9/e7ENzGqS8fvxT83ooRXEJxpR1LpC0bWzq8xVcD7JQVHqHffM4OlGe
	ifmwEBxwFS9cjAzcfwEkrch3Jd1/CictUljNCEV74RiEe+IHOT/c1imoJPk1hZkSTdbriOCAfulUb
	C5cWUtRhHAdSTy3sgz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqp7-00000004jbm-1QM9;
	Wed, 04 Sep 2024 14:17:29 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqoy-00000004jVK-0Mne
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:17:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzPgs0HTpz4f3lfq
	for <linux-riscv@lists.infradead.org>; Wed,  4 Sep 2024 22:16:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id DE3C41A0E35
	for <linux-riscv@lists.infradead.org>; Wed,  4 Sep 2024 22:17:12 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgBnvIjfa9hmXCB4AQ--.21574S12;
	Wed, 04 Sep 2024 22:17:12 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v2 10/10] selftests/bpf: Add description for running vmtest on RV64
Date: Wed,  4 Sep 2024 14:19:51 +0000
Message-Id: <20240904141951.1139090-11-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904141951.1139090-1-pulehui@huaweicloud.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: _Ch0CgBnvIjfa9hmXCB4AQ--.21574S12
X-Coremail-Antispam: 1UD129KBjvJXoW7urW7Jr4kAFWUJrWftF47urg_yoW8Cw4Upw
	s5A34akr1SgF1aqF1fCrW7XF4Fqrs3XrWUGF1xGw15u3W5JFykXrn2yayjvanxuFZYvrsI
	ya4aqFyY9w18ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_071720_772447_862E1076 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Pu Lehui <pulehui@huawei.com>

Add description in tools/testing/selftests/bpf/README.rst
for running vmtest on RV64.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/README.rst | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/testing/selftests/bpf/README.rst b/tools/testing/selftests/bpf/README.rst
index 4a1e74b17109..776fbe3cb8f9 100644
--- a/tools/testing/selftests/bpf/README.rst
+++ b/tools/testing/selftests/bpf/README.rst
@@ -85,6 +85,38 @@ In case of linker errors when running selftests, try using static linking:
           If you want to change pahole and llvm, you can change `PATH` environment
           variable in the beginning of script.
 
+Running vmtest on RV64
+======================
+To speed up testing and avoid various dependency issues, it is recommended to
+run vmtest in a Docker container. Before running vmtest, we need to prepare
+Docker container and local rootfs image. The overall steps are as follows:
+
+1. Create Docker container as shown in link [0].
+
+2. Use mkrootfs_debian.sh script [1] to build local rootfs image:
+
+.. code-block:: console
+
+  $ sudo ./mkrootfs_debian.sh --arch riscv64 --distro noble
+
+3. Start Docker container [0] and run vmtest in the container:
+
+.. code-block:: console
+
+  $ PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- \
+    tools/testing/selftests/bpf/vmtest.sh \
+    -l <path of local rootfs image> -- \
+    ./test_progs -d \
+        \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
+            | cut -d'#' -f1 \
+            | sed -e 's/^[[:space:]]*//' \
+                  -e 's/[[:space:]]*$//' \
+            | tr -s '\n' ',' \
+        )\"
+
+Link: https://github.com/pulehui/riscv-bpf-vmtest.git [0]
+Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [1]
+
 Additional information about selftest failures are
 documented here.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
