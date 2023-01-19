Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87759C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wq7hL5v9hZJplaXcx+lSLWQhrktN9HXbFyNJRjxqIus=; b=UreppIfCUp775g
	8a7g+6QILQ/GYK3JujAspL7mNlBshsPyQ+mReHxU1E80E7kYNLd6n5lKHRpeYXotaj49huwqvipsb
	VgBG1p4JdYsbo+NJlGZm89Ykk2eQDSVzIKuq41t6OVfwCkCOgTKOwGlnTGVxBlU4lmieMYzyS61Jm
	EjmTsOyZ+w2JdZBqPGjQ4mlq4TqbRmUzHM8xN0Of7FhcrBmTdCYjeHC8/ujN8A0InqhmvQ8+4SDZw
	zuT57ancKjpnYTo3x7BaN2mAi3cvrIry180KVOCBjdrcasy8XJphsgJZdMY1sPJlsnq8jFcaAgl8W
	z0MPVd7LcA52UKIwSSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPi-005q2f-N9; Thu, 19 Jan 2023 16:05:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPE-005pnc-CE
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 16:04:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 14BCEB825CF;
	Thu, 19 Jan 2023 16:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192F1C433F0;
	Thu, 19 Jan 2023 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144283;
	bh=HZ2KeW9xZS9UJRxhjs2snT6EZu0lqTWV3MzCCMYghqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZPQmJJUes4tQ1AHeqLpcuDsBW0QuzfZesiN8dtYdaZeUVxPt0hMlcL2HqoMfSORIU
	 R0OGX1vIgqw3Szuz+yOhOdEK31eu6KYWEOSNPET/XJ0cnB+S8FklJuGJ9vsNuRKPvw
	 RQyodrQj7IYIZcVX2nPnM/kdUcw6rvQ1sEp7TaCJ2c1LZFR35A01Va75F6cuiIKlgA
	 7IsczqPTd5NABgRSLCJBfB5wPxqtdNdKc0B/oSOiRf21wenFIlD+c4l+B2b7vqzHgn
	 McDiYiDWtnsikeoHgFtGuixpH1sleZfxOm9OJ2VMgTBfNfi23ir6UeiBOBda2Fz/lc
	 3KP1k6cQgZ7Zw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] riscv: vmlinux.lds.S: explicitly catch .riscv.attributes sections
Date: Thu, 19 Jan 2023 23:54:15 +0800
Message-Id: <20230119155417.2600-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119155417.2600-1-jszhang@kernel.org>
References: <20230119155417.2600-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080448_640151_FAB42D8A 
X-CRM114-Status: GOOD (  10.12  )
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

When enabling linker orphan section warning, I got warnings similar as
below:
riscv64-linux-gnu-ld: warning: orphan section `.riscv.attributes' from
`init/main.o' being placed in section `.riscv.attributes'

While I don't see any usage of .riscv.attributes sections' in kernel
now, just catch the sections so that we can enable linker orphan
section warning.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 6a250313b752..7eb3d25d0dae 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -146,6 +146,7 @@ SECTIONS
 	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
+	.riscv.attributes 0 : { *(.riscv.attributes) }
 
 	DISCARDS
 }
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
