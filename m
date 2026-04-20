Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C83DF5A8C5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aQ1ohqWNsL6N6dHbrM95trlKnK4yFA0bhg9IVPi3P8=; b=gHO8MQgKLtNikI
	O42k+SWNLph95IRuoCkZst7N6FFo00JcBr7gvmAj8kyMzOBf5W0a99h3hOrVRDaIoLJ5bGCKFpCuQ
	w+Vqy5Rckjhj2sfQTqZA0R5U/i2CakZV/TPM38S6e8KgpOqo4rxB0u53g9E7kd9MWNGgmSwRg2cRA
	ZqLoC4XM3w2LSt7Qc8+eIZ/zua0/g9h4e+kLbayhU7V47Gp3Vb1yebhsSGrjhPEQ4V1vxQWeeulvq
	I5jEc1gEajmx5UdVriYJZATQZJ9AA87EbGgBkGt4OAdAX8pGIj6tkzVepaer55u9kh+QeBef11LYB
	lb2DrAmXGlhHQi8qQrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2u-00000007g56-0623;
	Mon, 20 Apr 2026 21:20:44 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2c-00000007fi3-04Oq
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:30 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so4309227b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720023; x=1777324823; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=U5TkYNL94NKu0U/OFCNswNWigEfxOEAkzVOSoJlSIOI=;
        b=DRTw94zdP/8GKW941hnQepgcQWjJ09qkn8LI3YW2pblAegS6FMt9w5Pm+6AvdrE4Jy
         tGB8UjfQocqTfk181ClVVO82JqQDTYS5YjhQjAJ/hL8EXL56FuHtwUnojddoWOqJe63+
         KYPp2TmbymhmwzKsx2aM5DtYMjihD1mwyT/8msSk1R8RnNISchNGBUE9aNp1T7fYuifr
         vMnQqTU2XEBewzRy8TJ01IxHqV1j/qptE027RoOeLHfEudzluGkSZShXCdn2u/ednit7
         I7PopQBqUJheSvpHybbd1GugilA4hymewtTIRps0YAPPw7Jxal5Qd4wd2497et7I/Rq5
         QJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720023; x=1777324823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5TkYNL94NKu0U/OFCNswNWigEfxOEAkzVOSoJlSIOI=;
        b=bJlLMmAoOWZ6ohEukI0Lup/nQpMpNNwLBA8POr3XMB7qFVKxN54bW19uLNjYsJHmlX
         Zv8QExxL1xJKzzJlCaVR9r72aQI3+oMWa7QmbFlLqqsqfvlr4ZQs5TfD75oKFGJdfK7P
         pjfolLW9CFraFt0LhQtajzIywEwiduAwHNZZ56cTEKlWoKvleD9hsxFIkwcEIC1Seh7b
         cJ4aPIQ7bpuOXleTo4KU5f17NamK/ZUJAjJqmcn91nQUhxmR0tyh+IfPey3clVlrsemj
         cO681VsAlwO1IFmVvvIjkiJXF2nm6nHVtPBVj9qtCOeYHzwUxXrpHTLylM6lUKOEcMIw
         h0rg==
X-Forwarded-Encrypted: i=1; AFNElJ/UDcl7OaeHYDG1S/ZJJivntlKLfBnWxQSuA6OY7CJ6P1P6qM396qE8qlTQO9iLny3uuP8nvB7l3+rhfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdjrCWQS2DZMQ7UQvGcIF60HxOnvh7sF/vZdB+MGkPAg+NhvyI
	puh4ZJG7ZSMd0KQnRjYzuUlRFlqtxhV1Oy0u3iZ32dMw4ULLHSxJSO/CldaEm7Z8Z9ySJqM2E8Y
	XjZu+kw==
X-Received: from pfve12.prod.google.com ([2002:a05:6a00:1a8c:b0:82f:6a57:a9aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc7:b0:82f:5051:f024
 with SMTP id d2e1a72fcca58-82f8c8ca07fmr16761487b3a.27.1776720023205; Mon, 20
 Apr 2026 14:20:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:54 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-10-seanjc@google.com>
Subject: [PATCH v3 09/19] KVM: selftests: Use s16 instead of int16_t
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142026_235685_C9557EB2 
X-CRM114-Status: GOOD (  12.73  )
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

From: David Matlack <dmatlack@google.com>

Use s16 instead of int16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int16_t/s16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
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
2.54.0.rc1.555.g9c883467ad-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
