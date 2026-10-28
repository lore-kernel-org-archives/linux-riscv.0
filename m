Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AD60A3827
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbfwX2dC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vY+8YDjn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=3WAEEPuo+69aUly1et0Jjwg3AGeT4Wq9/POYO9m/ngI=; b=EbfwX2dCu+kMQJc49upQpKgoaE
	RC79MaiHRDuckyyxGgZjfy6o1GKtOWY0hs483MHm+E4kbRJupRrh7LzLApQav9qiWiu2JV0OHlEzv
	47LfYjg7OQSkUxWuN3WvdBZAHJY0KpRUFZETYNq0yEg0NXZkBK6PMFTBbE3W4MakVpei33gBb/tuk
	RyuhOiD4WOfHTR8iEerTdpgaxPgeF9/qdJ7IzG0cQjEcR8X12J5d9tEsFLif1vzmWM1ysMZ5TN1+a
	qv6A/B7gOge7FVqBt8bh9KNNS2iFVzMsdQN8Aod0DQepFZUnuaB/A3cUKsFjInKtgvaKsZ/21fvnX
	BzxsuYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM88T-00000007jeP-1kLz;
	Wed, 28 Oct 2026 18:12:29 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM88Q-00000007jcf-2Yvo
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 18:12:27 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67a3f1730ceso240902d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211144; cv=none;
        d=google.com; s=arc-20260327;
        b=eJlVYoypBvwlywXA6gtOW56rIb53kgp9Gdtrc21j/zx9qHhj1SPKNqnMITIZ9B4Zqy
         GX1/u8i4XWkiKnZPerxI2CScL7fUIKOh7oumT50YiAu2jYKUCeSmWK4N2mnpFXuDiTrm
         xQBz1LjsRWDWUODbfGjQowhDlc3mVURZl4eISRvuNVDS0MhSOqJfRY8AjqQm1Wgu2mbD
         TGfPnNThSQRrP6RXbTnw671V2/WJbKQ0WUaYFzIfss2DXIyrLg/BesI7IDOvfPX7TV8u
         4g+2Jc7IiRUq6N1GstkVUlA0cGfek2gh3ikxU39Ifm6/3Am4gKMXrNn1DTS194OFqNgm
         6iWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        fh=vZRsB9HN9Zlndl0ExMklMNYercWkPDUu9kiIwfVtRV4=;
        b=KEZC9sl77rNO8RfCu158o1zc9X/id/77fYXlw5D9ndKsCHkolgV6u3Lg01N411DqpR
         fORzCZuGOi01in4Af9UJQi5u13f2+8zhA655GzB9Renw7pUHN0AlJnw9LrJzBQB7eten
         CKYQG4OdOisVxB3INUberywIowQsOLlJFOsUhpVtRlHqxlfkbvQj5CRslJSbGOetDisR
         O4hpdLmgsHPpIu06N6vefk+4qpPl7IKI1idSEvpTBquyKH4wgO8eX+27dx4zxU7AoLKb
         dvP4HEv8mMNRYE9rKtYpe99JPLo+nBCJ2GF3rCiU2GzWw5b3NHOwwJp5MSLK/Gy/a4XI
         eUDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211144; x=1793815944; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=vY+8YDjn9tRaYh8yoqC6zqVTy3wnCiYOBkEEYJ8W0Gar7jXof2O69c6AXZCg3ZtKcK
         wevtSM9Lvmn+YIOemqQEsp8l3J1euqQ0UnxiCEYtgRegqg9bwbQMrNnpUq8xrZp2qG+3
         e3nyemmhg/sfGNVhRZRbNvacgiQVAmezcS8TFUt1Dz86MO7D7yL2Z54PJfLYLlsNlZls
         j9odQm+IIsjqOQFzVQR9OcgfA3iPctdUb/CJFZTgMWqQ4iLbsVgIk1Mx7EZW+sssdbtK
         e3/HpEFqSN/MWwrzh57fTbxSyisJjonBJoFTd+d9xTv3IzjvijKJ2lvUrJrdOwGWOpoc
         4JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211144; x=1793815944;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=FqbkSG1w0hdwNB23kLUHfHtmGVySn30qvPGVSlr0y7TXKw24ynOHCYj2IEgvrHxjkF
         +2t6qUGZAderj2CO0yOrrsGzAHbktPY4NnwKKNkbfXyvxw4WpwDC0bCUTnOHxmjZUFkh
         TqUyNUWsYKlHcgFsx8RixL/gKtS3sWP/QQ4sjQNe9CqqT2+uv/QXA6c1uDwgRN6KOA02
         +u0UBS+3squ3iKMP6A33vkiT+lVpmKljtJlJ+6iGAPr7+wGZogA8d2tm8XzrCf957tTB
         g/3/ZFYsA/1FyA6AVqt9Fg5tp3W3i/Cbd6XRSxbpfissUzph/v1A3xwNW9qxoNBH03pw
         S8Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzEx+IWzYX4n4HIBOrAwkC60yIEJAjzHbr2moz9PtQeS7exeFax2FbNfjjc7fH+aqBOkp8NAMjDxK2wcw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLUS+vPECxMDHfdLq4uCW4cDZBaTiADbB+h2ZLF4TflcGA0pzwl
	aAm6BpBaFwozwSSh+jEQMdfYPIeHD66kQ3CjlUXzDxgCnjNwJvOuM33mOXuJjM6i70QvwpBpstR
	f7UUACGaoks065LReyQ2W3XFZ1yhFBA0=
