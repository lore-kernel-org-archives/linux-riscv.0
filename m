Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BBDCD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 19:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwR7zBiDzv+1j5qH5Mcu26z4KL5rmtVTMjGEZdVRzB8=; b=RFO8jzfvgbGTRdjw5momk8zyDm
	tnH2kvSWSl903TWUAoHRIO1w+lUwyxxtIrbdd+69KakvtabgUFqjc5S0K6lT9oxtoC1+j5SMAUFZY
	HVE+mPDOIJOYy5iZOpFG07Q+or9nylhpnT++XEFzWEZu3wY2t80Sc+9OHkDbmyKixunRMQRx/0jos
	VSOLtPPuHBRnogSeLxjz3T2BBVKCc18BIlKX76xjmOoOeLYpa4uZBEqK1Ya4Vo4pe8Y5PbL1MoTJW
	Aj7/9t/wDQzFttlUNXv9niKinxONYQf7UGTPWeFqOWaLLzO1MAkPb3sksHikRIBcAA5ixoduiZP5D
	vHJdLifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvW6-0000000FOqs-0Ywk;
	Thu, 28 Mar 2024 19:34:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvW1-0000000FOgq-1GDp
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 19:34:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0b213efa3so12435485ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711654446; x=1712259246; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFkewoBSuuA+NyCvB5QMwy0Z4HM+U6hdKrpuaoxhXDE=;
        b=WebkLYWAnBUgYQoT2eqbmER0c+th+O23CmpBVvHZqJJi8WGgT2hM5+RjuxG9t6Hcs+
         EiDzOOl/Y3fPxkgPyjAZXTOTzJnyo+4BHSIRoJD5ved8NyR3xOuZmD93qHNjkNXHZSWx
         xtMko6mlXaGrQxi+/2HeI7UOJooqQhn96qmg98OR2rDg2YZd1Az9Pv9cOhKvSFg50G2h
         d24gx3QzoqJ6QXpKFz+R3hweJz0pxDYTwv3G3PeTKUkeD8YuKGx8/hYuLRxNh4DIQtzM
         fHvC4j5JrxAmhd+hDb4oI+tRjZpZTbyNqRZGL1JDKD2qt8KYwuPSECIlExONbHehPENn
         1zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654446; x=1712259246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFkewoBSuuA+NyCvB5QMwy0Z4HM+U6hdKrpuaoxhXDE=;
        b=c4A6p2yAVZj98D8txdifeGkCdrQ7nI9Vn0lwGgyz5unurV179aUqAIzwMCeOdefwmx
         M9i9HsNCfoSPApp0v2clCbc0R1QXWNegTDwrOnkqmXZgVhZS1Frq+i3KQKGKRPyrFftt
         uWrm90Smj6B5fv93a4axAwmE8G4KfSILlrq0CKRRFRt4AnvIGotxiCrF1f8kIJtnxMAr
         739qZX2KcGM0F2A88NHBa8xa1oeQPBy1xjIWjXvfCZCHGSexzvJMo0NmBHCaUuD1UE9G
         okj35NO59Jl6Dw3MNMn6x4XNd/py+TJWX0FRBYr2I8MRSDYcXSok+kwszs9QJX6W2vUt
         P2jA==
X-Forwarded-Encrypted: i=1; AJvYcCWV9pPJbsjbw2NtCHRr/1gcjyNAP7o1DOVUwqpV3eRKL1LvHDep9UjfmcfmQPhuXNVq0aHhNjV/CAMIUXEg/xN19enJN8RIH3wgmhUKJXkU
X-Gm-Message-State: AOJu0Ywsdj5Id+95J1grScAdoRd3bHcwhAHKOks7ctgjIDRHP+f6BKZB
	ylYwMXhO9p9kFD98OL721IBcXGo62zE+67owi/2IFOWWpwQ1rxqwnuI2bUiBBGo=
X-Google-Smtp-Source: AGHT+IHmXFP8K6LroTZXQuV0pdXoRjq0VtE44n+b5oHqeJDoRGPeWBgHtYgVGum7hQezukzxvp3Wiw==
X-Received: by 2002:a17:902:a388:b0:1dd:b3ef:4528 with SMTP id x8-20020a170902a38800b001ddb3ef4528mr429956pla.52.1711654446258;
        Thu, 28 Mar 2024 12:34:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b001e0b76bcfa5sm1995555plg.54.2024.03.28.12.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:34:05 -0700 (PDT)
Date: Thu, 28 Mar 2024 12:34:03 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Message-ID: <ZgXGKxp0KAQI/+NC@debug.ba.rivosinc.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
 <17C0CB122DBB0EAE.6770@lists.riscv.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17C0CB122DBB0EAE.6770@lists.riscv.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_123421_685288_2F7F0F88 
