Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67BAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tlvnCdCiOpsmiPjLPiUuXwkhjeSYHnI6Cv1arZ7ubg=; b=2y+f2E6ogZpYHM
	qjtfqncrLKmzSvA+jUiTBi6LPuDVDe3N5UKYKtRv+ExGsl0Zm59h1kB1pKMaCkmURpqIrMXDGsa8A
	pxyzqI6rN6YhGhCa5uEjpiZR5bdqyTIFs0kdYwiPc0U8c6XgIRZrycq59Zr6A3D0WnrkPCatzyE2g
	dt22r1h6oXQNYTplHnBF/JvnfcIAer/iSnCNDiB9UXQyFNb+vXsda+xz3DVfdi8Pg7XziHkHaYqNW
	xPq3VdrzaGd+9AbPterBsVxHeNzas0UDMaMcqfuYdueYxCV4uA7ikaIaAyzAqedIunoIYlqUc4RCh
	oinlXIRlYd73pcJiB/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhwB-0062q8-0o; Tue, 19 Jul 2022 07:46:35 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhvx-0062jr-P0; Tue, 19 Jul 2022 07:46:24 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8XHV-1nRdX60aYb-014Soz; Tue, 19 Jul 2022 09:46:17 +0200
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-31c89653790so131734347b3.13;
        Tue, 19 Jul 2022 00:46:15 -0700 (PDT)
X-Gm-Message-State: AJIora8yI/t1hSJ/OxZ7EpQfcerTRveEuwA7lKB2yqYLI8EWo4Zwz4HN
	TnLtJVrLNCU0PPJPsK/x3yDWHat2fN1w078RvKg=
X-Google-Smtp-Source: AGRyM1uMUiVIGFjzA5TwWJRveS7h+exlQBS7bP6K2zksjYwuZuF4ih7u9nFVzpOHSizyHdxkqT+sJR2F1c3sqVPvIcs=
X-Received: by 2002:a81:1914:0:b0:31c:e12a:f33a with SMTP id
 20-20020a811914000000b0031ce12af33amr34887188ywz.209.1658216774978; Tue, 19
 Jul 2022 00:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org> <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
In-Reply-To: <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 Jul 2022 09:45:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
Message-ID: <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
To: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:7giq/taAA80iDrRGeytiiycaOr+J7mwbln189QJA9Qxq3gFQWEC
 5gGUSjlIu6CChqNtO/DirykqQztIS9O2xl+ga8P10jgKyVApL9o6UWlani3z7xrIYtkjiJ3
 OcFb+Y0WeUIGX20bcUtGI1cqNNgJukLrDh8BZa6/e+FyYCZm4TAYCYpYugTkVC67KxBLMJK
 jb5S8qNrkrGiGdBkGXMXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4DaNf5TPFPQ=:heulTc26qqL2SFjOnCwxUx
 jrP5IlWTvmv4h29w9pJtRj2zHyU3/hHGyI4mZOkEZj8+Bok0iRUzUXGaETR5jKgsJ7NqmqAId
 z1X4z60cO8XZDLHMsoE72OrNj0P6bIHh7Bg9Opsqa/DuJACVAvxs+A7qiwZGQiR+PgMWMK2hH
 CKNiT5ENJAOT3FINZd3GUU1YzSlxM7iKJDL/JBFX/WIi1Kuiwsa3dyfAOd2XNVXP5eMFJAHwh
 Z2na2rDjkI1EDkCPa+NBRk6SC22niuCLCFAeYErxeDNDyYQnNZYj80CPwwLi7ZHJsepoD12Qp
 yZ+j2VK6mdnmuBhiGBbbDEKt/ZtQnqup57eIBNeKBdqGFlBpQCm9L6XqB4aCY1JWs7Nkl96nO
 XXoJU8XzprHgNhLhBkxT3LLubUZj17X6W/Fq9k+uWwN9bpCSleKgE0BGUvhLnuecsDMAncRhq
 yJIA/ENGwxHCxf5skL810HjHHlAcHjpIGDPGbptXAA6r3bcPAHh0GGrLWZPOX6OEcNqF1+jCf
 My9jM9O2F3vw4gHwpS94wnZCTiTJ667+UWechoww9ZwVh7lmI77SvSRD189P+c3HALSs/LbhM
 baWyObkB0JKKgRSWObcKqYcIlKZMAKrDg1XznGeBFCS1EmBtwNAtDa3O9SoH4ExjTiqU1kYXn
 a8rlGR8mKAR18EAoFuvCw4aJpcvpawWWMAQIUtf/+CBuSO2/llYkBe0a1hEIZMnZGINEmQOLa
 /m3QzYBykurOZ7B1foR+32kPgn+L9xgBcsfYhFNRcywW5jDsK8tUg8PTzQQyxSwbu+K+FuMZp
 yOfQbc6C9gAA+ZqfGonxdr5PZxKbNFyuGYqX7aNkjYK7Nbil6Tv0LuhJ2ir1gJW5wOOJD5952
 LaW2j8/HUZQFLQPxyPfW41N9baRN7p9Hlsyvca/G4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_004622_151997_23BD9B1D 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, Jul 19, 2022 at 1:19 AM Stafford Horne <shorne@gmail.com> wrote:
> On Mon, Jul 18, 2022, 3:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> As mentioned before, it would be even better to just remove it
>> entirely from everything except x86, and enclose the four
>> references in an explicit "#ifdef X86_32". The variable declaration
>> only exists because drivers/pci/quirks.c is compiled on all
>> architecture, but the individual quirk is only active  based on
>> the PCI device ID of certain early PCI-ISA bridges.
>
>
> Ok, I was thinking of that route but once I saw the pci device IDs I
> wasn't so sure it was limited to x86.  I'll go ahead with that approach.

Ok, thanks!

I checked all the PCI IDs yesterday, and I'm fairly sure they are x86
specific. While some related products are general-purpose PCI-ISA
bridges that have shown up on mips or arm boards, the ones listed
here should all be safe.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
