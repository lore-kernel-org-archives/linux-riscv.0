Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9531EC636D7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+kR9CWwQBpSRlgVh2fqR//zOB6tTcosjxynW3gGgYc=; b=dvLzBDUkvM5W7v
	RQ1qN9gBroq2I0LNO4VEv2WyeUVDDvshHARA/EFzCxWNoMy4dwLfolO+fS2DwMiVanDoZSEb/e6tx
	AnW/p5TXTr9RQEjV+xWyfn4dSPDCcnqkn6IW8R+3f1AcqooTTJ9M9CUjqmnQAKHUeFjDRDpA4WnDV
	KuvaQ97FB7NQ8Pmm7MoQN0+CMh66/bu6VhIujG6LGOnLKP3umDWKaZi7dxq6O20zjUtvocuMxApIk
	TCQ/DA7rqGggQhXTyQPdq9viS/GJVqfwEhdrZll5cyIyO16Rl7XmM+Qro2uJxHdFlJ9Da0J38elBB
	VnHDb0+sx6Jd2SN79ERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqw-00D9J2-D6; Mon, 13 Feb 2023 04:54:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqq-00D9GY-EP
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id e17so3444391plg.12
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDt2xtowm1vGovkYD2IOPyMg5XU+WITSemeLQt38+wk=;
        b=GCKt9FdzGzyUdkocjCliMYjgCOa0QLOjiBhttAdZOxargwxJw4vxLJDmHp57SYMfvU
         df4SL6t3EB6DwCr+yMREIqZPNA8lH1KY/NmjCtwPh7RiF2sS7CiZ+NVMmais/oNJuTRH
         oG9Xrug0dghHSuhHhbgxN9qJXDUVlSZvObtB30dIISrsnoeeYB0xZZ+8gPVYP3YKnZCO
         dt88KRAfl30IBpKYZCytTsdN/Ze3ePYzwWGTvqiW7lM1M2AfAWANpaxMxFedjYeFVoMB
         HvpyZQbKyRm57FGGHC2NuTZLmtqE8+b7eRudJLnJAgLJFszO3O7vTBEFeEwvQCyU/ukk
         guYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDt2xtowm1vGovkYD2IOPyMg5XU+WITSemeLQt38+wk=;
        b=JGoxJ7bSbFLBqlNyLYJID+q3WfsvPRf5/1ySj85Js9+4sFJhsImgUCoyu7/9iAXer/
         Xc0l5IvsyyJfoem1uF0NRrUeRxS8njUBtUFqLqYYju+DUCgPESh4O7Wf3mOCJu6pjX6Q
         dwxxZKGDgZgiN8Yf0lB20Of7GK/E7/0oeSeAu7HGQiS1biVy7WJs5baJigV2yM2NNY5M
         v/22t1KpWjeQaYX62dbFOySXyx8sUNm5dBBRgt5YxXQQuLN4+rmTB6LHQyeQ6sm/PuKs
         GP38RIChDYXytT6LSiPGBBoNYh+8jphMjhz2+UlgfLf8+SKWyMBAm/2tif4DUqrZ6tA2
         KmxQ==
X-Gm-Message-State: AO0yUKUZWhe3TNdKHsIKkZGGEnY0Ugy0K3XFPjDM6FbQQ9aZfG7Q8frK
	t288Pp0+VYw6ul7jNDQ1pjoFdQ==
X-Google-Smtp-Source: AK7set9Y52bDpNDCM5e4MJvhFWuMbirMIwWV6jFT56ImTqva5KruRhYx1rh/voDp7RXfFbY6juKL1A==
X-Received: by 2002:a17:902:f809:b0:199:e58a:61c2 with SMTP id ix9-20020a170902f80900b00199e58a61c2mr13328153plb.29.1676264043302;
        Sun, 12 Feb 2023 20:54:03 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:02 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 01/20] sslp stubs: shadow stack and landing pad stubs
Date: Sun, 12 Feb 2023 20:53:30 -0800
Message-Id: <20230213045351.3945824-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205404_502084_3AD918F5 
X-CRM114-Status: UNSURE (   7.16  )
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

In absence of shadow stack config and landing pad instr config, stubs are
needed to indicate whether shadow stack & landing pad instr is supported.

In absence of config, these stubs return false (indicating no support)
In presence of config, an extern declaration is added and arch specific
implementation can choose to implement detection.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/processor.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/processor.h b/include/linux/processor.h
index dc78bdc7079a..228aa95a7cd7 100644
--- a/include/linux/processor.h
+++ b/include/linux/processor.h
@@ -59,4 +59,21 @@ do {								\
 
 #endif
 
+#ifndef CONFIG_USER_SHADOW_STACK
+static inline bool arch_supports_shadow_stack(void)
+{
+	return false;
+}
+#else
+extern bool arch_supports_shadow_stack(void);
+#endif
+
+#ifndef CONFIG_USER_INDIRECT_BR_LP
+static inline bool arch_supports_indirect_br_lp_instr(void)
+{
+	return false;
+}
+#else
+extern bool arch_supports_indirect_br_lp_instr(void);
+#endif
 #endif /* _LINUX_PROCESSOR_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
