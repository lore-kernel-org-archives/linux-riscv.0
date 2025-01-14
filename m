Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40727C02184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 05:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ie1+DxXbw11wrenpW1U9qF5y/VZApfEH9SAp/etaDFQ=; b=uKKaLAaenrHoFe
	t3m+8UORTy7tCbCPf8QvgXMH9zlRjcYtybR3Pf9TYezPvSmOzJjK9uzQaV2wXjxQ2DLt3KqQS2S8s
	on3fHTXjebAlXNcglL7sQoW2+L01sWGv4PfevCqrgK+VKThtr0Pr8nidurcgMVy+i2ZIf3egh0Pse
	m5DE6utqIp/Dn/fBsxHAKewOL2MWOztomPynaNgBvqlNxoydFalRVZ6nCobxmpcs4VuIqaN6W2ntR
	QaYRXGe3AKsUtTni8RgScdvswrcMbrVEbLsz2tIGdbSh56NOCdXsoai2bUIotUn3byIt2U7gwOv90
	bRV2BlXGb2JFDMQvIPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZks-00000007XHn-0OjB;
	Tue, 14 Jan 2025 05:46:22 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZfy-00000007WYa-1pce
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 05:41:20 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-844e39439abso166322939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 21:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736833277; x=1737438077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mtOg2h/rpqlazGKLPVECjA/vYH+Ic5TrvEYAXljvris=;
        b=YwcCbD1AzYmoxj9c9Gn22Q+r2AIwrb68hd6O0BQsh7Cbker3Qc7EMgRbgij1dnu2U+
         d+LEwrwpeiXNBoZa6eNOvW5ZbU+t2MPSoYLm1/e5Vt+kPzX9h3GD1wWzg/117YlnkwHb
         wb8U8IFjG2rbd5vkRuwL3LAXxlw2lpVyzhtqz+lZpTyC6EFov2/A/FfI4kZj+QQO6GRN
         4OxOOIhJHNrm+224ANCgV5mgpw+oNQE8facY6r8b3jRkLXPl15Ij/UyfP5T/mYqEhP3+
         RbRFKgJ46ghcoC+L2t5igpw5ZIC6ackAJsK2E67KMeHBm95KKikSATz6VSLJWtU6tJVj
         45DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736833277; x=1737438077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtOg2h/rpqlazGKLPVECjA/vYH+Ic5TrvEYAXljvris=;
        b=YbygXcJJIY/DmHgDYU+oI4X13bRu2MGK/KiQgSKFo//i6cc50IguIiW+x5zz+/CDCY
         +eb79qttL8TWR3rnuXOpcG6y42qyAWqIvN9Ea5bih2gwNqONU66lDKxXVP6zFepqnpKZ
         siu2KAV/t5OlxXIT6jbs2BVIOFeAWgLucwSezvMBHwKoKd50XMK/MgZDFLsZdyqHaCVM
         zGt7DBNwfLHfjqnH3kHSHzHx7p94EyzqP/IF7Qs0Nj0fxGQaQFCDc03fsSTNlrDi7jW0
         +AXKX0oFHAKlhNw+8RJ1Rfpzq/daF5SpYY0BEj6vU5g6lSiYNZRjxsfzd2kqiAY8j4MQ
         J8kg==
X-Forwarded-Encrypted: i=1; AJvYcCUOj771Gj3h9mMhdg4g+TnaR67DXmDXY5VAe4lhJDUqu442qPVhztsDwyp8x7fH+2P2IrxHN3z7uNr0mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxABz/C8hKqGaWY2/WO+45qUkClIucEgcjcnl7MEcQ7sFGrbMq
	CkN0be7zngpVlGPr/pReMBoid0ZBQ1CP7qsFOBZAyUD0kPqP/kYk4eLrRZX4Bxs=
X-Gm-Gg: ASbGncttgyStmoL2FRHbNjRCCMwo3fthn5DxZG59qUHVnM1wCN+mSlOoUuPufuXEBIe
	YoWlpQ2nDz+0qzal9m71ReFaDboPF0m5Xqs6BMRrGyVjfB0YDb+QqJWtl1k8SGB37w8F4dryLF9
	uOrhwGg8tXXzCIoRSMyAfCQJQh7iAcjETohRw/1w758xYeWtj3guXzPS8spiUDin/eNGAMRQTK7
	NsrQxoTxkQ6U5nIwzpCrhhCcpdeYa1HJKspGgv/iGYrDbXAS+IMJP6d7t4XE+RnfKabrlpU7aA6
	WayP
X-Google-Smtp-Source: AGHT+IEFcw5OZSl85IYN0bjUrb8HQkcisZg8HHQ/zXPmZISEPeFtWbmhXh+jrSJBKWkT33UAnBr0MA==
X-Received: by 2002:a05:6602:3986:b0:847:4fc0:c775 with SMTP id ca18e2360f4ac-84ce00b5452mr2121476939f.8.1736833277394;
        Mon, 13 Jan 2025 21:41:17 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b6131f3sm3262953173.40.2025.01.13.21.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 21:41:16 -0800 (PST)
Message-ID: <494d27cc-ae58-4f4f-8909-9fe0e9b8e1a3@sifive.com>
Date: Mon, 13 Jan 2025 23:41:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] riscv: Call secondary mmu notifier when flushing the
 tlb
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250113142424.30487-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250113142424.30487-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_214119_288462_79767B7B 
X-CRM114-Status: UNSURE (   8.80  )
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

T24gMjAyNS0wMS0xMyA4OjI0IEFNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gVGhpcyBpcyBy
ZXF1aXJlZCB0byBhbGxvdyB0aGUgSU9NTVUgZHJpdmVyIHRvIGNvcnJlY3RseSBmbHVzaCBpdHMg
b3duCj4gVExCLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBSZW1vdmUgdW51c2VkIHZh
cmlhYmxlcyBhcyByZXBvcnRlZCBieSBrZXJuZWwgdGVzdCByb2JvdAo+IAo+IENoYW5nZXMgaW4g
djM6Cj4gLSBSZWJhc2Ugb24gdG9wIG9mIDYuMTMtcmMzCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IFJlYmFzZSBvbiB0b3Agb2YgNi45LXJjMQo+IAo+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMg
fCAzNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBTYW11
ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
