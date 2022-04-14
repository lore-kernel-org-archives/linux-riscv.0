Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVvYaevsVmYocdenwEfNJvfkob5ybWChSUAhy/+PI5c=; b=SkeDjsYNCjKvKV
	OVKXFzKqict+nwzH2NtTVhh8XOPaDDHMhhSgk5Y0w2RBqK3/+0L0YqirnD2nCtKVJfDyTKLHB0KNS
	BnwSwRhyPIifxW7Uhud1cxuiR/MbORgTBGLAJx2+1UQ02Kdo8TZj/QYnkocTg8oHmJ3Ni2s5w3FZx
	n/aVYStVjuNSSF7y6exl7vIYg7Yf0DcaFVJrhsq2UJeA8zr66oi0NSxGTd4xJqBk5KzgwJk912/nb
	kptLmQWHwjQNhUfiP/vLlxITKJN90ldCn7FP0Xl6oU0T1XogJVw67RSnMVN3TpLw+510sFv1mVg7X
	g5/WFQf3Y/CM7kztkSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevWO-004nkH-FK; Thu, 14 Apr 2022 09:12:12 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevUk-004mwn-Ig
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 09:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649927430; x=1681463430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n/RjFhCoHmyvQPqkferP8/GTynI8Zg21tVioUs2fo6s=;
 b=eZ+rZL+8wRzkRxl87d8mLLXoImxI+Q0+INnYB4o+G90XL3QGXuItFMG5
 K2PY1xJDI4FZksqWYIjnd0a7NEyoYFSdhJFPS0fMbV08EoKbTE5vdR/Zz
 jZoHOA43a6Rmdafym1RXdmM5U0WXywhQj123X8MeYFtTAkOWMQAHqB6in
 JhzYLAmzhV87HzmqTo3ESYRRciHRBuwj2Wv7FEftq0Wx9x5Yo+im8DvXP
 xMZtUU9YvAIwPJw7ko09Mw2BvU4vAvlMcSqKUalGuYenqJ3qb/JkOBwxy
 HzWuqATfzqZKnq8ZSjzjMRNJFAORz7YxyBdMiVjXcvfcpUn1EFdXURbxT g==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643644800"; d="scan'208";a="202755704"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2022 17:10:26 +0800
IronPort-SDR: pUodhTA6Sj4JgtjRFG+Hh47R1j0yI80IVFNcfhwWVwDSgalDMJfnkIBj29sPFIBMlura7l0ZJh
 TNsf4kfOHr/GOwPYUwUipczEJEq1Ym/GvIChCcggz/r1Gj8DIcOfpkpnocAoNUNop237Av7oQF
 C7klYkeVrRtDA0rpzF7IlC+ocm6IRLA+ciJR+crXYvTvyyLyFLUSM74GTBD+mRFm1PN+7ydstL
 0kyEBPCIrEA/GVBp0RVZ0JRnkj9d2gkq+y6f+F0e3WT42YGIbzj9CCvV87+pFk5WlrYHiM05SC
 VO1tyD/6vUZHaQsp3VemlX5s
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 01:40:52 -0700
IronPort-SDR: eECsn3y6XfvMEdB/CiQdQvSLz7JwPK0CMSCKeVLXCutpO/SyK1L6/AerYOS6fivGy+KWqq95WU
 KZbFYZgCW5kS7TYj5djeu2HI6ksPym8IbS8jLa9NQgjmPv9e38kpV1p2hXGKfrhpYHwUnZUmOb
 zRkNgzVAZDugj7lxxDR5RYZ3rJiuiBHVwnn0aS23M5CZbrJUeexv3kOpuX8Ucy+4FH3oLGZ0Ow
 Ctrb/JSBPZKJQNaQvbmnWzhGa2K0Zbfwm+K3S1Az/YVRNg3tciL2jDOMDG9mwyZrA+1qRhhUTO
 5/E=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.18])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Apr 2022 02:10:23 -0700
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
Subject: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Date: Thu, 14 Apr 2022 11:10:18 +0200
Message-Id: <20220414091018.896737-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_021030_732066_E8B8ACEB 
X-CRM114-Status: GOOD (  18.09  )
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
(which has size 16 bytes on elf64-riscv and 8 bytes on elf32-riscv), where
the first word is set to -1. See the binutils implementation for riscv [1].

This causes the binfmt_flat loader to stop relocating GOT entries
prematurely and thus causes the application to crash when running.

Fix this by skipping the whole GOTPLT header, since the whole GOTPLT header
is reserved for the dynamic linker.

The GOTPLT header will only be skipped for bFLT binaries with flag
FLAT_FLAG_GOTPIC set. This flag is unconditionally set by elf2flt if the
supplied ELF binary has the symbol _GLOBAL_OFFSET_TABLE_ defined.
ELF binaries without a .got input section should thus remain unaffected.

Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275

Cc: <stable@vger.kernel.org>
Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
Changes since v1:
-Incorporated review comments from Eric Biederman.

RISC-V elf2flt patches are still not merged, they can be found here:
https://github.com/floatious/elf2flt/tree/riscv

buildroot branch for k210 nommu (including this patch and elf2flt patches):
https://github.com/floatious/buildroot/tree/k210-v14

 fs/binfmt_flat.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 626898150011..e5e2a03b39c1 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -440,6 +440,30 @@ static void old_reloc(unsigned long rl)
 
 /****************************************************************************/
 
+static inline u32 __user *skip_got_header(u32 __user *rp)
+{
+	if (IS_ENABLED(CONFIG_RISCV)) {
+		/*
+		 * RISC-V has a 16 byte GOT PLT header for elf64-riscv
+		 * and 8 byte GOT PLT header for elf32-riscv.
+		 * Skip the whole GOT PLT header, since it is reserved
+		 * for the dynamic linker (ld.so).
+		 */
+		u32 rp_val0, rp_val1;
+
+		if (get_user(rp_val0, rp))
+			return rp;
+		if (get_user(rp_val1, rp + 1))
+			return rp;
+
+		if (rp_val0 == 0xffffffff && rp_val1 == 0xffffffff)
+			rp += 4;
+		else if (rp_val0 == 0xffffffff)
+			rp += 2;
+	}
+	return rp;
+}
+
 static int load_flat_file(struct linux_binprm *bprm,
 		struct lib_info *libinfo, int id, unsigned long *extra_stack)
 {
@@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * image.
 	 */
 	if (flags & FLAT_FLAG_GOTPIC) {
-		for (rp = (u32 __user *)datapos; ; rp++) {
+		rp = skip_got_header((u32 * __user) datapos);
+		for (; ; rp++) {
 			u32 addr, rp_val;
 			if (get_user(rp_val, rp))
 				return -EFAULT;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
