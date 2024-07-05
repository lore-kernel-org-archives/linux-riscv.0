Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14895C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJx7cU6pNV2Q+0LEPKP/CaVvYeBCrni4EP8SDaSajw4=; b=JbAHpWoGOXLcgO
	/0twF4aDbOgg5m1ToiAJS1IcwL5YkM3SNZlEcUwPp5Gdw082nuc1Z/UfAV+7x/Q8Vx5gM19ve4HUJ
	sXeuLjIo2cd0ButESSd+haK/yWw6hfk+f6U4u/oHl2/n9C7yvRYJ8C+A64YU94xiYOJB5rp3V4SNQ
	8yrmJIA3oEanTcGzlb4ATotyl+go7V/leiQqO4VbyQ402Mau/4WmniV4C5+F7cTgqKBAuEgqB21AP
	FcwXm1RFxEmqwgnWkfDvwPqI6Kb+y7yRYAivUQf+texeAcWCSXiaqGZ/wOs6h/uDwpd/c3ZjAGOkP
	+tru5rZT12jVtTjfmiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPnCw-0000000Gak6-2odg;
	Fri, 05 Jul 2024 17:58:54 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPnCs-0000000Gajh-2q9B
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 17:58:52 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-48ffc762640so322893137.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720202328; x=1720807128; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6rchAFSlYahM896I1I/OZo7qd5XWpA7Aq79k25WOCCE=;
        b=ghanAm70c7wW7UaI/wQvpHEbcVYD8oYwIaM8vfE8V5sYqS/3BwSzYC8GW21RqKEkCN
         QTrtsKV7p/2ducFrTR2oj7asZYUn/S15SetEu5EyhipGtrVNrTKLcVu9PrRMMSWy2dQr
         GIMzQVA7klC0aHBGnVDRnmQIpGA6MIPrS/UhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720202328; x=1720807128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rchAFSlYahM896I1I/OZo7qd5XWpA7Aq79k25WOCCE=;
        b=JsoTEU+NqfqrsTl0pHRd5oJ0i02sh4pTl2cfJ/Cm11vIMl6L5lrVoVPpTVKwvQPAvc
         I4L//laP5v/aHpEaUIfsvr0dyZK9fAo4sjzPdWzEqDa5H+tKHJA+C2A2LP4DKl5B1WuX
         m1C/A/MyRSqXrdw1VlOdmOcc5vjFLMrNXdETEu/2C9hdnZTij/W73b52rw/gmk8qmQC8
         N0FICP9UZTNNldfB6HWQsPnAIb7XR5SUsx/Oxl2GCjQxqc4t6+191dZN75Kmpw8e0y14
         3kl82pHjXyT0bj0sAIj9T+cF5j38M0CQivP42Fgx0HHBrjIuRMvKxAV7PziOyqQUotoi
         5zlA==
X-Forwarded-Encrypted: i=1; AJvYcCWqNmFYm/Nd5xZlNlkCx48bpgYra9+T+HeQ/jVnwwcnLoADd9Gtb2b5jHv2CjOkjg9NK/rbXNs866bnW3Uw+KQ3hwczHm79szC83Bic+jDS
X-Gm-Message-State: AOJu0YzIMqhVdquLKbE3xf0gDPXQKdsp6ihayCM9I+6OfKrIoCVYcxc7
	hjougm5xXnsxLEZGJyTQmvLdihEz01EdqkZ5jjMLdePcawPvlJYfHzsQ7aVVM8H3MYLpf5D/nKL
	LvDaPng==
X-Google-Smtp-Source: AGHT+IEPJRyyTF3lBDKTnB9Um/D76FSTwtbFHLlGpKU9/w0wqgR8EWr2I4FBcCPxxsiEOgwxgyJDZg==
X-Received: by 2002:a67:f44e:0:b0:48f:e0a3:7c0 with SMTP id ada2fe7eead31-48fee7dc049mr6062103137.24.1720202328385;
        Fri, 05 Jul 2024 10:58:48 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-810101878b6sm1026025241.2.2024.07.05.10.58.47
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 10:58:47 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-48ffd139a9cso280650137.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 10:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXX4FgvJAvINyHXwPQ1meKC/o/8hNNx6YmF7cZryRyQwDRF8whJK5g4KyU7DuWOOklZfHi8Kd/fd9y1y3sitwVRq6SH6Llh3funQH52PkBB
X-Received: by 2002:a67:b902:0:b0:48f:b577:e02d with SMTP id
 ada2fe7eead31-48fee7dbfaemr5668127137.25.1720202327405; Fri, 05 Jul 2024
 10:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240625040500.1788-1-jszhang@kernel.org> <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
 <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
 <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com> <20240705112502.GC9231@willie-the-truck>
In-Reply-To: <20240705112502.GC9231@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Jul 2024 10:58:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgRgDy8_=uZPZr4LRyF7BiN1nDNzUx7iRzrD0g8O+bh3A@mail.gmail.com>
Message-ID: <CAHk-=wgRgDy8_=uZPZr4LRyF7BiN1nDNzUx7iRzrD0g8O+bh3A@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
To: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_105851_112841_47A1A4CB 
X-CRM114-Status: GOOD (  16.34  )
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

On Fri, 5 Jul 2024 at 04:25, Will Deacon <will@kernel.org> wrote:
>
> we'd probably want to use an address that lives between the two TTBRs
> (i.e. in the "guard region" you mentioned above), just in case somebody
> has fscked around with /proc/sys/vm/mmap_min_addr.

Yes, I don't want to use a NULL pointer and rely on mmap_min_addr.

For x86-64, we have two "guard regions" that can be used to generate
an address that is guaranteed to fault:

 - the kernel always lives in the "top bit set" part of the address
space (and any address tagging bits don't touch that part), and does
not map the highest virtual address because that's used for error
pointers, so the "all bits set" address always faults

 - the region between valid user addresses and kernel addresses is
also always going to fault, and we don't have them adjacent to each
other (unlike, for example, 32-bit i386, where the kernel address
space is directly adjacent to the top of user addresses)

So on x86-64, the simple solution is to just say "we know if the top
bit is clear, it cannot ever touch kernel code, and if the top bit is
set we have to make the address fault". So just duplicating the top
bit (with an arithmetic shift) and or'ing it with the low bits, we get
exactly what we want.

But my knowledge of arm64 is weak enough that while I am reading
assembly language and I know that instead of the top bit, it's bit55,
I don't know what the actual rules for the translation table registers
are.

If the all-bits-set address is guaranteed to always trap, then arm64
could just use the same thing x86 does (just duplicating bit 55
instead of the sign bit)?

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
