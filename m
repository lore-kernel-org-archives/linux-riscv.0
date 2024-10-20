Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF68D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xC+edDhGQVzmBMsMfoZV5RB0vbnEzMZ+g6yPuTSjq0o=; b=IO25UzyUHCU0Vs
	UmEiAmpDNSqnNs75cOZKY1BPi3oG2k/QVkp3n3hRz8xzAlBa5dx3144ZhpP+fn1CtDn/01iaYkhI4
	IbfPOOtHMitaFgHrEH/6HF90Eh9DOJC3M/3jjGUY0aB6I4dqXcEgH6YsTRfgrYFUm1nWJYBsuGB13
	auK4Bfx1Yxd88H/xnpWKZntPa/dtKKxW6A7OUohFGvcSlVva9jeYT4Z4SSMWhh1ZiBlQZEp8JAh0R
	I33QV57rLsQwHz2YwI3eJ0giEBPKw/gxs5hx+5kw5eplTbUYIzpjQ93HPwQPe0r+F46asi1CX7L2P
	9cAQXYTsrn9Yz7GJ5fFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2X2U-00000004ztX-1bO0;
	Sun, 20 Oct 2024 14:36:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2X2Q-00000004ztB-2FX5
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 14:36:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so2671992a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1729434969; x=1730039769; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKUwNFi+RGRukUqB0kD8s+grnaOyo0LZlXvjUDFIUlI=;
        b=T1oeSb2iHz92LiuwUU74xbp+nEy/olosnYr9tQGGUzoYlmDpj2txUArHI8l3Y/QxfA
         Lyf+UBzD7JPQrzVRVODvt2WFK0wt6Mw6SXxTugkkQDp/z38lDpqj7Gl9KsEqEnqEvDc5
         0WZYC4mNQq4mA8cq5Sk2j87Pt66D09BHB3/eOtd2DayMxq9ii4/iBzlZpxmmbXH23+va
         exhQ5vM4yM28Y2kurRLxKB5lFN2MNIfkH4lcEZP6WLJogDnxLa82JNPZewa9VyPIl7pC
         EwrBikwNm/bRvS8LyTqExvCUKifyaPk4xnhSQdVM+KgeIjSgmlZhyB85rXZpeYmKCe2G
         PbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729434969; x=1730039769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKUwNFi+RGRukUqB0kD8s+grnaOyo0LZlXvjUDFIUlI=;
        b=BpP0l0Z8fTZvpR/eju1b0GByAV3kn1nZjLJQT6Bk/gv9iPMfQ7SOSj5L/tcGHksQZg
         k6Z6cdlPkOtd98M3lA3/Tkc1UyPLl37pZS6c+4D7J9EY9ZeDdfpY5tDX827JDHNpO45E
         r2x5JbBXU3/0135eY0NVN0jBvpvr+hIMhAq+y5HWh/93MpecEgcJolRZ1N2T6NODZ3+4
         d5gdvsRx3x0G1H73OE5gVyIR8SFl9td25dWLp2yqkYEjgvCC4hnoYUcYaYJT1+rPEa9H
         tr6c++cIgCvjh8ieVVbe90hUsXBcFjewFteqNP2ZlAeTB4o1Un3/v51wyb6rSLM4ESoF
         kL0A==
X-Forwarded-Encrypted: i=1; AJvYcCUDX0Eva3cyxriyJt1MiVfVq7bnNDk/h22n9cucBRoXEs73LsSO9kpx+vfLY75SUeKrXULbNbwCSWMi5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUZlCLUYM8Vc1OHMx9bhL7f1mCYbnKf2uuxCcgWjBTDTt7RPto
	1mEpz9ENQLCxRl5rbUXZgF9QV0ZQlPEpyVERwubqGKUiBZOlEhQtLURvV8DYBjo=
X-Google-Smtp-Source: AGHT+IGJNYH1gN14k1HjiG8KMaOw8wGH7bmIO29hzeC6OSNwC+ZYDPZ5SQj59jaNoa9SfDiMXNrNKg==
X-Received: by 2002:a17:90a:e392:b0:2e2:cd5e:7eef with SMTP id 98e67ed59e1d1-2e5618d9edamr9931854a91.27.1729434968747;
        Sun, 20 Oct 2024 07:36:08 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed825sm1572538a91.35.2024.10.20.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 07:36:08 -0700 (PDT)
Date: Sun, 20 Oct 2024 07:36:06 -0700
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.13
Message-ID: <ZxUVVk9gWJAVrp0g@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_073610_868763_E0962309 
X-CRM114-Status: UNSURE (   7.49  )
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

Hi Arnd,

Please pull these thead dts changes. I've run W=1 dtbs_check and they
have been in linux-next since October 15th.

Thanks,
Drew

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.13

for you to fetch changes up to 2a3bf75a9408c40403aab39336274c8010b4c815:

  riscv: dts: thead: remove enabled property for spi0 (2024-10-15 10:01:18 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.13

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC. The
yaml binding and pinctrl-th1520 driver has been merged into next by
Linus W and will be included in the 6.13 pinctrl PR.

The TH1520 GPIO controllers are already supported by the gpio-dwapb
driver. This PR improves GPIO support by adding GPIO ranges and GPIO
line names for the BeagleV Ahead and LicheePi 4A boards. Support is
added for the built-in LEDs on the Ahead board.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Drew Fustini (1):
      riscv: dts: thead: remove enabled property for spi0

Emil Renner Berthing (7):
      riscv: dts: thead: Add TH1520 pin control nodes
      riscv: dts: thead: Add TH1520 GPIO ranges
      riscv: dts: thead: Adjust TH1520 GPIO labels
      riscv: dts: thead: Add Lichee Pi 4M GPIO line names
      riscv: dts: thead: Add TH1520 pinctrl settings for UART0
      riscv: dtb: thead: Add BeagleV Ahead LEDs
      riscv: dts: thead: Add missing GPIO clock-names

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 86 +++++++++++++++++++++-
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 30 +++++++-
 arch/riscv/boot/dts/thead/th1520.dtsi              | 70 ++++++++++++++----
 4 files changed, 202 insertions(+), 23 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
