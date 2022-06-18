Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEC3C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 00:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pvYsZBWAb3Twg7aVGzZWbMMlplV91YGMKks1b1odBsY=; b=F3k
	bIlsrv1Fb3aqZ/1wMH0sPZ8ziPcRZNHyW+e/6COCpTdrHatzDPxVYI8EpKFuNxyg+pm6QvrQJX3B7
	yhGEWSGPOO98IVODBHzmh3agfkb4x3RHri4FyE5IJ1OTuodFprqnKjMDqSwef2XsN2PvbPsc/+M9R
	fLqW04jL+Vv6MJZaLMxlo5Pe0UxjgKteom152o8k54XGHdZSSiTCHsV1JT0APUw1F0PDqR34g9BzG
	VgH5NqP7XiKQina+SdZZtImOCtCzb/jQb4ievfLFxUfExYtLmc92rGXngu8H88di0w+B9PXF0SRto
	BzPzum15FokQAB2RCRfuFhVfNgtPZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2M8Y-009k1Y-PR; Sat, 18 Jun 2022 00:16:26 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2M8V-009jzM-Ru
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 00:16:25 +0000
Received: by mail-pj1-x104a.google.com with SMTP id n15-20020a17090a394f00b001e66bb0fcefso3624213pjf.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 17:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=4HlwtKsrcUiP4ezxQu89E9aBkat4STQcCRUlQRJmlM4=;
        b=cqH7RwM35eUa9gSH23Vyp0IXD8rbHQ6iHBYjzqYB4r/ApR3GiB5irQq91CvaOTU2a/
         JbiD+lO3mhGF7Q9VF8Z+RL2N3kcJKkwfgbC11BxFaQhlTH5WcSxRdyy/VhMTgegBEuWE
         m0ICZIKBakq6kG4UrIJM1l7DZgPfrlXNTJzqVOW/b/BDjaQn7NZ1PZDqtivgtVVTA1vf
         J3LNa6ebna+9KeWC2sraxN7xZP7PZA5oz+Ft9ZxR6ro5zNG2FCSpgajvCr+Yw7sr0lRJ
         GloAY8IFUzs+m+0goppunIS/0Ln/zHmwSHJByc2TnvMQ/Qh39U6cvZifZQqRqYSCI5Ep
         Y1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=4HlwtKsrcUiP4ezxQu89E9aBkat4STQcCRUlQRJmlM4=;
        b=KWagtA7ZUG7CHeALa0KgstP2d3Ykujx8Jutu06oCbURChX9FM+/fKhEMuBBQHFeS0z
         Z3/XCsfOBdGLVzdxOLVxWilxNALRZjtkq7L996xR5XzbecjyiHSyALXVVawYMCon456s
         /GX7ccvswQzekC9R9b61uT3tc4CkPNUDmFHfwJZB5MT+qZLAtJ+JuUvdY+0cx6QX5LMO
         6ONtgN/XD0WBAoNjX3m4V9u1Q8zb8lpGLpqWeLH/o1K1qo7dYrcdY6ixpq2kx3i9TsEk
         6uI+CnWg3F88rs8jQDjEOe/FL0bLP1NN43HDUI1I8X2rVLDvXZ6iPPA4sIt36fS5oulC
         mEcg==
X-Gm-Message-State: AJIora+l+WqG22dNb8o9tPwO2AZX1eF/8QpC538DBuRg85u4ASlN3Lu7
	4+uOB1OODsZpNM2hHRqZ476T2+jIDgY=
X-Google-Smtp-Source: AGRyM1u0GdVPlx+Hq/yK0Jw2vZzxWWQDidlftHCsuvnSZKrmnfBPw9OaOWYf8QzYovkEUkJdLG9nTYZRGxE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:16d2:b0:522:81c0:a635 with SMTP id
 l18-20020a056a0016d200b0052281c0a635mr12877654pfc.0.1655511381838; Fri, 17
 Jun 2022 17:16:21 -0700 (PDT)
Date: Sat, 18 Jun 2022 00:16:15 +0000
Message-Id: <20220618001618.1840806-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH 0/3] KVM: selftests: Consolidate ucall code
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <drjones@redhat.com>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_171623_943653_E41D9053 
X-CRM114-Status: UNSURE (   7.24  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Consolidate the code for making and getting ucalls.  All architectures pass
the ucall struct via memory, so filling and copying the struct is 100%
generic.  The only per-arch code is sending and receiving the address of
said struct.

Tested on x86 and arm, compile tested on s390 and RISC-V.

Sean Christopherson (3):
  KVM: selftests: Consolidate common code for popuplating ucall struct
  KVM: selftests: Consolidate boilerplate code in get_ucall()
  KVM: selftest: Add __weak stubs for ucall_arch_(un)init()

 tools/testing/selftests/kvm/Makefile          |  1 +
 .../selftests/kvm/include/ucall_common.h      | 17 ++++++-
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 36 +++-----------
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 44 ++---------------
 tools/testing/selftests/kvm/lib/s390x/ucall.c | 41 ++--------------
 .../testing/selftests/kvm/lib/ucall_common.c  | 49 +++++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  | 41 ++--------------
 7 files changed, 87 insertions(+), 142 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c


base-commit: 8baacf67c76c560fed954ac972b63e6e59a6fba0
-- 
2.37.0.rc0.104.g0611611a94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
