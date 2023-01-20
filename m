Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB72C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzUL8zbn8zWDrfp9QdvX3Z2bvHTzJTlKaURku9bIq/E=; b=fZQV/w0MXFfl5T
	qLdoq3BOixgJUDXnbtYR+4seaOkAzDcIhx8IUELe+NDEu5MC9D0qbZF+hv6COpwU1inm7ZpJDKlFG
	KP+M/NfgGumgRyRChgG76IXPkBfQPF/1AL92ry7K0u0xvmZZEc2ijGsg9miH/C/tyngmJjLu0eo17
	cGK1+AvqYHHBGRDIfhA+WwR3+fYCvKiEPySXD1CkEr4dizFu4cVBTsFzwtn+HbmMbwSAl81MouUOl
	4Y5p+EYjAbyTNEUosvNbw5ZX35scmDez7SYS4zAhPcKTYtOjWbLP5HTsUXyvxCbY2NpVx3ooEYdgQ
	rTBdwMcsfLTL3HA/e2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs72-00Abmp-Qm; Fri, 20 Jan 2023 14:11:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs6X-00AbL9-BC
	for linux-riscv@bombadil.infradead.org; Fri, 20 Jan 2023 14:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8O9GfbQdEK8ARR2TzQy5WdNUqiHWxk+t6PyuioGvpWE=; b=Kt8rhqsEwA5KBIGH18Ccx2AHy3
	GJN9iDa5UbXQbryoHxq1GuEre/YZDg3/MlASdPh3IZaoSeixMMCUm7tLcq7jQCZkosmX18+aIA9e7
	xdT1BXGSc7aAZqRxGNm2E5+QHeG7I3o8z+HIo+RcW+MjpCm2UaVrmAobse8DvSksj8E0Cyi5mDuEc
	Ylwj4dfHEsuCYTWj4K1agnVCWX1Br6OFoJH+3LylnTJwhbUPMWZ9E1hoqcw0+wlxhY0salivUbxVm
	vJv84lTP20DTW2/LT0zjsoarRi/O0OW5MfIcCTuE83SeBMd+QTS1s4KUVj8glWGWCA9vVTxQkVQNL
	gZuMSb9Q==;
Received: from smtpout140.security-mail.net ([85.31.212.148] helo=fx408.security-mail.net)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIs5o-000eM8-1q
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jan 2023 14:10:23 +0000
Received: from localhost (fx408.security-mail.net [127.0.0.1])
	by fx408.security-mail.net (Postfix) with ESMTP id ACFDE322B85
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674223831;
	bh=RQWzU2KqdgJRpX94P0CtkFxRAHBwvD2KcEBPPyxcloM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V1KZUhpyDmPNQ7s98jCUfLKxNy5GcdzwrW8hWZsNwgDWL5QPct7ZGNLPbKLSF68ov
	 nD7ekTmtgqH4AFp8WIstVYHlRDxbTk75ou8Jo6yKRZWC/wUGIAgw3uJTCkaSLpK/HV
	 Zgr40Ae/JR7H7Nu+2n3sMgrPJVoZi09IKj/ecQIE=
Received: from fx408 (fx408.security-mail.net [127.0.0.1]) by
 fx408.security-mail.net (Postfix) with ESMTP id EA7F7322B21; Fri, 20 Jan
 2023 15:10:30 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx408.security-mail.net (Postfix) with ESMTPS id DA4EF3229C5; Fri, 20 Jan
 2023 15:10:28 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id A70F727E043D; Fri, 20 Jan 2023
 15:10:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 6737F27E0443; Fri, 20 Jan 2023 15:10:28 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 lDktg3SL9_GI; Fri, 20 Jan 2023 15:10:28 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id CDB2C27E0442; Fri, 20 Jan 2023
 15:10:27 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <fd9d.63caa0d4.d8831.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6737F27E0443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674223828;
 bh=W0RwmQvGfQWqSUcWAC1Dc3r+zpspRVwPqWqReyFBvZA=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=MHdrSbZ7EFMkFaZDXJohPgZy04uIddLyTkjn3Ka32JU97Sdek2KRS4kbc9iHt+Kfu
 aYZGNKJMocHa+4+1QyxX/yAipaYsbh5POzPgDYjEwI/cvCS95HL2G9aGBuX0XF0+jp
 Iz8iNW4Xsccsvzp27uZAJvfTCRIiUBWekPYCkaKg=
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Yann Sionneau <ysionneau@kalray.eu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: [RFC PATCH v2 08/31] kvx: Add ELF-related definitions
Date: Fri, 20 Jan 2023 15:09:39 +0100
Message-ID: <20230120141002.2442-9-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_141015_795995_138D2D94 
X-CRM114-Status: GOOD (  12.01  )
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

Add ELF-related definitions for kvx, including: EM_KVX, AUDIT_ARCH_KVX
and NT_KVX_TCA.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: no changes

 include/uapi/linux/audit.h  | 1 +
 include/uapi/linux/elf-em.h | 1 +
 include/uapi/linux/elf.h    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index d676ed2b246e..4db7aa3f84c7 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -402,6 +402,7 @@ enum {
 #define AUDIT_ARCH_HEXAGON	(EM_HEXAGON)
 #define AUDIT_ARCH_I386		(EM_386|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_IA64		(EM_IA_64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_KVX		(EM_KVX|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_M32R		(EM_M32R)
 #define AUDIT_ARCH_M68K		(EM_68K)
 #define AUDIT_ARCH_MICROBLAZE	(EM_MICROBLAZE)
diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
index ef38c2bc5ab7..9cc348be7f86 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -51,6 +51,7 @@
 #define EM_RISCV	243	/* RISC-V */
 #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
 #define EM_CSKY		252	/* C-SKY */
+#define EM_KVX		256	/* Kalray VLIW Architecture */
 #define EM_LOONGARCH	258	/* LoongArch */
 #define EM_FRV		0x5441	/* Fujitsu FR-V */
 
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index c7b056af9ef0..49094f3be06c 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -444,6 +444,7 @@ typedef struct elf64_shdr {
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
 #define NT_LOONGARCH_LASX	0xa03	/* LoongArch Loongson Advanced SIMD Extension registers */
 #define NT_LOONGARCH_LBT	0xa04	/* LoongArch Loongson Binary Translation registers */
+#define NT_KVX_TCA		0x900	/* kvx TCA registers */
 
 /* Note types with note name "GNU" */
 #define NT_GNU_PROPERTY_TYPE_0	5
-- 
2.37.2






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
