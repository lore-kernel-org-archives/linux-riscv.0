Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7vdT6DHDo7bgJ9FaV8BxWwT+Xw90sInwuBWbsgQmcNw=; b=dyf8iGeET5kq4x
	ZDVhjUH3hHq0nEjWFSc3nJVGImU82OoL0C0FtNon8CWUv4Wp1DjMpWWUQUnSuv/zLM0/K8BOvC2oH
	p7mIgOI0tjtAh9wHxx6H2EEkThK3eYqwPrqnTU8R96DrBnhK9lRXm/9rfkFR1HAuzJLdFcVUz5aKN
	QRf9wWZidXN0MnMefI8XhHT+VWmCGyKfoKucDjh6uQCkwLBT+jx89pK3jFNhrdl1NbxsnDZVMIBCi
	OIACKjYbwdvO5GfqTLj/O8N1Gox6vZLrZlkKyKR8pobh6z9sCvE5ZMDCItEvS9QBwtoCyL89Y0xb9
	XLLGqNIY4olRerxTxD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZY7p-00G0ec-FP; Wed, 30 Mar 2022 13:12:37 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZY7E-00G0OW-Mu
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 13:12:05 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EA2E43F6F0
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648645905;
 bh=Ks7NWEAabN0OgJ9v5xwMH/MFvcIhgaiRHsVNqrdnlgs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=uED5FHfLwd4DBhzrNsXWRP4xH2ImyZh0Dj2kMilmsYcnFIC2x3g1FHaPxePBWLmN7
 aEPyLEBPs0eGKEoyCKr2FoCcwsEJ5pVFaLhtOxv4B/rA9JlRBbaWtmt/iIAqYpF1lY
 1L/ZWYq9ktiQnIeGuoMZkogTLEuWrPjULgKwD1I5AGey/hFN5dKNZ59TXviaPcCu2J
 lErNQ5t1GJJ5KmI5Vw57mwg9KrfkHq++cMhAYDXUc7x8vgsFuyIk6WWPfG04SLBUNi
 jJ3ItE4cnh1BznRUAtcPxzdbthLEgAfIPVqs5kQSjDq3CSNwX5XZmI5n55T1EymQDE
 ZQu5Nf5jo6jHQ==
Received: by mail-ed1-f70.google.com with SMTP id
 i22-20020a508716000000b0041908045af3so12832316edb.3
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 06:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ks7NWEAabN0OgJ9v5xwMH/MFvcIhgaiRHsVNqrdnlgs=;
 b=nSgtecKIdqW1ZmCD8A2HjCtHNKqtxwQwd+WKCuES7ov3MF6xEtCs6tpCbXL+23Hbxn
 33mMeUsTTI60Z3Jeup9dD6tY5sUk6S+dtg1DUXldTO/zYO5qMVJKwNZieK64CA27toGM
 YQm30mdlN/VuZkV3IDUfgSkw+3IB8tLZzrfa/yaC9gVbFbfiRaov4La5HCNC6PzTLZ0z
 yTDDFLNVx27AZwKATu2smmCmhlXlDnZmbr6u5SrNfVhTzRW9PY+5SnQYwgZlc4BWSF/g
 O7PQeNiwYUkVBiEMkChi9ovgOabX/d29rQK/QnSvX6DNE0fOfQLSgrgD57LXj5SP0ve4
 R9tA==
X-Gm-Message-State: AOAM530SObr8a28iUW7vhU35I/12MYQLEDv8ykUNDtCPi1QDLNsZl/pC
 Y/vPg6F8tlhBTNYdNVUP1EQfHNNatWFGxHQulol7EYqxReXB5vcqbSMhjNs+5gDEaE87ldRqBKK
 v1tGVpPxsBcjNLg7R+UY5kGs+g28SGM9317chwVcYZTHUYg==
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id
 z14-20020a170906434e00b006d0ed9c68bcmr38789033ejm.70.1648645905333; 
 Wed, 30 Mar 2022 06:11:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynL7kFIaG0yLbTJ5jbVyPI5GNCWFjeJ0MDw8T3gGcxn9DFQjQabMUZ6cT2WzQZzRlKDifoCA==
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id
 z14-20020a170906434e00b006d0ed9c68bcmr38789010ejm.70.1648645905100; 
 Wed, 30 Mar 2022 06:11:45 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
 by smtp.gmail.com with ESMTPSA id
 fh10-20020a1709073a8a00b006e1c1abd0ddsm1194219ejc.54.2022.03.30.06.11.44
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 06:11:44 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: scripts/Makefile.modinst discard-locals from modules
 on riscv
Date: Wed, 30 Mar 2022 14:11:39 +0100
Message-Id: <20220330131139.401658-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_061201_018030_29987C27 
X-CRM114-Status: UNSURE (   8.38  )
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

On riscv, GNU toolchain generated ~800MB+ of local symbols in .ko
files on riscv. When stripping .ko on riscv, discard these local
symbols by default to make .ko module sizes comparable to other
architectures.

This patch is tested on SiFive Unmatched and is shipped in
Ubuntu. This can be revisited once improved GNU toolchain becomes
available and is used.

Link: https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1036

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 scripts/Makefile.modinst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index c2c43a0ecfe0..fc8fc19ed754 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -46,7 +46,11 @@ quiet_cmd_install = INSTALL $@
 ifdef INSTALL_MOD_STRIP
 
 ifeq ($(INSTALL_MOD_STRIP),1)
+ifeq ($(ARCH),riscv)
+strip-option := --strip-debug --discard-locals
+else
 strip-option := --strip-debug
+endif
 else
 strip-option := $(INSTALL_MOD_STRIP)
 endif
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
