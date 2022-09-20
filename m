Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3BBECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3tDJoFZbtXQAJUvEhZV4ZfcQ/Lm1D5TIB0ICmeMe7s4=; b=e6utXvvlTXXzmt
	2XTnEZDCB8tjXGkkKtMZfS8kTV9s8XEAnOsmsmVC769ccnvStnKv2gxcFnwzR++rMdmleeqYYzbYY
	W8Slq8Iu8pMG9ejmF5Rw9ERXSWo+G1bnhHdftMY1xlJ4bifShiRIkrVw4L9lC4W7DEH0Dcdrqzfkd
	/QxwcnoU7CH6dSS0nHhv5FHiO222O9qxePm4DP51wX7wGMxRFBI41/8pG45FzbgSl/zrpNa5rmwu5
	zNcmbBXXf7Tij3webYxmlakwhHFSoOmk1dqIEsCyIH+EhtvRc8zwaaql+pVDQp+EQj36gzzLQgpN2
	gpCZsOHhFB9Z9wsMrOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadeP-004FNy-SU; Tue, 20 Sep 2022 13:51:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadeJ-004FFc-Bc; Tue, 20 Sep 2022 13:50:59 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MX2rq53r7zlW2W;
	Tue, 20 Sep 2022 21:46:35 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 21:50:41 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <anup@brainfault.org>, <atishp@atishpatra.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <xiujianfeng@huawei.com>
Subject: [PATCH -next] RISC-V: KVM: add __init annotation to riscv_kvm_init()
Date: Tue, 20 Sep 2022 21:47:03 +0800
Message-ID: <20220920134703.132216-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_065055_606558_F9743658 
X-CRM114-Status: UNSURE (   8.14  )
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

It's module_init entry, add __init annotation to it.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/riscv/kvm/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 1549205fe5fe..df2d8716851f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -122,7 +122,7 @@ void kvm_arch_exit(void)
 {
 }
 
-static int riscv_kvm_init(void)
+static int __init riscv_kvm_init(void)
 {
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
