Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D741C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=weDnyjznNnHkFmDXJqUr+jAmLa8kKktvuUWZCzx8ogs=; b=cujemvN3IpNbrN
	GMreVj4qsaT9bFWThSPHc5RsEqzELD2bZbN15PLKDSH3FzT0ZUakfzfSi5LY44ysR9sosgdf0Mdjn
	SADt1HLdGFtYy+AgpxNTjuXwMrBh7Roy2kF+I085ghviP7F0+bSbdMRCF6dJ1+9XAttUNjVb9XnSr
	vn1XWr/TA8bdRqJxBz1HvV3KMzbIVTyHytA8VOJhBcfdzHyaD6Q3Mt0gHrem0xdcJcVzONKIszTSr
	zjUbc9mBJJ4WTLlbkgAQxlP9j/I29q9cjBzlcKaGPEKiNE1emAVYMoa9/V1mVSkUicYe/BJESiBmJ
	AfL2PhFzMqJM/ZSOO6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR5z-00000006Yq1-319o;
	Mon, 13 Jan 2025 20:31:35 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR5w-00000006Yoq-2COO
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 20:31:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so6004477a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 12:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1736800291; x=1737405091; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=b+AYZxgennZivsW6ScK7/g2cvE9zCdobO71AIEE/9xpCCQgE/B9j5ENC+WR+XKduSB
         tGCjSpWutUVf4hgalZMVzmnwztZgBRspsx+iMcmLUhEUt1ulWoyY3NOsrL/GJmAlZ2Y7
         fMRjAqdOEt5E4VHYYU1DIQiZDx8tbz61saOGr2ZC71RMQnd4e+ytpjMPPbJoD6+h8tbn
         gXb1pvRGMgGHTEXmNWxeQ3ITlrCt+HIZmCeN90xL5GNlwJWG1TPm8WbgbbnMgnaGuY+T
         q4rZ3IUVAmmNhxjGO1zjoTqcG6tr6tGjxWwaG8dJ/k2wv2bx8DnDLCBLuOW5GijWEJ+g
         OBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800291; x=1737405091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=uU8V/imH80PoYzHhzPzeDsqPJ3pIsNYJrAtIrwfpbB81d0kyTHANBt6lFkXfm09J3q
         ycUsiG2L9K6l0s0O9rejyTX353RvWzSrUf/8/BBEfVuN1SnTq3NGXXM82yp1K+C40ssd
         vxQIQti1jzcWgIhsaYzdANCKhCiJ8pEfVH9dYxJr1IgH96mQHCHbvua3WtmKons8gp5O
         qbVU7efcGpvfAW3Xl+mIemR6f5Agyp6Ti2Q9pufECd1r3WdW/DWH5R17iV3wLk/NdXBn
         PyqBpXqZAzchZlduEx1S05L9IiOa6sg5pAvTCK7GW36bs2yGDHg3X22dntY06x2RjRn1
         kh8A==
X-Gm-Message-State: AOJu0YwvlEHSBgbWLicQt8t87hOGKUREoXAzDRsmmP/cB+Bi6haRBAXe
	X6V76kdg8UE1SNbdl/NAz08qcW0Hv7fFjPr3BU+XgqOKSpAa641uJmQa3Y+iKFc=
X-Gm-Gg: ASbGncud7TgWejwOWpyvrGag18Ven+SmcihWIQWU56g0lrCkuyRDdnMKkTkMmf2N0h9
	RiKpzHm0HNzb3E2qlwNmTUgI9w7fdb2u2hoYKBFDwNsu6QkdFCUhYVT/9b9NLG7Zbd8LbxGhVAa
	X1klCOaAN5bMEW0LFQlcXIDX0635OJdW7nlBovtUlgTnmkledUm++uwiyBt9BKecI2hzy6Ac5oA
	4f4pYn8cgXxr1jGkl0rMmBCKq4dy9HV99XsxG4yHGIMGlwZQhqSS0CW8jWSrOOeJJumuxj9hmzH
	vT7h9RXRT13qWtC2
X-Google-Smtp-Source: AGHT+IFQnzVNSYDK2Ipv9ojWat3P1YUOAsFZ5wRMmF2E5BfK38xPBdomxpf2eBseMH/qh/uRMcoZGQ==
X-Received: by 2002:a17:90b:2b8b:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f548f761d7mr28582443a91.31.1736800291267;
        Mon, 13 Jan 2025 12:31:31 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm10514811a91.31.2025.01.13.12.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:31:30 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH RESEND 0/2] clk: thead: Fix TH1520 boot dependency on
 clk_ignore_unused
Date: Mon, 13 Jan 2025 12:31:23 -0800
Message-Id: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABt4hWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNz3ZIMQ1MjA93knOz4zPS8/KLU+NK80uLUFF1joySjFAOj1JRUYws
 loPaCotS0zAqw0dFKQa7Brn4uSrG1tQA/Fvx7cgAAAA==
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_123132_572086_55240863 
X-CRM114-Status: UNSURE (   7.67  )
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
