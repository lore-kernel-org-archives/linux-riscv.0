Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B6CA5512
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR2uilMIaEOecxmICg5UBhrIhhtXZmnYPncB1gwTJWA=; b=mE2irP23wNLC7R
	aH9fKQCcIdGbq/no+ufzvndRtH/wFkGF+WhQTiQe676zDcDwP0FBqmeGD0xiwco0PEbIuywAhjILl
	TY2H1uS6MyWeyrhh/e3+9NyZ281JkUkcZTIJ7Os8hLTobsLjFhmt7ohNQldDSEsWnIzo8RO/HHzTc
	FW7FHL3lEKzIot8M5xivc0GMCWEtgoLUQ0oMMpoIp5mZkkpfJIOviAacKjITseFpaQiidi7LSPYDi
	89oksm5+SuLyw+iyghFCo2zZp2iqdMgIlru8cekdgeGAr+xlkM5PksBPk1E3M7RSBtEklWVjfnkFd
	iR4WJGSjxg9z0Zcrb8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuo-005G5S-1H;
	Wed, 13 Sep 2023 09:12:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLud-005Fs2-2S;
	Wed, 13 Sep 2023 09:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=loNI37XhxnwCkXFWQjquvOLYjlIGsswit/WDqGDquHw=; b=JcTjGk+i62xGuH43h8JcA4T/2H
	knjCFLl1UMf8eqVlM6ZmXehZoXjOuMTbCWtvhyk+uXeRnf/RCKhMdSsXekLKxW0/reYQDgqIUlqMG
	YEi5JiWuVj7uvFMSzsxrfUaG35vVX0WayghwmRwXhFEW85P65xak1hZxgW1S5vphx3TgblxypO1YG
	vTzxz0vempyYDOBWaabmId5XY8DLBHEdsfHXtPyqwnbDzUmNZZdGMg9DcWhu/6j6Qz3Q/FsT1oOQ/
	EjTdpgD5ykeMOaSyb4Lki9qbI9y6WqCWOdoSZZm0a/J0DjNXo+c5e/nGefIRYIj+EthiUQ3l7K7Hu
	h7dK+skQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuQ-006wSb-1e;
	Wed, 13 Sep 2023 09:11:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2067D61879;
	Wed, 13 Sep 2023 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2438FC116A4;
	Wed, 13 Sep 2023 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596291;
	bh=neku3bTCLd8IglpTrtn5YSfS1u8bct6QtrT0n8vQ+lQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ERVWG+xelJhWJO/pE6ZpZqbYBufn/m6Org9hCcDXMkTmBpkBJNwrGcPjHjggWwSjg
	 xHSwzqHBlZEaRvodwTEsTM2UPPEWIcriaDpPyFrPAVtt0aMxdW7R25OmEcQQUIO1iq
	 BFzpp7+o/G7EMsNhqHZpkhyqKwHYmiagZH+yHECEv0qdbMzn4txgV9xb0AB6vtd0WP
	 O3zX1B9D7AWoHLEwnVBvNiwAdyk18/HGfvAhpqONmEMHQvA6MTM9pFo7GH7nwksmiC
	 3cepVxgJG8gcgElZlEO9vwZ+0fBYaHr56xvhry9vyHUgdx7Vq2R2Pzfd00GKowmfBN
	 6tO/av8ZPNvzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C42BCA5517;
	Wed, 13 Sep 2023 09:11:31 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:11:00 +0200
Subject: [PATCH v2 6/8] powerpc: Remove now superfluous sentinel element
 from ctl_table arrays
MIME-Version: 1.0
Message-Id: <20230913-jag-sysctl_remove_empty_elem_arch-v2-6-d1bd13a29bae@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=Y5aFvjpy8hnP3BxMe92wukoMH7BspM7ptVXcM2uJq5s=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXy/xLS9tN6wR4DTogukmf0SR2Ukel+W6p3j5
 MCK5Hj/WweJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8vwAKCRC6l81St5ZB
 T1XIC/sE7BuNn+96xT2x1msylJMtzgid9hN+e61HJ/NrDH1qqtScW6m30OKC6e0si6quzFz+YTi
 pAV4GZ7idF5xMOvHsbvwHIV1RwdZ9DhNtNL/LcDHG/XvJ7MwTgh/8AoLebpm6OVkPQzqaWghP1b
 bzT8rmYjV96saQgi8rPwt5ll57v8gv1g5ILyY4y+b+6f2Be19zRDDsj4YI3KdSau+0Rkw0OzdOr
 YOniWyBhmeW8vrb7Dfj3gECbAbjc2ndqLK72/WvPmgSrYzSVOezRh/xCsdldI9yTZOMnsLSSH+X
 GdOpAmEzI2XbDYlu3A2G8O7cg/mK+ZxT0+EA+PGFF8F8/pkZzHBXH02cunz12+R+VITnonmfxDD
 evvGMCqFZn2DmF/LgB+pptc/gO+Gs4uaedB1/T1oRlknK5y5fLNj0ce0Dw6GubZDNd5LaWme77D
 rnaLwKeVw2DfKOzgC+qKXHFSFjgISSSh1/pXUwVODumOI/GkOK8K95eDP4hfIXZ3+/M1Y=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_101151_801844_F7264AE6 
X-CRM114-Status: GOOD (  15.48  )
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
