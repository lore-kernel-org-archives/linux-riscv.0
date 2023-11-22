Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D6C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gy8ug8WDPSuBPtezKy0QSZLyUeOvpd5nlqUUxDPihuQ=; b=gv6/1PYVmXJsQp
	YPoaGv12yZPzhB7R3gDbPbMe6JT38Dq7StwpgdeY0WmmSqOch0GMW9u60Svxjzk62oXThhYiL9eBA
	OcQx7FZpZp1d58rjCWy/yvfzZfanbD/aOlNMocostRFqyR4bRvH4Uny6NXSLhzTCPXzNiXDdiFgGy
	K5yWMngPny69FwSRMfIMGuadMTBagnL30rVn7HXQncm23EfzquvlZJcNAUaQnkm2k5a/oczSaoxTg
	cHpcaPU3yWNwhddPMb71R1zC4LWwD3Pk0lNajwnXUM1rwhQNmfuM4lVY+hIIiFtE8CQ9Wz3UGcoBe
	1t+NprYhOugv9BNu2UUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSc-003Aie-0S;
	Wed, 22 Nov 2023 22:12:42 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSX-003Agu-2W;
	Wed, 22 Nov 2023 22:12:39 +0000
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3594cb642beso907485ab.3;
        Wed, 22 Nov 2023 14:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691156; x=1701295956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK7kv4eKhyN2VRY462hcU4dvihYdA9xvtn9OEHW15Ho=;
        b=h9ryvXZUfmV1V64w0xAaCDosDbbP68mad1gDAy5keOByvQtEx8GBqbgvkBEY2V8KFY
         08OIH5FkBNjHkrmkmOIW6DNoKnWbqc85F0qNiHyOjRfQzONSmmVfdjKM3U2sIabUayUg
         WJLt6jjkwuNVHdw/cH9H2sWzjx8gWtDd7s01v1nTdQiMJbamuHrZK1WuPDHoCXvHklMr
         Vbd7GzvSMq4ru3T85vx8jAfzto1gaCLKX6511Sfgp0pUWyKLgOclIbWfVtjLIyIYCjkC
         PlXJQ7lWxbTDGjQK8OeucVQeAUUBBgtoLQ+rXVsu2FvmJq3l3mjhOUjS8djqpatKxEse
         DSsg==
X-Gm-Message-State: AOJu0Yz0piWtWGPPKkPOnAjL1bI4Nutg4wnR7plGe17peZNVj0mK1efC
	rOibQkDxC5WLGO1Fndw73w==
X-Google-Smtp-Source: AGHT+IFYn0a0pfyS8tB9352GHm+FwUQVdn+U2e30V+Foljp37QPIyDstNnI1NzA0G1xwCDRADRCyWg==
X-Received: by 2002:a92:c685:0:b0:358:104:679d with SMTP id o5-20020a92c685000000b003580104679dmr4053847ilg.28.1700691156570;
        Wed, 22 Nov 2023 14:12:36 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y36-20020a029527000000b004665e39708esm88692jah.147.2023.11.22.14.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:35 -0800 (PST)
Received: (nullmailer pid 2753833 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
Date: Wed, 22 Nov 2023 15:12:31 -0700
Message-Id: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM98XmUC/x3MQQqAIBBA0avIrBNyBLGuEi1ER5uNhUYF4d2Tl
 m/x/wuVClOFWbxQ6OLKe+7AQYDfXE4kOXQDjqiVQpTh9PJ2JXNOVU7Gxmi1s4YC9OQoFPn5d8v
 a2gcKn3iHXgAAAA==
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_141237_824315_74957888 
X-CRM114-Status: GOOD (  10.37  )
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

This series adds support to set the dtc extra warning level on a per 
arch or per platform (directory really) basis.

The first version of this was just a simple per directory override for 
Samsung platforms, but Conor asked to be able to do this for all of 
riscv.

For merging, either I can take the whole thing or the riscv and samsung 
patches can go via their normal trees. The added variable will have no 
effect until merged with patch 2.

v1:
 - https://lore.kernel.org/all/20231116211739.3228239-1-robh@kernel.org/

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (4):
      kbuild: Move dtc graph_child_address warning to W=2
      kbuild: Allow arch/platform override of dtc warning level
      riscv: dts: Always enable extra W=1 warnings
      arm/arm64: dts: samsung: Always enable extra W=1 warnings

 arch/arm/boot/dts/samsung/Makefile  |  3 +++
 arch/arm64/boot/dts/exynos/Makefile |  3 +++
 arch/riscv/boot/dts/Makefile        |  3 +++
 scripts/Makefile.lib                | 16 +++++++++-------
 4 files changed, 18 insertions(+), 7 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231122-dtc-warnings-968ff83a86ed

Best regards,
-- 
Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
