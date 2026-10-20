Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA5606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fgXGwFNi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P6m/deWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0hOjZ5Wby8LUZMiLsoBA1Zu6/wx4/j7pEvRsHmTCMjE=; b=fgXGwFNik9cAa5pHFKN+7hKkEz
	PLnaPhSlOdE/S0S1IxrJc3EpTJf4COhVXIg3Ks844xP1sMpn/R/6MNHy80sRlImAYkTGkAJVoZ9kq
	g/ICKX6leTpIICOflMQmvz/gezWYH/9b4yRcBoMvvw77z+3iMlciDN8tM6WvKLYj4iUTLTb6uFNCv
	9EW/As9XEKDZoZj9OyUqdPdPQ2dRPrFfWPQJn9JjWOtmx/e9Cd0dfLA/iZUSRjrGreKaMfrRstrnq
	+0ELL7OWAVIFcQ7gppe6bbX6BjKOv3rVQ/QYF/kf/cpEuxCgwNPBDP/1eHfwBMNRcHtJGkYyU2oVZ
	Nw5z9ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDAx-0000000AHgL-3fgY;
	Tue, 20 Oct 2026 16:58:59 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDAu-0000000AHf2-3WcQ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 16:58:58 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66fc7e0ab25so503195d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 09:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515535; cv=none;
        d=google.com; s=arc-20260327;
        b=R7WoxD/lqcEAAJ/wZ4RcsxM9Ty9f9MDfwgIHxRG5HH2S/BTljnqBMt8v904BZWa8tL
         FBs4nljUL6a2QajHx0zr/v0DEaRCRKs5wqlN4SfTez67EqMPhBvFdeZyD7VOtiCw+M4S
         7K4l9xCHUiU3HbTeMEm4h4ZDGAk0M+y+tVnWFMcLtYwy0xRoZ7Ay8luiMIFEXT7m0Cx1
         40YBkOmla2qK3+DbCWjkK9op3+kFaKVMfqry1E2o4zvPsXylywFLm6eROjuESp6n2jlN
         mWMOcMRV78zXP9wvMrp87kn+FzeVHzf36VmmJpuvJG5BVo8J+V8R53qGQPvkcylJ/u7p
         A5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        fh=ibr5YFlxZ6+ei5l0ZfZ2FG8P+qwG/QeRlzlg1l8Eksc=;
        b=ai3liPMI577ovkdrgQ8LyOrDCdLL2aW8FiAN8gUFQUnYM7QNLP00/ODqVsM44MhQ/Y
         mMGsia8Ll6t4UDltHPUnTXDbW83xHtBQyjsUmUgdw3XQ4hk3k3Pp42lI3kuuqxMxyzZz
         OgeEz2dJ9G5mMJzpkzSx0eX1t87vkA6HHy5eH3bcAgkHFG5MOwnNnabYSQjvMz1zX6X0
         gMbijDbLyTy+hmKUca4ljblfndG77niFLS4hEKYRfuIzE16M5I+5f3vuSMVE+tVsmhUH
         6uFIvTsFNlYV0gOfMMMHhse3uynrI2gqMZzhLtPDvsyMBdshqfKqNA0j7/mU8J+cZyF1
         7mvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515535; x=1793120335; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=P6m/deWhOoReQG5r9VwOEL4hRPMSj17HbQ/0KAvBOohpw3c09VED2cpvvHT2d2D/QX
         gGaRaFa3omby/EFgSqP3O71sM4f4CTH2r3j5cw0dHvRemmIENd7KvbMBSi/SuVQ5zBrx
         +pTEm2dMsGllTq7GQXPi/7UfgF+S8t3VBm5lJj8k2XyaOUvStPwH3N3WT+xo08+2XPCU
         +hKlNBK+0R7TOZFbmMMOqrZZp01wY8cTsz80H13y+BzvknHQdj0wceRCWg/GVyxGYaLc
         jH1urfdiNx0acOM5WyKlzcrqaEt7i1+lTqE+AO1YnR0NzXrHd+NOi9KKghjuNtBECZLu
         WHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515535; x=1793120335;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=GmhJxC4n2EliqbX+yAyzETgbVD414Zxi6XIhqJh7UccxX6J3ZD+idnJ5KfgLQtd9CC
         O4e5Zt8I+FW5WufQ3FNB3mgiyL0hg8T8kzDnY9eyg0OGtI58jn1nk+VUX/qXmOc2xCK3
         oTdzAj2uDCSTO04CGi+u3SagZJaDcFk8Qrtd2t5IbXftX0aOnHX05uRr5lERgo1XphfU
         e5D5S04R5cFrsellj4Ncgdwh9rCLv36VGbhNRH6bycRXLqVnHULYUIurI6Dgo49EutSM
         S7XxCkh0fs6AGCV048w/7dzPm/23iVepTB65Z392ssqNGNvIW2wTU1cUIl4T+7xTshMK
         0t5w==
X-Forwarded-Encrypted: i=1; AKwUvByTw3DAGJT4gKknjPhKMtx+f7tJ6a3u25I4+eM9A6RnLwhILAy5Jp7pu5LeCl9PEI5PxJx8dmXhGVCzFQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLSrR2gtdQ2kraob4nO0khl1LQJW4vR3Mdlv6oRWgzDlsv+Jvng
	s8Y0oAacNFGwwaOQX6Yj0aU5sVRBxNWWpBNq30asqB7bNPn6qAajTlCnLvvu1U20gLo4LQVA4HA
	DKkkbfPJg9fiLJvuudpOMBHpvkneJE00=
X-Gm-Gg: AYBFou3UQRhGkVUYUEv/XELLH+Zd36N0WH1OO3AwmqOGUUl+kJaUJHeZgOUdT0aa2Jk
	58+WttYBkGwYuaAT8N+niSDTWAya2FMUv06KifTZrXCaUferZz5nufcdK7HCHzm772utullb7Su
	RT+wsoBQynxde3yN7orXwzq+MMae3v5hlmjYc8Z5qwcJ0U+sFZdkWDbZ0pcJ7PftGOpMe357Zf/
	Eq90glkROKZig1rUZPLiL+8np7TGcbD1lwLPzsjGugtYwMBtwEkHZn/Kzq1UAQz4Beq+AT3vW/u
	7BAwkwToc4h7MYOGXOwqFJkjeWPTZY+jFxJj+QVjQEVkexTQ8aOYnw==
X-Received: by 2002:a05:690e:138a:b0:679:b8df:29c with SMTP id
 956f58d0204a3-679ca54432bmr6769731d50.2.1792515534972; Tue, 20 Oct 2026
 09:58:54 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 12:58:54 -0400
X-Gm-Features: AclHuK_J27k-o8Ui6g8e3q8L_DReW_3vhUszXOZ3Ua6MjDZ1MkwzX1wkuw839aA
Message-ID: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095856_887034_DC473511 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

>
> diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
> index 5023f98d8293d..f672aad2e30e6 100644
> --- a/arch/arm/include/asm/word-at-a-time.h
> +++ b/arch/arm/include/asm/word-at-a-time.h
> @@ -56,6 +56,9 @@ static inline unsigned long find_zero(unsigned long mask)
>  #include <asm-generic/word-at-a-time.h>
>  #endif
>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
> +
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
>
>  /*
> @@ -69,6 +72,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>  	unsigned long ret, tmp;
>
> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */

Why it's open-coded ?

> +	kasan_check_read(addr, 1);
> +	kcsan_check_read(addr, 1);
> +
>  	/* Load word from unaligned pointer addr */
>  	asm(
>  	"1:	ldr	%0, [%2]\n"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
