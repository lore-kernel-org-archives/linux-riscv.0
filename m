Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D80D0D7B3
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6YrSIDIeFRUK3e8O5PlJso/LvljF8N6aEhLzBlAK9uM=; b=iz0A9/P5A5A5sp
	DwxvsOIJNW5ISdXUQxn4oaHC37M9AJE9WBX7jfzFJs9kAFejpBxHcAEHYPlfs54TMK51/0znkkXuK
	wXBMG2EFEDq+Aa0LVZqxChE0y4gG+PHXZsh1Nokq8WuQQh62eJIDI4sG8p33xBnqmm4J0YF9r+yRn
	43Ch2XXAj2Td++oIx4JSXobBJeG1VBLMFK0HtGSuWOXPgbP8mHrBMi57+7wsxO1xFeffM0fFCXvOL
	fowgSAL5XWcYSQjwL5T8RVAjs7gdrjv56ycHxUst2R8NDpRj3xw2GsIE4VqBP2BN+cpS4hoiihvJ6
	R4byNmkFUcw2/xQTGPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGzk-0000000Ggr6-2kjS;
	Fri, 11 Oct 2024 14:51:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGwS-0000000Gg2i-2F6e
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 14:48:34 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E942C3FA4D
	for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728658108;
	bh=ZeYY7hZCtG5ZzblFqjablxTznhCvL1wjc9Tgelu4NWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=q/M4lEjZI4uRSEKV2YVrad3D5aTpa9UMtcvTsildKLkO1OGSVGPXFC8RxsGhLTUoB
	 nvf28af8bXmetr0yFJARdzM0GmJOxINTXR1HoJTWI+VAf/npkOzrfvlIYGJ6c7X9h0
	 4O2KmbFaQdW90LDOBAl7CNJHy+RmPuIzixmz1/VSu+byQtJaIW+nIA6SfUud1pehEg
	 hstbOPlG5DQEpOVbpF2gFHeF06TF9399xH1h/+mVtcljmX60b6KCALFkHczRAFa5Fk
	 +x2T2I3+iRy8s7nWnintAFDO9EixBo78SRrC2LOvzmnQ+lZz1yypdi4IuxkUr+DM4N
	 MgFGqBSChTLeQ==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99592b5f27so329505566b.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 07:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658108; x=1729262908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeYY7hZCtG5ZzblFqjablxTznhCvL1wjc9Tgelu4NWY=;
        b=sMTCqBaSJ9TIYzO74osMopc6R+I4yXevqUtAP0U2jBKZ5T/7NlgSlahjP2i30CdWVq
         K5cTmYG5PpcZ6jNn0g+kxacBwyWlfUGalMDiEWWFovAnw9qrYKRdazC9NtW/e07uHmi6
         agSH0/eZrcUcijVvXjOM4wv2BHSB8IWJRw72Dkahs9Ddgesr5vlSBcu/KeOUEKdzLFMg
         Hrk3vm4IEhDxLllBd9vuQ1hA8F911I3nvnqp1GjagBM6JqRo6+FzC/noKi2ES1SJ/V6I
         VINUBRjmpdJ3yFHAyHkQmwRkuopXICDo6B7oBCZBX6l301V0lIwLCyCyU+L4zMzfvEBJ
         zRjw==
X-Forwarded-Encrypted: i=1; AJvYcCVRXXIDEZqeTxPHp2tkuibvxpq1F8YDX7xVrGGkvGKG4c4wigoRXrvv6bc7avfPW8Z4H9XoCoHyrF5ejw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBMGkwLtTwZWuxieQveLShv8BJ1+V6JJbOXZ8+QfHVdXFGDsgY
	xQgvjB3xpF5Km09jm/JZgfOlA3yu4v1js/AX/ZYBIcGal8ZzR394FsuLzYjxQLAWSG88fK953OS
	yyfkpTlBBDW0SwG+AqqGcmZqk1kogBPjYmHDLvPGHhv815n5zKBYoJWlU2ZWdH9PimSDac/UHZg
	RMeh4C1Q==
X-Received: by 2002:a17:906:cae5:b0:a99:4ad2:acb7 with SMTP id a640c23a62f3a-a99b885cd31mr293766366b.18.1728658108448;
        Fri, 11 Oct 2024 07:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZJ/O4DI06C56//3e90y9WubgT52G8l84SnKYNplOkm6YFyYikVWRaSx0ajYVuWo5Sc8h+Ig==
X-Received: by 2002:a17:906:cae5:b0:a99:4ad2:acb7 with SMTP id a640c23a62f3a-a99b885cd31mr293763666b.18.1728658107892;
        Fri, 11 Oct 2024 07:48:27 -0700 (PDT)
Received: from stitch.. ([194.62.169.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99c0c89bfasm54134666b.162.2024.10.11.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:48:27 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v1 0/3] pinctrl: th1520: Unbreak the driver
Date: Fri, 11 Oct 2024 16:48:22 +0200
Message-ID: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_074832_798161_98DB3911 
X-CRM114-Status: UNSURE (   7.36  )
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

Hi,

Here are 2 important fixes and a code improvement to the T-Head TH1520
pinctrl driver that was either introduced or missed when Drew took over
upstreaming it.

It is based on Linus' pinctrl/for-next:

  6dbd1577b7dc ("Merge branch 'devel' into for-next")

Emil Renner Berthing (3):
  pinctrl: th1520: Fix pinconf return values
  pinctrl: th1520: Update pinmux tables
  pinctrl: th1520: Factor out casts

 drivers/pinctrl/pinctrl-th1520.c | 52 ++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 20 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
