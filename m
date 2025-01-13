Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8367BC02184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MMSEUocTiLD2wY+z8F8C+DwxwSvY0lVbS2/GOabQ91g=; b=UNCYmMF17LMyT0
	/rqVd0P/eHu0MPCwr+MIOQddt9KwSjv/uzHVnCgp0B+FNzVb+GWxWGxeXG3zWCf7neLgZKzEZuAiQ
	jNht9srYqUqxCDiJ4PmoFpceBsONui81+NwoqQYTF6hHjrkPW+yMnURFGmS+E3dqOwRpDp6OOIn0f
	IisU2JlIrMfCP3xJm6ZD5O0KTOL46SpBs8a6KyjqRdtYvIFUh659GK8IOvkz6HQsYZneGrPd1INyl
	q4vLrKJpOReYgzJVmqnyj7d+qEU/a3//S8axb2OiOwE02vV2nsImFzEWkvITtox6LDEtRYK4MLynU
	wxBFR2ZGof+0Y/jy0Psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNZF-00000005ujC-2qb2;
	Mon, 13 Jan 2025 16:45:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNKu-00000005rbJ-1f08
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 16:30:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2161eb94cceso54834505ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 08:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736785842; x=1737390642; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTzFDsQHUin+/A6axFxcZaUiGXtBBo86vE+wIdzsuEc=;
        b=RVZI6dP1juWeBV9Q8QBXz7V6+YoJsz8fb+b9Zzr7DAWwMlrzo8cL6e8qf44sjppcHR
         gtlY3B4iNrUWqSJnoBjRY6r4wINYrr5L2c0QWEtbGH479ReBvkmjOo6RCW4JbIwzno4q
         1/rsGs+wr0AmG57bTiqMGcLF4b0y2Ruc/H5iIrw6ncJdtGVMLtfD26lglesWtbOrRW40
         t6M1HWoN1qpjcoPfNxy3fJTOvSsOh0xULUC2AZT/JJrEwD+UjcrRI/UynQ2w17yIe9aW
         svxYaN93zecackZsyvSIHOhNY3IOaSRo8YW+bH2yO+6k16GsflNOTKueWpTSH8wkD+qe
         LU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785842; x=1737390642;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTzFDsQHUin+/A6axFxcZaUiGXtBBo86vE+wIdzsuEc=;
        b=ZcrCVtOR/+zA2nMP+BSJKOILkWIEC5P/USlXV8lJgGGI+l+99lYPjksYzaZLzq7YDE
         ps0Wd0JEK4LbAoaJw4KZGfPaxX4f5dIwuta8bWy+eFmQ8iCBiIPBC2yWW4awdytLg0We
         eitexJ3YAw6+qnz9l3j9TnPfbSQNl/Yvl/HSHwHL8A9z+lEV1kt1aTfn6/6pxQMdYSTV
         zGhdE5E/31WI2LwKnLtTEhLcUDy/ke7Kh3FNEY3rtiAeEZBiLvbzLuaJJGsn1lVttky/
         xNHrLAz6L2pDtDfk7it5S+Oni/3zBGN00kTnDrAsBb5IYUCpr1E/WTVnGcGg+EJ3S0jQ
         P1LQ==
X-Gm-Message-State: AOJu0YzR+qlgbmiOVnz1OuHZO494E8Gs04DhYG8u0+hTWbYb4XqUO5TA
	hDOHJE1sfL/6IhU8S968H/YZ5t9/0Cb4gMlc0MKVUTgMEKkX3HuVXMK/0Ll0J5xDVbh0qCQ=
X-Gm-Gg: ASbGnctlkKwxfyMVuwG1HONk9UyihrSGHW7KXkLGXjoJwhriqLWQwXGAWdk5tUKHdmp
	Q69KdI479xmDxK/gUuu8Um2VZU+c44I41/SMf8qeRl91jd+2+tJpsL4h68e8sa4LZSSgD2b+Erg
	jlPnflFxs8zJqMbNbaTYvGEqn/2txcPPIdhO3xwdUIPD0dKzZlRZMbwejIy3OQM+Shqn++r7tXs
	th/FCZkD1Dw7eJ/PPaet8sNCrE1wFKDJP24ahw6yxphWJPY
X-Google-Smtp-Source: AGHT+IFhVoNdw8wuVQOZU1U9esePqqq4zOjWrm3eULiuawqiNHS+N4Bi5ybSRXC5R2tTHhc+R/q/Cw==
X-Received: by 2002:a05:6a00:66cb:b0:724:5815:62c1 with SMTP id d2e1a72fcca58-72d22048b6fmr29376724b3a.19.1736785842122;
        Mon, 13 Jan 2025 08:30:42 -0800 (PST)
Received: from [198.18.0.23] ([2401:b60:25::97b9:8ec4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047e79sm7075489a12.53.2025.01.13.08.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 08:30:41 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 14 Jan 2025 00:30:20 +0800
Subject: [PATCH] riscv: remove redundant CMDLINE_FORCE check
MIME-Version: 1.0
Message-Id: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJs/hWcC/22MQQ6CMBBFr0JmbU1nLKCuvIdxAdMWJlEwrTYaw
 t0trEx0+X7+exNEF8RFOBYTBJckyjhkwE0B3DdD55TYzECaSo24U8G1z8EqKq2pDoxsbAn5fA/
 Oy2sNnS+Ze4mPMbzXbsJl/UkkVKg0M2rfWG90fepujVy3PN5gSST6r1HWqpY8V5b2pjbf2jzPH
 +rrvyLTAAAA
X-Change-ID: 20250113-rebund-25d469c1c4d5
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736785838; l=986;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=C8W7YfQErHbf98SS3XhJkt6Jty4PK97d6HshqEmSIuc=;
 b=i885COunQq4KEIy3ZrlaRSlLkoLMd8syApBMNPYp/SMeNqjakoru5qSMzzng/eIS7ENMWv01O
 H65WRs+Lh7FAB4Q1cE8x73b833y9FiiQhQfMBDCfIdFtyxKDScn02jy
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_083044_436203_E1B23588 
X-CRM114-Status: UNSURE (   7.63  )
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

Drop redundant CMDLINE_FORCE check as it's already done in
function early_init_dt_scan_chosen().

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
---
 arch/riscv/kernel/setup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 45010e71df86ce40f99fabf03103a49ad1041f3d..a08a8409aab01d504d3ad975fbf9c66c02992713 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -237,11 +237,6 @@ static void __init parse_dtb(void)
 	} else {
 		pr_err("No DTB passed to the kernel\n");
 	}
-
-#ifdef CONFIG_CMDLINE_FORCE
-	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
-#endif
 }
 
 #if defined(CONFIG_RISCV_COMBO_SPINLOCKS)

---
base-commit: fa47906ff358a5865b7be2356a5a1d1e58dd17d8
change-id: 20250113-rebund-25d469c1c4d5

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
