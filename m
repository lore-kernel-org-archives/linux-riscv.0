Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D878D6D24F
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 00:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1LAejmIzB8FltftG5Umdh/22wq4cYdUCWrmfv7MtJQ=; b=RFrDzob67AYYNd
	zkEmQM4l7YWQkaNPC/wQ2VkyNOuytFVdSmCzcDZQo2PyADDpqyPgbCKm5pMY1WT24rSXfEkhFZNXi
	bwuhYXgUpPPxksX0OUU5Mqrv9zY7EQf6qaWRxbn9Aizr5uiIZypX6uxJtF9PxWuAgNmsxNNGw8EIc
	Nt2VZmFAy0EkShrRrDxYyhy4Mle+dhPStxMeKBfHUyaxNO0gAIp1f4BzjEjuLZw6o2KZqWEL4tRT2
	rvEv5MpJgXBRAriDubAzZCAAfxsZ4VHCmsnGd1CcDh2MMpnJmIKYnCDlkjAfERg14ACpUS+g7JFO4
	/IRFNk3jcVQkDAhgx4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSss-0000000ENR1-3CMb;
	Thu, 28 Nov 2024 00:59:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp3-0000000ELp2-44wD
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:55:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ea5e1bbcb4so287155a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755357; x=1733360157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VnpBHLYkUch4fOHU4hkMVn/ClZoihkAVUxnB9ZaI9Pw=;
        b=uyZytIfV4tgcRS7pBUro4SJNyYzDfT8W5RYRcTPMrpSiPGNevTDuVIwB8vxQIPkGvV
         5QGQ1ysQfo4UkfAjnG7606jetHnd0D4Pv/zTCk71/VTpew0hTNCMdAMk4cyf4gDjvhiB
         lxJ6jOMHsr6UtIExwSOsk/Tr6PJh+XbK8m+VaWTNpRm+wzWfIGcaww4FEfEiO3L+g3ZN
         XF45TdVQpspTCo+QDa51A4CSu3QKYEdIkKEFwQ5g5oMcnCtJgem0SECpUJXbD6qvCxOh
         okRsgh6/1gIBVzThGGJTT+QKIzHdOzjKDvQMIPxIfP9APRxu1HGvYaauxdkvANfJG+qV
         MJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755357; x=1733360157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpBHLYkUch4fOHU4hkMVn/ClZoihkAVUxnB9ZaI9Pw=;
        b=WdB7GBeJoa4DhqfBgwEMeUrcJxYAyeMlJaITb+HMGZOPkF6ChqwQLJvpbup3cQordr
         6PvZ0MUzU5xgPbqLeP9GwgY8W887v51pfjn1IJtmSxRiGmz//lehhywdonzulC6oS/T8
         coE6j/I+0dpXobBfix0gEATUypeyoAz0PZVL+0+h9Uu8Uh/8WQBMUe3cz2w2Y8mYf0vy
         OmH2CQJcCxXhsIAnnIe/a2igCt1LPi+19dUd3Yt5gpdEzDzu7/I2q8o/YfkrMlZq2GV4
         UJx4Rpk+OByCF0AUd+TxuRvqSKDIUKqtIPIIGWqT6jiQfPcph7Rs4QbKSDorCwJPtrXb
         FQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXHDddTCjfpGhAHz1ZcV3jeXrtwNfIsnj8xxrdq8RxjE6yHeau1FL3PKDPs8yq9wklGQNtxBb6XRllKXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/0ACnNIFAE0TJgwsIyP7D3NGVKXhMIwWuYQCBoFNZSf0kHsFV
	WD7EETGagRKBxe0ePZOPB7yA6codwsMnjrHIGa4WRXj14wHtYR6pSc8JkXfu9G2pA6yc2nZjRYk
	cvA==
X-Google-Smtp-Source: AGHT+IGNjVu9IbM8M8x4FgAf0ptLY31wfGw0nWSewj8xLv7iHu7ExU2Pbfe7utzxkDM6gVPdI3CzS8OquPA=
X-Received: from pjbsc10.prod.google.com ([2002:a17:90b:510a:b0:2ea:d2de:f7ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fe06:b0:2ea:83a0:4798
 with SMTP id 98e67ed59e1d1-2ee08e9f0f7mr7211038a91.3.1732755357079; Wed, 27
 Nov 2024 16:55:57 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:35 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-5-seanjc@google.com>
Subject: [PATCH v4 04/16] KVM: selftests: Check for a potential unhandled
 exception iff KVM_RUN succeeded
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165558_009188_E8FF3F42 
X-CRM114-Status: UNSURE (   9.46  )
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

Don't check for an unhandled exception if KVM_RUN failed, e.g. if it
returned errno=EFAULT, as reporting unhandled exceptions is done via a
ucall, i.e. requires KVM_RUN to exit cleanly.  Theoretically, checking
for a ucall on a failed KVM_RUN could get a false positive, e.g. if there
were stale data in vcpu->run from a previous exit.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 480e3a40d197..33fefeb3ca44 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1648,7 +1648,8 @@ int _vcpu_run(struct kvm_vcpu *vcpu)
 		rc = __vcpu_run(vcpu);
 	} while (rc == -1 && errno == EINTR);
 
-	assert_on_unhandled_exception(vcpu);
+	if (!rc)
+		assert_on_unhandled_exception(vcpu);
 
 	return rc;
 }
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
