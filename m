Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8DCD4F38
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1m78kehigQz5eMCgErZ2FsUuVLM9NmcWDJlk6hCrhDc=; b=OkEq5b70tf0F/F
	RrkxuRB8KFjp1d9ldk7pdS5CDQrUioXSu25lGF42zQmDC9dw90joCiO6Sk1aiiWYBUI9J1yxSaNbF
	eoebyyIVQ72IzCNrlAUF9xzZ0HPaISXWN2+8gJ0vJi0z6otv88QYH3Q1/WO5xvC+MTdG1mS0G79NF
	YQjdvuElDm0/fZlr0UJf0Yqc4iHqC+tBD/EjiVgAColS535ONFRXAgvfIu7IK9I0dk2GO0jiZfYyq
	hoP2tBnXaXpAbTYk6mT4AovbX+GZzhAL1c9GXdykrxfpXCDyL4H223TVekBNCTo6aQ9I+5e9UiCE9
	YIelCAI6avRik7eSdWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQw-00000009k3z-2fVS;
	Thu, 13 Nov 2025 01:47:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQv-00000009k1W-1LjK
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tJUQdwbie0o7hgZvF0fBCgnf1I3C+S9yUEzkmCq2LO8=; b=bqR4NS4jCI48XHpAlrIJ0LVLQw
	xLrq8tTZMIezi2daVucaYfrOlBy3AE0a3vSgKXubwnS/w36v4OMti+RWm+qenvYrXBDVSr9ZWXbRK
	LRNY93Z7h8wNbzdjmNgyK5/tXJxluvHJS1f6PDSM6i0/tbw7YlK4R87/HL6rDrlz2/+zozskd+UtX
	sz+FNsO3EVmE2+rH+ySHBQzGM+wV2Cz/V9al6mM6EdqsdroxtNVUos/fTL5wcXqrrhcVaW9rAfvoq
	YwodWiWSbYGUbxqxauRIZfyQrJm7FuTPi20PPL1rjp1/CmIXK3sWQ920/Fqv0PxZ3edSIeeqXCtAn
	2XBG250Q==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLZB-0000000Gmuh-1K2h
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 00:52:04 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ba2450aba80so158547a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998446; x=1763603246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJUQdwbie0o7hgZvF0fBCgnf1I3C+S9yUEzkmCq2LO8=;
        b=DPXVXh2PN4knEoEPQSl4JnsD3IB68p4X9usiFxkn1+TYKWROLmARj07cgbvIvUeeUZ
         dkr7FiobXx1UAvq73X3rfE4zI1Qm+Cr+RUUzgr1EEvmt9msqI1O/GoOsSDFjmiGNG4Et
         XZsl2WXvf/xSLNQZKQCZjJFMkw4kidKKI6txhxSE0iwyhNdhgNlYgK5nARkyX8hhdwfc
         nUk4OP8AVezMXPbJs5pyV5/LB/bhMJAgGyWv2WzcsoATO09ML7qLPj2I2slM3fAREPM9
         Xr6ARPkEEADWcatyzfxbI1Yc2Q5OLatpo+DYsp4lyIyLDNsKTlbC4cyzh2QVZ5/iq2zR
         tSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998446; x=1763603246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJUQdwbie0o7hgZvF0fBCgnf1I3C+S9yUEzkmCq2LO8=;
        b=Jf1NMw0V91ZYfOpZxuIj2+rLgT+Xrt6qvEZlqsryrmYpCR/mOo2dqZ1BzDKXF9pAoB
         WKvLvXL9fcfD252OWD9Eq3LuO1s56N248bME8k1j3lHdPXVZCqGG0AJTGArUxDDOvvv0
         gctCa6BjQLNBq7jMcSX5Bk4dwVGXqaJCLlW9U/oqyYbNC/3ju4q33zhqUpdUqvPxM/lG
         bbNxZ3n5K2NwuHIatuVWYUG3wUaspP5teUHhYvMdfrpVAIdu+9KX6MzlgQUHx0mMIlrG
         JBW+52MKQ7e+7XNcRO0imsKd9SZj8h2mFNZTJcU7j1O1jEH41aw8OtpJ4aWqYiGFqVJF
         uYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEQENZ7/hYplB641EWeGKMHYiFWel2EHGB/S0F+Gqwlag9Sb+PPKFl3doCOt6w9RUp4SO6YfLPExfiJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV5LvFis17s5QUCReaoDMraavIscXwIpzrjq/imdaPmcB1JV2Z
	l3iTOwm5DB2t5VR1SpvMO2UreSQ5Lcu8ZeHWY43CPXWryABtiWE3IVhlWPkPLKCe+ck=
