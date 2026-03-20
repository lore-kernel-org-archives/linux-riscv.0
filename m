Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8106810987A2
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9UoEoJ1n9khCyW45Kf8dWi7I6A6pcqnb6K4O/Ffgcqw=; b=E/sb129q+ZySoc
	o8yl0p4ZD3DqmNYvuiiQSFC5qD4bGXpKKMKWehq6pefye1ggteaf8xIEMxPijdAM0XzM1PWChKa4o
	JLPc0IOSTehOtvRA36jqVT7bvqqq6E4AvY+ELfUVMX6OEfsqCGM4ufkjDOOw0iPD+v2pX6ZeZ39fO
	VqNn/+TuKhQmpRvm8WYSIAnQa/KnpmUXAIfAjBeKSHTxfF7sqAD6MlESYyw19KgK06K7bWYZXT+G7
	ktxE5j46yH4M2YIt2mzx0c+qn6hwUfL4CuGpKVtHVNcMgcZsTX0RYK1LFbm37MfvMKARkpJXUe7IR
	ipIG/1vHRi8Z+AfBhE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cHG-0000000D4wC-003w;
	Fri, 20 Mar 2026 16:00:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cHC-0000000D4vr-2Mvd
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 16:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774022440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8yWdXXmCFKiAxvWiUii4eBbGeSCOI3DuI0otrKafgog=;
	b=iGgRqP45LwDgwUz9jaillAintdDXB1Ea8B+ZPdQVjXz2Gj/RADSZHx3XrzIRGaD7r6gb88
	UixGbk8d2DJ8La+TMfBZSvQK8U2JHbeE9LiZ21X+O8xRdnfZNWBOoD48QZgvpX3ldSVpBM
	xlwPfrU2d/yPWhPxZPm8o/dCQleDWiE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-214-pu8zbBcJOZ2ucDJsTPbYEA-1; Fri,
 20 Mar 2026 11:59:03 -0400
X-MC-Unique: pu8zbBcJOZ2ucDJsTPbYEA-1
X-Mimecast-MFC-AGG-ID: pu8zbBcJOZ2ucDJsTPbYEA_1774022342
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 556EA1800281;
	Fri, 20 Mar 2026 15:59:01 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.2.16.157])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 759B51953944;
	Fri, 20 Mar 2026 15:58:58 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] riscv: disable runtime constant support for XIP kernels
Date: Fri, 20 Mar 2026 11:58:41 -0400
Message-ID: <20260320155843.1848180-1-cmirabil@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: WZs0qFZHLdKcTS4DMiDzCai8rU9zYha8U0gx8WUoTcU_1774022342
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_090042_693963_A23BB487 
X-CRM114-Status: UNSURE (   9.98  )
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

Runtime constant support is predicated on patching the kernel binary at
runtime, which is fundamentally impossible for an XIP kernel whose text
section is backed not by RAM but by memory mapped read-only storage.

If CONFIG_XIP_KERNEL is enabled, do not define riscv implementations of
the relevant runtime constant macros so that the fallbacks which do not
perform runtime constant optimization are used.

Fixes: a44fb5722199 ("riscv: Add runtime constant support")
Cc: stable@vger.kernel.org
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 arch/riscv/include/asm/runtime-const.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index d766e2b9e6df1..05110bb7554e9 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -11,6 +11,9 @@
 
 #include <linux/uaccess.h>
 
+/* patching of the kernel text is fundamentally impossible on XIP kernels */
+#ifndef CONFIG_XIP_KERNEL
+
 #ifdef CONFIG_32BIT
 #define runtime_const_ptr(sym)					\
 ({								\
@@ -265,4 +268,5 @@ static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 	}
 }
 
+#endif /* !CONFIG_XIP_KERNEL */
 #endif /* _ASM_RISCV_RUNTIME_CONST_H */

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
