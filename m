Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E24C021BB
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 00:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=azzpOh19lrs8UPSnfya8E8kuSbCFsgM5e9XjJnc64Rs=; b=XBBXTU9g+663FgzcJAHfEsiZkg
	sbTlrrj+XE2mZHvWfjMyJHfPsCwaacKJeuMuc+2WLocYtFnuGIrjcDDR187dxvN9Y/fAU2d/LWKgC
	ZceamtcNkGexAU4ZWYgXhnKl3EJm9cDOCWzoDXI9+ivMOWNzVcJDkJkUH7dYQxe5hg5+hf94xqNI2
	+X1O1c0fzFUeFAFuDgRShV1juFv9l3ZcWFDfVMuotajyOVJlihAgPSSH0+8KlO/6/+GkJwtV8+V95
	ZvT3FpgaKJoHJGmrvVk0Yzs70s27paSgPFYVFOIoVCU9Fsv57O0wOIRowCi6MFHBlW2cp3RJiiwa/
	pQertl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5JC-00000001sNS-3yXL;
	Wed, 26 Feb 2025 00:29:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5Gw-00000001s6i-3R34
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 00:27:36 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc4fc93262so13274080a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740529653; x=1741134453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=3LCxbC10dJsNohIs3LlPVFrPr2jfywPlyutOOka1T05aUuN8ZYf8u+I0lDx2qW316T
         ONtKtcE2PQ/kfHglRJDKBsLD35SgHsLX1Hdgw08xoQLmXKddxfIcwHafwDGUCSQrhiAb
         ptq2BNcsdSeufldokbS0I2siNqb/3iQeDPsifkAM+JSh+sBLaNgjVBD2FMNJo/QLRZxY
         DFgdipMsX4H3SUyjvK72Z+kd+81jq2WPqaSsL1F2wj0gbbNMMk+h0cIhTz3O6ekMBEpI
         PnI5EBlhErfC13TLKBQB/Ugj31pbnKCtNhGv3v14LqLWCkSYHK9RbFtVWYhrvIZcxQJ1
         9dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529653; x=1741134453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=At8CvNCiTPk68ujb3P2xsJvQW/a6CRXPpgSeQ9xPQLUGzAmEkm7LAMM8TOxc/Ve4kH
         nGGNwE4xo47QsXDNdUD++F4umvTiSc+uOT3coKBCU+bau1jJ+31/1ncVkOsE7ltoBVTt
         fd+bFQFWw910Ndt8DzzCFI8FtGYQS5fv26Xic5xePqQzUlYwRRtY27A6g1BmypRM0eeA
         D2TGR155xtEhFejavEsmm2DocdS3jxyOivk50yNeqvDeD5IV2s/wA2fXSHxPiV0+k8r0
         HkYFCBC1534SCvTwGlQaNNVD0JebE0g1IHVm8JDaiQ2/EwrWSkmwXibPDT8HuVYbg6x2
         ig3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2vsMTXa2Yl/hpw5JFGxLzNslHEvaW0gngp9ZvseKngqpYyzbwZSdIjsp6Q7vi8I5QnrCgIAG7GgpfSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2hcDddRbNZ6YaGDxr0gmAVgWkNfm2TFGMBDfFXoioKUIsykRG
	9RdwnyIEqpHzB/hcTsERcVVZWBoha7m4H6zjlIyHiiPx8QuQapaGwuzl0H4cnF2TGt2L23NgCXX
	J2w==
X-Google-Smtp-Source: AGHT+IHOUZMQJO44VDHKi6ofhJ07QZ2dZ6izn0Wyr9X1ZaSMCJ5d0/qSAVcldTsRp+dWt1bBYLTGrWWvHEg=
X-Received: from pjbsb8.prod.google.com ([2002:a17:90b:50c8:b0:2d8:8340:8e46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5483:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2fe7e218ab9mr2765842a91.0.1740529653271; Tue, 25
 Feb 2025 16:27:33 -0800 (PST)
Date: Tue, 25 Feb 2025 16:27:32 -0800
In-Reply-To: <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Message-ID: <Z75f9GuA9NfKo37c@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_162734_853327_F067FD9E 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> On 2/25/25 00:55, Sean Christopherson wrote:
> > Free vCPUs before freeing any VM state, as both SVM and VMX may access
> > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
> > to be kicked out of nested guest mode.
> > 
> > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
> > called") partially fixed the issue, but for unknown reasons only moved the
> > MMU unloading before VM destruction.  Complete the change, and free all
> > vCPU state prior to destroying VM state, as nVMX accesses even more state
> > than nSVM.
> 
> I applied this to kvm-coco-queue, I will place it in kvm/master too unless
> you shout.

Depends on what "this" is :-)

My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master, but the
rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on adding a
few more cleanups (though I think they're fully additive, i.e. can go on top).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
