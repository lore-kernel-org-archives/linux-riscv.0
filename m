Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4058AC678DB
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUu8CFUoZraRUu9cUm9cks24c4Z99YeYnZE7SkhEXP8=; b=U4BHyQAlBi8ODY
	wdD5yZgdBIMXq2/DdlF838Ux5fNMcQHe8UYrYzlcFv6U6sK/+Wr2PQMqntVqfNo/h+/dNtFoEnEyH
	7CPOivOiPazE6JixnZxUohDxce2fzhpdVatK+nzNq1F6e53o1BW8u76Zojv8G8iFVIFp2YRh7xmrg
	Xvx9SCr+mm0MeTEpg6eJIUcVSWZRy7C7zH+j+fk2I/BsQ5H6ZVhswk3Gjjz0p9+uRMnkW9zsskPIj
	d4R38B00r8Erkdsx++aP3a2fGPEq4AIwtqO3XVwsDfJbQ2oRF3Vu8naKf/+EKG689QW/JVyqcxGD8
	cu3YUcb1Vkvtr6R7l1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVAc-00HPgF-Tu; Tue, 07 Mar 2023 11:07:50 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVAY-00HPf9-4b
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 11:07:47 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-536af432ee5so239149377b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678187260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezWI+YqtGSWosoo4M5sZg2WqWcmUK1NfNwH+n8V7ZCM=;
        b=LuDiyIoNJ4vTfsKW2ge6iUNxEd8mvXODtJaI+szTJxwEO66HxU/s4bmVVK9dcwXnm/
         QWRZVbOXaDFcQX6RimoGoGiKuIIajLYc26PZAdg2UmAFnv/KaKOeURvisNCgZi+ESOA9
         oPUkR4U14jLYUEa/RDk+t3dJMMMJCVlxth1Nko993D9oFNnePQksBikmXx7bPM+WpXOF
         yiUveNKPhjRWZZiWN+G2Ir0L6M7AS3DJJ0NS6Xq6vQDyXHeN2icq9w7ifGGK8wOAfApj
         OLcYmBP0kNbBpEvna/hpD13FRhHyIFOArYIjr9skWceDsiBLwkvUtQIGWRnfH6qZw+1+
         lwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezWI+YqtGSWosoo4M5sZg2WqWcmUK1NfNwH+n8V7ZCM=;
        b=MHwiBRt95n+/qqLhxyCtqwzxVuSEgIfqukQA7qdJIOO33CZpx6qHpioKVLid4VCPd8
         5i+++isq5RTfPxsc58lD5UEUO7do22T2QypkcmKMCOYfbQzK+Xmocu92FTHmqmERSOcL
         k72aGV6NA+nz0LkCu4oMGDRdP0PmefE1HknpCQft3kUIk5f7UM41torJv5pz14V/ibUb
         5lgSIIqFg8qIt3tn91t+FUS5qSIVkrKZClbYZ0gcMRBDWbINUpxZUVONlSCERfkC2Ljn
         NlS0fFOZybbkSAM7cCXKQJIQCv3R4IGsYEaIfaKsgO++UBpsInaWAGYzgpxMclfKxuzn
         +pJA==
X-Gm-Message-State: AO0yUKVPeoZHJV+o9OA4BNgny4mSj3qT/vnl1g0LlDg+iXScHyXSGD+I
	hjRq+wkbngh2DHtLTKQ5Qabf28Hv20ksCA/QM+U=
X-Google-Smtp-Source: AK7set9mt9UYnbLiU961T5A6R3gBGXlq8VmcrLo/C8E0ADEMyOzY+pN/ywBe+SU5kncac16bq8sQPDmSAjiKbFf3Oew=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr8435908ywh.10.1678187259869; Tue, 07
 Mar 2023 03:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
In-Reply-To: <20230307102441.94417-1-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 12:07:29 +0100
Message-ID: <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_030746_195711_ACC2EAA7 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAxMToyNeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSSBoYXZlIGFkZGVkIFNvQidzIHRvbywgYnV0
IGlmIHRoYXQgaXMgbm90IG9rYXkgR2FyeSwgdGhlbiBwbGVhc2Ugc2NyZWFtCj4gbG91ZGx5LgoK
Tm90ZSB0aGF0IGBDby1kZXZlbG9wZWQtYnlgcyBhbHdheXMgZ28gd2l0aCBhIGBTaWduZWQtb2Zm
LWJ5YHMsIGkuZS4KaXQgaXMgbm90IHBvc3NpYmxlIHRvIGFkZCBqdXN0IGEgYENvLWRldmVsb3Bl
ZC1ieWAuCgpCeSB0aGUgd2F5LCBsaWtlIGZvciB0aGUgQXJtIHBhdGNoIHNldCwgaWYgeW91IGVu
ZCB1cCBkb2luZyBhIHYyLApjb3VsZCB5b3UgcGxlYXNlIGFkZCB0aGUgYEJJTkRHRU5fVEFSR0VU
XypgIGluIGBydXN0L01ha2VmaWxlYCAoR0NDCmJ1aWxkcyBhcmUgcmVhbGx5IGV4cGVyaW1lbnRh
bCwgYnV0IHNpbmNlIHRoZXkgYXJlIHRoZXJlIGFueXdheSwgaXQgaXMKYmVzdCB0byBiZSBjb25z
aXN0ZW50IGFuZCBhZGQgaXQpLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
