Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7680E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 23:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uW6XCuehH95jl3dFLjxxXdFWUuXXqLkzv66D5ymBN/s=; b=T4GWRxjPYV+vEz
	7h2lbIVOpKv0kWvQb0jIPQn947dz9eBqGu8v9P+zSJJQlmwqG/xc6xsUGnqS1VLpuziKSxm82ihql
	cc2iMd86REavhwCpaWa5zPKIV1FQt8cMrJYcAiFNTeJcWcGiffasHF1pXZ5hz7n2IutO8DH3awaGj
	EH3+kRm2lxdWhOixqk5Y3Oa0BRTxAb2gYWifn059jG+0aPTClz2zgC3zyKf2U4beHU0CgMrLOlxla
	tAZsCRvzc7lxeJTAX+2Oue//GYEOgwaVqqXxa4SoWOEodERoHSnCfKzoXBeI9BVMwa8x4AqOYj/dz
	zS4Jj1niLb/m27fJZ1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKHI-0000000Bcdu-0fbk;
	Mon, 16 Dec 2024 23:13:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKHF-0000000Bccr-205R
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 23:13:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21631789fcdso37226695ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734390804; x=1734995604; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cbp0zEgt8sYGgGttOagenj605vUWFx5sipZ2Yl2U3s=;
        b=3HJRfDNvPm2semdzrtYpxH6wuga5iAk27pOVdHQHbsF/r5cEHWeRZgr2+TCJxJ6yYh
         8aJ7fs8ht1KjZPnBtZYHaY5SMp0Z8kpUCGWVXngHDkzpqeS3sSx5Cn4+EwNnJuoLo66x
         VAj5gpArqmjdE2jFSqW+IaagZZLDYm3mARTBwAQM1Ii2qBtcOk3Epqd1hyfPXkXqkt+/
         r5kuoTludNERKAqv8OE4rN3cj8TJLf3uhTFdNGI7deM6Jut+UadJROZG9+vUOWg0Bmc5
         UxShpDRys2nifK9cJJew5fNKle/rzUXxhAtIsXj0RvBm6F/ZXhMClU6FjsfolO+8o1Kp
         PBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390804; x=1734995604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Cbp0zEgt8sYGgGttOagenj605vUWFx5sipZ2Yl2U3s=;
        b=RemiGKNbDUVCj3pV3kMeEYE96GeH/6NqU2nAqf4tRITkrbyY+LuJoEbzb0aH5lFl8A
         M1ullE1DVrWoCniTWs9rx5t2cFW7PBHOVLPkosEp/x8zdqO9q75lthvRfDC/uuGMlKyU
         fxAjdXzdfhs0fufMAK0rDPfJWTiHsx1WiwB4HJYQOG8aX2d/c8FO4t+u3fBPr4mUl1Ps
         ZJEySAhipPY/0y9yyVgIy/fHIf2LrRDywPaD/L44eJQUVUrDBNT80s7w6m86tdQEiQDI
         1vr7WblmOcfTYJ+RAsL4Btsiu5BKdNCgMdeDzUvdYsOIw0Wo72OfZ6hEWjuDBbCleYY9
         njLg==
X-Forwarded-Encrypted: i=1; AJvYcCXl6njdLGOihpDSgGZiYfApyQlBjWhS/GRK7qZrAVsy7WxbORTZoFg4qSLrMdmwoQxRbgU4SkKw1iZD+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1KJcPIpdykbdLBBTOadBvFr01EZ+beGb8BlbZIajX8XVA3kT+
	HCSGy3mGvjjKaC1sU14KBk+h/nGgdYZyy0EHjqTjEG+igjjxNLB+pedhZrcZ1t8=
X-Gm-Gg: ASbGncuS7rmIePwysMjQwTD0K/RFC+WdMuOHoajPzH4E/N9AHVFe2jgNuAlqEEIlZvB
	WrrmKgEq+ND6CBWJNIkv4JL0oIWSPWyEZleDioCV9SJsnkYeiG2+wFm7hmlInAHXeDpUOCBEQX6
	UnQm3k61pEh8KFzNn7HjNBWwKikOlDyxd8RY1XUVa9VNAU6Alim3gguf2mu6ZuX1u9/PTycwxWx
	XjbxSS4A23VQLwq0LUeKbLSM7cL3gKJ6mIjyaMyFGWYtPUwSvYu4y3dxoFo0pNEl8WHoM3o
X-Google-Smtp-Source: AGHT+IFjshciKlmIzBIB1jw3LAR8ZYMAQPyyhOAHw8JXPxmnDCkeL3I1RpqctkebF7xjVj+9QrljiQ==
X-Received: by 2002:a17:902:e94d:b0:215:b18d:ca with SMTP id d9443c01a7336-218c9262d3fmr19286865ad.18.1734390804203;
        Mon, 16 Dec 2024 15:13:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc47bsm48333255ad.63.2024.12.16.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:13:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] perf: tests: Fix object code reading test for riscv
Date: Mon, 16 Dec 2024 15:12:50 -0800
Message-Id: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPKzYGcC/x3MQQqAIBBA0avErBNyLIiuEiFqY00LixEikO6et
 Hzw+QUyCVOGqSkgdHPmM1XotoGwu7SR4rUasMNeozbqIok28mOFc7jt6Q8r5FZOmwrOxw49mTA
 OUAeXUA3/+by87wdZlscZbAAAAA==
X-Change-ID: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Nelson Chu <nelson@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IOgGM2w7pk3oigV1gqLUmR9Qqpa9O/Il6zfGw3fe3jI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rCFo5+3e1tQisqpS6cac/wyM1MmJaWySK9PGtBBvOv0
 6Xbun91lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBG+LEaGb7e2ZHT+jXg/4T8D
 c2X1sxcK2mW1O46Jy13fG73kPPv5XEaGxZM1Cxg2/bUOU7Tlnu+i9MlYSu3ZjWSraXInZx/vuze
 VAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_151325_721677_634C4C2D 
X-CRM114-Status: UNSURE (   8.08  )
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

There was a breaking change to binutils objdump that causes partial
instructions to no longer be dumped. This behavior is different from
what the "Object code reading" test expects. Add a Kconfig variable that
checks the version of objdump and conditionally enables the perf test
fix for riscv objdump versions effected by this issue.

A binutils patch has been sent as well to fix this in objdump [1].

Link:
https://sourceware.org/pipermail/binutils/2024-December/138139.html [1]

To: 

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      kbuild: Check version of objdump
      tools: perf: tests: Fix code reading for riscv

 arch/riscv/Kconfig              |  5 +++
 init/Kconfig                    | 10 ++++++
 scripts/Kconfig.include         |  6 ++++
 scripts/objdump-version.sh      | 69 +++++++++++++++++++++++++++++++++++++++++
 tools/perf/tests/code-reading.c | 17 +++++++++-
 5 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
