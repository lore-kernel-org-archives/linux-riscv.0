Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQieqxZHA2lLkLa/cadf5iotxTk2w1V2kc3S7b2Xzgo=; b=l+R2DBnkJk9oYr
	cfAHTzE0AlF9uP+c90xp2i7cy3WGoR7O4SrLqz6FGWHWf/o28swcSUS6HKEkHn9pHxDDlU65dUjDh
	KTIuIqB8RJAV0oy4kpiiOCY+vAZUBomI3Y7bTeK8PPFbzY+qdfNrST82rVMBtq6x9iSrxt62kZnBc
	QVHVlC387mUQJSfy87ODzd2gRKB3MqWo3pO9w+7GsngwmaMy3tfhr+Yd12LIBzXH+RXFxE7OaQAk0
	WzpwEx5Dx6kG0qhJloYjNo7ow2ridgBHZ0VvCmYmTzfUZKuPKyW/CjlQbwr+wR1JgakIM6xdCSyHl
	m9/9cNX0ROxZeErHSlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj64j-00D0We-F3; Thu, 13 Oct 2022 21:49:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj64g-00D0Up-CV
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 21:49:08 +0000
Received: by mail-pg1-x52c.google.com with SMTP id r18so2654634pgr.12
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=X6g2DUxT2GNjgJSb1+fAz78uiyB8qoWs9ZV/F7wTuSc=;
        b=Yc/kJQVfhodH7JJ0z1+p5s722JAC0Kovui9UvRAdZv1AuAQddcjsKvP0c5xJ4eXiTj
         OkV6o+tMZKBkbMP3J8A2rnEzZBqu2Fti1CgZTfkIkwnoar5AH/2cjiH4hZG+Zu/36g+V
         nZxAvvE1T1Nm5GmUF3RyGy65BQC16tRTAcjfdvJphIQi546P6Bf+WbD0fqC9SiXxputB
         Z46Iazmu9SQt/CUOBDkff4QrIa/tMeBWmxRjhuMnZhNI4blhSYZW5fXRDsanWC7oq/ca
         f5XxJMVCr+DaGN5IOci1Q5D/kM9yEFJUmVudYTrgpC16NN09vdKfKF2Lv0npeEFS6JUa
         L8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6g2DUxT2GNjgJSb1+fAz78uiyB8qoWs9ZV/F7wTuSc=;
        b=620v7majIARMPpoR4pbvik5bRohSpeSK6hoySwO/3DXhdcAGjzj2z7pp9GmPZoPPXR
         JcijBBMz+37txEm8/6xaMIPsiK3RNCkDfs1Xp+szkcf37O7qCjqIRJGT0bbYb9sjQprg
         o3WDy06L7SbR7IL+x6dRwdXeo7XOeUvLgujRClT0UsLyu/su/f+pLNsXPjoAtMQkWuzm
         O2n6YyDMwWxVuKlhmIvlxmQkokUhbNcnZabYatmULW5J84TB8HbmM5wPX8TLcO7GIlzw
         Ca4BWGE4X/Igaiag3hg2Ur1qt+C/w1BNybZSzdqTDQMAwNKdq9CzGSqN8rO7nKGu6CBN
         Iyrw==
X-Gm-Message-State: ACrzQf2HGWyuZ0o4833MlFp/HpDx79XWoi6/LntRRDbEWWwvaGDdGkuj
	bZeW3UPzlILCldXGP+BpAv6Du4QS8NYt310e
X-Google-Smtp-Source: AMsMyM6IPVcYa2h1i5pmoYBypDG67/4nbnOAJozkEB4zzfmqhCeqDmDyRhB2rQDtJdks9Mg9RfgsaQ==
X-Received: by 2002:a05:6a00:88f:b0:558:8186:3ec3 with SMTP id q15-20020a056a00088f00b0055881863ec3mr1603895pfj.83.1665697742905;
        Thu, 13 Oct 2022 14:49:02 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g12-20020a17090a578c00b00202fbd9c21dsm204840pji.48.2022.10.13.14.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:49:02 -0700 (PDT)
Subject: [PATCH] MAINTAINERS: git://github -> https://github.com for sifive
Date: Thu, 13 Oct 2022 14:46:37 -0700
Message-Id: <20221013214637.30828-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_144906_453095_BAB783DD 
X-CRM114-Status: GOOD (  11.28  )
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

Github deprecated the git:// links about a year ago, so let's move to
the https:// URLs instead.

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I've split these up by github username so folks can take them
independently, as some of these repos have been renamed at github and
thus need more than just a sed to fix them.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a028f494fb0..daadd0de77a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18548,7 +18548,7 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-T:	git git://github.com/sifive/riscv-linux.git
+T:	git https://github.com/sifive/riscv-linux.git
 N:	sifive
 K:	[^@]sifive
 
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
