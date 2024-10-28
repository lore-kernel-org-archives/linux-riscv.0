Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61467D13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O2uDbsgigM2gWUiM71fWj70wUlZZxytv7TjhjrGKGSQ=; b=0lxGh0BwCfdGfh
	TPki/CuYKtTnBG13HDGCSS10cH5BR20De4ThTMm7BtCPlN3xIKFlf8XxpSq/oNZltz4afejsaHfqq
	ixpXwHhjeM3nwJVwteUUR+hZTI0i3lWUg4dSzQVliNPNSWJQuO7GvKxoqZ+yOhBuXjcPuuihnaREU
	m1Z8+ahB0fjsED4ukQfK7+5ff5jlNLfDlnJF9PsxMyEr3dQ3j7Pel7hbFl5zenSfuJjHDP+sOjLax
	cQbJZur4OejNLDnsVOqSli4MWwY0x6ysN/q3cGAnzrjtzL91rBiZ26y0ydGiSoouxKOw+nhinmfv1
	rm+gJWSD6+2V7cbZawGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K1m-00000009qF5-2ZUT;
	Mon, 28 Oct 2024 07:19:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K0z-00000009poP-25lf
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 07:18:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20ce5e3b116so25161275ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 00:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730099892; x=1730704692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFK9QgQch5Y1qO3mwflyMJcISzoRrthQ8irm9r5w8xg=;
        b=i/1e/MTFg+0l0ndHZZXxD1ma0MarW/42MaSRX6oet6dIiqrgIl1gr1UxoIuPjbtmW0
         LNYW8+Zqm1uMVAvdPLFJ+MMcNWmFFWkhhWhdruGmvB3Bxs9RD/jY/gNIZVWvhC5KhMBz
         PS+1ScVLgsLB4JDRpThUiyQHwqMs8YRX0olfF/yd6ZdW0JuIOpAWhpO+T4cL+CTElpvD
         Hx8I+Cwl0RlcmizOAl4Kc0CS1jc2ZNnhqtAy59WXM394w7kiN92j8nRMN4N/6gzeyWOk
         6Lo+doeueYvf+MQ/a3U+oriogiobdArtVDkU3JM+TxXQaWPd8XQ3kDBRLH+6GX8XC9sS
         aH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730099892; x=1730704692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFK9QgQch5Y1qO3mwflyMJcISzoRrthQ8irm9r5w8xg=;
        b=OofqEryrIkuWzl5Kt1mgrNsaEGU4hQk7ZWbJGZgrfZ/ndnYmdkDJ2Di1xA4kN8qrcX
         EDMhQkNW3DYomfyFpR4XheKKIAQ7nYloSZWEN9KtxQi3w8MiqXfsONCarY8jUHMx4xYd
         HCQNwu/qYnhOWpDlvyZFRsC7gFlgrX2Spy9iVHopjzKii6jBUnJMIxiBR76ze4Vul0zH
         dIYl20w4Ss2vHJFdeWCbwM493ikCkIW/l7H+o1P4U8FFKKwy3xp8XkTVT4jsFA/wplJK
         G6iIgxDY6pay8zraw8tQh4WdKIWGsZawgGZ1w+rtgFLQCZ6phOvmLdsHLInz5HSZPAx4
         NJpg==
X-Forwarded-Encrypted: i=1; AJvYcCUqAAwPQ6eOfDG6gZRptWY4Eh2XXPnDo7mEb07gu8sd5P+bDR2T4U9JhQYNelbl9X+j/pN/93zD//sOfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMf79b+W6ZeC6lBBPVbdrJUDLplpEkrBYm2ylGtjRiGePs5P6Y
	6IL6njph9j4f34tJXsPGDlFwaP8iKlY36xmLPpb2M8goABXWENUF
X-Google-Smtp-Source: AGHT+IF5zvjva63HLowzIR2L4PHJfI+OR3LvQ6Kj85nWhHFdlhTKwCdt+x7mVDWbi9gzrdD9pLMkMw==
X-Received: by 2002:a17:903:124b:b0:20b:b455:eb4f with SMTP id d9443c01a7336-210c68d2932mr99261095ad.25.1730099892430;
        Mon, 28 Oct 2024 00:18:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc044f82sm44974355ad.258.2024.10.28.00.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 00:18:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] riscv: Add bfloat16 instruction support
Date: Mon, 28 Oct 2024 15:17:40 +0800
Message-ID: <20241028071746.869740-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001813_557545_F0EBE048 
X-CRM114-Status: UNSURE (   6.84  )
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

Add description for the BFloat16 precision Floating-Point ISA extension,
(Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
("Added Chapter title to BF16") of the riscv-isa-manual.

Inochi Amaoto (3):
  dt-bindings: riscv: add bfloat16 ISA extension description
  riscv: add ISA extension parsing for bfloat16 ISA extension
  riscv: hwprobe: export bfloat16 ISA extension

 Documentation/arch/riscv/hwprobe.rst          | 12 +++++
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  3 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |  3 ++
 arch/riscv/kernel/cpufeature.c                |  3 ++
 5 files changed, 66 insertions(+)

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
