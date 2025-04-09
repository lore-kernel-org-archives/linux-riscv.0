Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D056C36010
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xMP7dzsJI6ZbxuFxUoAmrpzEOwDP6El4gL89Yc3hCmg=; b=TXrLV2XoTiYlmn
	nrFVelASyEHBuFAx6wIiV+g5XB+zFNbVyatkhKD10khNQGVLH2gb+4aCR4YMC2tgYaeJ7bQr2V5pl
	XtHbEXTo0Rk4i50/nJKf4AuvsyA4bSiG/M+XdC6hzdBYaGwoOODng4J/UTA2//YG4cmNOqCOWThw6
	YlMrTmdu9g7QqmglGJoFlwGyvX+NuPZmr1tkGhWEgR6pixaSptibCpaqgNMPH5aPvvlnVvD9ITN9S
	0tPeA0ZUX8AfTBOhqgJed6SmGFs8R1tx3moDCOspaoi94vreDkluaXZZ6rInbwhgWfKdQJsyV4X1P
	fYlIoY5DbQDpCAx2PYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L6S-00000005uqc-3dWg;
	Wed, 09 Apr 2025 02:23:48 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L6Q-00000005upy-06ow
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 02:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744165426; x=1775701426;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MFPau5lifW8jMHZfdSw/2NIo4U/nm4MojtGTr6OejvA=;
  b=XPF93DdTUeAYV3I2q9bIDjnWR2d4sZ64IlMjmvVEuHH7j14pPCZf76Gk
   8vIVqiRAghkDRt7fIDG7h4mreqrLHf9V176jUD6qzYhW+MbeMFnKYei7x
   2hW1X81HQSUGUiCVO04MsLj4OSolPORnCttMBNXxWAh3viz9Wq85WaMoq
   rGVy7PKJSqcXTgeoz4rW52Yx+0ahh3Guq5LkQqN8Id6XZWkQC4ouCgSAs
   49doi1hqFCW/pf1yYOfHHDFgriRM9IWSOTWncJYj+cCw8lGK9KRDYwvzb
   cyvyQDmq2tHIdpDV2FiwimEY8RlDUqUPIUsxmpa07c2g9LfTWHQqo3HO9
   Q==;
X-CSE-ConnectionGUID: ftnWwBFORjGT/aSMlg4jqw==
X-CSE-MsgGUID: /2WllDhaTGyEDjYdVriAvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45784196"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45784196"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 19:23:43 -0700
X-CSE-ConnectionGUID: Ppnwobg6RqKNtrFV7mD+Qw==
X-CSE-MsgGUID: Stmnr3IERtGTLHBlnrrVNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="165675265"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.153.94])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2025 19:23:39 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] perf symbols: Ignore mapping symbols on riscv
Date: Wed,  9 Apr 2025 10:51:56 +0800
Message-ID: <20250409025202.201046-1-haibo1.xu@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_192346_074835_EFE5A910 
X-CRM114-Status: UNSURE (   8.79  )
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

RISCV ELF use mapping symbols with special names $x, $d to
identify regions of RISCV code or code with different ISAs[1].
These symbols don't identify functions, so will confuse the
perf output.

The patch filters out these symbols at load time, similar to
"4886f2ca perf symbols: Ignore mapping symbols on aarch64".

[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/
    master/riscv-elf.adoc#mapping-symbol

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/perf/util/symbol-elf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index fbf6d0f73af9..55b1409b0593 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1733,6 +1733,12 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
 				continue;
 		}
 
+		/* Reject RISCV ELF "mapping symbols" */
+		if (ehdr.e_machine == EM_RISCV) {
+			if (elf_name[0] == '$' && strchr("dx", elf_name[1]))
+				continue;
+		}
+
 		if (runtime_ss->opdsec && sym.st_shndx == runtime_ss->opdidx) {
 			u32 offset = sym.st_value - syms_ss->opdshdr.sh_addr;
 			u64 *opd = opddata->d_buf + offset;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
