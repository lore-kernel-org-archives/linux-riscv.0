Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31BCCD98F2
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3idB/ggpOhSkMkCImIgMIgdv2V0qBU3cMQefj/ioh/Q=; b=SZZDOgld2tQDEy
	i9YTsJy0B+9ARAVs3WEJ/v964EORHLTON2Thc12XIcXcvquRyYbHtvn9vkIr6ZA+SL5h44MSJkP+1
	zurBpdd0JyL+nOshCE4ATtPB5eZPLzp9nvD8k4AWQEmRZOsdAZjtCbjirN9tJ1KUPqcrAU1dQzbws
	DAYMy3UeYwcOejr1Vxddj62ZTqo4uO8zbKreX4SHw2VLAXw38Rf3J8RhD2u2J7Gd9SCFZ8GomlBvk
	HQ0g7XvVc/P78nUjJamoPZPKAhWnq5kPrFMchH5IwzVrWrFYuf98f1PHfp/boMN3aXC5rArmvM6tg
	xaXAMFmc96C3IzXCNgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOh-00000003zwm-1yBj;
	Sun, 21 Jun 2026 14:43:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOe-00000003zwA-2llc
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 14:43:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84236f9b638so1537149b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053020; x=1782657820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdV1fV0Fid/R2q9Vczf4SGtHhC3UkfiLS8XxvVVRGDM=;
        b=LPED0lbkK4MxjmeLLbBhT5G/E+42KGzhvRe67agOnj0Au/sMDhZrQ6Q/R1M8d3QGen
         c2uw6liiur6faVc3rT88jFmXSgaQzvUobacsV3wwqdScXIvKmFYdaqQ4FYgptSThPlMP
         iWKYdFvoU9s/SKUhgs1YCPvtwRHIhZLJBRxmmxJnSARGECFwBFpNYjQatw+yRoj2vnHt
         wKUEsWIRLujiWOSNiOTNic6kGAr49kdsc70hdq3A6YzRns7QTLQTrnULOFPXTBPrOnoX
         kMfk3G4KvGiWca14n+uNmcj3Yb6/eRhNYSoEqc9mkUhpAbYd0gMN1VmnMkrjL252bpct
         BUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053020; x=1782657820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdV1fV0Fid/R2q9Vczf4SGtHhC3UkfiLS8XxvVVRGDM=;
        b=cCU8U3C52aziK+VTe7gcYy1jh8Rlyex4RcJlMQif6MnzResL99xTY3k4u8NVW3fCLt
         iTAgfv3hi/IFczTOFPXiLLudZD/W4pbCKYi+0DPJhl7nqEOVZ/kLdEvYA3yafUs2NCgk
         aK2kqrZRVcspVLDze4bVtJRtiz3Wo1iCWV4BWALs/02zvmAchcZ5RTKNzJ/mxMOz7Hxy
         ChdCO18M6vvU7RCe51aL5/JMlvVBkAZnzub8qn6StJTJLvSjWpSeEnVdCuXUl1qaKc0G
         0t5B/pbqkw5Z/hoQCBetqp7cgxrTNo3Yp8enfebWp2yBLQFZO2U1IzEJcIniwR8cPyad
         0S+g==
X-Forwarded-Encrypted: i=1; AFNElJ/1rC6Hwu//BIdmuDeuSLBRy8bMfSkr+1oB531WfXMbvXINpuJdeEVbNYumVsd+fm9hlqPqTywoNx+4GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHaRHxuxV2G+cuo+f2veI/TrCKRe0BEcHh3loSExZ+p701xfVh
	tx2l2bwQtOXu2xgaGzcyFEp5zdzR46cHFsXk/PdgIwH33egIbhK7r2d7
X-Gm-Gg: AfdE7cl1z64ygftoJ6IUf0Q/Jl9FP+63BvXhC1W0BeSI1UphJNG1J7LI32aulf+5O1H
	YD7gj34f6Aa9b6E7F8P2Pg3S+du2r/Aq6Ag8dmjTRL16AiOiRX5xt/haa8MDxdUUs49MYLl4JCH
	6IzmZSNQYthQb9yDNL5MWh0JEA7is34deKqPLeD8UR6XS/TSaw3KW9P8BRsmWcTeJUKPd1LovnV
	iMpd3Eo5fAVpvKMxpFq/DAfTwTDBaquxrTwzzaqZ5KDNLxgJcYa0qTxfy7qAwCECmxGyMpP9OPO
	TQNOE6s22kqS7sHNjUUzdKbYQgBD0ZYs14TKe8XqCTivpSlk/BQ23WqHccwyuU/KASTPyjnqSwb
	EYV5O8EdWCWGwko+ld8PSmuXs+YmpvYzyyjs9517kUEEzfLjAAMAdTpKbkKxF8hW1ZEAVzgg4Rh
	XTry2XkfU6jSIBNsJzjehhwvlhaeZN
X-Received: by 2002:a05:6a00:1d97:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-845508a70c9mr10966516b3a.30.1782053019778;
        Sun, 21 Jun 2026 07:43:39 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7687csm4963254b3a.35.2026.06.21.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:43:39 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 3/3] riscv, bpf: Remove BPF exceptions from BPF CI denylist
Date: Sun, 21 Jun 2026 20:12:59 +0530
Message-ID: <20260621144259.288135-4-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621144259.288135-1-varunrmallya@gmail.com>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_074340_697748_910122F5 
X-CRM114-Status: UNSURE (   8.51  )
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

This patch removes BPF exceptions from riscv64 denylist on
BPF selftests since support for exceptions has been added now.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
index 4fc4dfdde293..9268351ce4c1 100644
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
@@ -1,3 +1,2 @@
 # riscv64 deny list for BPF CI and local vmtest
-exceptions					# JIT does not support exceptions
 tailcalls/tailcall_bpf2bpf*			# JIT does not support mixing bpf2bpf and tailcalls
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
