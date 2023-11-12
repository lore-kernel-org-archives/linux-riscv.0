Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399D7C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPiQ7XxYlU1NCiWdKE04mhHl2NmEmEpRNF6CMGkEDCk=; b=Wn+4seEZXwlPDc
	sIBXFC3Hpez3mq6Xkvkz3JjP+PlXoUg7FRBTAohrd9RFtLAWDNiPeRtfnaPlx7fifIvMZvcaVrJV9
	aaPWThG467aTA5l39jxD/5NcS24Vk/aLz42qNCdrSwlEK9VI6ndJAuVQLrKgouNBnYObpMED3tZzG
	6w+nyNtJEz2zWpnZS9+YpzjP1XBUrFjegYxtJDMF1UWlj/R58XcyaeqPVpBAM7EAxZ9nHZtXyMZ28
	AGBcKlvB2KOPGJLKfAQi2ZcXnF4f8B4n/fZvCpd9XpIM8Yq7vcHHdMwyAMxMay8oN98/vlaEUP2sG
	VSCvGkIsJX8o/xOIO/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lo-00Bjb0-1i;
	Sun, 12 Nov 2023 06:16:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23ll-00BjZ6-1z
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D957360C2E;
	Sun, 12 Nov 2023 06:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0415FC433CC;
	Sun, 12 Nov 2023 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769788;
	bh=x2yNl81rtMLNR83PEs3HCmEpsQ4/7rJymYTh7H6aEEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EB1Tkw1ZePpU08PhgrQFyDzSgHHkUjmbXxR/MUfG9bEVV+Iqk7O9UI0yiAixM8Jim
	 ijdKADfSY75NGC29rcYC1mdguX3mcb7TwbXCv5XJbBQy0Szp1r0s50Ul50mA7JJS0O
	 nLfC/bApQGYZcDd7S8pGBd2WNctZpvQ2G4sr3FE+v+cbbKJcQ154u+YzChQk2HyUZO
	 QMl52JlYFGIXKd1n7CaPK5ahUUZ3kDSEhDiIoMq5PhRfUHho2veayBgIf8qrZBZYJS
	 dEMpUJibV+TeKlPUnHb0iDewAmVuzxXifFf3b86rqSS9CRpgB19LbEZjFi810Jl04U
	 Ds4QiYJ1/SScw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 10/38] riscv: u64ilp32: Remove the restriction of UXL=32
Date: Sun, 12 Nov 2023 01:14:46 -0500
Message-Id: <20231112061514.2306187-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221629_706468_1D69C700 
X-CRM114-Status: UNSURE (   9.27  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The u64ilp32 needn't hardware support UXL=32, so remove the
restriction when EF_RISCV_64ILP32 is detected.

Reported-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e32d737e039f..93057ca2e2a7 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -88,7 +88,7 @@ static bool compat_mode_supported __read_mostly;
 
 bool compat_elf_check_arch(Elf32_Ehdr *hdr)
 {
-	return compat_mode_supported &&
+	return (compat_mode_supported || (hdr->e_flags & EF_RISCV_64ILP32)) &&
 	       hdr->e_machine == EM_RISCV &&
 	       hdr->e_ident[EI_CLASS] == ELFCLASS32;
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
