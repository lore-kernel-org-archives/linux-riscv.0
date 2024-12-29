Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED18E7718F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 07:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=weDnyjznNnHkFmDXJqUr+jAmLa8kKktvuUWZCzx8ogs=; b=sgNFV0ul5douGq
	uW/7yK7PL5VYPw9gRFQ0HpciFvl7Rex9/6CzNIL48lKoMQ1JbFR00Gj2srVWpM9FWyjgNy1AdZKF9
	iQlncaZtT0ILRn7KtisLCza46f1xixlqUFdblo2uB3Lh4SeytqoG6dj8qGkU4vcf9cNDb+nK4lYHL
	dPeDBPGPuNAbWRS4kTjjtyQbamzefCzb0Xw7oNdsA1twDt/U9F0dLfJV9nWCxIaS6ptE/SJTkZXFl
	Hng/pcszrUgT+dtR4Fsv3sltiwKzNgNz+YRPwyCDQ5EzGHE4wQM9kcrbTwdRZBXKvhkCx1R6IKMkS
	eUXEbC0T5QlL23q6vyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRo1e-000000034HS-29xm;
	Sun, 29 Dec 2024 07:47:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRo1b-000000034GM-1aMz
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 07:47:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21636268e43so3744515ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Dec 2024 23:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735458466; x=1736063266; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=VObzsPD8sNj4gxfI3mj4iQhjTdjiGdBjtkahszNE0aUT93VtRA6M/M1gYTzYyC+jUY
         6hhsgFtYAY95U3gLZcLvidxZIQsHLz79sle4YWECb3lTqWtv79I+lUbCw4NtpeCTeBUJ
         NnEmD/PhZRV6tfQxcdczTh+EdnaHsG6886bGFNGm1TKJt6yZVd0IAmJJgJhban3XQGXn
         yg7gYz1e3uipOJNIqpwcxOsT23iZ2a8w4BIj//9VoX29gxWrw3dr14Vx5UHgAwy4rkH/
         YtsRAPyBIQWJnlZ0uTN1XlQScsSeybLiSe29he7Q9Nc+jKFraNY3wAizJAtjuR1z6qzx
         KP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735458466; x=1736063266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=b0wnpb9KyKuP4n4rTH68USBy8wqXw7T2yGGOsZbP/qkPFWof/WB4JdkUi2XV2xzN7b
         Hx/9SUEqZV8DNF7s1p3XbcOOxb9Hfhfckku7dKiRi6IG138KNi4D3G6xHDSJr/mxgpOL
         Urp7RkNIzbEQyqkhdYuT4Vo4rHNIOlF+c+Ntdyswr+nePQf6zHlZOTRK7xh8ZMUOjjTO
         UK+49jBykwVKIEdE8ZMPyRPf6hktPrVEGoy6t+H7WoEfALrNs8AL9tpxlxKoY4R690xQ
         5YGpU9t/LLtn5vqbRttReT1yfWYzEcxN+1EeYiyaZoEtnBV4dZtdfK9LbXHs0+AVOh7G
         auKw==
X-Gm-Message-State: AOJu0YxDWKjpnTLcUUOxtd6KsoH8xjgT9cmdwdO7yoS4XgWgj+4huYjH
	ubk4bQGTtvOAkLQF2dpJiHaHAf8RXVqzkmvCanI2EicZwOPMVU55A5BwAuRjlYg=
X-Gm-Gg: ASbGncvFrrJBEyh9Pp7V4l3FF/g/cMmtPWRQ9g2CWi/SWPqUDsH7sVXICRsvTiW251q
	d55hy1DaLPLYQomXgN5l5gu3bWue5DE7h02X4UBxbvdAcJdEE/2zBhMM41AaqfsaeP97X94Ckk7
	rsEmexuEkZvaSdCSVOmiEsNRNZSXsIGMk5+ezT/7akSOXC6sXp1pe4XK8SIvxTDFkcz8dzQkvmS
	Xc/EiSntjb504ljlhOgkr2n7dgKHrT1SZF03Z7gHrerfgo0egZbU50XD1ZLawRibk1vZ9OulFoe
	l+R7Nmwk09qBJ+Ar
X-Google-Smtp-Source: AGHT+IHZCj/ACqW2WfzN/wft9ZZi8fRsQZhVpP6fToFg+f4nX2yo6cXGFsTfeAx837weIf2C820g7A==
X-Received: by 2002:a05:6a00:44ce:b0:725:e444:2505 with SMTP id d2e1a72fcca58-72abdd4f4admr46957360b3a.4.1735458466063;
        Sat, 28 Dec 2024 23:47:46 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb196c04sm7907658b3a.150.2024.12.28.23.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 23:47:45 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH 0/2] clk: thead: Fix TH1520 boot dependency on
 clk_ignore_unused
Date: Sat, 28 Dec 2024 23:47:41 -0800
Message-Id: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ3+cGcC/x3MQQqDMBBG4avIrA0kk4qlVykS1Pzq0BJLoiIE7
 27o8lu8lykhChK9qkwRhyRZQ4GpKxqXPsxQ4ouJNT8Mc6u2xTSs1fj9OJnDGuH2sCd4ZXlgrxk
 e9kkl/0VMcv7X7+66biIdBChqAAAA
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_234747_448054_295C04CF 
X-CRM114-Status: UNSURE (   6.93  )
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

Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
perisys_apb2_hclk and perisys_apb3_hclk. Without this flag, the boot
hangs after "clk: Disabling unused clocks" unless clk_ignore_unused
is in the kernel cmdline.

In order to allow individual clk gates to specify their own flags,
the call to devm_clk_hw_register_gate_parent_data() is changeed to
actually pass the clk flags instead of just 0.

This series is based on linux-next.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (2):
      clk: thead: Fix clk gate registration to pass flags
      clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot

 drivers/clk/thead/clk-th1520-ap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241227-th1520-clk_ignore_unused-32b2d02ede38

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
