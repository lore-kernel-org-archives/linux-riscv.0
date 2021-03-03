Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA309C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 02:16:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9041364FB0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 02:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9041364FB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxmSKHyMbSJPGkGl7FthXNBrDmcp3YYSNaHuZNOjv3g=; b=reY8gT6JphsPKCIhQ5lcnTJ2lw
	3HEv9hCabhhVYuGyXZpMPpAWikszopK1luzfjytHVBShnZzWdnCkVQNwUf3cOWgNMGl6cQrOomo5G
	/LG2khkzUjD11gDdXwGzh6kfTURPW0z9/DqSgH11nkPuv5e5UjWUnc09OWnMQjhOuzCvqbXlQ1waK
	Y+AYDMh7Dyc/CzPbJM8R1sSHpDYdBSuDE5pl4+VXn9XtCmsDlBuNdQAMUvOXWBkr+AGYrkBGIgmLO
	Uvsa45DvUv8qSlWfNsjRNo9z5Ae2y0IEYpp6yqfvJGQsAdx/PmpHu04E5WsfOSsbjlAmKn/lvq8S6
	NhMLnQOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHdWo-007RoV-9H; Thu, 04 Mar 2021 02:15:50 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHahY-006tyI-Hw
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 23:14:47 +0000
Received: by mail-ot1-f54.google.com with SMTP id g8so21721684otk.4
 for <linux-riscv@lists.infradead.org>; Wed, 03 Mar 2021 15:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=yXVmeSl5oOevxfQxlrfETF+M/MDbt5WdR8xryqID+Tw=;
 b=MGmHVt2ot7i+bjamnR1AlnBsGXo5wGeyOs+X/bOKCEELHCkHUYmRumSqVlJ//eEp2J
 cqjYJ7MbuhKSwD4b61mDGrnTzjJ6tgvognatra2kdUj08piFO/r3dAhulaByP7flYLZZ
 5vu94ehmxVSNjduhGEAiyz3mFw0HpwXX4n7594DMFWgTDMNPOcBBjt7VSQBbCNsTOeYA
 tSt/xbfhYneMjFERlrbwEeThn2HyKl9OvQtzwax2OsZZZZVcZoLnlHXYg25oLuXrD/J+
 H5WLHdjZhnwypyxRMdwfIRVwffFpQwLojhggFdoolg9mJN2rw1q/koM1iBf/u7o+phG4
 zfiA==
X-Gm-Message-State: AOAM533YMeblV/eK5M4YcNYJFVSjpudU85HEU4QwCuaMOvUIm8x/DfvA
 jQukyQRRHtf+5ruqVb/d3/cflnqcXg==
X-Google-Smtp-Source: ABdhPJwrBA/11mAg/pOkn/zbVpAwEHWyNgvNOkMVN9xeD9R31M6hU7b8jv46jT4ggUwLalDuSU1VGQ==
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr1194688ota.311.1614813280679; 
 Wed, 03 Mar 2021 15:14:40 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f193sm1879302oig.8.2021.03.03.15.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 15:14:39 -0800 (PST)
Received: (nullmailer pid 846313 invoked by uid 1000);
 Wed, 03 Mar 2021 23:14:36 -0000
From: Rob Herring <robh@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: bhelgaas@google.com, hes@sifive.com, p.zabel@pengutronix.de,
 khilman@baylibre.com, vidyas@nvidia.com, linux-riscv@lists.infradead.org,
 jh80.chung@samsung.com, lorenzo.pieralisi@arm.com, alex.dewar90@gmail.com,
 sboyd@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, zong.li@sifive.com,
 paul.walmsley@sifive.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, erik.danie@sifive.com, robh+dt@kernel.org,
 mturquette@baylibre.com, hayashi.kunihiko@socionext.com
In-Reply-To: <4e63c5515f9755d0cf4cd65ab70048554d917d89.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
 <4e63c5515f9755d0cf4cd65ab70048554d917d89.1614681831.git.greentime.hu@sifive.com>
Subject: Re: [RFC PATCH 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Date: Wed, 03 Mar 2021 17:14:36 -0600
Message-Id: <1614813276.374609.846312.nullmailer@robh.at.kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Mar 2021 18:59:15 +0800, Greentime Hu wrote:
> Add PCIe host controller DT bindings of SiFive FU740.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  .../bindings/pci/sifive,fu740-pcie.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml:114:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 88, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 114, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml:  while scanning a block scalar
  in "<unicode string>", line 88, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 114, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1446288

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
