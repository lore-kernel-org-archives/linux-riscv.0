Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA8C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN7yk5qQys0FfSE3i9DGmgNXFmLFf/MbrHRBTPJODPU=; b=3iC1g2plFlY+NF
	jbGoz4s+if7AkFSjq1rWA5wxFvCckzuGhdze0QWQyk7KoG9Jm3J25SQ+WjcGSR045Fe/1JqA0LwW5
	N8aZg+S5yfRvUFz+c3Q0CQAL2Q61VeRPXJ28KVdGGzzbcsZHXuSLCbx41j4xme5Pa/Mz7qKxl99dK
	5a7HTv6qxf+EO/L0ad5lLb1k56m8kfAlVrpjMqcoarDpYLzyDGsHdVZE6cuA2Gfc7yjwolCJNzhyE
	Sl7Srvcrrf1tQplHGdSsjz4zV2LFFEaYaNvMKmAdRuUqbOs95It+yRK2xdxGjnhpBOGlGltJBiw2X
	ku3s68lI3n2glaUQ+88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PTH-0000000HaWo-3ote;
	Tue, 21 May 2024 13:24:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PTE-0000000HaVx-2J0g
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 13:24:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a59a0e4b773so835913666b.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716297838; x=1716902638; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch94/MUKajfhml6j4NyfbEOexox9CsSjGOQusf6QZ7Y=;
        b=Ck10gHho5777FD8EWHDR32R4Lt6RFCd7V1RTzOxN8KULttupNT7guqWMFXkNtohWWk
         mEve6iTcV7nuZh5amX1ju3gYEjPU+SYeZdFCxLftqX5+67hPxwH8g9qTkC7FoGqO3wJH
         HJGaTeozaiWsoympGXlpBsuBrSENHqCOVAnWLuCnTOT0jqG8XR9YtDWZhpJd++IUorX7
         OLUrmKXKbBZoxhWfEiNUfOXb+TwoZqFqkGTmBOT7XsGU5B8mY6feXNyFjFBhDC8xVf4V
         fPAinqV+GGNFX5bkYYPM1/jsbZLIZfLeJcXa51m6NUxMMplDlbTdsyVaKT0fDtvtZ+No
         jzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716297838; x=1716902638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ch94/MUKajfhml6j4NyfbEOexox9CsSjGOQusf6QZ7Y=;
        b=qHGrpN4a6kByQM+3/U7+pzO8zId9XUTI3Sgk5olr6c7Kp4UTzCxtbRfRLQspWapq+G
         osh11rvvzm5cVfDY8OYfYQ/8DhQoTwun//8xYF5ZNK9zhPskoiHDHmuHye2FQHA49SY7
         VASPi11EHkN0eUXKqdpmE1hZcsBhG2Sod6WFlXDuJJyfRKq/SVRWYCd7+Fxakr2DuLJK
         E9qj/rYylnioYzsKu69N4x1zXjYNJbAiA5kK/H6bXdS/tMLuNDaAe2Iz0SNO2B5lFPbz
         CqcydEXCCBHLQHNbu5syfNMQn8D1k27vyPQZHfTQXryrq6beEOTZq1+BEwxRqQdOaBt/
         ntaA==
X-Forwarded-Encrypted: i=1; AJvYcCXJxyZD336ffveGh3IW+xTCG/bPmhCsvOaSRP3FHhCGXdRx2OP0rKnPGfZuWSN1rmjVQYIzAG09THmx7pm1lXhnkuIffopDfNPtgst26Uqc
X-Gm-Message-State: AOJu0YzXUEgUp+rX7fZPU5ZRKERLvtiOHuQgd4gD1k+/IQygLKZUGfYu
	ZHYjnYq4l62ei0/Wkn5X8HMz3FJHwoHR4TQwojn3yQZoukvEVwSGABuqY2zYfDvT0wFgBAiyOvz
	iEWGeSu1QWu/Q3dXYbZg7qWWcDM89+OUW4y4ioA==
X-Google-Smtp-Source: AGHT+IFNPqteIERuQeyx8fOJtXwMedVB6JFT7AeuGshPQDCn+zzfFh7PvOccTzqO4JtW047q2vYzycQdAe7WDgqQFSA=
X-Received: by 2002:a17:906:ca8a:b0:a5c:df23:c9c6 with SMTP id
 a640c23a62f3a-a5cdf23d59cmr1178417366b.47.1716297838602; Tue, 21 May 2024
 06:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240521114830.841660-1-bjorn@kernel.org> <20240521114830.841660-8-bjorn@kernel.org>
In-Reply-To: <20240521114830.841660-8-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 21 May 2024 15:23:47 +0200
Message-ID: <CAHVXubjQr1xzKcjRgB8zA3opj6N93PGpF2=5yKkKK6R07Rpntg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] riscv: Enable memory hotplugging for RISC-V
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_062400_846153_18577BD6 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMTo0OeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gRW5hYmxlIEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGFuZCBBUkNIX0VOQUJM
RV9NRU1PUllfSE9UUkVNT1ZFIGZvcgo+IFJJU0MtVi4KPgo+IFNpZ25lZC1vZmYtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmln
IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggZmU1Mjgx
Mzk4NTQzLi4yNzI0ZGMyYWYyOWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTE2LDYgKzE2LDggQEAgY29uZmlnIFJJU0NW
Cj4gICAgICAgICBzZWxlY3QgQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaWYgQUNQSQo+ICAg
ICAgICAgc2VsZWN0IEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQKPiAgICAgICAgIHNlbGVjdCBB
UkNIX0VOQUJMRV9IVUdFUEFHRV9NSUdSQVRJT04gaWYgSFVHRVRMQl9QQUdFICYmIE1JR1JBVElP
Tgo+ICsgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGlmIFNQQVJTRU1F
TV9WTUVNTUFQICYmIDY0QklUICYmIE1NVQoKTm90IHN1cmUgeW91IG5lZWQgNjRCSVQgJiYgTU1V
IGhlcmUgc2luY2UgQVJDSF9TUEFSU0VNRU1fRU5BQkxFCmRlcGVuZHMgb24gTU1VIGFuZCBTUEFS
U0VNRU1fVk1FTU1BUF9FTkFCTEUgaXMgb25seSBlbmFibGVkIG9uIDY0QklULgoKPiArICAgICAg
IHNlbGVjdCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFIGlmIE1FTU9SWV9IT1RQTFVHCj4g
ICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BUTE9DSyBpZiBQR1RBQkxFX0xF
VkVMUyA+IDIKPiAgICAgICAgIHNlbGVjdCBBUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OIGlmIFRS
QU5TUEFSRU5UX0hVR0VQQUdFCj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfQklORk1UX0ZMQVQK
PiAtLQo+IDIuNDAuMQo+CgpCdXQgYW55d2F5LCB0byBtZSB0aGF0IGRvZXMgbm90IHJlcXVpcmUg
YSBuZXcgdmVyc2lvbiBzbyB5b3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
