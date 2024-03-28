Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4512AC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSN2y8WUkgaVCwDx5XUonLB2gX7pWq/89cfGK+XrEso=; b=chHOnIOsRkAyCJ
	N83uMBP3gJ9WdYYuzBUpcZXSz1p6Sz4Uwo08U8XbZVcEA+doh1jJRQ2GjhsuXI3hJQYMX/Bo8mdGq
	W6k/abXlbKFTPFWP+b6pfeVlQp9WT+kiX/+J4pYGILpXgJ58t1ORtyUoCtlfqYFS/HtFSimhVNDI3
	2WcSK92YgY0StBf1avsyfo264wIbdrN8zUinjTiYD4TtFgI/fPlxUcZQ107gSskSnLZhfTopQ8cRE
	gX000DXM2/dNcm2lrQAu1ktkfQsTPQZ24zvuMmY7c61BYuBW6x8D5nwThaDRNCgn51a7CXiYk6uby
	Mr7fKvaFFgdq+Schox4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppSr-0000000E2TY-1qSv;
	Thu, 28 Mar 2024 13:06:41 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppSk-0000000E2Rk-20h6
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 13:06:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V53Gx39Qwz4f3mHR
	for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 20:47:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 9A5611A0232
	for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 20:48:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgAnlQj+ZgVmTvYNIg--.31354S3;
	Thu, 28 Mar 2024 20:48:00 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Manu Bretelle <chantr4@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next 1/5] selftests/bpf: Enable cross platform testing for local vmtest
Date: Thu, 28 Mar 2024 12:49:12 +0000
Message-Id: <20240328124916.293173-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328124916.293173-1-pulehui@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgAnlQj+ZgVmTvYNIg--.31354S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4UKw13KrW8Gr45XFyDtrb_yoWrZrWfpw
	48Zr4ay3WrWF1Sgw1kZF409FWfGrs5ZrW7CryUXry5Zw1xKF97ArySyayDXrnxW34rZrsx
	ZF9agF98C3W7Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I
	0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZV
	WrXwCIccxYrVCFb41lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07UvNtxUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_060635_082894_8DC36285 
X-CRM114-Status: GOOD (  12.43  )
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

The variable $ARCH in the current script is platform semantics, not
kernel semantics. Rename it to $PLATFORM so that we can easily use $ARCH
in cross-compilation. For now, Using PLATFORM= and CROSS_COMPILE=
options will enable cross platform testing:

  PLATFORM=<platform> CROSS_COMPILE=<toolchain> vmtest.sh -- ./test_progs

Meanwhile, some descriptions have been corrected.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/vmtest.sh | 40 +++++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
index 65d14f3bbe30..825149a905e5 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -4,28 +4,34 @@
 set -u
 set -e
 
-# This script currently only works for x86_64 and s390x, as
-# it is based on the VM image used by the BPF CI, which is
+# This script currently only works for the following platforms,
+# as it is based on the VM image used by the BPF CI, which is
 # available only for these architectures.
-ARCH="$(uname -m)"
-case "${ARCH}" in
+PLATFORM="${PLATFORM:-$(uname -m)}"
+case "${PLATFORM}" in
 s390x)
 	QEMU_BINARY=qemu-system-s390x
 	QEMU_CONSOLE="ttyS1"
-	QEMU_FLAGS=(-smp 2)
+	HOST_FLAGS=(-smp 2 -enable-kvm)
+	CROSS_FLAGS=(-smp 2)
 	BZIMAGE="arch/s390/boot/vmlinux"
+	ARCH="s390"
 	;;
 x86_64)
 	QEMU_BINARY=qemu-system-x86_64
 	QEMU_CONSOLE="ttyS0,115200"
-	QEMU_FLAGS=(-cpu host -smp 8)
+	HOST_FLAGS=(-cpu host -enable-kvm -smp 8)
+	CROSS_FLAGS=(-smp 8)
 	BZIMAGE="arch/x86/boot/bzImage"
