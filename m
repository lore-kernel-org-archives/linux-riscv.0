Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2776DC5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BjrgXdTAY8IoIaE9W3zkcNJGfbskJk0QRa1F8BwgN1M=; b=XE20oVECf+5gLG
	BBub61INcciXLrERrfZveY5Z9qGi9AmXnVe0eZzhX6ikLm2AxdhgqN+tyCC6sQ3J4QvznszKNtbue
	fG3wY8XelMy0Y3pYNpR7OzT5Vag7J/lqk6AcqirKvopeKEUMPYdEz6lyBmqOT/7aHGX0DdAW1Ny6k
	on5tGTzBLchsBZMz1uBXN7tMJWjtbG3b00X0hvWrc93wiVa5qPxzGE33kAP9S2o23XbSgP9TREBAh
	wNnT+Oc+iqg3iG4jiQlckDH6fdT3g5/y/Zvbefl2hwoCWFldI5cxwh4Q9alUDhsygobfNssKcjPMH
	Nzp2jPY+QIDUYUPodoCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdZ-0000000DSVx-3ZGi;
	Fri, 21 Aug 2026 13:50:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdY-0000000DSUR-1OHj
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FxYBqvqfSfMLOK6E3WTT29SXyr6Pc7OT1nYn+VS1dSk=;
	b=h7Az0ERjGvD8Ze87dgy71X7EPhHASdJaNkbKAO965gGQ3CGriTX/JkOjjc2ebhUZ3dMoVm
	h78sQ8IoQR6POxMCQGgkdFoMDB1ioobcVLiVzWMg7I/iYUGESdOC3a+ibRWjbQ18gQGfpJ
	CbM8d0c/kvkSWIH1QR9RG41q2Dljvew=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-bPFLi7GlNxaxMfkzTupfnA-1; Fri, 21 Aug 2026 09:50:15 -0400
X-MC-Unique: bPFLi7GlNxaxMfkzTupfnA-1
X-Mimecast-MFC-AGG-ID: bPFLi7GlNxaxMfkzTupfnA_1787320214
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1852469a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 06:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320214; x=1787925014;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FxYBqvqfSfMLOK6E3WTT29SXyr6Pc7OT1nYn+VS1dSk=;
        b=J8n8YL8ZafRRAOUKjiTWWDIBdNQz+ET2nQizHsAU50926k4ee7rbNIEJYh9xL64v1z
         i32rat3TD0x2GdbEU0ibVb2dKGi6xvz+z6j13nftBcdSMHH1nX7eNtMqx6enk1Vu757U
         TAbO2HO3WWkjSp3Qf9uBBncMfl5hBzT8BxOBzO12gbhuWk7XGqcNczapHATZFpF9A13B
         RiG7tXtGvgvUWWm1mNVNCddezDNpgI9y0MHmrWj/wK4bj/U1emCNinXKQhK/WXLYTq38
         568ipvSwfdb+H3PtYLBOXQT+xxssaKqyibiuDuMlyosW7LfkJqNXbOBjy1kAxwvvRLfS
         Ifmw==
X-Forwarded-Encrypted: i=1; AHgh+RqdovKCQdVlr2SzglEztxLdjX2g48PklXtBKJKTebMo0sQ8TzQYizAXBUeMd1KqyEIypQYQNQROjkJO0A==@lists.infradead.org
X-Gm-Message-State: AFuF++krBPDOWxM81AvRxwe5kQ92N188lWxcXpMHHYBA/pI6adCpiHss
	WEwtkiO1YIFoITQAfKEnR+N+YhhmJma4wYuGgQA59Zs32xYGkhp/gauuYzG0hd+YJVIxoFJY2fR
	qfQFcahsCLRklBjsd1MV9OdZmCdqsw8W8E4vf2pkqTy98+HtaWmpXd9hz6NFSIARLGL3aEA==
