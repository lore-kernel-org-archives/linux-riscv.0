Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AEDC48BF6
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g+OjdEojHWcAmGUmzEmOsUSsNPX+vGu2d4+LdkGLoiA=; b=GYK/byGXdVsTSP0t/CVapSwh7n
	npLaGyT4mYuq6CAvMr6a0ONJlic2jd2XvHAYMAli2UwIsiS4YGnapVV6Oc4nxF/Hip4peX69McdC1
	AAZHLp2o6unfBnN1u5Wlnbphc6vBPtOCZ+TWXFKI7zfs5bxh7s0L3Q5a1n4Ek10Pw1Pkfxea8oIDz
	taGjVw7HsAaavSFn+n6WntzOZqvC+vKUGbJks3ziYuD/ymRBMWpvkjenK1DCfNNGOrqHgTtkbUn4t
	h4KWr/4/gDu/vwmZ4tyEIgbnk7Ty7D+pKaL1bgC+R/18WEPMm8ij+aWbqtdzhJTSYXADERUupgjtY
	/zLYdd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ren6L-00000003S2p-2gZf;
	Tue, 27 Feb 2024 02:21:49 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ren6E-00000003RyW-421Q
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 02:21:46 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so4800270276.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 18:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709000500; x=1709605300; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghn/tsXt4bBeTaeh+x2q+YtPRUVSTzvBJxsTub2q9Gk=;
        b=vwjl9rocMtSOKcAlOshcz5GoJct6J4szVteVmshBGowe+Av9zJlIFgboO3oBWDqzKW
         DHTbGZEqoGGgOXiWgR+UZawx+5YYYCrkd9uifljsI+YE9IZCYYMt5Zh5QLm6srQ2nUfo
         IkuP3WPzs3Sg8GFD/rOHfZ+hjcRDf+SRy42sczF50nn4xDHvspia4GaNq5mZ1TVvzwLs
         K5be3rOJodMTXy7BMfPC83tov7mXP2yqzhFhhNbjUa+1xWcSWfItASM+tmLhOshCvty6
         a80fmtV30glHDA+Fq8Xz0qSsoBtTShtHpKZ05UC5dbnLq3gmZc0KoEGhoW4uK86BcAdM
         gqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709000500; x=1709605300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghn/tsXt4bBeTaeh+x2q+YtPRUVSTzvBJxsTub2q9Gk=;
        b=hMnqyKgt/5G4uxoxL1AZRJkOcO9k01qzCeKJSomfoZGdU973qpQG+G8kiruxtxQcFJ
         8SvJxmy1ZBvqU3rSDeSz1Bq737lFd5XQr0HmLoGgQPmSk8RPy+shFbKu1ueyo2TyXED8
         qTQ1gEYS6sHkFDxNZDuLAv+Qwv295d+Pp+XTiKYcwBb1BwLjfNosRV/ShBu6uabXYHVM
         E1x2rBPHCKwBGzvD6LvWG3QJ+9Q5FZPzsCgAIN7mbJOBgoGjuSx7CpPScXLyFnPLmmhR
         qzHSFqZeJdb7vrwJjWclYhqqvnUCd8VbFVOnhUmKsi2VfAhK+NayYcrODYzu/22y/moh
         atgg==
X-Forwarded-Encrypted: i=1; AJvYcCVBNxzuhAZoUUVF/Nvw7RrtCBu+OeGPigXoKEM1tQHl2Um83DsQFieDMrVuROLZXapoc2vtBKuM8Y1CUbvwHifKjaY4begQCRWrMIca882x
X-Gm-Message-State: AOJu0Yz6yvmDN7uQi8ByCiKxkbE+c8Kfch556/DL+nJZFnTIR82oY5uF
	+YVoXI4sL680FKCTDA78PqgX0dKg6Ivdd6kQkWvUhNSKJblNZ8yKMm92+SQtVKiPP+pHSlgdjW/
	FCA==
X-Google-Smtp-Source: AGHT+IFOi9/tmN8AF5ckfIwhjyqA6w0EovzljiE14qM4BRVcycQBgccSndGNhkATEmtZADwvG8qyMKYgWso=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:a89:b0:dcd:2f3e:4d18 with SMTP id
 cd9-20020a0569020a8900b00dcd2f3e4d18mr49885ybb.12.1709000499927; Mon, 26 Feb
 2024 18:21:39 -0800 (PST)
Date: Mon, 26 Feb 2024 18:21:10 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <170900037528.3692126.18029642068469384283.b4-ty@google.com>
Subject: Re: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_182143_082141_E12872B4 
X-CRM114-Status: GOOD (  13.40  )
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

On Thu, 22 Feb 2024 16:42:47 -0800, Sean Christopherson wrote:
> Add basic SEV and SEV-ES smoke tests.  Unlike the intra-host migration tests,
> this one actually runs a small chunk of code in the guest.
> 
> Unless anyone strongly objects to the quick and dirty approach I've taken for
> SEV-ES, I'll get all of this queued for 6.9 soon-ish.
> 
> As for _why_ I added the quick-and-dirty SEV-ES testcase, I have a series to
> cleanup __svm_sev_es_vcpu_run(), and found out that apparently I have a version
> of OVMF that doesn't quite have to the right <something> for SEV-ES, and so I
> could even get a "real" VM to reach KVM_RUN.  I assumed (correctly, yay!) that
> hacking together a selftest would be faster than figuring out what firmware
> magic I am missing.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[01/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
        https://github.com/kvm-x86/linux/commit/309d1ad7b6ff
[02/11] KVM: selftests: Make sparsebit structs const where appropriate
        https://github.com/kvm-x86/linux/commit/6077c3ce4021
[03/11] KVM: selftests: Add a macro to iterate over a sparsebit range
        https://github.com/kvm-x86/linux/commit/8811565ff68e
[04/11] KVM: selftests: Add support for allocating/managing protected guest memory
        https://github.com/kvm-x86/linux/commit/29e749e8faff
[05/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
        https://github.com/kvm-x86/linux/commit/1e3af7cf984a
[06/11] KVM: selftests: Explicitly ucall pool from shared memory
        https://github.com/kvm-x86/linux/commit/5ef7196273b6
[07/11] KVM: selftests: Allow tagging protected memory in guest page tables
        https://github.com/kvm-x86/linux/commit/a8446cd81de8
[08/11] KVM: selftests: Add library for creating and interacting with SEV guests
        https://github.com/kvm-x86/linux/commit/f3ff1e9b2f9c
[09/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
        https://github.com/kvm-x86/linux/commit/0837ddb51f9b
[10/11] KVM: selftests: Add a basic SEV smoke test
        https://github.com/kvm-x86/linux/commit/5101f1e27683
[11/11] KVM: selftests: Add a basic SEV-ES smoke test
        https://github.com/kvm-x86/linux/commit/f3750b0c7f6e

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
