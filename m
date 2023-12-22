Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA004C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1mhfZH4K7+jGcHVMGIQXy9wF4wCiOoVUAiFA8FWwco=; b=IfzE8o+nZ4aKXs
	xTrX5NqRrhhEe9jQyVDPAYLm+4beeGV40KbixkAvat+tAB9PfI5Yqnpm2ZswhUjLug7basStg2m8a
	PFceDdNc1lANWee7aNSHGuSHVRCcih5XRQpYv9Oll8ARU6kK+ldfS5A0jNTCZihc002OXyd3m4SgT
	Naskq3JiC1Ez/d1ZeGnhU+PBbFAvjINQCAF40Bji9IvUwUrSncMmQTiriudoc9E5lEOZNhxX/z+9G
	ZogjWzhC+icvIzUaWf6h8vwZeY4WlYsR7LjFYBB5Ot605xVGzkF3iJyUL7U9ta/1xBXS+Y4VDY2TR
	9H+6RQVWPtUcrqadW+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUH-005dOe-0t;
	Fri, 22 Dec 2023 11:14:41 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUF-005dO1-0F;
	Fri, 22 Dec 2023 11:14:40 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50e49a0b5caso2149931e87.0;
        Fri, 22 Dec 2023 03:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243676; x=1703848476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ywwb2c8K+kZPbyhXDFCz7U5YWzVC2teLlAt2hSiJc0A=;
        b=Hvn1rbRJnPXveNlxUvzZGhfhl7urhBfhklt/AoFyoe7t8/XfHNEpIUXC+fkxScBmhI
         eTdn7/r1nw/W+9zxBVd3reOOTv99Jx417qQQNa0Kv04dqcG/zn2/FHtoXZmLJVSDWes3
         y4fiNf6Q6DTZzl9FoAil3uLZ/kuPtcpniVaJbKOmD95NOeyPxGT0MfbAdI0c9XHYlA0F
         KrR6FlYYDoEVEv/fF9xjEkBVmiq1+lQvjkKiO1ndFnlvEbcaoyGZHToqkoyE4naMarsk
         6rCz47H1s29Bef0ioN/a6t54Av73EKxBz/uQ+KaC5ZW5uCjLBBaI0C8fVeOtZHRlpoKt
         J7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243676; x=1703848476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ywwb2c8K+kZPbyhXDFCz7U5YWzVC2teLlAt2hSiJc0A=;
        b=lz45/7NI5tsf/xlG5NwzsSn41W+gHW9o+ApvlEAcde9/LFpg/PlN/9zLUV9X2hknxp
         sBYW3tLZm+dmUWZXWJSryaZBabDSr2odfF21kMslAG27qtb5/55AwDcA8LtYm8ryjOR0
         CigbNDv6oSjF4N/Xc/eUp6Yh7h9WlfncinsWywrv3J8KkRsuENvjEZkAs4FFBuoi7mOc
         obss4U4p0kDXVc7C/hTL6YolcP/hj00vRjpOQ0TSn3XKTa1kj+Vu6q5s9dtWRixIgkeI
         4maEVrsaDKuQgNP8OgpvedOArsE1+dp3If4wLiLbxDRL3+O0H9qigtkNPU5quY5EoCeF
         zr1A==
X-Gm-Message-State: AOJu0Yy4fwTe409Tb79j2QnTD43bKomOgnAqpkuvU9Byj/YxgeckJiy8
	U2V8HCzKOA0SfX3cisvqVcA=
X-Google-Smtp-Source: AGHT+IEHhoBZ6sLrw8lKHDckHa1uRnHimx5cP137ZR9Lgo9yiD12gvt8LEkOv80eCcFyVhpbiFrZ1g==
X-Received: by 2002:ac2:5dd5:0:b0:50b:ebd1:6e8a with SMTP id x21-20020ac25dd5000000b0050bebd16e8amr572807lfq.133.1703243675755;
        Fri, 22 Dec 2023 03:14:35 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:14:35 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v3 0/3] Add support for reading D1 efuse speed bin
Date: Fri, 22 Dec 2023 12:14:04 +0100
Message-Id: <20231222111407.104270-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031439_111414_542912C6 
X-CRM114-Status: GOOD (  10.90  )
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
cpufreq support series here

https://lore.kernel.org/linux-sunxi/20231218110543.64044-1-fusibrandon13@gmail.com/T/#t

which is currently stuck at

https://lore.kernel.org/linux-sunxi/aad8302d-a015-44ee-ad11-1a4c6e00074c@sholland.org/

Changes in v3:
- Drop 'len' parameter and pointer in sunxi_cpufreq_data::efuse_xlate()
  prototype

Changes in v2:
- Make speed bin decoding generic in one patch and add D1 support in a
  separate patch
- Fix OPP voltage ranges to avoid stability issues

Brandon Cheo Fusi (3):
  cpufreq: sun50i: Refactor speed bin decoding
  cpufreq: sun50i: Add support for D1's speed bin decoding
  riscv: dts: allwinner: Fill in OPPs

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 +++-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        | 89 +++++++++++++++----
 2 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
