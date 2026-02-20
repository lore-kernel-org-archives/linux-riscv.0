Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2511C531F8
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 00:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0a3n+NhFXvzUR4ZMr2GCrJtC5C67ZmrG+zoiqewkIn0=; b=s3ifxk96YkhgaRwfomEO8WVmTB
	9uU6Wjvse180iv3/wub0XWw3tQ0mAbaUtyEeW3Ge2xiiAwsGT6DIXYkCrWLrqfgPTWYZERiNWuY4E
	99njbKn0QOxOreYFuN7TOhjIpczpgFl84vog3gNFu0vM7zJdXw7fUUgGiR+4M2FFGa1xJ1ZPnJ/dP
	ZYjxp4ejiH8yP4NM/lxCMwYFG8KfwAjcZEAyjSo+ikpK6aCTKttYovGLkqSQiwzK1kSI7mnkEKZYl
	ASy+6yprzsQpkKhzVrEORrZrWQSNHYJlYBAEYI77oO6JnaiyApzCN/LXTPhflLlqDFHBPcjafk/9S
	uUZ1zXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbr-0000000CmNS-41Cy;
	Fri, 20 Feb 2026 00:43:08 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEba-0000000Cm25-30y1
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a944e6336eso89637745ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Feb 2026 16:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771548170; x=1772152970; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEeICHjtMij91JM5H//TSYr8sTPe1JzhDMQCFWqYwXE=;
        b=Cq680MGXpSy2EtfcUdjXF3hTfvS0Ca/knDAJ+gDN3nIEaPWwm0VEY+C1quZ0mBpaSg
         KDrNCaNGCS84QzwPmfsUHfNIdRfy1Xck56QeNarhrql9nEsBesAj8JEFbntwKl0LBfyQ
         dFAagZzH35GuN/hlwkPcpThJazkORaOkg61yYyu/X+9JybkK44P1+w4xvDrpyW+reKen
         QkGEHPRNTxE7zRb/G5ljgv/QXJWMXt5fcTZ7TAzExReEpzIe8bvqqPt6Ak1YgchPcsy7
         CKm3Knjn8flKm9QrM7uez2B6VIKTX+pc5A0iKEaFtEEZIBWu3jqMRh4xBlfo3+JDTuAt
         FZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548170; x=1772152970;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEeICHjtMij91JM5H//TSYr8sTPe1JzhDMQCFWqYwXE=;
        b=LQ38Uu0+JOKhhdAJjeQUOKVs6r/HGVhY8k9c2e29cdyNLf69fwEqXpLnmsxXLS2G+W
         v8pKCyLUcfR/GrriLJAqehBJoJuRf5SWY5WQVZVcbp4dH29knvu705OQuoIfy+yF0YRv
         RKdck+aMq0UQHvJnn3/d3DgyGzYSpFCfvG+IgjlhaDJxrB27Aer0fTxE0noFQjfN9o7E
         h69sfRm/WhkB0CsBda7pkk/Orhrx1reHCdE+vv0btpkg7NJiLe0YNfI0vqPqBYKxudKg
         WCbXoPGZzb6VeT5uY21yQj0aeEz8JFKPPhSaDmBVQY6/a7D+B7KtOXHfaI1q3lfZ9muG
         tDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDrfSzicBzSekdHz5ZvJORLns9MxWnOYngjlpe0OPqOtumWNq17BNmH3tAECOxJG4RMCxivWQOymbtHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhSeqLXDEWe1VY3aChfb0rf7yXNz/Ulu+RqTA8gAfIYWrQu3eJ
	gaBttYdSBwviYc3Ax8ZzxEDOtHuvAUxFU0JnTg071UCSmBLZgNr/dpuYRfmgZsriCLqOCu8Rx40
	EW1BNg3lgWhjdZA==
X-Received: from pgja7.prod.google.com ([2002:a63:cd47:0:b0:c6e:28c3:dd4c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:493:b0:394:6208:6626 with SMTP id adf61e73a8af0-394fc2555e0mr6371053637.20.1771548169297;
 Thu, 19 Feb 2026 16:42:49 -0800 (PST)
Date: Fri, 20 Feb 2026 00:42:22 +0000
In-Reply-To: <20260220004223.4168331-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220004223.4168331-10-dmatlack@google.com>
Subject: [PATCH v2 09/10] KVM: selftests: Use s16 instead of int16_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Bibo Mao <maobibo@loongson.cn>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Colin Ian King <colin.i.king@gmail.com>, 
	David Hildenbrand <david@kernel.org>, David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164250_791200_3260492E 
X-CRM114-Status: GOOD (  13.07  )
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

Use s16 instead of int16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int16_t/s16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/lib/guest_sprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/guest_sprintf.c b/tools/testing/selftests/kvm/lib/guest_sprintf.c
index 8d60aa81e27e..2a3ab9c168f0 100644
--- a/tools/testing/selftests/kvm/lib/guest_sprintf.c
+++ b/tools/testing/selftests/kvm/lib/guest_sprintf.c
@@ -288,7 +288,7 @@ int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args)
 		else if (qualifier == 'h') {
 			num = (u16)va_arg(args, int);
 			if (flags & SIGN)
-				num = (int16_t)num;
+				num = (s16)num;
 		} else if (flags & SIGN)
 			num = va_arg(args, int);
 		else
-- 
2.53.0.414.gf7e9f6c205-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
