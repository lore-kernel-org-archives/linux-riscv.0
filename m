Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD3FC27C6E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 02:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZkAR9SuusPdBL9tEn2+Swwmchq2zTa6xLiRIBOSrwE=; b=08MPT21T+08CaB
	XB2Kq3j9PFEM7oB7/pQrUJvEq/EmywDizv1cKvy25PU65bZlHj2l/WrbJCQCSwygOttm/Xvb3jMP9
	Liq6fRSbII/EPDfkJZSKWQJ6cVSGLNUpsSru+EmO2VSnD6y3+nhbj2hJkTDKSIs1xnsmaUohX1vvI
	sXVJsXdm0sXhuCqjqQ1rHX1j2lxBdKnO7XD8aDW4ho1XaSuTnyZJTB5f1YdixY8pKvP7XeN4pazyX
	V1tdxKuDxVYzWbY/VEZQGqt/PayueM8fKer0vMVNLM2ZPIUDN+a3sUP3JS8BeRsUGddISINc4EoDy
	vj1JBQmxZbmAZy5XRLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIIwv-00000004TRu-0eVN;
	Sat, 15 Jun 2024 02:15:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIIwt-00000004TRV-0F0s
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 02:15:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70599522368so2089783b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 19:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718417720; x=1719022520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7u6FwRIze0mtb1uqHOlNNmcMAkHqxJeY/UMRB19/D0=;
        b=SBiahlsBwp2N6aa1NZ53NR3sEahC3MylwzTVmx+JzXL9GA3xPM1ONrZKqj5Pdz5Ui2
         8G5tZcy7YyyWDit82Blu6cZQpIuO/jA9IsdQ9gDF8OML213qOKochsoXmPh9GVXtFJBg
         WOJPppW8hFBqOcXX0IMQgtPOHi8nS7VjqRjvvv0bcv9O/DQXeuNNq5Dto4KWXDPIE7d7
         LqUfoTCfHnMW5kQV/eD1IYejJgo1E3xNLVRaTKGedFAZZdm86NzYVqB+uoLucmwkvlMp
         +GxCWklBE406OjjJh8xi2J54vFbuxULJJBuok7/c2i0PRPiWYQ+fbCy2EPEo1T5Qn5sn
         msyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718417720; x=1719022520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7u6FwRIze0mtb1uqHOlNNmcMAkHqxJeY/UMRB19/D0=;
        b=ID2KFUipU4hp2l/wv41B/iqsxqhpNL6mkftrd4TbYxEybyEynfe5Reg8NascszGsPp
         TyNCnIoNtmOzihQZQqZoDwb/z3+N+mE2SyGySIXd6X233rIdb+4jXSGPn+KtVRmuBhyB
         /vxDATbTDmcutX3+50L8QPU0z6jCSGYudfsNxzNaCgwQIx1iTr3obfftf0Umse20W2mk
         51oyFiNVcL2B+LgzSPDb6PDBV70l7LDmLdKvV6aCA1rYjOBdPJ/Pr0ZY6dEW+hhqO4kW
         5OuW69ygkXBTAC+d3iiAn5kpPf5PxCSVG/1xwwiFE5wqgRWk5X7pr+bWsrFwTZYyvUYv
         DVwA==
X-Forwarded-Encrypted: i=1; AJvYcCWx8yja0PQocZwXphwu/OBkxlXtlZaiTIk5cH6yH58CV34QiNvpat6edqf1hAtbnsy2DNgasiSWY7UtyrfxqGJdyGroBzYexZVGg2n0ZAUb
X-Gm-Message-State: AOJu0YziAUgoSh4+2tYjVNJc83fWx9qVxMNOystXWrQzFa0vDMrDw6ko
	BZaU/2FmhH8jGDADW7k4MnJC7PknSXiAgLAjOr7c7Ek3U+Ei742Y
X-Google-Smtp-Source: AGHT+IFb+XtAj0x7xV2hM6qD+3rb1K/g9G0r0SHeazDyGKQXtVdqRoNXUtEHvMz+q5gidKnOdai+oQ==
X-Received: by 2002:a05:6a00:22cc:b0:705:9f03:abbe with SMTP id d2e1a72fcca58-705d71d249dmr5373091b3a.33.1718417720337;
        Fri, 14 Jun 2024 19:15:20 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1c28:4b16:65cf:ef28:5753:2be4])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-705ccb3d2acsm3717839b3a.124.2024.06.14.19.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 19:15:19 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND v4 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
Date: Sat, 15 Jun 2024 07:45:02 +0530
Message-ID: <20240615021507.122035-1-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_191523_138591_37D2D23F 
X-CRM114-Status: UNSURE (   8.66  )
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

Kanak Shilledar (3):
  dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
  dt-bindings: riscv: cpus: add ref to interrupt-controller
  dt-bindings: serial: vt8500-uart: convert to json-schema

 .../interrupt-controller/riscv,cpu-intc.txt   | 52 -------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 73 +++++++++++++++++++
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +-----
 .../bindings/serial/via,vt8500-uart.yaml      | 46 ++++++++++++
 .../bindings/serial/vt8500-uart.txt           | 27 -------
 5 files changed, 120 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/via,vt8500-uart.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/vt8500-uart.txt


base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
