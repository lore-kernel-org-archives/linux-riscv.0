Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20289C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 08:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF02E60FC0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 08:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF02E60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zrek6vQ4PCWyi4pAuwX1wv1wYDBQuvFowVu6fPpiteo=; b=LqGPPNXvelnk1T
	eOuQsRXlxC4nXHXNpj+/+AinQcBs0qDEE48CfyuK8p0evS9eiu+Rj/WODWrlW7GqunWYE0Qz7diq+
	48b6A3RL/A2ZcgFkDzM1d76kzt0rBa+wiB5F7TAUQ+wPx9kGg86/qbeQx8vkdFV/ixNRkFkDUfL5b
	xDb0lEi/VWG89qLeTtDMoCceJjGC6paYrfHCwnoTQibYQkrc8xBk4Qp1XHMPO4ngLLu4t6i33zpvt
	xS63qU9L8fx9CWtQkxvYnkjhLCc+z42+Ax1wvDFVxQcpxAM4CKuNKZZu3pIFQqG8PbOOToLRk+wUw
	64nac789KjqNY58KtoyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfem8-004NbU-M7; Wed, 27 Oct 2021 08:59:12 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfem6-004Nau-5d
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 08:59:11 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 230983F175
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635325146;
 bh=a9x0VT35zZ6DKokrr3tUZmRN5kTv6DVJhdONoSV2YHg=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=MG60rzG1CT/0UTdRJaKxPbH0EgqGlHXSwnmFV0SfpM7iA411HDtVvSSrq4sVhfei3
 PKWSwu0eAwl18if+guDTOYRbD8BzFULSM/k02E/+UWJUfgXwkbxZ10Q2Xu1DG9a3zQ
 cE7eWNgrIXBBsEdpBVwg9Iqi4gNyVrvGW9VlwJgFrAyOqR5wBwKH+86X6Egg4rMG0G
 yhHzVeynhJl8ROcqbjVpLIK+ABxy0hdamPltFNAncBLM7XkDiEeZxWSIDGvi0GYQM3
 VvD5hCWSOIPhBO7iovBBadVKhKoH4gGy6tdZvuGFEj7AYIfmSwbizPqyYXTr2S3bl6
 qgqApy04SI1mg==
Received: by mail-ed1-f71.google.com with SMTP id
 t1-20020a056402524100b003dd9a419eb5so1701848edd.4
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 01:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a9x0VT35zZ6DKokrr3tUZmRN5kTv6DVJhdONoSV2YHg=;
 b=HW3fxTLZEBJKCQo2kFJNhJHZtbb4lGsltyZH19+7h3Rd7g0vticWRnlF0hLRYJlWEU
 J11vlihKosclHpgozEmXpuL5jQ2vSCiM3NrEU4tRocIHjnhZc6yKJcIs+FIigszZiF0j
 SRcDMKsr1rfIe64n5JNJ/Avyh8XmUOqs4wjzFV6mqK5ZzR9vwLydKqZB+ZPV9IiAd+sf
 9kz+794W3kypekFqkXO1eEtHrMTId6uQZoxlVZfMyb2p2vMLXScI+fBmPF1b+vOmFwJn
 Nx5Y+q83c16yaOFenOT2v8sqQjX929A+V6NI14Iy/iDNHghkbORYQRKWY1nPSRiuW2Tr
 0H4g==
X-Gm-Message-State: AOAM530Rz3ZjcEAklJcX2K6fenA76/9JW9N86OmZarXIHb5/7toRJG2Y
 ov1l1dGVOsD0ItbJxa3D5esotHeCy/FG4FhvdMisay1TOVaA9oBxcS4+4/iKf7YCiy+rtnhTtVk
 3jQzWRwUpFzi0hWnkIU/oYgNYLJCDx7u+dEXN9iTY9eHChoNA/DixvKyA5jifpQ==
X-Received: by 2002:a17:907:3e0a:: with SMTP id
 hp10mr12537346ejc.156.1635325141142; 
 Wed, 27 Oct 2021 01:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVKzkkb7tEEtIpvhL9AV3Q+PLqfs6DJ4yTteGGG8ihHj8wuZo0CiHvCyo/76FzZ/nHMUnn7I4Mj8zmvSHSzvk=
X-Received: by 2002:a17:907:3e0a:: with SMTP id
 hp10mr12536862ejc.156.1635325135141; 
 Wed, 27 Oct 2021 01:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211026212847.43108-1-palmer@dabbelt.com>
 <87mtmuaodc.fsf@igel.home>
In-Reply-To: <87mtmuaodc.fsf@igel.home>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 27 Oct 2021 10:58:44 +0200
Message-ID: <CA+zEjCuRuKtZAhkS_RFyby6UhLvYmg=4BdnXEwUdaCdtbB7ZAA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Make CONFIG_RELOCATABLE user selectable
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alex@ghiti.fr, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_015910_368528_63492992 
X-CRM114-Status: GOOD (  16.93  )
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

On Wed, Oct 27, 2021 at 10:03 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Okt 26 2021, Palmer Dabbelt wrote:
>
> > +config RELOCATABLE
> > +     bool "Build a relocatable kernel"
> > +     depends on MMU && 64BIT && !XIP_KERNEL
> > +     help
> > +          This builds a kernel as a Position Independent Executable (PIE),
> > +          which retains all relocation metadata required to relocate the
> > +          kernel binary at runtime to a different virtual address than the
> > +          address it was linked at.
> > +          Since RISCV uses the RELA relocation format, this requires a
> > +          relocation pass at runtime even if the kernel is loaded at the
> > +          same address it was linked at.
>
> When in doubt, do what?

Then do not enable. it will be automatically selected by other configs
like KASLR, but otherwise you should not say yes since you'll just
have an identical slightly slower kernel.

But I imagine you mean adding a default value for this config? That
sounds right and it should be "default n".

Alex

>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
