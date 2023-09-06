Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBBEEB8FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzEhRqileuV8p5e7Wk30kJ8uah8XhLk5eLqVV6PA6hM=; b=AD0fc06JGppNz/
	9o2E/cdIH929/FDB/UJiqK0SIrfOLGyQt3n7KHzt7Uii0G9D8L9g1SpzYW8AlZkbLENordYEfK7Sj
	3f8wcbxDn0dqAEtk5Y34DxS9uyMNSOsxh7PVjfUWpJXErV5ZWmryejCYIJg4fC4YBCEWMGLGGoJUJ
	7VszVn72vJqQvzJJccJ5KedLKtkGUPF4a4VQ951hM8Cj4lvZbenQaVLEyAw99xslr3T4HQXhQ2lwh
	jUIPoTyiN5QnYWUkh6cgwCUdSA31k4M9L9Y/x02vL5tFU5ZvnutUsDQURyAWKA8JEqwfspoW6Shv7
	Z87HLmlQbL56LWcNDM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOj-0083uC-0X;
	Wed, 06 Sep 2023 10:04:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOg-0083rZ-0H;
	Wed, 06 Sep 2023 10:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=7U7sXrhVzHCf8CANSNh4kpHOvE7NBsSrBp7jZ2nIFM4=; b=ZYiv1tsvkYl+VgzzL+v0X4kOsn
	qyH0LDDYNVB/Kt7Q13+ketPHJUbnJ5Z1T1D87X0tLnx9PHsJOnbwRM1AkXe5XELbEq2kH9B2dxRh3
	vPx28nvFl+ZBqwzd2feFLqHrhKJbi8BnWle/1fidkwb0ZZOIttNuofTihzXyS9473BnGWBjVzMKGG
	krU22gHxRynGhOrexJpQOKybltwJM7ZIhrAvW8wJNFeB8L3ZOKXQre5lNkbcLemjs63O3pHGwvFH0
	HuA9IaK6GVYtz/j6XY55LP+2Af4TnXJBFiX1ODY3I3E88mt/y/9J8MKTFFQ6vAwFZ4AbsT3D7golG
	XwUTFvaQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOS-0012PO-17;
	Wed, 06 Sep 2023 10:04:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1ECFA60FD9;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DADA3C433B6;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994648;
	bh=+eBg2MuGRnaepU3d97JddC2GORIukwXODmv/XHfrfnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T0Kat/c3XWHyxAFHdaYGHIr1s0/KmuhsXFvdMUvnGcrZdv73alGuXsOiLS1xMLNBz
	 k1PXKm+793Go9fDhEFfLnr2En7Sw5HbK5dXaPCSJYNrxvxghFCHkw4V7uRRze+aJwa
	 NgX9HkqaNLZAOP6BacmtSdgXbxRlIB5dbXteCgCzo8UtI5e1GYo4L4zdJfPDYBLCBI
	 mryAPwwhcSX1lA4hKWf9KijTEjzCOVJwhsI0Z00nq3peZz7YV33TJEChAi2aXO1VNQ
	 ff7LAZNbxNnyHBOtc8RzjG9dIuWU96TwJd0BL6C14exVJlUIGL8+R5tSUvqNS//l9U
	 EgXmx+xN+V0og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F63EB8FB9;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:24 +0200
Subject: [PATCH 3/8] arch/x86: Remove sentinel elem from ctl_table arrays
MIME-Version: 1.0
Message-Id: <20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=zE8VMMPVQAIy8aYws+rz9C7nboCop5JGzS4P9YCQBl8=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6UOpNP14i3hne/osuimerfTGC3syLUxLuIE
 wJnpVtSWo2JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlAAKCRC6l81St5ZB
 Ty+ADACIdkG3Hd7tMm/sgfnkWqZQ41Yqd4IqdWF3+e/5NOpevgoE/o35ullHAkd+2+l54Gro3re
 805skkVS7qQpu0GSacvMb47Ph0nmJsJ/3t+fQxhqRqfQZlhrqDpTY3sJYdbls932x0mXiXdRePW
 onZGnYDxlkWQlKKOjPUAdV8ydzH8RRVhEibZfi/O9W/oqOCvySZGu3WH/frsjAvYcR5m9xeYOV1
 sWc6C293qC6bApVsEyywLxZb6a/FO+J3R5mFpq8AEIoKH5HLwQe7kj8DbPLQ7Hy8OVR6Xg5cXFr
 17bCYjl2uGbwXx90Zeg8x1lmyvF86/CWj6u+wrPIyXxT99cq6GWFGsIzA62RT+vtmiqa51QrniI
 27jCQay0zabmB/WRkRMcq6n2I7Lt6wGJ0g/i7gI3MfBBqi/cpAtcvde3NNHcGoZoDKvnPY3bhSB
 dQdCAAKz/tFS678n2zpX68mI+DJnUxqI/EweCEX18IdWgPBEkYQ0iOIhXhO/XiPyrsM/g=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110418_261996_1BF1113D 
X-CRM114-Status: GOOD (  14.92  )
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

Remove sentinel element from sld_sysctl and itmt_kern_table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/x86/kernel/cpu/intel.c | 3 +--
 arch/x86/kernel/itmt.c      | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index be4045628fd3..e63391b82624 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -1015,8 +1015,7 @@ static struct ctl_table sld_sysctls[] = {
 		.proc_handler	= proc_douintvec_minmax,
 		.extra1         = SYSCTL_ZERO,
 		.extra2         = SYSCTL_ONE,
-	},
-	{}
+	}
 };
 
 static int __init sld_mitigate_sysctl_init(void)
diff --git a/arch/x86/kernel/itmt.c b/arch/x86/kernel/itmt.c
index ee4fe8cdb857..5f2ccff38297 100644
--- a/arch/x86/kernel/itmt.c
+++ b/arch/x86/kernel/itmt.c
@@ -73,8 +73,7 @@ static struct ctl_table itmt_kern_table[] = {
 		.proc_handler	= sched_itmt_update_handler,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{}
+	}
 };
 
 static struct ctl_table_header *itmt_sysctl_header;

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
