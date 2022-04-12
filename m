Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703FBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S/hKGvpDf88V0j/w2DUETLm0SIicGduXk9A9WX5C5kw=; b=q0kGrXQo06oaTl
	BG8qKJSeQ6O42gNyeTEfWXtfnZvSN7VLo/E+QZ5+7XD6xILO1ttWg5WIKgHRMRWbyjty5ZH8ra9Iy
	gbq++gnsojedzIimuDcE9P7Zyx6bjiHwkgZuJAPB2LZkqi+kjRn5gl+UjrsOF6w6Rzrs21Zrm4z+g
	vLRNlw1plRjDQYJ6zmji5LMp62HarhnxH3CYRnpa56WWC4eVNVQIvy9u8vb0p7+1KPSeG0jo1iAvl
	RLinBxuwAYtxu8mpjn7VGoT3Xfmey85gyPjNvVvBnagh5HoaWUnSqwMVVFpicktzXICrGwx27DQCw
	IoVbUvL88OgUON6Gtdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDNJ-00D8eY-Sc; Tue, 12 Apr 2022 10:03:53 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDNF-00D8bB-1R
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 10:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649757828; x=1681293828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3TQDdDKv+/2Nw49GG6zX+ckjKkTqdRxGeiL8NxypWVM=;
 b=kIP1UzAEZMZp/s0PwwQYyqZr7d/8HOFtFoLeLhTkNpwP8v4ClcSiIKg+
 1BO+DdDlGQYAC7gLE8Ddy1mfP2+DH5RQRzJdGhqz3mkhs/rxYQ8h1Z2Ne
 gra5fTkTZOSwuGXwNJ5oYE//admliZg15kHj+uwZQaVA8Cqw1mX4qlBio
 OleGd0o7h+J1b4BfVIfCHgxwyGVwrp6WnpG7hFVXTTJItdmTqxKDmwDmO
 6U42+1jGuQBN3fUgsxbvMda+/UpgtG6CpoGnzEdPCREi/8Nie/GEruIaX
 D3UXwlBB+EtK9GU5RPKlNeO3lpNmF2/CaR5qfis2dxl4qTTU1+yyvgz77 g==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643644800"; d="scan'208";a="301896808"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2022 18:03:45 +0800
IronPort-SDR: YcStBDmWzYk+gmQBCH/FibK7UhSwJVBX/2SbY5Cnbb5sqFHMVy3D45NbSVZP52Uu/47XJI5l7V
 D8IodNWfKq3Cl4xakvznTnhkn5+0QqVJ0wXzOQ+4LIVEqZrJExgwiUbLvJmz5i0XGT2w6oMYYK
 L+eci8vylqy7Cy7/4AmqSN0cCpZql3xXs3retVPRW+vOqJdlrUJxuyw16y8HQneqkXTCWV2Nzg
 9utqrh/6hu3G78V3DoLNiTrHN+uuXWydqU2SuLnAkEsOgYbI4P6D5JIWdm7LEYOfMkDXiPjboT
 l8DeW+TVHOqi05Juw7YAL7qE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2022 02:35:00 -0700
IronPort-SDR: Uo3VSS959+vgVAzuuoPugaw2AGcOb5AzVwNMZ6muqhLfY+2hmyMI0q/omZMZn72OHgau0Abq42
 QGIeU8/fIlPRG2lvaElIUsM2eZLcztSzJc1YsAxPIgjTxRuXXPwFQvY/Du7B3QqTSAk7g2hP2P
 LK5yMeoMrjP6oRySFuvh5X2b3C2WMKjhIZ6syvOTjxoTKXi5Kq7QoUwIbe7HP4cHnHegneiKXe
 Te2G2/RzHFUJoWgoIloujG4dYTCNolMO3oOb4cb5fkgNS5plzVPV6nWoCgIKl6rWHX1AqnMyYx
 Zvg=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.cphwdc) ([10.225.164.111])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Apr 2022 03:03:42 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] binfmt_flat: do not stop relocating GOT entries prematurely
Date: Tue, 12 Apr 2022 12:03:38 +0200
Message-Id: <20220412100338.437308-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_030349_203050_C30A9E18 
X-CRM114-Status: GOOD (  17.66  )
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

bFLT binaries are usually created using elf2flt.

The linker script used by elf2flt has defined the .data section like the
following for the last 19 years:

.data : {
	_sdata = . ;
	__data_start = . ;
	data_start = . ;
	*(.got.plt)
	*(.got)
	FILL(0) ;
	. = ALIGN(0x20) ;
	LONG(-1)
	. = ALIGN(0x20) ;
	...
}

It places the .got.plt input section before the .got input section.
The same is true for the default linker script (ld --verbose) on most
architectures except x86/x86-64.

The binfmt_flat loader should relocate all GOT entries until it encounters
a -1 (the LONG(-1) in the linker script).

The problem is that the .got.plt input section starts with a GOTPLT header
that has the first word (two u32 entries for 64-bit archs) set to -1.
See e.g. the binutils implementation for architectures [1] [2] [3] [4].

This causes the binfmt_flat loader to stop relocating GOT entries
prematurely and thus causes the application to crash when running.

Fix this by ignoring -1 in the first two u32 entries in the .data section.

A -1 will only be ignored for the first two entries for bFLT binaries with
FLAT_FLAG_GOTPIC set, which is unconditionally set by elf2flt if the
supplied ELF binary had the symbol _GLOBAL_OFFSET_TABLE_ defined, therefore
ELF binaries without a .got input section should remain unaffected.

Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfxx-tilegx.c;hb=binutils-2_38#l4023
[3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elf32-tilepro.c;hb=binutils-2_38#l3633
[4] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-loongarch.c;hb=binutils-2_38#l2978

Cc: <stable@vger.kernel.org>
Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
RISC-V elf2flt patches are still not merged, they can be found here:
https://github.com/floatious/elf2flt/tree/riscv

buildroot branch for k210 nommu (including this patch and elf2flt patches):
https://github.com/floatious/buildroot/tree/k210-v14

 fs/binfmt_flat.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 626898150011..b80009e6392e 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -793,8 +793,17 @@ static int load_flat_file(struct linux_binprm *bprm,
 			u32 addr, rp_val;
 			if (get_user(rp_val, rp))
 				return -EFAULT;
-			if (rp_val == 0xffffffff)
+			/*
+			 * The first word in the GOTPLT header is -1 on certain
+			 * architechtures. (On 64-bit, that is two u32 entries.)
+			 * Ignore these entries, so that we stop relocating GOT
+			 * entries first when we encounter the -1 after the GOT.
+			 */
+			if (rp_val == 0xffffffff) {
+				if (rp - (u32 __user *)datapos < 2)
+					continue;
 				break;
+			}
 			if (rp_val) {
 				addr = calc_reloc(rp_val, libinfo, id, 0);
 				if (addr == RELOC_FAILED) {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
