Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B900C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDlh9XdesAJ4wikiSUo0QEfRx29cnlvGbK2lifBsuTw=; b=htThU9UgyE9Sxp
	Iz0PDVyV5RXR7zsai2Acmzxww9jEmXm1U1xIUIzqpbEn5/df85lAF0LrErB83KnEZnYTwGFGw5/pU
	Pvcu/eJQk5QBQorkVQnnYJlGnw4aHt3aUMrAriZ8cKpzDgFTdsD6vdsvIDhwWaDIzykfIry/zDttq
	tyMcEvuTRb2ezI3ZDkUkPWFOt01yJOB8inHtduc18PAGvfBJJN7Hatm4FyNq0/w2qgd7ag8MZUT6k
	teTKe4Vw+N5w40z6fKRPcQ9P2PkuD8ZQ25SVpZ/HFeH8l3yssnnNI+s2VSHqvNP+o55N+iNxd1P71
	/XI8YEHA6v2gIwfdbENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaniW-007jST-GB; Wed, 21 Sep 2022 00:35:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfv-007hw3-VS
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=; b=Rf6R89/hRaE/QgC8GMFcIX7xlq
	otIcNX72osIY4wSLMOgIgo10MeEte/FA/swAL/I2W2HLLEt/uPp14DGrqj9GgpNMuO5GaZ4c7etle
	ir8jylkXdPsyQG4CTT6YSp672GiNUVDOj/nN1urx6ngv+N2JOggXHLDZefYihpZY05Qek87KNo9OI
	cFJuEgcQgkzetXiTBMe/99iz5ZyEzEpuisBpIaSAkuhvP1sIobwXYX2+WZdJmb1I8c8JA4vBsj2j6
	Wh8yUBTAL6L/oBdNPTNjq0MbSCwIEFHH6oWfsG29bFays8xbNjCOA+r3YBJbzuYpFQjPI49gKzCxU
	kwvmzJ7Q==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanff-00ET6W-NF
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:06 +0000
Received: by mail-pg1-x549.google.com with SMTP id a33-20020a630b61000000b00429d91cc649so2514617pgl.8
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=;
        b=grJuuh2+k9rqNemRgEr/i3C9qelUa8pmjrIwpZzOZWsob4m9BMj0id2HZJEYNqX2vk
         IyiBqggCegoMniVIEZ7ve0Pcy1+h2jKB9+MbFtK10I6z6o71JeWojaaos6m7WE8fir0j
         heFLVTWw3UN27mkc0NRFrTsxNKdJe5TptRVjlgbhxvmnLYxPIxj71ZtTzy+8U9psEbMq
         /DJvRQaVwnNJl+52DMbtmS4ycyYoramkBPdq9kNpcRPXozDD2tMcpY+VTWl4f/e0cZ1u
         xUxifAHZRm7LM+0f4tqB8q/MJPB9s8lTaVH0t++C99WkByoXTjU2cYt2Zh/7y53Gwmu9
         hSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=;
        b=ymJr2jc7MFwHf6qXufz+JlJvg5UXJaccJH0H7WmPjx760jywOBSTNMLYE2t7l6j1Ht
         I8ah7ch8RNM/VQp+2MHCv73MqDYgEAlLkRPIwjEZ9Upk9RSUBrhMvDrTpuwZAr+Bad9o
         /MA1aTD1lLE5QrNvLgfUMcSCeabzdL8vETUxfywvVWLMbRfA/6+iOK2FSrZryUCJZqhu
         Cr8g0o4L/71y2rpTtNr75ew9W7rcsLqtDoAE+38nCVQdOK2u2Mrjo2olPkzXaiGrGaLq
         UecAx/zNg4XopCVaTpIZNCTcb+gwP0JSyVGoRwIwdu5csQUT52XAKJNwELbSyUWcB43r
         +o6A==
X-Gm-Message-State: ACrzQf3LQNJenHdpH/ziENbe7abtxlzCbbf6WfEu/lAll6snPxa7Bk73
	431IAj56Ccjr6Ek+xcbuIb1AErF+Eg4=
X-Google-Smtp-Source: AMsMyM7f/RJC1MtdX6LkmKjLrG4mZov+EsK6V2BR+rQVSc6X+vDgdbpWXXujI7vaEWcw3mjY8BTW5lUZVRw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac7:b0:178:b5e0:3627 with SMTP id
 q7-20020a170902dac700b00178b5e03627mr2094501plx.147.1663720377687; Tue, 20
 Sep 2022 17:32:57 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:55 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-7-seanjc@google.com>
Subject: [PATCH v4 06/12] KVM: SVM: Make an event request if INIT or SIPI is
 pending when GIF is set
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_013300_000526_C36699E9 
X-CRM114-Status: UNSURE (   9.27  )
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

Set KVM_REQ_EVENT if INIT or SIPI is pending when the guest enables GIF.
INIT in particular is blocked when GIF=0 and needs to be processed when
GIF is toggled to '1'.  This bug has been masked by (a) KVM calling
->check_nested_events() in the core run loop and (b) hypervisors toggling
GIF from 0=>1 only when entering guest mode (L1 entering L2).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index dd599afc85f5..58f0077d9357 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2339,7 +2339,8 @@ void svm_set_gif(struct vcpu_svm *svm, bool value)
 		enable_gif(svm);
 		if (svm->vcpu.arch.smi_pending ||
 		    svm->vcpu.arch.nmi_pending ||
-		    kvm_cpu_has_injectable_intr(&svm->vcpu))
+		    kvm_cpu_has_injectable_intr(&svm->vcpu) ||
+		    kvm_apic_has_pending_init_or_sipi(&svm->vcpu))
 			kvm_make_request(KVM_REQ_EVENT, &svm->vcpu);
 	} else {
 		disable_gif(svm);
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
