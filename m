Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0359AEB8FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fwaqo6kWVO63txFIyTf9scTrqBfrjyu6c+OQSNZj184=; b=jenMw7nUbhyOi+
	2QjC+gGujQQ/b3PmgmhpX3dX08U2gvdGydiAkH6n2uIJZSLv93+iJOsbtkrgDuYA7pXDApWgeEK7M
	KTtsBs1Bz9kS9wd6PlLDfuSqi+KqLqiSSVho8v6/FlQJc8fkCyM5Xo5iZ7CQsFQtPyP69yiuxsjfx
	e2EXpGisRJOp6Ok/D47VSMEKi68JDFm9KX7253Ul3L3WfWf9oqMvHPiRc/j9UQ2eQ7I2N8UIY8G4X
	SIeKK9WrhOBDl/JtyOYNX5Id++C+swRCKJqJyeUcpAIFbWq7AHYyefya8Jh6aVjHyBYsOCs1szA55
	UlHmAPXVXyCogI7T76Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqVy-008abO-0d;
	Wed, 06 Sep 2023 11:16:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOg-0083rb-0K;
	Wed, 06 Sep 2023 10:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Mix/eFALG55RehrLK9e+4BCFhaRaouKOmdLv0TEMtY8=; b=SqutjXgKoAvf3F5XnYM9POK9TG
	ZKzv7XbkMRG3JYuqj42ONgVPeiVHs0MQITbPQSiFmaQzSjppCYFKAJhYju2Hk21xZFuao1E7R0hTr
	gQm0sGOXAHAOUM6JeMTCFPbeJaK+Hg8Qe10Mx6FpvZBQ3io79C0tKK47RjXpdno9elrnF9K8Gcy8o
	cMgAkA6GDwuWkfdyPo3bz+yPndmNNEHZJ/pbiqAFlczW1Zdo3YrKfMKdEJEop8YFbR72RR1fwaDuY
	P/m/h+NDK3YgfvN94woYXUqgorBJ1Dnr3gjkdHvfNcC6a7OeI57awECC3r7MW+8w+7mUSjoSkWci2
	t0aF0h8g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOS-0012PT-17;
	Wed, 06 Sep 2023 10:04:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DD2260FEC;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30DD3C4AF6A;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994649;
	bh=h0a5x4tcjiRLI8hBcyPKIVxtaEtL9PHUZfFV4ZC2g6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AvJt7V+5voaWDvo82nQl2Rw6T11YgG4afxMzvHyyxnIcmbw5kcK+qFHjnW+PHVU9B
	 Fud0JMe7TPH4Dvn3AjYKpKOCUO5S9e51+dz2SDencAHrwF1i9D46Wmg24VdR4+7UV+
	 ZX1WaMuOCtLFE4IKchvqCBSri48qndIH5Aa8ttMHybFQYfEhJrWDJ4OetnUnOKh0x6
	 OgS59PEZQX22SqHGJamFivJGssHHrFozSancic+89UND9ML4CQuhR5X5ptvW3chOKY
	 QUCym4fANBCGPbSEV1PMnHEH8unlrog1mxFAxGSmPPC/rDJ6Xcd7waqLVWeHxVDr8h
	 0y90e1GdV1nkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C85AEB8FB9;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:28 +0200
Subject: [PATCH 7/8] ia64: Remove sentinel element from ctl_table array
MIME-Version: 1.0
Message-Id: <20230906-jag-sysctl_remove_empty_elem_arch-v1-7-3935d4854248@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=KVD0r38Cili5TZDRzSBYSSUVuCqs3hfxf9D58EVeiJs=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6WE//Xcwga/1NK2RLvtOot92IMQidneKT5p
 v+BAfqJ9cuJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlgAKCRC6l81St5ZB
 TydxC/9h8/rccF341foOCgTiAME0wS/e9CbIyL0MBWHLnGQcnYp+RhqdOL0GqHAz726Be1j15kO
 v6YfgptJJw0OJvMP2WWim+xDgOYuBwfWffbIOEjiAZuahyU2itf1YdleanEZfHhbUqci//oJqSh
 0ajDFBrA+FJKGxCR89VZ01mvGJI5OzswbPnBN32NY4P6KwIE5UoxBLOyxfcT7EtwIQWKpqTk8Pk
 Tulducj2tt8/hPjMNRJetxGELK6ZaYDuLeG7JX3IXgv06/gZXR08QuTLJXmTBEC7oy80w8isUKr
 hY3CrAwd+3lFltSZdYchIvP73k94L3GvSEJz/G4tAoYa/ULVVQw5ClmPo4Se9AmCl7KWNCFFxk3
 YU67Wru1bC8mqE+BTU32baxgXb4PMz/bRGO5NXF5C2K7CYClJy4ZobHb94Ib7QdkgbMhGjwyBoE
 AxKe/dAVVCRcQ7EK66c3SmG+78AEf84jHaVHhmR0xjp7NumHR5XRJFCWi13YS3+jpgjhc=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110418_351296_ACF864FB 
X-CRM114-Status: GOOD (  14.19  )
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

Remove sentinel from kdump_ctl_table.

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
