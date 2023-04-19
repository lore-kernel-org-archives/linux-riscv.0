Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A498FC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e82mDZj7DKhgXX0zHdPGrdtfMkKEIWQvpikR5UyOU2c=; b=3IIRKHbIxjiUJn
	ojiHsTWsCKmu5W+qtFaRieyyV1KatfBcaBP9U4mkZgAq0odrdV/KDA9zSftrx5NIGK/Hl70Cnb4U0
	XCkCheFbyoifVQXrFCDBtOfdR684i7ILtovpZAkjW1mkdWmsr8KtcPst2o6KvvP+RZU1ldUT959BD
	gIYEkhBAVzj3ps8mpc0ho8LyeUAGwT3cGwR1e/xMDmdc4l5iNYRzl3bgN/Cp2GcNFb3dOwsXAhqZZ
	4KgD/VN/C+42uhNHicktzh11HqRgjv1y7KzS/eNTMVipyFEbZ2IPnsSkzXlgKdc5hz5nJuhjuGdbE
	HtYvfUI7aUEpXVeaAEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6Fe-005E4G-28;
	Wed, 19 Apr 2023 11:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6Fd-005E3o-2C
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 11:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H7zDmqn6U8Eyb17uAoVJJPhK0/Ifl27eJMXTrX2OOHM=; b=db7QIzGBqFtMSlc0T1yJvT0bzf
	hVZc/Mt6lIh6YqakyBRRa9P7jP3/KEgdggRbA7VFxgpDoyFUT3U2Z20jlyS7LEpxTFWqS4Nr+nNm5
	UD8JlA2keSY5iYIGW6hEVb3XDPqQPXcSfJA0FcxuNya1Jip7wE8WCmqIB18aE11BXJdNOE12ZHQWf
	h/YaOCzvIXJ8qGjc/kMIVHNroeLbOVFnS7ef6RpODcp8mVPZ52FXVTdzxaqfY+cRfyX4uO2Ou+We4
	GKvSKLsmFKIZB+Y1BafY0A1aRPDllPySwAHsMOUuj9V6kUegpHB0po/ucAie+9mtndD/Al6yxdx1O
	P2D7JC1Q==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hx-001sQH-3C
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1a68d61579bso18252755ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902639; x=1684494639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7zDmqn6U8Eyb17uAoVJJPhK0/Ifl27eJMXTrX2OOHM=;
        b=rzuEY2qOeKpq90xSbNAhUvw+t3I72kxsPlvEC7slbJx9oZ6mmu89DjDgnsFLhq7KuO
         Wt57Eklvz6MGerBhZn+zO7UFpZ15XNmpuuwUhsEG37gK93liaWtJlKCwrt2a/FnzUTe+
         z5HCg6VZUjUOIo9F8rfd8VaOHjPNwVA+1x+kc2wTDwm7qonkWTsRz8jC1Itvm7NSNSAY
         a5X1WkIgUhDoNCGAK2F6F/Mxe4xIl1aVgypMSHghWGGh6VIPhepcxxkeK6szAoLR/YUN
         CS3WZYDAECq7UnQZ5nHRW9sRRpHAl9XVfxsKrrcgn0szOs0qnXHXC7l5tQ1KG31eQtEE
         cRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902639; x=1684494639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7zDmqn6U8Eyb17uAoVJJPhK0/Ifl27eJMXTrX2OOHM=;
        b=D6B+KL2pCrBskHQlXVF4Dmhog85rE4tJLvgDcWwxpzBnOzdjq2ULFixmP/fI9rojU9
         NPVDsD1gt6CoqNauxR9edzokVPQdh+zZgYzr3lsLdxQ8Z2naQ73eo1uTltBuWO4NtLC8
         +bgY4h+ALAqnWs3VVBKa4rCKD0eWn/Uro7XjtZvAQeZqQa89vwXuT1IknmWVan+pq5Ug
         b7LerNEo51VHmno2y24zMfVHdHfyCXxgA+wvaMYc4+Hj4eRRCDftgiiahKCVz0spAXcz
         k8KowSxeO5+kd4wOxaz37KcXLz5iLVPcQTTMnzZuU9BQ93hW3mU5IdHEExXAIPq1VAbZ
         LgQQ==
X-Gm-Message-State: AAQBX9dQy9jJZtkiaX4jJmLX+AHUypw67NskS14qYPT35wFEbme37KMm
	NXmDtMuMclGwi3lOIFaYIq0YlKBAsKuMXU8PyvI=
X-Google-Smtp-Source: AKy350bRyAzNw2aBgYQca4A9Dl58PbRRLG96ePo7DalZ4z4sxpKHS+SDAbx+Cwj9P+bi7KJe2/jZ7A==
X-Received: by 2002:a17:902:daca:b0:1a2:19c1:a974 with SMTP id q10-20020a170902daca00b001a219c1a974mr5715862plx.68.1681902639573;
        Wed, 19 Apr 2023 04:10:39 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:38 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 21/21] DO_NOT_MERGE riscv: dts: build qemu virt device tree
Date: Wed, 19 Apr 2023 04:11:11 -0700
Message-Id: <20230419111111.477118-22-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_121044_920122_E2F2D7F9 
X-CRM114-Status: GOOD (  13.42  )
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

Add the device tree for the qemu virt machine to the build. The
resulting dtb will be consumed by qemu-system-riscv64.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/Makefile      | 1 +
 arch/riscv/boot/dts/qemu/Makefile | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 arch/riscv/boot/dts/qemu/Makefile

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index f0d9f89054f8..74d99d28522f 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,5 +5,6 @@ subdir-y += starfive
 subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
+subdir-y += qemu
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/qemu/Makefile b/arch/riscv/boot/dts/qemu/Makefile
new file mode 100644
index 000000000000..07252b4ff455
--- /dev/null
+++ b/arch/riscv/boot/dts/qemu/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_VIRT) += qemu-virt-cbqri.dtb
+obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
