Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91154606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Llwd7nU;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=WXXz5zz+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2xN8wEJiNRvvNxLnifQFC57aJuHB+oYnFzQsWABH7GY=; b=1Llwd7nU8lS+a5H738lMZ1kQAk
	uQ8vL3JtNfeDypIuKXT7hiG1Gn92KB9pUr976rQrs3dEKBoDT6DWoXReO2M/Pk2fq7kKaeafiaJ+H
	9YFjUrZg0bAkvVKoSa2ucBRkWhF2zVG2RSqnWYv/3VmPcG7aivehKc8YferjK5xi/YxbL+0pxi78J
	b0ipF7xKzNGdfz4UQ7Igfvfrd4fvN8+lbTTLfTMcpmr/BCl/Wbs4SJjjNkcRkAZrtm9IXEW6b/teg
	nYOOg9DOaeMm4k71E73P0a1XN+BqVCJeMr/s77LtdWtah2KEXgRyC0NIf11gYfH0+MENJWCikBZRm
	SKgv5N6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5mB-00000006NR5-1PiA;
	Wed, 11 Nov 2026 10:41:59 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5m7-00000006NQN-46bx
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 10:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794393716; x=1825929716;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=HdyES5zrAsYi4tYrCkIcc3IYqeJvqK5DsTIlkytKTFk=;
  b=WXXz5zz+M6+sVCnF5RzuPO17ri+xK+gLd5zku7utQjHWSaKkn+xNn+Hk
   SsQQ1rC/VpfcbpaeJz7nRoGbohsyYoFqgzvk3h40kN3/BLozYI2Hgiylz
   juzD9mTBCY6rpcpmztVXN+X8mOL0xs5caESB2yU0PhQZCWttm8EdVy4eP
   tSThg3dKZ/uwRvApoaC3y93dU+2h6AoM1CLiXditGw9MA32MwK/Z7bwbm
   1LUez1HDaAeuQJO1rTFpQ0SJzzEEA33vnSoInsvY5RF6Z8DeatznEbd6E
   u416Jm4rw2wFbTA2ygSLAppNXVmuLvq0b/tLVuElQJj2N3w2Ga9ldwL45
   Q==;
X-CSE-ConnectionGUID: qyztj/1oRn+Z2cPIaYy+6w==
X-CSE-MsgGUID: sxi9dXBDRUy/qsGP4NTwTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 12:41:54 +0200
X-CSE-ConnectionGUID: AxvzWaxoRmaNNXEHERfO0w==
X-CSE-MsgGUID: A2JhisewSzC9uSjKboONUA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 11 Nov 2026 12:49:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 11 Nov 2026 12:41:52 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 11 Nov 2026 12:41:21 +0200
Subject: [PATCH] riscv: unaligned: fix __setup handlers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
X-B4-Tracking: v=1; b=H4sIAFBG9GoC/yWM0QqDMBAEf0XuuQcxUKn9FemDTTZ6IqnkqhTEf
 +/Z7tvAzuykKAKle7VTwSYqr2xQXyoKY58HsERj8s43tY2TfLiIho3X3M8yZESGj+nmrq6FS2T
 mUmC3X7V7/FnX54TwPlN0HF9abA9idwAAAA==
X-Change-ID: 20261111-fix-riscv-unaligned-e2df80509e0f
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_024156_666233_7291276E 
X-CRM114-Status: GOOD (  12.10  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Returning -EINVAL from a __setup() callback cause invalid
unaligned_scalar_speed= and unaligned_vector_speed=
values to be treated as handled. obsolete_checksetup() treats any
non-zero return value from setup_func() as success, so an unrecognized
argument is silently accepted instead of being reported as an unknown
boot option.

__setup() handlers return 0 on failure.

Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 67f1a0371659..323ccfcfbbb7 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -322,7 +322,7 @@ static int __init set_unaligned_scalar_speed_param(char *str)
 	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
 		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
 	else
-		return -EINVAL;
+		return 0;
 
 	return 1;
 }
@@ -337,7 +337,7 @@ static int __init set_unaligned_vector_speed_param(char *str)
 	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
 		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 	else
-		return -EINVAL;
+		return 0;
 
 	return 1;
 }

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261111-fix-riscv-unaligned-e2df80509e0f

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
