Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3977C3ABC3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lA2aAesnS45Rb/6DF90rUnb5rl13xRHbwR8tAzX9aOQ=; b=apK8+G9YtrkiRy
	Ua7XSxodWAGrI+5UMjl+HSIzp7T+ycQ0qGXHs6JgtXKl8ZltLMyVrBR4Fp40aQ0SyN6DqxQUJ8cTS
	fZ/C5RQDHl9TgrAHtjGZxMkULIy8fZP3HcEVUm8mEDxLllpJGiid8jEDJ2SL5uKOmpvjffRBLthkh
	dFAGadSc6DDLlsUznU3VpsAxiNf9pnti2RSS2aNwDSAXvEGt0rIOQZVrikMy+JKtLzp0jOWeSOOFF
	tJma7uVReWFlru+vmD8mB/UFiinikmjU3OIcrwAA//l3j56zkLiBX411bwTf7A/nfYKpLoXi0eR81
	7mCQ0vs6IkdMsIg33q/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQFG-00000004DM9-0MqX;
	Fri, 09 May 2025 16:06:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOEQ-00000003riy-1p9U
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 13:57:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0b28d9251so315156f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746799061; x=1747403861; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89ii3tAdP6qYOru2WdH/cAWgrXsFKNVha3J9tXFOzI4=;
        b=XE++Yh9XT9vYr+V2ZRZLTgbkEbwNubfXrAEC5WqGyArOCwYEGizKU7qz/lKf5LaK4a
         9lmajnx/BmkdQl+Wx8FSRxUI6EjEpEzb/UWsdwV+p3gKQFvye+TqC4oPQYHig/e9TgyP
         ++u7d/rxhdtydwJeIFuWYivkME6Mb9+LzaZUVI93UFmXIPeNTW2wbfQk48Sb3k/qiQXM
         4FHLpH4KRWXGIB1xnOAoQVcItrfq43b3gmScsndlSesLFyW+K78ba2ev2f7RzYmEZSDD
         +wBEpOs9Qbl3cRSrI8VFtapE/kiYMIWRe/jS9XPhUHywXqgxgWlToHI3vOdapN5F87gy
         0Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746799061; x=1747403861;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89ii3tAdP6qYOru2WdH/cAWgrXsFKNVha3J9tXFOzI4=;
        b=RVoAB8s+FJTUE9rln3hAVV5OESUEvPQyaLjcEJj4w6IgdH4aflmV+tzomd/5VLc8ak
         VWWkOqEejYr4sgwXic9Lp14ppQwCEPKhX+CUuLcaNOUc728d/DTHmQLSTwTI989/RPld
         3PUj/jUbU71kPMZ1wvLQdUf+VBaEwrHQ92PlJmgoRV+tcaPqiYusk6tNPOcL/2s7jctp
         4bFZRVplx6Zuliq6S1tvTBJ81WGnah4XSWL8AJz2xiyKdZxIvfSdCD/VhcXQPdTFT4Mn
         /2sfk32NtuiPcOG6cUKwa4RK9RGuUD+7qs8ZRb+OprMMXB7HgUTgikiuMYYia0JWuATr
         +/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUBU+dKJNIkCcqytWbAZQxIEMDpa81BFVDpfqMGc7dQBiBG2igxAjQh4UCtUNIx9FBiNRyI4teYvsUiwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXGxBD+mYHGRqGFvORVqBGnWrrmXFnkXWuisCkFejHKDOLmBhH
	Nl7mEdytZjv07k+pGfD6Oh5LpswjtOUli45KaV5c8snYShvnzpzIbLHQSDuYFz4=
X-Gm-Gg: ASbGncsxvhcgY1+K8e4W/oM7AyqRdseAX2h5wFXnYwfbBvYTjX+jLBW19rcKh2C6/2i
	ZIPEHz0yW1QllEf8jc2Ci0drAWDu1c/bnLerxwNuV8u06ketl/BLamh1VUN97mE4UUZWEUBtKGo
	6Z/yJ52SFTiNbr8SF49wMnZDu2JVWLerT7Wm/cK6nmebiYd6iuKmMj8VPP72ubKDxo3Gbdb/Eq2
	G9I3azoVBvJucZ3L/V12sF+UV4SKlm6GOg/MM7Tir/L/BifU90R9tIOflJahhFTouuCurnbirIT
	pdBf9IWWhxW7Zcushas3btWdntuWOtZlRGcanUVzTJSzbptY
X-Google-Smtp-Source: AGHT+IEcAmbHJpk5CxOrqm5l+BEA2PNktNRuHCKGe+vwxNwlbx7QLnODKWUwlOC/RXddA54K8TiWJw==
X-Received: by 2002:a05:600c:8215:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-442d6c39708mr11774315e9.0.1746799060674;
        Fri, 09 May 2025 06:57:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:1f7f:4cfe:e0bb:202b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb26sm74090875e9.29.2025.05.09.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:57:40 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 09 May 2025 15:57:39 +0200
Message-Id: <D9ROL5UEYYHX.1B1FE6LZJ9ESO@ventanamicro.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
To: "Anup Patel" <anup@brainfault.org>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com>
 <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
 <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
 <20250509-0811f32c1643d3db0ad04f63@orel>
 <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>
In-Reply-To: <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065742_469949_248EDE04 
X-CRM114-Status: GOOD (  19.59  )
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

