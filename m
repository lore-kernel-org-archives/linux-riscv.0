Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FF6C44500
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tVy7+ZtdDJa7N+TQqR3wNzNzij/MOIZqqKTPmKfr2Mc=; b=XOpXDCNfyRnEs5
	aQXei0HXihlR2oDYQSYdibJG3xInoYW8GkqJhUdheHUxbiy8X51AljOE6mVnyD9/KmIOZQyTNDZeB
	FCQ+fZOFoNZEVB0qvX6+OISLgF9JP4qixrrBpR+uTc4ArRhrcQ6H5sDArmtjtVfvqMTYAjIZk/Xst
	BsWyDlrLpmGFf6Ck2fSHEqecAi3m3/K++doKZ2Hl0bWshSp3JJJQ+GbhTuBVKAMTVK7JdMVfjxd6x
	wFaYpik3SOYrrNXbSoeVQhd3WThUCXgvTKw+yYGJc+10aeRhrcZ/6rZshIPAj921SL+TXPW4BNIPU
	lN6HhXRkJF4G8mwKLgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfc31-00000006nx6-3vDq;
	Fri, 03 Jul 2026 11:27:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfc2y-00000006nwH-3NyB
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 11:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783078023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dquujKaEWXj9SeOR2cw//kdvyk2bjQlGJyeh7Df3DyQ=;
	b=AWkomLombwkHkJo2vs0voZrgpXBFgW8R/lpykfrUpxZKj5u0deNxAIJjRuBQqDmxrvxX2i
	hB2OovKQD6f86GGjkax+PFoTmWIHcIH+Ya4xg0IL6IzxSe0B4hFrBIM5ICxWi0e8wRHrho
	qd92DEScax+VYWlnasuMSfeksmSEiUI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-N0wgOyZSNKKQdJKGpxY2ZA-1; Fri, 03 Jul 2026 07:27:02 -0400
X-MC-Unique: N0wgOyZSNKKQdJKGpxY2ZA-1
X-Mimecast-MFC-AGG-ID: N0wgOyZSNKKQdJKGpxY2ZA_1783078021
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c825562f8bso9448885ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 04:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783078021; x=1783682821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dquujKaEWXj9SeOR2cw//kdvyk2bjQlGJyeh7Df3DyQ=;
        b=oU9jO7QaceB4ktdrm17Vq1mp0SQTaBluwQmxuzwNoLj1m3hDYLtF4hIo4hJFMeeRH/
         SAL/8q66wjnJuQOo5X61VZrhvrZ8Eg9Pwoxa2iS8UKA4rsk1Rp5pX65X4SwARk9K2o+B
         OqvCaa/oGaVLeThHNkb1whOqUzJtJ03CEitBNS0/k4dVm0kBOzG9BeZdJEzHME4+YvzR
         KY9C42gqoCPjtHJRbv0i6ztLEAh3nu/cG3efVYnjDjbxpHA38yeca0t7udSEog0CRWId
         gkAZdkhUYvdgCTnodr2LSGxaDhj6bR4JHLYRqBJgHMQ5lMfExznksCtdRi3EKZOvDuxj
         xZpQ==
X-Gm-Message-State: AOJu0Yzf4NNQIGX73Vtj9ZfBMZpXgqCrv1hzuNbRwDSKeslDvLRGH2B7
	ZTnUfQHWvVrFR2aH/BpyhiFSl8UXtYnOmJakNfmh7niw39aqGbgBTPw153i+m9xswY40qswZVxi
	VhjgmZYf2BWnBHJPKHIQJ1ztcCYdHl9Gg0XgNIbzwA5pFXHVGcqDaLuMz/Oy+IgDwrFQFDA==
X-Gm-Gg: AfdE7cm62wHJBgZe3w246wKi75fUOaWlmrB7w8a/bGU7yIzxLRA5HxaY/arE4nQmkkO
	aOUo3UASwD6VE/6NFx1kSaX4ltdTfzf3AxCMDbcYJLIDsjJLnmE3yy9EXHONOgTNESjajvFoBYx
	cO67H1bpEezgBDEbVwC9cKfPyXeB/b4HrV7GOCicPCEF9xgWQiuHdpvoX+VQRUbCL8JObAr3MXp
	jsnEMnXb+J2shWKX6Fj+TfFFfRyHWD7n2KOTeHBIVWvKo/BkGMnWIpT0vhqz4pvD9XLqQIBcHCF
	Wd3xHrToih9ezJ2veWw9gWj1PcghcDETUyCQsA5wNbkdFWfSoX6JSsfc5DwfrHJh9NkpJGaq+wq
	WMXwsv2268M+2IwYxFDz8Fl8MixRInCV+GcHImJkOzASwEqNS4w==
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr102173425ad.45.1783078021224;
        Fri, 03 Jul 2026 04:27:01 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr102173215ad.45.1783078020656;
        Fri, 03 Jul 2026 04:27:00 -0700 (PDT)
Received: from localhost.localdomain (122-63-67-56.mobile.spark.co.nz. [122.63.67.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260acsm8227305ad.6.2026.07.03.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:27:00 -0700 (PDT)
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
Subject: [PATCH v4] riscv: Prevent NULL pointer dereference in machine_kexec_prepare
Date: Fri,  3 Jul 2026 23:15:31 +1200
Message-ID: <20260703111530.91285-2-ltao@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F2Vy8-G81eA6mxjeXzjB4csYPKQKHXHp7TXyjvWY4Gw_1783078021
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_042704_919923_7AD4FEFC 
X-CRM114-Status: UNSURE (   8.83  )
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
a check in machine_kexec_prepare().

Relevant path:

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
v4 -> v3: 1) Remove code comment.
          2) Replace (buf == NULL) to (!buf).
          3) Reword commit message.

link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-ltao@redhat.com/
link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-ltao@redhat.com/
link to v3: https://lore.kernel.org/linux-riscv/20260701025732.66330-2-ltao@redhat.com/
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
