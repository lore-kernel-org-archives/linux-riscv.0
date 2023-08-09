Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443BDC04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DEUAbW5pP9v5NDwipanrUUtitWUobtsbUxCYQYQACrI=; b=mjyIJivN/qE00P
	f+ZJJ0CgyDAg2yl/jWVaIz9AwM5LOra8JG2rqhmPB/ELW8ulqAbW9jeByPn8Eh7myEfXUz3i6ZT2S
	z58NR8lGd+arxz0NMCPHiBsFLmI3WshJIweFBGHCv4n3f4LK9BnFhCMKVIB9qti5KkKXm1OjzQg9M
	/IAyFmE4Ub/KN5xRpxsguenekWb4gCuLCz1HAh4p2EaD45GKWTmIYAed1KD8UtuAnkbA7XlS/QD7B
	pBd3yvpTml5uXJN/A0Ip/fmUUmEwBqGJqK4n8pC+oFaQB4uYj3/KxXvMGwLFKuNxGFMM4S6QZi/8V
	/G8lbRZRVBBvBxN5/B+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjah-00557K-1K;
	Wed, 09 Aug 2023 13:51:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjad-00555T-1l
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 13:51:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68730bafa6bso670046b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691589064; x=1692193864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XZSZbnMxGCAQaiOpSsvGGxA9SQHJTADmzlPQy3XEacw=;
        b=gRYaeUtIwG7Vsj6K1gs1mw8g0NKm027QxgPMpJN3XS83Of3CN0gDtXTRiqfP2LUnTS
         MpezfI1H7RLZHUXUCJYiYNKU1Iv/CPcbmf5GD5ql/EjLssB/yM4Diz7haopmI4H4we1/
         E58q0yyDy8Y9M/ByN8h3EoEfOwpnlYyJH8YoLZorF6Q/dH+e4LmW4D6L0l0ld3Z3MuUi
         dVk/l2hAXWz1lmEzr3Ps2R4yAcqOIWdmRQk2sFSig8h/PH5M3j7GsZiZbgcAOgG9LpaY
         SBwV/De7DUvsQ1MtQ8MoH3lkmF88u7NaLVDtd97+0GG1h++3hPmyiHR1rwAGBrXxGSaj
         +GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691589064; x=1692193864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZSZbnMxGCAQaiOpSsvGGxA9SQHJTADmzlPQy3XEacw=;
        b=heu2MO3L65VAmCZym6b8W7+hlaiXxP/eB+I+1BnA/7HJTWsj8d/VLe9oorpAtlG0y1
         VRUXaNuBRPult/tqZvqVin6K1clkbAX0zu41B4K/KGo59tVRa+liWAuhzk48QYvZ7mgo
         PP7j4ZY8cGJQeb38ph78DwSPfZyaadx4Hk4jneITeeASLdwFC8U36uJ5sCScmTum55bb
         k77amcK/24YyhJWGTD+YuQA/ETGyw21xQ/xYWXFqSW7VIkGY22nbjPyt47VZR1vvlfBk
         CGJWn4STX85pt0SzSbqlVDg8tWeHtQkVK9erzAE1ulCgwNnMuW7zfp39+9G6JlXv4J6Z
         iSpQ==
X-Gm-Message-State: AOJu0YxHnoeEYXPIkpWICpbe5u5ipKoSss0pJxPUcBVDvp5TUi9tuNqy
	ii47gI9aHvTQ5WPNJgmxkdhxXA==
X-Google-Smtp-Source: AGHT+IGyRd7WJudjB3NASLPZ4tgpVvTHKIUwDcteCrieyWhPuWEJw66UxEJgD77KWtV9WrOp4w7wbg==
X-Received: by 2002:a17:90a:6e43:b0:267:f1d7:ed68 with SMTP id s3-20020a17090a6e4300b00267f1d7ed68mr3848999pjm.14.1691589064187;
        Wed, 09 Aug 2023 06:51:04 -0700 (PDT)
Received: from work.. (1-161-169-231.dynamic-ip.hinet.net. [1.161.169.231])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090a284c00b00262ca945cecsm1542677pjf.54.2023.08.09.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 06:51:03 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: nick.hu@sifive.com,
	zong.li@sifive.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/1] Add Sifive uart suspend and resume
Date: Wed,  9 Aug 2023 21:50:41 +0800
Message-Id: <20230809135042.2443350-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_065107_598262_F5B8EC15 
X-CRM114-Status: UNSURE (   5.77  )
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

Add Sifive uart suspend and resume functions for system suspend.

Changes in v2:
- Change Signed-off-by: Ben Dooks to Reviewed-by: Ben Dooks
- Remove the unnecessary check

Nick Hu (1):
  serial: sifive: Add suspend and resume operations

 drivers/tty/serial/sifive.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
