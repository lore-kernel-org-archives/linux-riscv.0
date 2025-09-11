Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32846CA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XU8aB8ymRd6bBSUtdGf9N5XmikFE6eK9OR+VYED73Fk=; b=dEM3lascOTujum
	Y00TGO/c2CE3NNz+MgUQXV63BTFAjZl4BuCsKkYjMDGRu8g/aaAC5v1jT9hUsj6ISCwdQHb0wGilN
	16gxhWTMjBgE4KreBuQzJ3bVrMJznOJykCc9sBaKkofT17eZB69kg0S1XZyIBWEns45eZixb3Tpq7
	1FJU48A3Ul73oUogSf+bDNVIjpo7X0oA+vNa/0l+V7to75D0W/9YlwE3IRUut8xi2qJ55IauqEIGx
	V3UyiOLGLgqIEJxK+R3jRyT0W5CwNDXMqqHNYUWhUEaQSv0/jtDkT9oPVVlzjl+AMCiaYEubxxfVS
	qVWL9ZN+L7KDWZcT22BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbsz-00000001XoX-49AE;
	Thu, 11 Sep 2025 07:38:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbsx-00000001XmX-20s1
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 07:38:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso335987e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757576305; x=1758181105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=W4shUZxtZ7WJQ3C1jj/eNuDU7Np3X77r/sqUgNNuCnZo6z9y6mouWj7iO7PDUJKuys
         R2Wtx4Ilk15ymee4Apt4JxhS9yJySKYfpu8DGcAoNRVIUUAe2ob9JbhvvB6YC9RojM+R
         kNjyVHTsrMaZ0rrPLhRkdqxlP5bJ02sZqQQ7MbtjnlPR0/TgT4tzzsDh4hWonyHlHVcf
         QxRsAGjgXym80lFcWXyNFer182qzWr06ZLGPggFE8og4huytMUeE9e9mj5ZNy9esCfDa
         6n1xIiLebLFZi6QcvQJ2UVhhNcFFYrlUqG4ba+hhkFWqBTdGFZnlRBEQ2XJBN3AceGT0
         kXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576305; x=1758181105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=dblPsrS6Mjekyzhv09SwfyR+9xgbru1K+sI+Kb+kVqkpZdkhIut58xeHbjWY3TtBKh
         eJrMNRvbxJM1uVpLgBwiamlVnpGXcBB7XnH651p8vVKHSHUymacpZ5MBACu4uLiLzAIX
         mCWzZ+j+uhey3vW6kOvRGENADrAoBylsynY4ugbA9vYcIDbkwrv1usTglgLFbP+gm5yC
         SvCs0ATFVGDZlFWvDgobeDDJ3bSiclud0yiqc6uLMkYap8l6O0vSYr+jJVFiL5lQDjoN
         jXs7Hp8h1VRtdXcq8dimQ7tL7UHjMgXJltogjui8+LaPYfBBiS4LdCEHhLc6DVodcDy/
         PB1A==
X-Forwarded-Encrypted: i=1; AJvYcCX2NypYXPTcfVeVWgASge/DvejAX07bzU4TqtoEbF7jmswteyPHdRpSqD732CTK6mu1XCa3TBHpPB37tA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywti9UE7sAwrBCL8kOQa7zGt40BU43pQ1mRHtj0a2++yfUz67UA
	do7OY6aFDeH8kZ+BGzbjuaQP864hLapMsYQYyH4DeYsw4BOroxSYj6V7zrOAtOjFi5mlc9v11KF
	meby//ztlluXnycXWsg0VXvAAkAhfmMtXDuB9K3uk6g==
X-Gm-Gg: ASbGncsQwQiMhrsCKG3rol5qfoS+VgqChZDPtrO+D41kBpm/Z/WtqsJP077iQk2QF9d
	5ev8nUOmdoqmmPxBIlW52VFOPeeL3vRbexBBEEi9IEfkctsQV0/mqMTE4cM8HGjO9Uq/g8ptkd3
	qQvx3FwbYaUF6RG4xHY8EGSLfJSX9bT/cp6eSvpn+ut1R6M4foanQQgYVzrw/iz4s7pFhpnt934
	e39KuWvyb7geXnOb3cotKJth1fMjvVZgfwg+Uk=
X-Google-Smtp-Source: AGHT+IGFKCUUrJkt+A6v+xuc1LQXhwUm4KpMBhnA0hSfXgMQG+z+UHy3svEwymKETUJXd9ilc9E5haoHU8vK2eJzapg=
X-Received: by 2002:a05:6512:b17:b0:55f:498f:f08e with SMTP id
 2adb3069b0e04-562614ff71emr7447870e87.24.1757576305171; Thu, 11 Sep 2025
 00:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
