Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2960A2601
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 23:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=igSDPkUC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=d6h9sAyp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XTlnORXs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=OEmkBX+lmQSxmqI4d9Kn8nUt4UiTfGgimLE68jpqqLc=; b=igSDPkUCNiEx3SDaVsUrGw3PXl
	yzyRBFyalt96bdh3eCjsIsNOmgNfZY6stdTWq7z9bZhnfiykTtaUKViBL0v2RdlyL4rB7+iMuLOlP
	TLv0L/mW/4jy3d4KQ+msJFDrMSOhue91+gllEpsdlshfpquPCdcj25fx0krsTivn32F88opkvmzY2
	D7QSCuNDnGHdvpXZDgvSbQO8V4YAwNPXXGN+3U9wBEXYdF21zX4gukcJBAOsSyvZRDv4se+17PBSP
	7kC5bjm+FWZXWuxJ+FQ9E3TS/ZOtUJUPDbg3J6XXtBRgv3zuR8kll5+2GZd7Xq2qMnv09ORR3CNnK
	K+h9Za1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHSp-00000001ujJ-247R;
	Sun, 22 Nov 2026 23:59:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHSa-00000001uZs-4AuG
	for linux-riscv@bombadil.infradead.org;
	Sun, 22 Nov 2026 23:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=; b=d6h9sAypSQzrNqoH7rmWpUfR9i
	bfQU1d73OpEHWSWacok8q4hgVymbDldjgZl1MTXztIzshUKz3F2VKl/GyQUhjhYTmr7/WbB0DJC+Z
	pv6RaqqsiopVjv++4JtcfvsQPmCtYi5j7pjqx7m2s4CxP0oWxnr7Q/UEzVTwF9VCGTAgG8sBXeqgj
	6PqPjfbbND/ydYQ9jYtIj+P1r8nSrZEIcgE64F1UT/ETikoDXSwWjcDXzg9lvOpJslvr92X3dEXKa
	Trg04j20iO0281NarlEZUmCHrTFubXaKMFvZH1cqW+WnHdmUr9UQW4aB3DTxYCo1U5m9CTWG98ciB
	QFPaKJ+A==;
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHSY-00000002abD-1QOU
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 23:59:03 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-341eff9e381so4592843eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 15:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795391940; x=1795996740; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
        b=XTlnORXsEsHXbxWlEmcyY0QHFGeZ4krQQgMKUBO3Ks5Cu0pM/0HgOxA5LNQFmSzB7s
         839+xBgrZdHUlEjA8X/clSOFjsRRKpsHF/x5KoroMpHBZvKiXkeU51V/tBCvk5+TvzlS
         8rO6s3It65gDLDBUu676m0IPgQg7Yp7FfVPyNUPi/05BH0VIR/qEFIgDEO3kCkrQWL1/
         b1CBIKPDxTScGh4u1PhX9vUi3Qa+crNecbOwYjgTpT+FpT/WbvZU6OWpXK0hwTU4o2si
         HuLMjYOWQpT5ryECPx+LQNUajXuM1SVh+LSEPESKcbgwIR4TI9ilmHln7QKb3/p8T8hB
         rkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391940; x=1795996740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
        b=tk9AoVVNASVsIGF6TEe0VYFi6O11DRrRq/Ry7Tl7Q48lTMn6wBLULb2NI28pnB4S67
         4fv2K1Zy7llyPs7v/o69M06v8Qs29PGYpyncXJAz4iH7LCJESPWoLRrQlpZ0iorK4iOn
         bI8wesGDZnBXzqGkzcoqwXfFAdXEteNOv+ijBbFKQ2C/klClPB3NA3S2BWeRCJF/cDeK
         2171jSAAdx0V14/aqtNtqcEJROJH3TW/0wR2wg+6s2qxEva3v4YW79/mV7r9fkCh4Ag0
         QPce+NSxsmaSnorrpWE+oq37OjaTJJyJN7BNSFAQ9dvXMBmqRIyrfK322AQXpTb80OjL
         IePQ==
X-Forwarded-Encrypted: i=1; AL+hErEdSTPEuyaq08rA5migd9w3/8Wob4aJ/WCHIvHXzwGlihENX+fLwzP6HD2XiX9iAOnjugiwdqPwWjAmbw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8cGC6hNKcYij8WtYXwTCT6FzGEO3h4pyPRKmukB9oM3l11nWFd
	oxW10Y4ACVtt4o987VP0NekCoJGw3R1lIrbwKxLvFSCITqbANH1Rd1kBQ9Hp0hYe6clk0IcS5EL
	OyJz0XGrrig==
X-Received: from dyclv5-n2.prod.google.com ([2002:a05:7301:6185:20b0:351:4a2a:1ece])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1505:b0:384:df31:6a07
 with SMTP id 5a478bee46e88-386a87efea0mr3258907eec.30.1795391939090; Sun, 22
 Nov 2026 15:58:59 -0800 (PST)
Date: Sun, 22 Nov 2026 15:57:50 -0800
In-Reply-To: <20261122235757.3456048-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122235757.3456048-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122235757.3456048-5-irogers@google.com>
Subject: [RFC PATCH v1 04/11] objtool/ibt: Ignore .eh_frame relocations during
 ENDBR validation
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, ardb@kernel.org, 
	linux-efi@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	indu.bhagat@oracle.com, jremus@linux.ibm.com, wnliu@google.com, 
	dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235902_245454_2906F5A8 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -7.6 (-------)
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
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When vmlinux.o is built with -fasynchronous-unwind-tables and
CONFIG_X86_KERNEL_IBT=y, .eh_frame FDE headers contain PC-relative
relocations referencing function start addresses across .text. Because
.eh_frame is read-only unwind metadata rather than executable code or
indirect branch targets, skip .eh_frame* sections during objtool's IBT
relocation validation alongside .orc_unwind_ip and DWARF .debug_*
sections.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 931c5c412f15..e631b0da9bad 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4644,6 +4644,7 @@ static int validate_ibt(struct objtool_file *file)
 		if ((!strncmp(sec->name, ".discard", 8) &&
 		     strcmp(sec->name, ".discard.ibt_endbr_noseal"))	||
 		    !strncmp(sec->name, ".debug", 6)			||
+		    !strncmp(sec->name, ".eh_frame", 9)			||
 		    !strcmp(sec->name, ".altinstructions")		||
 		    !strcmp(sec->name, ".ibt_endbr_seal")		||
 		    !strcmp(sec->name, ".kcfi_traps")			||
-- 
2.56.1.750.gf70dc682cf-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
