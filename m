Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93727C64EC7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEwwKowiYONPMmO47O6Lw8qbycuxY69kDQ7lj1eYChY=; b=Ve/btFpA8QYx2h
	vuv7inXlGE00dOHoFk61M9tv1PYlJfcjViDHXsT0v/rdS5ZfceASXoNPhWb0V/GuyEo8hFy8f2R3E
	su9d8ksHtrFtrnviktNV9wzhIHebMzMB1+My27AIOTxrWv7yb20ZSJju1Drvwh3xdOkPwj3/c1pGS
	1TnxbR3V0rpCaXlIDeW31+jf5MoP/VE4Ukj4Gutwc3p8UaOqMwe3Xz0DP8iymUHWi1OqtBzkj3VUa
	Ze2OOsHxVYl6JeUdoAiDO+tw6W5WveE4Iz9xpINeT62ze/2br+yVtqnIsgzctgfc+DGcv8cTYAl6f
	DVLE2fbGGpExowtSBTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVpnc-005DG8-3u; Sat, 25 Feb 2023 08:20:56 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVpnZ-005DFN-Em
	for linux-riscv@lists.infradead.org; Sat, 25 Feb 2023 08:20:54 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-536c02eea4dso42322757b3.4
        for <linux-riscv@lists.infradead.org>; Sat, 25 Feb 2023 00:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+rltlccYYLls/6/80VLpV3Rr0SI6i9Yf8jKNTUIakO0=;
        b=N1+ynUBP7BIR8yJMHSCe2coIJ9/FqCzScTFU5QefhCaAtsPLV2gl/fke00KY3aAQ34
         gPD6eDZbDEFK9pfdcCc9u5rjZAKIZJPTp4CzUH4S00DYx+A8kqDSWoWYWgMSWwUzVjPt
         1/IuNUiTrGEWQNlkt5fobCt/CdVl/29/1SeP6QdfOI7ZcKl8Rw0NlufJPiNRmQGXau/d
         nRHYTbmcKdSeDGwmwFHGPDtpyrfbRvFtnqsAoFH/oBTwyYxMdBE7uijjrwrGn5ym/CDb
         nON6om1eA2m0SAHZQzzNC/iTKPX+HssPbFK4+hVk5mWJuCnT3ofpCsnPS2SEPlTskSU9
         5PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rltlccYYLls/6/80VLpV3Rr0SI6i9Yf8jKNTUIakO0=;
        b=6hQK0SEBcXPBQjGZDh8M6XGjyE2vPoW4scdYClx4AVlAVwwg/EURLpcj1rPNbLLKXX
         MA4klYYgwBZiSuwBdsIMcaR9Uz96mSln69KvusOXBnAyqmoAXKJ9GzKm3Rlbqe8Q9acx
         tTFS+G0/G8HESz+RZgXjWDgZRbwbCUtPMWMam61fmM6W+wTCBpSCU6dd7Lr0ybdMuKYz
         HqBZN9s66rUvIlJrwIuUvEp6Vpp/6OSLLj+MYvgevR7cpnZ+bQBo0QzAt0fNwqRZlNN6
         lQb5T+x+EcldY6x/5ulg2bOmy2ZRvaGZ2O4Xq1fohRXuGnKgvQeMKZGlk8F/Y7z2T6Da
         DrKA==
X-Gm-Message-State: AO0yUKVRQB8FtCSDuPLRGO7hLkSamjrzpiyN5F9JWLkM360Nc+EoswYz
	mBn2u8hw2OvcTDnTlbTlfSLLTovl3dFJnGDmAvQ=
X-Google-Smtp-Source: AK7set8e++moIBaY1NhFio11TdxU4kRfW6YaKQ1izSqLuJaajhPq5FeZvpdANs36njnJ85ehD+Io941NVzULcQEL6AY=
X-Received: by 2002:a5b:50b:0:b0:a36:3875:564a with SMTP id
 o11-20020a5b050b000000b00a363875564amr4043718ybp.2.1677313251960; Sat, 25 Feb
 2023 00:20:51 -0800 (PST)
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
 <Y/kldmYcl7+2FBRB@spud> <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
 <Y/k65INC1//tXe2U@spud>
In-Reply-To: <Y/k65INC1//tXe2U@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Feb 2023 09:20:40 +0100
Message-ID: <CANiq72mX+vCw=4a7X2oDR-WkVcaQ4KEV-FjYUQZKonJ0anw47A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230225_002053_535372_7D337336 
X-CRM114-Status: GOOD (  13.14  )
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

On Fri, Feb 24, 2023 at 11:32 PM Conor Dooley <conor@kernel.org> wrote:
>
> It was a few hours ago that I looked properly, but, IIRC, it was a
> conversion from config files to code? My understanding was that
> config files were not copyrightable, hence I looked only at the
> authorship of the code. I'm usually on the anal side about SoB stuff,
> so it is not a matter of me not bothering!

It is not so much about copyright, but about crediting people fairly.
Gary has done a significant amount of the work that eventually became
part of the patches here, and I would have sent the patch with at
least a `Co-developed-by` from him.

Not to mention every commit in the kernel has a SoB, regardless of
what files are modified -- I would not remove a SoB from somebody else
when forwarding a patch even if they were all non-copyrightable files.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
