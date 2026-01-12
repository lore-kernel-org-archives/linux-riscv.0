Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FFCC9EC82
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ncrhz7yAnL5dH+/EL/NG4KBFBGQvWx19iuyt94PbPpo=; b=fI8l6e+iyH0DW8
	KCh9hjRKPYCBMS8R5oAMTr7kDFVXdwaKSMnpLfWGStVTKQB1lkQXzpDxGCjw4+5MRGCDFqhpEfJsb
	okTlBwlKjZUFypDsNs2cyDThtRe2PXsSwgWL3Z0BQXSCDdJKP/rsFJ1mxBNEiCARm8W6gE/xlVAhn
	8zDwUXavgkccj5EJYESm+664Zy22GOy/O9IOGczbF13jB7GX/3G4tQ8a4JIv2N0faxpyDDJ0C61Li
	AgDLsOA4p8ImgXb7McicWe4muhTWFGnV6ZJkUwh05/8SlyCqY97RwaMV+8rkrIb+ew+dglDLlwNDO
	marilq6keGk+61r9UB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRi-00000005MAD-0Rin;
	Mon, 12 Jan 2026 12:54:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRf-00000005M8x-0Ptz
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 12:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Cm1NSak9WVWnM5l9pqLl0T/8D4EW3BK+pbycyB1csg=;
	b=NL7ayFGAJD4P30MCIIS2gefkkh/4OwhpZstrb513hrjinVsdD2lS0LFtOlF2Si1i9SKoZk
	MSYdIpcoMvI2jgLfo8TkJ9dlm0WG3jIt4vEzD2Sv3WlqbuS5pehDMOLnWVRDWfkKwqJWtD
	u+dvCtQARJU8LSZPFBhZJ51Cjth0ki8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-NYFJrGg7M7ap4-H4BJmMcQ-1; Mon, 12 Jan 2026 07:54:52 -0500
X-MC-Unique: NYFJrGg7M7ap4-H4BJmMcQ-1
X-Mimecast-MFC-AGG-ID: NYFJrGg7M7ap4-H4BJmMcQ_1768222492
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8715c50725so113545066b.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 04:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222491; x=1768827291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Cm1NSak9WVWnM5l9pqLl0T/8D4EW3BK+pbycyB1csg=;
        b=Kt0yLa2zWxos7hQ1V1c5KTTOiOVRLvyFrOySr24Stcp8AS9d5OfjPWlCUXLdtb1FoH
         LlTZmPDNW7WMuO12sFuVofOSkBdT0uhh7MyxkByVroy+C0uFUuU7OmdrygqXbcmbumg4
         hWwhft1674pfUfTb9xCEtQWF1IthbGMW3CIDFD6hO+NoAanP1BGI3IdPTSizT80YvQiu
         tygNVIdYFGHypdGtIWXo4LO1LTTqhCVfzBKJbn7tzD0ESJgtCoQjHp0/RIzO6saIvxye
         X5TG5UeBd3Md158FtSvtY+MCkO/lQF4DSBMA77imDToIgQB7n5ih7mPIGutr7/5iPfXp
         cJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhfkYhYbMsQeGYTOIwqmMHC8TrSVQDORzkJutzBo+PRXBQROHzVpUJKTrv9AKI9Spwxm8pDF/qvtAKlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLksPhMVC+2fQCjXeL2xkV7+IeUiE9QDN8Jxs91+/D0CAFy5gu
	7l5R2eUFxOhpnr3HLROotVVcytwqRIISg34xYITB690LcDfcqjuC9musow8Dp/JN1MhhDno3X4s
	Kk+0ic6SCG8wGNKs7WNRTO2tgUmNpAZI3EM+e331hxKI2/XpleFPJHBk1luDCq0tTZ6vlHw==
X-Gm-Gg: AY/fxX68jMB3w22Qz2S7TZchmpqgWCbRCcq6VALlzRtnZUXhBOYLXrsDQ5o7e9ubCUT
	c9n3K7HUHDYJMdQ+00t9t+uz8YHPi4tORoO34BhZw3AYW7WM1uQdf8dI5lI5/pByDfWmBn/Y6O0
	kx1uTDld52FCAs3c8dd18FQK0iMAFI6mhPgT4EOJXjq39FzgohTcSJkRjscVvJbB/rw8xsPdghU
	T4XFr1bxInYMGKvCaLt/5pLy/yaA03n79v92WPs+44970kGsXz2hDc9dpVha8rhX7E5vCOmR11u
	ypwY2SJWqn5op8gJZIPVq6n4TZac9fHw7YfalhRvNkJsrTBWNhWcr6hBtVqiB4l6i9UE2e+YQxO
	jEfZ1g0/thCV4gnau7gmQOP0QKNJksCvs1zYoy6NCbwPqNY6/7TU3l8NNkVw=
X-Received: by 2002:a17:906:fe42:b0:b80:3fff:336a with SMTP id a640c23a62f3a-b84451dd5cbmr1891320466b.21.1768222491509;
        Mon, 12 Jan 2026 04:54:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3ocOYDaQBm47WQWHUtarwXWjqqK7PcY8X+pPMPt72lDykLUFXJDGh1s3S0jmZSzBP3eyQDg==
X-Received: by 2002:a17:906:fe42:b0:b80:3fff:336a with SMTP id a640c23a62f3a-b84451dd5cbmr1891315066b.21.1768222490986;
        Mon, 12 Jan 2026 04:54:50 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:50 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 3/5] m68k: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:29 +0100
Message-ID: <20260112125432.61218-4-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CX4pWgrZkSVqiUJKnEyfVfIX19H-J4hltZcK-tNWeZ0_1768222492
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_045455_213473_D2B1EFCA 
X-CRM114-Status: GOOD (  12.07  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the m68k kernel configurations to set NF_LOG_SYSLOG and drop
the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/m68k/configs/amiga_defconfig    | 3 +--
 arch/m68k/configs/apollo_defconfig   | 3 +--
 arch/m68k/configs/atari_defconfig    | 3 +--
 arch/m68k/configs/bvme6000_defconfig | 3 +--
 arch/m68k/configs/hp300_defconfig    | 3 +--
 arch/m68k/configs/mac_defconfig      | 3 +--
 arch/m68k/configs/multi_defconfig    | 3 +--
 arch/m68k/configs/mvme147_defconfig  | 3 +--
 arch/m68k/configs/mvme16x_defconfig  | 3 +--
 arch/m68k/configs/q40_defconfig      | 3 +--
 arch/m68k/configs/sun3_defconfig     | 3 +--
 arch/m68k/configs/sun3x_defconfig    | 3 +--
 12 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 3c87c1d181a6..1955fe9812f4 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -200,8 +200,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 03eaace46fe7..879ce8fa40d9 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -196,8 +196,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 61228b9d2c2a..bb385edfdb95 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -203,8 +203,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 83fcc12916c5..5fc0f94cb64a 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -193,8 +193,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 84d477e95fe8..d7c5cb651cf2 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -195,8 +195,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index b1e911a138a0..83d811a48296 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -194,8 +194,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 0a2c3ac6dc7f..8d92432e96ef 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -214,8 +214,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 2087fe4af3d6..5d4017224a3a 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -192,8 +192,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 4af83b643da1..6064459bff9d 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -193,8 +193,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 56c303097050..75ae71ed6ff8 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -194,8 +194,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index de2a5b27d408..75fade03e947 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -189,8 +189,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 297b8edcff6d..cdd56ecf4941 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -190,8 +190,7 @@ CONFIG_IP_SET_LIST_SET=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
