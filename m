Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D6606A326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 04:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dfw9LMq3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFDNdAX0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=moAG908/C3qxiUuhk+K8k7jcseDTK8xR7Do9z+mn9Y0=; b=Dfw9LMq3A7rgF5jKBuZ0QxPj4f
	NONO4whT9M78Sr7m85GKfz1daELBChLCC63BqTyXWGTF6ye0cnUTcZK4MkSfgfG+97NUxbNxzpvQh
	+vd7rAu00LvxyS6zqXs3WwHdwbevQY8J4XGhTeo6vmMeTtc4rORckNvCKtms7iuFgfjPxVIgEqFVC
	6I2Pr2ru/9Ew4t32rfasZUzhuTiMFcbXs2ngX2SUJbNbYpeuDQEYxy1xsj1eJL7U/W0tx7znCVTv1
	UFc8m+wGp7HwaYxg9ozBtxrLsRELfTFNoIlHVf7s6ErYzA3howKAoeJtR5UBeUMQKS7yMPUgiwB1d
	HyVVJiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjPi-0000000FV5G-2Uww;
	Mon, 02 Nov 2026 04:12:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjPg-0000000FV4t-0waB
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 04:12:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e10a70540so1359986f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 01 Nov 2026 20:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592770; x=1794197570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXExBpm+HM1+xWx5ZxB/Ym/VbcYfOrarlbhjIM0wW7c=;
        b=kFDNdAX0pymfBdIBBfkJK3mzrStSz27ib0RSIcD9qITbDRk7LTGKoo8N9JbSy86fli
         sDUU59txub7haoLGkUUIGwFMcR2xFz07h3aR1Z2GvLpN+lbxQnyv2DBeW2ag2W3DT0VS
         Hwusbh70ZlkIo26xbUl+1/nCiD2On6Hyy5wmlDOAne+d+7w+jq5mK6ms3mfGyYc00Nw9
         /L39Pup57Zvco733kilAR3p0hoLGToq59Go7nLtNo/urEyz3aH1OnGDXsTo1/2J/6XOQ
         BpLTMPhwW0EC6mPaG4NpV+ZzB98u+YKvA+L13A2b0TxVOoolhvfArKVr0f+Vba0xRvLC
         1FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592770; x=1794197570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXExBpm+HM1+xWx5ZxB/Ym/VbcYfOrarlbhjIM0wW7c=;
        b=0O/kIleaTUN1+cmVKWIt8kyiGs+p85Cvbu61KSRYP++h1gt9igR22VQgDTY8zOmULM
         K9+PyEpP61EyDk3v9W4A9r2K8y02Vz78NWJRqNuUvtgqTNbutjySGJmYiHRqpeiy1sXS
         rpUWmJ/n95VcRhdcnJBFmDomQo5HTtFlz6IFooVjGnEZRhM7P0FaICF1FJV8GopH/eP8
         C4sKjJuFp/O/ceVEOaKnM+g/xan/nTjR53vKND26zSgKdgvuT/7lwrYgJ/gUzqoFFuUF
         hLpXUYrfXqq2wRIqapr7PBoUHzVOy5+lFGJuL2EQgCghjbRmSTkwrp5z+URGmfEh7fO/
         IZQA==
X-Forwarded-Encrypted: i=1; AKwUvBwcR+74rhl3jT5vCt26Wf39dOAlj5LNo6VEgP8GzH1mkxtFNEanX9Ir0Zkz5TGgVjz2LjXdqXUzz2q+HQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLfNY4pdyyL6kWatIq4zIrbvE1V0xHFC4dfvHgbCjOWp+T1w3mH
	fjM5l1hU3XpS6nQXZX68/Mki0S8n5zAkiMljBDgx6vHsrF+5rawetOXe
