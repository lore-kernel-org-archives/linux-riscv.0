Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80F8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVeyycgkiLHJILx+alJVMJQEy0kaWzmeBWfJ41jxeXI=; b=AusyDrK//2OUT9
	DU65cyo+qwlptfcOQsM2tamHnPH0rRFxq6p9qQru3BFkFmIUVwbkEgGaBeymF8CCPfyfkaBpGTfRN
	szfhi9KyZR4k2u52DEOVC/pLRUAi/A9zFjoSqZdKrQvu/sSO65A1HNA4Nanq9v0S8NLnDRZ/4N5S9
	KfQRPLK/JOJx7cXqq75x4kY6OqkA3rOWguLfNDpvE/ZzWaUVs2ayx9GjFudKk6MLfR4mCCEuqAUED
	HXgZQ5gumYDcGiNZis4W+tbB/IhdAT5RNq/0Gz3uwTE0Aj7vnJlyo2Gi+jKyWsekt4EjsCUee8wwK
	N8Hb0L2uts4VZENOrAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRkR-00CGOl-2a; Thu, 21 Apr 2022 08:01:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRkC-00CGHE-Av; Thu, 21 Apr 2022 08:00:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id bv19so8316333ejb.6;
 Thu, 21 Apr 2022 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IvbH4EZL+5AN5QzEHqEkY2O3ivfSAm4vpHw9+hhvBhg=;
 b=l9A2zxVr+iaQxUxYrdl2Ms8QPgKKprVPWu836jDS1a9kDgOF87eiKg/WQ2Pp7p0uU5
 2yNRXou7K8UFGozJ+zY/Z4nvAWfNQL2rfMjP+xXVlPOuM9uOjKLpuuReXJ/1yNQdQwuh
 j0rwMLAJikQsK++NSTkjAZZIpdlqPGGrisobY6AkDBUSn+EF1pPZ26RV1iYw2+CmyG9Z
 D2LmcczIZ72xeD8VaXUH0mDdLEb2aoTOXjcPu5w7P06BXPfBaOVOvqtrL86fe03Il6B4
 EOW8KU+HycFTbAN4tLYJDkZ3tbTG01Z6v9mMOvBRakLpz/3LsxFq95QSfevhyaAXz0Qd
 bVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvbH4EZL+5AN5QzEHqEkY2O3ivfSAm4vpHw9+hhvBhg=;
 b=doZqW9h3/OGqWrQ1cdHve4hJdQXNzpS9/vyYmlDMJ7Xh4N+0POHfbvPPb0Go+JTuDt
 oIq5MhAvJ7RYoyIzMyFry8Funz2egRynzluR7KJK1AIdIjwvU3K5ElJKklZnzo0FtGGV
 PTfhodVj4d4U9qOlKoSOgkDq1pcMvrey1DgwD0LXwZ6mEIcPYjMp2+oWNOsxGZAvLXWg
 MT3sUreJPCCriq83hQBR9gp6jr+X8gZkU3aJt/25+501GrhkHVtExTYt19dhF7+UqLpc
 d/pROt1byL5YbPXy2kbbrRz90pa8f5IB4wOYwFDF7km4yp7x1UaSowooY0DFvpjsuMFH
 mDmA==
X-Gm-Message-State: AOAM532rwfvoDHRZyeF9eCrQeG5TCW5C3uNN2MPKU66Fl9z5gBsoMsO1
 OW41sX9p/vcyTxQuC+CC/4srAePcmcEOjEMKk/A=
X-Google-Smtp-Source: ABdhPJwZVRm8KFRbk9B79qovRjYyl5U7m19/ioAtyBVJMdSRPYNtjRxgrnX2fTY7SlA9nxFEZPk7MVR3ZDEQhaVY+/E=
X-Received: by 2002:a17:906:5e17:b0:6e8:b6b8:2b09 with SMTP id
 n23-20020a1709065e1700b006e8b6b82b09mr20915528eju.477.1650528047664; Thu, 21
 Apr 2022 01:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-11-Jason@zx2c4.com>
In-Reply-To: <20220419111650.1582274-11-Jason@zx2c4.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 21 Apr 2022 01:00:36 -0700
Message-ID: <CAMo8Bf+ox2MQRkqsTaOOXOchOWpb+7P8GQ1c-TjwSpDgttXoFA@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] xtensa: use fallback for random_get_entropy()
 instead of zero
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 linux-mips@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-um@lists.infradead.org, 
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_010052_405561_FF490B57 
X-CRM114-Status: GOOD (  18.00  )
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

On Tue, Apr 19, 2022 at 4:18 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
>
> This is accomplished by just including the asm-generic code like on
> other architectures, which means we can get rid of the empty stub
> function here.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/xtensa/include/asm/timex.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
