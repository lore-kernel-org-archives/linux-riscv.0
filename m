Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F25C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBTZJuUIIjngH+ae/XoVB18etLlog5e1dYRVy0FYDAs=; b=J2EVPMUb01lpiH
	ux7TgwT0d1B6kT/ezgQueb7NGooBMudC616KhAKPlrPY6CIdH69CSFSN6w4K2gu0BQTpv7jIIk8Vk
	uK/Vf3tQixbH2eHWu11kndQ5DXT4OpQuPgbcnGDjynO+nDMmUOE+NH+3ds+C5xcaKtmdLhRxOjRES
	k1LA7Uogox+yecWFHq0jmTHkDCHptLu/5+cDjFz8HKlSuFixkGXkIdwXQ3mdywSjJLZGgOn+5UHm3
	IhgD5VWOQBeGqY9pq97DvGrb4vZ443WwyCcLL7s3ddVhtWCuoskPqutkxLS+8bqdJoxCqzk4k7PGD
	0oNQaMkpJQhkmPGR0ebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR60-00000006Yq5-13px;
	Mon, 13 Jan 2025 20:31:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR5x-00000006Yp6-0iDc
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 20:31:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2165448243fso99912245ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1736800292; x=1737405092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=TBhvDI6S+9YW4uYa3WiGXokfSzCZ9wWvrxVQCl/O6UrJIr5YZpc4uFl+C3d1a92+gK
         Zei9pYEf/G0EZ5SpCWfRqGzX3MeMdexDl5I4qigsjlsCq48fYUNYBrZQsCQdA0GRN0p9
         Xqu5Om2X3hjnU0OxScR1kvvhib0Njimq0S8/ba0Do3gkYuF1P4r1CinNzrSBAgccNPux
         pgZ6qoJXMH7fP8CW9XLqbkL405Y9ILAk4h+e7GyuNT55iL4JkwdDMZLjwhq1nEWa4H4C
         xDkLjVIJVSzxgDt+n2goEDRxZsRo9BCrxhRB92NMEdZaykNNzJVlFVrErcmE+h1RPSTU
         hG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800292; x=1737405092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=UMymn9XEA17CT3MincLRLZAeAK8+ytpKaZfDO6JAxOJSDwuIPu6Q28NAPEq/fD3abs
         qzUVUxOQIe5Xx1LE4I7igM+q9Px5I+bB4u82RhAV7LDvKuFnx9Kwp20iuEIQSwQ39lUp
         PwFoi4dA1dex2MteGbuWgy9vC2eejl9oY2j4O/RrOnExmA9Mp8gfseKFXBo1dad6dBgL
         XNK8/8CS+iTJ91Yg8Kq2KUkFPG6nz6w9whm/q6SSMJCLXLG8cvbWmr/wmrZPZh8YuOOc
         Pe3+JH+bupJOiXkYLUuDlTRcqo2OfffOiNkAxSO81raKR6gn93u1UreLmB9qy/T5ayL4
         WUYQ==
X-Gm-Message-State: AOJu0Yx9aF8GGSt+vJ6JXfH24Li4n0LFqGXhCqK/IMCK0Gh8fc27mR0i
	FKlolGRgCW1xORYHFCB8o4Gv8AEIrFXdkLLrYfhsPV5i/svZK8XboUjzH7KU55c=
X-Gm-Gg: ASbGncvRd9usZjuRezCkox5facABXQcktpBs+2nXwCkhgD/STmOhp1JfDbWa15vjKJ/
	1CJFWj/0etdZWQB48U5sVaNkQjMdxpJ3Xghw5r44xEoNO2uwhwgtiswjxOznhlqoReWEAnplzCv
	dhBYKTgiOfVa7yHMRvZHmHUTtarwDsp73qVZVprmRNvsNMGx385/WZ/nSjepNbZtE5C7F+YOuBF
	UxAEoSruaTk3Dwtz6y7/K+kFAB4l+ExVInWxl9BjbaKPpf1ABQo6aFYsE4ZGvTWcOig4YpyeDIo
	L+gM+HAubk90Sg7m
X-Google-Smtp-Source: AGHT+IG/tMMpscU7gZH1eJnJup56GCo1pHZUlOei13gOxP0UsZsm2CL6bABRUnZN9TpfjVCLNXKKsw==
X-Received: by 2002:a17:90b:2dc6:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2f548e9f9ecmr29485858a91.5.1736800292356;
        Mon, 13 Jan 2025 12:31:32 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm10514811a91.31.2025.01.13.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:31:32 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 13 Jan 2025 12:31:24 -0800
Subject: [PATCH RESEND 1/2] clk: thead: Fix clk gate registration to pass
 flags
MIME-Version: 1.0
Message-Id: <20250113-th1520-clk_ignore_unused-v1-1-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_123133_209354_9B2900FC 
X-CRM114-Status: GOOD (  10.90  )
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

Modify the call to devm_clk_hw_register_gate_parent_data() to actually
pass the clk flags from hw.init instead of just 0. This is necessary to
allow individual clk gates to specify their own clk flags.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 1015fab95251..c95b6e26ca53 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -1048,7 +1048,8 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		hw = devm_clk_hw_register_gate_parent_data(dev,
 							   cg->common.hw.init->name,
 							   cg->common.hw.init->parent_data,
-							   0, base + cg->common.cfg0,
+							   cg->common.hw.init->flags,
+							   base + cg->common.cfg0,
 							   ffs(cg->enable) - 1, 0, NULL);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
