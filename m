Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CC0C44514
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8hOoPH+2lYY9WUf+xPQoYc3S40bitUJBUBinZ/wGNg=; b=XDtgVN4gSENLTR
	P5E5zpIIh/kOkdlOYL6mCKiLqeGjp8hei2yzo2nMctxa9tr6AHac0XBm3osdsUEQm2CN46nHn+IXt
	GsIny+c3HcZwo/PaMTC4JG/30RwE/Rin1/cRZl9Xb6zJR08AAKX4wWhl7mM5FG9ew4pcuGBa+L6xz
	IT1d9ja7d7HOjzMUbRr+LXgKGNXyteRcG/ZOagrfDT3KjBtKo1G1qmYMT/UgNPVN6uC4fCNEJUO1I
	sXANSCX87+/X8aMW/SDKp5ZWuHOBvAl+cfnsYTh938xzZqTVNSZiK3t7Avra+53pnjTXiTE6jdIyM
	93NvRNo9zyn0psy139BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSA-0000000HJs8-3g1x;
	Thu, 16 Jul 2026 12:44:38 +0000
Received: from mail-pg1-f175.google.com ([209.85.215.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLS4-0000000HJl0-33LG
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:37 +0000
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so4346355a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205872; x=1784810672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=;
        b=bNzOVh7I4KaEO+bBuo529tYKucrzCStv4ETdl9vE4rKZgwVkg0B2iqUd5ulFShjcNV
         CrcGmE4ACoXM+COE4QQU0UD0CzR55uT0zyt7zhiMLPHMVwZnH53C+9dSdySO14QgM3vG
         kMMpduIiHTgBdWCYi+KSRwWiV24nke872fqgsl9hxaapP5IviXlB+JD8IW8JFvRhFxHH
         R18BUOxMvBhjh/d4SsMJ/NhYZSnKvtfnFA56zVEb6VrYZC2r8dxG4Sx9/eRvvVT9afe0
         k6kA4SFAp9VljycYPQKeySYoKD4p8Q0XykmpBqWdiXb81YWYm3yyXuVWYlUZkcYznOE6
         hxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205872; x=1784810672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=;
        b=hbMRZKuXyJw2hgyhk88NSNHB4ybG7IogNh9gBQL7nrs2VW9b8z4qFuCPZi06OklGih
         6UIpFfTDTdY+qTLvXNeoCMore1cU5G4qOwNQEVQFmrntk0gdLwc4V5RDnfYdvwFdGjEm
         kn5k2SEVZqtecI0wH3R+CiFcTP58hiWRvpv8eCZ2oAVFPfsWlcvi0aMakW6aldKH6KVM
         j8AR2Hw9/yvl9rgIjDQwIfynyCFiNIRDmcoz3LlqOTRD8Am5RtAJmZNbPKsBkvOxouSy
         CP4pwiY9kCYm2qOcdzLQV5iKvQIwKjCmAUNeHh7h+7sZgp6xw16LPSL4bCrco4hpzovL
         TRjg==
X-Gm-Message-State: AOJu0Yz+8WcJPfzY7bjowNkV7xA6KLR3HR0MOK7VFUzxhdolrpSZiBCc
	QcbcmFDdhsJlMmtCPLPgnj61370AwzpBXOBTaWGMkZLOqRgPf3EXJ306k6UX7/M7ZWt1c46k5fo
	qs1GOOh8=
X-Gm-Gg: AfdE7clp9EqyTmXrxlBUpAxskvYsh80LKO9jbJZafYEGi/zaP37sw/SWuPqlnzSh1uz
	i35yB8hjLjuv1wMccCdT/wZsArnjbpNuuBcpdH6tDyUlK39d5LqjwDB97CkP7KLl7k0Gi075Yos
	zK1j/LqGxRcrhThhppHlbX1b1aoU6Z2B6j2Xkidn4BuWPjMGKILuA3awCmBNnx4OYYAsDAKuBRn
	AswzOQcd1VeDRC92otwcpOSTZrgTizHYsZdX/hpSf2bgKt/MxqP/JKGzM23qFeWtAZuLIsbFDvz
	CNCttosm/fhugwLXEirknR85Bd7X8S+j+i9alKCV5iRkc1UEuxXARL9W53jzX/SKM7/+4Zjtf5t
	MQfCaPbRQk1ab9sqvB1kd+xDpw3w9VXcrHTx6Y2G6gu7nhFEL7d2zkj/EX5kweReONJMWMeyoeP
	1K0rTpuky/943Gxl+lLFR5ROL7awVEfJ5m9w==
X-Received: by 2002:a05:6a20:e615:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3576c37f6mr12235735637.74.1784205871769;
        Thu, 16 Jul 2026 05:44:31 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:31 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 12/15] arm64: mm: avoid contpte A/D aggregation in fast-GUP
Date: Thu, 16 Jul 2026 20:41:47 +0800
Message-Id: <92fbae3247b4bf0d7989ba20a8763ecb836d0279.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054432_787872_B833205E 
X-CRM114-Status: UNSURE (   8.28  )
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

fast-GUP only needs the PTE state for the current virtual address and
revalidates the raw PTE after pinning the page. It does not consume the
contpte block-wide accessed/dirty aggregation provided by the public
lockless getter.

Override the fast-GUP PTE helpers to use the raw PTE for the current
entry and raw revalidation. Keep the public ptep_get_lockless() semantics
unchanged for other lockless users.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 018781a1fcbee..d1e08dce9f7c5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1760,6 +1760,22 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 	return contpte_ptep_get_lockless(ptep);
 }
 
+#define gup_ptep_get_lockless gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	*rawp = pte;
+
+	return pte;
+}
+
+#define gup_ptep_revalidate gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(__ptep_get(ptep));
+}
+
 static inline void set_pte(pte_t *ptep, pte_t pte)
 {
 	/*
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
