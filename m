Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69045C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 20:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAWq14EjYAw59/Caa7d6LJdS5yiA6o94z0pjCiSfZnA=; b=bfbgQrfT3xBwC4
	D/jQtcsMvIAnHRguCuYUC49hdueOLcoeraQiVU06xqWPuu25d4u24/wvcX6Mnwmms75mjTtolpn2b
	c8vaXctHHaL8sYIsqaIg3OgGfo2++cn8QryPG5pYgCtun0WWUV802lKbk8hMaz8btdnsNO04+YQa3
	dNbEcij+7A5PjmC/Ml8Mxm9PJkCRBpXF9f4KZAqeqXb7VjVKnyNDtfgDKoNvA5s54ZQzWMtu1i9Rs
	6ajYbuvMj7KYy9IgQMH5tyALbMsk3RHd1pawJtE3INnuVFJv4Ot107mpwx1pGMjrPO6zhFVimPmFG
	t+66pxBMUyFzWz7VTjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGDY-0000000EFsV-3gza;
	Fri, 28 Mar 2025 20:22:16 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGDV-0000000EFro-2bsM
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 20:22:15 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2944455e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 13:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743193332; x=1743798132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kU2L9SzC1ltwQ0K7N9pemKqCwVUvpPE6b7uD8pnOltI=;
        b=E3nWbtSKMymwhLNl8MqkYcIs80SLwU+/HrdMOnQpBtC9ALmGdyrnPM7bdYRWrjdVXc
         K41ODwu/cARKPXMxpe/XCop3DGN/tEH8ARBaxaQZCjlW18AO33L7bfDZfHR98UWxH8pJ
         XeyjPxErdirJFy/bWTFkljV+wAsDl3Q25jF2TBq8NkEqsl0s3Egm1mNzwds6IMUAn6Sc
         UsLJCj27E4UCmIilqTuBhlaMgwYi8Tjbb30ISiaB6+UfxaBsLPwMH2HjBnQDXNxRsuhU
         AOjC9VW7BNuGi5Muugi+ISWq9YFQOiNAkMzl6De0yGSdNashVxMCsFmO+qUVstzDy3YM
         gaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743193332; x=1743798132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU2L9SzC1ltwQ0K7N9pemKqCwVUvpPE6b7uD8pnOltI=;
        b=BQp7sag4CF6GLB8MqPvXxbIzP/vvx8iXBtjcSn7ou2TkQniTBJNLWJ+LBSo19PMZl4
         3N8JHEYm5ggMlbfiEv8l4iH1CkK5FWtN42uYQE9rHMikehk2PcgxNbnZt17h0533Dp4Z
         yqApQya3XIolNe7PLUKpk3q8LMITt4L/S16KtQcvmmBULqABXHLPEXvfnSeweZqdeiF7
         fBLcdgJmLvN3cUSJbJKN/L19CTDZB5qqVNtD184Lzm0sc7PdKa1VE/+mLyvBCr0dwYvi
         curW+aTRaKZskq0PcbKWwi8L/CcqPrK8Ve2uAW84XlZnbH6TimbEaSdWzKUJei0B8uon
         6QNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUevi5CsEkTeYbwGLD0NxfgNCQs2bSPmESv6t6hcDuoHZRFMf4vnBwOB0FgASVV/Gp1++DDH5+fyM580Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIyq4i+umM7kDasilVW0P8QsF0wgqhYold2SFrC0hSjvaLDpd4
	MS8wX8cZfl+eQ8M6sj1Duf9y1yUUarGneXc0AD5YDYFpjDETS9hOQhFdN+DS
X-Gm-Gg: ASbGncuyOmVWt60NoG6gTkFPJaLw+6/9m7Mc2USccZDt0DXBytPidoQQ4YqoVdtHSyc
	4MBwnrOlHGC8lKXcrdKvMm1W0X0EDgiDjlicumeftVvooofKUVTEjHihisGLxmY7pCcWK/4f4Tm
	JXZY3QHBSXBD23wbeb8lpr1BmODKcBFVEOzXr8m84xjwscDWY+FEOEAgI9oO62J5SMz3vAXH0Qp
	vXuU9n+GKVTXDniGDoeyyOtyizUnFqkUTOV/xS3seRzMrzeDB5M0JQQQ3VyiNTfuLMuMAYtu/um
	33h2+MHM52UMKK8PNjwcg8fegPqLkH5dHQu4xAcLDtTDVBOwgo99qHmmkyJLuRjUkgDSmufRAy+
	l8mhFw6HGGe1O2z/Q+eW1TSr8bXWSTw==
