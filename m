Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D34606A33E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ugvev8B7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QPkAi3cQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tZS0L6QH2+8gfBVU5A+f9uSn39/+NtDjqa/sKUd9XNw=; b=Ugvev8B7+LU+9yT5Sk1JplCEAq
	HOv4LCjGHVeWn8SXq1jl1NQ7uwjlRiuEITCS/YNNfMFkUsO82xVtOMffw5J2LZvqBx3e5u7evzGfd
	fOYR9/WOEViMT52wkQA/DLEtC5uX/j6fxToa/LvrX9M23tAMMY1qBMdsYQMmVO3y7Bw53Gd4KzTSD
	Ex5QbQSmI8E8+0Ln/5iqgkH7riAw9gaKP96G/kXgqQVOfhMMdll9ZfuFidcL+y3/2lrgflyOWoLGA
	nEm9SJYvOmcrNxtqg5/01TI4UJ51htADwuRt/Xv0kWdkgIGca0rvb/We8AJIB8fX8wpUBVqwomnDS
	v20NiVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmeF-0000000AGCG-1yNF;
	Wed, 18 Nov 2026 20:52:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmeD-0000000AGBr-115f
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 20:52:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1070116f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 12:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795035169; cv=none;
        d=google.com; s=arc-20260327;
        b=Ol/F99CHWGSHQ2znNZsaekzNOacCAbNRiA82/KtfiGjnC0hq041Mq679puV0C3/QCo
         8U7WQYcDq8FKP/voJq+a1uEUWItQ7yUDEPAGvt0Thrmrn4e28t0P6hBpvATZfYJNb4ld
         R4ajx+JPHdOPPZK9NJ+492fZU4XuySvR8ojf0JRDUVk+/yiMWjaLJwiGhFfobWLJ5can
         hpsQ/H1OWCffd9PjTLDsIwAxeLB2d2f0cRBAlZxX8kVLxtrPUwqLAai2qG0OTjAfyXUv
         CDCKBhapm/+pcI2g4TdY9JIwuIbsmuoyfckitKkkFxHfLoiyJA21hDXI/86mI8g+dPTO
         /7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
        fh=ARKjI2s4o3HlJ0KGHv6+ju4RoqYWZiGkGINyfbxotGw=;
        b=Lmo3cUaR4trw0pzUDhUOhFuwjOMY9cg4yi6iNHK5JahZgHsvXzWiUkzQ4po+cBk8w/
         c0KZM7mWzQG9Y7jJTtmokd1gQ3HdQOH4zb0o5h2peJW3m/eeZHV5T1Pvx4pEyX5NVjtQ
         MrLqBddGqXWFV3Gk6Sob7bU/sU4JApZ6njrgw8XUN5Gnxp77XKjOaRJvuOaz2nHed9N0
         ivMpmWrN6/ZQHReAerGfB6Dd8JW0A9tPsYMiK+3mY+XGmFTNeHdvX+bvh0z44HJjASnI
         0UUZczWktc3MecPavB3yh/1rKikipCS+SDRmgGGHKh6frj+lym9GlfoGVwi2MCnH3gwz
         idoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795035169; x=1795639969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
        b=QPkAi3cQWDXdUT2XDPY5dSxgnsJVbkUxdHKArev/bNSOuMiXBNEder4pi425e9PkyI
         AGDLPLK6NSiTckawoHUp+10Ud3F5v1q+npSHf17bZ+hFFiB79cXIQeLso5OI2JXXqoCI
         IPUw1MN06WygZ51uxjRQ0KIcbheFttlPIPUNYEXaudn6YidtagK4lf6d5oG2RP0n7VTY
         3N/IhUXSuWbSu4aoeR/eEQZoQwYLPAY3NdgyV4fIjJBgVWslU6d4IOWAR4yAUOD80p88
         UzzvA68pd82FpPsTHU4WB9KAAjls3YNHLRqcJIEeEAvu8uklQdXS2MCtr5qgZfVO4AAM
         AKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035169; x=1795639969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
        b=hvvwjHkwAo1BOLUG4tfz9eOLA5enfQ0e559RrwrSjoBoBkx1o3ur2/vS0gx+8UROoQ
         5MvEqeodkeN3lJUarbbgx5pQFg0sO8JqfIKuoHp3nrwEBfOzu5VwBXcXMN/yECFNvwVz
         JDzHt2l+ikoouEsQqP0lVq/z8YU9iZ1rtWz1bm/Jc5Ieiy2TXKULm48eW3sNs2itN3ht
         bhXEaoYi8B73qpZWKX2yjgM4eZpkobKZsrTdN5HlEwJze3YNY2CPRVUUW2Sp6ygqXBdo
         ir6CbSgcTrGVnwYdHfdZme2+JEvQg+/nvdwC1sYm2VwEcZC5WV7rFQa3d07MZzp3ShaW
         gZig==
