Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED08C5DF88
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=30I555pJ9zEfXas4+ixjVStRCIvWpfY8K8TzdmbDfeA=; b=TA57u/ZH5yjSUR
	C8AGj+bSaYo7EXaWTA+lzsU4M+UxlR3gie9vbpP6HOeQlS2WWw/JGbyfVDpBWgcc9MVNjlA+uOijL
	uLZBdK533RU9VVogWay6ZgPlxppWLxuH/yZEMQiZDXb563ul59Qi6N5WJ+j1dgiVkny5EJcFBKkMi
	6TaTxuYhyZ9x3ajfkAvxO8/ZlxoditPOyhr/ttlvzKlSeWWv0hAS7rIHryGI83htsIYJqqD/ugfuC
	vi8dSE7jUUfSZlyMu3Rm1vnw2QxXEsAaQjpFV93ImGjfWETt1FNvM8eu3VH7lPn6upj1781lDyFyH
	0Sw3b/uE7/tOMFvUHfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOC-0000000AIvG-1U3h;
	Wed, 19 Aug 2026 17:47:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkO5-0000000AIti-0Xt4
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 17:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3rl9WRlfF1qhC6KkWtM+soeUVUGORv4VBrHtcu1jow0=;
	b=NzAzb9vgGfvt4oY7L0XCnjwotqC40OkSgE+cxBakWlk4EwMkRVYMn6J7/x7fatJlGHILsn
	LQ328hkz6uDGTqWo5MAcXTA8bfhdbStOEHG7EhA7ogXwZ1igj7TqP5pGOkDDDofRPmseFb
	8QYj95cieCn/SbeBH10Jlj9vewNf34I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-yKpuYmSSN6COzlRdn4DZaw-1; Wed, 19 Aug 2026 13:47:38 -0400
X-MC-Unique: yKpuYmSSN6COzlRdn4DZaw-1
X-Mimecast-MFC-AGG-ID: yKpuYmSSN6COzlRdn4DZaw_1787161657
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3351681a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 10:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161657; x=1787766457;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3rl9WRlfF1qhC6KkWtM+soeUVUGORv4VBrHtcu1jow0=;
        b=EpD1hklwMy02gaMK6zwP199O3+eFB8hp7QjGNAxA0Q8nTq4WrMAqjD1PdqGKl5hkg0
         3FMyqNSe/TbcG3H8JezsnYnhZN21hbU9bBC/rdsQMOzXHvWLUvGiX9Jz2U0HucCLEf4o
         bfi/GaH4AVsrSd/I7F9SSo856t753DnUDpWrdl55V41OyvFOAVKL6O3NzwxEK0Y4S+KH
         JsT9A5f0b5FcgTeiUbgH7HJHmVOkm0eQruSvRk8V/r0z7BEttStFcuiXhqlUe1cBS8Wp
         IdiCQeYgVTlsTapWlTHehuMMUTMyasWiDJvM0l2h75c28jdoHeTcqQt87MGMPMqu9FCz
         J8ag==
X-Forwarded-Encrypted: i=1; AHgh+RpSpc98PVtGE5/ksSR1B145vHnwMFLQWye2dzYdS3PCMdO8RF/CDftICA1W9cwLH4mSDIieJq/uXLWdvg==@lists.infradead.org
X-Gm-Message-State: AFuF++kak3zDdj/KoJjo9Lwgp0a9nM8jjdY7WHl09y7H4Tl8YyauJqQU
	uWXKAruQnx8y/YdE7DBuaHYmpd5S9BKfoe1VDzI17mkxX4EInSm8ePj1jt5zlPEuSXlh6uhfzhz
	A3ee1zRkv9De1UB0UZrjbqrzqkDPiKR5BWnLEKE3s9EdFW4ipAsWKCJWBa7HqjnFoZRwLvA==
X-Gm-Gg: AR+sD11QnV8vm/Tqba3LI4c3ePwStz/nrvxzVALrLU4fhj7pg3GyhNYalp37L6XL21Q
	3YPmS1LhIdIipGoZCHjywsVdxT41/8e8dsvyO9kxyHz72XPNdKP1JZWnh5Dat6TSdIFDSKcaWVX
	rPfl6gQTcLEnkB3SfpQvr4F0afYSp5eH2e3V/8FxsskFbZhvYWJomlxXulzMUwmzqFWGz46J4Xm
	T18io31aPHR1PeQAw2QmhPVezzXUxt5HFlVYvZkG+EHyO8ySib70pH2WxbZb5vpJ4I4ammBjOMm
	q57ynPyIcq+1FJgYlDhDHAx6kaSnVIlPsyiR0uMG3b5afBJ7Qdli6dC6wfsdcEqJc6Oq7raatIP
	lOCE+94YZexgTukIhHFPvuVos0yt8yIM+
X-Received: by 2002:a17:90b:5289:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39580aa5d7cmr13092135a91.6.1787161656964;
        Wed, 19 Aug 2026 10:47:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5289:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39580aa5d7cmr13092025a91.6.1787161656348;
        Wed, 19 Aug 2026 10:47:36 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:35 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: [PATCH v2 0/2] kexec: fix probe error codes and error propagation
Date: Wed, 19 Aug 2026 23:17:21 +0530
Message-Id: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2po+jFVX/IdhAe3UjhFKWmwkp
 P8u4NblSc49d4GEkTDBrVogYqZEYVhBHiowvh0eyMiuDJLLM78IxfqRXu1AM3Ou48ZcpVFCwaq
 PER199tS9+XF6d08007bfDE9pCnHev7LYvD/ZLJhgWmt7shwVd7qOaH07HU3ooSmlfAFPzfzOs
 wAAAA==
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
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k_DnpFJVLJOqbLEDgoEWzq8xk5Y4KP2jk7K5mc0JB6c_1787161657
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104743_772700_0CB7AD1D 
X-CRM114-Status: GOOD (  13.83  )
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
