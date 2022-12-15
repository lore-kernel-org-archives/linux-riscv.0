Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C69AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPJJNDGMs/wx+XsDXHOrxUfsflWMSsRzO3waWYC90DU=; b=H8TVtNnuc7YWPS
	UI4YWEKPpyxrk2YuJBljw1vzk1DILekLa5HLOS3XptobbWHnvGXk82NfDcgZSXQoG34hymwUqZFLO
	pM5L8r1mZqbGEPFU345qLAb/XLUn0vKsuOljP84yqkD/mVqqdx403x0uY/gAG+uycC5dDXDVxxtMP
	3pLX99rHo/PGo6qVqoO3QakJEBVHP0JLbiM1xEjaM8BuLNFrKFPYdeKtBiCw+a89EYl+wOl3e5Weu
	AxiGlTRlTMiQaCOXCWfV6RJeOrUk60GJlP9D/Ty1xsSQrkSVqz3anD10S7MaXAYl0GLtLLRfRxz96
	iiYezLIFjnpQZFuI2t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5qFG-00A51h-56; Thu, 15 Dec 2022 15:34:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5qFD-00A50n-PI
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 15:34:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id a9so7228924pld.7
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 07:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oy98eREJ/U08Ijl7nb4a4sr3FJDv3ahMiFs+yTIRwyI=;
        b=Mf9dxrCd6+/PMgzE3s7B4l27HdANlE/bJp9sooJz4AdKA8nSHD+uztdexBXL7UWrOP
         a65Y5iU74zojj+edTgqcepO93YEw6AYVGKASOlABYPZ4bV56LMiJQ/NKqb6uMtYEwX/v
         7+kLDjCPMG3RKAcr9JEh2tKPhjGEQXFnQZiijc8sViu6E+yoIUs79b0x9GB76jYdz8Mn
         1tKRYtDm9CG9i0or+S73JGLR+XhZLbOHhwIiuBXQqG2WXC5r8KnbEdmmKp9ZZ7yiPIJp
         CNLm5kHPKJFdaQDHylQrCzHfm9oqFWYRu8wwwAOiKgbfiUVbOMNQB21i61+kKqrjckFY
         6zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy98eREJ/U08Ijl7nb4a4sr3FJDv3ahMiFs+yTIRwyI=;
        b=iRWTPYdiFd2eRkpSTDywdTsWomOUNWzflmkYfzWvjhDrHGf8dmUrAxbTnKlEbq3niM
         gMC3CvPkc4J0Ufb6eF2VsazysI0hwW3HZHCkLrZrUQny5EnmA1uPggLv5jtt7eheyoRd
         K1Lki47HBc+0bhYG5FeSlDUA2hMbPp509h0PUvFRZVZ+Ux8Hi89bdlTYXxIeuOREN+dK
         q7hFs1Xq7e9isVRVZ2nqS2tACr9c9ka3adyzDFKGpSd+ctwNMmkMo6fNYV/67/mF9rEH
         CRP76aj87tiBsL2ZYyARAlp7h1/mTv64EqxDFWFiaasCMz//rXEoYKW9E8vShvIb7OEO
         o/gg==
X-Gm-Message-State: ANoB5pnOqYjhaFCBfMeC5L87PX/vxp7nZcrpUzAgDEkHDFws7dPe48Zq
	CzbUxRMioLB8eg3O0GZSXwbDng==
X-Google-Smtp-Source: AA0mqf5KODDCvZ+aTJxkTD/kZbAZbzu4afb2pnxx0S6C9GpDTpjhZd7JDbhoGi6S29YagehPHmPedw==
X-Received: by 2002:a05:6a20:4925:b0:ac:6543:d65d with SMTP id ft37-20020a056a20492500b000ac6543d65dmr34962768pzb.24.1671118437319;
        Thu, 15 Dec 2022 07:33:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4? ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
        by smtp.gmail.com with ESMTPSA id p15-20020a654bcf000000b00478fd9bb6c7sm1714007pgr.75.2022.12.15.07.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 07:33:56 -0800 (PST)
