Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F877CA101A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 00:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t+oYxg8jFicyyoNyGBx4gbPOOFzDwF9bFvuaxWhAzhQ=; b=rVcS4UtkIRHyg62rTnrluwkzK8
	ptReEucVWVnWxBkdht87QoB2cqiSKb9b+e6ecwt/UUo5KgtdbBMw1WXZaPwj0dMPZ/5hsOpfnjzu9
	wxwd1ZYigQYT432dzrDtumJf6tka0ibQ+DrjkjvImo6gazot+Y5tYMR27/Ya+tOOenJDXIM8bo1x6
	vgxkgDkwQfyTIxLPHavX2kbqwlQL+QUJWTvp96cU1Kclod/qGtnfFqoJ9gS6RcwxqJkq14OfqoGuB
	j8om4324Bv9q9G40jan3RyP376DNS+WVZWtybmT3ZnsxHLE/Y+cUHRP/qQiQjf7RmdoUgTO5xITF6
	eRVhvRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skBrk-000000086wY-2Pcw;
	Sat, 31 Aug 2024 00:21:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skBrh-000000086vN-04hG
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 00:21:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2d3b438c8c9so2322949a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 17:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725063675; x=1725668475; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMgQaudxr4J/6Rw/Ugn77ELKpct5vFB3BePzAq1Kny4=;
        b=i9aRZ+7wimZgW6yC5TFfa/5qNz84fHf6R6JePkJ9+oKz0bYmn/pLI1FTzY2jIVWJt9
         Q0nx900y7DiHnhQPwMMKLBUNYdBqOTbzXbOkQgkhCZELBzp1R6oZsg+SLnmk+KZ3Jqvx
         Q0rya+uoiQuEOtcSiPr+8Sxm6hPAho8MVjQ9EDjk4F80wa4epGT2I8XYU99sOXwUwo4A
         sHDAAeqMc8zPPljOicg0igMiL6KRdmdG9TLGdcfmINjg6DnTS54OlGe65t8B+CuBGdTE
         Hj6clfiiAxI0FS5UwphUnyP9ZvqkwD2aA36FVpe7Gau1r3icDt5mXXV8F5VCO08z5q3y
         5GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725063675; x=1725668475;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMgQaudxr4J/6Rw/Ugn77ELKpct5vFB3BePzAq1Kny4=;
        b=bjEon0FDUbja5IVNgPGVjR6wuZ7/+yAoB5ER+2lUfG7f+DlOAZZH2YKiMNkvssfcaw
         WBlkOGQHWBoQ17D+yWqu4KV+GjLsRaFUEndEOUHow5ztnXydzZ19szb0g9yS8lc98WjP
         H8H+ZL4eS012FhznaRCYRZG0l9wdEXB0pg3D2cEYT6FWz0zAXALQp/QxsBxpUE+6To0K
         lwDpdkYnR67AUkyINPOYiXQGnURtBf5wK6AaxMX9rU+yc2B2KltTDmAEb+Y7PuX3vyv1
         2lLBQr9nnteykH6vYzqPopKZi8W+3K02uPQazRm+TpKNPD910c2SF174ySP0Cp1WNQtN
         P3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJFwwiVzzxPcgUjsI09A77DU3d34meD+I7JmqDQ12Ou9bl4Z1/pajoKrvYu0DaBZFh04rMbR33OlqPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz21Xe/2SZUafEV/FP2drwLpMuCdMFgMeBTWyB2k1bD038VknY0
	lGStF88pDiMp/Sc15igTpa2FaLsZU2w6Y0ZKHX/IuufirpHDimux5BuVCGEu3BVRlXurIIwcYlc
	opA==
X-Google-Smtp-Source: AGHT+IGHPAth3Odv/1fyvFXsQ6a6cOh/6c7Pc1YRYmloVg4ApwcWdTNEKcK5OuRp6hsqbhF1nbDaV/8wJko=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:5143:b0:2c8:e660:6769 with SMTP id
 98e67ed59e1d1-2d86b85569cmr32103a91.8.1725063674377; Fri, 30 Aug 2024
 17:21:14 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:20:51 -0700
In-Reply-To: <20240828181446.652474-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240828181446.652474-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <172506365309.339538.5291166487767889409.b4-ty@google.com>
Subject: Re: [PATCH v2 0/2] KVM: Coalesced IO cleanup and test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ilias Stamatis <ilstam@amazon.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Durrant <paul@xen.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_172117_075850_7146F39E 
X-CRM114-Status: GOOD (  10.27  )
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

On Wed, 28 Aug 2024 11:14:44 -0700, Sean Christopherson wrote:
> Add a regression test for the bug fixed by commit 92f6d4130497 ("KVM:
> Fix coalesced_mmio_has_room() to avoid premature userspace exit"), and
> then do additional clean up on the offending KVM code.  I wrote the test
> mainly so that I was confident I actually understood Ilias' fix.
> 
> This applies on the aforementioned commit, which is sitting in
> kvm-x86/generic.
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/2] KVM: selftests: Add a test for coalesced MMIO (and PIO on x86)
      https://github.com/kvm-x86/linux/commit/215b3cb7a84f
[2/2] KVM: Clean up coalesced MMIO ring full check
      https://github.com/kvm-x86/linux/commit/e027ba1b83ad

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
