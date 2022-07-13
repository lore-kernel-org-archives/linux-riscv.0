Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5558BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=STL9Uu2/5MwIn5O2Wh1CzmEz0SH53L7fN3ZvUFM5Z+Y=; b=kgZNeEr9V010jZ
	f0rNEUoUuBf2tmTknZ+qogXEcDm9YcWAUB8VYirfluAwkCKN2US2jpjSnBJbMQAUaFpg2JKwVe5yc
	CVAXbP9FWB/yInXknSQyDiMoweQiCM+rAbaPzVV3uEjqNhz4/fExQpYqiAhqgiALNYRNfVbwFm/Hx
	9psLun7n4vPRLcB8e9LJej8t27ir0v+DfHRI5LeDUNFUm6QgxksdeA4JbG+0n8mrwwhjjBeDKs7yM
	tWqP0JMARiHvYhsmGl5vVPe21djE79oEnJptHOo0JTNvir7S3DlEKR+TFxEElxgyW8QTa4YpUjkbd
	ehDObJK2p6EbKUQsg9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBiEy-007SQh-Fw; Wed, 13 Jul 2022 19:41:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBiEv-007SOm-NO
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 19:41:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id k30so15421006edk.8
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JlnibxcVeuTrhNTEEnDRxSqv9Basa+SCy0cDueYCtlc=;
        b=jBAPtS4Ht/YA1HgAGo6nJNH/Chk8wnobIGUV0wDT+rB+LpKCbeju35dcl6+RhymLiV
         GFi7Zn+xCibhgRWe6lKi+ZLx21m3/yO3hBHrFmpQ/eO4Cv9pwmML8RyqfMaGLZgOWckx
         yeswEmcWlkDjU4cTrCYv6KkfuEBLS+Q+zyu2Zo9QYMSiZzdaDZIE0fXi4ly7g6l5ewdd
         KRIH9eFv7yfvm06lxENNAW2jjMPdpEuR5t3zrF2AdWl4wN9k00x+c7FaauDrfOn1f7++
         GzhIwJ/NPXOqTFuwhcuaKCX8Lcgb5FmsvMuaLxtin630rcd2NFEQcrY1nMH1yuzmwTx+
         AkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JlnibxcVeuTrhNTEEnDRxSqv9Basa+SCy0cDueYCtlc=;
        b=6+fpnsbqexA+lqigrmtHvqy9ky436k3q4s7QIeX7sBY7vXvtZHawusIEMkkj07nrPD
         AFirsJvDWIQX6b5NUQfU5bmXYdQRTJ3SeKGdMzqYY97YwPAAhJhECmR1WArfbablVOqV
         qbK/Shyfb4ZcRROMtr51WXDPB/44tHQgFA/qBhD2YmIVRENCcZRrVl/4eHeK4tPR6CEV
         CmcMb8pEMbhu9vXYPNGYw23eZMKARZpTI/Pir7KGi6w85IsyhjKshdS4d7vhhWonYCQr
         /2/0cazGIyHm0k11oArsHNcudo/7Hbskb+/Txh61MbAPzgN0dtFm61EnTWf45pVBgAIp
         5s5w==
X-Gm-Message-State: AJIora8qOGKm0/ElM8ivGaeWNlt/XN7tmCo23wMDL6JSQnzcxcv4dkW7
	qi9UPxxjJMNMsF8dv+hIKVo=
X-Google-Smtp-Source: AGRyM1uSW0QI8pe9PbQC9T7YLuAeVqej2y5W9kIfl+NR68Fq3mFmeO9Fbwt/6+LesiTSKdhmzI1ZWg==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id h2-20020a056402280200b0043a909855a0mr6995944ede.179.1657741298988;
        Wed, 13 Jul 2022 12:41:38 -0700 (PDT)
Received: from bhl6zntu.conti.de ([2a02:908:2525:6ea0:46bb:cacc:f548:7466])
        by smtp.gmail.com with ESMTPSA id i20-20020a170906a29400b0072a881b21d8sm5294390ejz.119.2022.07.13.12.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 12:41:38 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: 
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] checkstack: add riscv support for scripts/checkstack.pl
Date: Wed, 13 Jul 2022 21:41:10 +0200
Message-Id: <20220713194112.15557-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_124141_807438_5137C441 
X-CRM114-Status: UNSURE (   8.43  )
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

scripts/checkstack.pl lacks support for the riscv architecture. Add
support to detect "addi sp,sp,-FRAME_SIZE" stack frame generation instruction

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 scripts/checkstack.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index d2c38584ece6..d48dfed6d3db 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -16,6 +16,7 @@
 #	AArch64, PARISC ports by Kyle McMartin
 #	sparc port by Martin Habets <errandir_news@mph.eclipse.co.uk>
 #	ppc64le port by Breno Leitao <leitao@debian.org>
+#	riscv port by Wadim Mueller <wafgo01@gmail.com>
 #
 #	Usage:
 #	objdump -d vmlinux | scripts/checkstack.pl [arch]
@@ -108,6 +109,9 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
 	} elsif ($arch eq 'sparc' || $arch eq 'sparc64') {
 		# f0019d10:       9d e3 bf 90     save  %sp, -112, %sp
 		$re = qr/.*save.*%sp, -(([0-9]{2}|[3-9])[0-9]{2}), %sp/o;
+	} elsif ($arch =~ /^riscv(64)?$/) {
+		#ffffffff8036e868:	c2010113          	addi	sp,sp,-992
+		$re = qr/.*addi.*sp,sp,-(([0-9]{2}|[3-9])[0-9]{2})/o;
 	} else {
 		print("wrong or unknown architecture \"$arch\"\n");
 		exit
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
