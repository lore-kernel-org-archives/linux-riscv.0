Return-Path: <SRS0=OENr=AE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6F2C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:06:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E91020774
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H/uqV19d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E91020774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQ80v6GMPdJPjVR2jIxBM9JFBK9T9xqZcWZmJI7UyLo=; b=H/uqV19dNjKTqFMpOWjmnTCf3/
	ISpsxFkNefS/w8vG+LWeWx5QHjNIgDpXrCfsSiaXSOGfJy3NveFQZCsuaD3rqLDph2BNsAFSf4P1c
	sb51iqtxf9GFJquPVa1DJv1VqLcCCbffydwz5Yq7jLDBTBnyxtEDeGdKbQHmW+rJwoYm5RPtz3PdI
	FA7uyCmuV4F+wJsLEmJpSRlMuxuEnJZNUKGorGr4f9wEXzoKU52Ha4C6dEGFR9wuLuiA6zJnRUSkd
	XMm9ljoK34bJ3dzQrpLe23S6dvcdfhTM+un01+LQk/Wlcm8nKTIIpxpCoKakEncHQn5lWlCip+FTh
	2PD4MPMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnkV1-0006tv-Vb; Tue, 23 Jun 2020 15:06:12 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnkUv-0006oK-TD
 for linux-riscv@lists.infradead.org; Tue, 23 Jun 2020 15:06:08 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 05NF5PbV016105; Tue, 23 Jun 2020 15:05:27 GMT
X-AuditID: 8b5b014d-257ff700000045c5-ad-5ef21a348931
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 29.B1.17861.43A12FE5; Tue, 23 Jun 2020 18:05:25 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: =?UTF-8?q?=5BPATCH=20v2=200/3=5D=20RISC-V=3A=20Add=20kexec/kdump=20support=E2=80=8B?=
Date: Tue, 23 Jun 2020 18:05:09 +0300
Message-Id: <20200623150512.896499-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsXSHT1dWddU6lOcwaynjBYtH96xWixa8Z3F
 YsvhR8wW2z63sFk0vzvHbvHycg+zRdssfoumF9eZLT7cnc3mwOkx9fcZFo+uHzNYPd68fMni
 8XDTJSaPzUvqPS41X2f3aD/QzRTAHsVlk5Kak1mWWqRvl8CVcbD/HlvBeZ6Kc69/MDcwNnB1
 MXJySAiYSBx+dJu1i5GLQ0jgGKPEvUf72CASbhK37+9kBbHZBDQl5l86yAJiiwiYSzTPfM0I
 YjODNCxeVtHFyMEhLBAn8bFdFsRkEVCVmPAyDMTkBap+uc0FYqC8RPvy7WDDeQUEJU7OfMIC
 UsIsoC6xfp4QxDx5ieats5knMPLOQlI1C6FqFpKqBYzMqxgFEsuM9TKTi/XS8otKMvTSizYx
 gsOV0XcH4+3Nb/UOMTJxMB5ilOBgVhLhfR3wLk6INyWxsiq1KD++qDQntfgQozQHi5I4bx73
 8lghgfTEktTs1NSC1CKYLBMHp1QD0ySB1/u5BHZZmp/Ojy7f5cs6f5LMkt7dAn1Cv5c4fPr6
 U4xD/rRs8By9KnMGszk9/zd56Odb/Zg1/c4hUT/hK52NYb4feVUtMz2Tssq023iqFh5PyVhk
 WnOtRDr1tknN7gVlb6W/thodMs+OWuZy4MXNs4djVRUvlf5+dnzLW9cpt36sTI7rS0w+9uOO
 0DutTA8/l6pD9nNaG92N3dv1nnmI2fr/DNh6V/tp59U7GsWfPWa1hzoU56b9tn+hrKshsiTg
 T3VIgFyt3oIfPrcbClL5hHmKLkfO4tMPkvfcp511/EPaieJVvb+jSp4uadWW5o+o5Tz6Z2PC
 fC7jAGv+M6wKbWsffNyeaHz4da0SS3FGoqEWc1FxIgCd1Y3txgIAAA==
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Tue, 23 Jun 2020 15:05:27 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Tue, 23 Jun 2020 15:05:27 +0000 (GMT)
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
 yibin_liu@c-sky.com, zong.li@sifive.com, paul.walmsley@sifive.com,
 Nick Kossifidis <mick@ics.forth.gr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds kexec/kdump and crash kernel
support on RISC-V. For testing the patches a patched
version of kexec-tools is needed. The patch is still
a work in progress but a draft version can be found at:

http://riscv.ics.forth.gr/kexec-tools.patch

v2:
 * Re-base on newer kernel tree and minor cleanups
 * Properly populate the ioresources tree, so that it can be
   used later on for implementing strict /dev/mem.
 * Use linux,usable-memory on /memory instead of a new binding
 * Use a reserved-memory node for ELF core header

Nick Kossifidis (3):
  RISC-V: Add kexec support
  RISC-V: Add kdump support
  RISC-V: Add crash kernel support

 arch/riscv/Kconfig                  |  24 +++
 arch/riscv/include/asm/kexec.h      |  54 +++++++
 arch/riscv/include/uapi/asm/elf.h   |   6 +
 arch/riscv/kernel/Makefile          |   2 +
 arch/riscv/kernel/crash_dump.c      |  46 ++++++
 arch/riscv/kernel/crash_save_regs.S |  56 +++++++
 arch/riscv/kernel/kexec_relocate.S  | 217 ++++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c   | 193 +++++++++++++++++++++++++
 arch/riscv/kernel/setup.c           | 209 +++++++++++++++++++++++++++
 arch/riscv/mm/init.c                | 110 ++++++++++++++
 include/uapi/linux/kexec.h          |   1 +
 11 files changed, 918 insertions(+)
 create mode 100644 arch/riscv/include/asm/kexec.h
 create mode 100644 arch/riscv/kernel/crash_dump.c
 create mode 100644 arch/riscv/kernel/crash_save_regs.S
 create mode 100644 arch/riscv/kernel/kexec_relocate.S
 create mode 100644 arch/riscv/kernel/machine_kexec.c

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
