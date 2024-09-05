Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D373CD5BA2
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbu+p0ntQkq5hQAU80HEtzNKZyWhudkK+9b0LMztjmY=; b=vsSzaSBQctyne+
	5+pL3gEihHLd5r8hRz6d9lMD6QBZIXe2WDcu9QTGqgPHW+8guj24vDPgiWYlttMK4YmSh+15HuEmd
	hsVzuKVfggMTrM1COe95GWdgIf8B1dAnQyRkkphpc1sTg9SI7wU66iGbT/PDuQwHgTuBLGCsE3JzE
	/VSUmdTaUrZr5AlNfVIMclwUOwpFMKoUZIVQLZEueAy8gqWyDAnt73vdfljxZsC0vAXkOsOF5dKfV
	0p+/FhlQQ84I6zJy7iukXBJkaUEy7rkrPdp3LAEykAzPgmwejQMRQtjS8yudNTN5LMZEO+NQi0O4A
	IdpsKy2CQrs+HH1nvgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8av-00000007igN-2D61;
	Thu, 05 Sep 2024 09:16:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7ah-00000007VDm-0gQM
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZJ4C3omOUx63j8/IT3oqjg9jH7hk9QELmghufvG2+4s=; b=HWXweOA1Z5Zq52jHBZP+IhsU4Z
	+YCw6IbFzc6QLePHuWu9YOFkWp3T22B7X2PpSyBj2TyzHExW2fC5D7SoUmunxHUCVfW0uunPDClha
	ZkWMYmxxWCau7ioQ6w2NAtCaheOnfoqd5bau+SewVY2DGiEF1ANYFJOTHtiycmEmJuDB7rtDd407/
	7kYtahc1017NDjIzmuez/l0ZNW9xj4GiJ+G+We1qx8FJwWluaLPQIboH3Lcc/pfCPEtpwswV+1kUj
	e7XwLo1eal3l3htGDazNmwrrN8YmnffsqjUBSTBzEOlsQ2tw0rFNtbgnOfWWqcprOJNV8N2erKv31
	kLxWtUNw==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7ab-00000000QLA-3PTR
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzsWB66syz4f3lDb
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id BE7AE1A16E1
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:18 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S7;
	Thu, 05 Sep 2024 16:11:18 +0800 (CST)
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
Subject: [PATCH bpf-next v3 05/10] selftests/bpf: Support local rootfs image for vmtest
Date: Thu,  5 Sep 2024 08:13:56 +0000
Message-Id: <20240905081401.1894789-6-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905081401.1894789-1-pulehui@huaweicloud.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1xAF4DZr48Cr4rXw1UJrb_yoW5ZrWfpa
	1kXw1Ykr9agF13XF1fJrW8WF4rGF1kWry7G34xXrWUuwn3tFykXr1SyFWjqFW3Wa4FqrZx
	A34SvF98uw1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_091138_959259_38EBCC7B 
X-CRM114-Status: GOOD (  12.79  )
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

Support vmtest to use local rootfs image generated by [0] that is
consistent with BPF CI. Now we can specify the local rootfs image
through the `-l` parameter like as follows:

  vmtest.sh -l ./libbpf-vmtest-rootfs-2024.08.22-noble-amd64.tar.zst -- ./test_progs

Meanwhile, some descriptions have been flushed.

Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [0]
Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/README.rst |  2 --
 tools/testing/selftests/bpf/vmtest.sh  | 21 ++++++++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/README.rst b/tools/testing/selftests/bpf/README.rst
index 9b974e425af3..4a1e74b17109 100644
--- a/tools/testing/selftests/bpf/README.rst
+++ b/tools/testing/selftests/bpf/README.rst
@@ -85,8 +85,6 @@ In case of linker errors when running selftests, try using static linking:
           If you want to change pahole and llvm, you can change `PATH` environment
           variable in the beginning of script.
 
-.. note:: The script currently only supports x86_64 and s390x architectures.
-
 Additional information about selftest failures are
 documented here.
 
diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
index 87d93f29c565..7bd2b44deb08 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -4,9 +4,11 @@
 set -u
 set -e
 
-# This script currently only works for x86_64 and s390x, as
-# it is based on the VM image used by the BPF CI, which is
-# available only for these architectures.
+# This script currently only works for the following platforms,
+# as it is based on the VM image used by the BPF CI, which is
+# available only for these architectures. We can also specify
+# the local rootfs image generated by the following script:
+# https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh
 ARCH="$(uname -m)"
 case "${ARCH}" in
 s390x)
@@ -34,6 +36,7 @@ aarch64)
 esac
 DEFAULT_COMMAND="./test_progs"
 MOUNT_DIR="mnt"
+LOCAL_ROOTFS_IMAGE=""
 ROOTFS_IMAGE="root.img"
 OUTPUT_DIR="$HOME/.bpf_selftests"
 KCONFIG_REL_PATHS=("tools/testing/selftests/bpf/config"
@@ -69,6 +72,7 @@ or
 
 Options:
 
+	-l)             Specify the path to the local rootfs image.
 	-i)		Update the rootfs image with a newer version.
 	-d)		Update the output directory (default: ${OUTPUT_DIR})
 	-j)		Number of jobs for compilation, similar to -j in make
@@ -128,7 +132,11 @@ load_rootfs()
 		exit 1
 	fi
 
-	download_rootfs | zstd -d | sudo tar -C "$dir" -x
+	if [[ -n "${LOCAL_ROOTFS_IMAGE}" ]]; then
+		cat "${LOCAL_ROOTFS_IMAGE}" | zstd -d | sudo tar -C "$dir" -x
+	else
+		download_rootfs | zstd -d | sudo tar -C "$dir" -x
+	fi
 }
 
 recompile_kernel()
@@ -342,8 +350,11 @@ main()
 	local exit_command="poweroff -f"
 	local debug_shell="no"
 
-	while getopts ':hskid:j:' opt; do
+	while getopts ':hskl:id:j:' opt; do
 		case ${opt} in
+		l)
+			LOCAL_ROOTFS_IMAGE="$OPTARG"
+			;;
 		i)
 			update_image="yes"
 			;;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
