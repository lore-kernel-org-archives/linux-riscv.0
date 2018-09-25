Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAAEC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 12:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D64420842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 12:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iN6Fw7pq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LnsAHSR3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D64420842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VmGtk3rUz/eTG9ctxWAPBqjsVwtUdSl08rppFde9bU4=; b=iN6
	Fw7pqaEYuFhadE+g8UCghLcgdiw6SsOLRrgQLFfDJQiF14Mri5woTjAVyj2gqcxE2/kq3EYwexv76
	Blx0Qo/QfFFtY8gYeRKdnZxCYIDNPqcS5pAaPR5SB3Hmr3DmOm+6Jd7K8A5ep9+Op2RkyE9rgoWwY
	jGqJcH2qtkK2vCqLXrGApxNUQIoWHy5o9jvrvrObhriWtC/U9igtyQz/iYl3MX+YYceZhuoy8AN25
	AnzHALrXf1Nf6wpL6I4E5dvvpkvvLtPa9BDSu5XVGQpofYaiZyt/H7iCxWCMyLLBJK3WSqgJBHFHm
	RKtBqyKTcEYY+sysRO369eeS5Q+yutg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4mDu-0005EW-F2; Tue, 25 Sep 2018 12:13:50 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4mDR-0005Cd-QJ
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 12:13:25 +0000
Received: by mail-ed1-x541.google.com with SMTP id k14-v6so19107719edr.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+SJi6jIZW2lJ/yIWSh0Ju2vjFQAAgCzYNpIhE6KpBnQ=;
 b=LnsAHSR3C6ZyAJLXza0WAL+6HNSWaAOceZ9NyQEKAgfdIM0OzO9aCwRWQ2CRCJ8uzG
 3ZJ6vrgpzXVu+zGd2Ahz7hRNs7IaGbOQG2JTojIEOJMJpHNa72Y/S6xh2/PlLokeSWYv
 pXtJq0YsadHofmdgQr7s7RlhxlOpFnNoYa7I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+SJi6jIZW2lJ/yIWSh0Ju2vjFQAAgCzYNpIhE6KpBnQ=;
 b=EYLyeIbDd1mKzjGudHsoHRrCcFbDIaxvQ6vhUIVBxZu1EMZMKBOxPnOp7UnBJngffA
 8T+91d6Raopt8fzQkve5tiOEmMB26iE3h3RVw99PKI0xgDF04jg5yUHsbIFuz6pqf5CX
 ft8Oz+8asdIjs65ARMU8e+yVB7QQQHomqlHnK63EvEvxncL1SZl5vxXif206U7Wf2/PF
 A15GMvdbFJ3p4YIwOjiQBD1l9+Zjq1iNy4DI66VZ6cygqlYQvkQ+/GDpxeQBANiiyP/y
 htoF/nViP8EcAD4FYOoJpgOOoZHzBhzFho+0JCsxqzDva5KZ7a77FgJIBEaipR7fM/5C
 iBgw==
X-Gm-Message-State: ABuFfoiKotosb1+bni9xdHYYyb6wxazMfwMzU2FVdG/G5WUi8xD7WFU3
 s5u1cv2TLSCWCF2U68YfevIkaQ==
X-Google-Smtp-Source: ACcGV63+Zz5KG2Cw2C895r7B+/t+c4tRfhG3jWEHl6J+CkdOkqK6liZ9gEb3H//K6tXUPs9LsmjHdA==
X-Received: by 2002:a50:a0c5:: with SMTP id 63-v6mr627854edo.47.1537877569627; 
 Tue, 25 Sep 2018 05:12:49 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz.
 [109.80.100.85])
 by smtp.gmail.com with ESMTPSA id a11-v6sm6739522edn.95.2018.09.25.05.12.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 05:12:48 -0700 (PDT)
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH trivial 0/2] h8300, riscv: Remove smp_mb__{before,
 after}_clear_bit()
Date: Tue, 25 Sep 2018 14:12:23 +0200
Message-Id: <20180925121225.9917-1-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_051322_322226_FD4BEB81 
X-CRM114-Status: UNSURE (   5.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrea Parri <andrea.parri@amarulasolutions.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925121223._kVQdnt-2V9y2TaGrb88PzhUD95zWP-RhkzoBUgNYSE@z>

A trivial clean-up, removing the (now obsolete) definitions of the two
barriers. (smp_mb__{before,after}_atomic() can serve similar purposes.)

  Andrea

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: <uclinux-h8-devel@lists.sourceforge.jp>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: <linux-riscv@lists.infradead.org>

Andrea Parri (2):
  riscv/bitops: Remove smp_mb__{before,after}_clear_bit()
  h8300/bitops: Remove smp_mb__{before,after}_clear_bit()

 arch/h8300/include/asm/bitops.h | 6 ------
 arch/riscv/include/asm/bitops.h | 5 -----
 2 files changed, 11 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
