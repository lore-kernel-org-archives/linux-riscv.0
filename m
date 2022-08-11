Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52CAC3F6B0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mtqdZQosboDePzZBHVaE+urth3isleXonMYUxeiqtuA=; b=S+AISza/UO7KuZ
	1fS1pzhLgNyvF9HbqsthSlGxOdNmS452uKkw92L0NRjVCmo5s2pYpGwDnOzo0SKpRxvHNVcH8JJxV
	IDfv3S23gCrgLUH/ZEKIN1YTvBRTwLu0NjTzXZqdwuiYs1EEh6XJL84JbC8E/RWOJZqkRQDNE4lbk
	v0wRO5vD7yjVG2FH7AtkATJ9jQ/j9Fe4UKVcCMz53/WJY9AEogwrOlmnNJ+ln/aP2j6FBoywjqh94
	VUOcB34sxY03DPCl9NJbZUql91MNjkxBl+wXyHhBipoJuXqXIZcZJVMJzn6AKck25eSbpQOBiJ1/j
	QgzMcFjYL0aT41Ly7bzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErn-0056VK-RI; Thu, 11 Aug 2022 20:33:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErl-0056U0-4T
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:33:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id z12so22543923wrs.9
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=AwFBVj1AIkQyEl3QVxY28aKxC3QzGWm0tn96deLuoJc=;
        b=DDAumPpJY84i7nT0pApYxKlneVwIQgt8vwqQLvGy7c1HkGrjDhyjVbLAgYdm+/lOxX
         0Eln2KNyeTSS0j337Z33jMYW2t55/hWIJqx/P2eBD6awcIm+qd6jpN/2TbXsgn5465LS
         K/NFS6v5DRYTLaHWTQJswJ2prE9V8jQASH+7MlIbRmyFTPq6hqZ6wqwZQLox6KDWj2Nr
         eWxkMHdghkr2hqnb5M4qTYYtyNlZ6CGhIlNQBh3j6zvjBjGQ67wCWdWM5iFowTFVr213
         z65+QfnI2AIe1Oo2BJfA3MWSR6ObPpva+iHHYT6p8QIi0T/IIgC871KLuRzBiEdiP5uC
         Ay/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=AwFBVj1AIkQyEl3QVxY28aKxC3QzGWm0tn96deLuoJc=;
        b=lE/syBf9gyaGeVh/g8J+VEle5sz9g/wJvs6NvgMK09DQ6OfA6QOYTGc7A+fjJMI+cm
         haqX1z1G47wIu4sdR2IZNKMCZKnmKJc4mkd2EfKBz8nIL7cvEaT8t9Sua7chZVfK5Fwb
         2NhCP9tmzkOAOjtQ5W2Jih8OPqb2K3cnd4vu3toJPmvOz9SBCDRompJ6waD8pbRWmqZU
         axOPxOyzRzhUFbc6LXkElTXHrwq8ITqCRzIHjdfWi58xZMfwVivnLri+dhM8tfrII3DT
         nlpTnopDIE8CbRf8qbopeocE8rE3JnrvM0hsYGb2JmLz3oevKJJlfzeKsXz7JC4p+7hv
         Da6A==
X-Gm-Message-State: ACgBeo0NtcZvjUQA1KmulBm6jOgqUTaS5C8QtjLQtoKZC1K06+MpSFA1
	Yk6TawkBm/FsbwULxmOFksX5Ag==
X-Google-Smtp-Source: AA6agR68hkWCKjlUq85a1gs2nnFog6KxB4PwaFgsSg26Klq7zC8ViNF/vNhirDqTKghN1ubO4rzS3Q==
X-Received: by 2002:a5d:6d85:0:b0:220:7084:35e9 with SMTP id l5-20020a5d6d85000000b00220708435e9mr345264wrs.11.1660249995412;
        Thu, 11 Aug 2022 13:33:15 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b0021f1ec8776fsm86643wrp.61.2022.08.11.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:33:14 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] Fix RISC-V/PCI dt-schema issues with dt-schema v2022.08
Date: Thu, 11 Aug 2022 21:33:03 +0100
Message-Id: <20220811203306.179744-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133317_195133_05562D96 
X-CRM114-Status: UNSURE (   9.19  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

Got a few fixes for PCI dt-bindings that I noticed after upgrading my dt-schema
to v2022.08. I am unsure if some of these patches are the right fixes, which I
noted in the patches themselves, especially the address translation property.

Thanks,
Conor.

Conor Dooley (4):
  dt-bindings: PCI: fu740-pci: fix missing clock-names
  dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
  dt-bindings: PCI: microchip,pcie-host: fix incorrect child node name
  dt-bindings: PCI: microchip,pcie-host: fix missing address translation
    property

 .../bindings/pci/microchip,pcie-host.yaml     | 40 ++++++++++++++++++-
 .../bindings/pci/sifive,fu740-pcie.yaml       |  6 +++
 2 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
