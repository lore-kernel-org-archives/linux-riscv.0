Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 20:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7zOFbwWtRhHZXmmV9QIN0QxfU19d1Feoqhufv42QX3k=; b=KoFr92Yoj+wqSO
	aumIHwb4A+vsogxKEgyHbUJvzEUYKEtzHHXNCUWBcqulw0rRSi5WXCWdOXzXyw7ffnOunQQmO7Gri
	yd3JEPNiJ4EqnkbcX78uC7ELvIXJBeqE5NGlt9h1dPGVKO4ozt/20izJnTUFJcAOlOkH35z/qA/iW
	jf1eBeQ02i+GMbYVxAv4U56lzZqYk35IhKI8hZ/fvCNZLWERtD+Uacf2MfUrY4AAWhZTSVOGURhUN
	sAqHRw8PF9ZLN+vnKibAt3CSITtw+A6GTpUuO0IlLM5nYCNUQDDnQ1sl43xGAh1shkA1ygopVAYrl
	yXPgGz/D8As/5CN8BgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxDqz-000JOu-Op; Mon, 21 Nov 2022 20:57:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxDqw-000JO9-Fw
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 20:57:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id io19so11682968plb.8
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 12:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=a+8s62R9vB+JzHkkOoet6Cx6GWbxqA3eYfIMwlFnB9o=;
        b=fniv4c5WvNO/fe0wN9wrXEKEfDwyhJUrFdsvKJuO4y8MLgjdPfrmtbqzVu9910adRx
         JhWCrZzOw5Y4TMTcRNRUMinuR1pTJc07Ab2uIsBTenDVRwIWcSufF0FviArIpiMuWU+P
         IPtgSPdMeOKp463RZepfWc5GcgnQ1IXwCnXW25wm8eXMbmVuzAGpXvLVDLRyyao1O19g
         TSpEVqACWSznUcJxTOOQQB2Hl65J4fAhUqLmy4Dld6xq7YGsBTKCXVwuBv4u7AMIz7/t
         DTzDtC7BTLu1NCSJNGzUlPFc5UqYceYH3rDOtzavepUkuWizF7c6H8sq7yXjv7CjjjEH
         Xoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+8s62R9vB+JzHkkOoet6Cx6GWbxqA3eYfIMwlFnB9o=;
        b=m6dQdyJ1NNt06CpxOjmkf+LhIg67lxY9NyT0qja54MyKDRZ4qNkOMiQeUQ7pN3LeeJ
         xjmxpWoepnxkKU9YbtlYynpaQlvf7nL34iyOOz9BQhJwev3Uslttg484iYaW2wgDmXkV
         hBNH2mGh2cIM1L5crGmhZtQjlv9QoXQ7sMy2feRbBipgzozu0JAfb5LBLxxdnSfubf1P
         9g3JwM/dFnBis/qowvMUJl2QzXtVQdEzh0Vgc/jsVFsNcTFYv5VBzfgVif8Ku98uiiDw
         3oZPmRyfIzcznnXpaYoLZe/XvfvC6T2sXZnaDyG2KGZLchpP0BI9aQAFFy4iJenRpUPB
         u4oQ==
X-Gm-Message-State: ANoB5pl+E3HIJ5MYskEp+4G4MUlFBXiDMX737MsOA8Mv0Df5r8JfNxX+
	4PWUbBGKebwdw1bzEV4Pg16/qw==
X-Google-Smtp-Source: AA0mqf5sAA/E/U6YfTqD7f0WABcznW3d/e4KdkkWOwum97uDCHlLJhlE8SujKPDevUBcC4tY/ckbTA==
X-Received: by 2002:a17:90b:3c0d:b0:20d:478a:9d75 with SMTP id pb13-20020a17090b3c0d00b0020d478a9d75mr28239558pjb.149.1669064236510;
        Mon, 21 Nov 2022 12:57:16 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902650a00b0016d773aae60sm4937091plk.19.2022.11.21.12.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:57:16 -0800 (PST)
Subject: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Date: Mon, 21 Nov 2022 12:56:47 -0800
Message-Id: <20221121205647.23343-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: anup@brainfault.org, rafael@kernel.org, daniel.lezcano@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
  linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_125718_738118_A99D283E 
X-CRM114-Status: GOOD (  11.02  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As per [1], whether or not the core can wake up from non-retentive
suspend is a platform-specific detail.  We don't have any way to encode
that, so just stop using them until we've sorted that out.

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
Events are stopped during CPU suspend"), which fixes suspend on the D1
but breaks timers everywhere.
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 05fe2902df9a..9d1063a54495 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
 	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
 	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
 		return false;
+
+	/*
+	 * Whether or not RISC-V systems deliver interrupts to harts in a
+	 * non-retentive suspend state is a platform-specific detail.  This can
+	 * leave the hart unable to wake up, so just mark these states as
+	 * unsupported until we have a mechanism to expose these
+	 * platform-specific details to Linux.
+	 */
+	if (state & SBI_HSM_SUSP_NON_RET_BIT)
+		return false;
+
 	return true;
 }
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