MjAyNS0wNS0wOVQxNzo1OToyOCswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCA1OjQ54oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+IE9uIEZyaSwgTWF5IDA5LCAyMDI1IGF0IDA1
OjMzOjQ5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4+ID4gT24gRnJpLCBNYXkgOSwgMjAy
NSBhdCAyOjE24oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+
IHdyb3RlOgo+PiA+ID4gMjAyNS0wNS0wOVQxMjoyNToyNCswNTozMCwgQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz46Cj4+ID4gPiA+IE9uIFRodSwgTWF5IDgsIDIwMjUgYXQgODowMeKA
r1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4g
PiA+ID4+ICAqIFByZXNlcnZlIHRoZSB1c2Vyc3BhY2UgaW5pdGlhbGl6ZWQgVkNQVSBzdGF0ZSBv
biBzYmlfaGFydF9zdGFydC4KPj4gPiA+ID4+ICAqIFJldHVybiB0byB1c2Vyc3BhY2Ugb24gc2Jp
X2hhcnRfc3RvcC4KPj4gPiA+ID4KPj4gPiA+ID4gVGhlcmUgaXMgbm8gdXNlcnNwYWNlIGludm9s
dmVtZW50IHJlcXVpcmVkIHdoZW4gYSBHdWVzdCBWQ1BVCj4+ID4gPiA+IHN0b3BzIGl0c2VsZiB1
c2luZyBTQkkgSFNNIHN0b3AoKSBjYWxsIHNvIFNUUk9ORyBOTyB0byB0aGlzIGNoYW5nZS4KPj4g
PiA+Cj4+ID4gPiBPaywgSSdsbCBkcm9wIGl0IGZyb20gdjMgLS0gaXQgY2FuIGJlIGhhbmRsZWQg
YnkgZnV0dXJlIHBhdGNoZXMgdGhhdAo+PiA+ID4gdHJhcCBTQkkgY2FsbHMgdG8gdXNlcnNwYWNl
Lgo+PiA+ID4KPj4gPiA+IFRoZSBsYWNrIG9mIHVzZXJzcGFjZSBpbnZvbHZlbWVudCBpcyB0aGUg
aXNzdWUuICBLVk0gZG9lc24ndCBrbm93IHdoYXQKPj4gPiA+IHRoZSBpbml0aWFsIHN0YXRlIHNo
b3VsZCBiZS4KPj4gPgo+PiA+IFRoZSBTQkkgSFNNIHZpcnR1YWxpemF0aW9uIGRvZXMgbm90IG5l
ZWQgYW55IEtWTSB1c2Vyc3BhY2UKPj4gPiBpbnZvbHZlbWVudC4KPj4gPgo+PiA+IFdoZW4gYSBW
Q1BVIHN0b3BzIGl0c2VsZiB1c2luZyBTQkkgSFNNIHN0b3AoKSwgdGhlIEd1ZXN0IGl0c2VsZgo+
PiA+IHByb3ZpZGVzIHRoZSBlbnRyeSBhZGRyZXNzIGFuZCBhcmd1bWVudCB3aGVuIHN0YXJ0aW5n
IHRoZSBWQ1BVCj4+ID4gdXNpbmcgU0JJIEhTTSBzdGFydCgpIHdpdGhvdXQgYW55IEtWTSB1c2Vy
c3BhY2UgaW52b2x2ZW1lbnQuCj4+ID4KPj4gPiBJbiBmYWN0LCBldmVuIGF0IEd1ZXN0IGJvb3Qg
dGltZSBhbGwgbm9uLWJvb3QgVkNQVXMgYXJlIGJyb3VnaHQtdXAKPj4gPiB1c2luZyBTQkkgSFNN
IHN0YXJ0KCkgYnkgdGhlIGJvb3QgVkNQVSB3aGVyZSB0aGUgR3Vlc3QgaXRzZWxmCj4+ID4gcHJv
dmlkZXMgZW50cnkgYWRkcmVzcyBhbmQgYXJndW1lbnQgd2l0aG91dCBhbnkgS1ZNIHVzZXJzcGFj
ZQo+PiA+IGludm9sdmVtZW50Lgo+Pgo+PiBIU00gb25seSBzcGVjaWZpZXMgdGhlIHN0YXRlIG9m
IGEgZmV3IHJlZ2lzdGVycyBhbmQgdGhlIElTQSBvbmx5IGEgZmV3Cj4+IG1vcmUuIEFsbCBvdGhl
ciByZWdpc3RlcnMgaGF2ZSBJTVBERUYgcmVzZXQgdmFsdWVzLiBaZXJvcywgbGlrZSBLVk0KPj4g
c2VsZWN0cywgYXJlIGEgZ29vZCBjaG9pY2UgYW5kIHRoZSBiZXN0IGRlZmF1bHQsIGJ1dCBpZiB0
aGUgVk1NIGRpc2FncmVlcywKPj4gdGhlbiBpdCBzaG91bGQgYmUgYWxsb3dlZCB0byBzZWxlY3Qg
d2hhdCBpdCBsaWtlcywgYXMgdGhlIFZNTS91c2VyIGlzIHRoZQo+PiBwb2xpY3kgbWFrZXIgYW5k
IEtWTSBpcyAianVzdCIgdGhlIGFjY2VsZXJhdG9yLgo+Cj4gVGlsbCBub3cgdGhlcmUgYXJlIG5v
IHN1Y2ggSU1QREVGIHJlc2V0IHZhbHVlcyBleHBlY3RlZC4gV2Ugd2lsbAo+IGNyb3NzIHRoYXQg
YnJpZGdlIHdoZW4gbmVlZGVkLiBBbHRob3VnaCwgSSBkb3VidCB3ZSB3aWxsIGV2ZXIgbmVlZCBp
dC4KClRoZSBJTVBERUYgaXNzdWUgYWxyZWFkeSBleGlzdHMuICBLVk0gcmVzZXRzIHNjb3VudGVy
ZW4gdG8gNywgYnV0CnVzZXJzcGFjZSB3YW50cyBpdCB0byBiZSBkaWZmZXJlbnQsIGxpa2VseSAw
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