X-Gm-Gg: ASbGncusFfdNASnXY3R5p3dlmHaTS7Xuzh+yXJZMbdUlJz/3JiQcX2dWZE7JHVh5LLP
	jdUWolZDSVDPJCmkXeMIUfZduABvdowukizRXyQvtbK+x7TATZxdb8QGdD41RhRc+dI6VnuF80J
	tc97d02Fh8saMPRWWKNaUTxxFmQzJ3ue1WD9Cq4T1yTB15TQtsvquoCf+uCekCzDKZoZtiGRUSd
	C70v7rWum6HTHMhO5LWui8flzv/dNsGvq57bDUrMdKbjck8IuW14q3NsyT8j/i3Nd4o7D31+5lF
	TkPYrYXflzoKAg5IW2Xo3ANMiAGH3S3VMqKWy/CoCBigmFAtz1AJ2sSjV9Q72K2Mmqspi7YjiNv
	/j6UvuFGAXrpp4gYncIlg6JITIvY9pn7VkZqnfMlta0cbzLa4n2SQsB9T/yU0iHjwhCrwiZIRGZ
	rWPPMGeqd72gWaVrz1gfUc6g==
X-Google-Smtp-Source: AGHT+IHaQsvIpnkLWjWR0rawHh2zoCdjthdQ4AoC5mETU8kGh9msFPBhPFlU6AScOiEA10G8iQrBZw==
X-Received: by 2002:a17:903:3c64:b0:295:3e80:9aa4 with SMTP id d9443c01a7336-2984ed46fcamr62454685ad.22.1762998446285;
        Wed, 12 Nov 2025 17:47:26 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 18/22] riscv: Fix logic for selecting DMA_DIRECT_REMAP
Date: Wed, 12 Nov 2025 17:45:31 -0800
Message-ID: <20251113014656.2605447-19-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005203_037358_34DE68A9 
X-CRM114-Status: GOOD (  13.63  )
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

DMA_DIRECT_REMAP allows the kernel to make pages coherent for DMA by
remapping them in the page tables with a different pgprot_t value. On
RISC-V, this is supported by the page-based memory type extensions
(Svpbmt and Xtheadmae). It is independent from the software cache
maintenance extensions (Zicbom and Xtheadcmo).

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3

 arch/riscv/Kconfig        | 2 +-
 arch/riscv/Kconfig.errata | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fadec20b87a8..cf5a4b5cdcd4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -598,6 +598,7 @@ config RISCV_ISA_SVPBMT
 	depends on 64BIT && MMU
 	depends on RISCV_ALTERNATIVE
 	default y
+	select DMA_DIRECT_REMAP
 	help
 	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
 	   page-based memory types) in the kernel when it is detected at boot.
@@ -811,7 +812,6 @@ config RISCV_ISA_ZICBOM
 	depends on RISCV_ALTERNATIVE
 	default y
 	select RISCV_DMA_NONCOHERENT
-	select DMA_DIRECT_REMAP
 	help
 	   Add support for the Zicbom extension (Cache Block Management
 	   Operations) and enable its use in the kernel when it is detected
diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index aca9b0cfcfec..46a353a266e5 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -108,6 +108,7 @@ config ERRATA_THEAD
 config ERRATA_THEAD_MAE
 	bool "Apply T-Head's memory attribute extension (XTheadMae) errata"
 	depends on ERRATA_THEAD && 64BIT && MMU
+	select DMA_DIRECT_REMAP
 	select RISCV_ALTERNATIVE_EARLY
 	default y
 	help
@@ -119,7 +120,6 @@ config ERRATA_THEAD_MAE
 config ERRATA_THEAD_CMO
 	bool "Apply T-Head cache management errata"
 	depends on ERRATA_THEAD && MMU
-	select DMA_DIRECT_REMAP
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
 	default y
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