X-Gm-Gg: AYBFou2H8HmUeAxVHjIDenvLe3gGxhG4ZJpHZRvUvhdT6E/NJrAdc40EmAj8+m9llgv
	5fLwVxOIXZ9yUwn99W5/zEDyva9NzknaebBx55Lcz1ibAB2N4u+Pa2dELIYBHPqx2bvudL8+I4c
	S3vitUalfiIoe5EKUfzYR0Q5e3c2nF27zo0i5bsKrOkZwGYT98+vgIQWQCDr7Df1g4Epdxcqgzh
	2+z9n4tYX77rTzk3P3OGbFqY1RjylDGaffxVZn15JB4onrCaWA4zRErR6lSdPM+DwQECetzefPW
	rfQl4Fo+iYv/ZWs6Ic8p0bq3aMv3sdF5mS3pLeeu23xl4OtvcBrHEtCCcZOHwWqyU/WYzuOgCtO
	5Xb19HXkZ7ce9KtErImx09LbAR4IDU7DXSUen8sPbLJhda6ii0k/5xoxsuSJfgwksiUi1Si4/F8
	R1NbZCE+1GpUgWnXxhG0MfEc15rEIhgCHJ+uyBv9en6Ny28zMjeRzbeCWSkNfkNVZLtKH4mAjbN
	b4F9HqKWzbsUwF4iNNg5uZrFYA2wyTuC2JSRjvAex/sUP50S2UTMTAp+lh2YwGnr5RgfDCZ5r/f
	B9rbrGOOm3KpeITIu+cmDl9u0Q/w5/wfpfO+gYGdC7ppMjwaHVJNUWmI82Nb+MtK9VgrW0ObPtK
	u9W0eGY6gdsqKpmexQbmqx+xGrfUNGeQKHb7j+Ihlzqo7ltttOKJ3u5g3ci5//7t30PCpuGn5Jj
	1BjoZNUaKOFxf7DZITer/DwaAEKIgIGVo=
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr210442005e9.22.1793592769795;
        Sun, 01 Nov 2026 20:12:49 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9d0-ff01-e89e-fc6e-08de-7401.310.pool.telefonica.de. [2a02:3100:a9d0:ff01:e89e:fc6e:8de:7401])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm179710785e9.2.2026.11.01.20.12.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 20:12:49 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Schwab <schwab@suse.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nam Cao <namcao@linutronix.de>,
	Zishun Yi <vulab@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: traps: Fix si_addr in misaligned access SIGBUS
Date: Mon,  2 Nov 2026 05:12:37 +0100
Message-Id: <20261102041237.80873-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_201252_283839_BBDA7961 
X-CRM114-Status: GOOD (  12.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

do_trap_misaligned() sends SIGBUS with BUS_ADRALN when the kernel does
not complete a misaligned access from user space, for example with
PR_UNALIGN_SIGBUS. It passes regs->epc as the fault address, so si_addr
holds the program counter, or 0 after a fault during emulation, instead
of the address of the access. POSIX defines si_addr for SIGBUS as the
address of the faulting memory reference.

Pass regs->badaddr instead.

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on QEMU's virt machine (d73149283205, -cpu rv64,zicclsm=false) with
OpenSBI v1.8.1. The kernels are abf8c33470f7, built with clang 22 from
defconfig plus NONPORTABLE and RISCV_SBI_FWFT_DELEGATE_MISALIGNED. Not
tested on real hardware.

The test takes SIGBUS for lw and sw crossing into an unmapped page, lw with
PR_UNALIGN_SIGBUS, and amoswap.w. With this patch, si_addr is the misaligned
address in all four. Before it, si_addr is 0 for the first two and the PC
for the others.

The first two still report PC 0 in the ucontext. That separate bug is fixed
by Zishun Yi's pending patch:
https://lore.kernel.org/r/20260511124101.3202094-1-vulab@iscas.ac.cn/

 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda0..0af1cdb352 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -225,7 +225,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 	}
 
 	if (misaligned_handler[type].handler(regs))
-		do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
+		do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->badaddr,
 			      misaligned_handler[type].type_str);
 
 	if (user_mode(regs)) {

base-commit: abf8c33470f78e2226ee3dcdc69004660020ab47
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
