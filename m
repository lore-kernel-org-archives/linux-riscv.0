Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1414EC021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 23:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JFvYgqQ9fxfHW0sZQKiA4+ejtOtcC7k0Jl0rcVt0GQ=; b=XfVNdoFSHpcAM7
	ALm21mwOI++pqEeGAX09MNEILZ/00hQn1QpPFdW/rruPh2cU2WAku4ljsFD18EkyG2pJj9zskQFVV
	7gt/4vndEjN0In14rw3mLHpvmKQ37dUoVyUQEM7B0S+FUAv4q+cqUvOczoP1oFxVPxRjw6WwuET0X
	LRpB6v08EQuTR3HJrUvkgwJXuFT/OAynovt6V7vwTONBd7L6l0fo1QI4Xk8D/vR6oUBFtYy472Hqi
	wo8fBGlruqD4hi/gMtWOsphp0Muie6MmeykRDKnd8BsYdCv9Yl8rasAsno1uOsLBjRkBDMPNPGHWO
	gq4Hkd21t02H22mHKGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR59-00000005jgg-3kgR;
	Wed, 26 Feb 2025 23:44:51 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3c-00000005j5i-1vmD
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:17 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c04df48a5bso38356685a.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 15:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613395; x=1741218195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BPCE1EwJy/+4tZvxiVTXnB1pR5FYwCTo9rAvyHj8R0=;
        b=FIIxjUwvYjrMClpz5Mjy366IkC3EWxFndF3V/qJX3tkJaumOy178j5qI1E7FHoiksc
         NZulx6Akb7Tx/0lAO8SCY1/5NLFSOsSFeS65Lh4P4flbyyfRr//9iXIwpFjYpI/oC8MJ
         M3aMlQXD5AXefkC3/M+bD9lfrSey03e6EyqVuwJbyvUHVESTS2Js2Tdu9QKeOwsnp2ne
         y/SHgHQTZ3ooCntF457OA3jD0SBiiHnjfEvvwMMchKSM9VmwJONf803XivBy3vixh1GN
         6hx0kBA9/E4x/PaPE+Xbq5IPTRaqTpkFPWr+V8QAgnm+Vi+/JmG3LRTPDyqGBCSVmF/U
         9gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613395; x=1741218195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BPCE1EwJy/+4tZvxiVTXnB1pR5FYwCTo9rAvyHj8R0=;
        b=NxG1JVjgp3AowRi8QF/ZMFhSBY3h+eU69ENe4Df7RYLNvF1ST6pnPUFu2cYZhLjGD7
         +hmcaqSq4aG/GttfpzzvpZnpSverk5CyjSijnGWC8UaAjVUfJeaO5sTgfMgj4V16e6aL
         ctph0uevcWhQBODbyOfuLqJ5irqvVDwa9YSf0eV0hBcuIJ1ElAvsQ2vaG68ixJnHytLf
         BoVV2haw5JUVzMmgWbNQF5pjsoTrbwZxlIWnwXAY7mR4wBXx+Jjv/z1ts3ixtwQ6GalA
         M3YjAp9B6w+ZNrTKmFMr3DK9ltcfkj9avX2a0v8wSEqJd89lNufbSHNLtIFY7hWCS6G0
         f37A==
X-Forwarded-Encrypted: i=1; AJvYcCXwRMEnHzLA3jVlgObBIemzxYlnwk6wCUPeRvxNVqfeNif4ZyZoGhoxZrZ4WQgBo3uJxbe1x7wVHnbKLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyijXwdN9n0tIxLq9UIpxEnVM14FOzqiSupZlR2ZRCaBSSs/vn
	/nWU8lufgFeLUvyrBUOG8tLl/BWeu0RIy89msdddy5JlJE2tajnG
X-Gm-Gg: ASbGncv64vLXx+IhEbyTJkIjBnl9bkkb3l5W1As5x6MF/kH0gdJpxctRc9AV1x1NZnN
	Mxr2aPp4DYvQ0M4ocPjnJLLCJA1rHGHbMEdnJXdnmutlTchPY+xhjFUq1DDZR363tmzGYYTNjI0
	zQLvVI2XTwV3DLYcLPp9w10c6Nf/KTcgBagmnS4cAQMGs0h/LpsmysKAVCvpHRHBVICy8E/UAXk
	5xZxwNlouMKJK18Anb/JQ2e4gIAIHiQtZ69gHx59/CebUvf4AZP0aNw90vb8NST0NN5UAibJjqd
	KA==
X-Google-Smtp-Source: AGHT+IExZ166ZnKNMVp2sWPEye4nK9gUSWKtplsD+DW3kIJ2K1CBVm+kQQbvv+biiRYF9M4XnPhnNw==
X-Received: by 2002:a05:620a:198e:b0:7c0:8978:d1e3 with SMTP id af79cd13be357-7c247fcc139mr765759485a.46.1740613395229;
        Wed, 26 Feb 2025 15:43:15 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36fee9b74sm24836785a.9.2025.02.26.15.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 5/5] riscv: dts: sg2042: Adapt reset generator for new binding
Date: Thu, 27 Feb 2025 07:42:33 +0800
Message-ID: <20250226234234.125305-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154316_495308_CD7D0FF9 
X-CRM114-Status: UNSURE (   9.82  )
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

As the SG2042 reset controller reuse new binding, change the device
compatible with new string.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..2be10cbba0ce 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -499,9 +499,10 @@ intc: interrupt-controller@7090000000 {
 		};
 
 		rstgen: reset-controller@7030013000 {
-			compatible = "sophgo,sg2042-reset";
+			compatible = "sophgo,sg2042-reset", "reset-simple";
 			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
 			#reset-cells = <1>;
+			active-low;
 		};
 
 		uart0: serial@7040000000 {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
