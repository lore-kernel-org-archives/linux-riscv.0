Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4423EC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QWMg/pQGF1qUzvEOk65c7e+s0H7rikkOiQbZWoUSrSQ=; b=2CpDudhQVtbBmEPlfkO1tu6cP5
	3OG2qoiUIVU3vcoWpiJFHQ83mH391EmWikoG5b43CQAVH8i+r8Rnv9mTVRcz2SWZsFn7XRuVKOTbF
	+Zd3nO3IkTJlsh7Pr4nz3RyCjEPfjbdBAmnU/FVUq9oSYVJEBUKeSQpmXwk+XS/YoV8qW0pPRUCf7
	LEZNfbVp2dgJJSA1F2DmfKLK1DdFXvvG/KgxD5ehBzhp3ArRHi1pNmRLsr5oMOEPPDlqkCqq8OD4S
	nVvPeyMEocNlDX3++y1tDXnzeX8GU03TKME5oPTacsHlXbzaKPh6sYOMUvVi9rXBZl8vob/EwVXeB
	YtsSR+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf7O-0000000FcVb-02VP;
	Wed, 07 May 2025 13:47:26 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeo2-0000000FZQ2-0iZB
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 13:27:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso4325739b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746624445; x=1747229245; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gn4ouDHYMf1rQDJgdtIk3JcH002Nvu2EKgt6CdyYxYc=;
        b=w9XMjeOFvVij2qHzkOYDQaysqracbEWfAbMnOulIAmCTaovRcA7FfK5xN+5aSahIiq
         jKmDwdPlvxBfk6DaL5Fes7HHjMM/j+4aa3mBT+LwaOmPAQu/vPNVKC3Xatnf9HFanJhz
         lDxiejYQir/XW+zbgasKHWJ3XWQNZ6mkUchEabVjpOdsdQcV6x6YxtbQaJgxf54wGBos
         uxRPh5+7KueWq229w0DiJ/WQV1fWZuZUPvyIGKeKXwXC47vfVvMpASEUUnOse8KGEsdA
         JGB9WohebME7QutWRKexyqw6o3iPgE5LgOo9vZiA2S2skJcxOQNTOTjunfQDcNHQ1829
         jfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624445; x=1747229245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gn4ouDHYMf1rQDJgdtIk3JcH002Nvu2EKgt6CdyYxYc=;
        b=NqLt2BrasgCFJNgnZAftlGKUvSCIuPne3p0eecKets1Cb8pzVqCHeCHC74M0+/TwFv
         1DVj1SnkK/TQ17b4szefMCvqHqW9ltjki55EvknJh1RP5VKH1FC/UerqNh0CRRCaLa25
         MSExLAMzJKKH+dw/3uC500tGZ/tST2+qvgn+v5X0k6Q3puH7+4gAr5bsAP2fMsziuJ22
         kIfEqeL2aI28y8S+BovgNHfCtmk8jL7ZjxVP3FIkSFZL+76opvE3cwb2c+G72atp+KLB
         DxyD3M1hT7ZNVuGymqwOO07QxOeuUuPc+z41s21HJ+5xN39qdq9VrcjFd9Mce+yk+Nq/
         Tekg==
X-Forwarded-Encrypted: i=1; AJvYcCX6LLc4uIYLVj5C6mKEJ7YqKROpyvh1W0riL5NsrmHtws72XfL0QRrp7cYVpr53DK5f2pXq1uf2/UQRrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF9xswqmzd9qUd8wLWbWiKzfmX3yrS1EQ0jUIw6+EhW63qDiY0
	nUmJbOFQLeFGLWbDQLhSFVZ9geejEw42P3OCRkL7kK+XKM/ZYGGfHH8HQ8BcDSdYA0xDGv3Ax5g
	Peg==
X-Google-Smtp-Source: AGHT+IEPjV7nnxIQdSAnye71UsJYJwQylTYuYdPxkCgubdgOAyiIVlZOePc56cd6g1wSD8shZczYh2GfBm8=
X-Received: from pfbit5.prod.google.com ([2002:a05:6a00:4585:b0:736:5012:3564])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:920a:b0:1f5:87a0:60ed
 with SMTP id adf61e73a8af0-2148be10ddbmr4868825637.19.1746624444753; Wed, 07
 May 2025 06:27:24 -0700 (PDT)
Date: Wed, 7 May 2025 06:27:23 -0700
In-Reply-To: <aBOznhkrLZ0Z_3Xw@google.com>
Mime-Version: 1.0
References: <20250430224720.1882145-1-dmatlack@google.com> <aBOznhkrLZ0Z_3Xw@google.com>
Message-ID: <aBtfuy82Ze7G4vdm@google.com>
Subject: Re: [PATCH] KVM: selftests: Use $(SRCARCH) instead of $(ARCH)
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Muhammad Usama Anjum <usama.anjum@collabora.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_062726_207027_F559ED21 
X-CRM114-Status: GOOD (  18.58  )
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

On Thu, May 01, 2025, David Matlack wrote:
> On 2025-04-30 03:47 PM, David Matlack wrote:
> > Use $(SRCARCH) in Makefile.kvm instead of $(ARCH). The former may have
> > been set on the command line and thus make will ignore the variable
> > assignment to convert x86_64 to x86.
> > 
> > Introduce $(SRCARCH) rather than just reverting commit 9af04539d474
> > ("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
> > to keep KVM selftests consistent with the top-level kernel Makefile,
> > which uses $(SRCARCH) for the exact same purpose.
> > 
> > While here, drop the comment about the top-level selftests allowing
> > ARCH=x86_64. The kernel itself allows/expects ARCH=x86_64 so it's
> > reasonable to expect the KVM selftests to handle it as well.
> > 
> > Fixes: 9af04539d474 ("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
> > Signed-off-by: David Matlack <dmatlack@google.com>
> 
> If this approach seems reasonable I can also send another patch to share
> the definitions of $(ARCH) and $(SRCARCH) with the top-level Makefile so
> that we don't need any custom Makefile code in KVM selftests for this.
> 
> e.g.
> 
> From: David Matlack <dmatlack@google.com>
> Date: Thu, 1 May 2025 10:30:26 -0700
> Subject: [PATCH v2] kbuild: Share $(ARCH) and $(SRCARCH) with tools/
> 
> Pull out the definitions for $(ARCH), $(SRCARCH), and $(SUBARCH) into a
> scripts/arch.include and use it to reduce duplication in Makefiles under
> tools/.

Yes, please.  However, SRCARCH might be going away in the kernel's Makefile[*].
I recommend holding off on anything until that discussion is fully resolved.

[*] https://lore.kernel.org/all/cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
