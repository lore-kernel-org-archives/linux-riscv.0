Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78952C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT5b022irMAFOvk/pJD9nTDo7I2O7RxGD20STA0kD6A=; b=t/uvBhLBK5EdjR
	ceChKW+u17za7xYYg02jio8I/9O8Vf0WHSn92hr3/uFDTVPV74oCyPpYk9VPLAiV1tLo0XfNcbzCX
	VIGZAaZ10V0K/iPZlR8uU7Gm914q9YAOcoMoaERyiXHaKSUkGgiq5KUvN8fVaKcX0+wycT2cMmsxh
	IAX4xQ2cLjep4j2DwN255//yprm/3nB7mz2fVKBiQ30M8akKJ331RZZDE2eqJVV+413wCcJwB5mhy
	OYkPonV2JJ87gZFcsStpDkEAFpnxtWOV2hxh3ob7H/Q03Vrrm55cbTpQhdEby7gNL4hV0Xu8WRM+/
	J3Wp4VZ/1VZCMBr1rH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rni8e-000000082D9-1HIx;
	Fri, 22 Mar 2024 16:53:04 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rni8b-0000000829i-04PO
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 16:53:03 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-60a068e26d8so26378797b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711126377; x=1711731177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y51uEGJ03D6pw21uRms6OLbBjZsNY8YSRn9RWNKVb+8=;
        b=yjV6SXYeTTOylSK3psEaB4uIDeTMfcyq5vEhhDIboaeJ+wp43+QLhMcaofrN0bS1GB
         /aaNhr7Jb33flg0tL2WuHFE4Y1nae9/BktSWUGDM19JPAo3mVArf0zVopldWLpCRILZi
         t7HVXVZGzbG8Sd+1Ce4o4ar2ZgIS/AMbQmrnZlf/nE7oa2mA5N0kVHdC4fEQfSt9jTR3
         IrO960Gfi+P1COekoC+HVx99V+JE65PFOKOyILVVVtU9fpBxpFogRgNUjcQUrxD07g+A
         xuZ6K7fEdTyVZrsYUmK8ND0aFBq14rw1V7gjZCi6xJMZC9ZSxMd7u+W/TVBOnFUahTNb
         gErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711126377; x=1711731177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y51uEGJ03D6pw21uRms6OLbBjZsNY8YSRn9RWNKVb+8=;
        b=DyPPe7L0DyyVSUy+22C+fyB2tv7Pwf2guKsPM9nCK7rXzGpVyaYZCAkq/wAv2IKL5y
         wQiCWENCqzpWcOAVG6uDOpCpa22W2Z8smD5TrtJaa18Cj+9m+ddVoTd1e6UhBc6FG+K2
         yRN/SaiRBtJcvaAfY/dGPFEvp7Jiku7c3s1cyxwqkWzCznGYPZZdsZcYeAUyEwH7tF3K
         64AcOv9PLcprik/TE4sqi4ZUsJfB8Y9iKtmq/YGe2impJTSWTect0dtM7xb9ptGyGZSl
         h18pkSPYtvGrAQpTso+isNbe1ObBQ5CqoD4uR6CYhoX6BeLKCbu9YrkkcyvLI+M3dH/2
         oQgw==
X-Forwarded-Encrypted: i=1; AJvYcCVDZ1NenVOmvq28yukgjfUpB1NbgjdNdnAn4+Ujdwdw1SZedFY9a9iIv02YA1IPnZlMKYSVY4IUD7+SdERqsGMqZKXS3MxIS2tFW8KyKeOu
X-Gm-Message-State: AOJu0YzzRH8zgFngb6BS8Z/FpiwWgvbK+K2AwXuQVjV3QURHSW8CS2aZ
	KTsOTwEIRhplBc/Q3KY0VqnS7fWCuY66pc4SUaaf20aTQh9i7ZLmiF4oOcrrHVyjOZEICGLRX3d
	SpFoEKsCU3qDSSI1Hv7gcWQdLWf8JaBjryt3coQ==
