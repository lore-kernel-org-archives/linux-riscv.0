Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D362CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9I0lJafWV8TZwi4sdvKJQeeW/+PUF77N7zBNqvyEyiQ=; b=kSucXYMxgtj0d4
	vi6pVs62+qVzf4klKqdKLbnlfl1rV02EN2Rp8UPk6WVeA9ycept+WXfvRleKpeWMZ8W89tMXUUDyb
	5c0b0Scljj+iZENmJ9p8lCyprKBCd8VvbF3kptCHjJGr/AYHm6x89gHvbKY++Q0Ob30u5rWjnYK21
	uv1hvBMPG/I83/0dqXxITQOdOva3qb18d4uQl5SM5xAWFLjmCC3DdS4yAMjuyzgV3HUEjihzV8lD0
	5ARrerfe2Gqj2e1pmpv2R/By3JtFk7pN4EH/NcUAOE++TfT5IBsOwz0KfDwQnshLd0mpWtosO6IHg
	46SP46Y+maAlPitOJJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GKD-00E65m-0a; Mon, 19 Dec 2022 13:37:01 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GJz-00E5QJ-66
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 13:36:50 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NbLMc22kZz4f3p0m
	for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 21:36:28 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP2 (Coremail) with SMTP id Syh0CgAH++jcaKBjpueTAA--.19298S3;
	Mon, 19 Dec 2022 21:36:31 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [RFC PATCH bpf-next 1/4] bpf: Rollback to text_poke when arch not supported ftrace direct call
Date: Mon, 19 Dec 2022 21:37:33 +0800
Message-Id: <20221219133736.1387008-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219133736.1387008-1-pulehui@huaweicloud.com>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgAH++jcaKBjpueTAA--.19298S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1UZw43uw17GF4rZrWUurg_yoW8JFykpF
	43Gw13ua1jqFZrWF9rX3WkXrWYv3ykJ3yUGF47K34Fkan5Kr95tr4DZwn3XrWFkr9YvF1a
	yrWFqFZ0qa1UZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU4T5dUUUUU
	=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_053647_669514_1F732EFB 
X-CRM114-Status: UNSURE (   9.65  )
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

The current bpf trampoline attach to kernel functions via ftrace direct
call API, while text_poke is applied for bpf2bpf attach and tail call
optimization. For architectures that do not support ftrace direct call,
text_poke is still able to attach bpf trampoline to kernel functions.
Let's relax it by rollback to text_poke when architecture not supported.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 kernel/bpf/trampoline.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index d6395215b849..386197a7952c 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -228,15 +228,11 @@ static int modify_fentry(struct bpf_trampoline *tr, void *old_addr, void *new_ad
 static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
 {
 	void *ip = tr->func.addr;
-	unsigned long faddr;
 	int ret;
 
-	faddr = ftrace_location((unsigned long)ip);
-	if (faddr) {
-		if (!tr->fops)
-			return -ENOTSUPP;
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS) &&
+	    !!ftrace_location((unsigned long)ip))
 		tr->func.ftrace_managed = true;
-	}
 
 	if (bpf_trampoline_module_get(tr))
 		return -ENOENT;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