In-Reply-To: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:38:12 +0200
X-Gm-Features: Ac12FXwiBbcmTD8LlFccmOHZdwwoOfYFi61pHLgjut8Pxa8sFHcycGYwle9xiUk
Message-ID: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_003827_647490_0D8CDB96 
X-CRM114-Status: GOOD (  23.09  )
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMTE6MzLigK9QTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgOTox
MuKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gPiBI
ZXJlJ3MgdGhlIGZpbmFsIHBhcnQgb2YgdGhlIGdlbmVyaWMgR1BJTyBjaGlwIGNvbnZlcnNpb25z
LiBPbmNlIGFsbCB0aGUKPiA+IGV4aXN0aW5nIHVzZXJzIGFyZSBzd2l0Y2hlZCB0byB0aGUgbmV3
IEFQSSwgdGhlIGZpbmFsIHBhdGNoIGluIHRoZQo+ID4gc2VyaWVzIHJlbW92ZXMgYmdwaW9faW5p
dCgpLCBtb3ZlcyB0aGUgZ3Bpby1tbWlvIGZpZWxkcyBvdXQgb2Ygc3RydWN0Cj4gPiBncGlvX2No
aXAgYW5kIGludG8gc3RydWN0IGdwaW9fZ2VuZXJpY19jaGlwIGFuZCBhZGp1c3RzIGdwaW8tbW1p
by5jIHRvCj4gPiB0aGUgbmV3IHNpdHVhdGlvbi4KPiA+Cj4gPiBEb3duIHRoZSBsaW5lIHdlIGNv
dWxkIHByb2JhYmx5IGltcHJvdmUgZ3Bpby1tbWlvLmMgYnkgdXNpbmcgbG9jayBndWFyZHMKPiA+
IGFuZCByZXBsYWNpbmcgdGhlIC0gbm93IG9ic29sZXRlIC0gImJncGlvIiBwcmVmaXggd2l0aCAi
Z3Bpb19nZW5lcmljIiBvcgo+ID4gc29tZXRoaW5nIHNpbWlsYXIgYnV0IHRoaXMgc2VyaWVzIGlz
IGFscmVhZHkgYmlnIGFzIGlzIHNvIEknbSBsZWF2aW5nCj4gPiB0aGF0IGZvciB0aGUgZnV0dXJl
Lgo+ID4KPiA+IFRlc3RlZCBpbiBxZW11IG9uIHZleHByZXNzLWE5Lgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9y
Zz4KPgo+IFRoZSBwYXRjaCBzZXQgaXMgYSBiZWF1dHksIGhhbmRzIGRvd24uCj4gUmV2aWV3ZWQt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPgo+IEkgZXNwZWNp
YWxseSBsaWtlIHdoZXJlIHlvdSBjYXVnaHQgbG9jYWwgc3BpbmxvY2tzIGJlaW5nCj4gKGFiKXVz
ZWQgaW5zdGVhZCBvZiB0aGUgZ2VuZXJpYyBpcnFjaGlwIG9uZXMuCj4KPiBJIGRvbid0IGtub3cg
YWJvdXQgbWVyZ2luZyBwYXRjaCAxNS8xNSBpbnRvIGp1c3QgdGhlIEdQSU8KPiB0cmVlLCB0aGF0
IGNhbiBtYWtlIHRoaW5ncyBmYWlsIGluIG90aGVyIHN1YnN5c3RlbXMgZGVwZW5kaW5nCj4gb24g
bWVyZ2Ugb3JkZXIgaW50byBUb3J2YWxkcyB0cmVlIG9yIGxpbnV4LW5leHQgaWYgeW91ciB0cmVl
IGlzCj4gbWVyZ2VkIGZpcnN0Lgo+Cj4gSSB3b3VsZCBtZXJnZSB0aGUgZmlyc3QgMTQgYW5kIGtl
ZXAgdGhlIGxhc3QgZm9yIHRoZSBsYXRlciBwYXJ0Cj4gb2YgdGhlIG1lcmdlIHdpbmRvdyB3aGVu
IGFsbCBvdGhlciB0cmVlcyB3aXRoIGNvbnZlcnNpb25zCj4gYXJlIG1lcmdlZC4KPgo+IChZb3Ug
cHJvYmFibHkgYWxyZWFkeSB0aG91Z2h0IG9mIHRoaXMuKQo+Cj4gWW91cnMsCj4gTGludXMgV2Fs
bGVpagoKSSBhbHJlYWR5IGhhdmUgYm90aCBwaW5jdHJsIGFuZCBtZmQgY2hhbmdlcyBpbiBteSB0
cmVlIGZyb20gTGVlJ3MgYW5kCnlvdXIgaW1tdXRhYmxlIGJyYW5jaGVzLiBJIHB1c2hlZCB0aGlz
IGludG8gZ3Bpby9kZXZlbCBhbmQgaXQgYnVpbHQKanVzdCBmaW5lLgoKQmFydAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
