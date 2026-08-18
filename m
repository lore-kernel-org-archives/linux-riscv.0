Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EB6C5DF87
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZJQFvvIkXrAktzRjAeMoRkPx/3+XKDQ6GocaKe+6O0=; b=lKcQHgyorYJYsP
	rUoFVkUpBIpAi1Ow/vvhTdFQ8SGBYs/ZtUfxkcaCEE3Fxrkuuj3nuyMwPe8p5kuegIbN2cv/NIN9J
	FA8BlMumMSryHfEhLttL+Sfd4+QOVkMnTY0pH2PrrC9XxjtrymV5eTyJ6Y9oyhuCps8l1EEtlnnkP
	9W7kvjI5HaYNykXRzyc5+fIM4gk/4MksJEDEGEEI0lfBaaD234N8AZGAlH9TjGb0RE+kXqAeQs4hb
	ssAzH7I+uX7zSePwWuRppy1UYulvxZglXSqi0wUaCYc1uPCnU5gDdm+hxlXNuDrfPErJFDClhLvxj
	Fn3ryFuinqbWyT+wTmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4kJ-0000000Bo4S-0Xd1;
	Thu, 20 Aug 2026 15:31:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4kD-0000000Bo1X-0TPE
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 15:31:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC751D31;
	Thu, 20 Aug 2026 08:31:46 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8B23FA21;
	Thu, 20 Aug 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787239910; bh=bX4F8fbDYk1pMbaaFVuC2gJZ7gdHty9FAL8pUarXuzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzcBu9SQy9TZ6ND+cKlpT43akt6y9WiKmwjCcDTgN/Oepz1s/WxsenuJOuMFDkmSE
	 W3CamJM5cGjeE1jn1H9HsJryRCJ/rB8EU9MvGK96nHumEQirfF2xHBsuVQvBeOD3uj
	 GnJF2yWUGbEM1ZsWlmVU3otwtYaOtGlSLucqnf9s=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH v3 2/5] selftests/x86: fix fork bug
Date: Tue, 18 Aug 2026 17:54:25 -0500
Message-ID: <20260818225428.1983328-3-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818225428.1983328-1-bill.roberts@arm.com>
References: <20260818225428.1983328-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083153_185806_858E6D11 
X-CRM114-Status: GOOD (  13.16  )
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

Shashiko correctly pointed out this fork bug, the report is below. This
patch fixes it by checking for the child and error conditions
explicitly.

[ ... ]
> +int test_ptrace(void)
> +{
> +     unsigned long saved_ssp, ssp = 0;
> +     struct sigaction sa = {};
> +     struct iovec iov;
> +     int status;
> +     int pid;
> +
> +     iov.iov_base = &ssp;
> +     iov.iov_len = sizeof(ssp);
> +
> +     pid = fork();
> +     if (!pid) {

[Severity: High]
This is a pre-existing issue, but could this code broadcast SIGKILL to
all user processes if fork() fails?

If fork() returns -1 due to resource limits, execution will proceed with
pid = -1. When ptrace() subsequently fails, the error path is triggered:

out_kill:
        kill(pid, SIGKILL);
        return 1;

Since pid is -1, POSIX specifies that this will kill all processes the
current user has permission to terminate, potentially crashing the host
environment.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/test_shadow_stack.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..b52c5420c137 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -971,6 +971,11 @@ int test_ptrace(void)
 	iov.iov_len = sizeof(ssp);
 
 	pid = fork();
+	if (pid < 0) {
+		printf("[FAIL]\tFork failed for %s\n", __func__);
+		return 1;
+	}
+
 	if (!pid) {
 		ssp = get_ssp();
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
