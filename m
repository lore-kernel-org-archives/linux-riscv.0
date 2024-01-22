Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFCDC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 01:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dN2UQ/2va3UtqHmMAgV8bqMhpRizzR/C1d9gXudxX2Q=; b=svhV1shCkSVMKP
	A/cgsE6N/O+j4PRidjAyDCM4wgUCht7NnIc1FL0KwqdG3ritztdbJeuzNmtQL+w1OjMbY0RSPpuPO
	M3LdmCurui1vn4QF4ABkBOuyMRtVu1GFFphAlPQCvIVJWQypPkS9V9qp47IiTKPcRM0HpSGSwa1ha
	rEP3oEf/QQyC/Y4QEgCnjSv+h9WRZrBS/xgILygFVpIac4jymJyl6Y0EFAqcwZ7gxg5kEz3AEmkTB
	w4pUHAMHsiUrGn68rMnYYxOibrLPpyrZk+38eYFBoQI3nEg/e46iRG8gz15ggG2sF68Bz+sgk3JSy
	RAeZsI/V57zAZ2aIFAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRjFK-00AKrK-2l;
	Mon, 22 Jan 2024 01:37:06 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRjFF-00AKqM-0p
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 01:37:05 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bda6c92ce7so1723884b6e.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jan 2024 17:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705887354; x=1706492154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6Jsu46i64Gml+WhUl1v04oD5se4ar3Pxfhx1o3Plk4=;
        b=KIHSYHcEcLQD7+u+cV/Hfsjro70P7rOyLfMsLHXvKhPVS+bYAff6repQpkREKDOsc4
         zt66/bdKPMgjIFGbBivd7TlIIpyZ0mw7nEcUiqe2+ndi8rLvvOIejbNGvAJtt/cofdJU
         1Y2J2ZqzsD51tK+fppo9ZPKpXgRHO5Y/ieS/zyym0juCUgqD3lZEuBeuB0iRvLWndmoj
         ylu3NqMLJ5roQpzmAecFBhVCPm/VS1DvRBiWVO/Tv5nXXHLnsmXOeg5sHJDaKIqL58Im
         cHrQ02JhdImx6CmQxiRVRFPNa3ALmfenFJ/oX0I3BeNNCQsyZTD1JCbGFdgleI/VRwol
         M2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705887354; x=1706492154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6Jsu46i64Gml+WhUl1v04oD5se4ar3Pxfhx1o3Plk4=;
        b=poXYJT5phaEtsOxR/SVxmAOJ2yXhsvmTyItWpaFHdH0B05CZ4my5craO1RP6cQX/Wf
         awxa6GFeGyb5Y2Qbdhtw8JGOow1v59MHHwUJfY1oFJRfTMudhpiX6MnQKtzO7h6vINEQ
         BQ2CzMTgwxulf0PMM23HY8VFNhG2tebJ2iluYWrykdPmBSZLABA6uT2PuNLvsYw8V8F1
         bJAOs8CoaQR2GDIOXBrhL6vgQCt8pjcbaqBEFf7i+Uq6y3btBL/JeiUEi3cpWL3kTpe2
         L21Bf3SQW8Exum1LS/VlOtZfpRZJ6lP62tpTScuFAkztlyiAXxaxxqw8vHDLkdJ4PmMP
         ZobQ==
X-Gm-Message-State: AOJu0Ywp9qVqHdmKTKhJzPmPioxn/ltYXQiFu+VE1XZu3MxYwNrcLFtQ
	2x/IJySu73CqBaYZ0mg51spaTaXyM6PNzAbfVbroZl0yp9eeEMKMrxZdRSjqtfQ=
X-Google-Smtp-Source: AGHT+IEqkScX2PPDIKRxZ/Oliomw2fBUesIuhmWwCy3WZeaHxfa8eoDaXdj/07eLwpCASY536Fl3TQ==
X-Received: by 2002:a05:6808:150c:b0:3bd:bc2f:a9ab with SMTP id u12-20020a056808150c00b003bdbc2fa9abmr338490oiw.104.1705887353962;
        Sun, 21 Jan 2024 17:35:53 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id m7-20020a62f207000000b006dbbc6ab938sm4750692pfh.199.2024.01.21.17.35.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 21 Jan 2024 17:35:53 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	conor.dooley@microchip.com,
	robh@kernel.org,
	sudeep.holla@arm.com,
	pierre.gondois@arm.com,
	suagrfillet@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: cacheinfo: add init_cache_level()
Date: Mon, 22 Jan 2024 09:35:10 +0800
Message-Id: <20240122013510.55788-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_173701_299695_19E37EE7 
X-CRM114-Status: UNSURE (   8.08  )
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

When cacheinfo_sysfs_init() is executed, the general weak function
init_cache_level() returns -ENOENT, causing failure to add the "cache"
node to /sys/devices/system/cpu/cpux/. Implement the init_cache_level()
function on RISC-V to fix it.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cacheinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 09e9b88110d1..be9169a38bac 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -71,6 +71,12 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
 	this_leaf->type = type;
 }
 
+int init_cache_level(unsigned int cpu)
+{
+	/* The topology has been parsed by acpi or dt, return true. */
+	return 0;
+}
+
 int populate_cache_leaves(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
