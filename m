Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80B7C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVn3iBXDtwcGtU1DXcPdxkfeXR8JjyUiNTGVxKzQQ0g=; b=XrqGCsBA1X7cfK
	AyZ+vQu4Lo7R+UcfjYdjzD+yNin77BQ+0yjFqyJNO+dlPsAjwJJ9lHj2HDA6gOdoUnuA9s8IyGofd
	AHryqCIVhWuogmen5KSyyf3wK/i+gBDsKtPSgzzqZRq7Appnew6UZHrrFCDnovmfHm5eU58iLDdWD
	0ltXbc7HU3Q3KH7O0P9uRify/uLRX1bceqjcFV+mtgP6keOr8MSph/6wgH9V7IzKYMRaaFgYmTIpp
	cdnHTYm58C0wILOM1lANtq6zi4UcRn1isoTnuVNJsi7yKv5PHdoSZJTbnpE7dNiB3AKr911dxwSVo
	+nouF6DDmwXU1koJHnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2ez-0000000Dbfj-3K1S;
	Wed, 17 Jul 2024 11:17:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2ew-0000000DbfK-00zw
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 11:17:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-367940c57ddso3966245f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721215040; x=1721819840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEde5o55HcVFlN6Ab0SvCBTZkTEAqRrN15IuEXMMTLY=;
        b=qX0TyIAmIks/+g5xdWNP01VAIe8XgvfZjLQlBm9aR2GNlUeTqYict6dBf+iJf7qMGr
         crfV4lMce8Tr4yQqkx31DWWfrp4KxO6AD0WBmu7zybM8DXiaWmarCq27S58WF4Etz47j
         /dPdepc3zYwAeEsBQ5ZDZT3w4JDzA7CQ73RVyT1qmlLEYv56Dn+Z22DQdnaD3oXrfWNi
         G2y257NLdLacsfcBs5q4wwUO2tVeAeBSyBqJzqc4itIN3Q9ACz48uQljNVy3aXmWkZL9
         L1OIYSoQgRti3fLdWSuxhS+50nXeCUwd0DSyuiFNWq1GDZvEfVa9zAXlD66ceTsbHwzJ
         j5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721215040; x=1721819840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEde5o55HcVFlN6Ab0SvCBTZkTEAqRrN15IuEXMMTLY=;
        b=Uc+KK5TyjcHNRV148T08zHPHpNbhO4yXmzrjXta/VfU8WS2+CFvHjal2u4kB26Calz
         TexzYk72LfROf566qFaQh+2+S1faGiBCa/hFQ4WjAa5QeGbAX3ZhxtTNcGFXrQApOjjd
         FbBXyeKub6FDWUMk28QUXhWL80eqy1Iz3jheSzBKWsEFZYCiIMWxEXcFgYGsJdWzGQPW
         8knrrHHJd40x0Pk8+Cxg0fyiIgjED0s1xLzJLu8etEbVTtQs62iZ/Db10p4+AtNPsj5I
         kycFEtAlKL/MsQREH5VV1ChNBDsr6WI3OFxnaB83+idGy81A5hyHw/V9VMTUGz1sNgwO
         /3ng==
X-Forwarded-Encrypted: i=1; AJvYcCVvLrGTMKBz+0LyogPvBNGEcA73J2agNPgmq8wALbIXh9uceDWbT/EulCxbDZdIT52ERujQZBzVUpT0nGHGa7gdl4u5q69HzuQPgYfj0MSz
X-Gm-Message-State: AOJu0YxOqo1JYHbLPlbBgvPwpguQvac++1h8n14R7Wl0kMEMEyTvv+5k
	alDohDZj0fDRlgAB/JO2AWqrhg/s5b+AU9srNLlK5cASYwR+hREnKKkV1dfX37c=
X-Google-Smtp-Source: AGHT+IH+V2ev/OCWLwYSzMlfYIiT2IfSh24gG/zyNHG70xS+PgIrxI7Rq2MKq9mnkZWa1dyGUYJqiA==
X-Received: by 2002:a5d:6a47:0:b0:367:9614:fba9 with SMTP id ffacd0b85a97d-368315f5b2cmr909738f8f.3.1721215040043;
        Wed, 17 Jul 2024 04:17:20 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc42esm202931055e9.32.2024.07.17.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:17:19 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH RFC] riscv: Allow to build only with LLVM >= 17.0.0
Date: Wed, 17 Jul 2024 13:17:16 +0200
Message-Id: <20240717111716.157149-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_041722_271263_A93702DE 
X-CRM114-Status: UNSURE (   9.83  )
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

The following build failure happens when using LLVM < 17.0.0:

kernel/sched/core.c:11873:7: error: cannot jump from this asm goto statement to one of its possible targets

This is a known issue [1] so let's upgrade the minimal requirement for
LLVM to the version 17.0.0, which is the first version to contain the
fix.

Link: https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1645979992 [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

This patch was done by Nathan, I'm just sending it as an RFC to get quicker
feedbacks.

I tested it successfully.

Note that the build failure happens on the not-yet merged qspinlock
patchset.

 scripts/min-tool-version.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 91c91201212c..e81eb7ed257d 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -28,6 +28,8 @@ llvm)
 		echo 15.0.0
 	elif [ "$SRCARCH" = loongarch ]; then
 		echo 18.0.0
+	elif [ "$SRCARCH" = riscv ]; then
+		echo 17.0.0
 	else
 		echo 13.0.1
 	fi
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
