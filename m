Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED36CFB42E
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcYSEbkNOMST5+I/wlNCEpa577Vk5jWy3K8AAB30mWM=; b=Z4sE7yGHCCjK82
	i3TVtYE06CgcMgE1PM/qH7zXdB5j/LVjJrG7xfcfHeyfByASNbsqdeeCV/kmFoWEHgK4en6/cJJSt
	s3E30LJxewg2i1yfcImpvlYoSVJ1jNTO11R6Hd/4iQiET+GRIgQojl+NdeJcea7aqAEQGfIXT+g5c
	HGcnibI+GQ7R08SnTcvGEGEIB8BMqu7iQJEdg1+YNbmiI3QN5DC+/JHGzCV9Vc12nAxLdloftj16g
	Rv6UkJgB945VzzMHH27OOE9JiX3mdacEeNPXkpWjRxei/7xjd/Kk8a/bZEZgZQdrNmK7B4Ngk/BoZ
	F8ooEnHaH5hNw8YqEaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxBT8-0000000Fuy5-1sw4;
	Sat, 05 Oct 2024 20:33:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtq-0000000FqTH-2riy
	for linux-riscv@bombadil.infradead.org;
	Sat, 05 Oct 2024 19:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LSNh7O2trPUtVrtwxznrhYE09HyCzuCy8rukfDtx/KY=; b=bPpA2TbdvGgtycJQbBeWQofRoq
	R+sqtX3w/nvcmHM67SOYdLFaRiFL8IjcJVTsxMCT01H7koUgVmYit5Yh7xOFF0oYfWnJnF0I5Uzgu
	6WDHNMYJVQfHsabWdeVipTJdSdlXg5X6cZAcawlJxLtIaeXN7/rF90Ez9agVpNU0mij7rFuUD4yEj
	kDpbxHxfdrNYgy6g34no3/VKeYKZ7wA8SLfMjjWfY9n9ns639QvxVrKufIY8w3A38KJWVdDUqBHbF
	gXn/QGdYru5yLWbZ9gcub13UKbA0mTDrGkLwhBHbtnTWHHdoXXIS9JUXDcsK2BQzGbp/vPUnd0cWQ
	3laz0ZMg==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtn-000000045s1-2Wjt
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:57:09 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e22f0be237so59587297b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158226; x=1728763026; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSNh7O2trPUtVrtwxznrhYE09HyCzuCy8rukfDtx/KY=;
        b=feus5aMf1Fvc2qQb1W8oUMA326ck1CV0NP6Ks5iy4Qd6UKHP4TGja+FpYo+eLNXygX
         pzhQZy7RAJ7Za04URUuRYwLKuf1RJJD7EgALsLJf+RlCO11Ii5oWhjOK8TP32I69unid
         OIFS52MCNFnRnxKyhtOaPg3kOqUNCC1+53w7LavwKTSVylGYfHiszyXutephZW50f7HE
         H9WG8AAWiA0NvMznLXfb0qcHjUrzUyYji3SqS/5XDoBC1Pmh3qK3lYOlIBb61KX8oY5u
         IdklXb+SGyAeTGYLM8ATuacG6EYXhQcQ9rZjiIvPbt2B/oAHMd56MqiJid+dw+jdnBtT
         tvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158226; x=1728763026;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSNh7O2trPUtVrtwxznrhYE09HyCzuCy8rukfDtx/KY=;
        b=ZGAhMHwR0ZPtdCraIA2Btux88BS/F2SnnnzCpadC2mckmRO0cC379DHjO6m10C+PJs
         kWqBMSGTT39yPWrmK3qV1EXG8MpNefa5JrTivb5yZZ9lUpi5Cv1RMVOyoc+weLV9O0Tx
         Sw+dItsVUvERdZTI+co5vKg8u8wsyZ0qqv/5YHwSdP+0NPRBkUy5ceV6vAEezW+9hxmF
         eDOSRhVZI5ld22+rjzWW14IM40KOwNLRMhn3pZBTaG8/gkpydo+X8XoJmTAGI1d4xmE6
         XoHSC7/m4/0srFB9zsM/tJ74OuRy4meHlbOEkiDeMN+88a6sEvsaBDwfMDMQXQILDxTs
         gHcw==
X-Forwarded-Encrypted: i=1; AJvYcCUv/PSjkvOqDeN42iVYzMZq8t55q8CKcUQytSJLVsLT4HHojM+J0OGQAN6uWekUk4E/klME42Eja1TELA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXc5R7FIb6t4dZcTzHuBG0/9ZMQhS51/ipqxbnuVkCSF1KzcZ8
	NwN9mif1rPZ12OJw5E/Oke1PamEjp7/qJ/A2/SKIWWNjOMvs8INqu5xVWoMHLf8lYjaiKX+VT33
	7nar1ow==
X-Google-Smtp-Source: AGHT+IHa7tzQlt8ZfJU9HM6CpUwYm+2RPIugXPlK83fzJL4/DRA+kOB4v30bsPjrBffyPaLJb/8aQ0jYC2TM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:2b8e:b0:6dd:d138:d823 with SMTP
 id 00721157ae682-6e2c72adbdamr920947b3.8.1728158225532; Sat, 05 Oct 2024
 12:57:05 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:40 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-31-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 30/31] perf dwarf-regs: Remove get_arch_regstr code
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_205707_797193_69FA8B19 
X-CRM114-Status: UNSURE (   9.73  )
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

get_arch_regstr no longer exists so remove declaration. Associated ifs
and switches are made unconditional.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs.c         | 12 ------------
 tools/perf/util/include/dwarf-regs.h |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 05fff75a8f59..28a1cfdf26d4 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,23 +32,11 @@
 /* Return architecture dependent register string (for kprobe-tracer) */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
-    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV || EM_HOST == EM_S390 || EM_HOST == EM_SH \
-    || EM_HOST == EM_SPARC || EM_HOST == EM_SPARCV9 || EM_HOST == EM_XTENSA
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
-#endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
-    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV && EM_HOST != EM_S390 && EM_HOST != EM_SH \
-    && EM_HOST != EM_SPARC && EM_HOST != EM_SPARCV9 && EM_HOST != EM_XTENSA
-	case EM_NONE:	/* Generic arch - use host arch */
-		return get_arch_regstr(n);
-#endif
 	case EM_386:
 		return __get_dwarf_regstr(x86_32_regstr_tbl, n);
 	case EM_X86_64:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 9dfc9abfdddd..6ee95cc69917 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -79,13 +79,6 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
-    && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
-    && !defined(__powerpc64__) && !defined(__riscv__) && !defined(__s390x__) && !defined(__sh__) \
-    && !defined(__sparc64__) && !defined(__sparc__) && !defined(__xtensa__)
-const char *get_arch_regstr(unsigned int n);
-#endif
-
 const char *get_csky_regstr(unsigned int n, unsigned int flags);
 
 /**
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
