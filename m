Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BA5C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tvl7kZCrXfjuqYDlDFkFktz1mvL8QeTRu+p/fdgDOEc=; b=uzBwixC0iDbrjH
	+QJAQZUkQFrq7laigaPRs4iMp+VATZjNYS9KLBysrALsnSqkkCssqP5zoiW0Vn00w+REtMCXNNIs1
	oJf88r7qK5v0TwSwDOACGcFNhhaysudOBLRRqNlaOJ3IYPbyIDdK2egDBN6mMg4Kms9Ft+UOpSEnN
	AGY8iUBGOQV52u1a8w4IzjC/fhhxPOSICFp9o4tnIfA0Lzs+1Vl165Pr563uLQ5dLDITFIDUjLtM/
	xdnHTgGQVTf31PXKgovN5PrZYltfvdlyCjrLIO3q5gWis4jtZgcQNlBhOJbw0WYsdLd6UCTbYik55
	KkLBr1ut3Z0XIVNMV6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghE1-00000008BYn-1sUC;
	Wed, 21 Aug 2024 09:01:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghDq-00000008BWl-2cpc
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 09:01:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4281c164408so51159335e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1724230900; x=1724835700; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqqM9bltdl7ERWZlDB/xDu0XlTf9F8/Bo40tfa0qccE=;
        b=HtbT44JlfotWHGClivFkRvZu4cvTgm6KS3EwA3DiBEg44GirIk++d4My6tGEeQGg3Y
         1Re03iccBcxSQo3wQHXNkeFp3klN0ZjxXKDBQRMtr+eS8JBF1P2ercf1AGaTZ4/D7Gtw
         a2YptOeO5HHq69UgrmZoYTt/0hxxRv0P6iw92XmghjwH5jZP3XwdXqeuKseOsjOX8XkI
         d8Zy/sj4v1fTj2zyeBuUCgDOu+vONVJ95z0L8WnypUQXEjPXVAWeuBIBtOoWx3S7USMH
         ZPnHAnh8TOEdg2mQzvOGGNodRkbY9bjLJkPc0npEiwJghFtxXEG3+FhIdWkGwHrBojBd
         koww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230900; x=1724835700;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqqM9bltdl7ERWZlDB/xDu0XlTf9F8/Bo40tfa0qccE=;
        b=tYeCbYL1lGMZB1Fg8V8hrJIyYnZnbln6MDYpDD4Wk7p5rQUT9LbbmuVUAz/Haf9y3Q
         28kA18ccuhBivo/Rvbibk2UAOG9UtEhvcYWOckntDIum3yT6zBr4IABNSRK6XPOaaWbh
         6ejt+Mnff1XEyneRP3M5DfysHfiqvm4tYOuoE6bOm/kJrV/J/tcRC7y9Pm5mWzSUOUGr
         uciW3MXCh25ypIDUDF2x62BZvE3OxQVaqy2FXalg/46H3krZ7ObZCuXgn4x+aiHZ93oG
         qVQwEuEWlC9ag206aMDmRzHiJAVOdF4jvstAcuZLKdryjY6tW+1/jTF9cEi0dywOsHe7
         0eDw==
X-Forwarded-Encrypted: i=1; AJvYcCUUi4UsyhxHore5QI1Dk5kzTff+XgXJLOp1EEoD2Yf0bjIzuwEYOh5bTZ+O4m81oaWg7eKvSiYMeT2UqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpJ5kiiRUBMtOIXYDDmNTiA2fPbyfxGMsDEif3Qj0cINkHhV/w
	ozXjTkilPZRmwmqaCr/kd0Le/0RQxxhm0hGKzA54agl7qNnr9XOkKZK3+tGikSg=
X-Google-Smtp-Source: AGHT+IFvRpxwoefPfsPJKT7RyLtcLqtQGYbN7c2LTwxuGtgb6LyU4gPYatIPuNkyVwMXdBcT7xS4NA==
X-Received: by 2002:a05:600c:1d83:b0:428:c0a:27ea with SMTP id 5b1f17b1804b1-42abd212819mr12286595e9.12.1724230899932;
        Wed, 21 Aug 2024 02:01:39 -0700 (PDT)
Received: from x1 ([31.217.165.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b86bsm18002035e9.4.2024.08.21.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 02:01:39 -0700 (PDT)
Date: Wed, 21 Aug 2024 12:01:37 +0300
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.12
Message-ID: <ZsWs8QiVruMXjzPc@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_020142_774838_2F31E833 
X-CRM114-Status: UNSURE (   8.44  )
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
have been in linux-next since August 9th.

Thanks,
Drew

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/pdp7/linux.git tags/thead-dt-for-v6.12

for you to fetch changes up to 2d98fea7491a00dccd61fee019843b262e60f819:

  riscv: dts: thead: change TH1520 SPI node to use clock controller (2024-08-08 09:19:46 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.12

Add SPI controller node to th1520.dtsi and enable spi0 on the BeagleV
Ahead and LicheePi 4A.

The TH1520 AP_SYS clock driver landed in v6.11 so convert multiple
peripherals like mmc and uart from fixed clocks to the clock controller.

All of these patches have been in linux-next since next-20240809.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Drew Fustini (6):
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: change TH1520 uart nodes to use clock controller
      riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller
      riscv: dts: thead: add clock to TH1520 gpio nodes
      riscv: dts: thead: change TH1520 SPI node to use clock controller

Kanak Shilledar (1):
      riscv: dts: thead: add basic spi node

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 17 ++---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 12 ----
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  5 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 83 ++++++++++++----------
 4 files changed, 56 insertions(+), 61 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
