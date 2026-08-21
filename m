Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE55C5DF89
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PepI0CRxb9K6MQGKkhISK1ipOSlMjH0JKL+2+2EEl/c=; b=aPn/W/HyfhYjJg
	5hEOLemCMz8E6t38y8rOjyU5keljSZdkZVaWvSt3d+He0Q2+Qy5RLWLqu3bTLC088QV0wqlQZZWF1
	UpG06ldk4uzOY7aFop3FMdWwY1kWCzCvX1IBLcB9y1OyDdiXWnSdrgoOCE6fAv80HruLXJJa6ZukB
	Lz8KkrvnRIlF14MIbDLYd2OMhTSjm6tVaAF4bOBY4kcF1waJudLyYGCSVgbPdO5w+B2ebp+DAraAr
	B2iphOWiy3+5fTn4zFmsPIJOeVR5R9KditNoRpw5IzygSs0M0Mi4tV4roSZyk3mMvNSNBXpvwj+qn
	+dZesccCMNFTLxbDRCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdi-0000000DSbR-2163;
	Fri, 21 Aug 2026 13:50:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdf-0000000DSZ7-33jm
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=;
	b=Igy1OrO309sCM1DFrAlzAG60JBp0UxTZaBhbTpIQFY2MhUIbpSWmlzVemPepy342zGi1/Y
	JRw6+BB8vg79IcL/8LiCR0x7RaB+Lm7X6rB139R0F8rfM7MABiuIuOcbKOqo8ZAqyuz28O
	9xnNa2r7AzwIrTb44Rz9pJKLFDI8NTs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-mNJRqL9MPW6Co6_3rblBmA-1; Fri, 21 Aug 2026 09:50:29 -0400
X-MC-Unique: mNJRqL9MPW6Co6_3rblBmA-1
X-Mimecast-MFC-AGG-ID: mNJRqL9MPW6Co6_3rblBmA_1787320229
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso1376495a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320229; x=1787925029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=;
        b=HPncc8QGnyiEC96J32dM6Ph6loMWmpmE1GkkHJ3CiAJO4GSwyLix0n0yQBNnQomN1H
         ppGCWlVtjJNrc6RAZYJ1dOeUXffeJRF1McSC5HgZiXy6jCNY/3mFTIkXPJUvOvEGz6sf
         UtPYb1ojOekszy4dfaoiQCBa/c4Kmw5qw8Dtrhgtzqchf7bhvthm8nKl9cJvDuJiYKpT
         w9/cfut+PnvtXUpxjQVq5a/li+UbI2fGOZcC8pCAG1NMLYqY9KfU1enFvMI9U959A7dC
         LONEWAqhjF22UdFn36eoKmoBm6OR21HNQUhWJnNC3GMIBnxNQm7iPYjJalPhHF5YEtkP
         mtvA==
X-Forwarded-Encrypted: i=1; AHgh+RprWwNmwzQQ4fGBhufjZ8j11kQegrXx5Iu+L69zx+kkJuIfTN+9wjpfP65rNmG1QIZdEmCn0v6V1n+q5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kjOvPtLnEOb37a/dncKRugGk6kzNbv7+WYChU1bPRR/V3FarSr
	PgcuXI9vxu/emAB7tPaiaVx/N1qWHvFS409NMkoODogtmMZg5b+wX3PQwlBm47J9P930WiTAYMJ
	s0e1BbEBD3XAZ5Ahr07KDrsLn3+WXKaPsi2CYME1qNPBh0rHtyzAWIXLHyNAZWmN+tCpM9QYuOG
	o7uA==
X-Gm-Gg: AR+sD10zoDhBa2UPeAuRNxhp/OYpKKJDmmqaMQmusP9PfO3jeAfz/5En7+FUmsiwOwl
	hnqG9x6Fl+2vTw0GJtHdHGvCnTmXVIVE0BfQcML8rX7i+OkQXeN+HUMjXyAumF/gFhN2AbxEZws
	LrGHtQuzkz9CpsyNIiGWxIjvv7UUXOSX9y/ihj0lB/I2u7bdGcxDk0T8wEyUZ7VQOYDw9lZ8a/c
	fiavPliYmMHpEt5Fc6WOxfhHTK964p2FCr7YLR4KMz7jafeNV4plsTfU2Vfwjd9PkvuvZK8FhtT
	IE3PXjWHbK9FYxNMgaKr/sd4ivzvUmMYVoWIEA+8QDebuGsb6t9LMi50+TgNa95Q18LqIMmn/DS
	nx/1G/917pUGhs043UXGlXndeWrCj/3AA
X-Received: by 2002:a17:90b:55cc:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-395c334042emr13743999a91.1.1787320228649;
        Fri, 21 Aug 2026 06:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:55cc:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-395c334042emr13743913a91.1.1787320228164;
        Fri, 21 Aug 2026 06:50:28 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:27 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Fri, 21 Aug 2026 19:19:58 +0530
Subject: [PATCH v3 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
MIME-Version: 1.0
Message-Id: <20260821-mpilaniy-v3-2-76b355399d2e@redhat.com>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0wqQ7uRR9bHcVvcUlPelsx4O4oLORcFXjuA4r-wQIUs_1787320229
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065032_043582_652B170D 
X-CRM114-Status: GOOD (  12.85  )
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

kexec_image_probe_default() overwrites ret with each loader's probe
return value and returns whatever the last loader returned when no
probe matches.  The error code reaching userspace depends on whichever
loader happens to be last in kexec_file_loaders[].

Only continue to the next loader when a probe returns -ENOEXEC.
Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
only when all loaders have been tried and none matched.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Philipp Rudo <prudo@redhat.com>
---
 kernel/kexec_file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..c11a815e2235 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
 			      unsigned long buf_len)
 {
 	const struct kexec_file_ops * const *fops;
-	int ret = -ENOEXEC;
 
 	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
-		ret = (*fops)->probe(buf, buf_len);
-		if (!ret) {
+		int err = (*fops)->probe(buf, buf_len);
+
+		if (!err) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (err != -ENOEXEC)
+			return err;
 	}
 
-	return ret;
+	return -ENOEXEC;
 }
 
 static void *kexec_image_load_default(struct kimage *image)

-- 
Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
