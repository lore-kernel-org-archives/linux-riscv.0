Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D037C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fwPTawSpW1df3hnzx4ujr0ye1H7rvcKDtPlmu7V+HBo=; b=2z+V6OPY5MlpIycv/VReugpUZo
	j7/CLQVZNQZ8b/SHO9/aMQ8eCb5QB934jn5L3Df8z4XX605Ra+qiQ5/qcM+Djgg+V4/12qPP0oLKi
	0d9dOl3kKwRUHi5hYGxYwdujkG9EGoOWl4a0zco1A1GMYxNoG06EUiVsuL7FxRExwodyveMbi5qP1
	kp0Ryc/uAFEhKnXftgx3Fmkim6StNeGYMO8giysxyOAjsaVurwxccfQdvw3LY3rAwRI+zzRyPKT9+
	xEkJVZ376mH29YML6C20E3a+b3kjDWK1rjd6jJH03gy+HRlUnruRhYMZjX30/Rx9YMv5IOQKYH0YT
	3X1YU1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYvy-0000000GPb3-1acJ;
	Thu, 01 May 2025 18:46:58 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYiw-0000000GN3S-0GrX
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 18:33:32 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b1c122308dcso1422245a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124409; x=1746729209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=;
        b=pa3Lu9l++laFgtmYXmUZWk5wvThXijygfsfjEPacMinf19i3YZW2lxtT2Uh/YARy6P
         xAekJxx+7njnVSCjBhqLm/lIjPIDwL2oXoYOiGBpxE6nblOK3eJZ6X9jTxvYHzASJi4A
         ihWwq9yvkmPN53+F44LYROT4UobY3q54ntANt+Splke9RlDWxpUgeKBwVWUv7ROTmniM
         Q3ZYwHUPXy08amiZI1JlH6lNbRQ2U+JGL3PJhKKM9+rsMMbUw8rAAHdygFFu6zGV3LHG
         mIGyHOOKpLPnBtznuu6HTA0p8lNIN3fX4hu4HxR8zYnSmTizV5+BSrtbH7tFY1P/x66F
         IkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124409; x=1746729209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=;
        b=ls6RuECDuEPQk5iTdnnzIZsxOFRo0EGI7+DCA/bT0ayuplOuvOz4YEIFLXhIcgxZtM
         8RR/FGnUv8Bvw57HwzeAlR9cMycnSUu+MZPrvW2GObZtRCe0eKuZIPmXs+81IoMaouUE
         lWy6GJF0pNjUTV/P5/ysS49Mpc8Xt7UIkoDV0NzgzOd/zXWJVYRDCCC/SDo6o5oT3aT1
         v7rrqX+xeR01J4zCCmApRe9ww147WafjjjaUVhA5nGBVM0wTebHG4lf/jyAMqUHgsChH
         /3WCKyQIGNsm32CgFPLdQYd0/LhDOHxm+I+3Fmycf+KCuyFYxm6BA4OdpMQ9wIcv5ymq
         9mhg==
X-Forwarded-Encrypted: i=1; AJvYcCWgzRO9reM2dyBRU0P2II0xxv1gFGuai7gomOr7NU6767JflUR01DqROiY+5wjb6hmhfNlJ2F+/MJDg/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhNctSXrEY80KK726c1yoPziopa/kHBaPubZ4HN6nd3jymkHxF
	pxsK3LO0Hkyt3C7gaSJsCd/U/mimy41wqtakdf0S6rZ8PivzzoOVjvQDj5j3xG8sJGp7K+75ojJ
	/3yjGWcaeSQ==
X-Google-Smtp-Source: AGHT+IG7ZB54jjneYfe1tn18St+FGK/8C/RP49qADT4OdwlvOWaJA1tk/v3Dm4OeF0p3gO05OEVmZwLAOdDMmg==
X-Received: from pgct19.prod.google.com ([2002:a05:6a02:5293:b0:b1b:54f8:d2ee])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1587:b0:1f5:8262:2c0b with SMTP id adf61e73a8af0-20cde46dddemr28056637.2.1746124409090;
 Thu, 01 May 2025 11:33:29 -0700 (PDT)
Date: Thu,  1 May 2025 11:33:03 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-10-dmatlack@google.com>
Subject: [PATCH 09/10] KVM: selftests: Use s16 instead of int16_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113330_155075_E0816822 
X-CRM114-Status: GOOD (  12.82  )
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
index afbddb53ddd6..0f6d5c3e060c 100644
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
2.49.0.906.g1f30a19c02-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
