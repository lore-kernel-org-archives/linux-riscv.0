Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DE2C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afFva8unaNEFuykE6buujqcwuMw02Ph5YzUylOckJEs=; b=OJtfTQd0kfP14T
	vAf3LyrUxDfqWKZZsN+KCjyIDnuIcOF46R/ZfFxU+/Ys4kBMlNYyOUNOHWTCGb9g+sNHP5Ij403lM
	f16EN/hstdESo/u2AsDZnOkiSnFMswLCjuSut/tpnKFtbP80SOf66VLkXc1brz2oHcRLgK7ucRVvZ
	C7PTUeDlZLMIps6Tsx2ve5lViNfvid0c78olC5AWGLFDvfwCDc29ijaRJUH7cqRi49+Qf3UD4Ct8Z
	bWbtb3/QasxJ+8R+P2xWkWV4MJQ8F3OaEcbfyfwsYaqTd/G5R6ZvxTpvAJmMVjutwKgy9S24X7wdO
	bFt4sXVZztdZz1qU2ptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVOO-00HRwt-LA; Tue, 07 Mar 2023 11:22:04 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVOL-00HRv2-Gi
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 11:22:02 +0000
Received: by mail-yb1-xb35.google.com with SMTP id i6so10996436ybu.8
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 03:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678188117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6M7Rrz8d9sk58/G5zmHZtDU4PDW4DV0zcA0ptQ1Png=;
        b=UvPobudrKein15cSeOXHadW3ZwXyETu9tdRk/e0W67OcmbQVHqprMAqPs5BFbtRInN
         bMb0324eNAx+3ZRMjr0fYXKGBZ//61yIXN3o9Xz87LSxsjbWhsu+oDg0E6JsnjeENazR
         CZgdgsEndyjCgUTVtXV4OXqJ9POmLz7IwIanvZ4YrF91nK5YWyZjnaIO32evJzdmPd07
         pp4n5JdsJTv2tOXxrOaaZ4LdXFJwVLjcJV0mbdPq9cV385dnSujp9ht4BW9THOovXQO8
         iU7s9FaQ4pw1yIkqdjsnDZvp3YOrtzvlEg0GrliwRMC8uHJ/W6ibcE2v4OG0RdrEAKyk
         Rwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678188117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6M7Rrz8d9sk58/G5zmHZtDU4PDW4DV0zcA0ptQ1Png=;
        b=bZwWOCMVcX7pM+P3Y0jUc0s+j9lFL0n+rGrzffD6v8D4Sttv8eFJ6B1zjhslIODs2F
         ncB1RXR7nYFFSFaQ0GXiqZh3iUCtSTK0f4pkmjCV5uGwqbzqnuDUled6fOHiSyYv3u1j
         eOif3CLCgGu5LXA1FuIc4WfVd52XIISmSlCIbOzN1OCFozcOHNxbjrZ7rgM9f31VvSLh
         7ikZIFI0irK4KZ2Q/CSoCzRJP+e74uEIebRJ4wJht6cYXgX6dOLFkFeotTCzohB3m9iW
         XCdvBikp1VIRshWSOxCyCse/Pb9N6XU4MtWd8fj2puDKh1C4WqHBkUA9Y7oevThU4hnT
         B6jQ==
X-Gm-Message-State: AO0yUKVgJj6EeK1aV1OofMceEl0OKsKwZwT5ByPN7ReDTEweocbDjU+C
	WCqz55IxzOefuUTlBrHdwTxOh8bD5fbqbgSu1UE=
X-Google-Smtp-Source: AK7set9Xm/+t4RsbYIh8ZTtsG14e7fG27l8U4WG+CAhTtfNoZ/TFjDRHLzJOC1Pb6hQWIxMo+D0M4xfhEHmOcmY6vLs=
X-Received: by 2002:a5b:b03:0:b0:ad7:b81e:69bd with SMTP id
 z3-20020a5b0b03000000b00ad7b81e69bdmr6382804ybp.2.1678188117463; Tue, 07 Mar
 2023 03:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com> <20230307102441.94417-2-conor.dooley@microchip.com>
In-Reply-To: <20230307102441.94417-2-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 12:21:46 +0100
Message-ID: <CANiq72mB5jXPuLy4mcYsa-q4yjHeryVWZrDf6wavvpj5FkwMOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] scripts: generate_rust_target: enable building on RISC-V
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
X-CRM114-CacheID: sfid-20230307_032201_578489_0EA682A9 
X-CRM114-Status: UNSURE (   8.89  )
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
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gRGVzcGl0ZSByZW1vdmluZyAzMi1iaXQgc3Vw
cG9ydCwgSSBrZXB0IHRoZSBzdHJ1Y3R1cmUgb2YgdGhlIGlmCj4gc3RhdGVtZW50LCBkZXNwaXRl
IGVhcmx5IHJldHVybiBiZWluZyBzdHlsaXN0aWNhbGx5IHByZWZlcnJlZCwgZm9yCj4gYWxpZ25t
ZW50IHdpdGggdGhlIFJ1c3QtZm9yLUxpbnV4IHRyZWUuIEknbSBoYXBweSB0byByZXNwaW4gdG8g
c29ydCB0aGF0Cj4gb3V0IG9mIGRlc2lyZWQuCgpUaGlzIGlzIGEgY2FzZSBvZiAyICJlcXVhbCIg
c2lkZXMgdG8gdGhlIGJyYW5jaCAodGhvdWdoIGF0IHRoZSBtb21lbnQKYW4gZXJyb3IpLCBzbyBp
dCBzb3VuZHMgZ29vZCwgYW5kIGl0IHdpbGwgbWVhbiBhIHNtYWxsZXIgZGlmZiBsYXRlci4KCj4g
KyAgICAgICAgICAgIHBhbmljISgiMzItYml0IFJJU0MtViBpcyBhbiB1bnN1cHBvcnRlZCBhcmNo
aXRlY3R1cmUiKQoKTml0OiBpZiB0aGVyZSBpcyBhIHYyLCBwbGVhc2UgYWRkIGEgc2VtaWNvbG9u
IHRvIGJlIGNvbnNpc3RlbnQgd2l0aAp0aGUgb3RoZXJzIGluIHRoZSBmaWxlIChub3Qgc3VyZSB3
aGljaCBzdHlsZSB3ZSB3aWxsIGdvIGZvciwgaXQgbG9va3MKbGlrZSBgcnVzdGZtdGAgYWNjZXB0
cyBib3RoIHdheXMpLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
