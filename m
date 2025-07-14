Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718C6C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 00:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Teg9GYDOZzzAqQ17IDmBCTQixfq7ubqqJl//uuNQyXM=; b=Rea/8SrcxKxhws
	6Vn6Jm+g/svT3hd+cn/TbyZuDmiv/kglFgEDkAf0oMtaGGJcGwcZyKu7xlcH/Pu7dhBab3n0dt7zs
	s73HWtN+CeYTrmHWJQsEwoY3eskQtksce+WTzXu7MJe9PUPKcWIL0ji5Mc70SaZILZWEgrxVq1ryy
	zmGuZrQ/r5cvJzur1QwvkRrvRDHdADPn6X06d2x3TIr86otj211CJIjCOpk+4bDuLz/wK81Tczx2C
	UN6zLA0u40vf/ODHAuyHL57kn4biUSr9JGOZOhjGKa80VUmzJDunNIQ1mu15QAp0ruSYiDMuHDKEN
	QVhsppMCP69TtSrISGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7N0-00000000qci-3O8H;
	Mon, 14 Jul 2025 00:48:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7My-00000000qcJ-2IGJ
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 00:48:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3171453b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 17:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752454116; x=1753058916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlGfg6+RS0/8umWyykq+45w1614vFv0m/mmrlsZHej8=;
        b=g+ZqkOkiYIjqM6o6V0R20byq64x0y3nuupxl2rMts+OoeH9iEn54ANtDe6ZeEiE8IJ
         gfi3FOg0TV5K5U/nZ9rBBDqyqQguzqYgHFKbTnOSq7dvcYspszpGs/PiCyTr2mSzWrou
         nUUP1bOXT3nIw9J9Snk3Td2NPVhJkkWkQKbchJtGUKUtMDN+oKjxEJE1sKJtwnRwW+v/
         rHO/o6NDuZWKHYTw27Q6j9829l8HEAxrElaRat0iLW+fcw7nFP6g2031xc/NsdX9d/Op
         jQBbzbEzTGA6V4MrME0EIuX0wfbOQKMoDrqv6mRTG6A1tkQ5VrAtMUDuOfXsMXWqjTrq
         WCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454116; x=1753058916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlGfg6+RS0/8umWyykq+45w1614vFv0m/mmrlsZHej8=;
        b=f1Y1eBIBJf1em01/7cKpeB0vOIMjyar8JYMI/7jGvv8LUodqzQZ4tOSOfZREN4f95G
         q3SVe1/SNYtL0s6YN7A2Fjjd9t9q2ieekIXLCX3VYneke+WoUnirtC13a7KwWApl/Lee
         6+26+3NoMpVe3d79nIRSkVDk35bNh1UBd+QeaYwcT8FlMZI5rUaDNe0UXnA1JN3q1WtO
         qzmKFvT2/tEg/ly9S37yvmZHcUlji7dmGpmvLOhD3tk62kA49q2uY/JvkDD8r6tDv7xA
         WRe2TNAPm/yF4r0Hc133TfIpaEqf0i8B5awRrJe8WWSbZH80rSMvdGJFc52x1zj23i0Z
         bapQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWxROaRgoxLbNruSN/fC3agJXsVL+jzdJM+IBqF0EbNzkjLmNXuUXUi6p1Ofg5t+K3Tycm9PiwOE3cww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLk3fUH+sjK78vkQ3Kc2vQf55GYSIQ6wKCXE4TVkxVFgiMYy4r
	LX1nqpEQUdynW2UfROUZmWUm7xcqODGyb6PKgna2xdVedeicPckZL7cZ
X-Gm-Gg: ASbGncvrX0KEuLgEhZxfXHsZvPZT0ndUHxecyB9NhY6oh09lcFlJcoU5T1idWc4OI9A
	DIKvFhC3X5YjOKUi0PQUtzMxuu4Mf3XOsUKCkKCGIPc9c5xxQ3y5vTxzVg7s58C7uPUyqnMAwuL
	ri2m0jlQL6Ty1kZKxZDUg2KPI0BoH2kYDVvFpRQ0dAEJ0kr2k+5WpP24Iorau8K4A3H1VxzZdoH
	WoD7sDvEF/LuzBqWbqLWcfxkNGsXBHmSIXGV9gM69r7j+Y49GQiG7/ahTM3yHeclakOmRdYa7Vz
	R9rmnsMIlNLITKb1G/gvV0mWG0I8GLls0ftDF3Dr/SrXoZfLNUvgLPHM2BiVh2E7om66r31RA7O
	Z9LsgG4zr4QpL5giFqcTaSA==
X-Google-Smtp-Source: AGHT+IFKzCCHqzYjKRAR+ceG5nX9KmnkL4pm9nq+EucL+t8je9ydIAD9t1s8XHS9iTVp8oXMk1PN5A==
X-Received: by 2002:a05:6a20:c906:b0:218:5954:1293 with SMTP id adf61e73a8af0-23120901f07mr22755505637.34.1752454115669;
        Sun, 13 Jul 2025 17:48:35 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b3bbe5baf70sm8884319a12.32.2025.07.13.17.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:48:35 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: devicetree@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add Sophgo EVB V1/V2 Board support
Date: Mon, 14 Jul 2025 08:47:50 +0800
Message-ID: <175245405814.143339.1204072050512603486.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_174836_582637_F28D82E5 
X-CRM114-Status: UNSURE (   7.29  )
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

On Sat, 05 Jul 2025 15:39:53 +0800, Han Gao wrote:
> Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
> There are many of these two boards in the hands of developers.
> 
> Currently supports serial port, sdcard/emmc, pwm, fan speed control.
> 
> Added ethernet support based on [4].
> 
> [...]

Applied to for-next, thanks!

[1/3] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
      https://github.com/sophgo/linux/commit/a42a510c1a9119a8413e20fe09ce3c3cd85ea7db
[2/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
      https://github.com/sophgo/linux/commit/1bf2708394942e047e08146dc8d2a34c091280de
[3/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
      https://github.com/sophgo/linux/commit/6ca1c3d005cdb9bd619a2dec6ed63ef9ba29eb37

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
