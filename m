Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2E4C46CCD
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EPu79HdqiPABFXW1B21n8AwXGBKIKmh9ELPKlp2VImc=; b=Do05jthI5nVM12
	9BGL7n3RHgpXc1aVtJ8AnLNkQmW+XOXX+V/OmJvEzn/jGqucwGcy9dboxRkCyQGAbWwzj4W3wfdex
	C94OFFxfml7jvPEO/13VL0Uayhuok1llfNe+4Znp3amogFyHH+wTnRcihAysktgSEbgzLBBdsNBgy
	N13Nt4yAltJYcq1sf4xr0nxjGEWx+IUGDGdgX92TIiDaLy/NquMPRrU10oLUNnX43yvA6msK+kSW/
	riZDJu9EMVOWZBPDgvqFKssimjyKq3xnIjPtpFBjKv6teGm4y/s7IVRjeZB15qHt3E7wIrbxmedp2
	oUK18cNHyFfsr/MyPCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG0q-002Nm6-0k;
	Thu, 21 Dec 2023 10:10:44 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG0n-002NlP-09;
	Thu, 21 Dec 2023 10:10:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50e39ac39bcso819292e87.3;
        Thu, 21 Dec 2023 02:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153433; x=1703758233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fIP+gY5tjmlfd94qvCRw5zI94zpMLdzYlGd9t55ptY=;
        b=VIL4h1kOtHUAfMNgDHb+PdeEOBdYLfpw6MOqWqQKBTyWEXj1eoWRmNwBuCucxTMzZe
         jrbvzphdVFMRV70I5qTiCczqNzU4bK86ufyqqw9P0hGuahrAzTS2PMysgdpaSPtqD7+z
         H5yz9uILHX1Lee9aOfd6cotjAueI6BMJuCQ6bPuvTJnVuIvuixIHvu23D0j5iDnWVwRZ
         q46OF94S3T2OxBhFLCpq2gaiwGgSbivlqMvrjcMsMQyhHK9OU94b+XK0CUT4jFH2k0NL
         /cWauL0pa+szMi2mUrp/KMepgu1w6xeqKfqu/53usvLTKB1I7u9kCKFRjT7Mfpbdnwsd
         h0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153433; x=1703758233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fIP+gY5tjmlfd94qvCRw5zI94zpMLdzYlGd9t55ptY=;
        b=xH0IY1Xaoo+Vz9GPBU/8HabNinKiB1dXQc6g8E5g3udDJpPUmBljytfDVIILxnLY0G
         ldAueGjk76G5QYmDzLlULie2eJ3KaPH8/eD2RaTKrMvc2YYkU6Em8MMD6Ho9uZGA2vMu
         lxkxdzPlquG9iv1Mncmo7aqA4FIr4gmzPG9PwuBLry0UKlihe02juLg4+fufScv6xewU
         4VLLf+rpSaVyFxjtYv5pgY+6CG5UHlGbmBVYOmwc/k1hkdRTcFR9XcHZvGBRDac0s6TT
         P1dGsER7b/pD1AHEAr2Yz/Zc4JwVqq5xPHhAGErlcG9iodH2iIhKOteuXzIYYf7TkxaJ
         tTUQ==
X-Gm-Message-State: AOJu0Yz9hnsguNsDAw81V4AotXhMSmX+NUZ492Wn4h5t73fYVsNry/Ps
	89fgWryBlM87CkYhrGWYe2w=
X-Google-Smtp-Source: AGHT+IFtYAcqviJSNW2hlf7hb2pY1nEpa7NDu2xXdMOCQkRzDnF1hONtWet1/ZO/uZRytB3dHQ2T/w==
X-Received: by 2002:a05:6512:402:b0:50e:51e0:732 with SMTP id u2-20020a056512040200b0050e51e00732mr622482lfk.277.1703153432484;
        Thu, 21 Dec 2023 02:10:32 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:31 -0800 (PST)
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 0/3] Add support for reading D1 efuse speed bin
Date: Thu, 21 Dec 2023 11:10:10 +0100
Message-Id: <20231221101013.67204-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_021041_123966_DE400014 
X-CRM114-Status: GOOD (  10.98  )
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
 2 files changed, 89 insertions(+), 19 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
