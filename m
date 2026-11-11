Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E17606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VgLAPT4e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DB8Fnq5a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=IYwr1vG2fBXxYIsKUyWRbXikVjNXUc+r0r8bGZ+Rs9g=; b=VgLAPT4eVIcmD/FZfL1BPgDsbq
	bN5g9TRc/T4VRJ5BwxXAWwj+7LJR2hKvke06ORulVejV3vmk4/jEFSsm7ByWYmCMZDfoUfMicLXZ7
	IxF8aEil9wBwIfIEYZqE0qV8cQpiVJVFcQTiN94v8VntBHqePwQzft/mAukUpg/vniFtRp6ZG5wNK
	7HPKG23jzIEgb+GHq2wpyD7cA0dWx2z13mDcOIwqzhZXltuCV8gJHuC8OI3A1oOwpW80Ycl40fsbg
	oOUffDMf8Be8W9vjM4RsnAXWTJDicyuDzUKNvaYvi+fJj/0BD6UTLAMMmSywmeI1pxNxFxmzwLVMN
	XyyiEzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQq-00000007E47-3dg4;
	Wed, 11 Nov 2026 16:44:20 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQj-00000007Dzb-2SHs
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:16 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b582b355eeso3260184a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 08:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415450; x=1795020250; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=33GnvVNS774ak2dciyIkniSnSscVQNqOqLxBH8INFWA=;
        b=DB8Fnq5aTxuyzAlVJA1y1cl3iRpU1qvM8WBkKqRwUb9/26OofSXv9a0KsocUCOCD9E
         yH7ArgGyCd6mySi0S7QEdNCLDLwrn7u13RmPLWc/kWmppiBOj+qaOEpwzNjzkpOMMGvJ
         ilMRRWE1aenMn7rVsOaotQ5KKAac+zDPgNJUPVKUrB70uCQQnWzCeuek8hh3wvMZi69p
         +I0X0sex+mOLFNVljq1TH4E5JYhQLDWtwBoJ8JVrTlM3eSZeqaIv2YhThGpPYVR7DzCK
         db/wqI7IiE88gC7NOrDTO4PIJpaLb3QR+0PuDEchnssftHLDDtsS0DXU7MFzT7OsVDhF
         dSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415450; x=1795020250;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33GnvVNS774ak2dciyIkniSnSscVQNqOqLxBH8INFWA=;
        b=139zBKiQ3N2/UbnUtewAvG9VHVw8ckDOvZKyIsO4Upb6/6cnkmAt67TrCPeium9qwe
         UPf5O1+YFPbNl0g14pVwVas9C4asKNg622kXYNTulTRHcKFc+yUhwHFXN7rMmxMDTkHE
         czqzkgNHGipgb+86uiUifoKoCXfgqHfXM59U++I+Qays8aaVN1o5jqMaTvdQbOwL3Zhq
         b77ebqNxhQBjzEH/o2/B0gkDW72IFFSXTt/P4ihBHedUPMaoZ+ezjEi65SWFmQ+0JPC2
         HU+kuuMBwJjtE7jJ8PBQUaaLAKsakS4zukKKu35tpnFL4xumFj+rAiEjsLeaigR45POn
         kIBg==
X-Forwarded-Encrypted: i=1; AL+hErFnNYD5gEJ0P1+DKHZrpLMn+J6XqgDTTHfbJEWFq/9mqoSjybn9SiOQ8go5rLFgLcMH+xnu5cZWiP6NqA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/XHJlTzlScaUZInfRccSK5HgrtoiyhkC22b0ijWuh6/RiqbeMM
	lTyCqMCcAHIq/A/RfdReg+yOR3FxNrGbR2E2ACRGPoURHn0BT32qGr2t1iRQHxzIFh3bX98C0w=
	=
X-Received: from edyu19.prod.google.com ([2002:a05:6402:7d3:b0:6b5:6704:1178])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:210d:b0:6b4:86e1:cc67
 with SMTP id 4fb4d7f45d1cf-6b77780f558mr2265842a12.27.1794415450064; Wed, 11
 Nov 2026 08:44:10 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:46 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=ardb@kernel.org;
 h=from:subject; bh=QBNhN0Zdfm2xqf1Y020036BvrcSqB4Acy4H1DPuTpLQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbKcLcqdbcxeYz48q2B+ySOt+8nmjSo/jmzV7Hv9kM
 jki3VLaUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbiIcvI0Km3MsTeK4L9j2QY
 b0pVSeTuDcI1AT8k78wqD+l56y6yiZFhwkuX9e/vrLdep1ctc/Z5ssnzGKM//kE1h5a/fRFQzLe VCwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-5-ardb+git@google.com>
Subject: [PATCH 0/3] riscv: Align section markers with other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084413_624460_B41289D1 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Patch #3 of this series was sent out as part of a EFI series [0] that
implements generic support for carrying image info data inside the stub,
and after Sashiko found another related issue, I decided to break it out
into this series. IOW, patch #3 is a resend.

The point of these changes is to harmonize all architectures that
support EFI in terms of the section markers, so that generic zboot code
can refer to them without arch specific #ifdefs. Other generic tools
probably benefit from this too. 

If the maintainers are onboard with this, kindly put it on a stable
topic branch so I can refer to it from the EFI tree.

[0] https://lore.kernel.org/all/20261110121731.2728824-12-ardb+git@google.com/

Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org

Ard Biesheuvel (3):
  riscv: Use _stext not _text to denote the start of kernel code
  riscv: Make _text point to the start of the kernel image
  riscv: Rename __init_text_end to __inittext_end like other archs

 arch/riscv/include/asm/sections.h         | 2 +-
 arch/riscv/kernel/image-vars.h            | 2 +-
 arch/riscv/kernel/setup.c                 | 2 +-
 arch/riscv/kernel/vmlinux.lds.S           | 6 +++---
 drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
