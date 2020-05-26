Return-Path: <SRS0=EgcX=7I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0A5C433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 May 2020 07:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF57207CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 May 2020 07:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pRaBi1Y9";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dXN1zXMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF57207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8iHAnjKh91djitETlf/VgG+9uuO5Xz5Jn9NWjplsUA=; b=pRaBi1Y9WTCVEAgMqgZxOLuQRQ
	7OHNas94RUlskwkC5F2qFNaUtiHasgFDq7PRSpyoM+z3igsnk/SyDE+hWG8URfekqIEeH6YqL1SI7
	SW7zILMFe9J2Ptj8yR7GSaHVNYd2YFkaNPiQTkrzl1HrBWw6HGCVzB9Hl1LySaB42B4589R7J8XfW
	OtS0jh3VSgDF3uEtJNq1MX7UcqdfTweRGhu5PhIATZdCYUnGfDX8KM/yb6BIAJ4a5uOcVOmtzOpWx
	U50nVU+cuLhrY10DJH7LI/vVSIC7vVSz4bkgnDWgp9rv3TjFuHNtnWXjRK6wvKCMd+R7cHCT4sCc3
	A1tG6XBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdTcQ-0007pF-Ln; Tue, 26 May 2020 07:03:22 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdTc9-0007Ui-5J
 for linux-riscv@lists.infradead.org; Tue, 26 May 2020 07:03:11 +0000
Received: by mail-pj1-x1041.google.com with SMTP id cx22so812594pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 26 May 2020 00:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q8iHAnjKh91djitETlf/VgG+9uuO5Xz5Jn9NWjplsUA=;
 b=dXN1zXMx/+49puOgrK+roK/nSE/IJAuj061+r7UMKKOc0JlZEfQoopeb7uwdGhPJPn
 euVPuilIqf8GcC1x2EFGdT7wVwgeNy+KBHSUE7k8EhNYaceeDoZ8b+N4uzxhncPNiE4/
 CQzyeS1K3yKWjKykMYL32JAHhEG+MP310uEQmTwIaxPG5pfo0OEAGW2WWDMoSMnvOf8n
 Tv+jQVOcZyvs+RGTeT70uhn+SznebOvx4bRxAvy7Vy5d33O4Mun9I5TKDyCAzhywhLzv
 1RozvzrbKgMOaD0BHm0rbs6WttdQEi6VDZ/CD+nJmEUwkm74oyUg7I65NGh3mnMM4DqQ
 vHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8iHAnjKh91djitETlf/VgG+9uuO5Xz5Jn9NWjplsUA=;
 b=WpOt+xJA0gbhIK5f24Qg+CVj8Urs4TyOiEiZ7/Zon7MVH75/gQakqE+jlVCBzxZUFN
 t4tbZrbuyVgFaK4HEwZGAjTKd3Itjan+rJLCIGWSyZTTch4TsAD0BCbakwOpKue3V2Hv
 7AUzOCSGYWtYXeFsWAlfhHNcfFQvusrbS9QpGfbHKJLkn4OYegW0VOOXp7XkOLRl17Wd
 KOf1YMoIxbVXOTpj7JN81RM7Ph73bRsTwRCeg6VyyC9sHjapghehTZm2sbODscK2uelB
 +Le/0o8Lwxut82Z1SgPk15q3Mi9ltOebY5tQbX5db5DAL+uWYx7YDbDlIK9ggFuP4zOI
 H5DA==
X-Gm-Message-State: AOAM533wPAHxqHVMCtdylXv5D66Rhl3ZRLsPa9w54TtbDMYFrP3Z1OXb
 jQUS+NHH9HdAP7mkPWZcq9wXYA==
X-Google-Smtp-Source: ABdhPJx2qW4sRtTjN4ECPJKyZajPz8CgvGSiIMT0UcdKD02BLEP4n66DvuAwNXezHwLV2+9s5eof/w==
X-Received: by 2002:a17:90b:8d0:: with SMTP id
 ds16mr24740218pjb.174.1590476584352; 
 Tue, 26 May 2020 00:03:04 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id q34sm15167431pja.22.2020.05.26.00.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:03:03 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, palmerdabbelt@google.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 oleg@redhat.com
Subject: [RFC PATCH v4 07/13] riscv: Add has_vector/riscv_vsize to save vector
 features.
Date: Tue, 26 May 2020 15:02:36 +0800
Message-Id: <e896db91e3303f64ac401021f848e536e9d42aaa.1590474856.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590474856.git.greentime.hu@sifive.com>
References: <cover.1590474856.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_000305_201172_57CA5D8F 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch is used to detect vector support status of CPU and use
riscv_vsize to save the size of all the vector registers. It assumes
all harts has the same capabilities in SMP system.

[greentime.hu@sifive.com: add support for dynamic vlen]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/cpufeature.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c8527d770c98..5a68a926da68 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -16,6 +16,10 @@ unsigned long elf_hwcap __read_mostly;
 #ifdef CONFIG_FPU
 bool has_fpu __read_mostly;
 #endif
+#ifdef CONFIG_VECTOR
+bool has_vector __read_mostly;
+unsigned long riscv_vsize __read_mostly;
+#endif
 
 void riscv_fill_hwcap(void)
 {
@@ -73,4 +77,11 @@ void riscv_fill_hwcap(void)
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		has_fpu = true;
 #endif
+
+#ifdef CONFIG_VECTOR
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		has_vector = true;
+		riscv_vsize = csr_read(CSR_VLENB) * 32;
+	}
+#endif
 }
-- 
2.26.2


