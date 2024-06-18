Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D8FC2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AhGl29DzmJjsS8wc3Ud3tk/Rt5Cj2H0vH9gQxCUQGTw=; b=DDNVuqnKkDydjSdQ0MgPP6mXp6
	zSk7aVpq5h3r8Y42Kyylezy/ain4Ia+G0d/DzemhiPS6DkJD7M2ojeNhIxmhX087W7mcFDxbCJllH
	cetoZ4Z0m6jbEPIibRpdYQ2cONB+1KfMBZFKM1VALiPRoVEAqBy1jennpHjzTognPSAoIyzaH6z1P
	Xy9B9rnkJRB1fwQ/EJJo8zjMcXzSV6g+vdgtbJoU+ikWKj6RHxLWF9aCchlv0PNBXy1IJZiJR9Pxx
	Igc7RW/4/qry9vS6av8ReYTcIRfmpMNUcE4aAzxE591jxXvDoxi9LqLqyjbOmOyn07YYQhIuZFj5n
	wW101wyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJgaP-0000000Gi8v-1YLn;
	Tue, 18 Jun 2024 21:41:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJgaI-0000000Gi5h-32UX
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 21:41:49 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfb0e59ac7cso11844801276.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718746904; x=1719351704; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=mKyZFwzvGEMJ9xxbdd2X/E1rwWSBtpxymMvTDuSF1KzoS6Hx3OJVQddZMFFfH2SAhF
         YzJQUDMzt3atv8GV5WBcVT3jCuM8kO34+iX3dNi21mjYQwvKtPYL1ytvAN+jppO2yZ8b
         az+A2lvGPBfNm8omA6ahnYSIST0/Kk/rEcOdOZwOKxCclYcqBPl/u5zV78ClWQhVc8tr
         hGSrefgax/IjRP1bxoD/uY0ogXA3O/QhyBjKPbAcBI6Ip5F2DLvKpOHIECV2I2CaaxHF
         mR8EcveRIxu0gQvRinisHBGd/BBBvwtx7dcllB0tK4TM3pB+Jr8r1ago9Trmict9UcxN
         10Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718746904; x=1719351704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=wJfOcbtf6vlr91u6uOx0qG629PbSOkH+wKgAwetClqHH9e5JO4i3cRqN48BlBgyWOs
         GBA488Zz59Vt14HFW8bIdtuiAlDtV83RI4cBlLW1dMqKfAjKChZ1+zTV1npRO2/YTle0
         2jFmlx3SIZrE6R9C8R/MQf+t/FjLgVxL7V3Ms+0IJZhtYmG0nS/ryf8iXT4H8yGptUXL
         3zbwC+MBw08FgZg5ibIh1Y72wBL7lAQmuheNskAwrc+MCWYgIoqYOvfYOigxnxXwXHQA
         eThCaszzmSs1whoXpALHRkSYWUYNz5GOnppJ0o1QKpvYiSr5aOfnjZdeHHGWnqwr4r7K
         82pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHtD+l7lzF/r2SfLYpBINHlb7sbJGNlkZqXyGJpEQwyMe9eCCC0wNNhxnkBuY2L6X5cJzDp7c9y1RQ2uzFpjKqwKooU31R6af3vDFkE50Q
X-Gm-Message-State: AOJu0YyNHy6IFm9fZ6EUaoCadFE4jJgnyUgxjjkywMnnUaz0UCsgeacl
	WRZrj/rWW0rfpvIehDjgYbLb+LcfJC6DA/BXRvj7hAxpcw0kfJZ/WAOYKc0Aq6Tdj9lnqq4ccUT
	+Gg==
X-Google-Smtp-Source: AGHT+IEl94B6cPOfd/EKE0+8juuGqXNbimkkhvSQIWkIC7nhtL6RuCNxJoDH3on4HivHNvWvDQFbNJTKAmY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1003:b0:e02:bd4f:def2 with SMTP id
 3f1490d57ef6-e02be20b2ccmr339129276.11.1718746904451; Tue, 18 Jun 2024
 14:41:44 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:41:24 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_144146_789760_64ECFE15 
X-CRM114-Status: GOOD (  12.03  )
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

On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
> it's scheduled out while running. i.e. Do not mark a vCPU
> preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> when userspace is doing KVM_RUN with immediate_exit=true.
> 
> This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> set st->preempted when going back to user space"), which  stopped
> marking a vCPU as preempted when returning to userspace. But if userspace
> invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> preempted/ready. This is arguably incorrect behavior since the vCPU was
> not actually preempted while the guest was running, it was preempted
> while doing something on behalf of userspace.
> 
> [...]

Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've been
away from upstream too long ;-) ).  Thanks!

[1/3] KVM: Introduce vcpu->wants_to_run
      https://github.com/kvm-x86/linux/commit/a6816314af57
[2/3] KVM: Ensure new code that references immediate_exit gets extra scrutiny
      https://github.com/kvm-x86/linux/commit/4b23e0c199b2
[3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while running
      https://github.com/kvm-x86/linux/commit/118964562969

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
