Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C0EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 04:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rouTWIv+7gQ7GC+97rD4TtyiTXRg+bdrZUAB7ahyOvI=; b=TGd5GHn6sghasg
	mQnleO6y1vwEncTh0T129R77uymORKeBmSZnCMWTH4L5aCEj3f6jFjqAJJ7EXUSdFtozG37KlW2fd
	mOC9DZc5tSrH2FI1CJusEy4EffMNT9kGHSmIfoX1/GZLkaCo47GPNuWrAL4upq6x+V3TXT7Le0jaD
	JgGJjiVidNSBAcjAc9VIi9y17IixxwrDDHGpJq7uAD3qJWGxB+3FkiUFw6yf5sSE9d9E/Q4OQhd2z
	LJdtu2Lm4f48tpKPi22I8dh7Oyyu6PtLAbeF8X7ZN0rc2WoOSDH36UWuUA6g9vSjJVaP0KDd5PUnT
	b/NzGfFvtziW+JC8WPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO9UK-0066gZ-2T;
	Tue, 25 Jul 2023 04:17:32 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO9UH-0066fZ-1d
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 04:17:31 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-583f837054eso21240567b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 21:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690258648; x=1690863448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztafGsi8N/rxNWEUo6v/O5aHmGBjWLPK2kGljR5XpTE=;
        b=M1bad07Jl92/ujfNzfQxqi3obqU40n2b3+MTKbjXQCr6/qFwSSC6/V8rZEfZDz3EPt
         z8hvQXj7TBR2rE9xqs5Lx2QVB7Kc3V+3Tw/MPIb/d91R6kXoLqcmyl2akZNKkpIYDdjr
         rV47JQdjcowTrpTiYOCmx9zajmDiL4AS9Oje9aE6Pg0Y5rndTUAy0kk0g8TEfp7GYNNo
         MYcK+lDA8xNdVo1Jnt86L31lhoxwydLje1odMo6p3nbLNX8A7OVtuK4OLekbH2jwIqf9
         I9UivcLr2xit5IgrLkCy7ADza1XDtp1LN8q6AyF5AF0i6ejNmqfIbNlpV5XjWpxc3q6q
         NxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258648; x=1690863448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztafGsi8N/rxNWEUo6v/O5aHmGBjWLPK2kGljR5XpTE=;
        b=P/AFVYKePnd7SgBsLAbH+GjOs4Mu8pTwBFw5j/FOGujNUDHxcLwjZTOqRJkubw4gZl
         mxHfY3znheb7I2KZT7bEyy+/YuzFUkNj6Dsmkhhh2LEhJt6ae8G4ZiZ4Q0YGooK55/Vq
         +OKux47cyM5OIF2EGko1R6njR8HnhWuGq2UEUDQjW6tweb1HuHEqDKeXtcQZLZee1lIc
         nylmEQ1vTx3niQ8GU8mjehB25NTrpRvURHXxuJdxsNwVcizDuIGBaByhs/n8KUmiioqm
         B46eLaBPWvVikVjDtz8TB/+pwIJDEvdF701R8rF0C7bn0+Y6rOPOOVCR/Epr9bREbOOn
         QIBw==
X-Gm-Message-State: ABy/qLZ5sTSRZ/AJ231dsj+TFXOVahWAe19ZGSmYnM7TrHEzwYUfzkCK
	kazL9uCkmBM+yJrZB4EW+cQXBW/3oCcrr7pnu1iMLw==
X-Google-Smtp-Source: APBJJlG5oC6Hhob3ANtsjlzdyeu1Yx2AJY48rs8kUbnFiG17qTLw2TkJli78ibW1rQ6BIzreg+XC7/8fKPRzEVcaAIk=
X-Received: by 2002:a0d:ef42:0:b0:583:9018:29ec with SMTP id
 y63-20020a0def42000000b00583901829ecmr10154845ywe.32.1690258647756; Mon, 24
 Jul 2023 21:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230724142033.306538-1-mchitale@ventanamicro.com> <20230724-scrap-pranker-7fd120078136@spud>
