Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0DDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 06:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GHC0b/rD2eWOkFeuqLFFmBPySrkUmgL1CvMkbMSkjvY=; b=jtUslPhYA3viuO
	8gt1PhdBZjfKDRhCT09R2vY0d9fgRTFJJrbEtHWbkaCS9TgTQQDKxKtFeW3AlpaRJvbkp1e7KgOMD
	vRXjQMkL6KrQuyCi8mfhjmaM27XRSfVcG5nww0/CpdzP8rtCK1hDvbIGJaeiTDeYs19MlYUbHpf2I
	5UwELwGCV0V1SPniHepIZ6+nCuM4RdrhzusnuHtgr7C72UKEjlWE2hK2/aFeVbaMNUrsi9sXn3GNR
	07NXNoM1fxTANgV1VT2FMsn506mfnJalvBotNLs0uLFK9Iq2mBGBYFagsnwrOjsf2HovYNLUyrtfJ
	cOuJftgMRIMy6h4Y+Wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDfNZ-00H0AH-15;
	Thu, 14 Dec 2023 06:39:29 +0000
Received: from smtp3.i.mail.ru ([95.163.41.67])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDfNV-00H09I-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 06:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=MUmKhkzD6Lqw/sRqo4MpOesl2qfmIn0n56k8Dpw1hBc=; t=1702535961; x=1702625961; 
	b=fa1pa4RlezJxqdus50fttAKMLfwKE42NOHx1iox1UE+g13R0T5yeUcipjPmNLbA4WfmimioiT1l
	j6LCa7O5EkJvqWH+1M4ypo+l6YCd8rvHb6iNEzKPP4j7rU/nWj1/SLeK1z+5F2eWcaOzRpmfE3+bY
	DlW/CkuSGROYtZooKMgXvyq5lrJh07OYGnCxExUcoCav2yCjdYldirfiWCMI8Jms0wrcjwwnxiyHx
	yU3o9C/lok1tZdFGC8QIogpLhIARS737Ak6xD9Eu7bch1OGSV7wFtz+toaUR0RUkg9Xo93Hn7P02f
	Ap7tsfQg+dGvsxSQTk9DoaRA3FDa8t6bcy2A==;
Received: by smtp3.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1rDfNN-009naG-1j; Thu, 14 Dec 2023 09:39:18 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	jszhang@kernel.org,
	kernel@esmil.dk,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Amma Lee <lixiaoyun@binary-semi.com>
Subject: [PATCH v5 1/1] riscv: optimize ELF relocation function in riscv
Date: Thu, 14 Dec 2023 09:39:06 +0300
Message-Id: <20231214063906.13612-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Authentication-Results: smtp3.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97533543916A0F71AD286D97BFFE3DA5DB7E67E5414E74A44CD62213F67905E7A9584602B0A0B67F79DAC4348BB0AD5402F1DF3D5CE2C97D047EEACAE9851930B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70A10A23A3B64B805EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378B67D2947F927BCB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89139C7D2CD1B56E1D787F01A6F3A20516F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE764603B5C71CE8B8F9FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC8C7ADC89C2F0B2A5E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BB07C9E286C61B7F975ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5D0916945B0B188A8508253F83738EB50E009ED81786A57A7F87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8C7B53F24711718A4D14E3609780158DF677858F0EEB1B3502793B85883C3870E547CA128C9EF43861E41F2809366B3878243DF2BCB178E1BE19B5793D4E595721BEC6C0C71ED4F84C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojtsCAqtdyux0lKPxRzspCxg==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE339267D7193F259203476718A195E4972498CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_223925_886879_DF033413 
X-CRM114-Status: GOOD (  12.83  )
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

The patch can optimize the running times of insmod command by modify ELF
relocation function.
In the 5.10 and latest kernel, when install the riscv ELF drivers which
contains multiple symbol table items to be relocated, kernel takes a lot
of time to execute the relocation. For example, we install a 3+MB driver
need 180+s.
We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
type items relocation function in the arch\riscv\kernel\module.c and
find that there are two-loops in the function. If we modify the begin
number in the second for-loops iteration, we could save significant time
for installation. We install the same 3+MB driver could just need 2s.

Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v5:
- rebase onto latest linux-next

Changes in v4:
- use 'while' loop instead of 'for' loop to avoid code duplicate
---
 arch/riscv/kernel/module.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index aac019ed63b1..a8a01df1cc17 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -779,6 +779,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf_Sym *sym;
 	void *location;
 	unsigned int i, type;
+	unsigned int j_idx = 0;
 	Elf_Addr v;
 	int res;
 	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
@@ -829,9 +830,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		v = sym->st_value + rel[i].r_addend;
 
 		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
-			unsigned int j;
+			unsigned int j = j_idx;
+			bool found = false;
 
-			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
+			do {
 				unsigned long hi20_loc =
 					sechdrs[sechdrs[relsec].sh_info].sh_addr
 					+ rel[j].r_offset;
@@ -860,16 +862,26 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 					hi20 = (offset + 0x800) & 0xfffff000;
 					lo12 = offset - hi20;
 					v = lo12;
+					found = true;
 
 					break;
 				}
-			}
-			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
+
+				j++;
+				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
+					j = 0;
+
+			} while (j_idx != j);
+
+			if (!found) {
 				pr_err(
 				  "%s: Can not find HI20 relocation information\n",
 				  me->name);
 				return -EINVAL;
 			}
+
+			/* Record the previous j-loop end index */
+			j_idx = j;
 		}
 
 		if (reloc_handlers[type].accumulate_handler)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
