Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24CCC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731712243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6gykgrR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dHDtII3S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731712243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuunuSOU6KCsHfwwBdnseNiPfejcy3Wdei6Pn+K81Hw=; b=t6gykgrRi1oxmM
	MhqXgkuz6r/u4SkmJ6tsrSSG+7MTjfGkmUI0GBfBwIPo6d0U6eK6lRpfkdmkjCtnCY2g4bv7v5txp
	H7H7BH42TeGTwo5LroVxYSLrYTZKuD4WQCuVlk8O06VH8IRQ7D3wkT/fVWd0U5M54K8o1a0RbicZo
	ahBi8D4Lc3lKkzJ8uKrTjLpXVzXYCJQeAuWZxMqCR2t1SVuzvnmWxy5A5r5Y//VaoRtoVxG2gFyar
	VGdW8r11nvROitQ4Ny94l0uGJpmmmX/ZvjMKaEhjoVCe7EEINNFvIAMZ58mBzUSPWzL5cerPTExGw
	yv52shbFm5IAHfv591ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3b-00064q-UD; Tue, 13 Nov 2018 02:03:59 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3Y-0005qB-VB
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:03:58 +0000
Received: by mail-pf1-x443.google.com with SMTP id b81-v6so4711832pfe.11
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=KwRK/8QusrPt9E60VsZ+F/UZc9LhXH3dVrppBh4GkT0=;
 b=dHDtII3SPhynR8V8WQ6RhY4iIrwmmAHy+ZinjdkXtAm6sTkEaaNuEfub+dqf8SZI3B
 dTR9Mi7Ofc/EDidTtGRZGq2FOn2yrZ5AjhcKGCXlipf7oXVnGNVQ5D9IZlZ8qkS29ZDZ
 vLBb1DTN8fTFH2mUvlsCLTryVkC5RaACkNLhkGdoesX76++l56Rec0ivX5NQwfxlFEEF
 XFylgfi91mBrEPDtddjEdg9ZGYDi8/twxrOKKwpUlSs3OyQLPqnEL1kymjS/P5AK6LGK
 uSPu7xhD6XsiKqEDE2xJmtLfJsmnY0Eqvolu66Rsj3rVTchSqEFlVYLHuRSEju2ldVkY
 Idjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=KwRK/8QusrPt9E60VsZ+F/UZc9LhXH3dVrppBh4GkT0=;
 b=iMcIcOg+NrHEpurpoHqnMG4k+f51oogF84dGSM0qjAoqKy5fQARguyXT1CiNKj1xgw
 XKMFSG+xs4Oc6CBVFEVZhMtl8MFEsp7TaDmdU5J7jyn/ornY9zJlPp7Ik15N3gL/G6RB
 UJGfVx7owZSp6ZScpmkRTM78Cu4+SAXhv4tdfM7jT16fgY8tYF7q3l2n40jiolNJ9guB
 OI0XcE2K7xUkhLuKH5HijZ0fXUmi1MR/tobXyxZpaFAwYpX2pKsFbd9jT7wo+Cr83sn1
 dPjCT/2SD8wq8ub1+LXR4AfdVd27pJZbMeemzqKMby8OSISofKCm5bmBQbNLLHVw4Jzt
 o7Lg==
X-Gm-Message-State: AGRZ1gL2NVUUhLAIS4hC/w+vH08xQ+bw251NzftOYZHqnHqgNWO1e2Jc
 u2gkqsYjyPoV1X6y1WVJJfdKaA==
X-Google-Smtp-Source: AJdET5eNU9kgcQE7rm+1rijBilcpE7dY75n5yG5XoGYN5pAdXkENPvN/pzgS0E8cPu4WG9WX/bx8Aw==
X-Received: by 2002:a63:8043:: with SMTP id j64mr3036868pgd.405.1542074626048; 
 Mon, 12 Nov 2018 18:03:46 -0800 (PST)
Received: from localhost ([216.9.110.1])
 by smtp.gmail.com with ESMTPSA id f10-v6sm11693569pfa.188.2018.11.12.18.03.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:45 -0800 (PST)
Subject: [PATCH 5/7] doc: Indicate that arm64 support queued-spinlocks
Date: Mon, 12 Nov 2018 18:01:11 -0800
Message-Id: <20181113020113.29640-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180357_002722_37416E25 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 yamada.masahiro@socionext.com, jhogan@kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 jglisse@redhat.com, linux-doc@vger.kernel.org, dhowells@redhat.com,
 jcmvbkbc@gmail.com, rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com,
 ren_guo@c-sky.com, david.abdurachmanov@gmail.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113020111.k-TdSkXnq0LoghUHo1M4C6P3-rwg5h6EKbclC5EHHKM@z>

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index e3080b82aefd..743aa6691715 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | TODO |
+    |       arm64: |  ok  |
     |         c6x: | TODO |
     |        csky: | TODO |
     |       h8300: | TODO |
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
