Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCBEE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUKWZ5Vbcst6KJCy0MKOvRVa1bz56FOtQZW01709qSI=; b=s9/ZWx3HLpRNNX
	VzYgCjI68GTaZ3CZVlJWu0guu992JaEQM/iGD8qa5hdItTgpE6XsCePjd2lWuMfRAPPOszsiJhqqJ
	tK42sXVUqMVu3edrvQ6U9/iuSiauVBzJeWKpyCyakNXj/G569DFw4LWmFToeJgre1HalZGx88xFqL
	/Cpoqzf8sfZ2i7yFZsyXQ0pjP0PfBiqUIR275PDu6mCaQmhI/Sq3AGXB5+Bma6aHUTLNcOKz0K6fe
	4DsqOrrtQTFPzZZdfZUGQjdeWYCkO3kcnINKPFcdLxWzRnB7JELhIVJPIt+w/zpCUngNNmHBoAZZb
	gJ/q8YcABHyN0mJiO9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUH6-0000000Az8T-1hnz;
	Wed, 11 Sep 2024 20:49:16 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAa-0000000Awyo-2UPn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:33 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6d4bd76f5a8so15031327b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087351; x=1726692151; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQRYVtp40gN2JN3r5ECO8yPdv4xFpWyP5ZtXJGFNMpg=;
        b=AQ+GzP7rN/3Izlc4lHJVwHhAu3B8+O2fPEVnH8UkWEHyiIxHqGXwY4EuloAc+13kQA
         tyNG8Rd7LAYiG9/bIcC7aXkUhBl9lbk/LXFVL2hZh0VMTAPkLaLfhf5qhHbK2TngpgQ+
         BRYcFvNxMsDm3qpPobRwrLj5bGSdzq1ugGoOGXoeJARFBt5l5lWQw+uW8n/2AQWJkXUq
         7N3m8pyxkpuwWIXBcYUAYCvILr9SBgVRN263QNRrI7LY+Z8S56VwcnhFP77xrOsjFHCr
         jGACSWTL9+fYe4EwE4QVgIXasF+dQKS7eJhiIKJ8HOSw1ZR8euVlTPqOpCkf62UZ2BRO
         AhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087351; x=1726692151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQRYVtp40gN2JN3r5ECO8yPdv4xFpWyP5ZtXJGFNMpg=;
        b=L5AnXRxdJQ/7jA3VvCitrDUTtMRHNfAAGLpsz3HDAkwGHm03bT0q8kuCR53FxoCkCH
         fuq+ymVmsZk9YXIoyOqNXW2D8UVT8KD+xXkAreJN9F78KPfN6SK2ABuEJikZ/oMP4HTi
         SdF+E5N/k3E4VullN+ncYiRjPyOAGEhNYKPBswoFANYVZAapjBx6XhGMg5dj5Uvif9Cw
         OpZa5F7s9Uvf2G6LluZvW+OsNu5JzmvkRCe+FE4hbEFR+DhWYAFDE4SFbdhTwp7bxijg
         UfQ2wMkO27u6Di4cCVhtI797uHrtk7IdhSwEc/RwworxX1i+o4fHPisOLAdoQe+DmMkg
         u+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAjUtemq7c9Lv+NmSYyVMOd410CCUp6GYx4JyiTyTS0+it4XWxK9uPdmk1OkUb4req1HXwlNOjsv453w==@lists.infradead.org
X-Gm-Message-State: AOJu0YycOYeMFrj2dFI7NmOI0mqvMKKOMmFSwQCWVDgZaSpP9YhFc598
	Dnf47MRKDYl1OuYtvreu+aIjOSUa0qa0UkapRTVtE1zOtjhef4oTqjSRYgoda1ELPAAXoViCXnj
	akg==
X-Google-Smtp-Source: AGHT+IH8ZQwfCbzagdZgU+EpISSX/A630EuGAq7pLp9hJDXsMNgEZzJ88I5801BwyQ8RRGJvBOpit5rNgP4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c711:0:b0:e0b:af9b:fb79 with SMTP id
 3f1490d57ef6-e1d9dbc1dc5mr2910276.3.1726087350958; Wed, 11 Sep 2024 13:42:30
 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:50 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-6-seanjc@google.com>
Subject: [PATCH v2 05/13] KVM: selftests: Check for a potential unhandled
 exception iff KVM_RUN succeeded
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134232_703923_9A702E69 
X-CRM114-Status: GOOD (  10.12  )
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

Don't check for an unhandled exception if KVM_RUN failed, e.g. if it
returned errno=EFAULT, as reporting unhandled exceptions is done via a
ucall, i.e. requires KVM_RUN to exit cleanly.  Theoretically, checking
for a ucall on a failed KVM_RUN could get a false positive, e.g. if there
were stale data in vcpu->run from a previous exit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 56b170b725b3..0e25011d9b51 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1719,7 +1719,8 @@ int _vcpu_run(struct kvm_vcpu *vcpu)
 		rc = __vcpu_run(vcpu);
 	} while (rc == -1 && errno == EINTR);
 
-	assert_on_unhandled_exception(vcpu);
+	if (!rc)
+		assert_on_unhandled_exception(vcpu);
 
 	return rc;
 }
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
