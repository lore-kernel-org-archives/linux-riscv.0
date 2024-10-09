Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB77BCEE329
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z960NkzuKQqcy4XL0j50VyIq/ztKgQughUK5SrksAYY=; b=DkVMvgY1u25CG8
	K8E6YZTTjxrZymfqY69L3ZEa7xphoYrb5+X1OTb3A+ON+mg0xUqc6ZUWQk+q52NU3BHtmsPUg+m6p
	cty4ae1PcbJRNTVbYZve3vyt+KOY2iX7MI/+OEIBRhgzupRk/WQtfbOJO7vSYqVU2tO8U0g1DyIxh
	jjWufz5rHOc8sWy1RnvcezGPN2w0w/4+xnHpf0FRr2mSEjanQsOptI7hrtCfdUsmGUd1AkfHgIAao
	YPIvkpZ3/kzSjN7TR11BTZLi49o51j9vz3CBPb08ph4pl0YyenHl13RpbT0oXg9LMfG+ABYDsFsRu
	7uT/cA818WwSYThBZ3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ73-00000009qMm-29sl;
	Wed, 09 Oct 2024 16:00:33 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYww-00000009o5U-3ynK
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:09 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e0082c1dd0so146324387b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489005; x=1729093805; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dEQn+W1SexZcTNgUxAN0PCwUsSeaftCY9kaEGEXOiDc=;
        b=PeDvXC0stjaaefOm0bRWo7rE14SoW+zMm/98UgBURL7RN0liQBuFO25LPhHeRzOKJn
         IdPgDlHYlQHq60YAZcm+EnXxi63os+ZcWotYdrq8f2uIXJntyyus6YJnOK6mN4G1i6PY
         FMgCtoKTKlvVN03DGWxkj/30p54oJHoJBVew+0DXRv7uWrpydSdojrfj4vI0D513Ra+r
         12iU/iurqif3cHGz1sULpcFqekSzDr3REEMs4qQzM0IUnSGgVUOAE1AVGhtjy1sBPfRO
         TIuYf/gcwpD6fmx0PaSdd0uXksdbiMvdzdDOuahK/vzWzJeq/GRZQLSvRL4fNoz0r7oG
         Caxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489005; x=1729093805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEQn+W1SexZcTNgUxAN0PCwUsSeaftCY9kaEGEXOiDc=;
        b=DYlH1sg3PcV6q5vwQDnMldAv3b+ioPd7Fad7quU/fE7tUrf0c2fdwctwzPnOOUf+us
         Oqd7Y/o2XkUQXzc270/tTPgeky4hmX6upGBV1l8me81wOesBCb2mMl4gHWJq+uVNXVjx
         jX9/o33jfS5bI3YkHoocEXeRX40tXZXB6xQ/c1QfAsUGPDSd1Gy8thy2EO9nCp/S2CEU
         GG8RPOqum0rzOjIUoyb1JSlq73uK2PNApM/VmCMl5xxMsHvftOZ9Z1Kv+VfydVAXZbEn
         tieRz/gQAmY/o8psJwTm6JIayoHKikPyxJNKomHeRNLX2XM0bcJ93EYgYxdQlctbIWkd
         +mMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+uNpHN//b1u+Fww3OM0YWLfjgk0f/uUxufCHoWQzfLd4jZYSrDRkjcp4W3b/Wrwt/ju5tTxweZI3doA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi29J3IGE3aVVynbKXTjqXTqtZi6EOxRB//tSOEeeX2KlkxVc3
	hnjWtovk7Lqk1qV/u2H1FCyqX4iyH4k2cqgwDbqOJ2p3aUpykfEb++KyLbjESl87MfTxu4YxtWu
	5Cw==
X-Google-Smtp-Source: AGHT+IFrWalNmEyn72/5CXUVKhi80GHo8XaYDR+iQ/XjxOT9S8VfevqUwXplC0nvvzPPLclQ9b5vmaVf6gI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:cd84:0:b0:6e3:b08:92cb with SMTP id
 00721157ae682-6e321d4062cmr303877b3.0.1728489005619; Wed, 09 Oct 2024
 08:50:05 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:44 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-6-seanjc@google.com>
Subject: [PATCH v3 05/14] KVM: selftests: Check for a potential unhandled
 exception iff KVM_RUN succeeded
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085007_285757_321FF7A5 
X-CRM114-Status: GOOD (  10.37  )
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

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a2b7df5f1d39..6b3161a0990f 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1646,7 +1646,8 @@ int _vcpu_run(struct kvm_vcpu *vcpu)
 		rc = __vcpu_run(vcpu);
 	} while (rc == -1 && errno == EINTR);
 
-	assert_on_unhandled_exception(vcpu);
+	if (!rc)
+		assert_on_unhandled_exception(vcpu);
 
 	return rc;
 }
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
