Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD90C64EC7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6siEI1WkQcmc6WeNwqtXH1rK+IUTSvEgjM9V6dTQ5w=; b=Kh7WHCK91yWS8E
	1zKRwx6EeXVnjXlc58UKULuKapLEMcMr2Zz9JSzuXNK1KqlfDWmPYk/6b3KYD7E0c3VoyopUEnFxB
	6DC2pJV8etMRwe/Mquco4x1RmxbarrHwFNJqtGmReFGSGxkYpnKRjL/xWxMW9b+LivGg4xxJBS9DN
	th281isIhScw9L0pKwcRV0CgXHmEbrLAAcbBYcu6YzIX1CpdQnydqfOKNc8YO1agl2MQk5D5sjFq5
	2W7xMn0kMXKrOeDUCSs04mzNU95QJsSM4RAaMRwEtzLvJnoZaTP9Zs6/eGRWt6eGMnh/xnIfUNdh4
	TyO0r8afbyLXG+EbtP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVq3s-005Epw-Ht; Sat, 25 Feb 2023 08:37:44 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVq3p-005EpP-Oc
	for linux-riscv@lists.infradead.org; Sat, 25 Feb 2023 08:37:43 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-536cd8f6034so41880557b3.10
        for <linux-riscv@lists.infradead.org>; Sat, 25 Feb 2023 00:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cz98R7Ca78KCbduT2+9H7VwReVgB2OnNZzHlXdg3vPg=;
        b=LslJvRDEXLo8YVQdMr+NYNiAU+2KWc+5HoLP4elf+87SnngnzsWjSRG3ZP1v2tH1Vc
         ddgHtrk8mJCTJzMgbZ2BDxvt3sY5a75hxfx3qcqc/1WEUGJvZbYJnpDRFoeR2DEKm0L5
         Tzb+OfXPYDgsLg2+4/K3Hz2vWBFMJ3LHj2ND+65Q6g+uSnn2eYN0Swb/k6kYCnON/D8Y
         cW+cZyRn+cEVHWBsxQZQrYbsva1lI9AhJN6C6aB9wLPgdBtBNIXxMdcfdhONhY5HkI8X
         pgDjKPr6YL6jopKLbCsYCzj0yxEY9juoLF/FG8v21O/vhddsBND+QmTbxxW3hvPz5tVl
         3pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz98R7Ca78KCbduT2+9H7VwReVgB2OnNZzHlXdg3vPg=;
        b=axB1MKXsS6IvCHykz8c9aHVSEcy7cgtVR1G1nr8Pys77s6zDXpLcGl+GEppCYkMKpb
         V9ge57SZaCZUXMwht3XYiwIc7kbfJ7BzCtFuEYRpz9DlNKU9NGA+B72ZGUA52gVLrN9K
         LrJ/d2Rg8dMkCdSgNxoxQDC2mFLIzjxsy6+XuwsyPSXp50F4nb237LdM/1Nxt9tXQ0UB
         pvBMAx/CuPBxD7p3s8KhcRLLsthc0aSnNtrKHKtZHP/uAOVgq7WGuM0unDH+fNBk+cpU
         3lYNoW3KdP/wd0hr6sUfkEB5c27cYv+ZGZi2cpqzzgeRlaT8pz6qTlb5oU5LRhEc567R
         WRyg==
X-Gm-Message-State: AO0yUKVqS4IaRWgvr80J7BSLu2jd4vS+pIDvEiS3Noi8RJ/JG1RfngAP
	GGCSVVwk9+DtojRDkBhG1MbcudACQb4XcEUvbPQ=
X-Google-Smtp-Source: AK7set+hqtmF+D+rwbu85iQ+EPP3JZXUmywWfrmNyRB+ZMfHnjDwseewKGZ/t0grf+BbEU4WY0+ueRg+zQ4rY2MteRw=
X-Received: by 2002:a81:af50:0:b0:533:9ffb:cb12 with SMTP id
 x16-20020a81af50000000b005339ffbcb12mr6270206ywj.10.1677314260110; Sat, 25
 Feb 2023 00:37:40 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72nfGfqnk4QyKsf3kmjgBVPG3WFLQqd7_+jLcYh9jG+fQw@mail.gmail.com>
 <mhng-b792c358-a678-4ab3-aba4-4bc38da55744@palmer-ri-x1c9a>
In-Reply-To: <mhng-b792c358-a678-4ab3-aba4-4bc38da55744@palmer-ri-x1c9a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Feb 2023 09:37:29 +0100
Message-ID: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_003741_860354_D5C5CDF0 
X-CRM114-Status: UNSURE (   9.87  )
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

On Sat, Feb 25, 2023 at 12:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> Works for me.
>
> I've got a few other things in the pipeline for this merge window so
> this probably won't make it, but I'll dig in after that.  We've got a
> bunch of Rust-types floating around Rivos as well, so with any luck
> someone else will have some time to poke around.  Having a full cycle in
> linux-next is probably the right way to go for this sort of thing
> anyway, as it's likely to shake out some long-tail issues.

Thanks a lot! That would be great.

At least from our side, no rush. In fact, we are letting users (or
arch maintainers) to request/submit the architectures themselves as
they need/want them.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
