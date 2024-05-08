Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7FAC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I87F+3pYjZJtkLVu9PVClWibbwih4VRSuPtlOwJ1CS8=; b=GF17i097QJCEmW
	Pujbquc8gPNVppA8aN6mJDNTFq6xU8NoeGZwOtsYrKCWTmK6gFm4lLDQV/VDQCvN128nILn0pHcXo
	fJi+9abWQYQujG9QeF+3oPpdqI9owf8XsOXDK8GqPXxKJVV9vpJnlJhEQrZyGoDVCwsTiQ9WHkQ+K
	HO12WzYesxHDb9R2X1xcyDZ+u5Fe5SAzeh8qOxZsPBDoalxfUFuUHZdei//ZZGEWRQA4HOOYu673w
	y8Bi2dH2Eb30cnj4eGtMl7/I7U1WghYgc5mdKeM5m6Efw502HUQXFHcaJA595vcx+gUamlc4tILuI
	biFQZ4gTEA1KjqtIhk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fHS-0000000F9rX-3VQk;
	Wed, 08 May 2024 11:16:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fHP-0000000F9ne-3HfM
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:16:13 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EC46F40AAF
	for <linux-riscv@lists.infradead.org>; Wed,  8 May 2024 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715166967;
	bh=ttExS1UnS2n/6Qa/JbmhsWywiSSPxbOTQjuITk/gJkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=VBSvWMAqZNIczhVhmATL0ddvXieeexQtAVda9DDyaCwBiME+F1IBKO251J0cD0loS
	 obVIsTkqNg80UV5bX5ANvgoOyCPMrx5pfa42iCk/PmQPn5eVrVHz6TVMxgwkme9EQi
	 YoNwTXzOMrq27Supoyrt2q3ndEBFR2aL4VfniCgo7dKIIvYwxGoqYXQL3POKwbLcpi
	 Xk/DjE1VFxMb85vYqtB90oUqWkyMMokD7bAHfSOoeZKc18lXNBi54BrJVqVY8Uys6m
	 vlshjVID34G5yvOU1SmhJbnBKUsld7EJqKbmPCiRmoxldnF9MSEI1rxBISYchay8rv
	 IDTMsrVB/tIMQ==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso1596646a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166966; x=1715771766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttExS1UnS2n/6Qa/JbmhsWywiSSPxbOTQjuITk/gJkg=;
        b=oDoM/jkgGzpfPrHKc+riTjqSs11lUD7B9WyNd+I/psKKoaApzqRIzEc/AkzfjCst5I
         d5lhVPLBbubbCjtaeO1eQ23frEUrp+6+UYq7bTeWZulTQwgciCEb9KgFAl6BTf9kzsvN
         UgvAWFl0Zi6bjep4yZYNKZI9h48HCniroXaXnNGHWrbAEtAhPOcGLyDq8j8p7iRNvu3L
         Eo5xBmJEN9WpTtMqNMAqxkNACb2WfVdhYdzTEzrIHuWuy6Xi8/K4tiLsHNbsl+kvDKgO
         gRGYg1t9007kfzJTcCNWJvxptrUJRDcTqTdPpJ/OGmnJyaGxPje7SIDBkjL6v605M7/R
         T+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1MuzT43XJOI7zQv/dtzFPayGxgsY1x5C9UIiK6woNr06z8Ybn2YstRJE2bfA3RlnbtxWDRV5StFs6BGMhhkqWJTkKlg1weJZ2L8muyjan
X-Gm-Message-State: AOJu0YypoLHeOW9uCMh7L0YvqtTuLTDE1N64AOMUgkLUFjvlzk7LEHL2
	2/n7fisBPheMnVmZwQrYqjfEtICL2KYkkkwq2FDOGA5Nf8IEIfJs4lz4BWhHSqZ/wNoKlKQJxiI
	1PoJBUnaN2i9F/U24hSIEk/H2fD5sazvjaiEtbcfYCcyHpnhoSmnGl7Dwu5dWEnyvV2KKzMWDIu
	/CL7I6eQ==
X-Received: by 2002:a50:c04b:0:b0:570:cd6:8ef with SMTP id 4fb4d7f45d1cf-5731da68e1cmr1841378a12.29.1715166966627;
        Wed, 08 May 2024 04:16:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/zJKBlzUpmhPRWq2mnEwWWSWQxatndRrGKIq4OblBhRgcWleGjKshrbRBqa4BNQ8dbb/k+w==
X-Received: by 2002:a50:c04b:0:b0:570:cd6:8ef with SMTP id 4fb4d7f45d1cf-5731da68e1cmr1841369a12.29.1715166966301;
        Wed, 08 May 2024 04:16:06 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:8ce6:9eb:cd7b:fcdd])
        by smtp.gmail.com with ESMTPSA id co22-20020a0564020c1600b00572a865af10sm7513556edb.44.2024.05.08.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:16:06 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100 boards
Date: Wed,  8 May 2024 13:15:53 +0200
Message-ID: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_041612_268749_6FF2789B 
X-CRM114-Status: UNSURE (   8.47  )
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

This series enables the in-kernel Bluetooth driver to work with the
Broadcom Wifi/Bluetooth module on the BeagleV Starlight and StarFive
VisionFive V1 boards.

Previously Bluetooth only worked with some GPIO twiddling and a custom
program to load firmware from userspace.

Emil Renner Berthing (2):
  riscv: dts: starfive: Add JH7100 high speed UARTs
  riscv: dts: starfive: Enable Bluetooth on JH7100 boards

 .../boot/dts/starfive/jh7100-common.dtsi      | 49 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      | 26 ++++++++++
 2 files changed, 75 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
