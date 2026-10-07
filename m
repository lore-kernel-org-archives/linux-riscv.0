Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DB0CA5FFF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 04:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FE2kZmBU3G/0RBMn+PdxPBvOOZd9mh2B9/PaWa1/zXc=; b=sXgipbAOirg1xq
	WyR1o8z1/0glX3l+JqA48tU20xIM5pah1lkbLZmYE/1EKQWPRHfb29trfv2KY+TuNTX1/LjOUe/Pz
	xLkKojQAVJpKXRcmu7XaTmZX9W2MkK5NDHSzh6B7FMC3nDz/vPhhlgB5IOWr5+xh2j6rzEPWPJvaO
	TuF9ycfEEAqubxEIe9vdNrBFT581L9RbR41ZuvIw9oCFaIm+8N0wogW4MpYHCPAiwhIv422OHwA7U
	DQL3OOnysLVT/HgkVft3ilHCbqeOcshYTkyK5XtFXJEuPqMor1ChrZbhMCy3aN2loJRjUd4okesy9
	kpiRAU5IdWnQlyJJkhfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEJdt-00000001hgr-1uHw;
	Wed, 07 Oct 2026 04:52:37 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEJdr-00000001hgL-2DM2
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 04:52:36 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-34c89609923so776211eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 21:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791348754; x=1791953554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmgrLpFXhhaFsHuQHBPVlR2txu1HA+6BnxOMmWzDn74=;
        b=QL0Xc5oLcGpgEJGwE3zKvrgeVq6wQ7/06TThBJHE0g8TgucVpLaTbgA8FK7TaFWX00
         DIhLzBlE0aNhzQK3EU+CTwunSFEnjNHNbpZmI5bT8BRRlS3XZS9vONu1xzy5NtCWdunn
         UBEVlnUdLJNbsLrk7xuDHmIWsq7aspO/Ywxl4eIEFoWFHcRZFuGT2r0vVsPJK38ZjPQ3
         9TByslkfgeii0y7ftgFhFdCp6WtlmUlWLcitcTh4qUl4izyBBX80FxlAjRYbTrSGzDm2
         OQa9QIw5E/PKHDf9unuhKvEGxy5+Tqys3/6aO0ZYY3YD7DloLLn7nqphkMYMHMZn+Ehd
         deYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791348754; x=1791953554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmgrLpFXhhaFsHuQHBPVlR2txu1HA+6BnxOMmWzDn74=;
        b=RE6SzMm8UOCbqPF8ww1OD6WVqOQymgFRjQCsfrETeWF1aG7bifzSONME9FDrzZGIwp
         CdM1BOWUKLYq6fCZarqkWdt6EFwZhL+TxRhPOaQbG+LF7zRAljds0FZhlWS5GH/Rc5hI
         sjnQEPByxtn6N5mr0GwpwNADbxyHQrE93O5cMrjRT+NKX814sl1gcpmL/eaMk3tyQDpN
         hry7iLtwGuvJhOCDNqHvz4JCAJTxrVD/IykoK+/fbr9m3tlM8HwbbHn6IHJGVBBPOIOg
         SN10aWP7joMXhQHEj88arJs5as0HjSa81JWSPWSi25Bo98iuEJwHeT2J5P8/JczApABM
         jZDQ==
X-Gm-Message-State: AFq9FYL0tvx5BPj6zT+WaLbmZOrUyCkqkwIb/hlZe9aLORpYR/Orq/Ur
	x6louaANcfMMCLevxE8JmyZ2idTUfaEOLcCHHeqh8EWJ3usHlCjMgpD+9lIwgSm77AaaiqXzHT5
	l9Qn0T2tvm+30R9AH9QJZ+ouwD7BT6VWm5EzSLuo0pFX14jXEK8y/LL1yDKX91emciNIWtEL6sm
	Tj5MmmYxEuCPfAU/jwT332jsduRbWA1WGSnjaeCOodU42mKayDwZx/hiWq
X-Gm-Gg: AYBFou1aZ1m6H9MAIEeR1T2YdsffuJn4GSqmP5+J2zRI+ZeJcJ3FW78nJ5So8ucwwZY
	+ZzcgpdbGRhn8Iu16dypzcehXIY0isQl1tfRtuSDNwWbmJp5/9R5/8/iQdNcCdCigd39Kz+vRaQ
	EDo20Bwunfit3V/GNMKL0vomznbF3BWIWMtQJuU7aO66BWKdIJ3KMbrH0UZNizxOdR/wmBqqBED
	nwrMUGpYZXq0zMkG2HBygrbX/sBAfiDQ7T602/wIfhrjpgbHSLAjT8Thy190DGdvKU3AQNgmP5O
	Z3bHPkH0cWrlK4J3L38Cf7GBHHlGkGDsCIsmjSwQoveyEqltnbGEXOfL/p3OXZGTta70DikUTgZ
	HVHD8kPhLZjKVJD76xE3suoEKyUWrYSLsYjW2Y5xmgG0HaK9mMHxaQ/kk+L5kxM4omT5dyyCOh6
	IE6YG08Z2XouhmvsXpqf1IuaKNi/8ZZQADCX85ClGPKoFYVUc3Xy4D4hpdBuuOz7DYY/V1oZygX
	cnnXBeD1x5sow==
X-Received: by 2002:a05:7301:488e:b0:34b:529d:6263 with SMTP id 5a478bee46e88-3515de84167mr1045115eec.33.1791348753785;
        Tue, 06 Oct 2026 21:52:33 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6076sm4187598eec.9.2026.10.06.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 21:52:33 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	wangruikang@iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH 1/1] riscv: fix NR_CPUS range leaking 64-bit default onto 32-bit builds
Date: Tue,  6 Oct 2026 21:52:29 -0700
Message-ID: <20261007045229.36114-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_215235_591318_08A4E311 
X-CRM114-Status: GOOD (  10.86  )
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

rv32_defconfig is built in two stages:

- the generic (64-bit-oriented) "defconfig" target runs first
  and resolves a concrete NR_CPUS value using the 64BIT default.
- then 32-bit.config is merged on top via merge_config.sh,
  which does not touch NR_CPUS.

The final "make olddefconfig" pass sees NR_CPUS=256 is still within
the "2 512" range therefore never recalculates it against the 32BIT
default of 32, silently keeping the leaked 64-bit-stage value.

The NR_CPUS-scaled regions (percpu areas, ...etc) of the resulting
CONFIG_NR_CPUS=256 on a 32-bit build bloats and does not fit in the
percpu/stack layout for rv32 and hangs early boot on QEMU's virt machine.

Fix this by explicitly specify the range for 32/64 and SBI_V01/!SBI_V01.

Fixes: 0fa749771993 ("riscv: Raise default NR_CPUS for 64BIT to 256")
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 arch/riscv/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455..5874ca30f4f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -453,9 +453,10 @@ config SMP
 config NR_CPUS
 	int "Maximum number of CPUs (2-512)"
 	depends on SMP
-	range 2 512 if !RISCV_SBI_V01
-	range 2 32 if RISCV_SBI_V01 && 32BIT
+	range 2 512 if !RISCV_SBI_V01 && 64BIT
+	range 2 128 if !RISCV_SBI_V01 && 32BIT
 	range 2 64 if RISCV_SBI_V01 && 64BIT
+	range 2 32 if RISCV_SBI_V01 && 32BIT
 	default "32" if 32BIT
 	default "64" if RISCV_SBI_V01 && 64BIT
 	default "256" if !RISCV_SBI_V01 && 64BIT
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
