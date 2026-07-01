Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7382C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dpgM05O0uPvEBCueZpvQCa5ITCIKzNjeCZb1IjN0Lsg=; b=TXmsUMXLjlZorK
	EaGugq8kF+4r9uXdXUn+k1dmwCt9JerppgFHceZY50kRP300Tzz3w8eFzvvSlKHpI4akdPr5Fvw6J
	1f/zZIezfvzArXf7Rj/OI6STPvGIW3+WXVu5aGnKs8s+z1dbyH8Xyp/XGdNAmYjVhr/MVpnSPlkOS
	1hbNLtW/JTr4obIhhTWuSwFSIyvBJLn/p8XBrzaGCcJLdELNi7L4Tdw3K26PPvnJ+KBFPIMOV8mUm
	6CFyeQ+PQbd3opKAId81Uh9eo5yvNEp+KG1lnqjYHJMfk5ViRSiWj6HjPZMgTKh8/i1ei7FZWIJ9z
	5yY2eeBpHnqLwEC1x2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welFx-00000000YNC-0bLe;
	Wed, 01 Jul 2026 03:04:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welFt-00000000YML-0VL8
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 03:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782875090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lCaMYc8eNrfsW+6kx9m1j6d4lfDzKZwvqiqCl5u41Vk=;
	b=T65OBtDOnHpHS7K1lakYHig1pNcnfGjMlBirsSQAPmdjxTnLxsE784dFsquZlVcdz0uB8/
	diMy4cAJV2RCqYIQ1OrLKK54tYhVRIbhJis4IRIhE1qr/rfeOYbEQikokrJWX6vB7Wg0rB
	t0VdX9jrqQ1eVSq/TVZreAFA9VUFqc0=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-gmzvqRuaOmCzUcD0yHRz_w-1; Tue, 30 Jun 2026 23:04:48 -0400
X-MC-Unique: gmzvqRuaOmCzUcD0yHRz_w-1
X-Mimecast-MFC-AGG-ID: gmzvqRuaOmCzUcD0yHRz_w_1782875087
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137f3465368so429277c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 20:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782875087; x=1783479887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCaMYc8eNrfsW+6kx9m1j6d4lfDzKZwvqiqCl5u41Vk=;
        b=X8Bz5dpIEy/sKQzp4yKfodHlZ/mFj3yD2ab9pvlLblmxtrC11sb7WhGEjAK+PSB7NU
         EawaYKIXvuZxzAGB+0AIMkQ1O1eFsu2MNljNh6LggXZxTQrMXqUj+d7ieq+1ef/El+Zp
         dnUjEcFPiZ70tbaWSk5mWay6wr0UMDf9Pj1fY4c4E0DLJOEVqB/Bz0fsfYucNmAdRte6
         wc2jmVvv3nKnEJ2XC5l/FoBe4lGZuCyCKOc/SzLJCJbfuHCsFMV8NSMbnoUb70NKhZZ6
         q3w7BRCUkweF5nvxHvj12Dc0h65/+PreZvHFVoUev2Jsk0LIwMtk7Z/lyrKxmN7Fm8Dl
         ea4g==
X-Gm-Message-State: AOJu0YyzOlhc11vRoEuwbwI75VDPgSkfoteKwsS4BjGWKMhD3Of/T+OJ
	jYz66yzomQclr9ZV5Eo3qDwEeL+5Pb8DkcPKfAdLbX9eq9lseHiP8YsAjEsk/YzlqPE5suZotM9
	pGt7CbG+ce5jF6BCTHh5n32QP+ZAGCdFxIy5tOhjb2sFRkrMJ3vZgv56RetQwYs/c21WMJA==
X-Gm-Gg: AfdE7cmJUk742ipjqt/H7LwLInAMBkGWhQDsmj2cyRisu6yQKzU7NdBSRV4a7JiI1/j
	+eCcMILMc1vtFAuWqthvhoPEVHsALpR3jbCaw4TkcXpBrP8g3bqFCnivWUAWNMlHkWggQ1tbjSN
	FF4q3KKnW7QDckbR0IDDwI7ql0mBsnn7OMS2ksNA624Y8kUe//gVdDA2xtATlzcAC2zAqqw7C/1
	7xPMFRorDd6AsEgYX+QUpUFrvEd6rjPrG7COkJy+eCpYm/DaT00Wfhec52mhrZVeGM8YPvX59mE
	30ysyZ0Bd8YSqp+gvSih0Qvswu8hacuBemAcysCfw1dEpfDJPNRI3yDSp2ES8/VJSCZNL3JDwsF
	Bi18vAi9yKjCWGk2dcqbiNU1BdIeZxBem3x1PUFDRKTqKixBrBLZsZ5Y=
X-Received: by 2002:a05:7022:23a3:b0:139:ed5a:eef3 with SMTP id a92af1059eb24-13b315a4cd0mr2248697c88.50.1782875087301;
        Tue, 30 Jun 2026 20:04:47 -0700 (PDT)
X-Received: by 2002:a05:7022:23a3:b0:139:ed5a:eef3 with SMTP id a92af1059eb24-13b315a4cd0mr2248677c88.50.1782875086647;
        Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
Received: from localhost.localdomain.com (122-63-73-73.mobile.spark.co.nz. [122.63.73.73])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba8dsm15858670c88.13.2026.06.30.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
From: Tao Liu <ltao@redhat.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	bhe@redhat.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	linux-integrity@vger.kernel.org,
	pratyush@kernel.org,
	Markus.Elfring@web.de,
	kernel-janitors@vger.kernel.org,
	Tao Liu <ltao@redhat.com>
Subject: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
Date: Wed,  1 Jul 2026 14:57:33 +1200
Message-ID: <20260701025732.66330-2-ltao@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J9btoSgVaX-jzdyd6P7yE2CAjEzExoQYUVybha9xjhE_1782875087
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_200453_278767_BE61E362 
X-CRM114-Status: UNSURE (   9.05  )
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

A NULL pointer dereference issue is noticed in riscv's machine_kexec_prepare,
where image->segment[i].buf might be NULL and copied unchecked.

The NULL buf comes from security/integrity/ima/ima_kexec.c:
ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
but kbuf.buffer is NULL.

Fix this by simply adding a check before copy.

Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Tao Liu <ltao@redhat.com>
---

v3 -> v2: Add fixes tag; Replace "reference" to "dereference".
link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-ltao@redhat.com/
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
