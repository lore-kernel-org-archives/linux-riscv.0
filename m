Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAD3CA5FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39IsfDgMfK3w65huwuGpeL0CaAXMurGzQ9dO8FqHCXQ=; b=NY5sVSE327T5w3
	m7P5xoZ5vsDGyWyVrCngxK1AEEwZDxT/XbkEe5sVVhnT2Rifd7qtIqHD3QgCnlvH3qMC9MxRQKJ0S
	l6fWvEMaEBal/cm5GL0v2iHujXO206Y0aAQXARcW0oxdR/Ns3mDNG2l92XiBeyR1brdK9/CpCnFPO
	dEeo8wVUusJYSnv+FrW3rnSVjuT2ty68evsW1wMq907LwuL7Sr7cVlG+YPKarvSvECKWUeqDeWPSi
	99Km6nV/G6WEXOBFQTf2t9uo5DNXFOelzIFBtKB9To+YzDWBgLM8qbXlClWyovWCAbnFH7mIyDVCE
	3dWie3Nx1naANO5WGjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpj4-00000005Qoz-171X;
	Wed, 30 Sep 2026 08:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpiv-00000005Qln-2dK3
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 08:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z1tRCCj29YWXNSecoXVeUwkQlDeTLcAoXsBgIvAhC+E=; b=Uhkp3LJDtugLCufPCUBCXkmZYH
	USdIZMB7kydPc4xeVUp/h8xAE7FtcEyjsdWztF+IwvsSRcPdYYltnujlywnnyHbJUIN6l/x1WjpIw
	a+/vI60H3E4+YtgX2QTjo1OE4qVdE6Vb6X1FsEjQLlMTkzHWXcv7FIQ0xCyfAiGiQ+f4K/DDxHuJ+
	3EjBI8TkvuqU5j9v3GeY1IkeaZ4Eb4zlwWPYJshuSJaE0gPKrY7xbzTejI6N2NHdyYu+dBEe7mHHT
	s1rzFW85LFFrnsbZXQTUXYoU2GFh6TzgJOxRwykF9BqCEjIk5QGnGwpPZ3Tva99pfsoWRzCvGRvjL
	q2F1XVUA==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBpip-00000003Wo2-0IPD
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 08:31:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvpCY5WByzYQv05
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:30:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 67E3740574
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:31:18 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDXpyrRyLxq8dflCA--.24306S5;
	Wed, 30 Sep 2026 16:31:17 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3 3/4] selftests/bpf: Update qemu config for riscv64 in vmtest.sh
Date: Wed, 30 Sep 2026 08:35:21 +0000
Message-Id: <20260930083522.1914145-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930083522.1914145-1-pulehui@huaweicloud.com>
References: <20260930083522.1914145-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgDXpyrRyLxq8dflCA--.24306S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1UAF1DGF4UKrW3Xw18Zrb_yoW8uryrpw
	4kJryYk3sYg3W3ur1kArWj9FWrGrsavrW8Cw48Gw17Zw12yFy8Xr97Kw4Ut3Z3WFZYgrW5
	C34IgFyY93WkJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0pRl_MsUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_093127_842458_5B435147 
X-CRM114-Status: UNSURE (   9.91  )
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

When running vmtest.sh on riscv64, the kernel panic at boot due to an
illegal instruction. This is because '-cpu rv64' only enables a baseline
set of riscv extensions, whereas the kernel or toolchain requires newer
extensions. Switch to '-cpu max' so qemu enables all supported
extensions, and bump the required qemu version accordingly.

Additionally, qemu's pmu emulation for riscv64 currently has issues,
causing perf_event_open-related tests to fail. Temporarily disable the
sscofpmf extension to bypass these failures for now, and will try to
investigate and address it later.

While at it, update the libbpf/ci branch in INDEX_URL from 'master' to
'main'.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/vmtest.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
index e7e0b419a0b8..c4663cad74f5 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -35,11 +35,11 @@ aarch64)
 	ARCH="arm64"
 	;;
 riscv64)
-	# required qemu version v7.2.0+
+	# required qemu version v8.2.0+
 	QEMU_BINARY=qemu-system-riscv64
 	QEMU_CONSOLE="ttyS0,115200"
 	HOST_FLAGS=(-M virt -cpu host -enable-kvm -smp 8)
-	CROSS_FLAGS=(-M virt -cpu rv64,sscofpmf=true -smp 8)
+	CROSS_FLAGS=(-M virt -cpu max,sscofpmf=false -smp 8)
 	BZIMAGE="arch/riscv/boot/Image"
 	ARCH="riscv"
 	;;
@@ -65,7 +65,7 @@ OUTPUT_DIR="$HOME/.bpf_selftests"
 KCONFIG_REL_PATHS=("tools/testing/selftests/bpf/config"
 	"tools/testing/selftests/bpf/config.vm"
 	"tools/testing/selftests/bpf/config.${PLATFORM}")
-INDEX_URL="https://raw.githubusercontent.com/libbpf/ci/master/INDEX"
+INDEX_URL="https://raw.githubusercontent.com/libbpf/ci/main/INDEX"
 NUM_COMPILE_JOBS="$(nproc)"
 LOG_FILE_BASE="$(date +"bpf_selftests.%Y-%m-%d_%H-%M-%S")"
 LOG_FILE="${LOG_FILE_BASE}.log"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
