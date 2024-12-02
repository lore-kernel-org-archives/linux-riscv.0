Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF6E69E81
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 18:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tahAjZaQCPIeU7RFgjPTMZCo51srdaSNWQ9iMWWgYYg=; b=22+kQZ8AJMtQ27hqpkV/7J+PrD
	d3NJLl8pLdbFJMEZ72iEGfE0xqmzrl/coBaYLOikKJsF9Z3f82oGhXAyl5EhEAH4SXjpiSaFJhZI3
	uM1RxiGvd9XUVse3p1QiNmEn6ZbgZiL8f+SbKy7YTZUvE9F9x0xotckJ2zjt8vrCJ0Hilp3p95bxB
	2EU8o6KjqlLQ1ZxY+s2SMVUkH54mzY7lkAvIjNcSy8I7a0BjhtHskz+PzWYpyJ8iKVptBy4IB1LJi
	H5EgsMTlOV9NR66qKu+ZHbLVX2xvsWELBsCIZAFSslRT4/vR9GsKIn3d0oSfV/civ1AOFJQbCJBJa
	kM+RUqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBTY-00000007Cp1-3Rz8;
	Mon, 02 Dec 2024 18:48:52 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBSZ-00000007ChH-2cye
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 18:47:53 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso3509492a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 10:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733165270; x=1733770070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u34wPynLWdSa99IQ6xhu/7M3+TIv2HNu87ct2rQpiWw=;
        b=z+6ZrqKIqPro7sV/r8qyR7SRW0+tskLxmehHjH4MFr/SzBHsnrF7zA/xgiPWvSWaTg
         wbviHahjH6JQoRgeIIdNUjkp0E9Aeguoeb6nScsYUlTIgR9XI+g0gNe8C9FA1Uw9NogO
         LQVP5jdTIjk1P2wnBz1nZ1mn/Foqh5i0awBpSJ4aqXBa43D4JZT8tGIrYTB8+7bMbjnH
         HLwCh8PhfOro1l7fKo/+HraVGdy9ma+jE2IXMwxjBphbUncgjNZRv5KptmMFXm3126rp
         JCaKhGJO1QKBP2e4pgnJUcr4c2/Y0Qz8KvvWa2f5FD9XPGZ9Yu8TGVmt0XugGzzF+jdn
         oOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733165270; x=1733770070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u34wPynLWdSa99IQ6xhu/7M3+TIv2HNu87ct2rQpiWw=;
        b=fzA6DQTpZauZhBU5QO5jj2ND+3S3tVHE6JbVyDydIdnn43Jj3I9iUb1ee/hKJDcDmp
         NugnB3FLsvuw3x+XbFoCHFnSpBYO9Z1/ZC/Hd0kW488LuHSOesse1xyGZrFuWu9ToFWn
         K7WHWJABHmeVaA7IgshWpo8mXfNrB+xXqpPaSSEkNjCkDefUxqpkHasL5dQZw25g2jSi
         kTSi/b1YP/8548dfr1pAk6MEwJAhLWMaXs7iK4zHgjds40ffKuCQm7YvYKUVtEonLkPy
         sLpHMWPwFmbMYo2pTO49xtMWfWL/PTOvqMhHOeaSsm/yf6bwUAgo0J7WMLMxVQsJhrZw
         brYg==
X-Forwarded-Encrypted: i=1; AJvYcCUq/RTbynBBRgfTxlpsp5pIUPgTTTIjJm2s49dOYywf4BtShwnSqQb4XEAQney3UIyAaEQDUhlZBM9ntA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg9jA5L9oss8OWvfNFW8ZSW5R8veIW/2ScR3A7FDiFY+0ssFDW
	0fivDgPLTUvYG0dIBtWKGQN5q4arWugmsa37qszArFj59+N6fwOH9pgH1KBx5dKwm4ec705qySI
	1sQ==
X-Google-Smtp-Source: AGHT+IH1lOkxtOKe5VZ1YQsUZ2R4iUJCkzIbDFJGQzaxTbOPx9DRSSWOWSynHC4tj/4TdwIvmt3yGcRJFdA=
X-Received: from pjbsv8.prod.google.com ([2002:a17:90b:5388:b0:2ea:6aa8:c4ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd2:b0:2ee:c5ea:bd91
 with SMTP id 98e67ed59e1d1-2eec5eabed1mr7923335a91.29.1733165269950; Mon, 02
 Dec 2024 10:47:49 -0800 (PST)
Date: Mon, 2 Dec 2024 10:47:48 -0800
In-Reply-To: <20241128092546.7a5b3f30@p-imbrenda>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com> <20241128005547.4077116-16-seanjc@google.com>
 <20241128092546.7a5b3f30@p-imbrenda>
Message-ID: <Z04A1Oh0LCKtCN4p@google.com>
Subject: Re: [PATCH v4 15/16] KVM: selftests: Use canonical $(ARCH) paths for
 KVM selftests directories
From: Sean Christopherson <seanjc@google.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_104751_655652_0D558905 
X-CRM114-Status: GOOD (  14.11  )
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

On Thu, Nov 28, 2024, Claudio Imbrenda wrote:
> On Wed, 27 Nov 2024 16:55:46 -0800
> > diff --git a/tools/testing/selftests/kvm/include/x86_64/svm_util.h b/tools/testing/selftests/kvm/include/x86/svm_util.h
> > similarity index 94%
> > rename from tools/testing/selftests/kvm/include/x86_64/svm_util.h
> > rename to tools/testing/selftests/kvm/include/x86/svm_util.h
> > index 044f0f872ba9..b74c6dcddcbd 100644
> > --- a/tools/testing/selftests/kvm/include/x86_64/svm_util.h
> > +++ b/tools/testing/selftests/kvm/include/x86/svm_util.h
> > @@ -1,8 +1,5 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >  /*
> > - * tools/testing/selftests/kvm/include/x86_64/svm_utils.h
> 
> this line clearly has to go ^
> 
> > - * Header for nested SVM testing
> 
> but I think this one can stay? ^

It should go too, the header contains declarations for helpers that having nothing
to do with nested SVM.

On a somewhat related topic, the file should probably be "svm.h", but that's a
future cleanup.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
