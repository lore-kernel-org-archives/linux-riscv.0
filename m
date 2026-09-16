Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA0AC982CF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rZOTlyCGQUqK7wQCHSngaVypor9R4KuWpe8KTeWWChY=; b=L1odobO/g5d0Wq
	jm5K/Y24PB24yYNPbPYlVej5byKRZt5pcAdun7YWuYk1qWrGm0hbrx8GUJsNsyUHj8CAbJJkvMdgh
	Yi7qxW46VBim358iIZ4T79foQyY3dbD5XV5P+D3kzzZXgTNaNVNFeu96PMXkD8jfPrQ2nXvWROy7d
	IIvgyeJLVxeBJQfr+Mj9ZKm9PiWehoBDH0iRF2tBFNY6h4fAMxgbeI2Skz2b2JMhpwwcmE9z/OGrv
	zH1bXGy1K6AQ6Y2FKWpDBej2k7ZmTiZEW4J32rBmqqfIwl51elUOJenZLkHfeOCu1Xi35HGj997sI
	7h7W2ffvHxFXTnUzSfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s9z-00000009gsZ-1ZoT;
	Wed, 16 Sep 2026 16:07:00 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s9w-00000009grm-3CtR
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 16:06:57 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso10925445e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574814; x=1790179614; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVlGdYNhNUu9mC7pDXKcspPVWpvSds0uyTHL3WW6nL0=;
        b=b7E9bXrikkD8CLbR4hCWEj8CkZPGXIOVQGvrkOHOzfVpQVqpVw0Dc+S2GB5CbMTz5m
         5TaKJG+ZQLBbssPbxTLOPxP/vzIWcpkVKEv7oRW+dfkt1oJ7unG2t5xdg8oEZaIKzTGg
         F3ciJM8exQnE+KKnhjsBHNa1lMCGug0Oj8kFrpBS15GpcIfKZyMR/VQlLR74YShNpDP4
         uPfwwYeMVX3rz1Yry0AvqQzR52a8QpaZ4BGfVO86Sq9wftGzoN9WBWpKNQUUSlbtTrtp
         dm/M/zZ9BYh0FiX+Juq+I2Pzhln05vVO2pxA85gchSc+okyhML9PW3U8qYBjVqyCfqcn
         i5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574814; x=1790179614;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mVlGdYNhNUu9mC7pDXKcspPVWpvSds0uyTHL3WW6nL0=;
        b=BNgN+CqvsX0Swaqu4ob3flINFOKpUDkORzeye+bRxt1lAJ4EdmmVQV43EJmCruJTp9
         KwcoaF9tab03sc1IdguMg1zmpP2puUSOoT4aPQLvFVpqexNJb3j/BBuNO8gZq8XA4+aw
         ayJHlyP0m2yEU9QcYyNoibMHiJYadpRecWHOm9KiGoBZunhx12docJLRX7pevUeh5ws8
         t6ES6/FQDjv9jQMQwoS/1EU3ewykTPwfnz19hzbP8uxN6iqSIz7BGooR1qnDJM8/EkPT
         n9aj1ujgNphKZK9ATwljSD9NNJXmjQFDtZa26Hx+I0qi+XlmUuEQwvv4KrY2huB7nVWh
         OQaw==
X-Forwarded-Encrypted: i=1; AKwUvBwRX6epe7AprqTgU1+j+dNSZajPp2ws+BIn2f8jrxMadCHU5Y4GtBI4VvK8djz1/2xpMg1PclnyMvUP/A==@lists.infradead.org
X-Gm-Message-State: AFuF++lfSAAJ63+0N87gqNlNQeGM0pJL+Lfk6AWhqOxl9mUdzsoGBNyQ
	++YqBS7emxVghKWj4fUCIw3E1Aey+RxY2bBUlscwaYzhBpgUzwEi2M1/Vt8orpXt
X-Gm-Gg: AYBFou2U/T+zMawnR/1C/eTAj3aZxVZVEjfS8QwbtTgkE5KFhZuMxKkBQgGCdEMkpWc
	Hon7JSbV7PlFMPbgVzIFNBUGyJr8c+zbv3s+Lz6O5cjQ9JYGrpLgKGsOml3ApsqqJHqfraYW299
	YnR4H1jyj+YzBEjoSIAcsTP0aIC+0HIXQXGj2QTen3nnLoQj1pfSQt0OS693Q8NDT7Tq+4eas8n
	uezhctUfCxHpNYoWeTho+HMVLIl7sYqgB/0Djs6cxEGcKfreo03EZQyTNQ0qTdiyCoz4wy73Ghn
	kcj32G+sAE1S+EAF9if+Ovr+6EbKpd8/EekdKK2k+B7FioIInU97l/k1JbBp0QHAzmGKMQWMduT
	7+qS0bX2GKr+S7ThWEeoQ5B+l5oK8yfNYUrGGuPWK7ksWiLeVqzu65bFsjMAFUV3BvjxoAb3eJS
	wOqCr4hNgeqXTLaJcVNCZxOk7JeJcnXq+LYcDJpmv7N/yjmi3BzVTvr8IY8UH2SNmfjYxH+H55C
	Lyv/DaOrnnq5WnafKrroEeML6srcbFd1iZ6qeJzXk0/myMQx/5mo4PHf9fCmprexVtwMN0Z/4rS
	lwrw3L8L+lN66CMR4Bi3354FQ/b4
X-Received: by 2002:a05:600c:4e09:b0:49e:7c83:4733 with SMTP id 5b1f17b1804b1-49eb733ae01mr38851665e9.32.1789574814009;
        Wed, 16 Sep 2026 09:06:54 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm49721625e9.3.2026.09.16.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:06:53 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Wed, 16 Sep 2026 18:06:30 +0200
Subject: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory for
 RTOS
MIME-Version: 1.0
Message-Id: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJUMWUqxgXQAcYpdTMAIEQ7
 m6V5Vv8v4OSMCmUyQ5CCyuHMSK7JND01dgRsouGPM2L1GYFeh7eC7o5oKJMQdGTD7LhvbJXawy
 ZW+0g1h+hltf/+fE8rXP9omb67eA4vqhb+xp7AAAA
X-Change-ID: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789574813; l=1124;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=Ff4OmfN8CYUiKKRCKdpGJQ+e0RrDjxCspxN0MFTfbAI=;
 b=Y+VhV+8jpUiN0h9+sYkxwnw3QWuHK4l02Ho7OkmUrd/LFRd0AdSKS+0TickZEJ4shfLFUJuOO
 2S/41WW+AZJAmJBHe42pAAri1S7qWDmjEQaA/IN1xNTw5NGVNWvhX2r
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_090656_829636_F91F6AB9 
X-CRM114-Status: UNSURE (   8.41  )
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

The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
Reserve this region to prevent Linux from using it.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
index 78a257839f6f..693c9fd7b771 100644
--- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@9fe00000 {
+			reg = <0x9fe00000 0x200000>;
+			no-map;
+		};
+	};
+
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;

---
base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd

Best regards,
--  
Andrei Lalaev <andrey.lalaev@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
