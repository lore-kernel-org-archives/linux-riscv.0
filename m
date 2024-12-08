Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A4E77173
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpdvES38S8hEPcTaL9xtn1Yl6E5gER0Ow2Y2HHH5cOA=; b=S9iDBb1RAYvdPW
	QSQ+CKEJPScdkQPdEPuj83rYu9aQNZaIlVqAdkcq8fjOT6qqnb7SO/SXICT8kXp2tfJVhcDhm1KQn
	oe7jNJXdifYmjCpIWKBUlz/kmvWfXkU5hisS/h6jdUIH9hkcXDhM7V8fJlut9UO3sg5EDzsS2TcSH
	KLktCs/wIeHNeqdljdFZKNtPEYYbsWbVAin0I8zh2JiU3t0GiLLiSfN2vXczmyTRYFF+P1JvKm9zl
	tKTX+pBywQLWFnBNvhu2WKBuDzUj2uY2sfZTRl1ATQKURwbnn7c02kZ6rM07DWFCjkUxGRNKX/Poz
	tFS6cFgpwvHFX0O7PEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJb7-00000005VJU-1fre;
	Sun, 08 Dec 2024 15:53:29 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJb1-00000005VHY-2rmV
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 15:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nxI5r
	KZ08BnCDhR50j1kRXJkXSlItgYZ6GxJQvaVuSo=; b=MqQAE0bG/H98s7Yv5oOgo
	25eCQfw9GOKpsKnu3ludkuEpHDqeZP7a1cQks00ezTpL5Qszmrd3ICU++I78LraT
	onrw7q6O3uIOlT6ac+/FchZgdWRPSeqiBj9zHFJweGzcl/rEn3K8ynjStm5fUVLL
	x8dfSH8ufmV9ep4bpD8YDg=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDn9z+NwFVnfXBxAA--.54791S2;
	Sun, 08 Dec 2024 23:51:44 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: debug@rivosinc.com
Cc: Liam.Howlett@oracle.com,
	ajones@ventanamicro.com,
	akpm@linux-foundation.org,
	alexghiti@rivosinc.com,
	alistair.francis@wdc.com,
	andy.chiu@sifive.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	atishp@rivosinc.com,
	bp@alien8.de,
	brauner@kernel.org,
	broonie@kernel.org,
	carlos.bilbao.osdev@gmail.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	devicetree@vger.kernel.org,
	ebiederm@xmission.com,
	evan@rivosinc.com,
	hpa@zytor.com,
	jim.shu@sifive.com,
	kees@kernel.org,
	kito.cheng@sifive.com,
	krzk+dt@kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	mingo@redhat.com,
	ni.liqiang@zte.com.cn
Subject: Re: [PATCH v7 00/32] riscv control-flow integrity for usermode
Date: Sun,  8 Dec 2024 23:51:41 +0800
Message-Id: <20241208155141.21611-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDn9z+NwFVnfXBxAA--.54791S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrWruw4kGr1fJrWUuw48Zwb_yoW8WFWfpF
	ZI9as3Jws5AF98Cr97ta18AFWSvws5trsxGr95Jr1S93y5Wry0vF4UtFWrGFy5CryYvF10
	vw4j9348ua4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkgAwUUUUU=
X-Originating-IP: [60.24.211.0]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiJB2v5WdVlodlmwACss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_075324_088425_DD74BE17 
X-CRM114-Status: UNSURE (   9.79  )
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

> How to test this series
> =======================

I recently built a test environment for RISCV control-flow integrity for
usermode using QEMU, referring to the test instructions in the patch.
I found several problems during the test, and I hope you can answer them.
Thank you.

Q1:
The CFI-related macro definition values in
QEMU(branch: qemu-zicfilp_zicfiss_ratified_master_july11) and
Linux(branch: linux-riscv-cfi-vdso_user_cfi_v6.12-rc1) are inconsistent.
For example, the definition value of PR_GET_SHADOW_STACK_STATUS in QEMU
is 71, but the definition value in Linux is 74.

In order to continue the test, I modified the relevant definitions
in the QEMU and GUN source codes with reference to the Linux source code,
so that the cfi-related macro definitions in the QEMU and GUN source codes
are consistent with Linux.

Q2:
When zicfilp=true is added to the QEMU command to enable landing pad,
after cfitests command is executed, a segmentation fault is prompted,
software check exception is raised, and the value of xtval is 2.

According to the comments in the code, when xtval is 2, there are the
following exceptions. 
 * An indirect branch doesn't land on 4 byte aligned PC or `lpad`
 * instruction or `label` value programmed in `lpad` instr doesn't
 * match with value setup in `x7`.

Why do these software check exceptions exist? What should I do to further
troubleshoot or resolve these issues?
The software versions I am using are all the versions mentioned in the
test instructions, and the zicfiss test is in line with expectations. 
Can you help me with the above two questions, especially the second one?
thank you very much.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
