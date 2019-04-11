Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C50C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B212082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TKKAFxFj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eXbjzF+G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B212082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PC3GzPZrSo3Yd7e2mZ9DVWhhhSMdvVW+LPIdCUXRmYE=; b=TKKAFxFjkvljsg
	np37ljd/GM6VYJ9bL77fPx42SA0SLi+RcBnVTepawqRA/uLlXsQL+zv415wZkpyu6U04neWkv+0J9
	1FCFUAPa/QM4xCGHqqErM81ji7A/CRytfkDScOgNYYZeVOUuRiqUnpN8b9YdoIIxdOVGfF/O/Ty+1
	dukE1pWAiYAJjxucOWsIUmUia700y2flGwayzMCKUZc9QtR6XpaH0AqPtQRve4lX7yF3Utolbibj+
	fdt8YCwkPdty6//qYKmMIWYAedn3OUfPsIA9SDbCE9gZnqG2RAFKshAvnqnYSHSP206Zm5nTDenbq
	MdaxTB6BuF71escFh+CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVIU-0000hV-J9; Thu, 11 Apr 2019 08:43:02 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVIR-0000gt-TT
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:43:01 +0000
Received: by mail-pl1-x642.google.com with SMTP id cv12so3073157plb.9
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hw5qdrAr+Kv7cDjy4/CIwJXkovlyibz0/pjwMu26vkg=;
 b=eXbjzF+GSM9ixQ+JHw51zbNK3ONlZsfL5tdVaAqWEm+GlVdA5X3Rc5ms/k507LZJAo
 evtgOr42DlMhQQ4p09iYuZjkrj8sXtja6gV7mGFl8hJSAskouM4d4qX9cukdT+5LamTw
 MxLzBjI6Op20PPU1STt5QQ4R4r/VLizLNx0kpr1DQkujrHh9Ga8qh9LCNScKRGg73h3Y
 B0B4ydL+LIgGbC4dp0EOGOIZ6+9oTh+e+r8WDU/Ti5hLqyy2vrLarbGdVzI8hcm+fGPl
 ACnpNFt4D0XZwKS8YlRNYZ7KCFPRMqJGMT40TWzFe03bGmlq4kYZwrIsNq8iXsN+3BSK
 OdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hw5qdrAr+Kv7cDjy4/CIwJXkovlyibz0/pjwMu26vkg=;
 b=em1ZrnEL9MJ/GryrAKGPu8zVvLaEcw6A/+e/a9rxHSvNCRbDe3+9rTnl8VEnV+t6wG
 jZnVCHIZrN3q+B1c5c4wtVi1raklj4wf3cWUxZuIp5Renito1UgWi7dEMGtqzhmBIBCV
 4tsTDkQtIpA/w7J23Ip50fPqM5A8TcSuN7Egp7Vq/7EtTo+KzeyS133z7QAOMcaFtPxn
 tneDD7Aniw8g6At1i51OsUYFyPWFvwNiAyO0y1/039AKiJHIJntRxIM6O40qDttZaeVl
 rF3LzLZ2yEQmV4mKIh2SBdrgsEWpxOieaG7Afd7RQ0rXcRQsULle8dt5RnuWxQIHUCDh
 11VQ==
X-Gm-Message-State: APjAAAUE7R4baKo2dN7EiuOMDgvbVYneQBRo/kfBA3yL5OYKGV9FTbIP
 eqwHxbk5oYBbhcUdQm6DDqGiDw==
X-Google-Smtp-Source: APXvYqwmMljoQ+JYSiHg0hE4ueiZqAmq4zr9cwazrci1v8vuz3pOAMxKXmalha6pw0pfh6EWLOAp/g==
X-Received: by 2002:a17:902:7b96:: with SMTP id
 w22mr49206547pll.28.1554972179330; 
 Thu, 11 Apr 2019 01:42:59 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q10sm46514745pgh.93.2019.04.11.01.42.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:42:58 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH v2 0/6] arch: riscv: add board and SoC DT file support
Date: Thu, 11 Apr 2019 01:42:37 -0700
Message-Id: <20190411084242.4999-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014300_016789_A337BAAC 
X-CRM114-Status: GOOD (  13.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for building flattened DT files from DT source files under
arch/riscv/boot/dts.  Follow existing kernel precedent from other SoC
architectures.  Start our board support by adding initial support for
the SiFive FU540 SoC and the first development board that uses it, the
SiFive HiFive Unleashed A00.

This second version of the patch set fixes several errors in the
original patch set, switches to an initial YAML-based description for CPU,
board SoC selection, and incorporates feedback from Rob Herring
<robh@kernel.org>.

Rob: it would be helpful if you could take a look at the YAML files to
make sure I'm not doing anything explicitly broken; I'm pretty naive
about the new YAML json-schema format.  The patches here are meant to
be starting points which will undoubtedly be refined later.  Similarly
we'll plan to convert our IP block binding documentation to the YAML
format over time as we develop more experience with it.

Boot-tested on v5.1-rc4 on a HiFive Unleashed A00 board, using the
BBL and open-source FSBL, with modifications to pass in the DTB
file generated by these patches.

This patch series can be found, along with the PRCI patch set
and the DT macro prerequisite patch, at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/dts-v5.1-rc4


- Paul


Paul Walmsley (6):
  arch: riscv: add support for building DTB files from DT source data
  dt-bindings: riscv: sifive: add YAML documentation for the SiFive
    FU540
  dt-bindings: riscv: convert cpu binding to json-schema
  riscv: dts: add initial support for the SiFive FU540-C000 SoC
  riscv: dts: add initial board data for the SiFive HiFive Unleashed
  riscv: defconfig: enable ARCH_SIFIVE

 .../devicetree/bindings/riscv/cpus.yaml       | 274 ++++++++++++++++++
 .../devicetree/bindings/riscv/sifive.yaml     |  26 ++
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig                            |   2 +
 arch/riscv/Kconfig.platforms                  |   8 +
 arch/riscv/boot/dts/Makefile                  |   2 +
 arch/riscv/boot/dts/sifive/Makefile           |   2 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 207 +++++++++++++
 .../dts/sifive/hifive-unleashed-a00-fu540.dts |  69 +++++
 arch/riscv/configs/defconfig                  |   1 +
 10 files changed, 600 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive.yaml
 create mode 100644 arch/riscv/Kconfig.platforms
 create mode 100644 arch/riscv/boot/dts/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/fu540-c000.dtsi
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
