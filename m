Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED39C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APPBFV6CRoqXHqktsWWB/afC0BGjmBb94Rg5RVnRkOs=; b=ZRSce0SpLrVeVg
	AG9BKNMUgfejYYviySP2GKOtNEfZyHui+bz0nWUS2Ny5hqP0gboDqXgdhPhoJbNwzoqYKUMj6Gky8
	hs73a13bme2koSX6MYsIcMc+JSGzV1jjb1TJYzPd5n4WEKCbOrvBY4vCPi+jPSYN4t2kbq2DvFVyE
	8G9xjZQZIfHY9PNj6M0ClZMvOPHgwQppsiKJLJwctQm5E1x9xaIz+IpEgnAUiIknSQdWQKMa3dORL
	fD78zjrJxk6H0X1r/kxHMcxcGjgVrTsvbe9vOOVYVhOueqpCa8m3XVnOmKB5ouXGkxya2sV8IKqsd
	hjFGM9OqNqP1///F0frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNS-00CJUM-Ao; Sun, 12 Feb 2023 20:55:14 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNO-00CJSj-U5
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 20:55:12 +0000
Received: by mail-qv1-xf30.google.com with SMTP id j5so5065555qvi.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 12:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQdHW+PhZq9WcInZ2+SoRq4atvNxsCBkR2bKm9EuIOs=;
        b=GkttBvPlAObOivWdQ0mXQJnKbbGtSDX0YG4FGKozO5eqFdmh2+9C3DSiMsnK6F5Xma
         /sa+Usls+PdZKAGCKeHzxJUlUh641FtZ7jrtlshH3zNja8o4XZ35goIqz9nJ9JrfczET
         Sp2MzSAOi5Mx6KSt//w+0/74AbweY6E+c9Taqz50P52EQihVyktFL1MXjMFP/rNIrc4R
         nzqVh+NAo/xMF0zWYjH++GsLAVPBM1ER3CUCgcmRV3DjeIq2erLqdlbhfF9jpK/jbmlX
         0g2tp0S0Eexk0yqkBqaKx1s3/qEqGch0MMvQycUlGZcl4r5wnJMFTnSaag2Gx+39JGek
         t7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQdHW+PhZq9WcInZ2+SoRq4atvNxsCBkR2bKm9EuIOs=;
        b=tLK7ue6dS48Q30meH1hyw0wQTBNPFhjgx7E37QQkQOJ4sffxzbWEbIHrVIJtuegFkU
         SWKTYydIf3IdnsiSwWubYH3c7wdBYUswcRybJgamIpkGFY4qfHQwb0DoKWv+xS/6Gmgj
         K033K24y8nESCGubKK+hHcDktMVuqxyEBFq4Yxci5Ur638ekshx3vTkL/sDdCEQ2vyY3
         jfS0wE613djfM6vv1/s5e+ARgRVd9ZB36BoClZJZTOVQ5TLKISdx0fZo7pfLc/jD0m3w
         9VXQx+HVK3qWiCuyDklYAY00ph33hpsflenFYAele3lmbJZKtwHR1DhQakeVe4rSbLTE
         wr7Q==
X-Gm-Message-State: AO0yUKXgi7L8/aDQBUdflad7obg4rk0cYIRvpP7at3w8gh80Je6Y3HU9
	EB9BNJKQQZi7zMwTJN8809FpUOxWkqdWvg==
X-Google-Smtp-Source: AK7set/7PO+QFexTHSQTgL0s0TsPzpuVBx6+y8AuSbEd+yCd227mmBNu++ZlMRl7YxkXXkgXnheaiQ==
X-Received: by 2002:a05:6214:e61:b0:56b:ec1f:db0d with SMTP id jz1-20020a0562140e6100b0056bec1fdb0dmr33894218qvb.34.1676235308881;
        Sun, 12 Feb 2023 12:55:08 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id o62-20020a374141000000b0072ad54e36b2sm8289233qka.93.2023.02.12.12.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:55:08 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/3] clk: k210: remove an implicit 64-bit division
Date: Sun, 12 Feb 2023 15:55:04 -0500
Message-Id: <20230212205506.1992714-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_125510_988067_C2ECB27A 
X-CRM114-Status: GOOD (  12.75  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The K210 clock driver depends on SOC_CANAAN, which is only selectable
when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
have been sent for its enabling. The kernel test robot reported this
implicit 64-bit division there.

Replace the implicit division with an explicit one.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 drivers/clk/clk-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 67a7cb3503c3..4eed667eddaf 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw *hw,
 	f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
 	od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
 
-	return (u64)parent_rate * f / (r * od);
+	return div_u64((u64)parent_rate * f, r * od);
 }
 
 static const struct clk_ops k210_pll_ops = {
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
