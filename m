Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1DED4921E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y3qJYMBkUAYIKOB/liY8ohJc+Wo1A724aUlIGti+JhA=; b=snEa41ivFbjXVr
	NxgSiztSFlBAeI7LT6GyeKCNx7DncMn6LbrcaYBVp26gF3grCxDtc4C36UaimJDe0IXd1duQlLKZF
	/yv14AmyEqTFyR1beV+jUisJHCykhA7qVqLu6kMLT3DwI2i7GJvoI5CVG/Pu/hBhI5lR7S+a17tCo
	wztvc1PBUW9z3TlQUejjR/wKevM0kWVuWmXLC1SCc3/UFBZID105vPJV4DK/92BQ4TLw67ZIswF3Q
	o31VD8CevdyFxWIdIqSGNrcMKIbiuIBWuow7HtLZmiKzNeTbVFaoWQQZ18kf1bL0Zpg+8dzlXsBWY
	Xeml2Ccnx6YkPVUFvFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8BB-00000000xPE-3wRL;
	Fri, 12 Dec 2025 18:47:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8B9-00000000xOq-2GKP
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 18:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765565264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0sp0c7ijMfmNIDKHaHKpRzr1j+6h+exLVgKMjotQmgM=;
	b=H045SYqY7mLnnx+XnDskvjAmPVRqjzhvCJGbc4KjwhxQ956s0Ra0FH2JE7vCrnBUHL03Cg
	GPuNW08T8IBLOqAeQvoaG0lhyvml4MWakDSt+EJPMFlXv8x6MZX9rLINwR35Iq1WbzA2yL
	pJOemJJx6Do9Im5RWk3Aw/HkD+0/XSw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-lP-MYbFaME-oWaxlvJ1hLQ-1; Fri,
 12 Dec 2025 13:47:40 -0500
X-MC-Unique: lP-MYbFaME-oWaxlvJ1hLQ-1
X-Mimecast-MFC-AGG-ID: lP-MYbFaME-oWaxlvJ1hLQ_1765565259
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69CEA1800657;
	Fri, 12 Dec 2025 18:47:37 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.88.59])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C01001953984;
	Fri, 12 Dec 2025 18:47:34 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ebiggers@kernel.org,
	Jason@zx2c4.com,
	ardb@kernel.org,
	zhihang.shao.iscas@gmail.com,
	zhangchunyan@iscas.ac.cn,
	Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH] crypto: riscv: add poly1305-core.S to .gitignore
Date: Fri, 12 Dec 2025 13:47:17 -0500
Message-ID: <20251212184717.133701-1-cmirabil@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_104747_668149_6820F5B6 
X-CRM114-Status: UNSURE (   9.32  )
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

poly1305-core.S is an auto-generated file, so it should be ignored.

Fixes: bef9c7559869 ("lib/crypto: riscv/poly1305: Import OpenSSL/CRYPTOGAMS implementation")
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 lib/crypto/riscv/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 lib/crypto/riscv/.gitignore

diff --git a/lib/crypto/riscv/.gitignore b/lib/crypto/riscv/.gitignore
new file mode 100644
index 000000000000..0d47d4f21c6d
--- /dev/null
+++ b/lib/crypto/riscv/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
