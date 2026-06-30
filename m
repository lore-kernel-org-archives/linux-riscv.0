Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019A7C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tY+CY4EQ0OlJtOhOcKuUBXkM3waSVy/WGnQ9aHLQhQk=; b=KUR4U0o2nNfspI
	S7u2KU+c/ey/cez6OBNMmKD7QVJO25krSHgkCOwoiDZDxckIq1Pbyos4yy/aeTtPfAmw2d0Q9tUBd
	oqSR+UKrQ+u0Spa5ecAsKgUkGnVrG8UVAcCQMmU5gI8qGT9XHFWKUsiH+aS9gGpsvhofiXW/G9ajy
	9I4j+G7ctPDmWieh0ze+rc+3FyR7GSCEqBE6nqqS3OgTo7IPl0gvf116+BRkHLJwvkAP02Ylmhv4Q
	5M+IjDmRa7PWr/XHr3FVD32EqO1Br4RDXtjR8l6A1R3gEQjSYtyQHU4jzf49IWzs+O6zThO0Wvw4L
	vK13M9iDQKJAw5r09gVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUEB-0000000GJfO-0uwZ;
	Tue, 30 Jun 2026 08:53:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUEA-0000000GJex-0nQL
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:53:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC50B43EF2;
	Tue, 30 Jun 2026 08:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B421F00A3D;
	Tue, 30 Jun 2026 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782809637;
	bh=2HtGnCIHtd/V8Ei5mHL6Se13N7jz0RHnhWb/1gjbiwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QOqIyfFVpiRZypxYa0hZGiAPim+RhUt4enXFanipNG/Y5a8ZgFgjTZ/U4mVR7HDX1
	 E78M920Hkb0qCEBw4UvlpZpiyCBNOAaO+V1qNn9Z1WMX5Dt82tj127PuhtpRYbC9fL
	 GGTm6RLkiUCNZgV3PsWPoJ87xat2fnTvxy+04cn6br5b5QD3cBeQknNM5NFW+9krEw
	 Aou4Sdu3BA9kcQn5Qg2W8mZXOcbdXybLCtQr/QGQ+HdpWWRYaPDnWZexcOWmHDT/MY
	 Tqdbf66shgy2XiOOTSK/DGGbUTkSTjuFPFoSW6J75bd8tO2JP+lm8rWwG4G/xAlR+d
	 IM1xKKeqfiIwg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 30 Jun 2026 08:53:20 +0000
Subject: [PATCH 2/2] clk: spacemit: k3: set rcpu clock as critical
MIME-Version: 1.0
Message-Id: <20260630-06-clk-hdma-critial-v1-2-443c0ac88c5f@kernel.org>
References: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
In-Reply-To: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=dlan@kernel.org;
 h=from:subject:message-id; bh=HHkQNwP98rFHgVP2kYh+bFVjwQuFlKADnHc4gdbQgwI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ4QbruFraRrtUu/b+QVSMLU3Zj3WuIuQbOH+F
 L7DBuksQq+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakOEGxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3k6A//bPZ3kdzo023uM4g3wJqUWgIe9NiKRWuXQvTVPGUjN5uAFGs3QOe/+
 2zhlBt7e6NSJa2WPcl2+fYyIM9mPDpNervlVbD4PTQSU2IkgX5GNIVEttt3V0pwzRb9SihZWGW1
 dH3gJPJXdqs+XRocuKgxSe8PUQlDuKxhXlP5KCDwo8eCxBspXPql5GeYcw3JI0FZJehOlU2R2Cu
 2C/d5sfmX8KkXbeDVwdbgD6Uij//71V6bspkcINZUpxBhRd+HRRgUmS2RIDhfzGt1ZWOYk23nHN
 tituK7kyfxbY5M9nn9c9h/EIY5/aLqD+c0LPBrStzP0nMoaf4xbE1X8etraEWc7at7KVYNcgl7Q
 m7A6++YbSns6ClN7yjpBY2VmIWvxRAgPyWLCUCFSxww9ux36yiyxUel7dPd6ORDMkv8Hxz4cBPX
 q9GcI6LtR34qLk+duzcBM87PZdSNWntGSpzxcVySRuqX3Ro7DPMwxTuPvK3i/BpXaB1M/EwR54B
 goWDovdn1paqIUzsGv70J/40Vn3GaIFO0G+PRFhCDg4Nj+37nqt+K/0FwmyMmqb/ubpzJEUtCyx
 wNHG2uL9RwMjnbPUasqf7N9m9mXPEdc9wMXfBG3IGrSfx6eK5MzopW/WCV2jV9EFmXsSQp/GnSy
 87M2sqralUAyHV+8h4iKch5N7qU7/s=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The SpacemiT K3 SoC integrates two RT24 RISC-V little cores (os0_rcpu and
os1_rcpu), each running an independent ESOS instance responsible for
system power management and real-time task. The RCPU clock is required
in order to keep these cores functional, so set its clock as critical to
prevent it from being shut off.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Reported-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index f0160b4c0e1b..3867d2cff2f9 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -866,7 +866,7 @@ static const struct clk_parent_data rcpu_clk_parents[] = {
 	CCU_PARENT_HW(pll1_d6_409p6),
 };
 CCU_MUX_DIV_GATE_FC_DEFINE(rcpu_clk, rcpu_clk_parents, APMU_RCPU_CLK_RES_CTRL,
-			   4, 3, BIT(15), 7, 3, BIT(12), 0);
+			   4, 3, BIT(15), 7, 3, BIT(12), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data dsi4ln2_dsi_esc_parents[] = {
 	CCU_PARENT_HW(pll1_d48_51p2_ap),

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
