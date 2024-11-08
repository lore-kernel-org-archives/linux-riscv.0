Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BBAD5E147
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCmT4IpsozuELQ4F9PlZSRezApXGx9HaVnjAN771u/4=; b=lnk9xzQ24ofr8c
	TWGVzgVWBFdvZsRgIj/rT0+smFlLHRz4mmzN6Y4LTIOTBpkIw3j4sGeQFC59hoNVWXvKiDylKvvQI
	/L3Xkyrd5FoIaeApA/gDUBXreCQ3EpTyw69VurN19fjrQIOVKUy9s30cvWqeWDepPmcVa2LGn6HMN
	Fr7SeDSoJI5mPwiGcYI3Du9bHv4Oi0gi1EEJvk5CMv1Ru7NSMjtxkG55d/iDk/nznWcu2/95olqws
	A5SW916BqX9+W3EX70Y3WgQrp7v5PQd36/gEJeoFiXq98tyMySi1W2zjsVgbn32rcCF+TWZTPNK1o
	N2IEuYxJF2BAe8aou2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KOL-00000009mFa-1mIq;
	Fri, 08 Nov 2024 08:30:53 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KHj-00000009lEL-3KBL
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 08:24:05 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so16333581fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 00:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054242; x=1731659042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jl0lx7Gsy6iH5afi7dJma9NiuABi3ClmekHLbyLNYbM=;
        b=q93QNXWLkeJXWt05WsDH5jkrwpcej+zSgzTiT6Po9k/OwiSgN3aFlS1xTR8axVvOw4
         DVXj39MNlu+S8oDc0xoVGcGqHWqYQ+0llnWjV1ndAG911qPXFgMmbdG/eTHTeP6hB2nY
         oKGc0rOmkkL3ZF2582albzbJqg+5sxhsykwAQR+4POKmqmn4GqCcem5lDXKQBxmXbdl1
         nhLBRmwlA5zrXFqBS6DwIwxxW+hE3hqquKTaUNk69Lz2pdYk2iizCIbhA426aITVQb1b
         Oubc52zchFTtNUJfmILgvRBSt7j7RYyOaCnOSpUCbIbERQ5QJGp1oGWU61otw/emVWYS
         C7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054242; x=1731659042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jl0lx7Gsy6iH5afi7dJma9NiuABi3ClmekHLbyLNYbM=;
        b=hZeRWB8lBKdwCTywcc52qd5m9A4EVmqk5qIKE0K6zELCX6IvfyIJy5zhWeOBSawNSD
         xZMgi64s3uTtYuYJ5Gv0w0j4QcNrT07n0ZCgwfR2qibkTrxLRU9VrLLdfA2kC03Zk0D6
         xC3IXpQavMO5qkHjg777BAQHw816BeeiJtvTV4lEL4Qj6qhI1PuOd+P+RIiChAoozai+
         fAMg3gjwy9ZYrmXl4RxiSIR2G+SKbpFdHZYfzrRXepSDMuj9T/FG7S9fLyzFEY/QscUK
         W8I+Y/iLWDrvrviBXsbmt6ThbrwDsC738ujouMUY+GEzQSFWPtc/bQboZeW35BZJzy1h
         Ou1w==
X-Forwarded-Encrypted: i=1; AJvYcCX+o4EiLAulwtpmBkvMJgYYrW6e061DGisylVYQuZuXzzLKA/3yoE63kqtTCAthxi6BZP/oew5y0h0ZzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz353BZcDr8VK11MbnlzV75TIKDv+Ezwi3H5BWXvD2QUbWppn7e
	JeIYnD1+Uh55T6IJxiAcIzSurncSxGcMxIPeuzdBtpIVN9uYbyHMLf8gAmrQRsEfpb6H4ls3tpx
	OGxTJkzbbTlokxZpwNhxVH3npTP/IEVcxYN56+w==
X-Google-Smtp-Source: AGHT+IEoi4h9cOF0NrDnDfN2mcJ8OQ9IS7ZeEM0xCssVYgc2FE/qjtdzrUC7fSlflKMcaF1UCWmg7W2XU/WUPP4wOug=
X-Received: by 2002:a2e:9a16:0:b0:2fa:d67a:ada7 with SMTP id
 38308e7fff4ca-2ff201b1d51mr9123811fa.23.1731054241726; Fri, 08 Nov 2024
 00:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20241029012312.3448287-1-unicornxw@gmail.com>
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:23:50 +0100
Message-ID: <CACRpkdZB1RT=ATC1RKosjVyj2G1v4F8NYEPOTpfW16vmTG5y4w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
To: Chen Wang <unicornxw@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	inochiama@outlook.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Chen Wang <unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002403_867961_6E73C7F6 
X-CRM114-Status: UNSURE (   7.07  )
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

T24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMjoyM+KAr0FNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2su
Y29tPgo+Cj4gSXQgc2hvdWxkIGJlIFBJTk1VWC9QSU5NVVgyLCBub3QgR1BJT01VWC9HUElPTVVY
Miwgc2VlCj4gPGR0LWJpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1jdjE4MDBiLmg+Lgo+Cj4gRml4
ZXM6IDY0YWE0OTRkZTZmYSAoImR0LWJpbmRpbmdzOiBwaW5jdHJsOiBBZGQgcGluY3RybCBmb3Ig
U29waGdvIENWMTgwMCBzZXJpZXMgU29DLiIpCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1
bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
