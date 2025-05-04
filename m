Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C645C369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JwbfsNRrN6+pLbDC9WfQz8sfuChGVBf44oWCVfpU8Bo=; b=SE6OWnbOZ3d4YF
	KznuIfRZI3P8U46J9uenhiftO8OBcLLpygBiMFsI3by9sCVZRvRKITl4xSdaS50zCFXu1wwUUVAPl
	yzLJJ6GingyfMge6rlQ25wxDd5Dm0plPC7wX8hJL5uqcJheITb3gBJV+jO9kXQnTZaxJJpINnoPFd
	Yy972Jb6tf+cKBELTJnbsh1vckjRMkxQMWfJK8MfYlEl5/N6G8hDQ9Rp58PDOQfe6/nc9wBjfpjY7
	LBGuxnN3+DQPpIA5TQ5PGSqXCRLJASuIJ9ezrwPBU8jWlo3QEgBwkBWTd01M6cJXqSc0JKj/dv7dP
	Anqp4l1lNScdmk+zUXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrU-00000005C8K-3QeC;
	Sun, 04 May 2025 10:46:20 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrS-00000005C7w-3FZq
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:46:20 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-48d71b77cc0so16192031cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355578; x=1746960378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq+V10Dns5XsDfB+eto5dT40TdHnbLnPhgKmmJjTtqo=;
        b=IHAYz6azyTAg5e4kcAbGD2CENOSpKHEYEpYcfZGhLsMgdS5tDiPQ7KZ14SUAsBkkTH
         z4vyQoIyi0LHmN4wwebJVvEnEcdCDhk4Ttlt3wnBb/KQggArOEn8+2cC2jghA5A9/Lr0
         Dn0G1Y+ubP1wAofP/i7Y25ajVUffO3JkKoMqhMDGo4pUmemFvLoCa8jc8JZfjR3XBWTj
         BvoOtd/yVKbBlBqteMNLEeWphsOGKd+MREmn6WzUcXnTg6YMTVfWWx+w89bcueqA6/4e
         Bm29EpR4Y2GXx3TxuhTO75EcBIh8g99ISpzhfe1LQ26hFU9Q9EyVt+lDNvvhHmsb0rGG
         l9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355578; x=1746960378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq+V10Dns5XsDfB+eto5dT40TdHnbLnPhgKmmJjTtqo=;
        b=OIThhZXPVYk7NEmow2lFgDvsls2EEEsRzOIVmdzJImU99oof22ud3RbqNJ8yzv9LpF
         YOIBfloJx8AriDRx3q8ZLC1J2hXwIEWlr6rRNdNdYNTsmoAI8iY2IEQX1PsEH2SFqVLC
         dIXBQzOi6xht1t44B6O7KA2QVaqz3q2yxEa0NJ7FobPN+hTtuvgEJL7XdGqYabwKOwEU
         In0mMPzYQpX9SwpT0OCdW6dsUi9CTdFq8OUOuCKeOnlsHpeJBMOqCphPM2k+TqkVhqh+
         mX5HKuadO6JWkXQIDVOsxx5NzLQg2fIgzH8gRKkVRVMSbPrCit6xbuUIb2CmWMrHxQ9x
         Bpkg==
X-Forwarded-Encrypted: i=1; AJvYcCWWJe4y7xSndY1BhtCu+2jtcafBzeqo87k7Tp1i3SfJacUh9JQJUd7S2tEOHvTMJ0AjKTsKOMsdauh/6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhNriI+wYntKo16ON/6IBvE0Ovzse7Oc2ZmTwF9lSkSGkabjlk
	+UitlvDGYtbxHjxR8vQGIosTN59fcf1SK11IHZP9iswYH7xU6yLn5qXyE9Qb
X-Gm-Gg: ASbGnctu1PrAGmkqqL4+tGaUD52A5p3SIlzJW7y5FwJ39smL/ij14RFpi0F5eZkFVR6
	51tBsdrns2LgPUEHmTth3iPO2LHHTQwEG/rTwi+I8KPb0foy3bQ2C/5moIEhZ+JYfvVFvdvHcEr
	VVauCrCMqtKCvwh2aNcZXty9CU9ZeM4EMtJMctL2qcaLuNqkk+vrcOsc+pfHXPG5S0t1q16jekS
	QBpPmibmFVbZjrYGPcTHQLrmh8G1iEJ6gPBC8BFJPZ3+ZXsB2CdWu7dOOK9OPzZ+wNuJ1Uh38UK
	9kAjwKe7dP+ziu2V
X-Google-Smtp-Source: AGHT+IElXOJ8VLrJgB2ldI5hP8eRxH52DW4UdnhojjCazX+wPJrTxe+0SKD3E9HjgZkTHUgG8JE3eg==
X-Received: by 2002:a05:622a:1a29:b0:48a:d979:9a38 with SMTP id d75a77b69052e-48dff3e17a6mr55044671cf.2.1746355577750;
        Sun, 04 May 2025 03:46:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b98d10309sm42842181cf.79.2025.05.04.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Sun,  4 May 2025 18:45:49 +0800
Message-ID: <20250504104553.1447819-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_034618_821049_63212ABB 
X-CRM114-Status: UNSURE (   7.98  )
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

The part 2 of dts rework replaces precise compatible for existed clock device
with old wildcard one.

Changed from v1:
- https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
1. patch 1: reused sophgo,sg2000-clk for sg2002.
2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
            commit message.
3. patch 2: fix wrong data for sophgo,cv1812h-clk.
4. patch 2: remove compatible sophgo,sg2002-clk.
5. patch 3: adapt the change of patch 1,2.

Inochi Amaoto (3):
  dt-bindings: clock: sophgo: Use precise compatible for CV1800 series
    SoC
  clk: sophgo: Add support for newly added precise compatible
  riscv: dts: sophgo: switch precise compatible for existed clock device
    for CV18XX

 .../bindings/clock/sophgo,cv1800-clk.yaml        | 16 ++++++++++++----
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi          |  2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi          |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi           |  2 +-
 drivers/clk/sophgo/clk-cv1800.c                  |  2 ++
 5 files changed, 17 insertions(+), 7 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 94fb3d26e017cf839b4dcb4bf85624614a94b9ac
prerequisite-patch-id: 8f4a8bdead0e4e3d6904adbc0fd150b7dffefc85
prerequisite-patch-id: b30e850690903c3ddc3d8bb77a99e97934dc9dde
prerequisite-patch-id: 6e1117694a53a0059b145ad4751ec204cae0db35
--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
