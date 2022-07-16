Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE57C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StoKBOWRfNgSmdFyCf3ayioKI1Ck7POEt3umyF0Xpqw=; b=t9EOOIWbV9B3Xn
	rj36xxmME4WcVCnPyL+4RNlKwKIElWrdHl6Xj4HkcYWLKooWQWBHpZLB0TA2mxlDEEmPPo2QWxliY
	LSo21fL0vGZ/W2kafTpJ+ZOL/Zlv7QL0Z9j4tOpVM/0XInwIFPLuVd965h/TkbCOHXfkEQHYvJ6u7
	KBTlyThlvkltFXPYkME//vO2/QUc9uv7Y9Xr7Yh4cYmZ9Yc5tuzRaFyUtOb7KuRLgilI32em/x3Zd
	gt0y5Lnlt+DerwZx01Zu0VG6WSSpZ7X2YCqLUD/+gSDsy0HbzdFR2YPlONLk18ZWkjkJXyaZFw3vJ
	dzwTY8S8J9fjb8PgjYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdcb-00Eq6l-2d; Sat, 16 Jul 2022 08:57:57 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdcO-00Epy8-Hs; Sat, 16 Jul 2022 08:57:45 +0000
Received: by mail-il1-x12d.google.com with SMTP id l11so1472071ilf.11;
        Sat, 16 Jul 2022 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IYks55HxgsoLlm9FNEz/2R9Y4bixjWKaygGPwKIVjx0=;
        b=m7RolDKDIlPqQgPf5OTP/N6sK1eysv8GJE4Xfn8CjMg0SxwuCaAjEySP55tmXp5JVI
         UpIwNpbxTFBX8XrQHPTU10osewAMlkpehUSHMxLE/z5AscetNKSTakXBmT4sFuZxvdSj
         6pLhVxcEz3FFMTM6nM4GdyvOJqmUEFJQCr3AOL0xm1yUFCsUy47Z3rBXZtMZzmMP/h9s
         7WpW+a65qg8gkRMjnKQbAyPOY44lzJH7wId88CcIuxY+ie25eQBbKgS5dR4nb4qAp0au
         boOEvL+LfokeBh3nWrS03XXVnUDvFPo3DxazMu+hCulyNuyUUotHieO4rDvfdCn9+u/Z
         mv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IYks55HxgsoLlm9FNEz/2R9Y4bixjWKaygGPwKIVjx0=;
        b=IV2/PYYxFnNQ0P8Qv7V7MwRUrOsfociQwt+LKFuJXcgqKJ9MXTIqHDwKil7HQ7rF1j
         NU2borKZIzhciQ+S1u3TopQ6JNTYaZZlH1URy9saVJH1+gfm5W16j+UpHNJvxnYcEEB6
         uEIvYyUqiNOReLOEetQJzmi2M+XYsV2w594D/d3yd8gqGsoqlAzpnN57pJ9OYM/wvrD/
         fubgBvrmx4c6a/TwGGLnvwVKoePS9KfoAbQ18iopx0AVd/qNFjF9ugIe/tBUOfzt147/
         WwtAHS034b1hv8EmUaBdNei8HX/67xV9hId8BVfXaq5HLqrpNxcdabhcwEmJ0ZypsYgE
         n4SA==
X-Gm-Message-State: AJIora9XsksHtMzPiqgVIXZuV/dypJyr/eRMWphBNUosYniKDQnMTcnA
	3JpNOtvp75lLIU1uLJZiir5y+xNH6B//H2s8EgY=
X-Google-Smtp-Source: AGRyM1upiXNei9Ij258Ho2aijo3CxpUzFbH2CubB6AzfY4tMP/5ochBIlN/TgfrRN46dYIn9zQ7KIb7ZCJ9pwMhj3ew=
X-Received: by 2002:a05:6e02:1c8d:b0:2dc:8162:282e with SMTP id
 w13-20020a056e021c8d00b002dc8162282emr8874969ill.5.1657961861953; Sat, 16 Jul
 2022 01:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-22-ojeda@kernel.org>
 <CAK7LNAQZOTjxJyS3WC1sM7LE-An7DL8xoW=-s1ONe7cq4YukNQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQZOTjxJyS3WC1sM7LE-An7DL8xoW=-s1ONe7cq4YukNQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Jul 2022 10:57:30 +0200
Message-ID: <CANiq72k1aPQuvAL=TqNQVBZBmxojKfPBKU3v_2_B=731fhuJbQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Finn Behrens <me@kloenk.de>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Sven Van Asbroeck <thesven73@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>, Douglas Su <d0u9.su@outlook.com>, 
	Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, Antonio Terceiro <antonio.terceiro@linaro.org>, 
	Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>, David Gow <davidgow@google.com>, 
	Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_015744_653307_27C2910B 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Masahiro,

On Sat, Jul 16, 2022 at 10:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Is it intentional to print the successful message to stderr?

I think it makes sense to change it to `stdout`, given the message is
the main point of running `rustavailable` for normal users, and those
that just want the status code may ignore it.

Thanks for taking a look again!

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
