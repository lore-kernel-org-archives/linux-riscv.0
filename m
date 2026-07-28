Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67ADC531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 03:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wFcZHGxxpd7G4ItDcUmt+OKfL3fEMSB0wbd4x2pY9Lc=; b=v4N6B9LKjOniso
	rC6TFUrjNkx/MqnaXY9wnxt2jOf5TEf+ryYcxsSlybvFOeqvqW3so1+g/KW93SOzu0SA2c322qvz4
	XKTIywUqQdBgPyETBfhxn34+ne4VXgxENTqjiYgfU1cFgAKsa6maeRGGiWmzKIabfPsGbLl40BtDY
	GDGqvH3NkrkdKc8yoI3anMvepU3qsWN13Em579HbP28sEPOJEE2wOFO9j8s0fpZduom+/6tcuHVIW
	0BFmqUzZ3lwymOKpSxEPql7wq2WOLHAVF23ilXVif9nrP1YOxBjPWvOaM3VPIvajgG1jF9u2VZs6T
	NB0t22o6F0of7IGcn2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYcC-00000004KkT-1bBP;
	Tue, 28 Jul 2026 03:36:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYc9-00000004Kjg-38JZ
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 03:36:23 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so2379339a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 20:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1785209776; x=1785814576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTv+ZI9c6fC7+DaQLSs6uSK+t6kk33LjEjqmF5l8N7k=;
        b=Xn25bMa+V+OsFDKRUvHLjPZcpXH+SWyn6AGcRp2/dYdGrL7MDn4ABwM4DQdsFBOSYF
         6FzAOcOSCYqb1vAkMjVME+sbWigNX6xAI5afYCSbAZ+BvDipc3BXDwUyjbdSIOxzp7j/
         kOlzwdCAx50aZbP18qwpltt3ss/3lRS/Ug5+Me13/vypE/+J04eBrkYa5m/q87Fo4h7q
         UY96ojSmBrvtATsrv4IgCRhLZSxw33UGPxQ3P96tfYlR74TlxpnlwDNV6SlLYcwhpX3K
         g7rynSLTutl8719ys7nDiTNRxBXr2gM19dvzd6Vh9Bs7ebHPB8J/hXdd5xmhAxZDHUc9
         W2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785209776; x=1785814576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTv+ZI9c6fC7+DaQLSs6uSK+t6kk33LjEjqmF5l8N7k=;
        b=TEOFvOrQ89iJpmcJ2YyuIVw4dVB5jFAtdxUsBc1Pwxm8qvY1AwCkxv0k09iwwAJ3Rg
         8sSjQkLeVU96u5aB3ufG+wzEIxXWoxZJKQVD9pvFNeBv/hK+oE/dVqfxqMCttj1jX23D
         YOzvbzjTnfXFSo+nc4wg+x2hlRe+L4fOmCTBkkeaYACr0Ei2M+KNxfjioOkF/pZXDPQ5
         qOPb6t579GtyTqlDoQ3phRZTXHzVAtfe3kLvGYMZPIacMt1r8nq/md9rP0W+9DWsTFo1
         xPLEDac32LJuOcvE/B+sGZfLtSl14FKj+Wa82LtbiBjPrB0SpXtbAh9x0dPtOJCZKqMW
         VmEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNn5W+S2kF9Mw192OJEvZi50P2f+dhhF6C7WDpP9NpqyyeGDRzFciSZH7/dzPeBjtOYnmW/ic8GE5OrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrU+NN9is8LuzqZ7blkhungB6Q3nj2UpTjyl+Sgq2bezEnwpbJ
	LUt9rGBmllGUhbmXx2AiRDPNJJKKBhNIxSwK59mLx22K5fHwNtAGJ4XnDt8CTZqeP5w=
X-Gm-Gg: AR+sD11PNzmeRdIUedstjDvu+Eb8Sq/Q4NwGAqrcsh9mqEF/FHBXgpnx3F9ZFZgdx4d
	SWYUgABUQpqH4sRk7Gy+RBabnJC27wYnDOFVwpVB7W2SZcCMsar8vu1o1XQJufoTgk++2Wd0HF+
	q2xTh1mj+VL8tl8ziq20Q+9nvHaigjxd53qdjb9uJXmYjMPlTDtXk9FWw1FXEHMq1/LYppxrjTD
	SQDgAaHSl/KNeLxnSGz/uP4MgVbGo8l1LNj27nqskHB8uFB8EdbLDfY6aB4pPDItvHfCXgYHKMx
	auP3AvVXBwaMs6Ll5iU4KIryiJFtbf/3aurkldKPCZuZxh5UWZelFCLLsgyXbVLsSSXBYFda3K9
	ZKfCeNH9FI6u9dA2EYgT3Lt0waXGBj+KG8DQbTRGncLrpzxfaIqrvXSede6QcnYvzle1IrUc44w
	3wDhpHgpK7h49for/AjM0LYEAePrIi9Yts/4OgfrG28dIBcwViLXkuzwvlI6n/+NZj3lJt3uSXZ
	iLU8dfowiJYf/4p5k/Ku8hwK648MlOp9yMqvQ==
X-Received: by 2002:a05:6a21:b8c:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c8ba46c563mr928062637.31.1785209776301;
        Mon, 27 Jul 2026 20:36:16 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm102135749c88.2.2026.07.27.20.36.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Jul 2026 20:36:15 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: peterz@infradead.org,
	mingo@redhat.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com
Subject: [PATCH] perf symbols: Skip dynamic symbols with invalid section indexes
Date: Tue, 28 Jul 2026 11:35:53 +0800
Message-ID: <20260728033559.90302-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_203621_940062_43C77631 
X-CRM114-Status: GOOD (  10.49  )
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

RISC-V post-link processing can remove relocation sections from the final
vmlinux while some .dynsym entries retain stale section indexes. perf
aborts the whole ELF symbol load when elf_getscn() rejects one of them,
discarding otherwise valid .symtab symbols.

Skip only dynamic symbols whose normal section index is outside the final
section table. Keep the existing error path for .symtab, reserved indexes,
and other libelf failures.

On an affected system, the vmlinux symtab matches kallsyms test changes
from Skip to Ok. [unknown] rows in the same perf.data change from 41 to 0.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 tools/perf/util/symbol-elf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index f6f6b54da131..e955c3feddcd 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1681,8 +1681,13 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
 			continue;
 
 		sec = elf_getscn(syms_ss->elf, sym.st_shndx);
-		if (!sec)
+		if (!sec) {
+			if (dynsym && ehdr.e_shnum &&
+			    sym.st_shndx < SHN_LORESERVE &&
+			    sym.st_shndx >= ehdr.e_shnum)
+				continue;
 			goto out_elf_end;
+		}
 
 		gelf_getshdr(sec, &shdr);
 
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