X-CRM114-Status: GOOD (  15.84  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMDY6NTg6NDVQTSAtMDcwMCwgRGVlcGFrIEd1cHRhIHZp
YSBsaXN0cy5yaXNjdi5vcmcgd3JvdGU6Cj5PbiBUdWUsIE1hciAxOSwgMjAyNCBhdCA3OjIx4oCv
UE0gU2FtdWVsIEhvbGxhbmQKPjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4K
Pj4gPiAgICAgICAgIGVsc2UKPj4gPiAgICAgICAgICAgICAgICAgcmVncy0+c3RhdHVzIHw9IFNS
X1VYTF82NDsKPj4gPiAgI2VuZGlmCj4+ID4gKyAgICAgICBjdXJyZW50LT50aHJlYWRfaW5mby5l
bnZjZmcgPSBFTlZDRkdfQkFTRTsKPj4gPiAgfQo+PiA+Cj4+ID4gQW5kIGluc3RlYWQgb2YgY29u
dGV4dCBzd2l0Y2hpbmcgaW4gYF9zd2l0Y2hfdG9gLAo+PiA+IEluIGBlbnRyeS5TYCBwaWNrIHVw
IGBlbnZjZmdgIGZyb20gYHRocmVhZF9pbmZvYCBhbmQgd3JpdGUgaXQgaW50byBDU1IuCj4+Cj4+
IFRoZSBpbW1lZGlhdGUgcmVhc29uIGlzIHRoYXQgd3JpdGluZyBlbnZjZmcgaW4gcmV0X2Zyb21f
ZXhjZXB0aW9uKCkgYWRkcyBjeWNsZXMKPj4gdG8gZXZlcnkgSVJRIGFuZCBzeXN0ZW0gY2FsbCBl
eGl0LCBldmVuIHRob3VnaCBtb3N0IG9mIHRoZW0gd2lsbCBub3QgY2hhbmdlIHRoZQo+PiBlbnZj
ZmcgdmFsdWUuIFRoaXMgaXMgZXNwZWNpYWxseSB0aGUgY2FzZSB3aGVuIHJldHVybmluZyBmcm9t
IGFuIElSUS9leGNlcHRpb24KPj4gYmFjayB0byBTLW1vZGUsIHNpbmNlIGVudmNmZyBoYXMgemVy
byBlZmZlY3QgdGhlcmUuCj4+Cj4KPkEgcXVpY2sgb2JzZXJ2YXRpb246Cj5TbyBJIHRyaWVkIHRo
aXMgb24gbXkgc2V0dXAuIFdoZW4gSSBwdXQgYHNlbnZjZmdgIHdyaXRlcyBpbgo+YF9fc3dpdGNo
X3RvIGAgcGF0aCwgcWVtdSBzdWRkZW5seQo+anVzdCB0YW5rcyBhbmQgdGFrZXMgYSBsb3Qgb2Yg
dGltZSB0byBib290IHVwIGFzIG9wcG9zZWQgdG8gd2hlbgo+YHNlbnZjZmdgIHdhcyBpbiB0cmFw
IHJldHVybiBwYXRoLgo+SW4gbXkgY2FzZSBlbnRpcmUgdXNlcnNwYWNlIChhbGwgcHJvY2Vzc2Vz
KSBoYXZlIGNmaSBlbmFibGVkIGZvciB0aGVtCj52aWEgYHNlbnZjZmdgIGFuZCBpdCBnZXRzCj5j
b250ZXh0IHN3aXRjaGVkLiBOb3Qgc3VyZSBpdCdzIHNwZWNpZmljIHRvIG15IHNldHVwLiBJIGRv
bid0IHRoaW5rIGl0Cj5zaG91bGQgYmUgYW4gaXNzdWUgb24gYWN0dWFsCj5oYXJkd2FyZS4KPgo+
U3RpbGwgZGVidWdnaW5nIHdoeSBpdCBzbG93cyBkb3duIG15IHFlbXUgZHJhc3RpY2FsbHkgd2hl
biBzYW1lIHdyaXRlcwo+dG8gc2FtZSBDU1IKPmFyZSBtb3ZlZCBmcm9tIGByZXRfZnJvbV9leGNl
cHRpb25gIHRvIGBzd2l0Y2hfdG9gCgpOZXZlcm1pbmQgYW5kIHNvcnJ5IGZvciB0aGUgYm90aGVy
LiBBbiBpc3N1ZSBvbiBteSBzZXR1cC4KCj4KPgo+LT0tPS09LT0tPS09LT0tPS09LT0tPS0KPkxp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+Vmlldy9S
ZXBseSBPbmxpbmUgKCM2ODApOiBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtai1leHQv
bWVzc2FnZS82ODAKPk11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvbXQv
MTA1MDMzOTE0LzczMDA5NTIKPkdyb3VwIE93bmVyOiB0ZWNoLWotZXh0K293bmVyQGxpc3RzLnJp
c2N2Lm9yZwo+VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1qLWV4
dC91bnN1YiBbZGVidWdAcml2b3NpbmMuY29tXQo+LT0tPS09LT0tPS09LT0tPS09LT0tPS0KPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
