Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B2DC88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZJQFvvIkXrAktzRjAeMoRkPx/3+XKDQ6GocaKe+6O0=; b=qpgAh/dn1X/dps
	v5ONMiZW0Qw8JnG3mC45DXS8rzaBNf+F3BCNvFgUErisFeNCVPu/N3O0fZK8YyWShcLcp6WLga7Ao
	VEYU4oKBbSpm6ZERtrZzwzteZsuCHcYPAXcYVVFEfGyjUHEh/SNi6DcPbVmDPoraU1e/QkKHyjFEK
	7DMSsIk8picu9AIZc5+MLdkoZVTCfgFE+b1XqcmBJ4LqlAEYtiSv750TqnE4BmJYE1aZTmGqyWfSv
	BM5hkPuTWLEc9nbEojXmQ1cLgAGUm1X1Zqxb/17IEyc3dfRMIChhnH0P4OBjFeHOeg1DA+JHlAxzy
	6gTJsUX6bE9lwytY2yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoZ-00000007qzO-18EL;
	Tue, 15 Sep 2026 19:27:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoW-00000007qxE-06vG
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:27:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6363D153B;
	Tue, 15 Sep 2026 12:27:24 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E2A93FBCB;
	Tue, 15 Sep 2026 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789500448; bh=bX4F8fbDYk1pMbaaFVuC2gJZ7gdHty9FAL8pUarXuzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5y1CCgDF3QYx7o4gAZLmQCqAc3JpofmCEbeW/4ZmyyyQ1t0OHdB+dPc3eJbqoCme
	 d7Q0Y0Qo5BoZXL8ZF+IEGQg2RkjGPlBwUwpVrLoNmW2vuDgp/CKmDrkTofFgoaakwv
	 vgbkmfE/cqQE0G2N2raxxqsEFKoAhMBVCfXlt+iA=
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
Subject: [PATCH v4 2/6] selftests/x86: fix fork bug
Date: Wed, 16 Sep 2026 04:52:20 -0500
Message-ID: <20260916095224.1533971-3-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916095224.1533971-1-bill.roberts@arm.com>
References: <20260916095224.1533971-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122732_117286_301F030A 
X-CRM114-Status: GOOD (  13.29  )
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