X-Google-Smtp-Source: AGHT+IEpg7MCg3bZ38eIAspdWgzOjXUKRaxb3wbMQl77qTIMFr7IGfaPlazJNe4j1FElxowopIqWuHH20jjSqY11dPk=
X-Received: by 2002:a81:710a:0:b0:60f:d6fc:74f3 with SMTP id
 m10-20020a81710a000000b0060fd6fc74f3mr228823ywc.7.1711126377529; Fri, 22 Mar
 2024 09:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com> <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com> <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
 <20240322-3c32873c4021477383a15f7d@orel>
In-Reply-To: <20240322-3c32873c4021477383a15f7d@orel>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 22 Mar 2024 09:52:48 -0700
Message-ID: <CAKC1njTGSMPekhvyRW0gz6+mY2S_==voCcspoLAyp38X-BcWcw@mail.gmail.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	tech-j-ext@lists.risc-v.org, Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_095301_389104_E8FD95C5 
X-CRM114-Status: GOOD (  30.93  )
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

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgMTowOeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMDk6Mzk6
NTJQTSAtMDcwMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+IC4uLgo+ID4gSSBhbSBub3Qgc3VyZSBv
ZiB0aGUgcHJhY3RpY2FsaXR5IG9mIHRoaXMgaGV0ZXJvZ2VuZWl0eSBmb3IgWmljYm96IGFuZAo+
ID4gZm9yIHRoYXQgbWF0dGVyIGFueSBvZiB0aGUgdXBjb21pbmcKPiA+IGZlYXR1cmVzIHRoYXQn
bGwgYmUgZW5hYmxlZCB2aWEgc2VudmNmZyAoY29udHJvbCBmbG93IGludGVncml0eSwKPiA+IHBv
aW50ZXIgbWFza2luZywgZXRjKS4KPiA+Cj4gPiBBcyBhbiBleGFtcGxlIGlmIGNhY2hlIHplcm9p
bmcgaW5zdHJ1Y3Rpb25zIGFyZSB1c2VkIGJ5IGFwcCBiaW5hcnksIEkKPiA+IGV4cGVjdCBpdCB0
byBiZSB1c2VkIGluIGZvbGxvd2luZwo+ID4gbWFubmVyCj4gPgo+ID4gIC0gRXhwbGljaXRseSBp
bnNlcnRpbmcgY2JvLnplcm8gYnkgYXBwbGljYXRpb24gZGV2ZWxvcGVyCj4gPiAgLSBTb21lIGNv
bXBpbGVyIGZsYWcgd2hpY2ggZW5zdXJlcyB0aGF0IHN0cnVjdHVyZXMgbGFyZ2VyIHRoYW4gY2Fj
aGUKPiA+IGxpbmUgZ2V0cyB6ZXJvZWQgYnkgY2JvLnplcm8KPiA+Cj4gPiBJbiBlaXRoZXIgb2Yg
dGhlIGNhc2VzLCB0aGUgZGV2ZWxvcGVyIGlzIG5vdCBleHBlY3RpbmcgdG8gdGFyZ2V0IGl0IHRv
Cj4gPiBhIHNwZWNpZmljIGhhcnQgb24gU29DIGFuZCBpbnN0ZWFkIGV4cGVjdCBpdCB0byB3b3Jr
Lgo+ID4gVGhlcmUgbWlnaHQgYmUgbGlicmFyaWVzIChpbnN0YWxsZWQgdmlhIHN1ZG8gYXB0IGdl
dCkgd2l0aCBjYWNoZSB6ZXJvCj4gPiBzdXBwb3J0IGluIHRoZW0gd2hpY2ggbWF5IHJ1biBpbiBk
aWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMuCj4gPiBTaG91bGQgdGhlIGxpYnJhcnkgYmUgYXdhcmUg
b2YgdGhlIENQVSBvbiB3aGljaCBpdCdzIHJ1bm5pbmcuIE5vdwo+ID4gd2hvZXZlciBpcyBydW5u
aW5nIHRoZXNlIGJpbmFyaWVzIHNob3VsZCBiZSBhd2FyZSB3aGljaCBDUFVzCj4gPiB0aGV5IGdl
dCBhc3NpZ25lZCB0byBpbiBvcmRlciB0byBhdm9pZCBmYXVsdHM/Cj4gPgo+ID4gVGhhdCBzZWVt
cyBleGNlc3NpdmUsIGRvZXNuJ3QgaXQ/Cj4gPgo+Cj4gSXQgbWlnaHQgYmUgc2FmZSB0byBhc3N1
bWUgZXh0ZW5zaW9ucyBsaWtlIFppY2JveiB3aWxsIGJlIG9uIGFsbCBoYXJ0cyBpZgo+IGFueSwg
YnV0IEkgd291bGRuJ3QgZXhwZWN0IGFsbCBleHRlbnNpb25zIGluIHRoZSBmdXR1cmUgdG8gYmUg
cHJlc2VudCBvbgo+IGFsbCBhdmFpbGFibGUgaGFydHMuIEZvciBleGFtcGxlLCBzb21lIEFybSBi
aWcuTElUVExFIGJvYXJkcyBvbmx5IGhhdmUKPiB2aXJ0IGV4dGVuc2lvbnMgb24gYmlnIENQVXMu
IFdoZW4gYSBWTU0gd2FudHMgdG8gbGF1bmNoIGEgZ3Vlc3QgaXQgbXVzdAo+IGJlIGF3YXJlIG9m
IHdoaWNoIENQVXMgaXQgd2lsbCB1c2UgZm9yIHRoZSBWQ1BVIHRocmVhZHMuIEZvciByaXNjdiwg
d2UKPiBoYXZlIHRoZSB3aGljaC1jcHVzIHZhcmlhbnQgb2YgdGhlIGh3cHJvYmUgc3lzY2FsbCB0
byB0cnkgYW5kIG1ha2UgdGhpcwo+IHR5cGUgb2YgdGhpbmcgZWFzaWVyIHRvIG1hbmFnZSwgYnV0
IEkgYWdyZWUgaXQgd2lsbCBzdGlsbCBiZSBhIHBhaW4gZm9yCj4gc29mdHdhcmUgc2luY2UgaXQg
d2lsbCBuZWVkIHRvIG1ha2UgdGhhdCBxdWVyeSBhbmQgdGhlbiBzZXQgaXRzIGFmZmluaXR5LAo+
IHdoaWNoIGlzIHNvbWV0aGluZyBpdCBoYXNuJ3QgbmVlZGVkIHRvIGRvIGJlZm9yZS4KPgoKU3Vy
ZSwgdGhlIGZ1dHVyZSBtYXkgYmUgYSB3b3JsZCB3aGVyZSBoZXRlcm9nZW5lb3VzIElTQSBpcyBh
IHRoaW5nLiBCdXQKdGhhdCdzIG5vdCB0aGUgcHJlc2VudC4gTGV0J3Mgbm90IHRyeSB0byBidWls
ZCBmb3Igc29tZXRoaW5nIHdoaWNoCmRvZXNuJ3QgZXhpc3QuCkl0IGhhcyBiZWVuIChoZXRlcm9n
ZW5lb3VzIElTQSkgdHJpZWQgZWFybGllciBtYW55IHRpbWVzIGFuZCBtb3N0bHkgaGF2ZQpmYWxs
ZW4gZmxhdCAocmVtZW1iZXIgb24gSW50ZWwgYWxkZXIgbGFrZSwgSW50ZWwgaGFkIHRvIHNoaXAg
YSB1Y29kZSBwYXRjaCB0bwpkaXNhYmxlIEFWWDUxMiBleGFjdGx5IGZvciBzYW1lIHJlYXNvbikK
aHR0cHM6Ly93d3cuYW5hbmR0ZWNoLmNvbS9zaG93LzE3MDQ3L3RoZS1pbnRlbC0xMnRoLWdlbi1j
b3JlLWk5MTI5MDBrLXJldmlldy1oeWJyaWQtcGVyZm9ybWFuY2UtYnJpbmdzLWh5YnJpZC1jb21w
bGV4aXR5LzIKCkFzIGFuZCB3aGVuIElTQSBmZWF0dXJlcyBnZXQgZW5hYmxlZCwgdGhleSBnZXQg
Y29tcGlsZWQgaW50byBsaWJyYXJpZXMvYmluYXJpZXMKYW5kIGVuZCB1c2VyIG1hbnkgdGltZXMg
dXNlIHRoaW5ncyBsaWtlIGB0YXNrc2V0YCB0byBzZXQgYWZmaW5pdHkKd2l0aG91dCBldmVuIHJl
YWxpemluZwp0aGVyZSBpcyBzb21lIHdlaXJkbmVzcyBnb2luZyBvbiB1bmRlciB0aGUgaG9vZC4g
Rm9yIG1ham9yaXR5IG9mIHVzZQpjYXNlcyAtLSBoZXRlcm9nZW5lb3VzCklTQSBkb2Vzbid0IG1h
a2Ugc2Vuc2UuIFN1cmUgaWYgc29tZW9uZSBpcyB3aWxsaW5nIHRvIGJ1aWxkIGEgY3VzdG9tClNv
QyB3aXRoIGhldGVyb2dlbmVvdXMKSVNBIGZvciB0aGVpciBzdHJpY3QgdXNlY2FzZSwgdGhleSBj
b250cm9sIHRoZWlyIHNvZnR3YXJlIGFuZCBoYXJkd2FyZQphbmQgdGh1cyB0aGV5IGNhbiBkbyB0
aGF0LgpCdXQgbGl0dGVyaW5nIGxpbnV4IGtlcm5lbCB0byBzdXBwb3J0IHdpZXJkIHVzZWNhc2Vz
IGFuZCBwdXR0aW5nIGEKYnVyZGVuIG9mIHRoYXQgb24gbWFqb3JpdHkgb2YKdXNlY2FzZXMgYW5k
IHNvZnR3YXJlIGlzIG5vdCB3aXNlLgoKSWYgc29tZXRoaW5nIGxpa2UgdGhpcyBoYXMgdG8gYmUg
ZG9uZSwgSSBleHBlY3QgZmlyc3QgdGhhdCBpdCBkb2Vzbid0CmZvcmNlIGVuZCB1c2VycyB0byBs
ZWFybgphYm91dCBJU0EgZGlmZmVyZW5jZXMgYmV0d2VlbiBoYXJ0cyBvbiB0aGVpciBzeXN0ZW0g
YW5kIHRoZW4gZmlndXJlCm91dCB3aGljaCBpbnN0YWxsZWQKcGFja2FnZXMgaGF2ZSB3aGljaCBJ
U0EgZmVhdHVyZXMgY29tcGlsZWQgaW4uIFRoaXMgaXMgbGlrZSB3YWxraW5nIG9uCmVnZ3NoZWxs
cyBmcm9tIHRoZSBlbmQKdXNlciBwZXJzcGVjdGl2ZS4gU3VyZSwgZW5kIHVzZXIgY2FuIGJlIGV4
dHJlbWVseSBpbnRlbGxpZ2VudCAvIHNtYXJ0CmFuZCBmaWd1cmUgaXQgYWxsIG91dCBidXQKdGhh
dCBwb3B1bGF0aW9uIGlzIHJhcmUgYW5kIHRoYXQgcmFyZSBwb3B1bGF0aW9uIGNhbiBkZXZlbG9w
IHRoZWlyCmN1c3RvbSBrZXJuZWwgYW5kIGxpYmMKcGF0Y2hlcyB0byBkbyBzb21ldGhpbmcgbGlr
ZSB0aGlzLgoKVGhpcyBpcyBhIGdvb2Qgc2NpZW5jZSBwcm9qZWN0IHRvIHN1cHBvcnQgaGV0ZXJv
Z2VuZW91cyBJU0EgYnV0CnByYWN0aWNhbGx5IG5vdCB2aWFibGUgdW5sZXNzCnRoZXJlIGlzIGEg
aGlnaCBsZXZlbCBlbmQgdXNlciB1c2UgY2FzZS4KCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
