Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8213EC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 23:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHMvulBTPp+0O+agspqSfvI6K+eJyAv07gNJzaiMcDo=; b=TO/myBcOdaGhB6
	uAJb52CLHNNM7aaPH34H9JnkSawJkWUCC6SKpbU3RJyrHDlRcCxMb8VFk5iaTiEZcw4eyNhcq0wQp
	ZZ0aNxaXgAyFujdncM0Nty4Di5dE4R1w6h44q01b/GM6b1x66a6cHMIT4SRwva3xybCerpuent7t8
	nXzDQ/u6FIHNFw8nbpz5E2W1sYSnX3R39sKtpOuTzYavCGSRsx5yk005sm8OZCrXxkSH3jtjkoNUZ
	E04jEhuRY+3HmB6fPV+grXyx03iyxfFEcNlxA1jyeH10YdekX2cqGFxkpA8GgTgTMLRpIbAyLCKyp
	Gxp7BTyky7+JwMkz1fOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz5H1-00FGbO-Cf; Wed, 08 Jun 2022 23:39:39 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz5Gy-00FGb3-Ek
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 23:39:38 +0000
Received: by mail-qk1-x72b.google.com with SMTP id d23so1819084qke.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=kc8hDtKnDcjkjtnpKv99miwrNZ1mscnVCOSjHJGhRR0=;
        b=TGdTe8ftgW2E2QSXLDATWBAXq3sauk3KYSj6BMlJLGO6AIyIfhb5n1gjvAikC5sfj1
         pnF2q+aa3J49SlWeHoe8utIJbft2tfdvJWfSA/DWdGmQ81xwpFbbShsO99rjEfX37VOJ
         O7nf0OOCHhgW59XOZB2AYutoUpxS75uohsXNuBYCQ74OZWV0IkfqStkyQpIXIgp5Yu/X
         /b47CaBvS9tF2RvKGzD2OXWMoCKHHF/JqW3mtCMGdzWVyYoNxEJonBGyxomdCDOnzKP5
         Wm0OipG0BCiWNN5Q3OyAx5VK7fAStBf4WuoirjR9Gnpdd0r+CJ+NosZexvzLXB8JwqtT
         YXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kc8hDtKnDcjkjtnpKv99miwrNZ1mscnVCOSjHJGhRR0=;
        b=XhuEOhwIENEgiwHdT9/RpJoxt+Qfp4OBHLqYrv+msfLBmflqF6RFZK/NBlBeYKEQyx
         iD9viOuNg8p4KEJTpCgGhAKGo86B4shZPsxUeFUKlhwqfztd1hGebDh8B0PuzTQWd6p3
         ZJneUUO6AyxZSr0vA6trWPNBRe92FgU7GJHQ+K+pXKSAS1feME1AfLwU40YMF8s4FhhD
         PUlMgIj+w5X5YRstwoijNWbbd08za8s7N8pbsPqZWuEFl4T/0VXn865bH+Lq70SRLT2C
         3bjl1nFduYMxrjuXihMYI8+NM0UitAmhbgtRx/Rkl7WAcMj3mKqU97bzxLc/BAZ0gi/h
         bptw==
X-Gm-Message-State: AOAM531k8AADxpbm6gfXBpEYcCZ7q6tBe8PbRP5xQHXPGaCA7Bh9FGJu
	HsVDCExFubhdtw39UpAn5Feyd7dSGj+8+WxWYHAofg==
X-Google-Smtp-Source: ABdhPJwwoi0drQjkYJ1j2Qdt6XiU3x2RVVqapgseeDGRMrMmyQCzzXLwavj3DbqQ68d+IFyAWbxsz4ReHsk+ofIZ0q4=
X-Received: by 2002:a05:620a:1911:b0:6a6:e8e9:70cd with SMTP id
 bj17-20020a05620a191100b006a6e8e970cdmr6816152qkb.627.1654731574196; Wed, 08
 Jun 2022 16:39:34 -0700 (PDT)
MIME-Version: 1.0
From: Atul Khare <atulkhare@rivosinc.com>
Date: Wed, 8 Jun 2022 16:39:23 -0700
Message-ID: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
To: Palmer Dabbelt <palmer@rivosinc.com>, Atul Khare <atulkhare@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_163936_754369_8DCF873F 
X-CRM114-Status: UNSURE (   7.10  )
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

The patch series fixes dt-schema validation errors that can be reproduced
using the following: make ARCH=riscv defconfig; make ARCH=riscv
dt_binding_check dtbs_check

This is a rebased version of https://tinyurl.com/yvdvmsjd, and excludes
two patches that are now redundant.

Atul Khare (2):
  dt-bindings: sifive: add cache-set value of 2048
  dt-bindings: sifive: add gpio-line-names

 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 3 +++
 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

--
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
