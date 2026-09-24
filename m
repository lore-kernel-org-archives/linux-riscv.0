Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EBBC98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ieRUl5F/WA6E0/c72jH53KneHVwFXOf4B08vbrKj5lI=; b=l7CAAOWT7gq7Vd
	0Ejw9jFCtwQ4VioPmzArkbMsuLhvJASDDq2GsqHO6jqugQXMaoooqpgxDbgYmgO9RylKvtOpv5SmB
	U7tPk/LclG/JcP2dYrhefJ4tm9y/R86gVT6/8jmgGo0sickBkNg+j/SW/n7FgwRvwCtINSOYdHare
	Wmswxk/ufrfEFIipxaxuot7m01GN7tJbXcKy9C+m91K+OnuRm9yTEhIg8jzdMubJAmxzJf42KGpcN
	7stajyrAj6+C/ZCzUADoe3JTy37pu+fwyA7JoN9L7Fl1OnL/1oUC7ZOmVWzHr+KEiTOYFcGdAzy4q
	e5XkLs4VxRoh9tNe2ARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lQr-0000000BRJG-0dqS;
	Thu, 24 Sep 2026 15:32:21 +0000
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lQn-0000000BRHA-3YqC
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 15:32:19 +0000
Received: by mail-yx2-x0d.google.com with SMTP id 956f58d0204a3-67408b109e3so7597d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790263935; x=1790868735; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=le41I7oDew/uulFg5A4QwL0jscocCjtan7pOx9jg2ZE=;
        b=MGbtPqP/+gWMjFsnE5UDhvOFEyLWnYLEs/yXpdhrKZlFe4batR7fXzPNQMPB1DLQJD
         0347wtGTvBll2WJJasOC1HH9lK47P66BiZ81TYC3qW4GmsNgS1MmGsbCgD8p3sJEJmmf
         9nV4vaBMuqNRsnafQkjzdQxm/Q0+TJtEbnGP4lJmzbDhupq78zgHtE1hW9toP8/eOSBa
         mv/GU56xoRDEPTf1nUCy1J6kpwlTVEqm1EjfjjW/55NwfZEYtAYpwJYsl0jPYO933WpJ
         McDkwH72R6STJBHm2Vug/R4OUJSWiGaNN2sndIDer9oztBrS7VYAcsFgihYnFnZGzrAR
         CVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263935; x=1790868735;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=le41I7oDew/uulFg5A4QwL0jscocCjtan7pOx9jg2ZE=;
        b=q7g3fP9ORHoBPVjlEbBkBfsq3+nZvu3C4oH2mQu194lNq363gHEIe7Jr9PoSwsoMK+
         SKTezXpf2uXqjgNOC8bYTeVA33jiw1BR+aXkxM8yEpkbaGMTEUEjIxdRtAvevQXaF/Zb
         zE4rtmXVOkpBfrJj5Do2s4/zLmDZDIc1wavXuRP5QMzMKTGPj/Ktq539O7Basu2bT5ku
         LA4l7uOLBqN1/U6MHljbObUFQ1zBCsIEuZocdWc5Ba10HzVo+Ea3w4088QSpyGVwXFyW
         pVQQHT1O4zpmnHBrrX64lJvqEYsbADA4k73DcxJNWAMpiQj1upcluCkut+iQNdCDQkR5
         2mdg==
X-Forwarded-Encrypted: i=1; AKwUvBxbH7ID/efM0N/e0l5S4aQJzfrXX+1RGZGThdHn9F2t84ADpMMlJDxGX0pCS+SM+2eW42wlc9mDGv726Q==@lists.infradead.org
X-Gm-Message-State: AFuF++lNWmxeoVDoO6an+pWiMvg3EJ9RjE7vzQyldfoRMqxRoOt0jE3g
	KegoP8wSVNqK6qO0/M34n0V/O5+9s/bLDWtnF7X52EGSKlD5IwzUnbZi4/MaOIiAoBg=
