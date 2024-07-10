Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13223C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=datztyOQ+r940qdrA2NW37SDQyG9ERoawtClOMsVd0M=; b=0fYjCKMlvgnlrv
	ngO7tF4tHnwqEs3lLzQUJH7i8ko6DtUQx3LaAryt8mbO1f+sdUfp8onXIXzoIvwlbh73MpDq3Df3k
	t7jU8KXw2JWfpHL00OnIc3Z621QN3671ruvrgwQYEMdygRIhdseL08dmcFGYRat+sOqW9scY69FE1
	JfUl5XqUvsDVdFoyNdG6XHmyCpfrYy3E5rZNgA1sCQq64MwjfUafnQ63u3TjVlcQ79G/NzBaZPbeV
	CVmEX4ZOKKYacZR8/pKBl5RC1id4MRk35BJzriRblHSz/Ll2tyban9YmfqjYnChjd5C2Zbho5QWyR
	shfDyHuEd+Rahj/4VLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRds7-0000000BeIY-1QVG;
	Wed, 10 Jul 2024 20:25:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRds3-0000000BeHc-3H8t
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 20:25:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-367993463b8so49291f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 13:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720643098; x=1721247898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehEDACZEo2Gb1GPaaV18tIUSiXICGHsIvIVpWT2aMEU=;
        b=wjoYipL8NuY8pCaCOF6LdEkNTz8miIRJHoasZXo1tjtV9VVrtWcjrORmkI0EIQc8Or
         G7i2ZJ/M3VeCHedguuqO2UMpss/vTAuSoY5WwF+c0lp/aJGs7C+w7cT+ZcYwIehXSdzV
         b8VujWw19Td7C9/jaqqGHcZjXS2AOeKsPWGCuk5cEEJ7Yzf8FYY9cojdz65oW1Ti/Eag
         cpIaAYB3gK4PGEEfm4seH+YRl+8upMVaTvZc1/PHQUM16/tdQe6ug9CKygeYjoHNPR/j
         zfc/nJsEorpthlD4AS6sYMbv9faRIevh2lB1NnlVmkdXoPNR7AZWtfgjxztlfbzCr9t4
         R2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720643098; x=1721247898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehEDACZEo2Gb1GPaaV18tIUSiXICGHsIvIVpWT2aMEU=;
        b=O0L3rdsZU1/vbY3OsZbGt6/DhTqpWJuHkXMn/qC5fcM4/VQdxDqFlFWviz88h1a9AC
         lLIXyeo6VtHPD9e/gJ1gWNOTwZW6pu5+tc4hpxZ8Lh+xweojRSn2r6Y83/CU2smAs3zN
         QR2UlrX0pE+o9UtBvyuAeOROkf0QUCmBOXR604fvgeQQuDLVCKq3hotL1vbOQFoJrhAP
         XrbJH1ws9v8R2kd2BMJjt1kS39P73Wop11K4KK02kDH4NTofHCfsusO+q+Fm66WfE5BU
         Pnc86zkweI4WIUN+BoUU2fJPjFa6j4tdu0AsurftVpEdQWjmfyBqxrsF/fApFg+iipsa
         tmlQ==
X-Gm-Message-State: AOJu0YxPoseemLAOSB9KAwogugoqMWfhUBG8ZG2vVWpKl+P6ocBDfQrw
	q4IRR4HTXMiI8qMW7eK0dL48TCpAlADZYdFskKD/h1jxSAMxhEq5f8XBQgT/GPc=
X-Google-Smtp-Source: AGHT+IH3DrwNuEFLAz1IaTtJw8NWddd/qu6YiYyy8h0Cxg/Zcp3nFmbvLMiWqFgMx9D5H/V4gSvpFw==
X-Received: by 2002:a5d:5f85:0:b0:367:f0f2:66c1 with SMTP id ffacd0b85a97d-367f0f27ff0mr441185f8f.12.1720643097692;
        Wed, 10 Jul 2024 13:24:57 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7ed52sm6175423f8f.6.2024.07.10.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:24:57 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] riscv: Remove unnecessary int cast in variable_fls()
Date: Wed, 10 Jul 2024 22:24:18 +0200
Message-ID: <20240710202416.710880-3-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_132459_843906_6B99DDF3 
X-CRM114-Status: UNSURE (   9.05  )
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

__builtin_clz() returns an int and casting the whole expression to int
is unnecessary. Remove it.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/riscv/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 880606b0469a..71af9ecfcfcb 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -170,7 +170,7 @@ static __always_inline int variable_fls(unsigned int x)
 ({								\
 	typeof(x) x_ = (x);					\
 	__builtin_constant_p(x_) ?				\
-	 (int)((x_ != 0) ? (32 - __builtin_clz(x_)) : 0)	\
+	 ((x_ != 0) ? (32 - __builtin_clz(x_)) : 0)		\
 	 :							\
 	 variable_fls(x_);					\
 })
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
