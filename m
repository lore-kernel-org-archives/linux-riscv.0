Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7068EE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1L0RJKNmHjTwsFnBcp6cwLjujkn8ANf6jITKfN91hI=; b=Gi4fdgctE4V7L8
	S9EnwLM+I2lTeM2w3VlbjEH1/AGysPi4LtlmnfBD4Z4i2F8VNr5wMYCXIX+ShIURAu2pIQ11FTolJ
	pn+9KlISEN+gC3PDVn4GuaTQw+9g6ntF0EoGNw3xcTXKgG1D5K5nqvQZ6sEw+qXGZ7jfdVtRgQFUD
	qFC+Q9nnCGZ6Cv6loHbfNbPP1ld6E/CLp/ThOvn/FQruukpKXPLgh3sK8/3bDQspRl1WMOHmLPSgk
	Zc1aPEX0Ly6d2BDlWPBprEvLG1xz0ou60tPP/0mUymmWmZxnZVdlCWnu6vNqmlN1dob0xCQOhWDlD
	G6k5WQzxv96Hw/NNRVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Q0-0000000BoBr-1aet;
	Tue, 10 Dec 2024 14:40:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL19m-0000000BkA1-2b8m
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 14:24:11 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso2081287a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 06:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733840649; x=1734445449; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5cyw5f/C2V37Mp3ln9xoUKSHP1fOBqKDeQ6bS/ukoVw=;
        b=Dq5Vn706TDH1XURtG3HyBy4xbGcLp7HUjr89p8hfJyys/XgEWaJa3zlxKhHArqEmOH
         2E2POdfM4wT56bPu57t7HFMr3JpeHd36nL8S7oOK8r6QofyJ6riDxHSPmop9H6xMUf+p
         P9fiBbwbMm6m8J9v7hyX9oVleCGI4ODfwKpDHqgAU2SgYzaZ8Szc/pTpb8g4/7MVJCqX
         zTkyX+1SXjyHZeVieDWppuykCepiP1Ca5e+KFSabOO44EyAa2A3xwdshgWp2S4GQwIya
         H9YxV5i4BCRG0Gvbw+NdhtFRw3rbYFsVmjOaH5Dv6WPulLiQ4bDF3KG82g9qPQGU91zZ
         wGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840649; x=1734445449;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cyw5f/C2V37Mp3ln9xoUKSHP1fOBqKDeQ6bS/ukoVw=;
        b=QHvMifTHlnKO9awuh3jaaIxsjF2vQcdmH7qsRg+RpYJE/WxmIKKxT0O9mNjxIkwFj3
         EkLUKjD+cHKcwUPa2vaPD65cUNjc++ozfHnUW2fyKD4gPD0l3Ep1rF/UDcPr5If9Elr3
         j2YoOKCChyauaZ0zauAL9M/Ant5RS7KMuL+OpC5jfoDjmtt8JChD6tMWbz6jBb8BetzM
         KSIK1ii80E2OIwCyEzBrt2vcNum+a4/yLA1kESHl2+yByhWqihavQ7M0NX8L8SaWcz3w
         y1ANJsIYd3uFHipYX0trvCu+0hbNTVuBuhLSEHF2YtutWiuotOkgaulbapVVA5wJTnzb
         oU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0EISnOJP6BlQBkVSAoc4z6yvjYcwPjAte8mLgQCkkzcU1naNJpBWUym9kNr/jX5ZrYBBFM7Y5T224og==@lists.infradead.org
X-Gm-Message-State: AOJu0YyETDNXpRiA1JZQZWs90FWiZ61UMsL/IBimPNWNps7vltSX4I/T
	3leiLg2n+E/wopD3pZCUsaFXGa71t/xKOsnz/9LUKOvt+3Boa2GnQA2TocfnD/Q=
X-Gm-Gg: ASbGncsYn98EU7Uf5PfK+KFg6hPMVF5JxUNjMabQTf/sTSPnzEFeBWnCPiln0V+9gWy
	7dsWVfej7aRgWjfDCFxck8Mu3U7NLfFLTu94wAYydrE+qATH/eHlDfk0bdTK/0uiCLQt70ceI+P
	/aO7sKRtIOaBmP1EHXA/kTANbMn/YmUQVT86dc+AwQtmRqHC6fLTTUtoSA27gziiPGlK0TNoP1A
	GIZ3443qLZ5oQDZ3AGh7wZgAGyli3H0Z6CbND7+UfwJYgvu6tvGwlpZNox7xXaZer/g9TjbmsBq
	nGPC6/CR
X-Google-Smtp-Source: AGHT+IF/eLNCS1WvrJyj5WY1drdW6oiQGMzfyH0Ke6hYhFaWTOwYF6DioSEMu//To8sMbC82xu9nsA==
X-Received: by 2002:a17:90b:5205:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-2ef69fffa68mr29462379a91.12.1733840649478;
        Tue, 10 Dec 2024 06:24:09 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef7315fd3asm7538444a91.44.2024.12.10.06.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:24:09 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andybnac@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Zhongqiu Han <quic_zhonhan@quicinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] riscv: signal: fix signal frame size
Date: Tue, 10 Dec 2024 22:23:49 +0800
Message-Id: <20241210142353.6457-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241210142353.6457-1-yongxuan.wang@sifive.com>
References: <20241210142353.6457-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_062410_657648_FCB384C1 
X-CRM114-Status: UNSURE (   7.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The signal context of certain RISC-V extensions will be appended after
struct __riscv_extra_ext_header, which already includes an empty context
header. Therefore, there is no need to preserve a separate hdr for the
END of signal context.

Fixes: 8ee0b41898fa ("riscv: signal: Add sigcontext save/restore for vector")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/signal.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index dcd282419456..c3c517b9eee5 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -215,12 +215,6 @@ static size_t get_rt_frame_size(bool cal_all)
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
-	/*
-	 * Preserved a __riscv_ctx_hdr for END signal context header if an
-	 * extension uses __riscv_extra_ext_header
-	 */
-	if (total_context_size)
-		total_context_size += sizeof(struct __riscv_ctx_hdr);
 
 	frame_size += total_context_size;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