X-Gm-Gg: AYBFou01y4VB2eOsz3JaXpP5gtHtvI1n2CRW+4AWOK2DzERrF7qYNgJmQfJ7tRqHj5u
	skhwS1Maag6j/e47WeGMX3RPp3OF8zukFe6cX3ux1elLUQxR9/l4itRg4hsHM6YQb7yih+rC+Zo
	pes5v2Bha3gkotEYNdoJCmR0IO/3gp8ZM1JdZeKYzygBkAKF2cxA8JNP+ENCLhJGFoHB+TL4MUk
	Q7sE7w6tRJc3+iADBRK6aOvODA4DyTrzDmEAPRe5+CFsbWerUqfYtF7/0gDwONrekWLTzSfJ34D
	SHTZnVOz0l5KSK+bqpyfFSwUwrA/lObqsaWPhsLpMJel4gnZAs3YW6phDz4QY4YGQ7SS963k8C3
	GTlFbTRQ1CSRoEop6+7dn9ZfVHenDjU2ptc55kCjsOr+2Lt//Seck2eIAEMf8SWRG6Q3zawPUjC
	tbvR16btZkkXgaGjmvaukvn2FlUdakQ/QXL0JzjDWSeyynwF0BBly3T+Xs5CcEMVglPbpyZDWDo
	GQbSFjhPAGbFJ7Fks0dXLHWu3IjDnZfb73fnB1P/NsUavTv99sn0Ym5WpU=
X-Received: by 2002:a05:690e:4081:b0:66f:bfd2:6b80 with SMTP id 956f58d0204a3-672ed243db0mr1760528d50.4.1790263935531;
        Thu, 24 Sep 2026 08:32:15 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d8099876sm2083828d50.9.2026.09.24.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:32:14 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 24 Sep 2026 10:31:51 -0500
Subject: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
MIME-Version: 1.0
Message-Id: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAGZCtWoC/yWNQQrCMBBFr1JmbSDGUtSriIRJ8m1HSpRMFKH07
 o26+Iv3F+8tpCgCpXO3UMFbVB65wX7XUZw4jzCSGpOzbrAn1xuuM+cq6keu8DpxQfLIHGb4m3x
 MPCbbFoYDJ2qWZ0G7f4XL9c/6CnfE+tXSum7ihQg2gwAAAA==
X-Change-ID: 20260924-atlantis_gate_shared_enable_fix-c8d0c8db63ad
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Drew Fustini <fustini@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_083218_017137_72F66B61 
X-CRM114-Status: GOOD (  10.31  )
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

atlantis_clk_gate_shared_enable() increments the refcount for the number
of clks requesting the shared gate clk to be enabled always. It should
only do this when the enable for the gate took effect in hardware. It's
possible to end up in a situation where the gate enable failed, but the
refcount is incremented anyway, so subsequent requests by other clks
that share the same refcount get ignored and the gate enable is never
retried.

Update this function so that the refcount is not incremented when the
gate clk enable fails in hardware.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
index 6d4386eeb7dae..c8663b973749c 100644
--- a/drivers/clk/tenstorrent/atlantis-prcm.c
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -397,22 +397,21 @@ static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
 
 	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
 	{
-		need_enable = (*gate->config.share_count)++ == 0;
+		need_enable = (*gate->config.share_count) == 0;
 		if (need_enable) {
 			regmap_set_bits(gate->common.regmap,
 					gate->config.reg_offset,
 					gate->config.enable);
-		}
-	}
 
-	if (need_enable) {
-		if (!regmap_test_bits(gate->common.regmap,
-				      gate->config.reg_offset,
-				      gate->config.enable)) {
-			pr_warn("%s: gate enable %d failed to enable\n",
-				clk_hw_get_name(hw), gate->config.enable);
-			return -EIO;
+			if (!regmap_test_bits(gate->common.regmap,
+					      gate->config.reg_offset,
+					      gate->config.enable)) {
+				pr_warn("%s: gate enable %d failed to enable\n",
+					clk_hw_get_name(hw), gate->config.enable);
+				return -EIO;
+			}
 		}
+		(*gate->config.share_count)++;
 	}
 
 	return 0;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260924-atlantis_gate_shared_enable_fix-c8d0c8db63ad

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
