Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52717CD5BD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Paa9XxkiR3sPuDzXPsCQ5my9NXPsdP+LHDPWuQulWn4=; b=Y4ayu2KeKeag5O
	GbViufbzU5nFJG1s9biI0Hzz5fw/NHtCpiGh4J0QvQJmfbt5L6kupZIC3f1atCZy0n4+JflcWYC/K
	t1xdXgskftN6bNA9HSRMTl5g47vayvKV0M20mVzalmM9Dsdwg+/2wE5z2HUZA90Z8cfhdKJFNdjCD
	Eb5fjB3+I+CznSVR8+3GlVU5AfYgBehET2UYcOlQsg2/GxyzCDUY77JIK4Qh2Emb4n5MMlB1pbzKV
	3E85x+FNEC5El0HWN99TDjz1vq0d7q83Bt0lvXfO4oPVFb0npHmQ01tdtlj/c0pk7wg7Fqa3SjJzh
	LcxQMYkzbA1Eu4VZjV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yH-00000003Ews-1FjP;
	Wed, 27 May 2026 03:30:19 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yD-00000003EsH-2Qbd
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:30:15 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so5657235b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852613; x=1780457413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmAA5z5t6XdNPHFYJxkTDYvo5Zq4DgJyNWi+6SrmBDo=;
        b=Nvpb4OiQWFRiw+DRbtPTduevhZTJBs4DFUgMWvYx1xSQ8X8ssT3gDxyVjvZSlUIeFj
         dERvAJs/jAGhmLbE5QvCmTEYoHy6fkIdSjmC2uSffKT+i61e0rwD+6D1TvJ45WNQ6Vru
         YbH8UuSPLwyyw0jIRbvaWd2xOvX1rEsj5Xv6pWxPO3GqFF2z5Axw05wa6D8+i5aWJY7J
         Fvk/fv44Fv8/Cm43cHlrjHfkbKT+Xbc/itho0s/D+zzr9q+g8wlab4CknYCaLEXlegRn
         ZIXHYpWoMO86LQ8OKJ7/tYATSmPbXQ0p+shpfUpar7nO3SLKqaASrbm+LgVGmmOoa5dB
         76Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852613; x=1780457413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmAA5z5t6XdNPHFYJxkTDYvo5Zq4DgJyNWi+6SrmBDo=;
        b=cPJ30efCXCUk6+La/u25EyNHsvcOU3SHnFxsb3oMv3tPIR6R9rJ4+VGkpyFsncqoLj
         9HQ3OznAud4fGvolwGXz4GNK0P/KwrxPEv5h0FwJRDvwc1Di66Isz3qpwx7NPoS2r3UC
         7ePkdh+bD+rcI9VqgGmZb9aG3y8HSc9g2v9z+JFawIpV5UvO5g5QywF/gV5EZ2w6d+Eb
         3wpTpCeyf1a7imWX+zu/LKP3b2dG3JycPbuIRlxNXQatswaDcB9sPYqZyx8ZZDeQCIkN
         ILtg0Js/KwUrRO/OE1ZJsBttq4n80A99/pFxfv6OOu21bCVxP/tfLYdIXKZTF8zZao6w
         bpFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RVpcmSKU/7ORmJlN8v5HvMLnty3SMmFw5Rf86eLwP2DmHbLJQUMZDM5UDf2wwU2YfumyBtE3jSe/n4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsIARyuqsWGT4Er3yL/jOmW790t1S5qfUvZ74OGv87qLzls7WN
	cuKhmUgQgoz1cXfe94iAbEv6xltTNz+j6wSKGp9DRqITESskEFQTe0kiYNHTjw7exXA0pg==
X-Gm-Gg: Acq92OEqKR5jNoYGIjM/nABkFVTlAanc5bDixZ7Od4qYPCL7C4N3c5hr3MVNjwqz9/q
	rb4A66SFl00a7X91EWVsvT2+PA7qdQpn83vLx02s24h/wA5KSznnOrhL5icgBGgGOqOBgw+N7Gm
	xHJye7FLxDJJcJy0LGuc0qoEWZcFl6dfs8HbVpJ/UIqg0hbdovphUGmE/7AU6a91ScvUIhkhOCG
	EYNC8NM2SX1xkIzeiWB/F2tUwcJLJVrnp3trvlBEikWQwYY2qkCV/KmFpwoFpv9TOe1VUqbq5iJ
	XdeUdycaf8ksPrGbHP/d1QlydGv+ykn8VU4lA5AwUnzzg6aomM1YwiVXluehzBYHp7LAtzPavJU
	OPS26xjIfyX9s3Z6a+0n5RZhnW19Jxodw+Km/O7q/1+KBxzLfJctpOtRjEhGIriNByRomZQx3iR
	mBqqc6t4U3E2wB4ngf9k49XOqxwbBrwMw9MVI1LNOMOvjS2Q0=
X-Received: by 2002:a05:6a00:1407:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-8415f406e6emr20083726b3a.30.1779852612592;
        Tue, 26 May 2026 20:30:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:12 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 04/11] of: reserved_mem: zero total_reserved_mem_cnt if no valid /reserved-memory entry
Date: Wed, 27 May 2026 11:29:10 +0800
Message-ID: <20260527032917.3385849-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203013_647242_AA42685B 
X-CRM114-Status: GOOD (  11.95  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for storing /memreserve/ entries in the reserved_mem array.
Zero total_reserved_mem_cnt if no valid /reserved-memory entry,
instead of keeping it's initial value of MAX_RESERVED_REGIONS, this
allows accounting /memreserve entries based on total_reserved_mem_cnt
in a follow-up patch.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 6d479381ff1f..05defc91e901 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -329,11 +329,14 @@ int __init fdt_scan_reserved_mem(void)
 	const void *fdt = initial_boot_params;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0)
+	if (node < 0) {
+		total_reserved_mem_cnt = 0;
 		return -ENODEV;
+	}
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
+		total_reserved_mem_cnt = 0;
 		return -EINVAL;
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
