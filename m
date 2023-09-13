Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BBDCA5527
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00M4J1A6esW1C3mzUkaBRAv28wYpnuJ52ZNioFWhL/M=; b=wumz6UQgGAs+4u
	o9yIyeZo9YgK3K43Tyz41ibRkrXYbrsvY9n39m8AUGY8uAxB8f2AB663uAK1t+/dddxzNAaQHJsfN
	4mXq5tR/a4JO2nVn+dSRqxpIthq5h/mTb+/Bwc3f2oxLm6zvOluqDPGwRVq9TARPFcY5Ew3YJpQps
	8ffPxEsGZvs2gpRAA1wtr9Ph4uksInGW65IvdlQZgo3g4HZdBZRM/FxvGfo+/bhic/S7Cu8C2bx9+
	HEwAo/CyCoNcA2z+KMYWIeqUf6qwPgQ0v/tTEo0Ma2zAGzuHfDIcStiZ1HxloPTA0lFpSvaga5hd6
	x2y7g39F5UcbUUgiz2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuN-005FgL-2y;
	Wed, 13 Sep 2023 09:11:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuJ-005FbZ-0F;
	Wed, 13 Sep 2023 09:11:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8772961888;
	Wed, 13 Sep 2023 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57508C433C7;
	Wed, 13 Sep 2023 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596291;
	bh=bOZkXiICk5VZpusCoN35GJ6eTXBzdL14nNNGQMgELT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RlASjPY2GnbaWVrb8C1c2XTqKSCQcR3wM+WD0rWbAqNQa0hrvj4juZxzK7y8tQpjE
	 iGk8MKGIbzVS/F3WrvRjSyh/L8hsZnZZ4p+KlgFQZ8Hwo4whrYU/pKszEWl6fY64OU
	 4YMZekgvBNU/bvXB6Im6rGmLV6zOldi94zZoM4HClQ2UIn2J7jCjctainlXCFSR8XR
	 JHvatfKnc3gPYFDgz+fjr9E6exVWiTEk5a9gWlai7ZAFRWpLMOh/HRCHFfBPtQTm+A
	 c2L6bZwUJmhK5Nk6cWH5Sqo3hwPWlFELEnKgyrHhaD9LzXOx58u8mso+VE6DVKGytv
	 t/hY6M/RQ9j1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E680CA5512;
	Wed, 13 Sep 2023 09:11:31 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:11:02 +0200
Subject: [PATCH v2 8/8] c-sky: Remove now superfluous sentinel element from
 ctl_talbe array
MIME-Version: 1.0
Message-Id: <20230913-jag-sysctl_remove_empty_elem_arch-v2-8-d1bd13a29bae@samsung.com>
References: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
In-Reply-To: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=wn/rmW3LIVUgnMCXZeG4YCvpOL/L6xf4mRBtbNQZAbw=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXzA5GlVzE7/rd8wut1u+0NMuuB0vDP4Kt9LJ
 CObib6trt2JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8wAAKCRC6l81St5ZB
 T7gBC/0fKA9pIG80ye+KDiog5k/fFGEVpxa0scNjVDBIe34baOOBslhh9jCq5CeB6uS1kVSU8Zn
 sjCTPhX7uROr2GobSknXdT2qiVTrWtW8NdWR3znWuML6pp2goXpp7VQ5PfPQPNQAIs2ngYHlj9p
 7FW8hAkzcNwT6mqabdmRJMooE0YrdZsCrd5jPmeEL/99JURiW3raS0VU83iQqdBU57HKiKeaBUy
 65feFTdijevoe0tiAIAR1yLbNxCRQaIhP5bm9HKReoJ6SafGlqLSgEnuK+DF219m74LC1P8STid
 2dL95GtrdfAHhnwsPbDzH8tDtS75AInDIQRDRmWXXhDhz1F933gR4hoM5ZuukuU9+Vm0Us46tPN
 oSUTy1W85exYjVAmyyJ+md1EciwwRIgs5r9SReWyR/ztn/tCLNJX4MXiSPVX7P7Ld8m/XPeGx6W
 XvmwG5dS4Rv/dkz7R3snlRwS/qIsk0Cy7ohma1e73jaGvq0kBmcvxntJQTS6I/eu84yrw=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021135_223083_E9EF2519 
X-CRM114-Status: GOOD (  14.67  )
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

Remove sentinel from alignment_tbl ctl_table array. This removal is safe
because register_sysctl_init implicitly uses ARRAY_SIZE() in addition to
checking for the sentinel.

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/csky/abiv1/alignment.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/csky/abiv1/alignment.c b/arch/csky/abiv1/alignment.c
index b60259daed1b..0d75ce7b0328 100644
--- a/arch/csky/abiv1/alignment.c
+++ b/arch/csky/abiv1/alignment.c
@@ -328,8 +328,7 @@ static struct ctl_table alignment_tbl[5] = {
 		.maxlen = sizeof(align_usr_count),
 		.mode = 0666,
 		.proc_handler = &proc_dointvec
-	},
-	{}
+	}
 };
 
 static int __init csky_alignment_init(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
