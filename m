Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D32C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Ebi6/tToho9E7/GuPTPjWxewVFPq8qeU2soStCSAac=; b=OxGadgxjFJClCO
	5jQV/MBXdO+TiDRwXJy6UGCzT66APmX7y1wzdaAqvMUbsN9UWsrj30od8BA0UdPJERBqseWOhb6dx
	Ebxql9O4VdgIOvj8xxsn1s8ciCEqd2+V2j3rYuWT51lri852sAdV75hLvhBvqRyZfOGfDWyPVHGvo
	DYePwDpCDjYPlcUtiEY5RZYzYG2wxbIeQ9Qt6jOwJBXXDgD+p7qoe474UcUpAFRLEzN6vWCuyiIkD
	CSk228SS8g+I+Uc2c9Z9vXEWlNGyf63C9tTDDUkLRW7Eber/4/I2TNxcEsFukiV2MjF+kDW/yxu88
	Nxii+FE/cv9YNWA9jqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7xx-0000000GAwS-0dfL;
	Wed, 12 Aug 2026 12:21:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7xt-0000000GAvk-3nEi
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 12:21:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so13017415e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537307; x=1787142107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeHBK+ZUVXf1IPAtpZKQyvyBgKkify1wwk6CszLJxIk=;
        b=QODM+8KoHw+xoAscnWFmQgYk1dPUEL2DRLph7F/MXlFevS7eE47lYDzO2hDTJsbN6Y
         xbjz5verw17tJSDfw1iyYzH8SQ6rGhm/2EX4588x0E8lUI2gsDpflrr3uYaMAEjNKMIg
         McJwG/ufQGSrBhJWavlJds0XSPBDSXg6wMhDmxmXaa2UuyzASS81y2NJQv+/djnTrr1i
         CHYeLUBrgHZnyKygHLJQ0+RI9KPEa+DrlNpjbhGq6rtqK55gKGUVKZbkSQQcOcfy+7nZ
         TkSHwrapDIuWdPqdQ17QP5Skd8XbtwhOmTSfSKqfG0O4cd57AQcwRQhwbV+zc9FCseeS
         ZUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537307; x=1787142107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeHBK+ZUVXf1IPAtpZKQyvyBgKkify1wwk6CszLJxIk=;
        b=eVQbJnMpUdtDv5az8GFSPoP9Zm7tpbbcB+8OqLzS4UBOsti+r0b16EvaLGMBEVLwfZ
         zlorLUpgS/UBhXs65FmLKpi+/wyjEkN82/gbQbvEIIEKi4FJxgafguWr1pfuUqnPVGe0
         i7xxC8hpUS+5gQoMhU2tGaDNgnCUOcSsrz0iPye6LT/4VP0sWUhHFAd933pJ6BLfBdyw
         dHVT6q3SiaViaawpjuE9obcSTJGPoLy/ZOW3jx88ra5JCWIYmH0cfG0bbLzwC7prAfgm
         SrU7pbQVWLjm2toVuBko9MtB8YKhsGStMxWYSXrbVatORKCHQayl/vzLk0ZSHRtMXunm
         scfg==
X-Forwarded-Encrypted: i=1; AHgh+RqVz5R9zVCIqu/JqES+0SdJSWSFwHmx9v3gwaTrfq1evdeP8Rm8Fea3RPkRK2vlXOcvJsqcEyQbOojixg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdepRUxUiMOisJ5LDCWNR3PS4CKPD5V0D9TmieY0mNSsRo5VHj
	HrO3gQeO4EjtTpPQsxHEL7Y0yFQLCNpEuPSQn02cbq7AgpymHeoTfYHW0D1K5yJiySE=
X-Gm-Gg: AR+sD11WEK/0NDiYWdshOuGBq+hsIz0fQMe8k9UbHAk8cY21mJxC8O1Phh49LOkvbk3
	zITTLrhyKGCN1vIjp7/atHhcTW0sl27Ao41tO4Lfdhktp3epcVdSDGg7GSC3PRGcawgo/QfvCkV
	K4EvquSVbCrvFbXxbdMdWXnLtUV4fQpm+dUzs/eZ/aZP0I2RjWrLcKdE39jDWNutRLvUSliSiDK
	kd6+8X2jbU1Be3Vra9IyhH14j6DqniRa4sXU5i6sv2K2o5aCreq+E/4gXiuAxeNAHekblbYge3g
	sH8+sd2vkYLso/0q4ukEJnXlfNWXdqYQIaSxn2zdErpZphfVjTmFCouWCBzDEViZS6P87pLhKwp
	/P/tiosiROT/HfoKPSfbl6sKinot1c6Q3hpAkRyKQMTxa8CDJ3eurKD6njrmdYCCHhtpoH0ObS2
	aP9x7UUTpOJbhaNHRcN9Kv0GsP7P9oxnD2fN3Jd8dIbStVWbXUcO0vjJXk+EfFuY3o5XEFsoWH9
	v1m2zuNCB34
X-Received: by 2002:a05:600c:524c:b0:499:596b:2e91 with SMTP id 5b1f17b1804b1-4997c393b0bmr52627565e9.3.1786537307508;
        Wed, 12 Aug 2026 05:21:47 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:21:45 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT bindings
Date: Wed, 12 Aug 2026 20:21:28 +0800
Message-ID: <20260812122131.1534906-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052149_986899_592E869F 
X-CRM114-Status: UNSURE (   8.50  )
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

This series introduces device tree bindings for the RISC-V Worlds ISA
extensions and the SiFive WorldGuard Checker hardware.

RISC-V Worlds is a set of standard ISA extensions (Smwid, Smlwid,
Smlwidlist, Smwiddeleg, Sswid) that enable hardware-enforced context
isolation by tagging each system transaction with a World ID (WID).
The extensions allow platform firmware to assign WIDs to privilege
levels, execution contexts, or isolation domains, and delegatable WID
management across privilege boundaries.

The SiFive WorldGuard Checker (wgChecker) is a hardware firewall
positioned in the system interconnect fabric. It inspects the WID
of every transaction and enforces access control policies on memory
regions and memory-mapped I/O devices. The wgChecker is based on the
access-controllers framework, allowing protected devices to declare
their access requirements via standard phandle references.

This is submitted as [RFC] because the RISC-V Worlds specification
is not yet ratified. The extension descriptions in extensions.yaml
carry placeholder "TBD" commit references; these will be updated
to the actual ratification commit before the series is merged.

Yu-Chien Peter Lin (3):
  dt-bindings: riscv: Add Worlds ISA extensions
  dt-bindings: riscv: Add Worlds per-hart properties
  dt-bindings: access-controllers: Add SiFive WorldGuard Checker

 .../access-controllers/sifive,wgchecker2.yaml | 178 ++++++++++++++++++
 .../devicetree/bindings/riscv/cpus.yaml       |  44 +++++
 .../devicetree/bindings/riscv/extensions.yaml |  53 ++++++
 3 files changed, 275 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
