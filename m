Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E870FCF45B7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8nSRiVSc8TPaI+/LlI8dnOft7miHHvaV0qb5u+zvcyI=; b=VJZltXmqag+vBtaChl6Y2GXm03
	kkXSNTvhzU2XkAZ1ZPB/7TB+DLcPPKoezfTcsgYuGeFSZ4jrYrOBwqanGOXRmel7pNH4ByJytzx03
	al0GKeMQ2zJ7s7pflDkgpPQN20FFVMhNDZXebF0xHnA5lHtdpyupsdF6Hm2JfJGFYiWcVyt+IiqKS
	VotgGv8znHn5U2Mk51k4EWEtZJArKezvY2223lYJYTybjBttRttIWYBHCpBYyFXg3yXQ3huOjj/Kl
	+xNZgTyLKEeuOKRf2A1vwEeZKpRocj4aaZFpmpZa97yzM+YEwZIgSbc4Z/2oP6taJKmVhqo3JZHqu
	PK1tSYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLtR-00000005rqT-3OxN;
	Mon, 12 Jan 2026 17:39:53 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLtO-00000005rpC-3uSw
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 17:39:52 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c55434c3b09so1712074a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239589; x=1768844389; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=4OWVwcdDR8Y0vD4/hIF7D4uX6ocK39/lRxeE9N2pCU1yosvtX0KIS1m0vrKnXvAq0p
         fOsGIgLKJA8v8kl7FenDPKnx5y8RccaxUzPr9ec82pznBxLdtc3ohVMLlcod0B98NUgI
         +d2D0QF3aJqJNg/aYtrHgPkwme2RyOGn6rru6MBEokNJiboWDMf9AJGdDD4ZWhtc/0qj
         SwJQq8BKnzihRJATMy6AtThTTTilpxlqXhD9m72vQtp+CF8Wo/MNDdSpLWI2vfFdsm7g
         J84Q1soFaoLBnbXvaO+v/WyeCOI2tfnrBUXqUxCxDxbtE+bCYtFqXgoQiKyCipsC/bON
         VX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239589; x=1768844389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=kQ2+D67VO2xwETFeKKjYzGBAQ1idFn4soVJehaHus27zM+i8cegJOFlQEsy4J+UWNP
         Z2ej+TKN0O5kRSirVO04kFrVpQusa66fVZI9pseh4H8YvRx2rXUj+iXHA83fI0+6MC7f
         KUu3q0yBMyYnJNcMOsDAzZZjIe5hnDLMfHUOToUVfYyzZZ+RCrquq1D/BPTtZ9HvbDKR
         xv+B9FS4mfVBakfWlzuxv0WfigoAeO8KjghB20k1dZRKev/Jkp6fx+ICWs9GI+aNxhUm
         dfOEPNiwHzYgv8Om9ocdFTb6H+JzY0pVCCj1V02N2i11a5FBO5lmLvC7egTV+7idSyKl
         DT6g==
X-Forwarded-Encrypted: i=1; AJvYcCUIqVqE44XRQIexrCVOHUha3x5UpAOXm/W19jcAsuBRkFyIPc/Fr94k2ynbMArghdJFxoQr4cZBybh6PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzRwEjAnnvDrT73j0K1DuT5oOBRKpEC3XMVWSoYJwVjEOIyM+L
	9E0cRjTjO4QKGKZXTg+7AiywXO7tZqUtNfNbE4kP/MRBhQrTZ0HdPDqaxjH5rgibHGNSWIX0ZiW
	aqgnr7g==
X-Google-Smtp-Source: AGHT+IF668cUxxhKhGHv90tNvsIeTkhAR6ns6JG1hxt5u/yIlrpHwYKq8uhAaCwc/umnpMOixfg8y4oIB3A=
X-Received: from pjbgk17.prod.google.com ([2002:a17:90b:1191:b0:34c:489a:f4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2251:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34f68b65ff0mr15047069a91.13.1768239588965; Mon, 12
 Jan 2026 09:39:48 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:38 -0800
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927133.1374677.16641795988105461817.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_093950_962170_D0DEFDE8 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 05 Dec 2025 15:26:55 -0800, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
      https://github.com/kvm-x86/linux/commit/da142f3d373a

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
