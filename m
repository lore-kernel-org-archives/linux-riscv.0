Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5ECA5512
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCS39hcR34QUW0ge/OyIC02dkp3yqY/GuqQg6iqT+7M=; b=O2uDWMh1Trz/vO
	cz8ZySyxaimc1HyfU1UZeuMCliYibAiClnAh8YVeFGDu8ZvNXff/JrPl8zQRXYotokrOH2zLkUEd7
	d4ZUm7lghW76W5ahMFsJqADSEVVuKr4x5Hfrw/nA1K+nPv3K1mT8lOn66rn4LFOjQwb1SFmntJROl
	iv17tiOOJ0j0FaicsWj8i7K4GBKaArZYxmPnEFH6qv+FwjtwpKbMrUBwrVRSJ2eu1UFJ4ok7xFvJB
	LxACq9zyKrqFG5o3gCP+Hr6eol0kKyp5fvNlRQtWC6Q1aOYxPaAoKpyK8X6sAuslkUh03T1HWOGK5
	FvJElwXr+j1bJKFdiV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLui-005Fyj-1Q;
	Wed, 13 Sep 2023 09:12:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLua-005FpG-26;
	Wed, 13 Sep 2023 09:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Bzn0N36Z7WwrO0JSypYf84HzAdvqvOUvtItyv8DwW28=; b=iNs6a0iSwGV6uVLzRk4JstJjJP
	4Vt0V+6o/SHryQCBC5A+HgLrByIqqYLZYOW5/JwkA25ZhxQ9l7psNQLwrHNL1FrUCW+JAzRpYSX69
	waYTbu7V7lGw4TKMKpFcIP8hK+mUmfdHxLjYzhinc3Bo5Cd009jJxv2RYOB0UAxy4dRKRrbNoIWNH
	MVvgP4tRW1WNLriWwTnhzeCLBZn0r39X6XuY0lw5aGKGR5Z0phh07+O8JLxCw3M0CFW5QTaC/x30H
	+Lz/sg56DROpdNeFPipTxyseLfR6UwXMgNWrVkhXpZeVk6QtcNNQFsEsdZOjIyeGbxlgwxJC2kVYD
	h7Qfacvg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuQ-006wSe-2i;
	Wed, 13 Sep 2023 09:11:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D5646188F;
	Wed, 13 Sep 2023 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F839C116A5;
	Wed, 13 Sep 2023 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596291;
	bh=ksLU1HhgDy0MhjOqDh9D7XFTDE0gr0igDsdY2TtQW18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BLO61mdJNn6CFbNVYJjrwbyXdBVv5NFrqAeXI2EoDlrYgpyjKA/a7K0mcAbrDsEUS
	 /zRt3jzQjiD7tnH79ngNjTRrpWltErPT9PWMgRJ80QBu/DRSztMYa3I/EkrTmJCFOl
	 5ktxTNb522azMcoeSzoUUNYza35JGtsN1La6L5VMCtSH3HssQ+WHpVRrXoUspvn0S4
	 X+ENyNMkwhS7Bg69Ei4IM/HT316zTaCS6/3aC5bdKZ8KY28N7Oindn6ORq753wVWXO
	 AstD/NMFYFbd2rxWuaP+AzEkxFO4MANSJwiL4Nctt5RUoICOQoeM+63DVHgNIXTLsw
	 L/Q6xw4TF/Y9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C79CA5518;
	Wed, 13 Sep 2023 09:11:31 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:11:01 +0200
Subject: [PATCH v2 7/8] ia64: Remove now superfluous sentinel element from
 ctl_table array
MIME-Version: 1.0
Message-Id: <20230913-jag-sysctl_remove_empty_elem_arch-v2-7-d1bd13a29bae@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=lfucH0fE8uQFBzo2EP5V/PmdZ4osPZqCeYafiOtbfRE=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXy/IrVGWKts3t7qO7epOhGK03/TUs7HC3Aht
 61eeHhSd6WJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8vwAKCRC6l81St5ZB
 T1qXC/955BgLg+IseBXTIS9fcvV95BuKTAMxBJeylP/3uT/84KdU6CA8PQILJr4QWPTncvV2oFg
 C5js1ma1h0Ak2ndYSvUUh7C24rfIM5N7HW0X6W2rgeo/TUzexc1bQDk2YaRJuUABtI/+7MQjBY9
 dN/JjBF9PdLXde4EcRVrJfvYjOGX9A3CYI+V+Sb6o/J4zva5hvRuVPWF6czcENFd0P1OxVT4A5P
 K7QEmzlxVqbYMqcR8NxJOwoGiuxkaJ6q7St95Nm7KMh/+EtR1RDI2MhkA4pQtPrsUZSyKlmopcT
 FZujBQxUfYpXn08bUXhQlor7gLp3KkSVugiPZLHoqNld5DzvBZWgmgF8yiH7RjXVfqzC8MmaQTy
 WRz63EbdYN4/8UInqWjBuxPPitn9iucNOMRWV4E+GyCSmMjmF8oQvSC/FHjikZhp9qeNZ2Js2p3
 +hhsDdk3on0AxHDllu98rHNusDz6G/ueEuVhC+eYmyDvjXtif26siW/vEQe2Lc9PMNWQY=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_101146_466529_5CE2E00B 
X-CRM114-Status: GOOD (  14.80  )
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

Remove sentinel from kdump_ctl_table. This removal is safe because
register_sysctl implicitly uses ARRAY_SIZE() in addition to checking for
the sentinel.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/ia64/kernel/crash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/crash.c b/arch/ia64/kernel/crash.c
index 88b3ce3e66cd..fbf8893a570c 100644
--- a/arch/ia64/kernel/crash.c
+++ b/arch/ia64/kernel/crash.c
@@ -231,8 +231,7 @@ static struct ctl_table kdump_ctl_table[] = {
 		.maxlen = sizeof(int),
 		.mode = 0644,
 		.proc_handler = proc_dointvec,
-	},
-	{ }
+	}
 };
 #endif
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