X-Gm-Gg: AYBFou1m72sKVchK5ozHR2Pxy9FMAwyHauU5rsK5xuZjNg/2vJzyj7cyGr4+eGTYdO0
	RMO5v5V3CAbdgwe6pk45GsFNx8MG5jTYty+f6/lPEMDa5ik6FN9dTdYRFPuXmZd3DKDi2/KA+EI
	S/LbT3TqEZoWuPmurw4vSe67XyaUAnnK2aEMYowHvMspjeEdVX3swo158Mgg+RBE3uP6DStofe2
	LGA08b2Wrqjknei4L2JCr6Om1viAsQsyhUsiHkJMgS7MtW6OEv3vN6ZWkgVQL6VODRsbZsHI7M7
	qFFJLbMzxsWU9eLQUOp/iiFNVLlKTdSeWm019zFSiXmlx8293ck957mM3zqPmY6LXiZ1OhbqETr
	Uj+gAFyyeUuZ0d+xgpUMeCHh5Y9m26hJweJU=
X-Received: by 2002:a05:690e:a4e:b0:675:6f06:5642 with SMTP id
 956f58d0204a3-67a7b9945d2mr4650525d50.1.1793211144098; Wed, 28 Oct 2026
 11:12:24 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
 <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 11:12:22 -0700
X-Gm-Features: AclHuK-o5YV67AfwlA9WNsjqOxV_ScugEYWYzUg986KltKOOqPQjM_oQFfVaIog
Message-ID: <CAPAsAGyEUL1fj2-1=NGBDDO-z47cOHmcFDFexY9T_1_1LCMQJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
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
X-CRM114-CacheID: sfid-20261028_111226_667596_B6E8DD98 
X-CRM114-Status: GOOD (  13.63  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

> load_unaligned_zeropad() reads a word that may run into an unmapped
> page and recovers through an exception fixup. It does the word loads of
> sized_strscpy() and of the name compare in dentry_string_cmp(), path
> components in hash_name() and hashlen_string(), and the trailing bytes
> in x86's csum_partial().
>
> It is inline assembly on every architecture that implements it, so
> KASAN and KCSAN never see these loads, while read_word_at_a_time() at
> least checks the first byte of each word. A use-after-free or
> out-of-bounds read of a name handed to path lookup goes unreported, and
> so does strscpy() reading from a bad source, which the kasan_strings
> KUnit case expects to be reported. On x86_64 with generic KASAN:
>
>   KASAN and string KUnit suites      failures
>                                   before    after
>   CONFIG_FORTIFY_SOURCE=n              1        0
>   CONFIG_FORTIFY_SOURCE=y              1        0
>
> Check the first byte with instrument_read() at the start of
> load_unaligned_zeropad() on every architecture, as read_word_at_a_time()
> does. All callers only load a word whose first byte belongs to the
> string or buffer they read, so the check does not flag their intended
> reads past the end. Add a no-op instrument_read() for the powerpc
> selftest that builds the header in user space.
>
> Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Reviewed-by: Marco Elver <elver@google.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
