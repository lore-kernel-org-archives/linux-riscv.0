Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DCEC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zX2hNcJISNAsY33pUdRFGyin5+/8fbnBUhwQzHvgmH0=; b=Re+9sSB0MQFCZg
	YC857pe6IhqnbI/NS1mpQmk3HtwtGrGpE0n135+7jmEpPn8918nZpS67iHgxFNIbCCf/qk7GNw7ux
	6gWRAGnHJeTl/jR4J9wB8noSBdlWhNMSasXjtUz0xkiXlcL6M0ZrAVAGbjMzSHIHojetk4V2XL+ih
	pVAJ6kA+5cQwPG20mCAgiADx0cbpXtt/dao2nr+bq6XR0lwLUtULgSl2L/2D21mSpA804GmuYJACf
	TS5fS5DiN/GYuLSD3j4NjwPCDv9mG2CZiu8Nj/51gWXjJz+lbGq+e0RORO9vcAJtjTwkaFFZ3hqYR
	xcwnEeDPTkDrcJrnj3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbW9-0000000CnPn-2ZJ7;
	Sat, 27 Jun 2026 22:28:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbW1-0000000CnOk-0l6s
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 22:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782599322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1a/DgFcrrEHwkA8ET4o3flsjcsRtGN3BOYsiECe4Zmg=;
	b=Uyc1hL8F8QzQhThlXqGBTz4ZBCHn0LfosvBrvuH/tnsniqdcCVUTi5/QVRHbT0xeyo1q9W
	jef0HjMxvdCGyLubIle9to8Z6YSUVCDSjprRz7bWm7jJfBtnurgo/Wtzad5G0nlqc+4+T9
	2c0NeCZrtaaT63QU6/ECczVekrB8s2Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-Kz3R4hHAOvCbfmOnA6p7FQ-1; Sat, 27 Jun 2026 18:28:40 -0400
X-MC-Unique: Kz3R4hHAOvCbfmOnA6p7FQ-1
X-Mimecast-MFC-AGG-ID: Kz3R4hHAOvCbfmOnA6p7FQ_1782599319
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7ef28ce24so15920045ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jun 2026 15:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782599319; x=1783204119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a/DgFcrrEHwkA8ET4o3flsjcsRtGN3BOYsiECe4Zmg=;
        b=MnDQHd6maZcdl1cV4web4yLo2L5RZ28XKFrg8EhdMotHp04UFfWdW6Us7f4xE+hg3A
         Sq0FRHfSXp5tXSzZCTpmqCZlP0v9O6ZDfq3nXbmjorzVgyUpAzk3HGK14f079BwagGIn
         pMDTGL2FHiSaoWG0eqzWIc5t6sgyG6B2nOhcuMlVR6/upYqcVE2mT2eVseEwzc/vyKLh
         vKFBRgi+we6WIkmUKB1rDSuyTdLJE0r510s5aoTqIoQcJV5s36tcZzsgNCsVOctFbIly
         lNkiaoo+FFwWl8ZATlN158fn/ixcpaeVlxFSXQCJP5SEbmzgAN0lEr064CtscA2GF1Yf
         ALnA==
X-Gm-Message-State: AOJu0Yy8b7FMt+X0qv2nuFQbLb9N4lKWuXoknJifVUdOPgllexUXX8O0
	WiGucqKVY4Lc4ZjY+HD0pif4tmvStWaFM+N18hdaemYkOs1kvsC5vXzt4jxbzFlxEslfBDSRWFd
	7GWCqbvAL0QUNimbFdFKD19Wyjn8fuK238M9XF8f57BFNTbZ+0pQbg5LQ05D9zIvS837Z6A==
X-Gm-Gg: AfdE7cmVJW0W/k3p5hkjE71cwNCGKrtgvWrKRGu3kP5TiDS6x5hiSAkNIueXKDVUkzp
	u2V2vFuZtvUmVAqXcj7rDpDHffY4pzowzMLaeDx6v4HG59OIgLts9f1DmMDmSx0eAdj0oGxTW42
	BLhdgoIZHBUj1A3Wi1mwHP8Kk6ka7ZN1ZX02zWKK5VsPepBMrdcBEi0yNxnbUf7hYR2B48tIIGQ
	2w4jWIy3awaAsrstG6gsY4kIRH9valyG7VfZ1vdoI2ftcE+KUZsoDeGzqITcjmYtSW3WPQkbsd9
	SvrlChdYTje8u3KhXIIW6qteUCGwjaZFBiZ63zczBp+98cgTqocCCz7096vQftk2NFSqWryYGzX
	xg/cfZMSRz5M7CsITFZ2f3fZfHVRMaANTgQAJvJincSo9W2b9bfyo
X-Received: by 2002:a17:902:e886:b0:2c9:b96a:285b with SMTP id d9443c01a7336-2c9b96a2a3fmr22166485ad.33.1782599319101;
        Sat, 27 Jun 2026 15:28:39 -0700 (PDT)
X-Received: by 2002:a17:902:e886:b0:2c9:b96a:285b with SMTP id d9443c01a7336-2c9b96a2a3fmr22166275ad.33.1782599318583;
        Sat, 27 Jun 2026 15:28:38 -0700 (PDT)
Received: from localhost.localdomain (122-63-64-251.mobile.spark.co.nz. [122.63.64.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9deed3733sm2423215ad.23.2026.06.27.15.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 15:28:37 -0700 (PDT)
From: Tao Liu <ltao@redhat.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	bhe@redhat.com,
	Tao Liu <ltao@redhat.com>
Subject: [PATCH v2] riscv: Fix a NULL pointer reference in machine_kexec_prepare
Date: Sun, 28 Jun 2026 10:26:03 +1200
Message-ID: <20260627222602.23594-2-ltao@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: avJwGUOUOM_dkOQhhyVOb-4D-zVNyu-C1fH3X_iy1lo_1782599319
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_152845_304775_8006B050 
X-CRM114-Status: UNSURE (   9.17  )
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

A NULL pointer reference issue is noticed in riscv's machine_kexec_prepare,
where image->segment[i].buf might be NULL and copied unchecked.

The NULL buf comes from security/integrity/ima/ima_kexec.c:
ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
but kbuf.buffer is NULL.

Fix this by simply adding a check before copy.

Acked-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Tao Liu <ltao@redhat.com>
---

v2 -> v1: add code comments as suggested by Baoquan.
link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-ltao@redhat.com/

---
 arch/riscv/kernel/machine_kexec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..afc68f6a4aa1 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -41,6 +41,13 @@ machine_kexec_prepare(struct kimage *image)
 		if (image->segment[i].memsz <= sizeof(fdt))
 			continue;
 
+		/*
+		 * Some segments (e.g. IMA) reserve space but have no buffer
+		 * loaded yet. Skip them as they cannot contain an FDT.
+		 */
+		if (image->segment[i].buf == NULL)
+			continue;
+
 		if (image->file_mode)
 			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
 		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
