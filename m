Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30592C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 02:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EXHXvh9wO0ea3DwfFkw5mdB/G54BWVi+PgJG2K0rp8E=; b=LzDc7hzXOo4/AC
	8vJ6/PRUER304Pnv2PBUG6MdALnmvDibw3BbpfHWB2G/1CGOZHmn5MNI1My0aCpzBbVaJcP9ZRhHL
	MI41smekl9h6OO19TuHixENy0tal9iHB0je+SjoKacsKdmw57VpxRFvPTyk4cZKqOS908yc0MthCX
	nZp4+1Uhm84vGsJ7ZXdDGABFhvjf0hh/VG0fJPOWYu4qhuBiA+W2RuunO81bybzwDSrpBPpwzB/hd
	7wY6O3bcxQubqHdYs8UZ6brlrV9bUeFsBm+WCFBvU5GDM4wiJzX0xq08S4htdyaZQ93f2I6ZMo5jD
	sPZjRR/KbVhyyaEqV7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9Ut-0000000A0LY-37Nx;
	Thu, 03 Jul 2025 02:16:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9Ur-0000000A0Kx-0o37
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 02:16:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-237311f5a54so47345375ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 19:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508980; x=1752113780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b73IFjduWMb1WKYfWwZmDk2oXeQfWsAxTJaEVv/UhN4=;
        b=g6JsaRyp2UfjD/e4f4/mSAWeVBmZlczmpSYAA6ZlNP1R9U2t5jB4axPvCkKwB3Abh1
         ftX4vTZ8IET+HmMQxQLn1ht7TNEoWW2rRKpeVnzihUuBKxgg4LYQklw7b+gOm/tflS07
         iVasRzrkVB5h1SXv3XCf4MyQZIoJLXYb16aUid/BNuSwaqgks7NC4WLMmClDzBEjO0q0
         jusFjpsuoLqaoq5srRJ8UA3ls2QeyhYxfyX8kVRuLEiv88RUtslibilH9BCDxn9xYdma
         r7n9wiQzsGMv3sTh0TZcWjCIOIC15OYGAsPrMVJDYBIQ1PwJgQRlH56MfOg8CI2W+RJN
         cXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508980; x=1752113780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b73IFjduWMb1WKYfWwZmDk2oXeQfWsAxTJaEVv/UhN4=;
        b=U4ZcvmPY3MJ8BdqhUnhKBdmOPBqVOpB/yAB1XbZdpmcrhG8czU+LdiJtBhwiVTa8pC
         2SQOheyzHO9NudSV5i1rMhbQ7UXtNa7STo/6Kv6iB/Izx0oW2A4VQLELAsakNa4lvTtR
         LXyIn5Lu0F/C92k39C/2R+b43kbQMYQr0Gr/VnlOvvmCAcofeFO2XWusEoDP4sZIEY8t
         FNbeg2sVJnNrfa+wc/lFlvrrGGnKT7m+dnh16Gy3DAo+XS1zzEWTCVMxnJaMsFiGk/V+
         YJmuHekC3wEXe1v+O2npIUY2P8Y8oiSAuJUtTnoZlkb5a7uyQfTLk3BtsFu32TPHxvh4
         B0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW3fHOZNecTOjgPxcX7mVnGGtLp79/RsmeRDpNI+Gz7b1b+rlpP/HtHH06Un6RpNr4Pem4dr6eNiSsRDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu9W2BlbzFxjUZlbTWlZKfNg2Qll8vUhS6MUyZLO7P/ihke6dd
	c6Ef5QnQtffeeYTV9gs6edE0bDOln566uqZeuj+thVoOx4h7XuT83BCZ3xtzaXfv
X-Gm-Gg: ASbGncu3+TZXWcl3ojvvPj4BRCoL4vafTS6Zh4LTSlZuGIP+C4h+/B7UC84VXt6IHHi
	FdjkD6xLQTJJNb38goN9bhOTLbk0Wuhouwk+Ps0qQuc8HTb6VYkc3ZaRrJaOrFA7FuAkT3X8NMS
	H4DccliMLTe5mipTWM9xnhx+pg17TIimzOKDmZbNKW7jRgHe1KBXFmsWxo/K1+KQ4lZAeL8Ew05
	Mg4PP8RPA41Fhcpk1a/ICcijZR4dVFZ/Jw1fzSI+zbzi+PXdXW+paDceRHS+s1UGHNQmU3dFIf7
	QiigZ0DeSIdwaOFuMeczFSm4bFKpibIL2lhKOAI13W0nqTYrUyPtwzEOki86Zw==
X-Google-Smtp-Source: AGHT+IF3aWQEIJ3OQUGSFDn1pwNfNUpQyfdxXnfcNGViNxR2eItFwHBlfmUboW2xyi3NlJBMfC4t4A==
X-Received: by 2002:a17:903:41c5:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-23c6e502bbemr72113865ad.16.1751508980315;
        Wed, 02 Jul 2025 19:16:20 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2f2557sm139107235ad.83.2025.07.02.19.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Thu,  3 Jul 2025 10:15:55 +0800
Message-ID: <20250703021600.125550-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_191621_232281_453E2496 
X-CRM114-Status: UNSURE (   7.50  )
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

Add device binding and dts for CV18XX series SoC.

Change from RFC v4:
- https://lore.kernel.org/all/20250701011730.136002-1-inochiama@gmail.com
1. split the binding patch as a standalone series.

Change from RFC v3:
- https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
1. patch 3: change internal phy id from 0 to 1

Change from RFC v2:
- https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
1. patch 1: fix wrong binding title
2. patch 3: fix unmatched mdio bus number
3. patch 4: remove setting phy-mode and phy-handle in board dts and move
	    them into patch 3.

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (3):
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Enable ethernet device for Huashan Pi

 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 73 +++++++++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  8 ++
 2 files changed, 81 insertions(+)


base-commit: a3d69a2aa44f50fb09f513bd2b8d8c91fb175207
prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
prerequisite-patch-id: 52a475a6d4f8743011963384316d9907ed16d5a7
--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
