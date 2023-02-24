Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718CCC6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 22:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQ0YKMirB3qyrzlj62lOJg8Vdl38CCgTOzsOKhPw0/Y=; b=hMvnorpMsqe+pD
	NDowLTUmDqTL5RwGBGLXJ/StI0fL8XEup9pDvJOu6Gw06jStBOJqxn9QFmoBsjQzK8UF3Dhrv6h8g
	hLQOzfVCpP2Lz3G0DXlaVz+rBUyObPrEzjCpyAIbttt/mfGYvoau/u14W0iuA5L+gu6Aj6HK/TaF1
	czdrMPMXa/jmkRKYKh3zgbyiRQ6+j0OM48QnVY5ID5cRp4W+itZhtQ8Bbnmx////O96kAS0vfs5G0
	DNjri2OIQ1tTrjSaJOshs1fCDNWDQKnO7LLAMmQCkAvYrEcEciUv7TefDF6C6XFjY2ROUH4ewbvm5
	DfO23g4C8TI3lxfVxOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgQs-0048Xh-8c; Fri, 24 Feb 2023 22:20:50 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgQp-0048Wo-Nx
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 22:20:49 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536af432ee5so19877097b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 14:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IqQPJNfK638HDk4ODq+fMB7JJcK2vXRJP7v56xO3S9k=;
        b=HAJsEdyAG1cOY/j+Vs6v1Ro4klVsPX0l7htKPdL5rdyUoEkEXwc3EqGqF/31BqyoeR
         8Gc70jiB86abn5T/EFSlzm0tBLZDe6nthy/OgbziasK9ExC9MssJnkYayGu/7y7MiZ6x
         vLpLAmkBnQLWWxaG4HdTQW/iO+UoJzutbQCl7iyYup9ojoeDv3oB+BPX6w3NMnFlrvmF
         B7v7bhSOYv9K5Go8X+0CQR3SM7rheJYcgwBzKyef9i+y0/2WLsP/SiEOJe2jpYGOKM8V
         GGno0ZpW+yaMgPcdZajCU49icbCJhJim4ne8u8L16Ek/F5u7Tu8uMzMcwSCfFLS1wYqb
         87tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqQPJNfK638HDk4ODq+fMB7JJcK2vXRJP7v56xO3S9k=;
        b=zJK6+UcaxMqKU98fcvJjcXA2AiIubeCZ3Z5cIPRAX9BS9uK9gKwqygpKzhZjUt70LY
         q3v3uBI9CPICx+DiOQrwPbmPID6tOKprWFTbXMY9iZdiBnxgOFhRhtLWbEjZ5MHRco9P
         vfL9ce4L+yPad0WFV4AeJH3BvJKrFcgwapDx69JLdbrvVVuppeeB1745DYl1ad2ErG8p
         c+XB27xop6qvfJRCYrdlqIfsztDduB0Haz1BRkOKGqHl+pWEc8FlpfDjzj7RZLSoYxio
         l7xB0GIR17pNSklJRm9Ud/Nmur4IGNp00YB9P35LjSDZP8Ki4tQJDjATnOe7ctMChQIr
         jlrg==
X-Gm-Message-State: AO0yUKUoOQubAaR0Nue36O1+l/9XpEcjO8uGG41y0Mt3OysXuXeoCvxo
	FbSQRQ6GZAO3nOJZ/98OgUSnu1SvyfyQ8zjzsvE=
X-Google-Smtp-Source: AK7set+BCO4mvxBMIls68YhyM4z+vOB5zPgpVOZ6T1wB6+em698PSXYG6gf/JzasjxCkItBDvJ2GBFZIoNFQhY4OKBw=
X-Received: by 2002:a5b:ac8:0:b0:a06:538f:24b2 with SMTP id
 a8-20020a5b0ac8000000b00a06538f24b2mr3802600ybr.2.1677277245871; Fri, 24 Feb
 2023 14:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com> <Y/kldmYcl7+2FBRB@spud>
In-Reply-To: <Y/kldmYcl7+2FBRB@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 23:20:34 +0100
Message-ID: <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_142047_820982_1F247E22 
X-CRM114-Status: GOOD (  17.79  )
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

On Fri, Feb 24, 2023 at 10:00 PM Conor Dooley <conor@kernel.org> wrote:
>
> The stuff that I have lifted here all had you as the sole author in the
> "rust" branch downstream, which is why I gave you authorship. Namely:
> afba78eacb9b ("rust: generate target specification files on the fly")
> 732b3c386328 ("rust: target: remove `cpu`")
>
> I don't see anything from [1] in these commits, so I don't think that I
> made a mistake here.

It is true that I converted the original target spec files into the
script, so I added the final lines. However, in that first commit some
of the deleted files (related to RISC-V) were created by Gary. Thus it
still feels a bit wrong to not credit Gary or even mention him.

For instance, consider an even more extreme case: somebody moving a
file or doing formatting/whitespace changes. Would they be the main
and only author?

> It's RFC for a reason, I've had a poor track record with off-list emails
> to people that do not know me so would rather do it this way :)
> Probably should have noted that I wrote the ~placeholder commit messages
> though, apologies. I'll sort that out for a potential v1.

No problem!

> That's what I did! Unless I missed something that was non-obvious, the
> only name on the commits I lifted was you. Is there somewhere else I
> should have looked for that information?

I would have traced the commits back a bit more. For instance, in the
first commit you mention above, one may see the RISC-V target files
were removed, so that means something was already there. Checking who
added those files leads to a few commits from Gary (and one from
Daniel). And then it is about making a judgement call trying to be
fair :)

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
