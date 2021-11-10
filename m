Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D13DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 16:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBC261205
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 16:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BBC261205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1aqVmyhBOSwlhAjwcyc3SNkcRbBk6sqa905juQ2kFtA=; b=hbElERNrdn9sks
	uKPHqyDFevptt1uOG6JspRklImMMiR8ADwx1VmEL+qHmgx4ULJ/09WztCVUZc0A9v8DLx5/MajlLj
	FP4/2c3ME3BCF1PVaMMjLC33iHVtNmJM5VPOMxFwPsiSonK2y6n25ZyuB6U/NEX96g1Rs8u7OmqQt
	2GGyBLlE036OvaLz/35wOD3QUq9iitFJ/gVYWhjMqRfkdMvvSUVFJ4fjUmQIuFgaRZpx0gxGB12ic
	Q0e5jNgHAd0S0QQdwb8f/bvaFPSTI1Ssor6cRBxu1PYyeUUqi3AaWiLjcBPCXy9TgYBFO1DTtUR+S
	DGWhQ484rMO3SZzBEGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkqNn-005oq2-KU; Wed, 10 Nov 2021 16:23:31 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkqNj-005ooz-Va
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 16:23:29 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9dc9:efd5:4c6f:baa9])
 by laurent.telenet-ops.be with bizsmtp
 id GgPK2600C1LAWtA01gPKaH; Wed, 10 Nov 2021 17:23:20 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mkqNb-00BUyT-26; Wed, 10 Nov 2021 17:23:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mkqNa-007g1r-LI; Wed, 10 Nov 2021 17:23:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] of: Shrink struct of_device_id
Date: Wed, 10 Nov 2021 17:23:17 +0100
Message-Id: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_082328_183436_E355DF72 
X-CRM114-Status: GOOD (  16.68  )
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

Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
large.  It contains fixed-size strings for a name, a type, and a
compatible value, but the first two are barely used.
OF device ID tables contain multiple entries, plus an empty sentinel
entry.

Statistics for my current kernel source tree:
  - 4487 tables with 16836 entries (3367200 bytes)
  - 176 names (average 6.7 max 23 chars)
  - 66 types (average 5.1 max 21 chars)
  - 12192 compatible values (average 18.0 max 45 chars)
Taking into account the minimum needed size to store the strings, only
6.9% of the allocated space is used...

Reduce kernel size by reducing the sizes of the fixed strings by one
half.

This reduces the size of an ARM multi_v7_defconfig kernel by ca. 400
KiB.  For a typical kernel supporting a single board, you can expect to
save 50-100 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  - While gcc complains if the non-NUL characters in a string do not fit
    in the available space, it does not complain if there is no space to
    store the string's NUL-terminator.  However, that should be caught
    during testing, as the affected entry won't ever match.  The kernel
    won't crash, as such strings will still be terminated by the
    sentinel in the table.

  - We could save even more by converting the strings from fixed-size
    arrays to pointers, at the expense of making it harder to mark
    entries __init.  Given most drivers support binding and unbinding
    and thus cannot use __init for of_device_id tables, perhaps that's
    the way to go?

Thanks for your comments!
---
 include/linux/mod_devicetable.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b219920..2bb2558d52d30d2b 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -266,9 +266,9 @@ struct sdw_device_id {
  * Struct used for matching a device
  */
 struct of_device_id {
-	char	name[32];
-	char	type[32];
-	char	compatible[128];
+	char	name[24];
+	char	type[24];
+	char	compatible[48];
 	const void *data;
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
