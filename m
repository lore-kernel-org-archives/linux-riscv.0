Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A8EB8FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqKK94585G62FP3VdyY6picEIz6UO6v5nZGSMrcem2k=; b=GUmsBTUBmWxtKY
	xV7S7rCO+WBIwAyAkkfM3VxHz7ig1ew8u+Eecr9L3ouMTnyiNTomiM4BwhLrDx0ZJl4Yh7GPfy5TU
	zYHcluTcDFRnkjd3aGmK6XaGEozXuFFttSHndrvdrJsqqW7JgwmAiVHeGJoId1gc7MckZfTzpN/E6
	0FIO139iOKhJJB8A+IF2quJhkeN1gCEN1iW5i8gi/39PK9nPC2vWdq5BYfxA5kNXoOtW78sYvGht6
	AXTSiaGRoAGDyz26AlkAONAt1JDOIRwS0t/4lBvL2Vsh9Ye3q89Z36mjdrYGa0dYnwIw2Fo5Sv016
	2IeqkydOCalHqFwpusaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqW9-008apu-1l;
	Wed, 06 Sep 2023 11:16:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOi-0083tI-22;
	Wed, 06 Sep 2023 10:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=MiKMFLZi4GYrq8N4XajavrQBbpeW1qiH78ORnrCb4V4=; b=pQVVlLQ8W8YU+lPU65OISpX7oP
	bJYGCVEYIGo/Z1mQkopVHKGAvA2En13hjrVtfLCbFn3PnqIj3k3borgYs/XC+R/IyVwUUbhDvPQ1M
	csETogq9nZpiES2juzO9vDjzfgQZ6jGx0eSccU73dnLE1rPA8imYsC2OvZC+GJpewG5P8KG/EJyUd
	/h/VW8Ixcfs9+IEeRo+mUuOHDJMkUm6q+hOxp3J9QEoQupe4Qx0IdysAPBQ3KIUdlPcUQZR9O9W+V
	P1SHXnFSYRZTKOTMnzdZGsrVQK6Q7gbz3yO+FLsfQYiVu1cBjk4WxdPsBf6z8tnfNvmoBGyewxC3D
	e+MZuDUg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOS-0012Q8-18;
	Wed, 06 Sep 2023 10:04:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C887961004;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D9ADC116A2;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994649;
	bh=m1cfhtf5co0SyEVc4g5k99olH3r1EV1pr3M4Ks98BKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rHjbTrJA8Ol/ra6GvSNM/5CbMP9tw+BWHyBhWHREs6Eh//HNReNirASBef90qLXoz
	 ISEHVhwviP31Se+2fU14toRUalRaXtGugYFUYeITbzFaZwfhbyaoHgS5dTXZEkmKGD
	 w7D5JOOGVKlx+hlkl+Iwjb8GS1Ticp3Mji3/V/iK3xjgnPYa8NIwV66sTb0YN07X/F
	 i0GB39n7sVbU0sAuNgiawZPQfe7p1Vjl2YipwCfFdfExemqKeXeF+xN4J5gpCAjPf2
	 3VrmhTxm5q3ohBXLxJIA6qfDuDaCy8ZWguOOSv8pwLWqmME8n7P8q7Px6pr57Jvdhr
	 d6BYJx/7CzO7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C82EB8FB7;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:27 +0200
Subject: [PATCH 6/8] powerpc: Remove sentinel element from ctl_table arrays
MIME-Version: 1.0
Message-Id: <20230906-jag-sysctl_remove_empty_elem_arch-v1-6-3935d4854248@samsung.com>
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
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
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=AZTpWnc9Tguavv1ZBhlcXyvQ/Aep0cCp/ystxsndzeE=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6VsYQJgrM4mDejh0WIgkXQmNLCYTtV63a0m
 wnyXdpdhsKJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlQAKCRC6l81St5ZB
 T1diC/9d0C4FHbpBiaJFHXtbACOtzqulSee1sbUdPEA8KxQ38moE5wkRMEO48j7ULAr22+oAFlU
 tOWZNZeTuM3vykNUDZui/AuCFCaBlo+8+659sAQGGDLI6Cw9IGSxUisCkBoMAvQeAPR2FJvqlpu
 IyjOWb5aigsLR15eNNa71GZPhep9GswNIFgSdPX8f/OnMkdtzwjsXgeCLf1n+hnqjgPdVIzNsTb
 /6ECd8xd/EoPfk3zXZFjti0T6ceK0OihOvoG464xemHH0HvbVp2/iaqTtU0aP4b5eqh8qmnJNr4
 MYVty9B0v4w480KUw5mZhqBTBYDdLnMbBNoIU5r0Tk4HQcjlaay5caQeovavKkZZRZtk7u9qlbk
 P3rb7b9Sy7QVJ8nc9pbGk1n2JB0Z59x96C8MNYei+sdvmEEpE3Neq7GvZ6zP3lvAplVYLrhAs0s
 TZ8uvUbxjeB0IP+b3e6Sb+x6fOVoKl176Gju0I8XYPTyc2gbXtqvtnCJWbJuLFgTbC63c=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110418_354358_CB0B74AA 
X-CRM114-Status: GOOD (  14.91  )
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

Remove sentinel from powersave_nap_ctl_table and
nmi_wd_lpm_factor_ctl_table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/powerpc/kernel/idle.c                | 3 +--
 arch/powerpc/platforms/pseries/mobility.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index b1c0418b25c8..a8591f5fa70e 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -104,8 +104,7 @@ static struct ctl_table powersave_nap_ctl_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
-	},
-	{}
+	}
 };
 
 static int __init
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 0161226d8fec..d82b0c802fbb 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -60,8 +60,7 @@ static struct ctl_table nmi_wd_lpm_factor_ctl_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_douintvec_minmax,
-	},
-	{}
+	}
 };
 
 static int __init register_nmi_wd_lpm_factor_sysctl(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
