Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1BAC43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 23:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=diYB5MHtXuqDRaMur5hYtrCVr103OA6lNH5YEVaET14=; b=LT4pdDkznZZgh9
	MKgyr2bvDYcUIxkRIUzwmx3pSsPrCyXeJ7M8bo8SIV1S3Ol8Dih2tDkity//fxUByxjHovx1CW4mF
	ZH9P10UJuLEQ5jM3kNIe7o1fzYIMkxLk//lq/5rCgJ2U3ITvWYFehgLKoOCGaEEkZZ+yvUawXezPR
	vF0p9KqKX7kAyPC/KdU5ssfLdDSdFSvni3Y0xH3ztqS6kWYuQbznhS9vEV/Uwxi4H/sFi9h7fcbhJ
	BKYH6RJ4MeqX34Grl1U3KVg3I5VV0O/NDcFfLrBeZ60sjdUz7X33OOKlBKr0xP6hYPiYtr2LB+hwH
	3CRStXNFrHs+jm3qf68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgWLG-0000000AirW-22bw;
	Sun, 05 Jul 2026 23:33:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgWL9-0000000Ainq-2phB
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 23:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783294413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qWgX8hRK0wDWBZMkA2UqYafCnMgGjGfI+mUA5gi2rBg=;
	b=TWf9qEfIiSaLBUV2BCEc0ejjkLUPoV3/5w/gzmrgsXwwFw4AIIU9uZ1XBMFzOBWUHZHUsK
	gsDl2zIyqpJ4HaZ2uScSLxEQXz0BCWXPC76EoAmb36e3MzVbN8KmLUjgOdQ2NRIQoXjid6
	DSPD8STNrJ+/l0RySGm3NJnx4+I3k/k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-HNyHRNp6MECL90KPd1eh5A-1; Sun, 05 Jul 2026 19:33:31 -0400
X-MC-Unique: HNyHRNp6MECL90KPd1eh5A-1
X-Mimecast-MFC-AGG-ID: HNyHRNp6MECL90KPd1eh5A_1783294411
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c8018f11fbso25226975ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 16:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783294411; x=1783899211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWgX8hRK0wDWBZMkA2UqYafCnMgGjGfI+mUA5gi2rBg=;
        b=AiuiKnLApTMevs5cjbVNUdSgMsbiA/Oxbee08Pa4K7zGVl5nteTKe1UeQ/l5Z59PHp
         rmMGX3rhyk6/ZtdoaeJjROAQjSjBDr9xwFry9yEWoQ7rh1enq+wkAy9DWeOtGLBY7Z/m
         6gy7XLx/r1TfTgI7hIJWc3enO32jjId0Fm4FO94gtwbnhM6jcTw/tA/FMEWYUEF6sdOK
         cn5jukNYb+8jXyurVWPYMWYl83HEOmUijSlMIFep5eVIDQXRU8+VL/POVJDp0+r5RCAQ
         BCFhK+MY+PNGwDDyqhJGzGe6X6TywTAbdHJx7qWG+7k06dWI5BVIWG1cB5k1Lstd00j1
         9c8g==
X-Gm-Message-State: AOJu0YzWijuTc/ycT61yWgKcXt2hGoh9scWim1qST/HeVtVqXoeo+LVH
	XLlaOYLN6M9cMaI+w51XjjeEKqqgxcTL/E3Fdby9at5w59SqIiHwZ/aYxQfZmeq6l8cPD/1JJWa
	lFjS5b9FYlZSNQvJ8/hL915BdxUytu3NYLwBJUAchAbI+kVuG4HTJxHM/+cuLAWkXM+EAfw==
X-Gm-Gg: AfdE7ckss/Fma/JBogX0HeLHi/+xu0100uyZ5ddkCg8Rsi9s9HrL3BZitaPL1BcfjGU
	DZ3zwqDyDGwZOxT9MqpwhRkVFi8a0PD1ij13xGVFKDQjMmcJTVOvxohK2iklVTBDb3eqpdePSDx
	36vH5mwvOHQGWjQG3zD48cLh8F+VKMEgVUqxwx/LEKWJKbJohkxY1qHHkGJKsI3s0VOvtwsoP5o
	GuT8DyQVMeog3/d7Ov4LoTXwgNwGKTLNZRsftw7Za3YQZzCrSlhDZzfq5us6uLQGrzOF5CInFfy
	fQ52Tq+PFhX6gMImh+BTXuPjBJv4ePBrejfcRLTUum8aGWc9WQyZqUqhk7+jRMOjLocnJAJRn7V
	NQ4UU9uzU5acJXL4m8iQ18w00GQ3BCoCWxzjSyMZvLuCzO1/iXvI0gq2xUQ==
X-Received: by 2002:a17:902:fa84:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cbb9eb434bmr53329195ad.27.1783294409475;
        Sun, 05 Jul 2026 16:33:29 -0700 (PDT)
X-Received: by 2002:a17:902:fa84:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cbb9eb434bmr53328835ad.27.1783294409024;
        Sun, 05 Jul 2026 16:33:29 -0700 (PDT)
Received: from localhost.localdomain.com (122-63-66-137.mobile.spark.co.nz. [122.63.66.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad789237bsm38168945ad.71.2026.07.05.16.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 16:33:28 -0700 (PDT)
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
	jarkko@kernel.org,
	Tao Liu <ltao@redhat.com>,
	stable@vger.kernel.org,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5] riscv: Prevent NULL pointer dereference in machine_kexec_prepare()
Date: Mon,  6 Jul 2026 11:27:07 +1200
Message-ID: <20260705232706.30265-2-ltao@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tGHATy80xPIUzU5or5cnjaCepaU9U6yFIoRwMdtDfH8_1783294411
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_163335_782240_5FD0A361 
X-CRM114-Status: UNSURE (   8.45  )
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

A NULL pointer dereference issue is noticed in riscv's machine_kexec_prepare(),
where image->segment[i].buf might be NULL and copied unchecked.

The NULL buf comes from ima_add_kexec_buffer(), where kbuf is added by
kexec_add_buffer(), but kbuf.buffer is NULL, then it is copied without
a check in machine_kexec_prepare():

  kexec_file_load
    -> kimage_file_alloc_init()
       -> kimage_file_prepare_segments()
          -> ima_add_kexec_buffer()
             -> kexec_add_buffer()
    -> machine_kexec_prepare()
       -> memcpy()

Address this by adding a check before the data copy attempt.

Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/kexec/CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com/
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Signed-off-by: Tao Liu <ltao@redhat.com>
---

v5 -> v4: 1) Add parentheses to function name in patch subject

link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-ltao@redhat.com/
link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-ltao@redhat.com/
link to v3: https://lore.kernel.org/linux-riscv/20260701025732.66330-2-ltao@redhat.com/
link to v4: https://lore.kernel.org/linux-riscv/20260703111530.91285-2-ltao@redhat.com/

---
 arch/riscv/kernel/machine_kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..738df176ff6f 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -41,6 +41,9 @@ machine_kexec_prepare(struct kimage *image)
 		if (image->segment[i].memsz <= sizeof(fdt))
 			continue;
 
+		if (!image->segment[i].buf)
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
