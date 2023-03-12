Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B191CC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FdaID7yeQgbm0TvbYPgmazqjDO1OEmLMQuprA7aV81c=; b=zDSsnjaYqyzB9T
	rTu2vHkC1L6IjOdZOUDmSVPIar6y+NX6XOZsxqbU+pfLNSFrAEw7G1YXRqmfMAi1iQGUzDZ37Od88
	9Lr4C5/nTwWhY05mgbqEH9lSyDEfB+jkM4uXwKbn3bIN0YB9AzR1gAlBaRBoG1nmhe7e4ayUk35qh
	ldsj1ur5adRvoFo0icyKwVtaWax/29ocsmHDn4gwDp5yRdXnShkT/BcO2fMjmTzEpzSlASdOdTlj5
	CL2P1N7sHykd7BklQ044l6Ap0OIPjMipyfPZDgfSRbSLs3e2WBlHn+wMJJ1x5GU/y9TIlq5qjNQhz
	uSmqsf3VZ9ibxjr2vwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLNG-002HCw-Mh; Sun, 12 Mar 2023 13:04:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLND-002HCC-4n
	for linux-riscv@lists.infradead.org; Sun, 12 Mar 2023 13:04:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id p20so10148512plw.13
        for <linux-riscv@lists.infradead.org>; Sun, 12 Mar 2023 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678626266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C88fNbpNNCW2fZzaHvdAaN4smyngfaWHvN+4TC6Vu/U=;
        b=kFCMPQc2sYve/lVbIe5ls9dYN2LyCmd5x8+hMcazTbYR9xurnuNhzQ2Y0slbv7wd5L
         6EJ35TorXe63WI+WssUbGxjKRnBrkU6QRY3UBAj5J1lIiBi/tRoukyeoCwPWfn1FcSvj
         7jvxgwdBXFP9aK2Us1XOkOrchnH9yg3XQPcs0jb79r7z/CEAu5/ArcttodT4NZJWXYtT
         iuaR+o8uWnaKHWr2IgkrHLNHzzJk+yL4wPBd0xRsRM9kQnuEe+DzsiYsnGs6ArTW3PhK
         +DK04Jia/RfxHevH3+rAut53e67/N0RfN8QIgoamVaODHsYHaa7m7dVqnAed1JiMSAUl
         8WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C88fNbpNNCW2fZzaHvdAaN4smyngfaWHvN+4TC6Vu/U=;
        b=kPdefXPZ3vDdOkEz5F/gzrwzOJrcIYrFYBRA34+TvoBctYY48Iwp7NcpywpGiTu89w
         DHc+pnuzUQaX9qYXh21+jksRAfE9fR/gJxZT/RxCqjWCGu1Qy4v8+h1sHgnevRwjGNZB
         3LNHjQ+9ZMSUnU8Rt81ig9ODmAGwjxq6oIrNp0q3yej3kxoV+gLLYkO+zLdA2eMS2sq0
         iU+wa/8E0L+KoS6UqRATtMTtc0g+/j+PPQz6lpiz5XacpE0HNxXYuhLDv4ikeWzymXWN
         hSIVECOQBL9oqWDrKV0ENVNIVANJpRX+nOj9sCwRVo9mNH5DaRZPmPOc5nrhh63fWnTy
         fJIA==
X-Gm-Message-State: AO0yUKV5Vy0H+kGWH50E1n8F2HiQ4FvhTD1mTPtmw31XiyR+10Td6qR3
	s31YanWsZqukWaGs1iyhyp8=
X-Google-Smtp-Source: AK7set99HL/INURs2FdURDjFPoChaZAtIVfwXX188EPMfu1XBIsb0kvse3VwuBAqN+9DXJPqMewUBw==
X-Received: by 2002:a17:902:c404:b0:19f:e9e7:4cb with SMTP id k4-20020a170902c40400b0019fe9e704cbmr1677531plk.45.1678626266013;
        Sun, 12 Mar 2023 06:04:26 -0700 (PDT)
Received: from kim-GL702ZC.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id kp15-20020a170903280f00b0019926c77577sm2858624plb.90.2023.03.12.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:04:25 -0700 (PDT)
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
Subject: [RESEND PATCH] perf tools riscv: Add support for riscv lookup_binutils_path
Date: Sun, 12 Mar 2023 22:03:05 +0900
Message-Id: <20230312130303.87954-1-p4ranlee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_060427_355693_11895C0D 
X-CRM114-Status: UNSURE (   8.17  )
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

Add to know RISC-V binutils path.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 tools/perf/arch/common.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
index 59dd875fd5e4..6ac7a22244c0 100644
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
@@ -168,6 +182,10 @@ static int perf_env__lookup_binutils_path(struct perf_env *env,
 		path_list = powerpc_triplets;
 	else if (!strcmp(arch, "sh"))
 		path_list = sh_triplets;
+	else if (!strcmp(arch, "riscv32"))
+		path_list = riscv32_triplets;
+	else if (!strcmp(arch, "riscv64"))
+		path_list = riscv64_triplets;
 	else if (!strcmp(arch, "s390"))
 		path_list = s390_triplets;
 	else if (!strcmp(arch, "sparc"))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
