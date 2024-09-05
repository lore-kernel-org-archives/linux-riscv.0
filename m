Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86793CD5BA4
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siAITcsN9btLwIbmT0lGK5bKJxFAMOASfQ8xTJJfp44=; b=He/t6oLtEoyHyq
	caPKSccjM9lisgImSVntA4+5ncJHdoL6P/ZAjrE3EFMxncw1WgtmTVv0+lIj/QBP7lrRISK4prLLt
	wyHLnTSKiemiQsBch+JkWlkEIUFCyyYAtxjNNmVoPK9ms5VYNBzpx8ugBqmqgFncWcWSdhRkMD1/I
	AVEfSREiia9VUJbRS+S/ANkD0qmoLbhPW+3litn5WS4GmnGlHD4pN6OUjebwFJwIFBgImbfZzNxML
	JRsK1siHaTQeeQqNGhjoTKEmnv9GWpevU1DOpAOovBTUB0PrbXEWSNlAASnmfr/L4dlYvA65lWoOY
	fU41oWUM9Z5WNaqrEAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8ax-00000007ihu-1xTu;
	Thu, 05 Sep 2024 09:16:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7ai-00000007VEC-07vC
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hd37QSfw/UO0DMRz9+rGIiFUIHVscebPig+VI9yEcVA=; b=eXPymE0eA+qLoANrKbs0rqi1sb
	RNj5+NKBTa7Ly5CAdJ4ZKx7Tlvnb3SFKEyOH7uCriPdflLvWF+a3F+KrpC/kkwfXWy2ONzYijeos8
	hMUwccAZjlyDA8JnFdYXFo9E5GhyZ0mLAUBSWa+dhIHN0TUbrHjkt00EfdvGOKTyZN/z1DIswHrA0
	QhCwNBsrvLE6Qhi/XVbEJUY8cD47gB9EPOdtpm3QmNSsWeVUeklbsnafmwfcIv4V8FkG+6A010cKq
	nHgOvGpBkqlUmzsNS09VZouq6h6EWRHreFjGK9WbdPr1Xpx8oQpcaHsrfG+lCle8fG2OBMUoQ1q/U
	LA/JEHbA==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7ab-00000000QKs-3wSd
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:42 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzsWL2pLCz4f3jkh
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B707C1A07BD
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:20 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S11;
	Thu, 05 Sep 2024 16:11:20 +0800 (CST)
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
Subject: [PATCH bpf-next v3 09/10] selftests/bpf: Add riscv64 configurations to local vmtest
Date: Thu,  5 Sep 2024 08:14:00 +0000
Message-Id: <20240905081401.1894789-10-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905081401.1894789-1-pulehui@huaweicloud.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S11
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4xJw13ZryDJw4kCF1xZrb_yoW8Gryxpw
	4ruryakryFgr1agFn7CryjgFW5KFs5ur4fG3y8X343Ar1SqFyxWr93t3W8trsYgFWYqrW5
	Aa4xKry5ur18Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_091139_121174_04448042 
X-CRM114-Status: UNSURE (   5.04  )
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

Add riscv64 configurations to local vmtest.

We can now perform cross platform testing for riscv64 bpf using the
following command:

PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- vmtest.sh \
    -l ./libbpf-vmtest-rootfs-2024.08.30-noble-riscv64.tar.zst -- \
    ./test_progs -d \
        \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
            | cut -d'#' -f1 \
            | sed -e 's/^[[:space:]]*//' \
                  -e 's/[[:space:]]*$//' \
            | tr -s '\n' ','\
        )\"

Tested-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/vmtest.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
index 91f940e8ce45..79505d294c44 100755
--- a/tools/testing/selftests/bpf/vmtest.sh
+++ b/tools/testing/selftests/bpf/vmtest.sh
@@ -34,6 +34,15 @@ aarch64)
 	BZIMAGE="arch/arm64/boot/Image"
 	ARCH="arm64"
 	;;
+riscv64)
+	# required qemu version v7.2.0+
+	QEMU_BINARY=qemu-system-riscv64
+	QEMU_CONSOLE="ttyS0,115200"
+	HOST_FLAGS=(-M virt -cpu host -enable-kvm -smp 8)
+	CROSS_FLAGS=(-M virt -cpu rv64,sscofpmf=true -smp 8)
+	BZIMAGE="arch/riscv/boot/Image"
+	ARCH="riscv"
+	;;
 *)
 	echo "Unsupported architecture"
 	exit 1
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
