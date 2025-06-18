Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4883EC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lHEkplsvYkX6ZKMHYEkvxwdspQeDjaPB6TU/9rCmJ9A=; b=kNEoEOd/cH9myZ
	8vYyvlSWk6CyrsQHRyDJZIXBDGrSa0QnjLLD+BAlGhRX7RHZLQ0ghm8VJ52XfRF5iGt0JsH8C3J56
	t0xiQAWQJE9s1ToF89yLQS9iyy7sM1wDXSTNHcUTLOeeSEKVINkOwDgqjIwiaDJZcrnf9QhNYGIWJ
	vRtBrB95oY+nPDfnsA4dQ5Z+0Y2jC5K9CA/174PnVTjOgEK36aPCJ5Eg4+qfQkpo2fCSFEqNi2jP2
	yM0lPfz/Y3f/W5xB5CFLLFiKZ63fe9OoGbQaLO5jXk+blS0Qwg0O3UedvUVhH6W537G166LFmhPW+
	DcO/aIhf9+NcZwDJnXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRi5z-00000008nAI-18Iv;
	Wed, 18 Jun 2025 02:00:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRi5x-00000008n9i-2Set
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 02:00:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2366e5e4dbaso2334565ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 19:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212009; x=1750816809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js16QE/l3Azxf6OhqJKpRZgtBkDfap0Xs9MrJpn0tP8=;
        b=N9oL+3mxUh6WSJvtDY0cORhK4HPPCfeYHTSYbkPuJb1wwsN+f37gK4BfphqwiAJUkX
         ZyIruiy3fc4Uv3+JG4mE/mC2M/LNmtteHpDkwT+1JNpFgSaWIR5Dn53boqGwaQRYmXWr
         5HUvScmYIMN3xoPfnixR38tHBv9lZa7L6lk3reVWLT9K2BspwbgpYw4gtRzzid4r7DhJ
         5/lmNkQUgB1JH/tV7de2b1xSTmrGy2SbaYEm3U8XWDkddcgrupEzSfwTWeE0QtrWjCZ7
         f8ZTg8xgPEJbcIcXxHhaulyyzNANnRzbKl8g/PlW2yzDFWtoKAFt1IAxZEyqU/5WgeQD
         LDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212009; x=1750816809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js16QE/l3Azxf6OhqJKpRZgtBkDfap0Xs9MrJpn0tP8=;
        b=BxyddM+1Z1IMa7xx8ycpB9OESQ4vpRE7j+gwckpJ/Uj+Z29F/sT6LNQywtBcM0WWzb
         96aWttpuj8kqbYQgySIDvToqqFDEhZa0HqtXysv/1xprw+SHy+bP+u23ycnMxga7//Ui
         v6CURxJmdGJKdD5/VcvvTfuN5xP0pwNfvktkl4jDqg7znCksKPBI9je6BZ2aXkdGNO87
         1MCQkDfcdvo3QiXZFkmFFAlI4lQtX/62wE8lJ3YcYqKSo1gcmlEHA3lVYVqGe7GkmvIJ
         BzleNqAVl0yk7TJwJuG0QBST8EgHYHVHfKbTvewRG+9LkWAgW3BCQ6nld15t22y6X+A/
         VUcg==
X-Forwarded-Encrypted: i=1; AJvYcCV4YCmd3JziUJ/FByy/y8tQ8Nm6leoa/G/PwtsIjqbhVG/DKWwW85tpyGSKtyD9pmzb3n5H3rIDzppTfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDyWskdqXX2wU0UGzsfiZYmTurkQrWFMYkYe/pp3Wth4s/oXhv
	42xl08jA9SK7fnYfWLOUHX/z2m7a3ahlupnjJ3x6VHpxABpQiEUD7aXg
X-Gm-Gg: ASbGnctIwQ05EbP3ogS3ODyIMpeFn8SgHY4zz82eTUYgWxTqdxLJFxXaQpHb1sXZCut
	Z2tyLNzSMM0WxOWVcwffuMNHTmC3INUusAYakfTGaA1T46A5UxcipwrZBoSRp8y4/Xz9LkDcmfz
	y28kUaDzPsBUD6UnJhOEvrASf4f1eceX98IRxW/Sg1h+jHQANXD73rasIqTx7OFzvvF/iEBLs6W
	06P99eJB0f742ad/PXyIKdUSrLwq+/eAQ0NSJRxWkiQ6Sdb0AqNXj0M4IonGuBNFzFBsRViwM8M
	fDEAQfSAbCepw+TcaMjV/wvxAy77MwIeAneG53WY+7zx57r+fFKrnpKdCqWv4OIlOBti0z7X
X-Google-Smtp-Source: AGHT+IGAOQARUloo9z0y3rQubqjj69WyqkCBQjqqpqt5975rY016nm0RO7e1sy0kgIpRtWCQISr0Aw==
X-Received: by 2002:a17:903:228b:b0:234:11e2:f41 with SMTP id d9443c01a7336-237c2046e94mr12186545ad.6.1750212008742;
        Tue, 17 Jun 2025 19:00:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19d0e36sm11494388a91.15.2025.06.17.19.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:08 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: dts: sophgo: sg2044: add PCIe device node
Date: Wed, 18 Jun 2025 09:58:47 +0800
Message-ID: <20250618015851.272188-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_190009_622319_3797B351 
X-CRM114-Status: UNSURE (   6.81  )
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

As the PCIe driver is merged, add device node of PCIe device and MSI
device for SG2044.

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: add MSI device support for SG2044
  riscv: dts: sophgo: sg2044: add PCIe device support for SG2044

 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  34 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 186 ++++++++++++++++++
 2 files changed, 220 insertions(+)

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
