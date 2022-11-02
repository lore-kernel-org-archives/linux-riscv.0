Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9D7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaGz8pSxBAvQSKAojsK3u83UH7EDruWrUNtNmysaGW0=; b=v79eON28eclB84
	8rVwqBw4kq2rGZ6YegA2zq5OPdP3xTr6D2+pb5FcFFvCbsIUwWVolZaZ72pifV4GUnHVseCSEPTZQ
	aqV9a6yqNnqi71SNO5Th+DXdjIjenztm1VZabi/Z/b6ZshCdcawNjvxVCPkiLl9gwd0Z2WXccBtPH
	2nHjUhDDLP0KD+QMJSKFjXvNMgKAWUyubeWUL5l2obPQzv59q5+4MKxhRGqXyMblKWKL04zpw1mpn
	wi6NgYBL2yhqNh7jqSrQ+PeVG5m0bZAeh1XtDFolZGY855CvAye4L39QUIMNjz+lEK3BEdUEEiGoy
	Lm/2mzvLwlxhVo8wKwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqOEn-00FNI5-QP; Thu, 03 Nov 2022 00:37:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO6D-00FJ6v-Ht
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2jZZfFf52GmkjzF4UkJBFUQx8TRwCaNEoxRzKdccz/c=; b=SR+XbmSaZDkQetMky1SHW5uONn
	N7JMwG5FUv5ut7IVneQcsYRv3I2Huc5HzZQzxCGgGDA1OQA4cantWWEs3USGE3Qw+dKhjhrpEYMfT
	GSOx4dpRX6wXsffwpTxWLK15YPDYpZZRFFsAlXltdm9RvrfZ5vDs67WUgq7JtaCjMabsAiY72kN9L
	DVzm8exZEJ+t12+S+Rglxpkt2fJQsaoYZcRovlkNDQ74jJWLaFj815HPr0cKELZbLgbIAZI51YqCI
	BN+iA+yjCwxuHacnVPOuEJxeT2j0wpzZYZYA4rhhmO7bi/hgEq/P0aHdqtswDa3rB/NopXOnJN2gk
	1HDGtnrw==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN16-008Wst-13
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id q10-20020a170902f34a00b00186c5448b01so239302ple.4
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2jZZfFf52GmkjzF4UkJBFUQx8TRwCaNEoxRzKdccz/c=;
        b=eS+ADSAUDBr+3HDHnDb3Fr9sF+Jb8/UT2oH309j3Rm/86ObG6TRCn9IyhpjUkKBdpE
         kcCNHyv3vwGiHYQRvOqDpsz+Ka9M2XEJCdBD1BDMQE+yHelvK5eIZBtBOFMFVOay6VLL
         HRD1UaccDMN8QRmrJzaFGA2kakGK5P4xJGBM94BuLtDJAAqDK7hBLTZ7oOdfic4lXqK4
         Fr39ZfZInLrcHKiM8fxmsZrdE64FtenP1A0FKcDrTDJZkpQ1QUJo1/Y5EttLt8eZYz9U
         +9QTVq6+Q+Y4pZ8EkuhDPhDFtAlj3OJomhnuiK5WjSAlU9kpBh9BdzMjPScyheuXuiwK
         D0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jZZfFf52GmkjzF4UkJBFUQx8TRwCaNEoxRzKdccz/c=;
        b=WKGMf/UF+o+seWMb22lSCPXf5kkVi8KniPESNaraYkfj0NB/TWuapIZNmI58Kuge35
         IfeCfBdeD8mAxAOg1Ne7DzIkaMgh6CtPMrcK9MNnVQAgYs94oufdkKKyleNMGNoojwU1
         /v6A6FwlfzT2cTUlxTWGDVkHY50IzvWWOdnrA94+Ncqr1iQoXDLwtSDjloy2Eg8U16bk
         elw68/R7DVH4zHuCbFpDg2XolSMrRoWvRLy5t0Sn0f0haefw1FPbUXcj6fP+TxmL7JaF
         NvjE7q7Iqg/4Dr9h4JPdEaq7vJXbr+CJexEZPdDAoGhK7GT6jfpJYnOGYzfsGN3yaZrk
         Oyow==
X-Gm-Message-State: ACrzQf1KXOvxk+YiRinFjiSvIHmxyBc9sQ7qKok+jkS1PAqbbHsT1s5g
	jg3JLZ6tMJ1XcOgjFLymiB3BdTMj7SE=
X-Google-Smtp-Source: AMsMyM6vYYJQBYlQiDcX1wj97hZ9g1pk+rDBzdLxVoyiEkvTNhgYg+UmvFixquw/EG51V/dsQ+i+Sr9IedQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e7c5:b0:213:b7d8:1c4c with SMTP id
 kb5-20020a17090ae7c500b00213b7d81c4cmr25473196pjb.114.1667431166266; Wed, 02
 Nov 2022 16:19:26 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:34 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-8-seanjc@google.com>
Subject: [PATCH 07/44] KVM: x86: Do timer initialization after XCR0 configuration
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_231928_503079_4AEA34A9 
X-CRM114-Status: GOOD (  11.44  )
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

Move kvm_arch_init()'s call to kvm_timer_init() down a few lines below
the XCR0 configuration code.  A future patch will move hardware setup
into kvm_arch_init() and slot in vendor hardware setup before the call
to kvm_timer_init() so that timer initialization (among other stuff)
doesn't need to be unwound if vendor setup fails.  XCR0 setup on the
other hand needs to happen before vendor hardware setup.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cd9eb13e2ed7..9a7702b1c563 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9320,13 +9320,13 @@ int kvm_arch_init(void *opaque)
 	if (r)
 		goto out_free_percpu;
 
-	kvm_timer_init();
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
 	}
 
+	kvm_timer_init();
+
 	if (pi_inject_timer == -1)
 		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
 #ifdef CONFIG_X86_64
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
