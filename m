Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10317C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GnQyeKNzfJncRq8DzUb+G1T1CcirlP/rDGIMmtZX0OE=; b=j6KdgWyvDVoDQg
	qCuRBjpc5bGcWVz0LgvMv3Bjjspw9mtHf8giSEYpG2/2vx9ce6QL6MOWzMpfPZCPxV0Cj82+dDGMx
	h91pu3WoWJBhWMLM4kuE6D0dldxNp2JUhEApMtGK3lmsUbbMSj3+BRf6UoeKDj2Fk4JgFnNRGXLUk
	7Mk/qozF6AykFOpl8cIIrfwrk8XbQR6zNFRmkKtajcRsPjAAJdR24AKCT4oGszM6GZKiTJa29P7sx
	hXyG+w7ZJviJENd61ZeqkdjVanOEEmJ7rfS3C2c7oUI0vit/HwMpXjGGlXeKQ/zwbNl4Kgabd84lu
	7UKcEQWUqGwsCYlFBEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtFH-00GmDv-2v;
	Wed, 20 Dec 2023 09:52:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtFF-00GmC4-0B;
	Wed, 20 Dec 2023 09:52:06 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a235eb41251so400850966b.3;
        Wed, 20 Dec 2023 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065921; x=1703670721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9qpB4qf3ZId6lZMFowk0z0oliDO3YWtk6BSWDnuZ0o=;
        b=Iyg/2oOvUWcCKSWP1wvDE/1DGoNFWMcvp3c2FseBVZrhuH62NmGu5PymN4G0FjXHp0
         ir5IfrPW2xyeWN5EgnC/QxDggTAze0l+PGUkQLApsGfgl4P+9tDevnO3g4sCgxBLquvn
         49D/xSPhLAabM6J/59W+Ikrp6+euHizllNVkt0pdM4f8MXBX6oKJoxdjbdKjHniX7aLq
         oPrIlTTXRs44WJTZXwK6I9dla4Y4lK276Wzfl2aw9XzMhh1EOzx0+20yViFFkKnNtsmq
         NQ0kkfSMtrd6bDXa9p/c9O9a2V/nKKe/FJuku81LFNbHsNX1ComNjVz6K8hynQhQb6JA
         7O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065921; x=1703670721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9qpB4qf3ZId6lZMFowk0z0oliDO3YWtk6BSWDnuZ0o=;
        b=YTBw+4IjdMm4fp4/ee5RDhaKZIKvRWmkseJ6B2aF3tbTcWfBOk0LTP8kIqjTWr9tR8
         8dbH4Yx+NbYt8/MUAMHTl6wdcDibPOewIwcO/1fllorHMLIQ3o83kNW4CDG19DIULMwU
         L0E8gMsDupkDuZRL522RjzDr7LcDYfBXd9BqRCZ6zQYfHljAlFBhL2KYun5eikbmmshm
         VMzqcB0oDlT6d4t6eZLxveUw881Wcs4bDzbX/dbSSWu+rY1dwjs4zvczXkEBdK/BmbE9
         JVzZQaSlCsdqwkTqHaTLEHtMuejWwWqAdKszUqNFFuHd6TL0mWxeFME5W83A3/g+KHWk
         O51A==
X-Gm-Message-State: AOJu0Yy1W58p+SGMmCuO+R8X+M5XvEeJTB8bye2GWL7h6tQfURqY2UtO
	gKIRIS3L6qnQb+hqmGe09aY=
X-Google-Smtp-Source: AGHT+IE28g41l7HoQZQIn3TqFjt4hhf/zSXdXrozlWV0k0jrhm2KNFm8zxiuiquLZS9DJmjzTRsGSQ==
X-Received: by 2002:a17:906:10da:b0:a23:617d:1917 with SMTP id v26-20020a17090610da00b00a23617d1917mr1485420ejv.116.1703065920680;
        Wed, 20 Dec 2023 01:52:00 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.158])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm16596791ejc.18.2023.12.20.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:52:00 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH 0/2] Add support for reading D1 efuse speed bin
Date: Wed, 20 Dec 2023 10:51:39 +0100
Message-Id: <20231220095141.27883-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_015205_091802_F319B687 
X-CRM114-Status: UNSURE (   9.77  )
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

Hi everyone,

This series is an attempt to get feedback on decoding D1 efuse speed bins
in the Sun50i H6 cpufreq driver, and turning the result into a meaningful
value that selects voltage ranges in an OPP table.

I want to make sure I get this right before sending in a v3 of the D1
cpufreq support series at

https://lore.kernel.org/linux-sunxi/20231218110543.64044-1-fusibrandon13@gmail.com/T/#t

which is currently stuck at

https://lore.kernel.org/linux-sunxi/aad8302d-a015-44ee-ad11-1a4c6e00074c@sholland.org/

Brandon Cheo Fusi (2):
  cpufreq: sun50i: Add support for D1's speed bin decoding
  riscv: dts: allwinner: Fill in OPPs

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  8 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        | 85 +++++++++++++++----
 2 files changed, 76 insertions(+), 17 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
