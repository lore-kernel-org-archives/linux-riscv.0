Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42610CCF9F0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9J12hOKRWP1Q1tjhDHk0lAnCrTQtwi5YMVcBBYWYJkA=; b=dTeU3hwqz6ax8K
	bY++HU3Y/+Z1Iz4wuS7EsqErHzLoZsdxKNs6dWTm5Kzjdf9ZPGx5Sd45poq7zHDFBLcRoLX3Vn1Oy
	kFuoxrIb8ksuQiEeci7fy3KEaYuv9FIQJQMdTFTu7LgC4J5p0vRPJcLgh1ky0fwaZ4gbT5S1B1zVw
	u3NW4rv4ceRortnKiOJgpmOm7B5s34kk4EtZNawvYRXcAciSlpocqSe9SoDYGK0NP4Pjl359mqP0h
	F+/ZvImLaqd8BFFkGp+K/EwIsB3hYL6fRK3jlMy4Nil0CtAmjU2pMo5DVY/LS5RsQN6LWmSLljaMa
	UmmwA2vtJvf17UhpJckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijY-0000000Fv46-1ICW;
	Tue, 28 Oct 2025 12:23:28 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijR-0000000Fv0u-0s6h
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:23:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251028122319euoutp02b1f0e94212754ba7b12880828c3f7c73~ypyk24fRB0283502835euoutp02V
	for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 12:23:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251028122319euoutp02b1f0e94212754ba7b12880828c3f7c73~ypyk24fRB0283502835euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761654199;
	bh=Lm82DRGUZZTV1/beTKsFXySMTVqtnJxLBKgmXs1gVko=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=BnIeIH5jEm0VOKgBrzpMbb1uakOkoeayhb74hp0j9RjEqIYQ9EVWNhalDlmIwitFP
	 jS/H83dsM39aXBHimHfxdD23J7JTzy4buroRirlXUeUAUlf6q/vqiqP1EPc/KOWpaR
	 NpGDcXgj3sSnsomxoIMhIeOy5C8FJPrNfZFHVpd0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00~ypykGd4I41056510565eucas1p1H;
	Tue, 28 Oct 2025 12:23:18 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251028122318eusmtip2cb42586905d3b5fd524bea75b0831884~ypyjWQEit0671406714eusmtip20;
	Tue, 28 Oct 2025 12:23:18 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 28 Oct 2025 13:22:35 +0100
Subject: [PATCH 4/4] pwm: th1520: Fix clippy warning for redundant struct
 field init
MIME-Version: 1.0
Message-Id: <20251028-pwm_fixes-v1-4-25a532d31998@samsung.com>
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
X-CMS-MailID: 20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00
X-Msg-Generator: CA
X-RootMTR: 20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00
X-EPHeader: CA
X-CMS-RootMailID: 20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
	<CGME20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_052321_700619_3CEBE655 
X-CRM114-Status: GOOD (  10.11  )
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

Clippy warns about redundant struct field initialization when the field
name and the variable name are the same (e.g., `status: status`).

No functional change.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pwm/pwm_th1520.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 5fb123f5e9c6dc3a8ee9a7a47fa778c23213e957..95a809af48eb16fe13125d4d9f4ee5de20555e77 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -185,7 +185,7 @@ fn round_waveform_tohw(
         );
 
         Ok(pwm::RoundedWaveform {
-            status: status,
+            status,
             hardware_waveform: wfhw,
         })
     }

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
