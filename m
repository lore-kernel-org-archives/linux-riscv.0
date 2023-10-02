Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB652E784B3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Zg4z/5CyHaOrHXutSSfRSDQGxyj3mFTXhTPzvEShP8=; b=VoKW7X6+HpUP9W
	rUm4NB9mvqqX1VkcOy5riVx+JwtQtUtF6yYH94HdLJUXCEiKKImV2qL7xMNj2RlvCMoybUdFNI6Tg
	9U2uh69qaPQbngXr2F9389HVzQz0sl1XgornUajomchmRz9nnaXcDpP0sbAJXFQ9bQbDKvDmsPYxL
	q55HpX4aNw0zq7yTZqaoARJibG4+GUNKuThcjL/ZeForA5xtAosKD4g3np1liaXFXmCK8zPuohAWD
	qKmLFmHr4YquaCMsytwkJXxXrOhqxuvrdC/G5qB1Np8yL2E0xADykhZN0+r4RxAFKzvIpCMssr6Ck
	VZ6oEn7mKoWTXrqG24Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnH7G-00CXVD-1m;
	Mon, 02 Oct 2023 11:29:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnH72-00CXGg-2A;
	Mon, 02 Oct 2023 11:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 350D560E92;
	Mon,  2 Oct 2023 11:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B2E0C116A4;
	Mon,  2 Oct 2023 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696246157;
	bh=YhBddSwaCSPLAaFDo+/JwRMeEqAWhYOpGz8YevBnfPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hf74GqEVFqfLw3F5qGhBq5bov1q9UAhguToYQBzzAfqBqUchaXwMR1gpYQdfrW3dE
	 5yobqKdV3/QEpN+MYXpTviIQtYKJ0d3uszOmWShXB+fFDqsJUp9gzN3vFcFkgXvr8m
	 Ttkn4TR8BEtdkCUyXqhUDOkT6VLJ90zF+a9+NCe2UCX+5KIfulK9VgRNl0kfo99jr0
	 IaaP0NOKoE4Uu962+cebD9tfbWwM25JFWQwpT92VVxUTqAGQgGOgB80UNisFMiXT/s
	 k92HVlQ10FGDag+YRRISFExlBwrHOFjX8viGcG8L28c34wj8b6EMek2lXl26k6Fs5t
	 9uXWPCz+3Yxuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B624E784AC;
	Mon,  2 Oct 2023 11:29:17 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 13:30:41 +0200
Subject: [PATCH v3 6/7] powerpc: Remove now superfluous sentinel element
 from ctl_table arrays
MIME-Version: 1.0
Message-Id: <20231002-jag-sysctl_remove_empty_elem_arch-v3-6-606da2840a7a@samsung.com>
References: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=KuV8vOJx81rEwsc5jJ+bbCdW5iZFLCnNJ5xlBjey6xs=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGqoUNBAj237epiMRWZjBh+ubamCISZESZIKcM
 v4wF3DSn2OJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqqFAAKCRC6l81St5ZB
 T/E4C/sH83tQjgttVLdKVarCnL42oaqUSOJFHysd1DsiW9k53qQQnsAXlsVqmHce59si1viwYD1
 sH8kJoCQVu5ZL6u9tnTirs/zK4lZGplOB1GmJ9G2GrDQ7BixLBRmvacBDYUehYBA7tw3zGUd7FE
 0us2Q0Ofke+qX+Aq9JR+UVjqxUoqi03EaBLXuFErDsGsAmhooB6D4ZI0rVHGdk22B9ACXaGfasi
 NvOx99FDQTiP3JolHAsOZjSYq4Oy/YDI5UDS0ERDATzQqvFlImM4MgIualdQl5wQHhfPnBjJJhR
 dnwS5MzD0E++5583ev51gUpQKRjAalnsN6549TOd2IdupjmILcpEaqD/tyIjjqcawm8ZLXpCGbX
 6Y9Qv8eSDL/Odbt+5yhXaeyHFpDsMB4SR9yDDiFgefg0A4DkcGiVGGn2Qm7iKkEY3A1fcz9QUZN
 YU/lcI5cnxARaCSGzjd+XwLHFHFyTjzB9ZJErDjBhYnwzz/H7M0JxdT3nEQwaAGkTTnZI=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_042920_807684_58A8A25F 
X-CRM114-Status: GOOD (  13.08  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from powersave_nap_ctl_table and nmi_wd_lpm_factor_ctl_table.
This removal is safe because register_sysctl implicitly uses ARRAY_SIZE()
in addition to checking for the sentinel.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/powerpc/kernel/idle.c                | 1 -
 arch/powerpc/platforms/pseries/mobility.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index b1c0418b25c8..30b56c67fa61 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -105,7 +105,6 @@ static struct ctl_table powersave_nap_ctl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
 	},
-	{}
 };
 
 static int __init
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 0161226d8fec..1798f0f14d58 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -61,7 +61,6 @@ static struct ctl_table nmi_wd_lpm_factor_ctl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_douintvec_minmax,
 	},
-	{}
 };
 
 static int __init register_nmi_wd_lpm_factor_sysctl(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