Message-ID: <24a1a812-95a9-ed97-abd1-c0ff259726d2@linaro.org>
Date: Thu, 15 Dec 2022 07:33:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: Darius Rad <darius@bluespec.com>, Vineet Gupta <vineetg@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Waterman <andrew@sifive.com>,
 stillson@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 anup@brainfault.org, atishp@atishpatra.org, guoren@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 libc-alpha@sourceware.org, christoph.muellner@vrull.eu,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
 <Y5irn63DQkwumfvW@bruce.bluespec.com>
 <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
 <Y5qByfCtpV0uNID3@bruce.bluespec.com>
 <877cysx4yf.fsf@all.your.base.are.belong.to.us>
 <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_073359_873201_D3E376E3 
X-CRM114-Status: GOOD (  16.33  )
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

T24gMTIvMTUvMjIgMDQ6MjgsIEZsb3JpYW4gV2VpbWVyIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+
ICogQmrDtnJuIFTDtnBlbDoKPiAKPj4+IEZvciBTVkUsIGl0IGlzIGluIGZhY3QgZGlzYWJsZWQg
YnkgZGVmYXVsdCBpbiB0aGUga2VybmVsLiAgV2hlbiBhIHRocmVhZAo+Pj4gZXhlY3V0ZXMgdGhl
IGZpcnN0IFNWRSBpbnN0cnVjdGlvbiwgaXQgd2lsbCBjYXVzZSBhbiBleGNlcHRpb24sIHRoZSBr
ZXJuZWwKPj4+IHdpbGwgYWxsb2NhdGUgbWVtb3J5IGZvciBTVkUgc3RhdGUgYW5kIGVuYWJsZSBU
SUZfU1ZFLiAgRnVydGhlciB1c2Ugb2YgU1ZFCj4+PiBpbnN0cnVjdGlvbnMgd2lsbCBwcm9jZWVk
IHdpdGhvdXQgZXhjZXB0aW9ucy4gIEFsdGhvdWdoIFNWRSBpcyBkaXNhYmxlZCBieQo+Pj4gZGVm
YXVsdCwgaXQgaXMgZW5hYmxlZCBhdXRvbWF0aWNhbGx5LiAgU2luY2UgdGhpcyBpcyBkb25lIGF1
dG9tYXRpY2FsbHkKPj4+IGR1cmluZyBhbiBleGNlcHRpb24gaGFuZGxlciwgdGhlcmUgaXMgbm8g
b3Bwb3J0dW5pdHkgZm9yIG1lbW9yeSBhbGxvY2F0aW9uCj4+PiBlcnJvcnMgdG8gYmUgcmVwb3J0
ZWQsIGFzIHRoZXJlIGFyZSBpbiB0aGUgQU1YIGNhc2UuCj4+Cj4+IEdsaWJjIGhhcyBhbiBTVkUg
b3B0aW1pemVkIG1lbWNweSwgcmlnaHQ/IERvZXNuJ3QgdGhhdCBtZWFuIHRoYXQgcHJldHR5Cj4+
IG11Y2ggYWxsIHByb2Nlc3NlcyBvbiBhbiBTVkUgY2FwYWJsZSBzeXN0ZW0gd2lsbCBlbmFibGUg
U1ZFIChsYXppbHkpPyBJZgo+PiBzbywgdGhhdCdzIGNsb3NlIHRvICJlbmFibGVkIGJ5IGRlZmF1
bHQiICh1bmxlc3MgU1ZFIGlzIGRpc2FibGVkIHN5c3RlbQo+PiB3aWRlKS4KPiAKPiBZZXMsIHNl
ZSBzeXNkZXBzL2FhcmNoNjQvbXVsdGlhcmNoL21lbWNweS5jOgo+IAo+ICAgIHN0YXRpYyBpbmxp
bmUgX190eXBlb2YgKF9fcmVkaXJlY3RfbWVtY3B5KSAqCj4gICAgc2VsZWN0X21lbWNweV9pZnVu
YyAodm9pZCkKPiAgICB7Cj4gICAgICBJTklUX0FSQ0ggKCk7Cj4gICAgCj4gICAgICBpZiAoc3Zl
ICYmIEhBVkVfQUFSQ0g2NF9TVkVfQVNNKQo+ICAgICAgICB7Cj4gICAgICAgICAgaWYgKElTX0E2
NEZYIChtaWRyKSkKPiAgICAgICAgICAgIHJldHVybiBfX21lbWNweV9hNjRmeDsKPiAgICAgICAg
ICByZXR1cm4gX19tZW1jcHlfc3ZlOwo+ICAgICAgICB9Cj4gICAgCj4gICAgICBpZiAoSVNfVEhV
TkRFUlggKG1pZHIpKQo+ICAgICAgICByZXR1cm4gX19tZW1jcHlfdGh1bmRlcng7Cj4gICAgCj4g
ICAgICBpZiAoSVNfVEhVTkRFUlgyIChtaWRyKSB8fCBJU19USFVOREVSWDJQQSAobWlkcikpCj4g
ICAgICAgIHJldHVybiBfX21lbWNweV90aHVuZGVyeDI7Cj4gICAgCj4gICAgICBpZiAoSVNfRkFM
S09SIChtaWRyKSB8fCBJU19QSEVDREEgKG1pZHIpKQo+ICAgICAgICByZXR1cm4gX19tZW1jcHlf
ZmFsa29yOwo+ICAgIAo+ICAgICAgcmV0dXJuIF9fbWVtY3B5X2dlbmVyaWM7Cj4gICAgfQo+ICAg
IAo+IEFuZCB0aGUgX19tZW1jcHlfc3ZlIGltcGxlbWVudGF0aW9uIGFjdHVhbGx5IHVzZXMgU1ZF
Lgo+IAo+IElmIHRoZXJlIHdlcmUgYSBwcmN0bCB0byBzZWxlY3QgdGhlIHZlY3RvciB3aWR0aCBh
bmQgZW5hYmxlIHRoZSB2ZWN0b3IKPiBleHRlbnNpb24sIHdlJ2QgaGF2ZSB0byBwaWNrIGEgd2lk
dGggaW4gZ2xpYmMgYW55d2F5LgoKVGhlcmUgKmlzKiBhIHByY3RsIHRvIGFkanVzdCB0aGUgU1ZF
IHZlY3RvciB3aWR0aCwgYnV0IGdsaWJjIGRvZXMgbm90IG5lZWQgdG8gc2VsZWN0IApiZWNhdXNl
IFNWRSBkeW5hbWljYWxseSBhZGp1c3RzIHRvIHRoZSBjdXJyZW50bHkgZW5hYmxlZCB3aWR0aC4g
IFRoZSBrZXJuZWwgc2VsZWN0cyBhIApkZWZhdWx0IHdpZHRoIHRoYXQgZml0cyB3aXRoaW4gdGhl
IGRlZmF1bHQgc2lnbmFsIGZyYW1lIHNpemUuCgpUaGUgb3RoZXIgdGhpbmcgb2Ygbm90ZSBmb3Ig
U1ZFIGlzIHRoYXQsIHdpdGggdGhlIGRlZmF1bHQgZnVuY3Rpb24gQUJJIGFsbCBvZiB0aGUgU1ZF
IApzdGF0ZSBpcyBjYWxsLWNsb2JiZXJlZCwgd2hpY2ggYWxsb3dzIHRoZSBrZXJuZWwgdG8gZHJv
cCBpbnN0ZWFkIG9mIHNhdmUgc3RhdGUgYWNyb3NzIApzeXN0ZW0gY2FsbHMuICAoVGhlcmUgaXMg
YSBzZXBhcmF0ZSB2ZWN0b3IgZnVuY3Rpb24gY2FsbCBBQkkgd2hlbiBTVkUgdHlwZXMgYXJlIHVz
ZWQuKQoKU28gd2hpbGUgc3RyY3B5IG1heSBlbmFibGUgU1ZFIGZvciB0aGUgdGhyZWFkLCB0aGUg
bmV4dCBzeXNjYWxsIG1heSBkaXNhYmxlIGl0IGFnYWluLgoKCnJ+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