X-Gm-Gg: AR+sD13pIRAZcUXJPLdTHf6csrbhKKcJvITdFxw219SOEbHGR/lLCLM4Lc3L3W8uDx0
	wRGJ+cKOnSKz6lw16eKYxtT5Bt0UTJesKa+eAGm+N3SD4hHVyzNruOv5IiNFpCdwvL2OwULXkX7
	y+GBiONQUJ2PeP7ooNgmsQleWoN/+CXNJYO3gUd3DHFPm/ENUfPMES/bEcGmh1tkUscILd9h5Ml
	DvJ6HFPLXGUxnGAfSII6qJpHtQv6JIhglrRyZs4p3cG/yhV3F7XNzdTJHhlTjut1EP6e3itGhPR
	hCAW46uof59Aj6URP90TmyLRiSX3N71NEuI/nFk0ark+4xhLw95zZODFMMgTq0R72rUCT55bvzT
	ApEfETJxmu6F+2vVTkEiOwFrpVbgF4o/y
X-Received: by 2002:a17:90b:3ecc:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-395c2f9fa9bmr10834155a91.0.1787320213436;
        Fri, 21 Aug 2026 06:50:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecc:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-395c2f9fa9bmr10834046a91.0.1787320212881;
        Fri, 21 Aug 2026 06:50:12 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:12 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: [PATCH v3 0/2] kexec: fix probe error codes and error propagation
Date: Fri, 21 Aug 2026 19:19:56 +0530
Message-Id: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBQFf4V0bU0fYq0r/8O4gPZWrpFCWmwkh
 H+X4gYTl5OcmTORCAEhknMxkQAJI3Z+AbkriGkqfweKdmEimDiyE5e07fFZeRypczUzRgsjuST
 LvA/g8L2mrrcvx1f9ADNkPy8ajEMXxvUr8bz7k02ccqqUsgfLQDKnLgFsUw1707Ukd5PYmnpjC
 sqoLkELDRYYlD/mPM8fdp454+0AAAA=
X-Change-ID: 20260813-mpilaniy-ffb0cc92c313
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
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>, 
 Bradley Morgan <include@grrlz.net>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CXCStXEuHcVVQGhiZlfCmxMD_kPnVQG8ZjWuGh4b0hE_1787320214
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065024_438621_035C9437 
X-CRM114-Status: GOOD (  13.57  )
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

While debugging a misleading error on s390x where kexec -s reported
"syscall kexec_file_load not available" instead of the actual EINVAL
from a kernel command line that exceeded the architecture limit, we
found that some kexec image probe functions return -EINVAL instead of
-ENOEXEC for format mismatches, and kexec_image_probe_default() has a
bug where it returns whatever the last loader returned rather than
always returning -ENOEXEC when no loader matches.

Patch 1 fixes all probe functions to return -ENOEXEC when they do not
recognize the image format.

Patch 2 fixes kexec_image_probe_default() to distinguish format
mismatches (-ENOEXEC) from real errors (e.g. -ENOMEM), propagating
real errors immediately and only continuing to the next loader on
-ENOEXEC.

kexec-tools patch:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
Changes in v3:
- Patch 2: rename ret to err and change ret == 0 to !err as suggested by Mike.
- Link to v2: https://patch.msgid.link/20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com

Changes in v2:
- Added patch 2 to fix error propagation in kexec_image_probe_default(),
  as suggested by Pratyush Yadav.
- Link to v1: https://patch.msgid.link/20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com

To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <baoquan.he@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
To: Philipp Rudo <prudo@redhat.com>
To: Tao Liu <ltao@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Cc: kexec@lists.infradead.org

---
Mukesh Pilaniya (2):
      kexec: return -ENOEXEC from image probe functions on mismatch
      kexec: fix error propagation in kexec_image_probe_default()

 arch/arm64/kernel/kexec_image.c   |  4 ++--
 arch/loongarch/kernel/kexec_efi.c |  4 ++--
 arch/riscv/kernel/kexec_image.c   |  4 ++--
 kernel/kexec_elf.c                |  4 ++--
 kernel/kexec_file.c               | 12 +++++++-----
 5 files changed, 15 insertions(+), 13 deletions(-)
---
base-commit: dd8c49a14f169d58e7a07a2c96fb588f3456efa0
change-id: 20260813-mpilaniy-ffb0cc92c313

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
