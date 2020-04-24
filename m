Return-Path: <SRS0=rCLW=6I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BBAC54FCB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 17:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A8D2075A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 17:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N19ec+yA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A8D2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cC0Rs4QibosjZ6vb6vPFIvfrOeraosDew6DLhj9XhYI=; b=N19ec+yAnCQkb8
	+xwjdrcbvkJyX+uWGs4uzEsdv5bzN0aXDVCV4n9ZqxG4ra7oeEoNQPWBdphA4jE08aTcjp/E5NTCQ
	wCq8eU8yiS4rr/R9jn0RgipbZYEC8zVVcKSEb13OfYNUITE4teOdioTQPkJiRYu1Jw66vj3oI2KCR
	W2hZxEXd+kGfbp4m0sFA7O33uSOTkCQBh7hux4OFn15aDLo8rACCbI5p24R6J3HD3vdIcQYM0p4D4
	weOGveSu4GcrM4dDdht/W1V3oIjmfPEnR6h0H8iY9GFxYazjzog6a800ZmIKj6KSbSSTsVIGAPAzX
	2p+QHm7wjNexeTL/LLtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS1sX-0004BX-Pi; Fri, 24 Apr 2020 17:12:41 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS1sU-00049d-Mg
 for linux-riscv@lists.infradead.org; Fri, 24 Apr 2020 17:12:40 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 03OHCSKt094031; Fri, 24 Apr 2020 20:12:28 +0300 (EEST)
X-AuditID: 8b5b014d-257ff700000045c5-bc-5ea31df7508d
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 C7.23.17861.7FD13AE5; Fri, 24 Apr 2020 20:12:23 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] RISC-V: Add kexec/kdump support
Date: Fri, 24 Apr 2020 20:12:11 +0300
Message-Id: <20200424171214.1515457-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXSHT1dWfe77OI4g85zchYtH96xWixa8Z3F
 YsvhR8wW2z63sFk0vzvHbvHycg+zRdssfoumF9eZHTg8pv4+w+LR9WMGq8ebly9ZPB5uusTk
 sXlJvcel5uvsHu0HupkC2KO4bFJSczLLUov07RK4Mpavm8RUsIWrYu7Z8AbGBRxdjJwcEgIm
 Er+2z2TpYuTiEBI4zijRv+MGG0TCTeL2/Z2sIDabgKbE/EsHgYo4OEQElCXm33MFqWcWOMYo
 sWfFfCaQGmGgQW8+XGYEsVkEVCUe7d/KAmLzClhIzJ65lBFiprzE1m+fWCHighInZz4Bq2EG
 ijdvnc08gZFnFpLULCSpBYxMqxgFEsuM9TKTi/XS8otKMvTSizYxgoOP0XcH4+3Nb/UOMTJx
 MB5ilOBgVhLhjSlZFCfEm5JYWZValB9fVJqTWnyIUZqDRUmcN497eayQQHpiSWp2ampBahFM
 lomDU6qBaU6lftFtI/3z9rPbPCbtjhO2qQ650/hC/d6CvH+v2Txsyh/3OS5YIKnjvWu9o/rG
 UyuP+b2/22ZcE8dde8n2dOrTg8s0FkhoPv589e2UaR1sbjpLVj9/zXlsWUSGdsTJO+9XtaQy
 rWx4YL55e3uz6Mcnrw48Ln8wo/OJZKKy0OqPk/fZtUcdOSx96hyXZ+kvO2ud7BTT5bsuvGvm
 EZ/H8m5zaMJ+3V/NLdIm6zcZxX05njur6Zi80qFdgp7+ziovX9+SDtrC+07K6s1yqbD+Q1bM
 fR/4Z9WyPzqSsfSw8YK4wr1HX2i+l2Nn+mlZp7a8atFh/0mfLzC9VN6zqT1Sukcz1o25KkM4
 43gP05tdU5VYijMSDbWYi4oTASVhK8etAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_101239_111591_518CE872 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org, atish.patra@wdc.com,
 yibin_liu@c-sky.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 Nick Kossifidis <mick@ics.forth.gr>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds kexec/kdump and crash kernel
support on RISC-V. For testing the patches a patched
version of kexec-tools is needed. The patch is still
a work in progress but a draft version can be found at:

http://riscv.ics.forth.gr/kexec-tools.patch

Nick Kossifidis (3):
  RISC-V: Add kexec support
  RISC-V: Add kdump support
  RISC-V: Add crash kernel support

 arch/riscv/Kconfig                  |  24 +++
 arch/riscv/include/asm/kexec.h      |  54 +++++++
 arch/riscv/include/uapi/asm/elf.h   |   6 +
 arch/riscv/kernel/Makefile          |   3 +-
 arch/riscv/kernel/crash_dump.c      |  46 ++++++
 arch/riscv/kernel/crash_save_regs.S |  56 +++++++
 arch/riscv/kernel/kexec_relocate.S  | 217 ++++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c   | 193 +++++++++++++++++++++++++
 arch/riscv/kernel/setup.c           |  63 ++++++++
 arch/riscv/mm/init.c                | 173 ++++++++++++++++++++++
 include/uapi/linux/kexec.h          |   1 +
 11 files changed, 835 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/kexec.h
 create mode 100644 arch/riscv/kernel/crash_dump.c
 create mode 100644 arch/riscv/kernel/crash_save_regs.S
 create mode 100644 arch/riscv/kernel/kexec_relocate.S
 create mode 100644 arch/riscv/kernel/machine_kexec.c

-- 
2.24.1


