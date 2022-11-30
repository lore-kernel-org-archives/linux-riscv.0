Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2980CC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqVT6BaDmRZgK2xE8yvcAGr57SMvfngG261t0YiN+Ls=; b=xx9X1KnGfo7NW2
	qfAwiM7Dx2SHnn84W7cz5rmI/z3wpRkInuB8cMHLs0eaUDyqEwx7wIuSBn2mI4tAJpSQj/WB28lVy
	7/5xt3tyGUMdM1y02thPg/1b87yjzm/ADZC+FmzkeJEHuNvzvq6tg5zHb5y/QjpiaQ47qxca19ld1
	gkpWwsf3ziv3WQwn0uBCyWMdDN84RWkRWKEdZoWg8JpsO4RdZbRMel6YFs7DxFqMYbGQNXaeDgN3T
	vD0w0y8JL66bzOGGwbd6IJcj9UcElplNF3cQSUAVFYXLAm4S3XXJ5FxYlNxWqmOROKz8+pa0HkXvG
	fUfvcSJC/dWNALL7IIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XFE-003ZxZ-Gf; Thu, 01 Dec 2022 00:16:04 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDF-00365W-KG
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:09:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id my9-20020a17090b4c8900b002130d29fd7cso3780243pjb.7
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uhI8yDhdR7lIAaqvku/gdFE7HWy6VU8JNAGQp8QsO6I=;
        b=JGKTwFHTr3zFyFeRyDhx800NTwE8fbKBoChRZ4rCsQDcOc/eGjPbGsVDNkCwWmSHdn
         4zWsAcy02h7DG9I7KIrR/3G3ynUAl5zHFprvqWawNYq0ujuz0rj9xQPN87hRttEvJWya
         MaZkpYk6hJDhRKiSggxmfSLSCGk6wAycOhmze7v3vnTNsBJM82DsGnT9K7gXXth5q453
         GXnW0gnhFQMQ7rKcFFJUmj9xHXOE1CyUnZYbsfJ9eekI1f6DwJJHgA0YwjDavFZGHgxi
         PIdF3Xw7u6ZSs+rqvW6sJFzKLF1Mn/CCKFnzXLHVYU5aHYTg5a9RqdAAC/8bhq/W34bo
         HRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhI8yDhdR7lIAaqvku/gdFE7HWy6VU8JNAGQp8QsO6I=;
        b=QVCqvhhyQqCevh5j8sZpWH2o9T2JUeTdsMsG7abHhbuPfEfz+OCgwfXaphUo5S38V2
         0lSbTt/6I6iioM1wxPofLfuNTBiBn33XhKWXvI3pDj/a9hQ3GbY05z/ik4AKaGIAs1em
         aVIVYUDP2jUU2eegPXC2PAQbi5LCwkQYifnEIjvkucWvqJhe491QnDDAb6P23p07cYfu
         vbLHkIuDxfwL0O/pa2xEL3qXBFzb2NVWCzRN0nZd5Zm3ttLpnBbmfH2a4R1cumvruZY4
         j1w/fUNP7STZPKj0tWaHK0kQZx5LzolYkZ/etS510g4+5SFoiKu0GgFTU9CX5J0sgTI4
         rijg==
X-Gm-Message-State: ANoB5pkF8iaczNz0Ux++S0+2jt6Y71eD9YDXWbMuHPW2t7yd3YbaCXro
	qu2ywmLLbos3wcSnGw33pS6lXSzHV5g=
X-Google-Smtp-Source: AA0mqf4UbHeO/7xp9TeaJC3lcd9wjoTeVcRzR2/roKzeL1N7msdBGBxph7L3Wcu7JbcPwh3sZzXNOI19OJg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:3084:0:b0:56d:dd2a:c494 with SMTP id
 w126-20020a623084000000b0056ddd2ac494mr44472082pfw.76.1669849796263; Wed, 30
 Nov 2022 15:09:56 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:55 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-12-seanjc@google.com>
Subject: [PATCH v2 11/50] KVM: VMX: Don't bother disabling eVMCS static key on
 module exit
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_150957_704726_88E079A9 
X-CRM114-Status: UNSURE (   8.84  )
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

Don't disable the eVMCS static key on module exit, kvm_intel.ko owns the
key so there can't possibly be users after the kvm_intel.ko is unloaded,
at least not without much bigger issues.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d85d175dca70..c0de7160700b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8490,10 +8490,6 @@ static void vmx_exit(void)
 
 	kvm_exit();
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	if (static_branch_unlikely(&enable_evmcs))
-		static_branch_disable(&enable_evmcs);
-#endif
 	vmx_cleanup_l1d_flush();
 
 	allow_smaller_maxphyaddr = false;
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
