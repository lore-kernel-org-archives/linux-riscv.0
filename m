Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C998F606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMyYv2Wu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FTC8beCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KUptYEKikOhoNhp/RYHfACPjjaoI0OcDCflDD6u5n8s=; b=MMyYv2Wu3dw+DpRXSEZefwj3jp
	wSwk7Yk6sXtHzj0OyibLZDjMylkjfDkdD0iKmVEcghPIqTKV4phzZdTgla7fVoIIAj27kdrh4VFFa
	Gi1mMSkWpmV0eRT8iVIsmqAwEw1dI8iEfLnlp0fKLZJ+jfErNAuNKzk5ZUzO0T2twNqgbROmkmGMm
	QOkyeXsRxy/q0RpxPuK4odWriS9rdWCGOdfNt0UNyDPi14PmwAfieM1cnnPMMQ0iEedf+Tffb7sTG
	ZYcRCTaWc9Wj568jnJGWOAD2Jynw4WE+t/uo/xY7jfHEkM5msoIakf3ELOIMqJ9nRZLcxqrT2wnMM
	3285IHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTanp-0000000870d-1wHs;
	Wed, 18 Nov 2026 08:14:04 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTanm-000000086zO-3S7g
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:13:59 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso586381a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 00:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989638; x=1795594438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=FTC8beClfgJBNB0fqEy2pXN0sEXVcR9Ik2lFkaq4CUoNDu/6J5xGLoXVb8U2lhKP5a
         kATAP9LDXo3B0SX/hFHWMqh7w+nGU5m/VV/t7Ju1idVkF9Xpx78cwXNX9vt2UyHixuKp
         X35+UAPs9BPATyd2F9HIYl8BGMf2Q27dXfDTbfuYIOG2p+q5RdnBRfSXkkfgtnj6ncbw
         Hva7TknvgDR/ZH3TBTRzE+ZTEzIqMcT5V/2A6Ds3tfA95/SZZXpQd5cdok3y4ARfohBF
         hwZSKURgd85YniTExNY06T97qtBVNMRp5ZD8PJLTlMfol6fzUc5Geb2J38v/s/DFUZUJ
         Vgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989638; x=1795594438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=zQ9+32eMNMwvaP62H1I+idktQQF/kPvhtZ0qhgqkdkQhWi4RrjBwOCJD7aQC+5r1AF
         +XKFJj5IIxft/dm6+fbgmI0zf9+bUcntUWVHNqSof+OFXspKjreRrzlae6SGcw9oJUKf
         Zpdiy1vMqRS6o/CYpDqnNaJtH7vxZEkQr1XicJyMzta6xFNQM2CEEpKMYldWq35R4S5Q
         +Owba6KA9r+ovKy+zu8aDgq7pRA6WVuwn7fWB2mO6+qhHuh8YQ/N0QAErE7oN/QAYd9a
         fOCmZVbC2ISP7sSTQ+NV2m9IGsiP7bZb/P8hEGh0XE6gDgKAsx0mGsih4FJ4CGmn50Fq
         LkYw==
X-Gm-Message-State: APuU4Z/J7f1OpFkZHBDyHFgXlCJs0xcwtEmoG+tSt3StUrnd2bJQQKJk
	0XB39k0/GVYIFeYqK7LldxDz7pwFn1SB3T6HveXXfwJ9ZCz5A86kRAPu7oLlk6qy3LhwLZySznY
	iXP7q
X-Gm-Gg: AZFdTZfyEJHtvkUAJTHKBsZAiZRLw/eAFZWJVSEgvLZDISdyozRwt9XvZ4iEFzjvKJo
	2vXC23YfHs/qXTMd2xEHlEQzIvwVqoA+JUKSVEQhSWuoNieVSdSKm39i01yJhs+GlwW92IIYLh4
	LBWVAK6hk7YrJdTfwpF/QlLotXKFb/WQtk4qxqLOY1NsAb4X237beLsM7adG8G1FuuWMG5D7PkP
	Q/HYDQeo7ima//rA7T4IYiQDAIfn4o3IbCt0MAHZHjES4kQZlvHDvgBUeBI4Jd1+ab0uKBe9Uib
	i4j9IMogzJOF/5cUQhmRb4d8L1/Zf6O/EMLlN1Sh0snPhBLBpoWsqZKTWGkGkggShjfFeTGthr6
	Kq8xtbV4JDI02R+marZ8GTjSO0CH2VXg7RXIueEf7sx9LWBEMVW0aeZz9WHvZWi4Yun23XjwC8s
	p7QEtoB+WizvRj9/l2+yM4qn19efdaYI7xXjpVxQfrPGOG5NN3WLjlxJofYFonsKQIHrzLdwUzw
	xHVHVVjfNM0RlVcAbATwce1EvH5RFX3ZcCNKCAqSPvT/64hzEON8ztuBC743+CPTdF+Elklq3gj
	oyW1SKoA+4fk/pWlFici2AtwJhjV8dTAyraR0t2wMRETviauOSiXlxWoB+181nkquu1ANBWC964
	6mKRy1OQ=
X-Received: by 2002:a17:90b:1e48:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3b3d0640e52mr1931726a91.6.1794989637815;
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 2/5] riscv: Detect Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:30 +0800
Message-ID: <20261118081327.10684-9-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001358_867589_8960BC94 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

Register separate machine and supervisor PDIS extension bits with the
existing ISA parser. Reuse the DT extension-list and legacy/RHCT parsing
paths without adding userspace hwprobe bits or inferring S-mode access
from an M-mode declaration.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b5952db9259f..0eea8158b4af 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -126,6 +126,8 @@
 #define RISCV_ISA_EXT_ZIC64B		116
 #define RISCV_ISA_EXT_SV48		117
 #define RISCV_ISA_EXT_SV57		118
+#define RISCV_ISA_EXT_SMPDIS		119
+#define RISCV_ISA_EXT_SSPDIS		120
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..982231fa290a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -651,12 +651,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(smpdis, RISCV_ISA_EXT_SMPDIS),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(sspdis, RISCV_ISA_EXT_SSPDIS),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
