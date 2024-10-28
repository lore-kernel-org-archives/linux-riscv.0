Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DD5D5B154
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mdIOUS6Upr1Dty6vMk5pZ4MkujnQE6MGco3rFM4Mt98=; b=LUJind6Q1uzSMRPork1zH6uwXE
	tv4rJFS/q/WeY5rbGeZNaa4ItYR+GPOhvMXKbrIRlJcdj822oO2mYsynOTZy3Xldj79CRW/mVr2bw
	vG8Va4MMT4Zx3FKBvjtvyKWwMYlDS9g6048N2d6UBotAHOAMMdHN0YLCMHyMxIPTixxJEqDsC7Fgq
	7LLJOJlk13lIDkj+LmwnVyW6uliehEcnH8X12gaIuZ+pQWfkgvL8R7NNg/dY5bIxmNSmhWXRY7A/I
	OxgMi65jpYv9WXsJZZqW9fd3+0PaQyaCnyBh0fX/nqPc/05h/tTWyddi6lZ4PQM23soLwDzfdExXO
	uBAd/OXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X5k-0000000CJFR-391S;
	Mon, 28 Oct 2024 21:16:00 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WcJ-0000000CEgF-18Lm
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 20:45:38 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso7746028276.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730148334; x=1730753134; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xKuNSIYTBR1rDIPTuHwqfwMTGhTV2i8TmyskVsFOfO4=;
        b=eBnsKg9XBfkTrkWWjbxIBvHTj/lDG5/JitSsYUUn99uhVbG73yE3ct0n47O+EEBfvy
         +bgW/YxvzCc0ZJ3wYdVhqllCvYqXkDLQIm3+4tyatOQNk4TQZYAd9+gXo9nnIDKNnuR1
         J7v/Aa74Mie0USnGI62PTr/5OhOJAcFQz9TzWMNXYik0a1WbzNQwhnk7pF59/NAijHBE
         H8uUAmw1pZPrAQSVIJGF90J7wo+iUcN7MRf/qtnznuEvlaCsSe2M/RF/y7FNtsof2VMw
         yw+lbWQrRN7+MlJzt2kQ0dloEJ0qZKjc7yYjGTjSqIWCpWkbyA0Q0HgRxeRGMJtuZ6MW
         nqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730148334; x=1730753134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKuNSIYTBR1rDIPTuHwqfwMTGhTV2i8TmyskVsFOfO4=;
        b=Ah7da6tA3Xd8IC8uuUpxALYOs5HrBmasXgE/piCftELiOea7OQNgRgdpJcUuG7s2lk
         MjEOwH2riwAEzE+Zs7vCCpezmO9fC60fcoTRhni4RgGmshtZQlo1bnBsbJwcorIC6ydP
         Cn8eTfM+rle0GTImfz5ouZc+gbNKnOeMMBkrIRb3f/vzMu/v/O15OHlY0voFI2ckEKZc
         +Z150TwOk35TDUIsW+U6mIQ6g0E4CGwNHuUBlckgn8vFeJfLLXtbFRi/SUj2gQKG56ky
         zt8pyzebrZ6AYB2NeaTNXN6l9LsCwd7wYb7jfoL64PVBdSXajX6QIugoKLvCSidYqvPn
         DAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVdBnEpt7gi3WJroqXQ40Z+ptUabjwNMnnvYZk/uBYEyZAPCrIwu2zay4g6G9fsweDvGySWtQbIS4CxHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycUZFnI6fhTD2+VUYBLN55lm/6O+fz5sJMGAsmk7ca57F+Fdn/
	I+1fdgBG/bVMPT6GfYTQjTYCj2RpuQXVXKrpsjt3OfqdKWL+PgKH9dA0z3e4733tOghXVDXM47k
	cJg==
X-Google-Smtp-Source: AGHT+IHUv/Dlq02qbqz0gjBFFfL25anLHCsRNYQi4mL1loTc7X5gbHLuxRGm93NhBDNRsTac4zgpo4TCt0s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:d43:0:b0:e29:7454:a4da with SMTP id
 3f1490d57ef6-e3087a705fcmr7090276.4.1730148333867; Mon, 28 Oct 2024 13:45:33
 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:45:32 +0000
In-Reply-To: <CADrL8HUEwnP8e700y2XYDgVhhUJuj1UEJmd2NLdtZ1dV845DNw@mail.gmail.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-10-seanjc@google.com>
 <CADrL8HUEwnP8e700y2XYDgVhhUJuj1UEJmd2NLdtZ1dV845DNw@mail.gmail.com>
Message-ID: <Zx_37E9QY_PfBaTB@google.com>
Subject: Re: [PATCH v3 09/14] KVM: sefltests: Explicitly include
 ucall_common.h in mmu_stress_test.c
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_134535_349864_2F8BA085 
X-CRM114-Status: UNSURE (   6.63  )
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

+lists

Unless there is a good reason for off-list communication, please keep the Cc
list intact when responding, even for trivialities.

On Mon, Oct 28, 2024, James Houghton wrote:
> BTW, there is a typo in the shortlog: "sefltests". Guessing you've
> noticed that already.

I had not.  Thanks for the eyeballs!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
