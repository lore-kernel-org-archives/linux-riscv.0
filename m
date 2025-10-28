Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C92CCF9EE
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZmwaHG5HBv1oSIkcjLlboqrot746hrITwpH+kAIqaQ=; b=V/KvwpvS3b828g
	9nWD54wPbnJdAhGJtJuFG12Old+zyVf9kBa6vdmZp+yJUB0Gx4bW/UUiPZIgZHUrbSMC+GnWZko/E
	pD2mZzHaEXEHvHcvUyTOUZSxftl2E6ns70Xc4PRn20qp5pBJ5H5YwnVFJIcwER8yCnsd7Rn/bT7fV
	RzqcyShWkNedQZtsOLR7Lap9qKc1BQ63jVDYdstYfsa+3lRyxZ9DDf+pah61KFEiqEi7+ITey+OiM
	KKt56TzeIG42EGB5ThsAP4o9FLFXEEGd8wlqf7XdfO+6kCyLqoIDBKEjBeKSIInEE2CVwFcl0D1kb
	5qTyyUGY6lOSeF5txBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijX-0000000Fv3D-2cwj;
	Tue, 28 Oct 2025 12:23:27 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijR-0000000Fv0n-0VL9
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:23:25 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251028122318euoutp025b9103d7b650d8a177056eea59d6e461~ypyjyGRC-0298502985euoutp02O
	for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 12:23:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251028122318euoutp025b9103d7b650d8a177056eea59d6e461~ypyjyGRC-0298502985euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761654198;
	bh=uWMsqhhcsDbSWAzMcyI6QgsDz6D9C7w2POWICu7CupQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=LkN5orKn9XHXubVcNTl/1nuQvVq/uHBE3gmWBWr+njVfDGe1qwKGccWy7Qxfxhm73
	 49AfQbivz9L/BefYPWUM7iENdKJsXJn+iYMhWgpqv5OdVk9PjyvmIJ89YOoRJsA+UY
	 s/oYE8G8ywiXZMSqRTFvuNEigb0hGQsnDHVhhI6c=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68~ypyjVyJo80564105641eucas1p1P;
	Tue, 28 Oct 2025 12:23:18 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251028122317eusmtip2563abe71fe7499c4e71a7162653a7e76~ypyih3a7n2998829988eusmtip2H;
	Tue, 28 Oct 2025 12:23:17 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 28 Oct 2025 13:22:34 +0100
Subject: [PATCH 3/4] pwm: th1520: Use module_pwm_platform_driver! macro
MIME-Version: 1.0
Message-Id: <20251028-pwm_fixes-v1-3-25a532d31998@samsung.com>
In-Reply-To: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,  Danilo Krummrich
	<dakr@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,  Drew
	Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68
X-Msg-Generator: CA
X-RootMTR: 20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68
X-EPHeader: CA
X-CMS-RootMailID: 20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
	<CGME20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_052321_702597_584D53B2 
X-CRM114-Status: GOOD (  10.62  )
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

The `pwm_th1520` Rust driver calls C functions from the `PWM` namespace,
triggering `modpost` warnings due to missing namespace import
declarations in its `.modinfo` section.

Fix these warnings and simplify the module declaration by switching from
the generic `kernel::module_platform_driver!` macro to the newly
introduced PWM-specific `kernel::module_pwm_platform_driver!` macro.
The new macro automatically handles the required `imports_ns: ["PWM"]`
declaration.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pwm/pwm_th1520.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 0ad38b78be854ab3c10268fb20763d9962f59c0f..5fb123f5e9c6dc3a8ee9a7a47fa778c23213e957 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -369,7 +369,7 @@ fn probe(
     }
 }
 
-kernel::module_platform_driver! {
+kernel::module_pwm_platform_driver! {
     type: Th1520PwmPlatformDriver,
     name: "pwm-th1520",
     authors: ["Michal Wilczynski <m.wilczynski@samsung.com>"],

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
