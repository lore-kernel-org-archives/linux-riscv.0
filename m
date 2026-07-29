Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DE0C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BxP2Q8W6W9XEVGPEZW253Rl/SnMJ4yyQX9aCaCfCGIs=; b=AmXWl1qa17TpZZ
	RHpSegYYel219D52tKX1EyYtIWgdqgpNtSq7sCl7jp1FxvKt2Y/v7uxSbIzw9pGBhNwSaooFVLKCC
	9ajESVegMXjwk3aMZeZOVFxW1TJD5ubesXyyTPNl6GR806u40RRy0HmeZm2sZcU8+NcX0+G0pCPll
	03IYNSaXEkBw3M2JUHrEs43Yzlv6YmYIywvYikRwCRjaEPwD4IdTfzleoCZHIbU6CVX2b2WLrDMcJ
	xWndVPah2D5vGe71Yk2zxZ2FbsM3+HO4nrlrVNkQaBxnh3PGAo0PB+ZykhRa+aqOuPADN+P6TZidF
	qV80ELSg8dpQnSPFW/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Ja-00000008aI7-0Sp0;
	Wed, 29 Jul 2026 16:39:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7JX-00000008aHN-24hG
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:39:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8045575e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343165; x=1785947965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=opojOAysGb4SS0C41Z+S9Q7KC+QECKAFOdrhy1fGtww=;
        b=gXRgK7GuptLm+IZw/SAFCg1shuhik/dAfhW3pS4ceFaSCkDBecsu+tn24RKfP/hmoz
         tJMP07aevjb+2b0c1MWvsCyqAFCe+l9+xhHlrSoT+Cmm44EA5fmne7TnQspL85Tme2oH
         GmdFG45e9rjGwu+C1e1D2/b+bB3gDJLLmjXU61oQOSsVmU5uevIQM8yezPkMQ1VUoLDS
         p3JZQ9nn/1F8rFIN7COyBkLOAn7MUXT/YhUHAR5glHCwSWAy/3kr0aObpmpBwN6BPO/d
         3ATJ0yNYyWUiVPBDB1kGBcxXj8fUqOnFk5BKk89Pfm6499SKg1m/cM7aDtKooaVsyVCc
         PhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343165; x=1785947965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opojOAysGb4SS0C41Z+S9Q7KC+QECKAFOdrhy1fGtww=;
        b=r3eXsrCes4RQRkgclUp6K128XZlR+6Di/tE8xEf8wdpDOQ84bADhIQjd4tRJTYs+C6
         F9zT7D02lkM8TWFbUCkyJpLcTbl3EzpMvhRx0ua6k/BBMgs73eWWLxYwj4SVXk6rgL3w
         3cYELg1yNB4R4GwB92U/P081L0Qf6bJcymRWwMOb3thfTGPYU1xJTeLcIeHCchy/GW1+
         3I7E+0S31F3vyMwNi7uE7rcMWQ1U7k6j5Aw0STJguUs4XTOerxPb06bpnp+y2Z/e6327
         kFUGBXGshPDx9ol96L6wgOPLnNgwtlNh1lJ6rMtQd8yEliqWIPVk6dKM5XQXje0Y5PK3
         OTqw==
X-Forwarded-Encrypted: i=1; AHgh+RqlSHfcMNSreE9x04MNjj9tl/5Fca4F3v9epRjWM6zcDHJdC+lTRgPBHqAaoy8rjapL7xelgnXMIsrohw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiweH0TQ3sxr19mjpQUNSRUMgQkX8KjRCeTKRZYLGCMl6cMvjA
	lFreY6cRs48N6poXzAhnpQvok0SPENxbc7BDG4oOSOMeikO/7KggyI/cxOG2q4Q5/dc=
X-Gm-Gg: AR+sD132uXTa+Cr1FMSS2/29pEqep6ZmA0XH54wMa9APcLXrHuQk3O/3xNdM6CclqDg
	mcYgY0/LHGOBk9Fb+LEg2ORNisE00/NinhcKhFVZLzZ3OSFM2WFwJihbTnzJKUxA8gJhDXV0EB2
	4/h7aqh75jDFq/L6J/4XbfDqY8JuUE2mVGntXgiBw4pj4spUKOMU9ZP6TYOgHte74g/pEUQ/Sn0
	JUzKkUkT8X+IA4UW73S09FMbOqmSHeZ+W9pE5GqHCVYDluQxeslY4gwlj3Vcvt/+fTsnnsf62rX
	xnxLQUjzK65LnyHLrtWS1hJVOBppUf2bxRGbmSCg1Rr6GVT11RU3QG09Tmg7iw3Qlg630FIIoCi
	mkfj/INllWRZQTxfb29IysrlUx0COF+qe6qvrLYBFTSMgKB0bgdBA8Zu//hG9ZpYxog1FJ+xrSD
	iF48yyPX0eTX1NbDLqODGU+UzV3bZV5xSUec8UKhIOhSzUapUsWNvSYKJ7ksroB50LENXRJiIlI
	zw5f5sMbOM9uf4rL88XOdo=
X-Received: by 2002:a05:600c:820d:b0:495:5943:b76c with SMTP id 5b1f17b1804b1-496c658f5fcmr82136345e9.34.1785343165663;
        Wed, 29 Jul 2026 09:39:25 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:25 -0700 (PDT)
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
	guodong@riscstar.com,
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
Subject: [PATCH v2 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT bindings
Date: Thu, 30 Jul 2026 00:39:05 +0800
Message-ID: <20260729163908.249838-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093927_567926_005EBF9B 
X-CRM114-Status: UNSURE (   7.33  )
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

Add device tree bindings for RISC-V Worlds, a standard extension that tags
every transaction with a World ID for fine-grained isolation. SiFive's
WorldGuard Checker is a hardware firewall in the system interconnect that
inspects transaction WIDs and enforces per-World access policies on memory
and MMIO devices.

wgChecker specification reference:
https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf

Yu-Chien Peter Lin (3):
  dt-bindings: riscv: Add Worlds ISA extensions
  dt-bindings: riscv: Add Worlds per-hart properties
  dt-bindings: sifive: Add WorldGuard Checker

 .../devicetree/bindings/riscv/cpus.yaml       |  61 +++
 .../devicetree/bindings/riscv/extensions.yaml |  53 +++
 .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++
 .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
 4 files changed, 556 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
