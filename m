Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E158C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZzYqLxk4eyZLYeCcmjgEW6AzB697fQP3vYXOEePCBI=; b=TQH1vK6BeIYMyd
	D3hhhtxdr7OKKDsIXxMSYXIrEd5KapXAuAqHe3QywDUe15wrW+HVQXIVD8CN0N9NbLtqLT+qCaEfT
	W1NPvjFXn+OYm14XEghJBWH9SW+PBQBqCGOkS4c3GUDXfML685Mb/Je4lNZsdD43uDzu3fqVFch4C
	9c0+aAVNlDe8bfAFEmfNmjGxELOs5owzQ68npGAd9ZTicC5V+Fcr7ZstHGNKfHsd+aQWMTqBFg74N
	IWG0PYyJmudVSZyDKNTXofrF9xHKIm7p/301+S2TTGAA6Ptu7JSl+hNW1BOSxb01aBd2Td6AgO6ce
	v65OdocuO+Fg8XUSAXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rys2K-0000000DOqK-07vy;
	Mon, 22 Apr 2024 11:40:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rys2E-0000000DOnl-4B40
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 11:40:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-34b39ecbd0dso73897f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713786033; x=1714390833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyXuxvG0jo0EeYgJFE9/eMqNg1Z05zXTsUVqLHCMuBs=;
        b=OcttJtfjk0jcYZS9rQjnT8oXjoKJaAK00OMcSvYaPz3BBoq8UmdFOSA28ab4uti9WG
         STIb6H4o3OyaHDYRrud8sAmO9X4Y7SWy5a354RE96jyYohT3p4JO6T+dHnovEJCe03am
         JeuFpcZO59blH4b8pmwCclSfhJCzdCeBK7y6JZBQAqdC4LxuZs43vrC+QUw8I/kl1xEg
         Apt2OxONcFEP9U4QfQmF6HbgbCKNIqaXRckgX0gbwb5LEBh/kcpX1XoKV6Gys1RsXr+4
         32HpEdx1a//wpkWpmPXYb4Fn+KYfQEpbRiEkeic4O30abuwMicFeDduES+FmtYPJ6LwD
         iMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713786033; x=1714390833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyXuxvG0jo0EeYgJFE9/eMqNg1Z05zXTsUVqLHCMuBs=;
        b=cRvVZ8k/rbjSPE4iCkPTh/wr8B8ue413uSY4cwoX+RK6zSARR619ct7KFgKlkju2o1
         x/uhVn1Quh2/UIGbxD3eLESTiiPDVPqQ21yqHKJLWfPFPIC8rT5478Ca35AAg69WnesP
         MnO3FZzXYtlvF9Nb3NfP/tjAtFPN6HESzNrF0nkhzSkaVrwzg4RxAPMRoGzjnwtBd9Hy
         9J1WczPaF8WocoTFY/JWAzgug1LPyCHa5AD9fAJXDPJ0D9258lUDFnfkosFOQRZBzrZt
         w1ADPLhppT/Gx2DJ7bz/SDTBEiWNnDYPy7xzc2XrMNpXNmIYeMWnFK8b5SbO7YHWrehi
         aX2g==
X-Forwarded-Encrypted: i=1; AJvYcCUGFbhwm0SX8eSna+DAAimPxmpz9aa7110CSHseWuAJiy8ofwcE9p7Jj0cVOxHAoE5cM/gCNLRFwfPPppUDolYr01SLHnzgua94h3Q/06ba
X-Gm-Message-State: AOJu0Yx5tCdKu96P/G4JvnDalso/dP5aJihAhlSVaacwxid8VjVa8pTm
	zWnhp26R0PkS0S7u/JD+yCL2OkG9uEYCmQhRd3kkgTlSSbRcZRsN9pSxUgTx4dE=
X-Google-Smtp-Source: AGHT+IEBsytwGUl5ywdsyAtA0Tb7Bwan6wxkhWaIQk4aXEJurWpLAppFPSp2ncjaO6l/2n4gpEGi6w==
X-Received: by 2002:a5d:6392:0:b0:346:500f:9297 with SMTP id p18-20020a5d6392000000b00346500f9297mr6203710wru.2.1713786033161;
        Mon, 22 Apr 2024 04:40:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id w17-20020a5d6811000000b0034a2ba13588sm10715492wru.42.2024.04.22.04.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 04:40:32 -0700 (PDT)
