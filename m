Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD86CCD4F59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciL6qIAUa5UBz8VJmN1zKVa15hfvoViwNxM77ee82TE=; b=RUXkYVxi0exNc2
	HZX4dTStrDEcKAtsUs9vkoA3Zebconp0OcpDNSPMrGzR4R0QuOrXOyHGFnYM80FP4UeiESS9rAaaR
	zsDkoPQmM/3eHepDE40cx4lVZnrGY06iWX7jwBHLb67TRyh/xOH0BRU5Ms3YuLWUBbBhMFB2oqVSm
	c9ZdlNoYcs0p+jpem50CMCGp2BXaJDluo9A/1r+TA5BcvjC3axVZKCW5RLURZe4eBpNo/ZmP3J5oJ
	C+snAfuClY8awi6oWmPI0zZu3FJhrPx4doDpQlBv22VuwXi3wA8e5L6bnA/4rE2JYvujGbPi6Ydp3
	Dd8vGL871jN+Lz5LAr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7dC-00000007Vp2-2nju;
	Thu, 05 Sep 2024 08:14:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7at-00000007VGS-2ZbY
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6ikgUqQ+t123IFwz0QORywwOoB7EPT0c6D9mJRPW1Cg=; b=TBaLQiaOsxhK1PIvDz+zBx+7e9
	Y39WlqQZJsUqJKUUfHeAQuivT8tXTJmgMXl/oM7PYKqAtMtZ21dwrRrS7TPfmz6ftkImthkKSLr6k
	d8eHcN0ho/33fqRUnALWKbNHnJoyakG5/JGPxW+jiKg7mYsYle2zvlBdbPjYXOXV6LnAPuQjqtB//
	WX5hD0dQ4viHn9Ubx6DElJwWE823Putbf9IV2Ub71heJSdbfj+vLXS+WZcmma3TjwSC9Q2Du+qRZZ
	qcDByWLWh8o4gTbyMwGD7ua44NxM1ZFOJ+/bWjl6Df511wBeeISAHZ0fcmpkV7xmkk3n2kAoowMAV
	zWGzgn6A==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7am-00000000QS9-3Q6O
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzsWD5Kp0z4f3lDK
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id A49991A17E4
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:20 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S10;
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
Subject: [PATCH bpf-next v3 08/10] selftests/bpf: Add DENYLIST.riscv64
Date: Thu,  5 Sep 2024 08:13:59 +0000
Message-Id: <20240905081401.1894789-9-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905081401.1894789-1-pulehui@huaweicloud.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S10
X-Coremail-Antispam: 1UD129KBjvJXoW7ur48Xry3Xw4rur15tF15twb_yoW8Jw1Dpw
	4fWryjk34fXF13tF1xCrZ2gFWrZFWkZrW8Jw10qr9xZr92yFZ7GFn7ta4rt3sxWFWrt3ya
	ya4akryrZw40qaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20240905_091151_944281_F88B7118 
X-CRM114-Status: GOOD (  10.10  )
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

This patch adds DENYLIST.riscv64 file for riscv64. It will help BPF CI
and local vmtest to mask failing and unsupported test cases.

We can use the following command to use deny list in local vmtest as
previously mentioned by Manu.

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
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
new file mode 100644
index 000000000000..4fc4dfdde293
--- /dev/null
+++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
@@ -0,0 +1,3 @@
+# riscv64 deny list for BPF CI and local vmtest
+exceptions					# JIT does not support exceptions
+tailcalls/tailcall_bpf2bpf*			# JIT does not support mixing bpf2bpf and tailcalls
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
