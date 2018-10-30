Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BDEC2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 15:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454A02075D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 15:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DzRWtHxV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="txEz+TXM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N83Hw7rW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454A02075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dc0TWJ2TPnNkrIMx8kvH0mwdRedjjlJ+PTSc8KoDqlc=; b=DzRWtHxVgGja62/+dX8k5RnKjz
	7nOV8EpuwqEGGdikjkbRbaIitmOB4vNj64Sd5aOSTmP/5NXZHKQ/vxc2VJxIu1hjfEWaUWxQQAs7s
	jbimK7cOQgmVE2akXMjcEkVNRbCFszOhDoonRAruNB1OCLleuv6g3WTnORoG2kskmX7z7js/g30ZT
	ZyueioRkBpckMlfABwY2lpSKBOyQKhh5jOY6kOZ2q++GbhM71Bfk7+dAxUDsJW2K7MU8W/tZ3YKpS
	l7E7Uiv8hTBYYeUgC2Ux1qHvjjMRSTTUtsP1F3uSZTaBsrOeOZ+kdIkvLJ2wGhjYfEYDWZc2UXlrY
	Et5D+55A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHW56-0004B6-O4; Tue, 30 Oct 2018 15:37:24 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHVhX-0000p6-Fu
 for linux-riscv@bombadil.infradead.org; Tue, 30 Oct 2018 15:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PyDDzwHXyMj+C+OLQdTaYPyj7+co5RvLTagufcNFpVY=; b=txEz+TXMFw//35xrepL+djbi5
 Mi0Ed7jknF8Gjyjo8B3JEOcLwJ22tkAtQ/rZc4zN8Lh0cspj8KNQMrtHr6HC37NNiT9h7PHLPg/vj
 SvTrm9Deo8zJhwlBV7wbV5cDYH1BOb23p5Uq0iS3Wt7m//QR+8Yo1fO+LA6igkYbnSNTaP+sDQ1/Q
 whD7iABufOdMIvHgHKRyN4Hd8YWvseu0ynew8LcbV8LomDAgyrx3CXYEEViyxIaO09hQ13SNMgrvg
 pcbS3OzfGtu4c5a17pmmGcFu9bovJxH7GLxx4UAW8FcdW0/giP0V4d4RLMZz89n2CPo7WJHXPJip0
 B7iwsuzdg==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHQq4-0001yR-Vx
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 10:01:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id x12-v6so11841755wrw.8
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PyDDzwHXyMj+C+OLQdTaYPyj7+co5RvLTagufcNFpVY=;
 b=N83Hw7rWQmTs1BhwxhbXr3l2e0O97q0i49fFu6bwUEBWMsvK5BHua7294+uuQC9Cd1
 94Ypjctq67FCZxGcXeRJIHREgj0SRIBKvOMz9DvQXVnfkSe9DfZwiEKtuct8TTbMrO1f
 BI6gKApdDTIF5xzmW2uGgD0O7YsLOC8OvQrfRGgrOCRXw4WpqdDQhFbEokntiQ1v7Yml
 xeTIwcgPcyrsa0OMEJf3wQ7u3yr8ToUmQgkIxjoemvlIBtIFJON7f3iTxvnEArjCfP1U
 bwbSCkS7EMkm79FbIT4Ru68Y1rRGyHqXqaCQt/gxAKupB+dPZ57TuaNzgAMGmZIg/qxP
 O7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PyDDzwHXyMj+C+OLQdTaYPyj7+co5RvLTagufcNFpVY=;
 b=EUAbZV4cyudm7AhIwZDfO8XiKzckMhI7jnyaiZvs2lQxAfkmGDe+HHnEaeeV35g3HH
 Jv3yMmBBsqwoh9IkyqFGS/zdh6KUm+FRhwfVQZ5EAkeOk6ydr5DFqE154ar78k9LruH5
 /M0JW+bixh96rSbE4eV7h4XOQOVsUph4gg0B1H2dWLXrtxGap1cpk1h3VAlJe8bLta1s
 Guhz6NDdzygScOdVQkPU+RZf2+ryg/fgYxCRailrgmVqp+wpvJyjRkR3oRhlQMIKtWus
 C7R+1B4kI7A8JKsdEINmakN9K2y2/wepXNJp9Pc+RWP+AFxFmkxSoJqZbQuVWonIeuYG
 niDA==
X-Gm-Message-State: AGRZ1gLOJpBfFBnOhrFBjLoHms8f4boGwYqGH/FxIytGu2/jsQKCF4bS
 MlbjNIfdDZVnSYd7YSemT0I=
X-Google-Smtp-Source: AJdET5eDJ3Vv7Wh6CqIymLAytfrTnCbc1rS8td6DgwmOlj9RLRjpFqRLTEuJo9YmmyMYtmpzUwd7mg==
X-Received: by 2002:adf:fcc1:: with SMTP id
 f1-v6mr17961330wrs.172.1540893679373; 
 Tue, 30 Oct 2018 03:01:19 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id f1-v6sm18420825wme.23.2018.10.30.03.01.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Oct 2018 03:01:18 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, green.hu@gmail.com,
 deanbo422@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: add ARCH_HAS_SG_CHAIN
Date: Tue, 30 Oct 2018 11:01:06 +0100
Message-Id: <20181030100107.4590-2-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
References: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_060133_039636_3D90E03E 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030100106.2Q6FGnMpJF3UduL8Cw1sYOmlkE7bmC24G0qLXuwIfWY@z>

This seems to be needed for virtio-gpu.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Reported-by: Michael Forney <mforney@mforney.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..b54f2ade769b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_SG_CHAIN
 
 config MMU
 	def_bool y
-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