X-Forwarded-Encrypted: i=1; AL+hErHueni3k3LljdTmcBWcwUrat2i660g9x6FnsKaRIhsGAaooVNQZMuS56uxC55pqCxMW0h3b76izL/CDaQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+PCtCYdfoS9uZKcDX67XyZ+TZMsgtnNkuIF4B/4hLMn5/GqEDM
	WUbvLfbuIODhVyZ0h4HH2TnU7si6WbMaFRr9JnZyO0TXpv5jWEzKirvZilaKxADpdMqfDTQt4cz
	SvyCA5WMeu56rB0IFuoYuTSSDWvlpzPfnL1FAjYqX
X-Gm-Gg: AZFdTZdJwX1fC6U3Ln7FZLIvB1GXn8ZmCv0X+s04InCiEwSCp+YdezgxUUhLyavzwR3
	frABqPL9nvJUB/OcKk0BwaCRJqylwIUZwTehniaBdzi7kwHT3M1F6ml0H7yfFDtg3szXYonQ72J
	47FL4dOYuLoXmjydnCanBAqb0VldiWv3qtjGSgXjRh87coi2yizw7yPsmzwfj9Ob3OXsu8sZAWV
	AMcRIADFBD020l5p+ndEoETiTTRFfR9XYFDuXA+Mnnw0WJaYb/SI0ci+DJEYBeXoF8kih1l3apb
	pBaGLzV4ywv9uQ2sL5RVkzYEcgruCSqXHA0kjfunX2DVYbga4MtOPfrObtAwiSvvPFCyaWfa+HI
	D6pSfh/qf6/UfEf+aeg/IZ4LufuYqfH39r4MXHvSk7N2Yx+zmB3NHSidEkFP0hRCco1k8qvKPJF
	XdSQUmt48e1kOT
X-Received: by 2002:adf:e00d:0:10b0:491:d224:aa78 with SMTP id
 ffacd0b85a97d-4a63ab754cbmr5872872f8f.26.1795035169077; Wed, 18 Nov 2026
 12:52:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030020209.3833766-1-tomo@flapping.org> <20261030020209.3833766-2-tomo@flapping.org>
In-Reply-To: <20261030020209.3833766-2-tomo@flapping.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 21:52:36 +0100
X-Gm-Features: Aa3M54rngdCtBdUPlOnJq0DxmarMXtgp0TWIs8Xtsb-fHR_p2_LUOAVjCPSU0as
Message-ID: <CAH5fLghd2at_rzqi6YU2MWFHK-r7S0VfpxrJ-dFsu0P7=2egCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: math: add div64_u64() and div64_u64_round_up()
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org, 
	ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org, 
	m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_125253_332223_F2A7D0FC 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgMzowMuKAr0FNIEZVSklUQSBUb21vbm9yaSA8dG9tb0Bm
bGFwcGluZy5vcmc+IHdyb3RlOgo+ICsjW2lubGluZV0KPiArcHViIGZuIGRpdjY0X3U2NChkaXZp
ZGVuZDogdTY0LCBkaXZpc29yOiB1NjQpIC0+IHU2NCB7CgpZb3UncmUgbWlzc2luZyAjW3RyYWNr
X2NhbGxlcl0gb24gYm90aCBmdW5jdGlvbnMuCgo+ICsgICAgaWYgZGl2aXNvciA9PSAwIHsKPiAr
ICAgICAgICBwYW5pYyEoImF0dGVtcHQgdG8gZGl2aWRlIGJ5IHplcm8iKTsKPiArICAgIH0KCkkg
c3VzcGVjdCB0aGUgcGFuaWMgYnVpbHQtaW4gdG8gdGhlIC8gb3BlcmF0b3IgbWF5IGJlIG1vcmUg
ZWZmaWNpZW50LApzbyBwbGVhc2UgbW92ZSB0aGlzIHBhbmljIGluc2lkZSAjW2NmZyhub3QoQ09O
RklHXzY0QklUKSldLgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
