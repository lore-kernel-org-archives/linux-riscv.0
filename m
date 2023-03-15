Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52480C7618D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U1VkaupWouxUsIIPPGzKBV/wi+dVzbgRgIBUbURGO50=; b=TltRrnjMVNr4Bh
	cVxXP0KMtpk88cHNw7ZK+JQgs9V1wRGB2T/Q2NZWh8fUG5sNzpo0x8hedUt4FEtEV04aQHmXXaiXe
	cgwrzlLapUmayE2itMdCcSwYpWsdF6gnimpVljV8MCXvEBKhphg8hs92PPXmvOdr76szduZQb78wa
	E8fioiJ0HFbCcx7+WCZF4dVd1XIQ5Ce4VzJChcZf8DLQt85FheKAJS8ERn22LifIXqfZzWb1jUIdA
	30DKpaolK5Sq19Yh5cyAWKS8oSEA7/q48PU1DV/jZPs7Im7ljgK7umcSRcJmNTtmHs7Hdet1wQDuE
	FTUhlRTz2lKRlSFMFKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJUw-00CNKC-2x;
	Wed, 15 Mar 2023 05:16:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJUI-00CMpZ-2N
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 05:15:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id d10so10115140pgt.12
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678857345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85u2mP267MsDWaYI2anR0VTKt7dL+xKQUjJLVotEHs4=;
        b=gBap95uEBpqian2RBARTrUhbt/kKcSUXiSo5c7Duq2LsgHsJd7sdPPRFiFg1axqEcx
         LCEFgPx4s/l6A65imFaWZtjeJ9PYLAon3RKjoOlwq50YBEm/FikgnG8vlR6/pgNyWaVm
         iUN0iCRDvqZzEzTi215AXkU5Fxb833GIShXRKYfuOxbeaLqRanNK5+oUDbdpif7kdJ+j
         +/cPDEjjw3PAjywDo0XsFGrDw+DOyzfVWoJfaBf9LtEA13/OQSUQF9Usn6szyjPME+L/
         UcdSXy/53dTBtT/b6TWWxp/bKilr/mflre5QrDHlMp8h885ORIa5iS0l1bJMOCQkRi9K
         aFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678857345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85u2mP267MsDWaYI2anR0VTKt7dL+xKQUjJLVotEHs4=;
        b=eWMdQQLOyqHphdIxmy/cqHHtQRvH6z9ylZ+vcF8s1cQwwCNAyqaPlAPuHc5K1PeQeb
         Lqr7dxjHpCuIno+/Pp5tkqlI1dTwUlVrw1EL5xPQBS4Dq+KFVJ1pSkKtSDuCD8d5F9JO
         pTbmsDdNxJDZPgLgUdFQjcAze8ENMadt8DzTD/qR/oU14HC+NjKQAeKaYQ2UGpre0xEZ
         bksHAp/2oqEyouoa7wEEYCR0wUtLYu2mKl92jRP8c0vczNWTteuyHVIOJ6iHMy7/QVJk
         TEP0fW4bdFzTRpI59iSS3EIYeSpXBhnJE5WV/o5GxjdctN6ZXuflTZEOHk2c5ZD3sZWS
         A6fA==
X-Gm-Message-State: AO0yUKVUeSbSQjH5W6cQH8hs869D9ogBadhMGSyLO7ybbVZYdUFR0q+O
	ZibU7Fv+L0bJM+sFMSABA94=
X-Google-Smtp-Source: AK7set/qpV14jNC8aoJAxGYlBsaChSOHlujZd1EeVD7OBA4G2dFhCb+/fwJ/AIoqn083Mq9weK9KRQ==
X-Received: by 2002:a62:3814:0:b0:623:c7ff:46c8 with SMTP id f20-20020a623814000000b00623c7ff46c8mr10052331pfa.1.1678857345006;
        Tue, 14 Mar 2023 22:15:45 -0700 (PDT)
Received: from kim-GL702ZC.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id z64-20020a636543000000b004e28be19d1csm2442903pgb.32.2023.03.14.22.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 22:15:44 -0700 (PDT)
From: Paran Lee <p4ranlee@gmail.com>
To: Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Anton Blanchard <anton@ozlabs.org>,
	Daniel Axtens <dja@axtens.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paran Lee <p4ranlee@gmail.com>
Subject: [PATCH v2] perf tools riscv: Add support for riscv lookup_binutils_path
Date: Wed, 15 Mar 2023 14:15:01 +0900
Message-Id: <20230315051500.13064-1-p4ranlee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_221547_088722_A0CD9A43 
X-CRM114-Status: UNSURE (   8.24  )
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

Add RISC-V binutils path on lookup triplets.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 tools/perf/arch/common.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
index 59dd875fd5e4..e80d4d22cabf 100644
--- a/tools/perf/arch/common.c
+++ b/tools/perf/arch/common.c
@@ -43,6 +43,20 @@ const char *const powerpc_triplets[] = {
 	NULL
 };
 
+const char *const riscv32_triplets[] = {
+	"riscv32-unknown-linux-gnu-",
+	"riscv32-linux-android-",
+	"riscv32-linux-gnu-",
+	NULL
+};
+
+const char *const riscv64_triplets[] = {
+	"riscv64-unknown-linux-gnu-",
+	"riscv64-linux-android-",
+	"riscv64-linux-gnu-",
+	NULL
+};
+
 const char *const s390_triplets[] = {
 	"s390-ibm-linux-",
 	"s390x-linux-gnu-",
@@ -166,6 +180,10 @@ static int perf_env__lookup_binutils_path(struct perf_env *env,
 		path_list = arm64_triplets;
 	else if (!strcmp(arch, "powerpc"))
 		path_list = powerpc_triplets;
+	else if (!strcmp(arch, "riscv32"))
+		path_list = riscv32_triplets;
+	else if (!strcmp(arch, "riscv64"))
+		path_list = riscv64_triplets;
 	else if (!strcmp(arch, "sh"))
 		path_list = sh_triplets;
 	else if (!strcmp(arch, "s390"))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
