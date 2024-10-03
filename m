Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A688CF8552
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 02:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JX8BUPAb8ZANGVirAhZV3x1r6ZVo42KwFrysV8W2r+8=; b=3qYVEHcsALsOOW
	+eH0RyNFmqwtjvHnpA1/kqk5ZT6DC9C+pAinxCknwYqZWKT78lGKZvlWMyYgVGpzC3mHkri3941yB
	swjlg1cj5nAKirEm72+IIiL9FGvlQQeqs8TQ6ZO4jy0WLGgBcPQThGb9GOKn1aB8hQPhRVpHnmVGA
	XD+2vOsnhHIS4u2mhiVWYwpUc9Sh8I1pF50/WAbrJ7KXpf/9FG1bK7B/Ag7W8xMM8Fxubw1B0bRGf
	hohJlfpWLoDSMBAxj9pIgD8JfUQoS1sDlMo1a72pbxVzm1ve+wEOALVaSS2sh+4iZ+C6llmx9q1sP
	kzUE6BBhDoNajNoSKo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swBf3-000000080KI-33kG;
	Thu, 03 Oct 2024 02:33:49 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swBf0-000000080Jy-2YBV
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 02:33:47 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-2e0b02ed295so43129a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 19:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727922825; x=1728527625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYOhOaNZnjAn4zMumq/IMa/aCdY1Da9KJs3RHuJCp/s=;
        b=kTu4vMgdHd15cyC8P56f8gypFcDl4pY97T4YqI4kdm3f6c+2MGBJ+//syVCnmWdzXC
         YC2sMlAFo1yRv6cuuxCurhrml0hUhSN00Iek9PWWBuo4bgGzn2priISaHTiqsQr5Vhtn
         Hn7FZZBL3fJ3ff/FdNfzHUPhPaVnOCGsowAyOcrong6OV7TZazTCbOGDVd/nYmaSQQ5m
         n2IaGR6E2BUw9KpMGy77uuv1Oi/GJXAnSvYQ/t7WnKpfhDBmtHuRSJie7FeCAmQ2t0Wy
         IphN2qWDjaKTBOSYztTa/73Prvr6KnTHb0BK987ZpHV+0nvt8d2wpTZd32pFFokoR3TN
         nX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727922825; x=1728527625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYOhOaNZnjAn4zMumq/IMa/aCdY1Da9KJs3RHuJCp/s=;
        b=cfMcumo64XBekCnP1sH9OXy8lPH5M2//zm2ajfouvT5FsfdkG1C85G0WuHP/UElL/l
         SAGWPnSnhPjgQj8b9ORNkarYSa6HpZJwz+yJo5LDJul+v04CoA9NKDRsTVzxexQ9RGzd
         Dk6iks4UcFv7q5n6EWP4Irx7q8Jv7EXd6Ucb8BnpODsIIvdNHRwAr31Ea5picxC91Ql2
         6KZyTbqfwYWX6nwTFicH0yWAynMjymCOSvvBpiWawrcecRT5Avj1XgMkuR8nfT2sW576
         Tyes547npy6A/hJ1eCi0a+w6cxdzgtksC5YA7OdTEBJRBtV3y/+wzHJDQQNSjUR7NvIK
         Jr1g==
X-Gm-Message-State: AOJu0Yy991C5aCqRsrqc3igyBAqvcZLpZQ7FmeRTOioElMgOwP79hZZ6
	RPFE6Gl1lBD9P7CU7jUzhe7wm1YkrOmauNFS/0/Ib3u/ncDJV/Sh
X-Google-Smtp-Source: AGHT+IGYxkNOKFaghUlztt39c4/ZdNDHNPlas4VMOl/JXBrzfhjZirZfZNwFdvwyoYrQsXcGP1OMcg==
X-Received: by 2002:a17:90a:8c3:b0:2d8:9f4e:1c3d with SMTP id 98e67ed59e1d1-2e1848d7d29mr2540150a91.5.1727922825253;
        Wed, 02 Oct 2024 19:33:45 -0700 (PDT)
Received: from user.. ([206.237.119.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1bfb1787asm275548a91.21.2024.10.02.19.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:33:44 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: drew@pdp7.com,
	guoren@kernel.org,
	wefu@redhat.com,
	linus.walleij@linaro.org
Cc: linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH] pinctrl: fix Null pointer dereference
Date: Thu,  3 Oct 2024 10:33:07 +0800
Message-Id: <20241003023307.2138695-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_193346_748696_17E3C46F 
X-CRM114-Status: UNSURE (   8.53  )
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

pinmux_generic_get_function may returns NULL, and its retval is
dereferenced without check, which will cause a null pointer dereference.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 1bb78b212fd5..9331f4462480 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -798,6 +798,8 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
 
+	if (!func)
+		return -EINVAL;
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
 				 (uintptr_t)func->data);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
