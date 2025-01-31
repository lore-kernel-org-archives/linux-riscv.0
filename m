Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA9CC0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y34SvGRR4aWHL4W26kn1K5mRYvnBqRVmGiBmQ8c2T7c=; b=ySqrPvFbSyTpkl
	AuYM8tP5CnvnhM5W2nCzKJsanhn2PMV9rHV/o62ltEW8IUoLdRzjPocRTsV+cN+NEQ5r4fHHm6xpY
	FJCRJq5rlOiKVs2DUjdeO/pMawWAyvB6dtR7UOwOeP8Oy5QhGgoT0wCfJZps1eSG8kmgKXxODykT+
	Z8AmcuEaP8dDH7YS7gaEt6hpr+axbpKD3hhwuXyKBe809Z3uDd8XlhgiW8clpaqziWrpYg1tbOl6O
	oECAt7qDUtJWlAOG6YRZe5B/pC+Vk25yJK30ZjM3x5GbCgGd40+HLNKtjQkFJODuiZM/kD+XbhFO1
	kDv7P/i2Hw+PghnPe1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdydo-0000000BSgX-07Wl;
	Fri, 31 Jan 2025 21:33:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdydl-0000000BSfD-2hcU
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 21:33:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21628b3fe7dso46897055ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738359209; x=1738964009; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gNnceRFPO5fDZxRcbBd7tMfQOg82L8AVSRCaR86RMVM=;
        b=TxeSdxn3eXa9TABqpVJ/L8oXVozK470GAKHiMu+kEzsHUnfBNhgCJCceQ+7qryyzB+
         UaAt2LVmGzxmlyhmThJ24UKYhqb/dFvZ95yIshpzkKSEpZMe1X6h415PQkXgY70vajRI
         /orLaWBWjGHDcRSLmk2RYTX6rt+o1WXtnuQAekriQaBc0MK82ZiwdexayIk1x3KhsvHR
         vrGWt/kbictBxDMgCjHfvCakPCuwjCuSTOqkT3rHIANjQcxc3nK6aQnvZmN7GWE2wNRd
         qCZIIbD+J74kFTWGNm8GClqsHKS8NpaKlVas5DkRud4uIn5yjGjPxamh6RydQcYXY+pF
         wBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738359209; x=1738964009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNnceRFPO5fDZxRcbBd7tMfQOg82L8AVSRCaR86RMVM=;
        b=hl0VKPi+UGTIXWyplqhrdzYC2ruySHHfUbDXlmpFXncH7SvTBZJg7XsWk7w2VmU11m
         MbRkSCH0epCrOuCM1Dn9IrKhhJdYC8Zbrv/qTtmey2XcBuFp9kzprJ+mm7BV8G80qcte
         iMEzb1jAYh4pSEUjM0q7yqyUCyPW8Mm01FlaKIZKJMSIqHR4rVbaVyC/QbqywTb9Xybk
         vAQX8i38nlxgZJZ3JvHtrazWwpAfNArRC9vbAvhQvLcfnGkfByB6jeZ7cJHwRVG6E6Pl
         AIYHycQYHsPKROkqpNuJ726i0MIUIsXZo53OAI9Z3oiQl5qQUPYGeR8OQO3TyceWfYq9
         a8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUPeJBAeI0gCl4rIggBAMYbXOjoM9hf+01uvytaJXgiADLQJTkIQ+iRvYPueCo1LGSMU+Li+3Z+fPAJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR18g/sgTfw+ADm5SUE3skF1AAbodbPenWRENj6yL+0Wrwt1Su
	AxCzXbMIjOoaVuDCfuqT84vWZ7VMseG/eRWDU8ADbxm0lB70LySOV3x3jspJVJ0=
X-Gm-Gg: ASbGnctfL+xBjCKOy+t1y1D4eCGeFpKSkPnzepAGmCp236PtWKTwdpknjL54olrVkwh
	Pw9yw/ttTCBGln5PQef0qfZN2qW8BdKfYHnBNwE64TCHuHYchNA2VRVICBTwH4gQnhWZaELbebB
	apiDHDEusvwqaimhHaOdedYE1+RBz/guAyr8Zzmtl0iCTv7wHfGTDdDuWJhKMwLqu4bP9n9WiNf
	gSL/VWhOmqdSX8tmmA+4+y690HSGzc5jENY1MlkAKHu0srYGUp1ZCXK15LT+97YXcWOttd6t/0N
	j8MbjwTvQw==
