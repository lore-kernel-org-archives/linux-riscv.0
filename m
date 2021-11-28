Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06AFC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peKiv0sU8Eznv7VtWq5fzZLLpZAXjBOfBP4nvHJQdPU=; b=jkKQn4Y2Pmqiac
	JpldHUtXAdT6rd6inG0D8yYUahqycrKnWDCazvgCJaCHIK/1sm8vawV5ww3c15RjrJEFubehb5t3T
	Tzty+wg+QXL0m6evUvXBM1UtLujZvHGIpK8rkTP/4nSdHMjYGoLGWufSYnrE6WScrLzxlxDfrx3uj
	FiYGOd/ADgURr+US6F3DtjaV+zpYUX3BO8K2Jjy64LI69eQXaR36WMzny8ZzVueWpDNPhK7pKrIgp
	AZLH7oLqlXExiKQywps/NYEoNcN8F488QbUXm1rNvmeKQM/ZCkJVqwXZNkfF9jPhU4JZRn5nZ/s8q
	1ws0v5Bob+33PajttWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMpX-00G9cF-7J; Sun, 28 Nov 2021 16:15:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMpU-00G9aa-63; Sun, 28 Nov 2021 16:15:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF7CC60FE7;
 Sun, 28 Nov 2021 16:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7BBC53FC7;
 Sun, 28 Nov 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638116103;
 bh=ExbSBshbbwnHbo97uVIa25GN2ty9N/NPvVqrH0yw1Qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CVi9MPib5uv8YRVEFHTi8Xoi2v5ZYmsvyU22wWKwwLQkTPyC79OL8m6quDzVXg4tW
 eQRpWZ6FI1/cs1D0JLmd2TW+9kpVeb2XNCRDALLqZvdTgTxAGyn8ZrtNbtpWGlPMRS
 L+9RtLjhVZIDzjcXGAlVaofEceO1btUF6UAEE70trmO1xu5dEfXQoO89tn1eNYPu5T
 vlsr+1fkcJ9cMwfxmsNy5RcgeV4m2Z2HBF/5TYGKMRLD8OiBfyFb/9aKrvUvdEZUAo
 t22oooPzh2Pp/hYL05thWDJVSX8ZwLJm820ifj/0Cp3J1HG9gDIxymKXcku0rc/U1c
 IpUEkSTJm+rCA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 3/5] riscv: kvm: make kvm_riscv_vcpu_fp_clean() static
Date: Mon, 29 Nov 2021 00:07:39 +0800
Message-Id: <20211128160741.2122-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_081504_285136_A15854E5 
X-CRM114-Status: GOOD (  10.05  )
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

There are no users outside vcpu_fp.c so make kvm_riscv_vcpu_fp_clean()
static.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kvm/vcpu_fp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 1b070152578f..4449a976e5a6 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -26,7 +26,7 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
 		cntx->sstatus |= SR_FS_OFF;
 }
 
-void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
+static void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
 {
 	cntx->sstatus &= ~SR_FS;
 	cntx->sstatus |= SR_FS_CLEAN;
-- 
2.34.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
