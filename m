Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5B0EDEC50
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwhioxA9wt2gyDK2Z64lJfc79sIKHB/cBB20bO+iVok=; b=kMSfzMz7H7C9yE
	FaZ9J5LYB05HVrxqqF6zXYYLhoYx19v5t/cXduJHEp2FNmfzhRA9/WvVc65LpCzQa57RaRab/XEme
	Kr8jeL4X0VPSd0UxlP4sOvkeeIRwuX+jO55kJmu+MKEYQgajUKXwwa4rZB90YCWs+MpKn1GtmVKUR
	ns+budQVqtDGj/NO5ijuTgZwMBJWFSDpcQggXFAtG2aHuhNHHFv21qSbbNdaaqTm/0gNirhWtOP/t
	VFWgf5ZwoDVIR+V1qQHj9sOerFOACxcQhh8gp/vSMrkSxlTjZGfRyk7nSXAXgLSkDGimsFZh6ASob
	bd8Jrr5Y/Zqe2TnsUH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPYq-005vce-35;
	Wed, 13 Sep 2023 13:05:40 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPYn-005vba-0K
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Ze2HLH0McyPAQtzxrEV2xQ2lpvFWukdJRa2lQ2zD8g8=;
	t=1694610337;x=1694700337; 
	b=j5e27gt7uF7RlGT+E7qNBO+LdoCuqZHoWR+5Xep7FmBWteBmUPzxJnBqOz9/11TW5F7Iv/SomY8gZpEA7WQ2pjyrlaSP9MeU3cAnWv7gI6ZFyPkBGBn1G2oznjcCK7x5DlQmpQ5TlGxKPBGoX7QdfhWBtRhy4nD5vfzDqaLZcZWc69x9q6Zbjvp/5tT7gRgjGjoWB+bWGVAzigqNcGEWFmTodZR+JEkSDO3jiK46/f+Egs2vjYyh00p9Rsuc7kRDZNYZ5XtMh2Ow5IWfcHXLDsKa3k78QXRuMYSxPitm+MvigGvygxfWGYn14TJmD+frTQZq4NCInHX1kt6/2K6aOg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1qgPYg-0004Cg-1M; Wed, 13 Sep 2023 16:05:30 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-riscv@lists.infradead.org
Cc: bigunclemax@gmail.com,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Amma Lee <lixiaoyun@binary-semi.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] riscv: optimize ELF relocation function in riscv
Date: Wed, 13 Sep 2023 16:05:00 +0300
Message-Id: <20230913130501.287250-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD99D78F05E8BF27CBF9A71B2B0462BB11C7FF8B24A7F846C90CD62213F67905E7AEB44CC49BA0AD1A148ACA0D27BB484D13064A4F6BB014158C7997A56A7FEE5D2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79145AB6E9E75F07EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F1FEB73A813C0D3B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A172BA9220CBCB66ECDBDFEB62D220106F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE764603B5C71CE8B8F9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FE5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BB37B5D51F58B3735A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5DBBF4889FAC29140EE6C9CAC128E017D39C64B3C927172EAF87CCE6106E1FC07E67D4AC08A07B9B0A816C540FC8EEC309C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB7389970A08FF33031E888EDC541B151029ADF5AFE66CA857F64BE21F1C5D82A6F890FCD3CEE011BC4B8F2E8CFB8F571CFE287C1F091E157888B94C7A16045B6A866A4CE178307D84C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojoMTWofjSWSTVKYnPE1xbPQ==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B9097C609C9355DA084D41582C6E7A30C98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_060537_661247_D06EAC75 
X-CRM114-Status: GOOD (  14.00  )
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
---
Changes in v4:
- use 'while' loop instead of 'for' loop to avoid code duplicate
---
 arch/riscv/kernel/module.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..8c9b644ebfdb 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -346,6 +346,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf_Sym *sym;
 	u32 *location;
 	unsigned int i, type;
+	unsigned int j_idx = 0;
 	Elf_Addr v;
 	int res;
 
@@ -384,9 +385,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
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
@@ -415,16 +417,26 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
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
 
 		res = handler(me, location, v);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
