Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F318C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 20:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHd38g4hVvoW6uNM+8dpMSP11bRmhIpUbEt/9bwAoek=; b=D9Zndr7zLjYJh8
	GU339DpB1gDHwumGoyYjMcYdY1dYYJYhPvRdIAzQ295M9/gfOxAceqF1JqlbhNSlYL9pm29PveugE
	CYM4u0WYNXipjF0HbSC1uWymlZ17T95s47iCHkTAfxpD0eE9FPaxKqAI428xAD/OTtnaB+Qw/bO5w
	EBS1VmSTrFnOWetXAkdnewuzLw4qW9Amt6xWus9Ud/2Re7ZCo4sh2brBZXhouEw8Azn4D/g2n6A94
	KfJYWoL2LL/AwEr9LhSReqxjQDimMeuh8Rfe9C7YvjLNJ2oA+d+Zh4bRBj1ngme0tNsTVcimlrHrm
	JI5sEtUigeB1tP/k/UQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVetj-003puc-J1; Fri, 24 Feb 2023 20:42:31 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVete-003psR-O7
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 20:42:28 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-536be69eadfso12569637b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ldkH3+tipVLOPM0MWXmtHwekgdqITx22yGZynxWxbI=;
        b=dtF6STP7th/ajy1mC0vEUSVWlM9pVmOG3Gn6XA5sl3LA9B9wF3UHwni7+m64GxjbOR
         VJ8YtDgIepMCXzo3IqidR6Cotkep2peyv5PLBE1o4qjySmPFQpBz1gTEVu5KwgHz/Avx
         eYeoxs0AEnbKsW+Lwxf7bJsfpZIVDXS8zZWVLrJl03lvJ4GG2rCmVqfdsSFMTAvwZ9hp
         Jvc/8QtR/Kx/MlWRP2gXnMW5ZZ1S0BWrIDDqfxxr2ZopFa9eZs9Inw++1fPcqsN9pfeu
         HkTMFCZv5T8sYU5ua56Z/XQ4SqtIwDjglQCvQA22GnAvaT5WFS0PSBOy/wmaUJuWNFfX
         HUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ldkH3+tipVLOPM0MWXmtHwekgdqITx22yGZynxWxbI=;
        b=fkPQ+86ZzedjeUBb3w6+/eg5bm7z+PXgevm7w1yajpQltEPrBgER4lgDItosInQ7PV
         lsFnHHhNdC+Cn4ljKZZuxdhP2iSJv+yrBpZhmzf1u0qLZL1JLOXFJW42qs0JUSv5iJn3
         3c4d/rMjXrGatK1iPa9zp7qGSyk4emgydgQDBD6vTF8lopTs/P5xTCuvEy7IIupMV/Hk
         3RQidCANJ0W5uQ80LRit8y1BjBSloL877SulbLwUQo3YeS4FbGoRmyb5LBUxr59z8nux
         KGImJr9mDBGfqpIaVZzAULuwdpP+bPVRUDeApTVh5aXqx82Sff/ySd4iUpBA27JS/0O9
         7tfw==
X-Gm-Message-State: AO0yUKWsRrPQlbdIlyOAcWY+v2kH8JmRnFlWykyERhVnP8DBN2fEZ9K3
	Qtpik3iymyYKsictmKsTkncGmx1XsPZVi1JATjk=
X-Google-Smtp-Source: AK7set/+ywY8A6LUpNjag7/xfz0UOWYQ6RUky53j75FCT+hoIcIZqEDUzCcFtByz4LcO4y0MEBVqzL7jJFm3tgkYRFc=
X-Received: by 2002:a05:6902:1602:b0:8a3:d147:280b with SMTP id
 bw2-20020a056902160200b008a3d147280bmr810737ybb.3.1677271339810; Fri, 24 Feb
 2023 12:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
In-Reply-To: <20230224133609.2877396-1-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 21:42:08 +0100
Message-ID: <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_124226_803749_D78590B8 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Conor,

On Fri, Feb 24, 2023 at 2:37 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> This is a somewhat blind (and maybe foolish) attempt at enabling Rust
> for RISC-V. I've tested this on Icicle, and the modules seem to work.
> I'd like to play around with Rust on RISC-V, but I'm not interested in
> using downstream kernels, so figured I should try and see what's
> missing...
> I've tagged this as RFC in case I've missed some "WAaaaa you can't do
> this" somewhere :)

Thanks for sending this and taking the lead on RISC-V -- I appreciate
you put me as the author, but in this case, it was actually Gary that
started the RISC-V port [1], and then I sent three PRs on top later
on.

When submitting something on behalf of somebody else, I suggest being
very careful and ideally contacting the authors beforehand. In
particular, if there has been any modification (including to the
commit message), then a note should be added explaining so.

Therefore, please double-check everybody that contributed to the lines
you are sending (e.g. via `git-blame`) and add them as
`Co-developed-by`. Also, please add a note of what you changed/wrote
e.g. square brackets, and `Link` tags to the original PRs/discussions.

See, for instance, what Jamie did at [2] for arm64 or Lina at [3].

[1] https://github.com/Rust-for-Linux/linux/pull/225
[2] https://lore.kernel.org/rust-for-linux/20230125163739.3798252-2-Jamie.Cunliffe@arm.com/
[3] https://lore.kernel.org/rust-for-linux/20230224-rust-vec-v1-4-733b5b5a57c5@asahilina.net/

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
