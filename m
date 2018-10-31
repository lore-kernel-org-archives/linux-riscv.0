Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C16C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:47:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A0720657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abQANmy5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="iOe5IfPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59A0720657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5HVxq0gWduXwLJxlh8+rv1acCfSe93WfqjqYvPJUJzs=; b=abQ
	ANmy5QBIRxzltoe6YldMnfJUsDeQrcQo+LMaCZqX1Ea8GestZXkEmOqehZbqCxNqcD5XQIaQv9p1L
	VoY/zzj7hMlgvLHytDAg2t85DHbfDLS3wiQZV6Ss/x6ngclSDfvF4B15xxyYmN+JBgvECVzkjkFQL
	zsp4YlObKQrwfweF5rYewj2a/Jq4hTrTCnWy13bbPINyXaM3LEGHEbxJ1P4kjlSbwmGZrZs8Bw0ue
	R1LsUJmBj64NHlLlePEcujryg0u9z6Y7Wfot+hJ/uFrzNGmTYpYffZg/c26X7DFfJpuOWMJgcfnY8
	ihqskrlkfSaeCBJVxMuIGXOauLhJSVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHkHs-0005h2-Fj; Wed, 31 Oct 2018 06:47:32 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHkHq-0005eg-2p
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 06:47:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id j22-v6so3315353pfh.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=W1Z7T7kYjlBi8jnbvZhMFNfbvlYHmnf00Bddaj4EEcg=;
 b=iOe5IfPzrF5E0yjIQCcA5XCwUsRiMCfTNQC4xk6eGS6Opf1Jn8PgGFE9OEPk06SowF
 zCU9di3r7Ti45Ge115ru4+bplzx6EahmtXpDOPC7oCZpSRkYRADZuB1cs+wCAwRKUG0p
 6D5fYGrwVFYjMpmTxUCDhhAxWe+pcakjwuBbXYkLKlQOkYebPEaa120UPjvMYwP/9O0g
 DC6D4HvZmE50iLa5UfT+rHb+bSkD5ERmw9B7X+i0IB99VcBNtC0s9MCxhbk2zzQ5VIWr
 8zsiSaQlfJv7WRuq07NHwMWxm7yelaEOEAcVKi3T/NYkwsdaUwDVFTcyMHmpPyzEnyMI
 yAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=W1Z7T7kYjlBi8jnbvZhMFNfbvlYHmnf00Bddaj4EEcg=;
 b=bUGaiwKdafL6elXx/2N8vunLO5P6ZMTN4DSvIY1kIFQ2+NIsqQ/z02rP9jQvJTgjTf
 JfDYtIObSwDhuNBukwjq7n1QsS0E8yp8H4382HMZfqpxDlZsYV0gHAYBwqTPczn6DMQj
 wgmJ5NFXiVthEJ2xHYQ82vRgi+WBkU9EVYOhXqZnwx/i9lv4U56OleMNsptqV/vRfvUb
 7bO6NINLBqqJwNpq6NCYvqUoXp7VdiuGA2BnvqQj1h7wEggfXzKvvPE70n8D2sJ2tq0r
 fe7Lug0jtncnJdLKVjtMNzaY0iaoso5A81Mr9Kzi9LswidqFN0oV4zXsFpDDYt0JhCLY
 7R8g==
X-Gm-Message-State: AGRZ1gL+IEY3EmoqZJyaeJ8n4ncLQRAsucCJVhl4GZT7qmSPkmLCrhM9
 O+ib+eVrev2qXakx1SoMmaEqpQ==
X-Google-Smtp-Source: AJdET5dilzfkWheBCWXHjkkoozVlDTr3ymkKUud+nAw6m33ypd3Xfs9LEF4YFLd/MVq33d48Jm1bKg==
X-Received: by 2002:a63:5357:: with SMTP id
 t23-v6mr1995605pgl.40.1540968439226; 
 Tue, 30 Oct 2018 23:47:19 -0700 (PDT)
Received: from localhost.localdomain
 (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id z7-v6sm12127306pgi.42.2018.10.30.23.47.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 23:47:17 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
Date: Tue, 30 Oct 2018 23:47:06 -0700
Message-Id: <20181031064709.30981-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_234730_120522_9D6CBB5E 
X-CRM114-Status: UNSURE (   5.56  )
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zongbox@gmail.com>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031064706.vTSGKXxFlbbvNy9Y9daONfps7jaGEZqsro80hVSs6JA@z>

A couple of fixes for build breakage or warnings, and a small whitespace/asm
cleanup. The non-cleanups would be good to see in 4.20 to keep builds green.


Thanks!

-Olof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
