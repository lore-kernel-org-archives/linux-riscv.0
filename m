Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29583CD4F5F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtWzIu11YUx2n2NjRWccCJjdibeh0x47nZDAvL2DL6g=; b=h2Yy4gFaoFuTxK
	uoSN38YDjy6qz/0iEokeeWPluJZ8Ewsqf7ONlRaMLBWTVX1be8NPdHp1pvT1dSyXtbvcvVSodHsqc
	jJpsRvPg5391wvBsnBZjiGBTnlgdyhctFEh+Ox/VMls/+0SyAmoIzSjfcJrjUzjw3+tVwzglr/n53
	IV/HDj0VMCilb4qhtWUNiIASzqELTsCrLXmxq9WRS3u55TxNOHsUm0bV2Nc0LiQWuYp28iWob0UL2
	63tltWiLAKIGnrjH3mntRvZTx3EiUek7EphrXCY27JyCh2CoYNm5TDvqcc1NtqEQBSeLQ2mgigkmf
	gFDz5WCbO9QnTLLaEI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7dB-00000007VoG-49Mq;
	Thu, 05 Sep 2024 08:14:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7ak-00000007VFK-02NX
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=erhqH3gX8H/ueOU81X4sXktOMKgA5+Vpi9T0bkFgvq8=; b=F6Zq/Bh+Z6msdXwwEkTsrHj4x7
	nJiZLJCD3MkcWxsZPjtgMSU+3SPbSYerhlS4b1zYeFL/DRFSLvk6bcuLswRAd+vB+ETzgAwMIFfsu
	RvkS323+wTjZaDavXhMqzRESyRyNxZHM80+qUMIm7+PJgJT1neJQHZdMOPA0yUCRS55UXJW2IDoBa
	JFJgIvSEyW3GABeXEiSpy2chepYlEeWmwu3HwzLNKSJD/eUXEdk9Q+Cx2mxI8ky6m4HdsE1bJ/QOj
	keCbPKDlLxU4ZKRUiO0QVOA6/YdFSxA0s9bhnpfsDktrmeFxlz37ogbkOit/PmcPHUCh1xQOMvL1H
	Bw5ckvow==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7ac-00000000QLE-2fAc
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzsWB5Wj1z4f3lDV
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id A73281A058E
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:18 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S6;
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
Subject: [PATCH bpf-next v3 04/10] selftests/bpf: Limit URLS parsing logic to actual scope in vmtest
Date: Thu,  5 Sep 2024 08:13:55 +0000
Message-Id: <20240905081401.1894789-5-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905081401.1894789-1-pulehui@huaweicloud.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S6
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4fZr4DGF1rtF13Zry5urg_yoW8uFW3pw
	1fWryakw1Iq3W7Wrn3JFyUuF43Gr4xCF1xJFy8Wr4Y9r17XF1qqFyIyFyqqrs8X345Xr4S
	vayfWFy3Cr45taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07jIPfQUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_091139_696123_1B78F11B 
X-CRM114-Status: UNSURE (   8.59  )
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

The URLS array is only valid in the download_rootfs function and does
not need to be parsed globally in advance. At the same time, the logic
of loading rootfs is refactored to prepare vmtest for supporting local
rootfs.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/vmtest.sh | 39 +++++++++++++--------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
index 65d14f3bbe30..87d93f29c565 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -92,19 +92,6 @@ populate_url_map()
 	fi
 }
 
-download()
-{
-	local file="$1"
-
-	if [[ ! -v URLS[$file] ]]; then
-		echo "$file not found" >&2
-		return 1
-	fi
-
-	echo "Downloading $file..." >&2
-	curl -Lsf "${URLS[$file]}" "${@:2}"
-}
-
 newest_rootfs_version()
 {
 	{
@@ -118,16 +105,30 @@ newest_rootfs_version()
 
 download_rootfs()
 {
-	local rootfsversion="$1"
-	local dir="$2"
+	populate_url_map
+
+	local rootfsversion="$(newest_rootfs_version)"
+	local file="${ARCH}/libbpf-vmtest-rootfs-$rootfsversion.tar.zst"
+
+	if [[ ! -v URLS[$file] ]]; then
+		echo "$file not found" >&2
+		return 1
+	fi
+
+	echo "Downloading $file..." >&2
+	curl -Lsf "${URLS[$file]}" "${@:2}"
+}
+
+load_rootfs()
+{
+	local dir="$1"
 
 	if ! which zstd &> /dev/null; then
 		echo 'Could not find "zstd" on the system, please install zstd'
 		exit 1
 	fi
 
-	download "${ARCH}/libbpf-vmtest-rootfs-$rootfsversion.tar.zst" |
-		zstd -d | sudo tar -C "$dir" -x
+	download_rootfs | zstd -d | sudo tar -C "$dir" -x
 }
 
 recompile_kernel()
@@ -227,7 +228,7 @@ create_vm_image()
 	mkfs.ext4 -q "${rootfs_img}"
 
 	mount_image
-	download_rootfs "$(newest_rootfs_version)" "${mount_dir}"
+	load_rootfs "${mount_dir}"
 	unmount_image
 }
 
@@ -402,8 +403,6 @@ main()
 		make_command="${make_command} KBUILD_OUTPUT=${KBUILD_OUTPUT}"
 	fi
 
-	populate_url_map
-
 	local rootfs_img="${OUTPUT_DIR}/${ROOTFS_IMAGE}"
 	local mount_dir="${OUTPUT_DIR}/${MOUNT_DIR}"
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
