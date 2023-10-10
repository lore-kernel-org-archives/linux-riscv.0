Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2FFCD8CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8n8VVjg0FgHLj3puHfWaDShJ9ogDGIFnYfkQqWlqNc=; b=IiDJXx0R3iKbMk
	3v8s8R09Wk2ZLPOhSNg6ZMtiFssTVit5jvxFDg7P6d+5Zh8ezpUUE4p55aDgFYBeUNf+x0CT1d1r/
	YeP51wlXO1EVKkk4W2vT+Yh1epFMOXtzhVF6zxo5IxKSTzkyN9NUWNZBOV2TOT7opiI6xmnrq3Us3
	7/Cfwk+36to7CKbt2hn7oseh2qrGw/g1UlWx+JKKqr2ZBcm12j0PnjielrQULC4M8MQBl3lzyjdoT
	pc1kPPTRESob0NF2zCoP22Rdg9zcm/z/OQB+FsCqyyKOXq2DVPAwOvbCqUcRIgGDWdoQ2BVNnmW1b
	EPQQQiaaxwfc3FJXA7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFwq-00DnM0-2W;
	Tue, 10 Oct 2023 16:51:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFwn-00DnLY-0r
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 16:51:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5334f9a56f6so10174646a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696956663; x=1697561463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3TX2LksrZtpLICE3hhE/gR1f60JWQhv9Ufhqpg7DuA=;
        b=EM1kki8cV1qrisz7cKa0zzf9uyXElJeJlGuapGGf+F7bSMoscXXSJlWR14E6AGzDbq
         vMa1xlQ+aOveyG/wKFCvCSUkH5ddvVN7f/ydRiJdta9zeUi+WoJ7fSUz3TAIOLJM4Qqc
         X34MpXITn3uw7SX7GtN6aqIc3Nepy3/4ZBOIz4QRmDSQPTU6FZOIgObPX+6gfuIgAkY7
         m5NGZLxPVtwkAmMk3k29kCLCt1LKTNqKbY11Z1lN+Hb+wvyp9MayBiiLzxlcKeu/SMIf
         45H7kui/NQ1SDP3cVHW8WXGdixbAzll3RiOlJKlr1UlItgbCYJ0vNa7WPOJX1wj7w19s
         FRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696956663; x=1697561463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3TX2LksrZtpLICE3hhE/gR1f60JWQhv9Ufhqpg7DuA=;
        b=KaMSnpA55u/zgcJqz8v+rYmE/syCMBtsI5I1sbBgPMb27HWUHzC1K/ggSHadqjFnJV
         QCQfm+tYME8ccH+7Yk01wJKpkKfRI5tRtn1ump7eF++UHafK8GWrbZBJydngWtf6IK8M
         GDxyMCrpPo4/vvmPqIjKD3Yr4QrFxe+UCj0xcN8eLNS5bn4HLfdLS7HmPm35UD/lVD0L
         kLugdBgcJoeXeAV41OnxqRu5Oq1qQzSbVTqSmLStI8JpWTo9oKoFdloOAgLqrUlpjuDX
         2WjR3ojTJf5El86pH3MqUKAuFor0Xrxl05OfE3k0QkBeN0ok14P7fOhp46pG1+EoEi1S
         ou9Q==
X-Gm-Message-State: AOJu0Yw0PfpMtaLExicbGz3NRdIZBF+fAgklb9jTDYnWulreH2ntup1/
	idXgbkWpeQ5vEpJvEDpah1ja5SvyeZToVGIhxTY=
X-Google-Smtp-Source: AGHT+IGT12MtC6TsDKI8qYBMYmnSL3dkDTY4reEdpnGeA7AC+GX+tc5EmW2tjKrCkFwep+7mLD8Tjg==
X-Received: by 2002:a05:6402:1bc4:b0:53d:b3c3:211e with SMTP id ch4-20020a0564021bc400b0053db3c3211emr438756edb.13.1696956662922;
        Tue, 10 Oct 2023 09:51:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d9-20020aa7c1c9000000b00536368246afsm7889424edp.50.2023.10.10.09.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:51:02 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: evan@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH] RISC-V: hwprobe: Fix vDSO SIGSEGV
Date: Tue, 10 Oct 2023 18:51:02 +0200
Message-ID: <20231010165101.14942-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_095105_309653_A9D570CF 
X-CRM114-Status: GOOD (  11.01  )
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

A hwprobe pair key is signed, but the hwprobe vDSO function was
only checking that the upper bound was valid. In order to help
avoid this type of problem in the future, and in anticipation of
this check becoming more complicated with sparse keys, introduce
and use a "key is valid" predicate function for the check.

Fixes: aa5af0aa90ba ("RISC-V: Add hwprobe vDSO function and data")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwprobe.h | 5 +++++
 arch/riscv/kernel/vdso/hwprobe.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 78936f4ff513..7cad513538d8 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -10,4 +10,9 @@
 
 #define RISCV_HWPROBE_MAX_KEY 5
 
+static inline bool riscv_hwprobe_key_is_valid(__s64 key)
+{
+	return key >= 0 && key <= RISCV_HWPROBE_MAX_KEY;
+}
+
 #endif
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index d40bec6ac078..cadf725ef798 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -37,7 +37,7 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 
 	/* This is something we can handle, fill out the pairs. */
 	while (p < end) {
-		if (p->key <= RISCV_HWPROBE_MAX_KEY) {
+		if (riscv_hwprobe_key_is_valid(p->key)) {
 			p->value = avd->all_cpu_hwprobe_values[p->key];
 
 		} else {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