X-Google-Smtp-Source: AGHT+IHXFGdGrTwAKgRdytcexcERVQeUEpJlIwNp//11OnyIczXwqgBzbTHprdT1/60ZP4XyV9xORw==
X-Received: by 2002:a05:6512:1113:b0:54b:f04:59e8 with SMTP id 2adb3069b0e04-54b10ecb002mr264536e87.23.1743193331176;
        Fri, 28 Mar 2025 13:22:11 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fa73sm411017e87.140.2025.03.28.13.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 13:22:10 -0700 (PDT)
Message-ID: <112207cd-6823-44b5-9117-fb68a8b63368@gmail.com>
Date: Fri, 28 Mar 2025 21:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] riscv: Add runtime constant support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Pasha Bouzarjomehri <pasha@rivosinc.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
 <cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com>
 <CAHVXubjq901KYw+aRmYoNYUpCks87TB2QAu2U_fcx7Wmh_+9gg@mail.gmail.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <CAHVXubjq901KYw+aRmYoNYUpCks87TB2QAu2U_fcx7Wmh_+9gg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_132213_678399_E8C697A4 
X-CRM114-Status: GOOD (  19.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxleCwKCk9uIDMvMjgvMjUgMTg6MzUsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBIaSBL
bGFyYSwKPiAKPiBPbiBGcmksIE1hciAyOCwgMjAyNSBhdCA0OjQy4oCvUE0gS2xhcmEgTW9kaW4g
PGtsYXJhc21vZGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBPbiAzLzE5LzI1
IDE5OjM1LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBJbXBsZW1lbnQgdGhlIHJ1bnRpbWUg
Y29uc3RhbnQgaW5mcmFzdHJ1Y3R1cmUgZm9yIHJpc2N2LiBVc2UgdGhpcwo+Pj4gaW5mcmFzdHJ1
Y3R1cmUgdG8gZ2VuZXJhdGUgY29uc3RhbnRzIHRvIGJlIHVzZWQgYnkgdGhlIGRfaGFzaCgpCj4+
PiBmdW5jdGlvbi4KPj4+Cj4+PiBUaGlzIGlzIHRoZSByaXNjdiB2YXJpYW50IG9mIGNvbW1pdCA5
NGEyYmMwZjYxMWMgKCJhcm02NDogYWRkICdydW50aW1lCj4+PiBjb25zdGFudCcgc3VwcG9ydCIp
IGFuZCBjb21taXQgZTNjOTJlODE3MTFkICgicnVudGltZSBjb25zdGFudHM6IGFkZAo+Pj4geDg2
IGFyY2hpdGVjdHVyZSBzdXBwb3J0IikuCj4+Cj4+IFRoaXMgcGF0Y2ggY2F1c2VzIHRoZSBmb2xs
b3dpbmcgYnVpbGQgZmFpbHVyZSBmb3IgbWU6Cj4+Cj4+IGZzL2RjYWNoZS5jOiBBc3NlbWJsZXIg
bWVzc2FnZXM6Cj4+IGZzL2RjYWNoZS5jOjE1NzogRXJyb3I6IGF0dGVtcHQgdG8gbW92ZSAub3Jn
IGJhY2t3YXJkcwo+PiBmcy9kY2FjaGUuYzoxNTc6IEVycm9yOiBhdHRlbXB0IHRvIG1vdmUgLm9y
ZyBiYWNrd2FyZHMKPj4gZnMvZGNhY2hlLmM6MTU3OiBFcnJvcjogYXR0ZW1wdCB0byBtb3ZlIC5v
cmcgYmFja3dhcmRzCj4+IGZzL2RjYWNoZS5jOjE1NzogRXJyb3I6IGF0dGVtcHQgdG8gbW92ZSAu
b3JnIGJhY2t3YXJkcwo+PiBmcy9kY2FjaGUuYzoxNTc6IEVycm9yOiBhdHRlbXB0IHRvIG1vdmUg
Lm9yZyBiYWNrd2FyZHMKPj4gbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjIw
MzogZnMvZGNhY2hlLm9dIEVycm9yIDEKPj4KPj4gVGhlIHZhbHVlIG9mIENPTkZJR19SSVNDVl9J
U0FfWkJLQiBkb2Vzbid0IHNlZW0gdG8gaGF2ZSBhbiBpbXBhY3QuCj4+IFJldmVydGluZyB0aGUg
cGF0Y2ggb24gdG9wIG9mIG5leHQtMjAyNTAzMjggcmVzb2x2ZWQgdGhlIGlzc3VlIGZvciBtZS4g
SQo+PiBhdHRhY2hlZCB0aGUgZ2VuZXJhdGVkIGZzL2RjYWNoZS5zLgo+IAo+IFRoYW5rcyBmb3Ig
eW91ciByZXBvcnQhCj4gCj4gS2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0ZWQgdGhlIGZvbGxvd2lu
ZyBpc3N1ZSwgZG8geW91IGhhdmUgdGhlIHNhbWUgZXJyb3JzPwo+IAo+ICAgICBmcy9kY2FjaGUu
YzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+Pj4gZnMvZGNhY2hlLmM6MTQzOiBXYXJuaW5nOiBVbnJl
Y29nbml6ZWQgLm9wdGlvbiBkaXJlY3RpdmU6IGFyY2gsK3piYQo+IC0tCj4+PiBmcy9kY2FjaGUu
YzoxNDU6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlIGBhZGQudXcgczEsczEsYTUnCj4+PiBm
cy9kY2FjaGUuYzoxNDM6IFdhcm5pbmc6IFVucmVjb2duaXplZCAub3B0aW9uIGRpcmVjdGl2ZTog
YXJjaCwremJhCj4gLS0KPj4+IGZzL2RjYWNoZS5jOjE0NTogRXJyb3I6IHVucmVjb2duaXplZCBv
cGNvZGUgYGFkZC51dyBhNCxhNCxhNScKPj4+IGZzL2RjYWNoZS5jOjE0MzogV2FybmluZzogVW5y
ZWNvZ25pemVkIC5vcHRpb24gZGlyZWN0aXZlOiBhcmNoLCt6YmEKPiAtLQo+Pj4gZnMvZGNhY2hl
LmM6MTQ1OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZSBgYWRkLnV3IHM0LHM0LGE1Jwo+Pj4g
ZnMvZGNhY2hlLmM6MTQzOiBXYXJuaW5nOiBVbnJlY29nbml6ZWQgLm9wdGlvbiBkaXJlY3RpdmU6
IGFyY2gsK3piYQo+IC0tCj4+PiBmcy9kY2FjaGUuYzoxNDU6IEVycm9yOiB1bnJlY29nbml6ZWQg
b3Bjb2RlIGBhZGQudXcgczEsczEsYTUnCj4+PiBmcy9kY2FjaGUuYzoxNTI6IEVycm9yOiBhdHRl
bXB0IHRvIG1vdmUgLm9yZyBiYWNrd2FyZHMKPj4+IGZzL2RjYWNoZS5jOjE1MjogRXJyb3I6IGF0
dGVtcHQgdG8gbW92ZSAub3JnIGJhY2t3YXJkcwo+Pj4gZnMvZGNhY2hlLmM6MTUyOiBFcnJvcjog
YXR0ZW1wdCB0byBtb3ZlIC5vcmcgYmFja3dhcmRzCj4+PiBmcy9kY2FjaGUuYzoxNTI6IEVycm9y
OiBhdHRlbXB0IHRvIG1vdmUgLm9yZyBiYWNrd2FyZHMKPiAKPiAgIElmIHNvLCBJIHNlbnQgYSBm
aXgsIGRvbid0IGhlc2l0YXRlIHRvIGFkZCB5b3VyIFRlc3RlZC1ieToKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi9jMGY0MjVlYy02Yzc2LTQ1YjItYjFiYy04ZDliZTAyOGE4
NzhAcml2b3NpbmMuY29tL1QvI21lMTQ2OWJmYjJlNmY2OWUxNDIyYTEzNjAxNGI3NTNhNmFjYWEz
YmM2CgpJIG9ubHkgc2F3IHRoZSBhdHRlbXB0IHRvIG1vdmUgLm9yZyBiYWNrd2FyZHMgZXJyb3Iu
IEknbSB1c2luZyBiaW51dGlscyAKMi40NCBhbmQgYSBHQ0MgMTUgc25hcHNob3QgZnJvbSAyMDI1
LTAzLTIzIHNvIEkgZG9uJ3QgdGhpbmsgdGhlIAp0b29sY2hhaW4gc3VwcG9ydCBmb3IgemJhIHNo
b3VsZCBiZSB0aGUgaXNzdWUuIFRoZSBmaXggZGlkbid0IG1ha2UgYW55IApkaWZmZXJlbmNlIGZv
ciBtZS4KCkhvd2V2ZXIsIGl0IHNlZW1zIHRoaXMgY291bGQgYmUgc29tZXRoaW5nIGluIEdDQyAx
NSBhcyB3aGVuIEkgcmV0cmllZCAKd2l0aCBHQ0MgMTQuMiBhbmQgMTIuNCBJIGNvdWxkIG5vIGxv
bmdlciBzZWUgdGhlIGlzc3VlLgoKUmVnYXJkcywKS2xhcmEgTW9kaW4KCj4gCj4gVGhhbmtzLAo+
IAo+IEFsZXgKPiAKPiAKPj4KPj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW55dGhp
bmcgZWxzZSB5b3UgbmVlZC4KPj4KPj4gUmVnYXJkcywKPj4gS2xhcmEgTW9kaW4KPj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
