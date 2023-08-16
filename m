Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8416BC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=prqRneChefyX5ZHlk87DyA01mGUahrnd38Q5IrZ+fEc=; b=bYzpdMMXneTB5t
	AwW3xbdqkaUZx8RPmNTQVRiLlwqa5KPzA9uq1+ugaiZa36PFNAgZ/rSXWULNJH4HVV5WxmbwuSebj
	MEEFfbqx/08ZHMdIB87dwGX7fPpdsDihNmTftsrr3AxUOVhKu1AsbdLGNcrgLuChOdFGkjrntZWzC
	Lfm+ULSIiWaGPjfu8TvggyBDYFOiMD+w7eN7wo/jqehpcbC8jGKDSO7djP+UY+rN+f6OKJxjzeqBy
	eRgr/vcU+H7BliaEPe5ggO0RrKjjb2xno+jVVDXRNffZ7rOYFIECCW8kWeS7Qd0ZA3HqVWidxPtWw
	sf/0eaXrdqWt49zFy3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrg-004XtX-19;
	Wed, 16 Aug 2023 15:55:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrc-004Xs2-2g
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:55:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68891000f34so547651b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692201306; x=1692806106;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOi+M2jL+PKYxu+UBEPFNG0R8GJtcmcVbN299uGH0IU=;
        b=C31hsaAynycu4FZqiQR1miWs/RjCQp392+ieey6uNgELkhJsUnYYyveEQAilldxotZ
         hEEFR3xPC/wKjM8JxeQGenKkj0XGe87CBpRjxEtmW9pq3zF7eyx2aYwkVdbvaKYgjvha
         dLwPzr8OMJj140JPcDU8bKhKyqNdGtRRqcLyHaFSBbtaS3BOYkLu15+X0CmxQG4av5HW
         F/W+fjEWOVstV1XKKMDD/wKcltjuU81Cv0jLSLFdPoADoaPGuX2SCjBz2c9kHDOBHH+P
         ZG/cbFNUJp10bC0N/R5MhuMRvpUmLMrD2tnlf4UJCopMYQtMFz23yk6DfyMd7VgwQNvH
         bXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692201306; x=1692806106;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOi+M2jL+PKYxu+UBEPFNG0R8GJtcmcVbN299uGH0IU=;
        b=YNJv+7R/Nhfuadiu+rgekL//bxdGX2iQN0V2O5K6TGtarqEhRPcaRNV1cS01Ufy/20
         aThLGFOuNAPQwMW2hszl3gwWQhfjOSrHm0DAnic0ha3bcHVyOtNFhD3wz/2+YAzru+td
         dZdUDgwiWyC4E0EmeteXuuf1c/2LmGVWZgwiovg0CLAtm4pZ0sT1iX2gPA+vE7EyEOWt
         Mrke1WnkcIpzu21eqWBhpbLh9Kq7ukMgG0vlC7LO7OpOHR422aRaWhWVuXU2onoF8Wax
         5W56G2nZSbvWb/M50K/zs+7H/oDpB1sp4tAQ1D0PZkghHTld0H808JbBLDzMMt+AdYtA
         mDuQ==
X-Gm-Message-State: AOJu0YztfVBHVPNrzSXZhQ/C4+7DJ6zyfZH7YqkwXkbeIXluQL3kWTbF
	Sc/Euan8UBgmUMrTiSUFEFUIZTc9iaO1mchk2Fxu+iI7q7Eu4VDavCLslYD1HPHeHpo4kLuFOOq
	eZGITN6rEFOXwY0cZzud1/3K5du/ClXMQxe2ak3O9ltv0kw8ey/UrpgAc+O6SL1f4VZ3sV+NyJA
	HR31fA9exefdNq
X-Google-Smtp-Source: AGHT+IEHUZ+l9Wkt3ZHTB22dMRutJAV99MqMJYelwA/XlPUKejilqlwCTtv4sKx9vgEu/fEGr+UxEg==
X-Received: by 2002:a05:6a20:9189:b0:13f:9b98:c416 with SMTP id v9-20020a056a20918900b0013f9b98c416mr2476667pzd.55.1692201306414;
        Wed, 16 Aug 2023 08:55:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b00565dd935938sm3025891pgo.85.2023.08.16.08.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 08:55:05 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v1, 0/3] riscv: fix ptrace and export VLENB
Date: Wed, 16 Aug 2023 15:54:47 +0000
Message-Id: <20230816155450.26200-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_085516_870057_FB99F983 
X-CRM114-Status: UNSURE (   9.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We add a vlenb field in Vector context and save it with the
riscv_vstate_save() macro. It should not cause performance regression as
VLENB is a design-time constant and is frequently used by hardware.
Also, adding this field into the __sc_riscv_v_state may benifit us on a
future compatibility issue becuse a hardware may have writable VLENB.

Adding and saving VLENB have an immediate benifit as it gives ptrace a
better view of the Vector extension and makes it possible to reconstruct
Vector register files from the dump without doing an additional csr read.

This patchset also sync the number of note types between us and gdb for
riscv to solve a conflicting note.

This is not an ABI break given that 6.5 has not been released yet.

The series is tested on a virt QEMU by verifying VLENB is saved in
ptrace, coredump, and signal stack.

[1] https://sourceware.org/pipermail/gdb-patches/2023-August/201492.html

Andy Chiu (2):
  RISC-V: vector: export VLENB csr in __sc_riscv_v_state
  RISC-V: Add ptrace support for vectors

Palmer Dabbelt (1):
  RISC-V: Remove ptrace support for vectors

 arch/riscv/include/asm/vector.h      | 3 ++-
 arch/riscv/include/uapi/asm/ptrace.h | 1 +
 include/uapi/linux/elf.h             | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
