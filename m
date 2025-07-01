Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6F8C8303F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbK3etZXWsxVdTlaXpKuC1YstvHOMb/9nTxyGPLmKu4=; b=y/jhZ+k8hzluIU
	jdy9yovfzNgd9Ey+xY2UaeztR39psQukrmB0Fgr8L6KvVOAPmiz9bx8/o9YJDBrICEJOy4/4CMD9B
	RKno7RH/0U8uK7EgaJsWq1QSkM37MQjn7MsHaqc/oLEaAX4o/rl0DNtBZAcbGzQ3/j+47kM3ePwHW
	exUj+81ECQJOcKZhWAFndd9gQveK0shYNeCJrhyMCg4ganHQKElRcXPhuukqi+Lex4hKYxqB/PS1I
	eVwInyys2LY+1CiitXBnNP74UdiPnUFhrmDG0C4kUwSuDvhGzIgnTcb8b53qpAmoYBunFn/s/tXsw
	JGGlH6LU9asix4xGKYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqt-00000004Wsr-3D6o;
	Tue, 01 Jul 2025 09:00:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnn-00000004Vwv-1isb
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F905A51E71;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C505DC4CEEF;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360237;
	bh=JVXQ/8IYf8XnXtTQdEVwyxaiGUvK4wO6JQSfGjOdsb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bhh46ATTFHrOd+dIK3J5Xs6zGbIxEe7gp/qQk4eB+4fpy6WrEYEjulhJ0daQHb0Bq
	 twxIG/sXzV4+7jiuNKoA7YclwAmZ9VU9f0/KnUTtG4inNeq4V6OMnwLpdRAET4JByb
	 XDdEkugi7b31K0vsUQdVP0AP6vdmXidMjOsCissOzmbMZRH3vLWYfsgDZexy2LoMrI
	 4vppeF1Ky8I8tpNryZidhWTkAeFqtnJDhnF7R7gKYDqJqoAcXvLELdSKPHoiWXGZ6g
	 o3ZqRNoZCdck/DBYZT28OMhr2Or+n1fQYqNbmmiSvusL/6m599D5v+z10kkbgUjBWe
	 bwozHaDczCZ/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7245C8302F;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Tue, 01 Jul 2025 10:56:42 +0200
Subject: [PATCH 1/6] docs: nixify check-sysctl-docs
MIME-Version: 1.0
Message-Id: <20250701-jag-sysctldoc-v1-1-936912553f58@kernel.org>
References: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
In-Reply-To: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
To: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Joel Granados <joel.granados@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=723;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=JVXQ/8IYf8XnXtTQdEVwyxaiGUvK4wO6JQSfGjOdsb8=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjoukEx+FI2E8vSQQRccHuWoI9V1GcM0R7d
 fKbDkKzE3co9okBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LpAAoJELqXzVK3
 lkFPbHMMAI06sGLAcctT2iDoYoE/iAsxas2+g68NDcMNxpeiUDzAlcKHcqy19oUW60QUNafaHbw
 XhZBaJFUFsXTtDn7IOAEtmosQ/kIHVMmkDdzvhzzOAEBxgIWTKygd7/0t5wQ+AVlJaREhqw5M4k
 ejm9QMffJ6cxlQvwlZ/B50nBTPQVPnH/LNHpP/Hc/LjZ59SrTcoOq55h5ni+/Z9hzCunhpDaV2b
 mUb44PwZRk8xanfhibjwR1CUk/EBTRNgcIPgCL66a/+AwGbEhr+TcoXVWKr+sL1tcbKxm9UNk+C
 56u4lIMZNouNy3oiDq4qx0OvjtIbRxKlCjPW+tVvi2IAqFRwTDTYCLReBxc1vQzzpRhdzFxkbF+
 eOHc4TiPgzxYqgy8WZw9Xlmd7sUlsEbgHE0miDath+JJ2jj/dCL7uwnFAW4BsupMwMZLTgFqg5X
 inKmhL/NfdUjCpkf3EPkAPpGVrqsm0pawB6v1HzsAjdY2eJTtc64AkZv4GZzNc6nmBEVpC7UuY3
 30=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015719_523709_B26FE849 
X-CRM114-Status: UNSURE (   9.53  )
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

Use "#!/usr/bin/env -S gawk -f" instead of "#!/bin/gawk". Needed for
testing in nix environments as they only provide /usr/bin/env at the
standard location.

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
 scripts/check-sysctl-docs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/check-sysctl-docs b/scripts/check-sysctl-docs
index 20274c63e7451a8722137e7077f4456f293f4e54..178dcf2888ffd21845e8464fc2595052c02ff4a3 100755
--- a/scripts/check-sysctl-docs
+++ b/scripts/check-sysctl-docs
@@ -1,4 +1,4 @@
-#!/usr/bin/gawk -f
+#!/usr/bin/env -S gawk -f
 # SPDX-License-Identifier: GPL-2.0
 
 # Script to check sysctl documentation against source files

-- 
2.47.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
