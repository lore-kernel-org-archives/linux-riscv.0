Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB81AEEF317
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Erjw6AjEE8B2VgTfirv75dSCdOa0zRlTwSKColkMx4=; b=1ED/uI5MN3GgEc
	VrSmIrwLKFqs1rsPQvNI0lISXaWmq3Sa0YG8LqaPa9PBvj3TDZc8dziT4fIBaoajKM8xlczzC/De4
	IL6ApZ/8fGvnGsiFI9Whrj0uM0W8cUCpstoqrQwQSp2RiF+zy/dyLaumYlOHbShasRAQvbM7O/rNo
	DG186dOUEWHI6zBEJ6ooCfDgSNqmf8h+af2BjHAls2fdUJnJfuzIEbEb12QuMRODLmqZYqXRdc8Qd
	7Yq5XgogeFXNvCN/F9DhSzV4pwxNTL1tcVmT5hNaHwb5AifrhNgpK2S1uP69ECIl0I1B9g6rwvj63
	gbPbxraNz2AACkLoWAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oW-000000019ps-11CC;
	Thu, 05 Mar 2026 08:12:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oS-000000019kz-0TvZ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CC5D443FC;
	Thu,  5 Mar 2026 08:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1295C2BCB6;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=nnM2zjvYkKOyj9s5ooMFB4/ffFs14ySMOoYr/6UGGu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GnqTYgNYa7dLqlZLdlp9wbgllkgI69NpZ227nMPQkneMQuhPyzt25/YEcUVVcxiDu
	 G7jony0ea89QL8V4mmq0OdfGWhQXOZ3YimDmNf1JNgJZRRiGdvuhsX8DsQ8veDGVl5
	 aX2oPCyj0OHNZL3b2OIZCB/L7u/DzL7gl++CQRZnUPo4rnMV0mmA4HUCX4pbTVGZnw
	 72wLpm1P0ugcJgBbQ+9VmZNapGi/YTjws6ddUd9ALUNQSTO46OI1dkoXyKXs1MgJke
	 PmowGO2QlHe3c/qFX49xx6Xc5Pvc1oXfsdl645MVipFPn4kU6Ut3f41kpMq7vyxo7Y
	 5iRy+bcYLWhmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C43EEF31C;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:32 -0800
Subject: [PATCH 4/4] selftests: riscv: Add license to cfi selftest
MIME-Version: 1.0
Message-Id: <20260305-fix_selftests-v1-4-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=597;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=BASghyhUbPQR3TaCTFC1Bxb1DJuKTtAvjw5yHhn6X94=;
 b=lJ0mzQxUxYW7xpr4ssXjgSI8+lMx7NSdTsAffUyoUAlkm3NsAqEX0NnmwgQl90DM5nKUkE2Ol
 iwQ51FDEMj1BmgGXixIaUwyqZuUjPg4nvPFvJoh8E5HgBpvT4rK4KgZ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_001204_236567_DDBBC390 
X-CRM114-Status: UNSURE (   8.27  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The cfi selftest was missing a license so add it.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 96a4dc4b69c3..93b4738c0e2e 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 CFLAGS += $(KHDR_INCLUDES)
 CFLAGS += -I$(top_srcdir)/tools/include
 

-- 
2.52.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