+	ARCH="x86"
 	;;
 aarch64)
 	QEMU_BINARY=qemu-system-aarch64
 	QEMU_CONSOLE="ttyAMA0,115200"
-	QEMU_FLAGS=(-M virt,gic-version=3 -cpu host -smp 8)
+	HOST_FLAGS=(-M virt,gic-version=3 -cpu host -enable-kvm -smp 8)
+	CROSS_FLAGS=(-M virt,gic-version=3 -cpu cortex-a76 -smp 8)
 	BZIMAGE="arch/arm64/boot/Image"
+	ARCH="arm64"
 	;;
 *)
 	echo "Unsupported architecture"
@@ -38,7 +44,7 @@ ROOTFS_IMAGE="root.img"
 OUTPUT_DIR="$HOME/.bpf_selftests"
 KCONFIG_REL_PATHS=("tools/testing/selftests/bpf/config"
 	"tools/testing/selftests/bpf/config.vm"
-	"tools/testing/selftests/bpf/config.${ARCH}")
+	"tools/testing/selftests/bpf/config.${PLATFORM}")
 INDEX_URL="https://raw.githubusercontent.com/libbpf/ci/master/INDEX"
 NUM_COMPILE_JOBS="$(nproc)"
 LOG_FILE_BASE="$(date +"bpf_selftests.%Y-%m-%d_%H-%M-%S")"
@@ -58,6 +64,10 @@ tools/testing/selftests/bpf. e.g:
 If no command is specified and a debug shell (-s) is not requested,
 "${DEFAULT_COMMAND}" will be run by default.
 
+Using PLATFORM= and CROSS_COMPILE= options will enable cross platform testing:
+
+  PLATFORM=<platform> CROSS_COMPILE=<toolchain> $0 -- ./test_progs -t test_lsm
+
 If you build your kernel using KBUILD_OUTPUT= or O= options, these
 can be passed as environment variables to the script:
 
@@ -109,7 +119,7 @@ newest_rootfs_version()
 {
 	{
 	for file in "${!URLS[@]}"; do
-		if [[ $file =~ ^"${ARCH}"/libbpf-vmtest-rootfs-(.*)\.tar\.zst$ ]]; then
+		if [[ $file =~ ^"${PLATFORM}"/libbpf-vmtest-rootfs-(.*)\.tar\.zst$ ]]; then
 			echo "${BASH_REMATCH[1]}"
 		fi
 	done
@@ -126,7 +136,7 @@ download_rootfs()
 		exit 1
 	fi
 
-	download "${ARCH}/libbpf-vmtest-rootfs-$rootfsversion.tar.zst" |
+	download "${PLATFORM}/libbpf-vmtest-rootfs-$rootfsversion.tar.zst" |
 		zstd -d | sudo tar -C "$dir" -x
 }
 
@@ -244,12 +254,17 @@ EOF
 		exit 1
 	fi
 
+	if [[ "${CROSS_COMPILE}" != "" ]]; then
+		QEMU_FLAGS=("${CROSS_FLAGS[@]}")
+	else
+		QEMU_FLAGS=("${HOST_FLAGS[@]}")
+	fi
+
 	${QEMU_BINARY} \
 		-nodefaults \
 		-display none \
 		-serial mon:stdio \
 		"${QEMU_FLAGS[@]}" \
-		-enable-kvm \
 		-m 4G \
 		-drive file="${rootfs_img}",format=raw,index=1,media=disk,if=virtio,cache=none \
 		-kernel "${kernel_bzimage}" \
@@ -384,7 +399,8 @@ main()
 	fi
 
 	local kconfig_file="${OUTPUT_DIR}/latest.config"
-	local make_command="make -j ${NUM_COMPILE_JOBS} KCONFIG_CONFIG=${kconfig_file}"
+	local make_command="make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} \
+			    -j ${NUM_COMPILE_JOBS} KCONFIG_CONFIG=${kconfig_file}"
 
 	# Figure out where the kernel is being built.
 	# O takes precedence over KBUILD_OUTPUT.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
