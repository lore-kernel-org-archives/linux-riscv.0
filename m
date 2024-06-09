Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AEEC27C53
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2024 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMyp69qyQ5OVpfjU2T8ouq8/dXQtdMr6lWhzUEFPabQ=; b=wj1MDabFCYXu9/
	dpM7lHw+EPgehpMyWPk6cuTfJ2svdsTC+hEZWhYcQhns5khGDRfNfuQnkUUK/3gifuQp7JTehnWOi
	mJ9+zJAdeNovLqjjFvbAS38Gmy24vSiAEe4xuPWNsXzBlwmB99Lo8vJuAQ9+V2/L+minL4McXSby8
	1S1Vxo6j2VNVBGpMbhOY921fIzoqYtkpl3gD4WIV0MypU/1qhVWwmyYJccxOqs0jrlTkMVXp52Xsx
	SisGEE7+NfpOOf7ynH05RQYpOvZ+TiT9oj8G0WLIUN8FHomjxkH3rpvUao26qDH1jJ+s5Yf/pC/4I
	dZFClX/0EueuZGiZArMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGFSU-00000002Ma2-37WI;
	Sun, 09 Jun 2024 10:07:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGFSS-00000002MZO-2GUS
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jun 2024 10:07:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f8ec7e054dso2412822b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 03:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717927645; x=1718532445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1KQmgUjsSgxrwDmRsB1VpB7+C1g/y/pi7A9G0zDFo4=;
        b=QtiyD0jtwqXXb4FD3SH8/8MYw3RDQJnLjaPbiRIF59/S5uH7vTcyO26DnYNHwTaAiz
         i0VI9m2n38rbIOgyCXCl/nn/O/EfawXAIAQdSYrunTRGYi/Mes9aTC2PAA+2mgnCxz+j
         xoPyb579n9hrmgg98UeHYgLNBhh2hb/pXxPpO2a+lo6R9y3uzYjGjLemfi9YXmfWN+rF
         NXa2NTHP4z1z4ksTif5KZrNm7KzXdqzRJ4IBseg3ksW619HYgwZu4b8K6qPgXXKdTYyt
         2y06zgtKEVA+/SNZjikJDl7ADyq+yCl41u4KhdeGnTnNVGwTYDtahvHtgEImCszOCeO5
         jSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717927645; x=1718532445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1KQmgUjsSgxrwDmRsB1VpB7+C1g/y/pi7A9G0zDFo4=;
        b=qNPfgB5x3m+gjTPCVpAWXbk51o7j8zZxBWQjzJpDUsDY7w54TnbHWol1B8J0WGqxWF
         FSQCUzp+OBRl1SkVvmfpYB+Hz9jmrYxjz1pLCAmZeWKs4FESpB/iLUGrk5QRyy4AlCOS
         lditbBGyneD3rPsqamdLvFBki9aQq9WSvZIIlegQ3ErL5tuHsK4hmDTI03EBXbCfwEEd
         AytN1mboiitmzNLBYeqHVKWSjiZC8rC1dOd85Wb4jUsoo7+JaoTkJ7Ms971W6QFeRW5L
         QCYru1nwtSpy2nxvmWp3RTPj2x2wn7s2kMTZ2eAgKlgbAiNhxvcVsockwBPgfJlH/ctl
         7Ang==
X-Forwarded-Encrypted: i=1; AJvYcCVouDVWhvpeOB/boYi+J9gy9UimhEgpk5qrXpkl8eGpUVgeiffAQdrLepocVlhuaOQnqIFvKh+T2j54YyC+MlBhRjuyh9wPlvsm0Bhvwc2g
X-Gm-Message-State: AOJu0YwVsVX/1GRyb7CUT7wiWEWE5D6/10E59Gxbd+4eMva9gbwocrSv
	JwYYo8EH5cj8+IGY3BS0Vv8U/dpb/fMKFeT0S9e2UDc0JpT/5J+Q
X-Google-Smtp-Source: AGHT+IFnXhyUdifmCAO15Ff3pBz2EwzIgiSNqt12ifD8++2AaleAJtT7cLIo4Ej82lah3QaAY6MQ2A==
X-Received: by 2002:a05:6a00:1409:b0:6ea:b818:f499 with SMTP id d2e1a72fcca58-7040c6a58a6mr8264994b3a.19.1717927644931;
        Sun, 09 Jun 2024 03:07:24 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc9:92b2:ce0f:ca96:5cb0:62e5])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7041c78ac20sm2817534b3a.154.2024.06.09.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 03:07:24 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: kanakshilledar111@protonmail.com,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
Date: Sun,  9 Jun 2024 15:37:06 +0530
Message-ID: <20240609100710.85055-1-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_030728_621920_F9275AC2 
X-CRM114-Status: UNSURE (   9.30  )
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

This series of patches converts the RISC-V CPU interrupt controller to
the newer dt-schema binding.

Patch 1:
This patch is currently at v4 as it has been previously rolled out.
Contains the bindings for the interrupt controller.

Patch 2:
This patch is currently at v4.
Contains the reference to the above interrupt controller. Thus, making
all the RISC-V interrupt controller bindings in a centralized place.

These patches are interdependent.
Fixed the patch address mismatch error by changing DCO to @gmail.com

Note: I am sending this patch from a newly cloned kernel source.

Kanak Shilledar (2):
  dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
  dt-bindings: riscv: cpus: add ref to interrupt-controller

 .../interrupt-controller/riscv,cpu-intc.txt   | 52 -------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 73 +++++++++++++++++++
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +-----
 3 files changed, 74 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml


base-commit: 771ed66105de9106a6f3e4311e06451881cdac5e
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
