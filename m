Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC0BCD4F3F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hV73ZdoRSqIXI8wP5uMBwSSooUbc0w9/MuCJ3NMeFQ=; b=tI0eAf3A18RC3M
	sYyuqU0+4zSv/OmVdOb06S1hp2iRXjwjGaKNSgflGbMRVos5zG7zHa07kZnVI2gLYidRwZ7ghxyLx
	xJTTUmYnnhvmWElkhECxGpgXSLgLaOpwKuN/5FsEfxW44l+hW3qYt0y8CWyq/uV4k8J2oqsA3eGii
	M6vV5vliDAPuKcRSF93qz06Ag0sp8+h2l0cKGnt2vcPD68mO08SYkGWutWRPPoznQAOV1jcT1/RLM
	A0tkYXgvGmzA6oJGCRFSgCCwN2j7oxbqC3icXc9ba9r+GFkn30Wd5nLiduwFjz9JS4tnyZztOy9FE
	lC/4PgCE+hv+2sKdXrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t8-00000001Xq0-1Lik;
	Wed, 13 May 2026 07:20:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t5-00000001Xma-0JQp
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso55689135e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656809; x=1779261609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syWeBTQoOGeqJPlWDI1VXqDojdsh0COwwri+Bm1MZY4=;
        b=doEGfzAY4oSYHr3NIEB12I78nk18/R5fjarGHBQDxYW2lgPRK8663ccWdxqT5sJ0vg
         sAT2w2PSAxYh+C3nWYHz6u3W+F+L18CsJmK0r1+PYGCUEowZsEKs2XQAGW7pwWlxR68U
         a2t57zGQD0sw2pvq+h/4LibOFJSsW0vwz78EacC4ZQixsBIukOf64sVtWu0PAcdsk2E8
         paiVLRSYXUlZRQlfiafBWZE2UDMO3ZdRCAD94X0hP3NIcN+PnZA3++u/GxXdgqBkAVRj
         FOlUXfjSY1w0f2iqh64JSbra1p90SuPPvkLxa4HlGKYU8RvQzaUW62vr76rxYVI0XUE1
         RCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656809; x=1779261609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syWeBTQoOGeqJPlWDI1VXqDojdsh0COwwri+Bm1MZY4=;
        b=Hes6dZjfCXFwb6KAC3IJ6EQPzcJiXJZ+iE98ImAPyMWghTjvgrfN29sJg2lpDHZsgx
         WQhTOAj/FTRcAvRuz5DOZtB9v1AuLhYp3Yd04F50pxGNSACfQyamD8ARhNueBDICe1OQ
         bQAJuYTXnv8ytybYdDoxDZAecpllFTq/VpwzVSG2/TnDvHqzwe8I1TYguT81ze5TaSaR
         EvtZduFlTfmGfM7K00u/Zpsohy4fIo9x33byaShNAcYV2GlHAOoyjHOZf0mkxzlyiUgs
         A4Cm9YoQWMv9vKaDwch3dbyIC6rnP7q40/0jv4IJhayggJn+uku2/+ouLjnPo+tEr2iv
         1qPA==
X-Forwarded-Encrypted: i=1; AFNElJ91OWIPrXoDtLW5MPQGCgbFuIUG2+1st8GIY/RY7Vnk02toR6XElKCMyzK4rmlsNmA2ffPgOU9AIeRGxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1vkNRs6h0MeWfTMwd48nlhbZqn68Y31RWHeJLi06eDNbfTHQe
	DNACsXKq8P6rTiAC9wzK4JN/lckC187YNDv0EsBl3OIrCXzsa2kBgKP5
X-Gm-Gg: Acq92OFAKtBsV/hSK79f1KpGyBEtuoEvdtykNcjW3VDTZr7HvF5U0wDy89SdwLaJTMD
	2Jc+FH/BkBCJJqv1icxjDmyLsKFmqDdn+mGw88YXomfuxtNNk2qw5Xcx6aAtzYXSxljl4yd9lYC
	Gv5u4UtL0O4omJq3WeWxWCS4Hv58DQj7WYEk6ZQdgy7GDgTYzbkvIHRc6ratQpul6V0bRTrOLW5
	hJrqas1d6ZFaVyLwi5sohmJVydBm6b5AmuQEmYTw2MoJED7zKOfL/vNbLn205wht92PuQ2kiYxx
	MdNZdXbRijDM2iQXQXGa6JNmcR99jXVGOP2yCt7rKZqKfYCgIj2PHc7ntGJk1mq8Wg81ffqypO6
	0BVl/yIrgzBArjjdUOl3L8sgxTBlO7xPaj0vnyZZSlpzfxz4A9c8dzLNtXC7yZQqs9PThzvz/Bw
	1HuA09gJFSohwTYgmg6kVEqCsVP1GiimAyM+vSLrQWpnZIB/Aj3QGZScx4rGBa2vKPpQ==
X-Received: by 2002:a05:600c:3013:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-48fd1c05f08mr5439785e9.13.1778656809169;
        Wed, 13 May 2026 00:20:09 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:08 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Wed, 13 May 2026 09:19:54 +0200
Message-ID: <20260513071958.29574-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002011_154944_A0934D33 
X-CRM114-Status: GOOD (  10.38  )
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

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 953c0ff6a0d34..ce7caf6950dc0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
