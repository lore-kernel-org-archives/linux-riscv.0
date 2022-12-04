Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83792C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qqd1Ac/6mtf7Mzuzmee+7TjaOnV17Kz82q1QbRCLCsQ=; b=bWnc/KK8nsdRoP
	0AiME48elQcrpJgdd1uxQLC0g7w7+vJ1x9EJOhsdGObF3dRr8i4rBsmsXi056NZG05cbzLfrs6iHz
	aajsBBC8nIbsZzi07dsqDvPo0R4o9SAzjmo4JKmdvF7cNP9Y1Vn5IJI170PCu1e4TJVT2SnYpOxIm
	Y+jTf7Q4e43FQzNkfnXDpuwU33yPKHhvJ9UFKHj8lYP6oHLINR18Pgkohe3/cILzF0za5jwSM7I2O
	4chYVdfyYEklGWRkUUSs4w/9eeHNPI+EqWXqRUv1x8zYGgzIsE0W+g3PgenpVACaKnzQidOYX/SS/
	GnY/rYZD+f48GXAP8I5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHl-00A7cu-UI; Sun, 04 Dec 2022 18:00:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEQ-00A6eq-Q3; Sun, 04 Dec 2022 17:56:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 813B2B80B89;
	Sun,  4 Dec 2022 17:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79EAC43470;
	Sun,  4 Dec 2022 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176608;
	bh=uEKJhhgHCKJ7NSPCvUP5nG/FZvTkFiItAP+4wfYfYcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PJOZO3NO1uDmT5GdJSBeotpSi20fraJXpovQHlLsu8QZF2o0SKZWO+W+1BMYSn+2j
	 uvAeVbl1wU75EIAvTsQF4TgXmLdgz0g0lCEiHvHDy6TiP5h/dzH3Y7tm5ttS7J0IR8
	 PUXlQLni9pnrW60WMi94AcU0K+vzwh6/ogAV6VaKqMNCGrc2orB589dNlmJjFDnC6p
	 BDGn1JVlym5H0LSoSLfI59CAxaGP8q47kWLKdgMmXAcEI293b2F3bCK75nk9JeTtPg
	 DNOU4fBixtz5OKa6xqoWSErEm6WTTn2LQSABqeb8BG36qwmwcbakPHpSzCaf7unDsv
	 jpOnfDNNxO/iw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 07/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
Date: Mon,  5 Dec 2022 01:46:26 +0800
Message-Id: <20221204174632.3677-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095650_999086_BAB8E2E5 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Switch has_fpu() from statich branch to the new helper
riscv_has_extension_likely().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/switch_to.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 11463489fec6..60f8ca01d36e 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
