Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13DAC27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNm/AaS6rW1l/3/axf0hi4DHfh4NQoPwpsAg7OE6L+g=; b=3uexPgRFyNSAkb
	NaGDpIx7bROLf8F7cLWI8i+2zF2VvsHnIOZVkKzAWRJGOVgYNg5YXRT8zO3/bklKJozDt+cbB2eBu
	BYxWri0EHkw5zWjz3OMjhT8xKN4j3iu1vA2NWJca2OHaV1vWfhKwshGZ3bRb08y3ouv7kC6LPRTS6
	qiRS2ZWss5VEeqKWNe6fxXLcJAkSBe7uRJ0Th/Xws412c0jaavH5bvazH3v7YZgRYJUrQWPovrgHu
	KzLQgl4ds2AvnVQ6D+/zJZrRaBH77ieeqwd0Skc3cxLcjFyq9WYxphXaB7i3EE4G0BXxd1qyo5ibw
	Yds8hM5yotJWqUs+znFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7Sj-0000000A4GJ-1Uxz;
	Tue, 11 Jun 2024 19:47:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7Sg-0000000A4Fj-1Ojn
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 19:47:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f4c7b022f8so55956035ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718135237; x=1718740037; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qCkTNdoWHedtO2Rublq66t6G2AvnXm+h/79qji0mlS4=;
        b=LzdwuALke/t++JDw0ZSXwT3w1hIdHn1BAopDjUVN6KfKr4H4Sy5sSJGmbWb8tw2Xnb
         8z7hoeQxv8Z8nDWMOQT/uzhsDUlGXGP7AW8Qo+NZFAr1y/FM36dcwJSV7krRDndoeNss
         kvmGm2/SG6hFkAcZHAzBNUQ1xlD/C28SCKqT89QRsrxkS+iChy20NTHE0JZtQpvbupLW
         LwhFEKIehjVr+uUQbvf3R0DttdYlxVZbmVR6fxw2KeDSsPxKDMs+INmzQh5EhLmcypYs
         A/cDFMdtqNp8MKtbEsxRb8elONwkCVlq9Z3LIU8QPpI9gEv3+2SzhEpKcw2B2Of1y8zA
         vWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135237; x=1718740037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCkTNdoWHedtO2Rublq66t6G2AvnXm+h/79qji0mlS4=;
        b=ikGJfoWXfRFHo3iIlaqM0C+S55kfEzomA/PFwY3VLc9xCzan0qMp77PDpgXey1mGGe
         G0g5+jCCl6VMN33wzOoX6sWt+4V6DuWOhkkLI8OvB6KgNvoY3ejT4hOTOPSyWPbVA2AU
         lwTJmzV6s9ZszPsP6nXZ0Ih8HmCvqt6clxeGiykhGKwnw8Y1HDjSGSOA8W0i+85yxf0k
         XJEw9QfdOUwcWZ6dXMir8Wxn1xMMzdbNvGVXrTxgaDCIJu4w7JmmVVxWNzrZyqEhza2+
         XYg4mxDoYBxO0sLoI2akgHEU51OYLanLs88p4pjjdkp7pcVI4/JLAzID+72oG/dTDuQK
         Rbvg==
X-Forwarded-Encrypted: i=1; AJvYcCW6lRAXYL10OgzImVw3iiDu0Az24qes+BURF7ueYIZIcy1v29HhSscJ/ZH3HlrFi8H/LFj1thmfk8V0nDJ0uaBhj+Sd94FBPYpBe3I84Gdo
X-Gm-Message-State: AOJu0Yzj2VEpEQaoEHuvvGP9sv3SWoliE0B59HiPHBBRTEbf0tMo8mJ1
	3NsHU92zhSdySk9CDpJR2U2qCjHZamVmYwv9oXs6SGPHIpDHt0J3MqK8R0JrNew=
X-Google-Smtp-Source: AGHT+IF72CTY1GSL+psPQ685hIrEeRutg+9+b9kEwCoHappRKyYOV15sm3Zs49FEAcTiubbmLDM4gQ==
X-Received: by 2002:a17:903:244d:b0:1f7:eb9:947e with SMTP id d9443c01a7336-1f70eb99809mr71450745ad.63.1718135236937;
        Tue, 11 Jun 2024 12:47:16 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ff937456sm57302045ad.243.2024.06.11.12.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 12:47:16 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:47:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 11/13] riscv: hwprobe: Document thead vendor
 extensions and xtheadvector extension
Message-ID: <ZmipwVN/WBCQcJdY@ghost>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
 <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_124718_572800_30B4F096 
X-CRM114-Status: GOOD (  17.27  )
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

T24gVHVlLCBKdW4gMTEsIDIwMjQgYXQgMDg6NTg6MzdBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAzOjU34oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRG9jdW1lbnQgc3VwcG9ydCBmb3Ig
dGhlYWQgdmVuZG9yIGV4dGVuc2lvbnMgdXNpbmcgdGhlIGtleQo+ID4gUklTQ1ZfSFdQUk9CRV9L
RVlfVkVORE9SX0VYVF9USEVBRF8wIGFuZCB4dGhlYWR2ZWN0b3IgZXh0ZW5zaW9uIHVzaW5nCj4g
PiB0aGUga2V5IFJJU0NWX0hXUFJPQkVfVkVORE9SX0VYVF9YVEhFQURWRUNUT1IuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+
IFJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4g
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCB8IDEwICsrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKPiA+IGluZGV4IDIwNGNkNDQzM2FmNS4uOWMwZWY4YzU3MjI4IDEw
MDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+IEBAIC0yMTQsMyAr
MjE0LDEzIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+Cj4gPiAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBp
bnQgd2hpY2gKPiA+ICAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBibG9jayBp
biBieXRlcy4KPiA+ICsKPiA+ICsqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9WRU5ET1Jf
RVhUX1RIRUFEXzBgOiBBIGJpdG1hc2sgY29udGFpbmluZyB0aGUKPiAKPiBPdXIgcmVjZW50IHNu
YWZvbyB3aXRoIENQVVBFUkZfMCBwb3BwZWQgaW50byBteSBtZW1vcnkKPiB3aGVuIHJlYWRpbmcg
dGhpcy4gRG9lcyB0aGlzIHdvcmsgcHJvcGVybHkgd2l0aCB0aGUgV0hJQ0hfQ1BVUyBmbGFnPwo+
IFNwZWNpZmljYWxseSwgd2UgbmVlZCBod3Byb2JlX2tleV9pc19iaXRtYXNrKCkgdG8gcmV0dXJu
IHRydWUgZm9yIHRoaXMKPiBrZXkgc2luY2UgaXQncyBhIGJpdG1hc2suCgpIbW0geWVzIEkgbmVl
ZCB0byBhZGQgdGhhdC4gVGhhbmsgeW91LgoKLSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
