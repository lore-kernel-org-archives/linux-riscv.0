Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D55C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 00:56:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71816100B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 00:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71816100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Atw6IIOjHVLTTvtlWKqUAslKAQhzhKTQZQ9/dkILb08=; b=VpNvexvOPqCMifuhbtNf+36sFx
	cPknFMU6h/NsRnbq2h1JyEYUJlkAg43k6C+loeZL8WxreiqnXhclEomG7vLo8dVBYT0/3V9+DsVft
	BeneJz2OxZkmYYeSlofY+2UiUeaOO3Sb6K6N0thC9sqoJ9PBJqsffnrHfblhRhc6DQ1/3e9wTqh1T
	2Bhq7RxAWGaWjQGAFr56rOrKv92qvO6bxfZnDtJFeY2FJ1//hmnCuzdyhBhjdMvfxf8GsoX7pBOp2
	8aIKrKK934ZpjejmDx/AVyUCa8jcdKoFu9m4dU4Q2HCr/xS1p5rTqq6y5TL/1e4QjFpGuSGPowNhj
	90ubpkGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYID9-008qFC-7F; Mon, 19 Apr 2021 00:56:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYID4-008qEZ-JZ
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 00:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=j5vs+T9vdjaifTEm89biK1lrBqJ0dpftr2tys9oR/Jc=; b=A/syxJ1ASEOpUgBY4ag3p2JJcT
 NoYbjbjpQjagWFzibbLAkrL47VN2iphoGk4iLAql7B5A961RYiKQeY8vWKitUDvpIycOWXwDph+aj
 nuM9P9NrHF0JTBeS23ysy0TBQoqvShYtOdP4ypN77MBD23UEZNr8TnOetwRHlMtg8I9fyLe6LZs7s
 wNoJXoYozS+Tl/dOJKmyqNukwpJTRp/IOovf84lMvE9+mNTquHm7zDagBOOl+eAy3UBGjaGDWaj56
 RHTvPZHn4MtSorl42j5zO23Q4EOwEuEPvckfy9Ea/lon2oEmXE1iGxWvE6V8wHOVSN6b0/jv/mxa7
 3IWHBgIQ==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYICz-00Apa2-VU
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 00:56:17 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 13J0u09i011026
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 03:56:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1618793755; x=1621385755;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dnZDF3w6X7udDtiezD8XGYyfd4IjWkcxuZe8fuz0LRA=;
 b=dikSW43Z2/X2VJlkfW23IS53FUBEsNEf7RD5/fYcC7se8eJAiyjacQgiThWYKTd5
 jJr3R8MPw5aie6EdZ0yR4OA0GnRQz3IeYwY/ALEyAv5ldfS8czE/qi/6jJJUMAyN
 rXk1JWy/ScMAyzd1CAhYTakgPvrfPxAfEewWiaZUyCOjrymPcha5JE9tt15gm6r7
 peSF5zAJS6gRvRS5PJC7QHusRLHCsRwHuk5IRt4guA0JC2uXWFjkOe3t2KQi0iCb
 7GhgdOZyiU2gmdSoJJa3XHZsQv9EHK2kvM0MN38V2c7Y+qdk8XOvm7C9GuHZub0I
 HSSvyE62v+aZikW+4s3FLA==;
X-AuditID: 8b5b014d-a4c337000000209f-e2-607cd51ba308
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 F3.FF.08351.B15DC706; Mon, 19 Apr 2021 03:55:55 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH v4 0/5] RISC-V: Add kexec/kdump support
Date: Mon, 19 Apr 2021 03:55:34 +0300
Message-Id: <20210419005539.22729-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPJMWRmVeSWpSXmKPExsXSHT1dWVf6ak2CwZrHchaXd81hs9j2uYXN
 ovndOXaLl5d7mC3aZvE7sHq8efmSxePhpktMHpuX1Htcar7O7vF5k1wAaxSXTUpqTmZZapG+
 XQJXxsKf51kK/vJV9J3YydrA+IC7i5GDQ0LAROLM9pIuRk4OIYGjjBJT37mC2BICbhK37+9k
 BbHZBDQl5l86yAJiiwiYSzTPfM0IYjMLZEgc3feLHcQWBopv6HwEFmcRUJV4uWglWC+vgJnE
 jJ0TWCBmyku0L9/OBhEXlDg58wkLxBx5ieats5knMPLMQpKahSS1gJFpFaNAYpmxXmZysV5a
 flFJhl560SZGcBgx+u5gvL35rd4hRiYOxkOMEhzMSiK892trEoR4UxIrq1KL8uOLSnNSiw8x
 SnOwKInz8upNiBcSSE8sSc1OTS1ILYLJMnFwSjUwaZ0Nr1GvD5Z9Keod9M7qS1/idf26kma1
 oIXL1WRtlr490DD9/Qn+aya6J2xeGYd8mWrDb2GRyedXx57ndzKpbNVxPS62cO6iFwaaDZKV
 efNWb5m1O2VVfHHFw2rZoDlHNJg2/L2VcPy8afnjZxvmv0uZtuV10wNb7Qd2Xga3+qrPdGy1
 +ffQUTun48bq2a2XGdkUulfoPzL4P8ft18F47ni/bvunzlbT/lmfcpA4xSt2aWf9QSUj+dSo
 dq0Lfl/Kl21P4956o9BWyuHYhryKkhmBC34p19iqPa6YuqH+N0OQtGpd2SXRfatfikbHd68L
 4vk9cXGKyd2++u/OJmeLJEMdIuNXGs0//OfBDnclluKMREMt5qLiRAByhGsakgIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_175614_412196_94E01F4B 
X-CRM114-Status: GOOD (  11.78  )
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

This patch series adds kexec/kdump and crash kernel
support on RISC-V. For testing the patches a patched
version of kexec-tools is needed (still a work in
progress) which can be found at:

https://riscv.ics.forth.gr/kexec-tools-patched.tar.xz

v4:
 * Rebase on top of "fixes" branch
 * Resolve Alex's comments

v3:
 * Rebase on newer kernel tree
 * Minor cleanups
 * Split UAPI changes to a separate patch
 * Improve / cleanup init_resources
 * Resolve Palmer's comments

v2:
 * Rebase on newer kernel tree
 * Minor cleanups
 * Properly populate the ioresources tre, so that it
   can be used later on for implementing strict /dev/mem
 * Use linux,usable-memory on /memory instead of a new binding
 * USe a reserved-memory node for ELF core header

Nick Kossifidis (5):
  RISC-V: Add EM_RISCV to kexec UAPI header
  RISC-V: Add kexec support
  RISC-V: Improve init_resources
  RISC-V: Add kdump support
  RISC-V: Add crash kernel support

 arch/riscv/Kconfig                  |  25 ++++
 arch/riscv/include/asm/elf.h        |   6 +
 arch/riscv/include/asm/kexec.h      |  56 +++++++
 arch/riscv/kernel/Makefile          |   6 +
 arch/riscv/kernel/crash_dump.c      |  46 ++++++
 arch/riscv/kernel/crash_save_regs.S |  56 +++++++
 arch/riscv/kernel/kexec_relocate.S  | 223 ++++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c   | 193 ++++++++++++++++++++++++
 arch/riscv/kernel/setup.c           | 114 ++++++++------
 arch/riscv/mm/init.c                | 104 +++++++++++++
 include/uapi/linux/kexec.h          |   1 +
 11 files changed, 784 insertions(+), 46 deletions(-)
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