Message-ID: <5050cd12-45fd-4228-9d9f-ba70ab21f737@rivosinc.com>
Date: Mon, 22 Apr 2024 13:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules
 implied by C extension
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-4-cleger@rivosinc.com>
 <20240419-blinked-timid-da722ec6ddc4@spud>
 <f89c79f7-a09e-4fcf-8e16-0875202ade4a@rivosinc.com>
 <20240422-stumbling-aliens-b408eebe1f32@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240422-stumbling-aliens-b408eebe1f32@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_044035_063602_0FE91BE5 
X-CRM114-Status: GOOD (  34.59  )
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

CgpPbiAyMi8wNC8yMDI0IDEzOjE5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MjIsIDIwMjQgYXQgMTA6NTM6MDRBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBP
biAxOS8wNC8yMDI0IDE3OjQ5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBUaHUsIEFwciAx
OCwgMjAyNCBhdCAwMjo0MjoyNlBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4g
QXMgc3RhdGVkIGJ5IFpjKiBzcGVjOgo+Pj4+Cj4+Pj4gIkFzIEMgZGVmaW5lcyB0aGUgc2FtZSBp
bnN0cnVjdGlvbnMgYXMgWmNhLCBaY2YgYW5kIFpjZCwgdGhlIHJ1bGUgaXMgdGhhdDoKPj4+PiAg
LSBDIGFsd2F5cyBpbXBsaWVzIFpjYQo+Pj4+ICAtIEMrRiBpbXBsaWVzIFpjZiAoUlYzMiBvbmx5
KQo+Pj4+ICAtIEMrRCBpbXBsaWVzIFpjZCIKPj4+Pgo+Pj4+IEFkZCBhZGRpdGlvbm5hbCB2YWxp
ZGF0aW9uIHJ1bGVzIHRvIGVuZm9yY2UgdGhpcyBpbiBkdHMuCj4+Pgo+Pj4gSSdsbCBnZXQgaXQg
b3V0IG9mIHRoZSB3YXk6IE5BSywgYW5kIHRoZSBkdHMgcGF0Y2ggaXMgdGhlIHBlcmZlY3QKPj4+
IGV4YW1wbGUgb2Ygd2h5LiBJIGRvbid0IHdhbnQgdXMgdG8gaGF2ZSB0byBjb250aW51YWxseSB1
cGRhdGUKPj4+IGRldmljZXRyZWVzLiBJZiB0aGVzZSBhcmUgaW1wbGllZCBkdWUgdG8gYmVpbmcg
c3Vic2V0cyBvZiBvdGhlcgo+Pj4gZXh0ZW5zaW9ucywgdGhlbiBzb2Z0d2FyZSBzaG91bGQgYmUg
YWJsZSB0byBlbmFibGUgdGhlbSB3aGVuIHRoYXQKPj4+IG90aGVyIGV4dGVuc2lvbiBpcyBwcmVz
ZW50Lgo+Pgo+PiBBY2tlZC4KPj4KPj4+Cj4+PiBNeSBmZWFyIGlzIHRoYXQsIGFuZCBhIHF1aWNr
IGxvb2sgYXQgdGhlICJhZGQgcHJvYmluZyIgY29tbWl0IHNlZW1lZCB0bwo+Pj4gY29uZmlybSBp
dCwgbmV3IHN1YnNldHMgd291bGQgcmVxdWlyZSB1cGRhdGVzIHRvIHRoZSBkdHMsIGV2ZW4gdGhv
dWdoCj4+PiB0aGUgZXhpc3RpbmcgZXh0ZW5zaW9uIGlzIHBlcmZlY3RseSBzdWZmaWNpZW50IHRv
IGRldGVybWluZSBwcmVzZW5jZS4KPj4+Cj4+PiBJIGRlZmluaXRlbHkgd2FudCB0byBhdm9pZCBj
b250aW51YWwgdXBkYXRlcyB0byB0aGUgZGV2aWNldHJlZSBmb3IgY2h1cm4KPj4+IHJlYXNvbnMg
d2hlbmV2ZXIgc3Vic2V0cyBhcmUgYWRkZWQsIGJ1dCBub3QgdHVybmluZyBvbiB0aGUgbGlrZXMg
b2YgWmNhCj4+PiB3aGVuIEMgaXMgcHJlc2VudCBiZWNhdXNlICJ0aGUgYmluZGluZ3Mgd2VyZSB1
cGRhdGVkIHRvIGVuZm9yY2UgdGhpcyIKPj4+IGlzIGEgY29tcGxldGUgYmxvY2tlci4gSSBkbyBj
b25jZWRlIHRoYXQgaGF2aW5nIHR3byBwYXJlbnRzIG1ha2VzIHRoYXQKPj4+IG1vcmUgZGlmZmlj
dWx0IGFuZCB3aWxsIGxpa2VseSByZXF1aXJlIHNvbWUgY2hhbmdlcyB0byBob3cgd2UgcHJvYmUg
LSBkbwo+Pj4gd2UgbmVlZCB0byBoYXZlIGEgInNlY29uZCByb3VuZCIgdHlwZSB0aGluZz8KPj4K
Pj4gWWVhaCwgSSB1bmRlcnN0YW5kLiBBdCBmaXJzdCwgSSBhY3R1YWxseSBkaWQgdGhlIG1vZGlm
aWNhdGlvbnMgaW4gdGhlCj4+IElTQSBwcm9iaW5nIGxvb3Agd2l0aCBzb21lIGRlcGVuZGVuY3kg
cHJvYmluZyAoaWUgbG9vcCB3aGlsZSB3ZSBkb24ndAo+PiBoYXZlIGEgc3RhYmxlIGV4dGVuc2lv
biBzdGF0ZSkuIEJ1dCBJIHRob3VnaHQgdGhhdCBpdCB3YXMgbm90IGFjdHVhbGx5Cj4+IG91ciBw
cm9ibGVtIGJ1dCByYXRoZXIgdGhlIElTQSBzdHJpbmcgcHJvdmlkZXIuIEZvciBpbnN0YW5jZSwg
UWVtdQo+PiBwcm92aWRlcyB0aGVtLgo+IAo+IAo+IEEgbmV3ZXIgdmVyc2lvbiBvZiBRRU1VIG1p
Z2h0LCBidXQgbm90IGFsbCBkbywgc28gSSdtIG5vdCBzdXJlIHRoYXQgdXNpbmcKPiBpdCBpcyBh
IGdvb2QgZXhhbXBsZS4gTXkgZXhwZWN0YXRpb25zIGlzIHRoYXQgYSBkZXZpY2V0cmVlIHdpbGwg
YmUgd3JpdHRlbgo+IHRvIHRoZSBzdGFuZGFyZHMgb2YgdGhlIGRheSBhbmQgbm90IGJlIHVwZGF0
ZWQgYXMgc3Vic2V0cyBhcmUgcmVsZWFzZWQuCj4gCj4gSWYgdGhpcyB3ZXJlIHRoZSBmaXJzdCBp
bnN0YW5jZSBvZiBhIHN1cGVyc2V0L2J1bmRsZSBJJ2QgYmUgcHJlcGFyZWQgdG8KPiBhY2NlcHQg
YW4gYXJndW1lbnQgdGhhdCB3ZSBzaG91bGQgbm90IGluZmVyIGFueXRoaW5nIC0gYnV0IGl0J3Mg
bm90IGFuZAo+IHdlJ2QgYmUgaW50cm9kdWNpbmcgaW5jb25zaXN0ZW5jeSB3aXRoIHRoZSBjcnlw
dG8gc3R1ZmYuIEkga25vdyB0aGF0IGJvdGgKPiBzY2VuYXJpb3MgYXJlIGRpZmZlcmVudCBpbiB0
ZXJtcyBvZiBleHRlbnNpb24gaGlzdG9yeSBnaXZlbiB0aGF0IHRoaXMgaXMKPiBzcGxpdHRpbmcg
dGhpbmdzIGludG8gYSBzdWJzZXQgYW5kIHRoYXQgd2FzIGEgc3VwZXJzZXQvYnVuZGxlIGNyZWF0
ZWQgYXQKPiB0aGUgc2FtZSB0aW1lLCBidXQgdGhleSdyZSBub3QgcmVhbGx5IHRoYXQgZGlmZmVy
ZW50IGluIHRlcm1zIG9mIHRoZQo+IERUL0FDUEkgdG8gdXNlciAiaW50ZXJmYWNlIi4KPiAKPj4+
IFRha2luZyBaY2YgYXMgYW4gZXhhbXBsZSwgbWF5YmUgc29tZXRoaW5nIGxpa2UgbWFraW5nIGJv
dGggb2YgQyBhbmQgRiBpbnRvCj4+PiAic3RhbmRhcmQiIHN1cGVyc2V0cyBhbmQgYWRkaW5nIGEg
Y2FzZSB0byByaXNjdl9pc2FfZXh0ZW5zaW9uX2NoZWNrKCkKPj4+IHRoYXQgd291bGQgbWFuZGF0
ZSB0aGF0IFpjYSBhbmQgRiBhcmUgZW5hYmxlZCBiZWZvcmUgZW5hYmxpbmcgaXQsIGFuZCB3ZQo+
Pj4gd291bGQgZW5zdXJlIHRoYXQgQyBpbXBsaWVzIFpjYSBiZWZvcmUgaXQgaW1wbGllcyBaY2Y/
Cj4+Cj4+IEknbSBhZnJhaWQgdGhhdCByaXNjdl9pc2FfZXh0ZW5zaW9uX2NoZWNrKCkgd2lsbCBi
ZWNvbWUgYSByYXQgbmVzdCBzbwo+PiByYXRoZXIgdGhhbiBnb2luZyB0aGF0IHdheSwgSSB3b3Vs
ZCBiZSBpbiBmYXZvciBvZiBhZGRpbmcgYSB2YWxpZGF0aW9uCj4+IGNhbGxiYWNrIGZvciB0aGUg
ZXh0ZW5zaW9ucyBpZiBuZWVkZWQuCj4gCj4gSU9XLCBleHRlbnNpb24gY2hlY2sgc3BsaXQgb3V0
IHBlciBleHRlbnNpb24gbW92aW5nIHRvIGJlIGEgY2FsbGJhY2s/Cj4gCj4+PiBHaXZlbiB3ZSdk
IGJlIHJlbHlpbmcgb24gb3JkZXJpbmcsIHdlIGhhdmUgdG8gcGVyZm9ybSB0aGUgc2FtZSBpbXBs
aWNhdGlvbgo+Pj4gZm9yIGJvdGggRiBhbmQgQyBhbmQgbWFrZSBzdXJlIHRoYXQgdGhlICJpbXBs
aWVzIiBzdHJ1Y3QgaGFzIFpjYSBiZWZvcmUgWmNmLgo+Pj4gSSBkb24ndCByZWFsbHkgbGlrZSB0
aGF0IHN1Z2dlc3Rpb24sIGhvcGVmdWxseSB0aGVyZSdzIGEgbmljZXIgd2F5IG9mIGRvaW5nCj4+
PiB0aGF0LCBidXQgSSBkb24ndCBsaWtlIHRoZSBkdCBzdHVmZiBoZXJlLgo+Pgo+PiBJIGd1ZXNz
IHRoZSAiY2xlYW5lc3QiIHdheSB3b3VsZCBiZSB0byBoYXZlIHNvbWUgImRlZmVyZWQtbGlrZSIK
Pj4gbWVjaGFuaXNtIGluIElTQSBwcm9iaW5nIHdoaWNoIHdvdWxkIGFsbG93IHRvIGhhbmRsZSBv
cmRlcmluZyBhcyB3ZWxsIGFzCj4+IGRlcGVuZGVuY2llcy9pbXBsaWVzIGZvciBleHRlbnNpb25z
LiBGb3IgWmNhLCBaY2YsIHdlIGFjdHVhbGx5IGRvIG5vdAo+PiBoYXZlIG9yZGVyaW5nIHByb2Js
ZW1zIGJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGEgYml0IGJyb2tlbiBub3QgdG8KPj4gc3VwcG9y
dCB0aGF0IGFzIHdlbGwuCj4gCj4gV2UgY291bGQsIEkgc3VwcG9zZSwgZW5hYmxlIGFsbCBkZXRl
Y3RlZCBleHRlbnNpb25zIG9uIGEgQ1BVIGFuZCBydW4gdGhlCj4gYWZvcmVtZW50aW9uIGNhbGxi
YWNrLCBkaXNhYmxpbmcgdGhlbSBpZiBjb25kaXRpb25zIGFyZSBub3QgbWV0Pwo+IAo+IElzIHRo
YXQgc29tZXRoaW5nIGxpa2Ugd2hhdCB5b3UncmUgc3VnZ2VzdGluZz8KClllcCwgZXhhY3RseS4g
Rmlyc3QgcGFyc2UgdGhlIElTQSBibGluZGx5IGluIGEgYml0bWFwLCAoZWl0aGVyIGZyb20Kcmlz
Y3YsaXNhIHN0cmluZywgcmlzY3YsaXNhLWV4dGVuc2lvbnMsIG9yIEFDUEkpLiBUaGVuIGluIGEg
c2Vjb25kIHRpbWUsCnZlcmlmeSB0aGUgSVNBIGV4dGVuc2lvbnMgYnkgdmFsaWRhdGluZyBleHRl
bnNpb24gYW5kIGxvb3BpbmcgdW50aWwgd2UKcmVhY2ggYSBzdGFibGUgc2V0LgoKQ2zDqW1lbnQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
