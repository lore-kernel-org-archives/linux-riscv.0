Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C48CA5517
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiL7/PNwfOCLrL16JopzKNWuHCUBN+IKs7IjKEgw/ZU=; b=ssPelDYH00mzfo
	X4Dgjfxl3BBlOv3yGMSMW+Nmb+GxFFYGjfDrHDKOFvSTpPm/H8jX0bP2hWF8EzrL0W8mL2NE/W0Mt
	gzpL/+ipGVHPvhZ5gQMlYudDXfwSnLGv+N74sYn7ZfKHkBszNhjWxdW5ZVEicJtzTc4J94S9YXF3O
	9ynLq/RbV2TDxRnfYt42BnTp1lqhD1RjghxmY6v/AEbb+nwDGYuvQNIb9xJRqesgE/dSU5YmVwCHS
	hJXCa2LaFarcBDZGnNvcAJxGZkBBk29K8pu5Zsjv3GaRvT1y01XfkfUz2wfWbgGm5fTEeyvtjdONu
	UKBBsQ0F4W3YkGn7Lwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLug-005Fvp-0M;
	Wed, 13 Sep 2023 09:11:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuW-005Fkl-2j;
	Wed, 13 Sep 2023 09:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=8zVRn/xYe+naIiUT4OSzCDyCajAZIGE9tJoTvUfmDFc=; b=eHsTANjjK/tEhRmztMoZZ1eG1S
	ldCuxGkiA1H3y8YZPlu6Y1TiMW9+9ZUUwGAUeHPTo92oRnN21UIYo7tiokRQ8Dt9sU+WlH0Uxrg4b
	YQ7e96eilgurq5XgypS2RLA2PZfjFbjmhGBXGE+PV8H+A3pusPrEY+9auqhdGTwRHC8Lh7sbhlMNC
	KSuO8aAOaHy1Hmn87u+iblrUSu0Sb/xGuWinxSoPlcvBxO5aByYBAURS3CaR0U4NufDyb8wB+DaNS
	1EXxKIMFSXiekppg2W1S4ZX9CYgGgpK+epqdX8Vw/xacvaBJly5oWyBvtvGNPn/Q/kjmX22n7UfYm
	k1zr874A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuQ-006wSc-1e;
	Wed, 13 Sep 2023 09:11:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBEC161880;
	Wed, 13 Sep 2023 09:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E67F9C43140;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596291;
	bh=+SkCefiM7Rz9hJ2ASpY5uKrkxunp6sYmL4qvl9Jz50Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gQL36KbYmOA45/H39/FvcupQB6qfrDZng60uDuBXUxWaVxxrzg/UKE47G+gCnNPRR
	 B2yDI0DVivTessUVRqrfj2VVT4ROhCycxHsndPRgtCAdDIq2sppQfQbzguD84NiuXK
	 aIDW0dFH86hqI6G7Iy+PY717epHL8OL+fDIADn9V16d7ecHn1nanZtGr0AbMDpADzu
	 1lOmjqbbNveXQzDyzlfveXxXBXZK+zaI7klOXYCKxEEquOuSWLb2YNUbnYC//si/Sx
	 FFlcpGe4Jq84kfWHNSz1PzxPaw7pvfkmHeRHg65usb91LmQG6DQk4w//c0YuBLUHqU
	 YdVxmP3YnAvhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EE6CA5512;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:10:59 +0200
Subject: [PATCH v2 5/8] riscv: Remove now superfluous sentinel element from
 ctl_table array
MIME-Version: 1.0
Message-Id: <20230913-jag-sysctl_remove_empty_elem_arch-v2-5-d1bd13a29bae@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=YhYzwXNIWrnF46Hw4PUNmR1n0YDZHud48ce/eV4ICtM=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXy//n7ybButdcC1NW+b5s25y/I6ZQweSJCGh
 5gWlZN+rfSJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8vwAKCRC6l81St5ZB
 T0xoC/4wdx9HmCnkncq1uWYaaqcyWjEZ35dLKxLJD3hzf/ogL5WosG7ygHccjr2kZiIWlrfPljQ
 50/YL1hLTWb0I2pfklTFc00C7w2A5drVX0YdXTYIui01X2eEnBSUHduH1yu3tPXdaiQF5zGua3E
 7QRf0mYcdd8CkzKVVDleL1CNNJeIwv7bmio60kk856IPoD9H4b3GY6P5hy3kKB6OgiAmtHNw6gE
 pb7dQmic7iu92C8FquKnX32eimC31sE1iXR+kNcxjzh4x9wlUcWSeWJO50YBYvoFGyUTrclf6rV
 xV/PibvMKixJVXrklbCFIN/sB3tX5JzBr7E+94z0APKSJglMieYLuePE2T5eAONF+T9Hyyq335r
 neRaxNxnzDvk+hJQFH8px9C/D2Zz/8/O8WgypJsF8PMx2Hlk4hFvXgblyn1EJ6tzUdl+LmMezkf
 g4sNYIJ5nu9elX9Iov8I8UaXEm8qyUkMbYkHWWOM41dweBJs8QPFRyoxoSEOymAokMhSg=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_101144_491031_1D0E6A38 
X-CRM114-Status: GOOD (  15.00  )
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

Remove sentinel element from riscv_v_default_vstate_table. This removal
is safe because register_sysctl implicitly uses ARRAY_SIZE() in addition
to checking for the sentinel.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/riscv/kernel/vector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 8d92fb6c522c..a1ae68b2ac0f 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -254,8 +254,7 @@ static struct ctl_table riscv_v_default_vstate_table[] = {
 		.maxlen		= sizeof(riscv_v_implicit_uacc),
 		.mode		= 0644,
 		.proc_handler	= proc_dobool,
-	},
-	{ }
+	}
 };
 
 static int __init riscv_v_sysctl_init(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
