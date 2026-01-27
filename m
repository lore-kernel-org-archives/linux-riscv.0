Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDB3D25957
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NHwpZkWLOxkEHlz8VigkSQDXyMpuxSUmBfdaZvfpVl0=; b=yO9bhrSdvtYCIk
	jmIKdD+9SUQEh1HjgKLJPN7tyO+X26YaWuo9EjnVBWONKEsutjwKddJJI2/3D2Ehg+wukmnKZNloY
	3ft9wqAHOS/kOLbA4MjMnvaD6xS/GCCQbKabs+QIEEVbZ/EwpGSEGJ/ZEnsKP3W7WX10jHyYWjxTO
	D5lRVczmtcjDUoF4serJ0RLmD5OVZBurKB/B+xkzSUZKBW/G32waykOOdt2mc4OpGwYyf2v8euO5m
	jtWAEjaYumY3/Jp7KMRaukwaVnDaj53OuxFuMg57rWBI/tDSQSlxCl+H9Dbxeo61RdGV6jrAqzPc3
	KX3vbPo07F901+mOf8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdPD-0000000DluM-3oEj;
	Tue, 27 Jan 2026 07:22:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdPA-0000000DltD-3ar6
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 07:22:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c626bd75628so1851864a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 23:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498547; x=1770103347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUonCIx+ZXd3QT2hTb6eW9uVCVHoiU5hLnPWwgxhDNA=;
        b=hgdV6424zzBlxon1woUjyZKGO1hjS+l9Ef52dfB7D+kebBXB65k56VsBuYuqQDnqTx
         389zrHdzITJMSx8ZoBPUBGH3aq36jNkch8DSmjqdB79zilt7Z5tmTiFmJdiCdKhY1xZJ
         WU1y3k9huNztAHKv4KH9doW8ISkG4EGtJCORN3RF2u0YGlIFi0bvPPgouMTzTwByDJwj
         njVl3fgCnsr9d1N8+/0yNheaB0HV4zuA5OMH4MNbrdsP1k8YWluSm5ulNqMSPyqpSSgC
         1JGFRd3dMm4WBxIl8DiJvR8FmU8E5yoOIgwBvgcozUazOYyzB0ECv4Xsg/CDv7wttdLi
         eukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498547; x=1770103347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUonCIx+ZXd3QT2hTb6eW9uVCVHoiU5hLnPWwgxhDNA=;
        b=uNj1aoiW1nRnT9zlJpzKORWGxQI1IFJzxA8QQ5rRFhqvgXcmTjnO+6XJO/nvLXxjtb
         FCVIAtevDp3AttDVf9ac8daZEgtLFjkSchs3QnD3fmoM2yIMJuf5O4frSTRlkw8VveRm
         An9Z3mz+6wAOP1mvcF5lf7utoTDcJv7EtFzTdiX2IanoXXpModjMwg+UFSAE5X/HKGRU
         GdCWvU1ZMKABuCAHsziqawzjGd+Y0/gBRuhKoxno/0AIGoQtpRtTfvl9jeJYxjA0f1vW
         DZUK1klAIaGdh9idjj2jqa9O+4Kj3CgQgnvdy4Dh/VUKY2QA099CmUniZQrmxD8BPpnd
         enBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFD8jktuqNrvUJ8FTq2HAUI2P4Q3FuVb8Zxqv4tjOKPugQxWedsNtK3k7eDE1jeWdIHRgK4yCwPUtWlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKfjkRPqLU2cEOk1npojN3H2vCH3+4q3W+ZFKyhWGszpYRgk9A
	geV+3vOnq4+hOq9ujSbWa3WjMhK59homppZZYy7Q9T4fgerzsXWeXPMH
X-Gm-Gg: AZuq6aK5WnA4GXQsfaiI0nmjPEr9B4o1hOazwRkvLNc6vkQOqG0xjFURXkyhID59Nw7
	+Cb1dCMZo2xjUNTHD5oLbBKlajBjUx8xVM4hePnvG0spx8xloWXCALuHJ0CgZ82PbJkDbdCckRs
	7MmEy/hRUmIfQDNEA1KcD7dXMPM/6gcR2tuhyegc0oJjAEeQLENPlDkgVNmgMwqlCJANqkfkLLG
	doE5WH9rmD8Juizl8Hmty3R//ne1oc741WkBjU+zauhEZm/YohJ5+fdNrtoUeVF++JSlqjcbOqQ
	nvclxHKVodl3Gh3iTEOUTFS0+BAxDoqhMVIeyl+BHTvoWiYapZOayUStMPVnYvBy6mmgxBDuL+I
	0TPvuXA8v2TbWvnr6oD5zsBZL4tLjBFpm9d8Dn+NZ/Aqq6VW0oG3gGr4ipUqN3mG/mHoxM0aZAn
	3JTWG/IE3bwun5jdix1oG6gnkNsQhgnmTRIHyee6aBM0e+J/HE0zw=
X-Received: by 2002:a17:903:2344:b0:2a0:b461:c883 with SMTP id d9443c01a7336-2a870dd56e0mr9555815ad.45.1769498547192;
        Mon, 26 Jan 2026 23:22:27 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a87842538bsm2505685ad.60.2026.01.26.23.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:22:26 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
Date: Tue, 27 Jan 2026 07:22:19 +0000
Message-Id: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_232228_914496_58CC8262 
X-CRM114-Status: GOOD (  12.60  )
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

Add a null pointer check for imsic_state before dereferencing it in
kvm_riscv_aia_imsic_rw_attr(). While the function checks that the
vcpu exists, it doesn't verify that the vcpu's imsic_state has been
initialized, leading to a null pointer dereference when accessed.

The crash manifests as:
  Unable to handle kernel paging request at virtual address
  dfffffff00000006
  ...
  kvm_riscv_aia_imsic_rw_attr+0x2d8/0x854 arch/riscv/kvm/aia_imsic.c:958
  aia_set_attr+0x2ee/0x1726 arch/riscv/kvm/aia_device.c:354
  kvm_device_ioctl_attr virt/kvm/kvm_main.c:4744 [inline]
  kvm_device_ioctl+0x296/0x374 virt/kvm/kvm_main.c:4761
  vfs_ioctl fs/ioctl.c:51 [inline]
  ...

The fix adds a check to return -ENODEV if imsic_state is NULL and moves 
isel assignment after imsic_state NULL check.

Fixes: 5463091a51cfaa ("RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia_imsic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..bd7081e70036d 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -952,8 +952,10 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 	if (!vcpu)
 		return -ENODEV;
 
-	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
+	if (!imsic)
+		return -ENODEV;
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 
 	read_lock_irqsave(&imsic->vsfile_lock, flags);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
