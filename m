Return-Path: <SRS0=58eF=5J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19C9C54FCF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2020 07:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AF9208D6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2020 07:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BftXFfJU";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XoVHwOun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7AF9208D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR+uDkZlwayIbsgbPeyhEUp7doO9+jBvD/Fsht7osWo=; b=BftXFfJUvh4QQz
	UfUCETdkiBdQvW1U0nldC6C+wL1jPiHBewp4CtfLCWKS1BLI7JQZ0yRu26TvwHkImxWUjOtw3hNU5
	OhX4n1/ZOaP2Qg7mIt4LYa49nc2piq/9xJviHxL2JLVVnP8TYKsodPf6VtnsWy/xEyk8dhGmhiEQD
	dp+bF7UNAqPmY8Z0vfKYRznc5ypOAG7aWKswPxGujDyhf1AdbI4Lwlbco19Hqnq9hYDwgA02jBkI1
	bGob2dGtl0ole/VJW+PbS0dZOii2aEPR5O2DLwTo2bNQCoQRwgZs7YgTuG1J/hKAREvJClQN1o6fm
	J61NbASYGFiMOAMg24rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGe1v-0004By-Vr; Tue, 24 Mar 2020 07:31:20 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGe1m-0003xy-Av
 for linux-riscv@lists.infradead.org; Tue, 24 Mar 2020 07:31:11 +0000
Received: by mail-pg1-x543.google.com with SMTP id x7so8604295pgh.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2020 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eR+uDkZlwayIbsgbPeyhEUp7doO9+jBvD/Fsht7osWo=;
 b=XoVHwOunlnnbXskW9yEXFl7rJ9ssINpRGhRVPBNdeKX2ubyzIqYnH7eOAuSMPP47WM
 vpKFBPcMqG36hjx5V9ijQ5XnCZZkQIWI1tZjd3oRZHyBNBWUi8pl2Gt2hBTYwifQ6ftG
 GYYAaKaGAfU6znHtAwVS6nk59jizZ8IkH8NR3GC2jDw2RAP+PoQIb66l7GXWxPSDOk6X
 t86QXLZ+el4hQ8fIoCNxLsTKPO8lBNpFPmrg8J/tRYBogRjl6D83lkUa6ICTHiT9t0Pp
 Qnpj/UoH5ouKUI08kBZfOPHpXugMxTI5KFE/nG2KOA+7/RRz8rf7p8QYWs/H0b7RkqFM
 J+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR+uDkZlwayIbsgbPeyhEUp7doO9+jBvD/Fsht7osWo=;
 b=mx8vzt6o0dfuKAoO6ow5OyTEPEOwP9fnotIkxgjuwjSvTOxfFNoqoWWrrEFdptmMSD
 hOQbkbGKjBJGozoeH3wZcBjyfAqAyMlwDwzyCb+DyXe5qGswldf9wwQXf1dLrd15Twri
 jkVD4qtzBIh2ewLd3jzLQ3e1it6mpmtLXuGfTI656VHqCpugWVpD4h9ixM3tBwoAONm0
 oSfXOPfctPoJ30Mt7e8Yk5Ic0ixvBNJXgTyeLfK3R5CceX6jAJg7fchby/f2zoe+6I1D
 u1YiEESGnlY0JvXOTRRZ+bYvwbBMjkknVEN8XfqdoDiG8KUNzuF4Gfe9J5y+xDv6cI+i
 S/nw==
X-Gm-Message-State: ANhLgQ3hIVvmndOaWijwWHJK+OK5e0Z6xew/uGV+T74dKXrb+Cf52VaJ
 fvoFAW1VNLylis0J7y9FaMUR3g==
X-Google-Smtp-Source: ADFU+vtQyavi3WiglYVqrQnZDp3eiLFu1j+s5c3PNQLghbIos9mzlMX/psPU7J6BV8na+AKAN5ODnQ==
X-Received: by 2002:a63:ff4e:: with SMTP id s14mr26364986pgk.269.1585035069344; 
 Tue, 24 Mar 2020 00:31:09 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id i187sm15124648pfg.33.2020.03.24.00.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 00:31:09 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 7/8] riscv/kaslr: add cmdline support to disable KASLR
Date: Tue, 24 Mar 2020 15:30:52 +0800
Message-Id: <292e5511fff99d564c947c9ee71be367be947f55.1584352425.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1584352425.git.zong.li@sifive.com>
References: <cover.1584352425.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_003110_401528_3A2E70ED 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Provide a cmdline parameter 'nokaslr' to disable KASLR.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/kaslr.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/kernel/kaslr.c b/arch/riscv/kernel/kaslr.c
index 0bd30831c455..6920727e4b4a 100644
--- a/arch/riscv/kernel/kaslr.c
+++ b/arch/riscv/kernel/kaslr.c
@@ -156,6 +156,36 @@ static __init u64 kaslr_get_seed(void)
 	return ret;
 }
 
+static __init const u8 *kaslr_get_cmdline(void)
+{
+	static const u8 default_cmdline[] __initconst = CONFIG_CMDLINE;
+
+	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
+		int node;
+		const u8 *prop;
+
+		node = fdt_path_offset(dtb_early_va, "/chosen");
+		if (node < 0)
+			goto out;
+
+		prop = fdt_getprop(dtb_early_va, node, "bootargs", NULL);
+		if (!prop)
+			goto out;
+
+		return prop;
+	}
+
+out:
+	return default_cmdline;
+}
+
+static __init bool kaslr_is_disabled(void)
+{
+	const u8 *cmdline = kaslr_get_cmdline();
+
+	return strstr(cmdline, "nokaslr") != NULL;
+}
+
 static __init bool is_overlap(uintptr_t s1, uintptr_t e1, uintptr_t s2,
 			      uintptr_t e2)
 {
@@ -379,6 +409,10 @@ uintptr_t __init kaslr_early_init(void)
 	if (!seed)
 		return 0;
 
+	/* Check whether disable kaslr by cmdline. */
+	if (kaslr_is_disabled())
+		return 0;
+
 	/* Get the random number for kaslr offset. */
 	kaslr_offset = get_random_offset(seed, kernel_size);
 
-- 
2.25.1