X-Google-Smtp-Source: AGHT+IGtV2TYJwc8Rghm6y+ELcvh6mAobsDIIs+HgTVDhBkhgylQ0meJoVWxHdfv9B3r/OPi1a/Cgg==
X-Received: by 2002:a05:6a00:2e27:b0:72d:65c1:ad01 with SMTP id d2e1a72fcca58-72fd0c8bb54mr18663860b3a.21.1738359208746;
        Fri, 31 Jan 2025 13:33:28 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:b67e:25c1:3d0b:392b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf82sm3910729b3a.17.2025.01.31.13.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 13:33:28 -0800 (PST)
Date: Fri, 31 Jan 2025 13:33:25 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z51BpVEkmVCg7gTX@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
 <Z5xzkwwZAWRRLCdj@ghost>
 <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_133329_682704_C89F0299 
X-CRM114-Status: GOOD (  31.48  )
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

T24gU2F0LCBGZWIgMDEsIDIwMjUgYXQgMTI6MTA6MDJBTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIEZyaSwgSmFuIDMxLCAyMDI1IGF0IDM6NTTigK9QTSBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEphbiAzMCwg
MjAyNSBhdCAwODo1Mjo0NVBNIC0wNzAwLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+ID4g
T24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMDc6MTc6MjZQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+ID4gPiA+IE9uIHJpc2N2LCBrZXJuZWwgbW9kdWxlcyBlbmQgdXAgd2l0aCBhIHNp
Z25pZmljYW50IG51bWJlciBvZiBsb2NhbAo+ID4gPiA+IHN5bWJvbHMuIFRoaXMgYmVjb21lcyBh
cHBhcmVudCB3aGVuIGNvbXBpbGluZyBtb2R1bGVzIHdpdGggZGVidWcgc3ltYm9scwo+ID4gPiA+
IGVuYWJsZWQuIFVzaW5nIGFtZGdwdS5rbyBhcyBhbiBleGFtcGxlIG9mIGEgbGFyZ2UgbW9kdWxl
LCBvbiByaXNjdiB0aGUKPiA+ID4gPiBzaXplIGlzIDc1NE1CIChubyBzdHJpcHBpbmcpLCA1M01C
ICgtLXN0cmlwLWRlYnVnKSwgYW5kIDIxTUIKPiA+ID4gPiAoLS1zdHJpcC11bm5lZWRlZCkuIE9O
IHg4NiwgYW1kZ3B1LmtvIGlzIDQ4Mk1CIChubyBzdHJpcHBpbmcpLCAyMU1CCj4gPiA+ID4gKC0t
c3RyaXAtZGVidWcpLCBhbmQgMjBNQiAoLS1zdHJpcC11bm5lZWRlZCkuCj4gPiA+ID4KPiA+ID4g
PiBVc2UgLS1zdHJpcC11bm5lZWRlZCBpbnN0ZWFkIG9mIC0tc3RyaXAtZGVidWcgdG8gc3RyaXAg
bW9kdWxlcyBzbwo+ID4gPiA+IGRlY3JlYXNlIHRoZSBzaXplIG9mIHRoZSByZXN1bHRpbmcgbW9k
dWxlcy4gVGhpcyBpcyBwYXJ0aWN1bGFybHkKPiA+ID4gPiByZWxldmFudCBmb3IgcmlzY3YsIGJ1
dCBhbHNvIG1hcmdpbmFsbHkgYWlkcyBvdGhlciBhcmNoaXRlY3R1cmVzLgo+ID4gPiA+Cj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4K
PiA+ID4KPiA+ID4gSXMgdGhlcmUgYW55IHNvcnQgb2YgcmVncmVzc2lvbiByaXNrIHdpdGggdGhp
cyBwYXRjaD8gSWYgc28sIGFub3RoZXIKPiA+ID4gb3B0aW9uIG1heSBiZSB0byBnaXZlIGFub3Ro
ZXIgbGV2ZWwgdG8gSU5TVEFMTF9NT0RfU1RSSVAgbGlrZSAyIHNvIHRoYXQKPiA+ID4gSU5TVEFM
TF9NT0RfU1RSSVA9MSBjb250aW51ZXMgdG8gYmVoYXZlIGFzIGJlZm9yZSBidXQgcGVvcGxlIGNh
biBlYXNpbHkKPiA+ID4gb3B0IGludG8gdGhpcyBvcHRpb24uIE5vIHN0cm9uZyBvcGluaW9uIGJl
Y2F1c2UgSSBhbSBub3Qgc3VyZSBidXQgd2FzCj4gPiA+IG5vdCBzdXJlIGlmIGl0IHdhcyBjb25z
aWRlcmVkLgo+ID4KPiA+IEkgZG8gbm90IGJlbGlldmUgdGhpcyB3b3VsZCBjYXVzZSByZWdyZXNz
aW9ucy4gVGhlIGRlc2NyaXB0aW9uIG9uIGdudQo+ID4gc3RyaXAgaXM6Cj4gPgo+ID4gIlJlbW92
ZSBhbGwgc3ltYm9scyB0aGF0IGFyZSBub3QgbmVlZGVkIGZvciByZWxvY2F0aW9uIHByb2Nlc3Np
bmcgaW4KPiA+IGFkZGl0aW9uIHRvIGRlYnVnZ2luZyBzeW1ib2xzIGFuZCBzZWN0aW9ucyBzdHJp
cHBlZCBieSAtLXN0cmlwLWRlYnVnLiIKPiA+Cj4gPiBUaGUgZGVzY3JpcHRpb24gb24gbGx2bS1z
dHJpcCBpczoKPiA+Cj4gPiAiUmVtb3ZlIGZyb20gdGhlIG91dHB1dCBhbGwgbG9jYWwgb3IgdW5k
ZWZpbmVkIHN5bWJvbHMgdGhhdCBhcmUgbm90Cj4gPiByZXF1aXJlZCBieSByZWxvY2F0aW9ucy4g
QWxzbyByZW1vdmUgYWxsIGRlYnVnIHNlY3Rpb25zLiIKPiA+Cj4gPiBnbnUgc3RyaXAgLS1zdHJp
cC11bm5lZWRlZCBzdHJpcHMgc2xpZ2h0bHkgbW9yZSBhZ2dyZXNzaXZlbHkgYnV0IGl0IGRvZXMK
PiA+IG5vdCBhcHBlYXIgdGhpcyBjYXVzZXMgYW55IGlzc3Vlcy4KPiA+Cj4gPiA+Cj4gPiA+IFJl
Z2FyZGxlc3M6Cj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gVGhhbmtzIQo+ID4KPiAKPiAKPiBJdCBpcyB0cnVlIC0t
c3RyaXAtdW5uZWVkZWQgZHJvcHMgYSBsb3Qgb2YgY29tcGlsZXItZ2VuZXJhdGVkIHN5bWJvbHMs
IGJ1dAo+IGl0IGFsc28gZHJvcHMgcmVhbCBzeW1ib2xzIHRoYXQgb3JpZ2luYXRlIGluIHRoZSBz
b3VyY2UgY29kZS4KPiAKPiBTbywgdGhpcyB3b3VsZCBnaXZlIHVzZXItdmlzaWJsZSBjaGFuZ2Vz
IGZvciBrYWxsc3ltcyBhdCBsZWFzdC4KCkFkZGluZyBJTlNUQUxMX01PRF9TVFJJUD0iLS1zdHJp
cC11bm5lZWRlZCIgd291bGQgYmUgc3VmZmljaWVudCBmb3IKcmlzY3YuIEhvd2V2ZXIsIHRoaXMg
aGFzIHRoZSBkb3duc2lkZSB0aGF0IHJpc2N2IHdpbGwgcmVxdWlyZSBkaWZmZXJlbnQKZmxhZ3Mg
dGhhbiBvdGhlciBhcmNoaXRlY3R1cmVzIHRvIGdldCByZWFzb25hYmx5IHNpemVkIG1vZHVsZXMu
IAoKSSBiZWxpZXZlIHRoZXNlIHN5bWJvbHMgYXJlIG9ubHkgdXNlZnVsIGZvciBkZWJ1Z2dpbmcs
IGlzIHRoZXJlIGEKdXNlY2FzZSBmb3IgdGhlbSB0byBiZSBhdmFpbGFibGUgd2hlbiB0aGUgdXNl
ciBoYXMgbW9kdWxlcyBjb21waWxlZCB3aXRoCklOU1RBTExfTU9EX1NUUklQPTE/CgotIENoYXJs
aWUKCj4gCj4gCj4gJCByaXNjdjY0LWxpbnV4LWdudS1ubSAgLW4KPiAvdG1wL3N0cmlwLXVubmVl
ZGVkL2xpYi9tb2R1bGVzLzYuMTMuMC0wOTc2MC1nNjllODU4ZTBiOGIyL2tlcm5lbC9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua28KPiAgPiAvdG1wL3N5bWJvbC13aXRoLXN0cmlw
LXVubmVlZGVkCj4gJCByaXNjdjY0LWxpbnV4LWdudS1ubSAgLW4KPiAvdG1wL3N0cmlwLWRlYnVn
L2xpYi9tb2R1bGVzLzYuMTMuMC0wOTc2MC1nNjllODU4ZTBiOGIyL2tlcm5lbC9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua28KPiAgPiAvdG1wL3N5bWJvbC13aXRoLXN0cmlwLWRl
YnVnCj4gCj4gJCAgZGlmZiAtdSAvdG1wL3N5bWJvbC13aXRoLXN0cmlwLWRlYnVnICAvdG1wL3N5
bWJvbC13aXRoLXN0cmlwLXVubmVlZGVkCj4gIFsgc25pcCBdCj4gIDAwMDAwMDAwMDAxNjc2Y2Mg
dCB1dmRfdjZfMF9yaW5nX3Rlc3RfcmluZwo+ICAwMDAwMDAwMDAwMTY3ODAyIHQgdXZkX3Y2XzBf
cmluZ19lbWl0X3BpcGVsaW5lX3N5bmMKPiAgMDAwMDAwMDAwMDE2N2EwMiB0IHV2ZF92Nl8wX3Jp
bmdfZW1pdF9mZW5jZQo+IC0wMDAwMDAwMDAwMTY3YjU4IHIgQ1NXVENILjIKPiAtMDAwMDAwMDAw
MDE2N2I2OCByIGFibV9zZXR0aW5ncwo+IC0wMDAwMDAwMDAwMTY3YjgwIHIgYWJtX2NvbmZpZwo+
IC0wMDAwMDAwMDAwMTY3YjkwIHIgbWluX3JlZHVjdGlvbl90YWJsZV92XzJfMgo+IC0wMDAwMDAw
MDAwMTY3YmEwIHIgbWF4X3JlZHVjdGlvbl90YWJsZV92XzJfMgo+IC0wMDAwMDAwMDAwMTY3YmIw
IHIgbWluX3JlZHVjdGlvbl90YWJsZQo+IC0wMDAwMDAwMDAwMTY3YmMwIHIgbWF4X3JlZHVjdGlv
bl90YWJsZQo+IC0wMDAwMDAwMDAwMTY3YmQwIHIgY3VzdG9tX2JhY2tsaWdodF9jdXJ2ZTAKPiAg
MDAwMDAwMDAwMDE2N2MzOCByIGFibV9zZXR0aW5nc19jb25maWcyCj4gIDAwMDAwMDAwMDAxNjdj
NzAgciBhYm1fc2V0dGluZ3NfY29uZmlnMQo+ICAwMDAwMDAwMDAwMTY3Y2E4IHIgYWJtX3NldHRp
bmdzX2NvbmZpZzAKPiAKPiAKPiAKPiAKPiAtLQo+IEJlc3QgUmVnYXJkcwo+IE1hc2FoaXJvIFlh
bWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