In-Reply-To: <20230724-scrap-pranker-7fd120078136@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 09:47:14 +0530
Message-ID: <CAK9=C2XXnQWqJgES2iWjatG9SFeFEUXZzLXz1gTYQ0aAh=7KJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Risc-V Kvm Smstateen
To: Conor Dooley <conor@kernel.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_211729_575780_BE47312C 
X-CRM114-Status: GOOD (  16.95  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMTA6MDjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IE1heXVyZXNoLAo+Cj4gT24gTW9uLCBKdWwgMjQsIDIw
MjMgYXQgMDc6NTA6MjZQTSArMDUzMCwgTWF5dXJlc2ggQ2hpdGFsZSB3cm90ZToKPiA+IFRoaXMg
c2VyaWVzIGFkZHMgc3VwcG9ydCB0byBkZXRlY3QgdGhlIFNtc3RhdGVlbiBleHRlbnNpb24gZm9y
IGJvdGgsIHRoZQo+ID4gaG9zdCBhbmQgdGhlIGd1ZXN0IHZjcHUuIEl0IGFsc28gYWRkcyBzZW52
Y2ZnIGFuZCBzc3RhdGVlbjAgdG8gdGhlIE9ORV9SRUcKPiA+IGludGVyZmFjZSBhbmQgdGhlIHZj
cHUgY29udGV4dCBzYXZlL3Jlc3RvcmUuCj4KPiBUaGVyZSdzIG5vdCByZWFsbHkgYW4gZXhwbGFu
YXRpb24gaW4gdGhpcyBzZXJpZXMgb2Ygd2hlcmUgU21zdGF0ZWVuIGlzCj4gbmVlZGVkLCBvciB3
aHkgaXQgaXMgb25seSBpbXBsZW1lbnRlZCBmb3IgS1ZNLiBUaGUgc3BlYyBtZW50aW9ucyB0aGF0
IHRoaXMKPiBhbHNvIGFwcGxpZXMgdG8gc2VwYXJhdGUgdXNlciB0aHJlYWRzLCBhcyB3ZWxsIGFz
IHRvIGd1ZXN0cyBydW5uaW5nIGluIGEKPiBoeXBlcnZpc29yLiBBcyB5b3VyIGZpcnN0IHBhdGNo
IHdpbGwgbGVhZCB0byBzbXN0YXRlZW4gYmVpbmcgc2V0IGluCj4gL3Byb2MvY3B1aW5mbywgaXQg
Y291bGQgcmVhc29uYWJseSBiZSBhc3N1bWVkIHRoYXQgdGhlIGtlcm5lbCBpdHNlbGYKPiBzdXBw
b3J0cyB0aGUgZXh0ZW5zaW9uLiBXaHkgZG9lcyBvbmx5IEtWTSwgYW5kIG5vdCB0aGUga2VybmVs
LCByZXF1aXJlCj4gc3VwcG9ydCBmb3Igc21zdGF0ZWVuPwoKSGVyZSdzIHRoZSBtb3RpdmF0aW9u
IGJlaGluZCBTbXN0YXRlZW4gZnJvbSB0aGUgc3BlYzoKIlRoZSBpbXBsZW1lbnRhdGlvbiBvZiBv
cHRpb25hbCBSSVNDLVYgZXh0ZW5zaW9ucyBoYXMgdGhlIHBvdGVudGlhbCB0byBvcGVuCmNvdmVy
dCBjaGFubmVscyBiZXR3ZWVuIHNlcGFyYXRlIHVzZXIgdGhyZWFkcywgb3IgYmV0d2VlbiBzZXBh
cmF0ZSBndWVzdApPU2VzIHJ1bm5pbmcgdW5kZXIgYSBoeXBlcnZpc29yLiBUaGUgcHJvYmxlbSBv
Y2N1cnMgd2hlbiBhbiBleHRlbnNpb24KYWRkcyBwcm9jZXNzb3Igc3RhdGUtLS11c3VhbGx5IGV4
cGxpY2l0IHJlZ2lzdGVycywgYnV0IHBvc3NpYmx5IG90aGVyIGZvcm1zIG9mCnN0YXRlLS0tdGhh
dCB0aGUgbWFpbiBPUyBvciBoeXBlcnZpc29yIGlzIHVuYXdhcmUgb2YgKGFuZCBoZW5jZSB3b27i
gJl0CmNvbnRleHQtc3dpdGNoKSBidXQgdGhhdCBjYW4gYmUgbW9kaWZpZWQvd3JpdHRlbiBieSBv
bmUgdXNlciB0aHJlYWQgb3IKZ3Vlc3QgT1MgYW5kIHBlcmNlaXZlZC9leGFtaW5lZC9yZWFkIGJ5
IGFub3RoZXIuIgoKQmFzZWQgb24gdGhlIGFib3ZlLCBTc2FpYSBleHRlbnNpb24gcmVsYXRlZCBD
U1JzIG5lZWQgdG8gYmUgZXhwbGljaXRseQplbmFibGVkIGZvciBIUy1tb2RlIGJ5IE0tbW9kZSAo
d2hpY2ggT3BlblNCSSBhbHJlYWR5IGRvZXMpIGFuZApmb3IgVlMtbW9kZSBieSBIUy1tb2RlICh3
aGljaCB0aGlzIHNlcmllcyBhZGRzIGZvciBLVk0gUklTQy1WKS4KCkN1cnJlbnRseSwgdGhlcmUg
YXJlIG5vIG5ldyBleHRlbnNpb25zIGFkZGluZ3MgQ1NScyBmb3IgdXNlci1zcGFjZQpzbyBSSVND
LVYga2VybmVsIGRvZXMgbm90IG5lZWQgdG8gc2V0IHVwIHNzdGF0ZWVuWCBDU1JzIGZvciBwcm9j
ZXNzZXMKb3IgdGFza3MgYnV0IGluIHRoZSBmdXR1cmUgUklTQy1WIGtlcm5lbCBtaWdodCB0b3Vj
aCBzc3RhdGVlblggQ1NScy4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
