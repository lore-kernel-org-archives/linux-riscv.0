Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31E606A336
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AJRFOBql;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=f2qOwDec
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZSZ0oV1uOoRoqj1fw6jw8yjRHERD4jMXVVEIqk65qNQ=; b=AJRFOBqluxfq8FlE9/lb/Scuow
	eiTBuHcafOcOw0z1E94rxDRhCxJ5YJ7aPJv6rJlrRXVOvgkWs5LefS/fl+TSgF3ux9rUJBWo41RJg
	1QjUtRG8nvWPNpZiE+2iuWFlAS7xf4LEgpMXC9IhlnMCKT8RAfYaaYDYCPwMxei9sbLmeGnUjOnrr
	vrACxfAln5mT0gjudOW2ReFWouKUhwAk/84HtabitlgxfVh/JtGFvYLmb7FYlgK4fZ6Dc1yH2iH+H
	928n1nRA96Vq4T7847MZ1oZlGeYSwX/6v+yZPAQ3OUsdBX0c/r3cbixLA0E28BhYtxonS2UlbE9rq
	gmK1KTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS2-0000000CU9V-2j8R;
	Thu, 26 Nov 2026 09:07:34 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRv-0000000CU3N-2zq5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:30 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-38699cf08dfso8270165eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684047; x=1796288847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
        b=f2qOwDecWflfH3TcL/i5O0CaCuYxrDKUbLobNTdm/9OWXJzQQo2Sz/zn7efhgE38x0
         DMQPwk80MKjZJnq5faMMXErcjO2a2ll8t9EN7zghBVY/mEvSxIzSZvxtu1QOkfXcjhTE
         cOovwiI/v6eRbM1DStc774OI6xRdYin9jdv1GoR9n2pjYKGPwHSI2NIxVFM+3DtFoPBa
         W2w2LgAKUjOQU0IIREBuO0bWk/cL2a56VCjyh/S5QCvtjtwAde881oZFLTfJCOQQ8TnD
         xfHhWOQzUjEbabhT9qayvZbhLd3eKHN1PfNTPq2nY3zyXHRvsiUM7+dTtbFromkJDXwb
         cILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684047; x=1796288847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
        b=R+w9jy9E26JbvU1tlmg0B0zP0G3BNcx8BgaZQPR9Q6I1uGpJ43KyIj88zdYecRbTna
         rleVpzBJTTZMPfnmRJhGsvn+xNG9aVyD6HGTv/OBa5IRJcTGPquPZLzdZGH9nIJX13Rc
         krMwfW9Na9+Rcr7pZlBcIVDCa1LFvmb8pqNtZiqoIrNhwI0DOXEi8fdvvrTBTw/+MK1U
         mQ8QCLlf0cKmL0+RvIpFysq7KsrLxYpmooHk/1CBswVGsqdawsmy8eC19hTRHgMjwZx9
         00wWuhlW7IElz+o0hMoCbLStkslQtqnIiJ8BAwchR3icrxDwRnaUjeVulyYBzPUYK72a
         r6EQ==
X-Gm-Message-State: APuU4Z+AcR/JE+ks7BnY4QjOn77aZtWjpXtVqAwXCe5cY+XpOEroDYQc
	4w6G29wT/Ja7SopEO1kc+rvUN00m714GJzxBVMSwHDsUcELQ0l5nEpZRrP3ep9CbjnM=
X-Gm-Gg: AZFdTZcOOu6CuN71O6xUuuYoKkiu6ibWCZFxsDQeTentLRiCnk4nB2IknVkHzShjMDS
	q0w1py1bXOfbvaqPOC5S8U3Y1qcPXHs6S9q5GapOqxO2xESQox/mdOziFnDGbjztpbDkRdUkaD6
	Qjqvfguj/nDHOC6l5KFTr2kxwkqUvo0+v3AEBMuOCazbLbErvPKxmLN0/NX1Y0MIv0RdolA9wB5
	HSo609cBCYEIoLFmlL9vY81kre844w0MYhdkG81vZNiN2KN/AZC8lpX2E7IReDCAfwKYJMKL9Vm
	bvUVgsxO9OzrkeqxEpv04J3/ZZun2ztGOu81CyMsRnxaM6p4s8PREfPKsTgqxDZvjBYEm3OAP69
	wWzp6TsEF885TOKS83ju6B18CixnVcQaDSIAyOBPcdQuArCge4OLj/SruQHDudWSW6/KOu8xO0f
	PZio/TsIZ0ECK9r8/LCx5HaKwoIKDXUvOWpqNohlmwVVuqiQPlIi33XZ4s1xzjh/HtAgetMg54F
	SsHKsoOFGkt1+K1eMrAWjHU10/mvJisX9JxAqPQ/oBGleC0EeEZunl2+OZNBm3OHVWqm/gh41VY
	9GSeQnWJCFaXDsHRsz5WgCiuaQgoENUVL7ZLiQr5633hmHAkwexjLXqFuf+URUEpEg==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr22307891eec.34.1795684046741;
        Thu, 26 Nov 2026 01:07:26 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:26 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:11 -0800
Subject: [PATCH 05/10] gtrace: Terminate id_table iteration on
 GTRACE_COMPONENT_TYPE_NONE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-5-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_010727_761518_5FFEFE86 
X-CRM114-Status: GOOD (  12.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gtrace_match_id() uses a non-zero id->version as the end-of-table
sentinel when walking a driver's id_table. This does not work for
pre-ratified components, whose version is 0, i.e.
rvtrace_component_mkversion(0, 0): an id_table holding only such an
entry is treated as empty, so the component never matches its driver.

Add GTRACE_COMPONENT_TYPE_NONE as the zero value of enum
gtrace_component_type and use it as the terminator instead. Existing
id_tables end with an empty entry, which maps to this value.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 2 +-
 include/linux/gtrace.h                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 034987237abc..09b200bd1690 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -103,7 +103,7 @@ const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
 {
 	const struct gtrace_component_id *id;
 
-	for (id = ids; id->version; id++) {
+	for (id = ids; id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {
 		if (comp->id.type != id->type)
 			continue;
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index da8ba3779193..b8826b25d35a 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -19,6 +19,7 @@
  * uses the entries relevant to it.
  */
 enum gtrace_component_type {
+	GTRACE_COMPONENT_TYPE_NONE,
 	GTRACE_RVTRACE_ENCODER,
 	GTRACE_RVTRACE_FUNNEL,
 	GTRACE_RVTRACE_RAMSINK,

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
