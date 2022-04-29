Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE0C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 01:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7ra+hpRa5MMRyNRTu24z62f4iRg/LGUm9jIiPDL0us=; b=N3g4TrGvQ1XPks
	a11xmxGbNj4GY7ZwT6iSwP7RP8kPxuTSwVJ8AXGrQj9goiCSb0ahIekaywKEyW3vPhLHTqAv2JRSq
	WVnSXfgukuSl2TE5PXHjjLpc6nPCZRRBFpDx2Hs7chCuZ0qvvdIvuuXR9gBRGcV8P6yxiQ0/OqK+a
	Div8suAdD7Xc+6pZdm7vG0TcIQVWEDKU20U1YojzQs5UqLhhW2CLFRFAYfDNqcUH78X/D4pn/He1F
	USj4KUrYGfM/QZNc7vgpHbU8oNjezvcNX+yICHA2DiLaInSIJxpwZG7fSBejHgIS3l3Q5PvldTBNS
	EJDp5+Z/Mvsf6ZVD+nUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkFD4-009DXM-96; Fri, 29 Apr 2022 01:14:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkFD1-009DW2-C3
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 01:14:13 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KqDyf1fFXzhYlm;
 Fri, 29 Apr 2022 09:13:46 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 09:14:07 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 09:14:06 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Pu Lehui
 <pulehui@huawei.com>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Martin KaFai Lau
 <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH bpf-next v2 1/2] bpf: Unify data extension operation of
 jited_ksyms and jited_linfo
Date: Fri, 29 Apr 2022 09:42:39 +0800
Message-ID: <20220429014240.3434866-2-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429014240.3434866-1-pulehui@huawei.com>
References: <20220429014240.3434866-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_181411_616528_EB194FAD 
X-CRM114-Status: GOOD (  10.23  )
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

We found that 32-bit environment can not print bpf line info due
to data inconsistency between jited_ksyms[0] and jited_linfo[0].

For example:
jited_kyms[0] = 0xb800067c, jited_linfo[0] = 0xffffffffb800067c

We know that both of them store bpf func address, but due to the
different data extension operations when extended to u64, they may
not be the same. We need to unify the data extension operations of
them.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 kernel/bpf/syscall.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index e9e3e49c0eb7..18137ea5190d 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3871,13 +3871,16 @@ static int bpf_prog_get_info_by_fd(struct file *file,
 		info.nr_jited_line_info = 0;
 	if (info.nr_jited_line_info && ulen) {
 		if (bpf_dump_raw_ok(file->f_cred)) {
+			unsigned long jited_linfo_addr;
 			__u64 __user *user_linfo;
 			u32 i;
 
 			user_linfo = u64_to_user_ptr(info.jited_line_info);
 			ulen = min_t(u32, info.nr_jited_line_info, ulen);
 			for (i = 0; i < ulen; i++) {
-				if (put_user((__u64)(long)prog->aux->jited_linfo[i],
+				jited_linfo_addr = (unsigned long)
+					prog->aux->jited_linfo[i];
+				if (put_user((__u64) jited_linfo_addr,
 					     &user_linfo[i]))
 					return -EFAULT;
 			}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
