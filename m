Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A949BC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lQ79q1AxbHSZF+8VQReUJvGjz8GC0p/DzzCOQqDgCY=; b=CDdC9LA5YMtV4O
	vlYZL0ifFcjFO/KzICK4GZlpmbtMPpYntQOliKNGCdbeW6YgMHVyU0i7F031SOdOvq08plQlLm8Ve
	d8q38J+WkWzzm72u4G3/r+IYIxTS04j3iG8w8BkJeTcIkT+WmjHImBpUcQO8vT1rBg/kOWDapejX6
	qNGC3tw8KENrQvB/mHvNGySieYa9AbAdfwoSBTvMhi8HFOaJdaC+7QVb98kAH/+RAVtymhQuycYRj
	UE+UG2HQeR7hIeRbvCT0umvNHrOmbB3bDQHOBccVkryes3dxX1KfWJFR+atUKD9+VdJjscLYAV8xt
	tJJuW6f+KVEm9j2fOEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQZ-006Wan-23;
	Wed, 19 Apr 2023 22:37:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQX-006WXV-0P
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+bezt4nspa35ZRqzRaZmY422b4QR0Mn7woQKzr9+0N8=; b=gmS+YEvO4UVOxrahcs5hMdHrAM
	629b5mpjOyIoh0jUFs7Feu8FB9I8elgIcl3nYixu/mKyKFlLchXNxcWMewjY//rXY2Rm5BghA/d+H
	dCcwGoUiEmKeKm8/pbadicWmmt6P0b6Nw4caluYJ3kU2ulYz9SFF5wdxD+KfBSis74qEpVwAYfhmn
	owZTVdtw/SrKVmsBimwIasx7Fx/yhYOD5KD9ROstEfEjFVvqsdvYxjY36oVEpj865trIGHlHH5Mxy
	x4ViShTfNFM8vwMmdQjYxbx1bzus+MaWXSZ/02nTRT4uY9umYPRrHYsvB5EDhM1OX5Aw1jqL+yeIh
	tamTuPVg==;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8s-00DeOW-Jq
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:19:12 +0000
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so274470a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942747; x=1684534747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bezt4nspa35ZRqzRaZmY422b4QR0Mn7woQKzr9+0N8=;
        b=cFqy/7hM+Ny4fP4WIxs4wAIEAjRhQmifvh65+m0WDOJ/jYCumQJdB1BJZNu5ucVQLt
         vHeOX9JqsZJsPoOkvbrleSPo5GRulHiShRoX7tLw/Bo3NH2vnqKu9FAh7Id3Frv2QuNE
         +weDjwOUG7PuVaf0Q8I8065eawPZBUZF/IBP3CPxafiXKLMpIPqIxJCnZC8Rka6I13Pf
         MlvlahxQGVeNZnlElGB4Hwi7P8WFIaVtZscNXzvS3DDLN30pdgEiwWgQCtnYC84qh4Gj
         EUi0u8wk2hWEG92QVESAvb05CMVa66rE4mAeYWrE7046KCBAGXIObMS7PVHwhD5fW9N7
         Ltcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942747; x=1684534747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bezt4nspa35ZRqzRaZmY422b4QR0Mn7woQKzr9+0N8=;
        b=I9dseFWM2zbgJAb0mEg6G733W1Cy8kiLJdwSMhWuSFBk4oq9lNTglY+Pg/+YTmcrVY
         X1ZVkHsNliaHWZYPUbGWKyVqPO7B0eSQdctxov+meLQKAgF39UJBjWHGdykhKQ1+W0HY
         P3Q2GONdjkG3EZ30X+jfjQ2FlC1MPF/fbEM9STT5GAKO4K0Kwn928svo/KQoN/pD2qbs
         McFNYInuAjcU6qVRvQVReHrLUTmF5to091L50YAaBZYiQWfwLSxY6ErkmzRwpUYhIzCj
         pOrTcleXSOzjWHa2WPUQ7ivH8zu4iPyBfNbjy/tls6h5yz5IZLAEhgw89NysGKFC4Rh9
         945Q==
X-Gm-Message-State: AAQBX9ca7H1VcVwsgpg0AE2VxPCmJUu2MAfyfrJL2dSKm7TrmDewt3/w
	kRV45TOs9osiSnsqIDpQFGlfaQ==
X-Google-Smtp-Source: AKy350bB8ZklTkd1MwNIad8/q9PvIlAh0JulWMyK+P713MLjTnxYs1KPIh7Umu4fPlJwkV2KzfaSZw==
X-Received: by 2002:a17:902:e5c7:b0:1a8:1436:c892 with SMTP id u7-20020a170902e5c700b001a81436c892mr5030556plf.14.1681942747426;
        Wed, 19 Apr 2023 15:19:07 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 44/48] RISC-V: Add cc_platform_has() for RISC-V for CoVE
Date: Wed, 19 Apr 2023 15:17:12 -0700
Message-Id: <20230419221716.3603068-45-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231910_864025_5C27DDFD 
X-CRM114-Status: GOOD (  11.79  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

All the confidential computing solutions uses the arch specific
cc_platform_has function to enable memory encryption/decryption.
Implement the same for RISC-V to support that as well.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig     |  1 +
 arch/riscv/cove/core.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 414cee1..2ca9e01 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -522,6 +522,7 @@ config RISCV_COVE_GUEST
 	default n
 	select SWIOTLB
 	select RISCV_MEM_ENCRYPT
+	select ARCH_HAS_CC_PLATFORM
 	help
 	  Enables support for running TVMs on platforms supporting CoVE.
 
diff --git a/arch/riscv/cove/core.c b/arch/riscv/cove/core.c
index 7218fe7..582feb1c 100644
--- a/arch/riscv/cove/core.c
+++ b/arch/riscv/cove/core.c
@@ -21,6 +21,18 @@ bool is_cove_guest(void)
 }
 EXPORT_SYMBOL_GPL(is_cove_guest);
 
+bool cc_platform_has(enum cc_attr attr)
+{
+	switch (attr) {
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
+	case CC_ATTR_MEM_ENCRYPT:
+		return is_cove_guest();
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_GPL(cc_platform_has);
+
 void riscv_cove_sbi_init(void)
 {
 	if (sbi_probe_extension(SBI_EXT_COVG) > 0)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
