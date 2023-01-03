Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DD2C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPtpvDSxUbljznHidu2uQB17qiPhWyWfbyimLgI4JH4=; b=bIh/FEzLU7AKqy
	05WZiXtQ0GUWUlU8Xn2r7tC60AJEtEnZ3P49/YlpuHItHb+tyKTyuqWEDB5j0u3hsa7+mrzh658QN
	7fc5V/BK5DHFCCY8s/65pvTNOfDkGD8RK5eFlaGMemzH30y+JnIuwRw2sEnnun4c+uH1NRVdYvT+1
	vohtLk5Mdh8uaLED9kXWwmzxMoDBa4RsQYdLF0ERiS8Q7TI3EshPCrxrfQ+1Ko3bFlcJhJaSVSrby
	LHDbC5jbLK0rtqjnjTDGACCT87gW/QbyV33SXbzi0vtPkNTL4ouvxfgzToimvVUArIYFIKC0mYQ94
	ssHUp689OomgDclffAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmX4-004AAG-7M; Tue, 03 Jan 2023 19:01:06 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCakq-00H5J5-Lj
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 06:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672727185; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D015MyF7oEjgyahYPi7FRxg+TX5oNW6/c6ZpbX/f2MnfyATKG6WYvG7A6B/j/S3SWcukHX/HL6lYGxfkPJht84WpAr/UqSFxGqeTYLHgDYPG07lJ0ochw8VvSEuOXaM6I4noFhcPvBRvmCDtaZkBE7HnvTIMCOOdGiNHe6l19UQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672727185; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fo3uR13lyRQljSpmxRTR1zKlcZFdTkcVYlJDvOPrp/s=; 
	b=J7k3IYHWIb1T7Cx9oUePQcGDdhxXjU2D9+R/LVlI3jnbX7GNWvbHeQpCZ8Oos4EyuIb5mp0FfTw620QnZsOayaa67Wx1kPmA90jtGTW441Zt3JHbM5ffuJ+B5RY/6k2KhcKk48SZRwg1Snl5sfeWEyGUZbWR8arnlu+b5/+s5K4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672727185;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=fo3uR13lyRQljSpmxRTR1zKlcZFdTkcVYlJDvOPrp/s=;
	b=Dv864V6O7oTFyRBLolxUv4FA4qLDKc5ndDA1nddRX7KI0zx/QGdWbvJyq0mibbXD
	wkT1AgHlRo+UbDeMLpRdSeb+4UeXQdgjZuCEXbDd7lIDzNkQLT32ZigZqIe1iXarVuQ
	5k4KNui+mLwNmIj2p5hJHSbMlD3z2LgebV6+zZO8=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672727184456600.0980556852927; Mon, 2 Jan 2023 22:26:24 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH RESEND 2/2] riscv: errata: prefix T-Head mnemonics with th.
Date: Tue,  3 Jan 2023 14:26:10 +0800
Message-Id: <20230103062610.69704-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230103062610.69704-1-uwu@icenowy.me>
References: <20230103062610.69704-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_222632_880966_E4CC8B3F 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 03 Jan 2023 10:21:58 -0800
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

T-Head now maintains some specification for their extended instructions
at [1], in which all instructions are prefixed "th.".

Follow this practice in the kernel comments.

[1] https://github.com/T-head-Semi/thead-extension-spec

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/include/asm/errata_list.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 605800bd390e..46adc1c9428f 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -92,25 +92,25 @@ asm volatile(ALTERNATIVE(						\
 #endif
 
 /*
- * dcache.ipa rs1 (invalidate, physical address)
+ * th.dcache.ipa rs1 (invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01010      rs1       000      00000  0001011
- * dache.iva rs1 (invalida, virtual address)
+ * th.dcache.iva rs1 (invalida, virtual address)
  *   0000001    00110      rs1       000      00000  0001011
  *
- * dcache.cpa rs1 (clean, physical address)
+ * th.dcache.cpa rs1 (clean, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01001      rs1       000      00000  0001011
- * dcache.cva rs1 (clean, virtual address)
+ * th.dcache.cva rs1 (clean, virtual address)
  *   0000001    00101      rs1       000      00000  0001011
  *
- * dcache.cipa rs1 (clean then invalidate, physical address)
+ * th.dcache.cipa rs1 (clean then invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01011      rs1       000      00000  0001011
- * dcache.civa rs1 (... virtual address)
+ * th.dcache.civa rs1 (... virtual address)
  *   0000001    00111      rs1       000      00000  0001011
  *
- * sync.s (make sure all cache operations finished)
+ * th.sync.s (make sure all cache operations finished)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000000    11001     00000      000      00000  0001011
  */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
