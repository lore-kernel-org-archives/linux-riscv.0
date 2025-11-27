Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6C6D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y92YQfS4/qyLRqQLlpP53SBxSZs4ezbnIxM/A8Aruss=; b=nmDZRHrpdqgMAUxOCxuO2I666q
	boIaQRwu8Rn8wM7kMfQLkkwayDQo+POtyRI6V3GTU9F1tEEfAplybAxKGTgnV0KbFZkhV8HgqkVOM
	TRKWNUkTA6xYFsL/Z1LLRJKUMSWCCuq7QSXozchfd85eLicCpxRhFVc9IqTe4LaK0jfVckSnvKziJ
	dbo4nIgqTXzXJTY1qt+qPCREPzDtHXT2Tl++P54mW6fQSXBVHv34p5HRqGNFlZswf2mrBWialWdsZ
	F9rBlLwWba4iZeLQ3lxt1IFG1Qh/NncJQFxX/OObj7jK3GMruSBKb4uJrH9aAW1W+BHlDyX+e+iel
	s0aMT19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ0q-0000000GM9d-0iYg;
	Thu, 27 Nov 2025 10:14:08 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ0n-0000000GM8q-1SJG
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 10:14:06 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-656d9230cf2so353781eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 02:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764238444; x=1764843244; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8C/8vYpZ3lt1x50MRO8vehvZVw1jN1RA/JwkPqP+uE=;
        b=kuLHn0clhVDfSFBl06KWglabY8vWj1buSPGQXjX5+afXP7bQW+gdf+U40CF4cTU6DE
         PCitYJ308p4YFjfs6vWKkAIouqawzQa4JiJ91WAO4d/WLJEzCU1fZq7Pg3tCfFDeAWBL
         o/sv9w1nWMU4FOnp9+dxSP9Slap3aUMep5s+p2ZLOIhopVmnsWS+/6fuHW26Uc4JrFPS
         QlTEDPnqhnYVf1PPzi4dYZsGRp6JJYsa64pejChW7WyndaHMHriIVlpJilBMVJfEY89q
         q5TQwsQaYoSzchwHPNVfSBX74lOmWZejaP2R8QzXF6fXJB4KqBx6BOKPPQgNPq5pBFfX
         mXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238444; x=1764843244;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8C/8vYpZ3lt1x50MRO8vehvZVw1jN1RA/JwkPqP+uE=;
        b=OZn0slIZTK4ISsaDhoo+E66r/dcR9H9Tzrp15KxrIY4tzg2oIrspY3rM/xUKA6jqg9
         ds+2dN0UlLk6zSgY6eSOkPTGxD49HlJnKNKc4e97Q0xp7ivxWJNGTVdQyjO1jGk5ySqh
         Dosk0WBI/KeNfBnGHEPACXkKVqDsQY4I64t8K/1RXugR/HI9gWUwOcjn82nhHiWghPLC
         U50Pf/XzNRhPTDs+hO6+Mjma9urLFIN6c6XCVulds22hzjq2m8JKK69X4BkS9q1P+OAh
         6CWDu8x+C/xDJT5HNftYEhXYmDkZ8eh4aXzrd4iZsQpr27y2xvx5ACE1HlUcl6RqD6Ez
         X4kg==
X-Forwarded-Encrypted: i=1; AJvYcCVhpGa/iRvshuLvJNc6OcwrtezyGpe7tk36/ol+X7jqNRs8j2jj03fb8lXqL4Q9ffsFFMdxdsOBhIvuNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbsBQgf7lV8ofZeqvE+cAxOTx9o02bv07r8HOO3ssc1zyxnH3L
	Az8L5HCBMNqaDCkGtZzxOtvXkgJsNvtrTjQR4o5HOKZXiExzWwVtvHZnkh8oCidzC7onJvkvBiI
	02uJnlki6Q7PPsfgSlZG9syK21UlVIFS2mElW0KVdTg==
X-Gm-Gg: ASbGnct/Vkxx1rlRNhlnAuWtpzln4wvl1PRqmcSV6QeGw/mMoxWkOOZa9qyI7vvFHep
	7dRjHtdnmT04cPLQNg2UJg8/FV8EE9lucE0q7yMjvTix4IUrq9xIoWVI4fSuSb/1pdzqyS1g6vE
	vQG5+6ATLwYC2ed69nxHxQ+Q+jltzIRW+FGp2wzjy+aZ+SdPWa66NTHvXeC75znq8F2BIOwQDfe
	uukc4AMtfYqhqV8X6dt+uzS9u26zdV+2HLOUV6rlIxUDXrgSOLTY8af7wPRJHHntc2t+pnKINYw
	yM/TvnAS
X-Google-Smtp-Source: AGHT+IGBVIdlBmUiqlH23Jgnqg+vCTkZchSIIr25/2FLye0Tk4Kz4LKKfhIVPsQEIjNUDRjnb1zBkemke4S1rnl41Nk=
X-Received: by 2002:a05:6808:250d:b0:450:7169:810e with SMTP id
 5614622812f47-45115b24dc1mr9824305b6e.41.1764238444270; Thu, 27 Nov 2025
 02:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20251118025015.42491-1-cuiyunhui@bytedance.com> <20251118025015.42491-5-cuiyunhui@bytedance.com>
In-Reply-To: <20251118025015.42491-5-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 27 Nov 2025 18:13:51 +0800
X-Gm-Features: AWmQ_bkhXe-IUa1j5RwqVU5YALRpKBW_makLPEfBh7aEKWFJIRg3x1qGcDHPwo8
Message-ID: <CAEEQ3wkpWExOg+xLEy18Le+89kowgu6LOj0HMCVcqJKG+7Wdhg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] riscv: smp: use NMI for crash stop
To: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, cuiyunhui@bytedance.com, 
	luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com, 
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, 
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	timothy.hayes@arm.com, lpieralisi@kernel.org, arnd@arndb.de, kees@kernel.org, 
	tglx@linutronix.de, viresh.kumar@linaro.org, boqun.feng@gmail.com, 
	linux-arm-kernel@lists.infradead.org, cleger@rivosinc.com, 
	atishp@rivosinc.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_021405_530637_5F04EAEB 
X-CRM114-Status: GOOD (  19.40  )
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

SGkgQWxsLAoKT24gVHVlLCBOb3YgMTgsIDIwMjUgYXQgMTA6NTHigK9BTSBZdW5odWkgQ3VpIDxj
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBVc2UgTk1JIGluc3RlYWQgb2YgSVBJ
IGZvciBjcmFzaCBzdG9wIGlmIFJJU0MtViBTU0UgTk1JIGlzIHN1cHBvcnRlZC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKyst
Cj4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zfc3NlX25taS5jIHwgMTAgKysrKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3NtcC5jCj4gaW5kZXggNjY5MzI1ZTY4YTIxYS4uMDdjY2MyOGY1MjE3MiAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5j
Cj4gQEAgLTE2LDYgKzE2LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tnZGIuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3BlcmNwdS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcHJvZmlsZS5oPgo+ICsjaW5j
bHVkZSA8bGludXgvcmlzY3Zfc3NlX25taS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4K
PiBAQCAtMzAwLDcgKzMwMSwxOCBAQCB2b2lkIGNyYXNoX3NtcF9zZW5kX3N0b3Aodm9pZCkKPiAg
ICAgICAgIGF0b21pY19zZXQoJndhaXRpbmdfZm9yX2NyYXNoX2lwaSwgbnVtX290aGVyX29ubGlu
ZV9jcHVzKCkpOwo+Cj4gICAgICAgICBwcl9jcml0KCJTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBD
UFVzXG4iKTsKPiAtICAgICAgIHNlbmRfaXBpX21hc2soJm1hc2ssIElQSV9DUFVfQ1JBU0hfU1RP
UCk7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIElQSSBwZXJmb3JtcyBiZXR0ZXIgdGhh
biBOTUksIGJ1dCBhdHRlbXB0aW5nIElQSSBmaXJzdCBhbmQKPiArICAgICAgICAqIGZhbGxpbmcg
YmFjayB0byBOTUkgb24gZmFpbHVyZSByZXF1aXJlcyByZWNvcmRpbmcgQ1BVcyB0aGF0IGZhaWxl
ZAo+ICsgICAgICAgICogdG8gc3RvcC4gVGhpcyBhZGRzIGNvbXBsZXhpdHkgdG8gY3B1X2NyYXNo
X3N0b3AoKS4gU2luY2UgdGhpcyBvcGVyYXRpb24KPiArICAgICAgICAqIGlzIHJhcmUgYW5kIHR5
cGljYWxseSBpbiB0aGUgZmluYWwgcGhhc2UsIGRpcmVjdGx5IHJlcGxhY2UgSVBJCj4gKyAgICAg
ICAgKiB3aXRoIE5NSS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKCFubWlfc3VwcG9ydCgp
KQo+ICsgICAgICAgICAgICAgICBzZW5kX2lwaV9tYXNrKCZtYXNrLCBJUElfQ1BVX0NSQVNIX1NU
T1ApOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBzZW5kX25taV9tYXNrKCZtYXNr
LCBMT0NBTF9OTUlfQ1JBU0gpOwo+Cj4gICAgICAgICAvKiBXYWl0IHVwIHRvIG9uZSBzZWNvbmQg
Zm9yIG90aGVyIENQVXMgdG8gc3RvcCAqLwo+ICAgICAgICAgdGltZW91dCA9IFVTRUNfUEVSX1NF
QzsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNjdl9zc2Vfbm1pLmMg
Yi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZV9ubWkuYwo+IGluZGV4IDE3NjNmNDM5
NjFhYjYuLmU0YzIwZGNlNDBmOWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9yaXNj
di9yaXNjdl9zc2Vfbm1pLmMKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3Nz
ZV9ubWkuYwo+IEBAIC0xMCw2ICsxMCw5IEBACj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gICNp
bmNsdWRlIDxhc20vc21wLmg+Cj4KPiArI2RlZmluZSBOTUlfSEFORExFKG1hc2ssIGZ1bmMsIC4u
LikgXAo+ICsgICAgICAgZG8geyBpZiAodHlwZSAmIChtYXNrKSkgZnVuYyhfX1ZBX0FSR1NfXyk7
IH0gd2hpbGUgKDApCj4gKwo+ICBib29sIG5taV9hdmFpbGFibGU7Cj4gIHN0YXRpYyBzdHJ1Y3Qg
c3NlX2V2ZW50ICpsb2NhbF9ubWlfZXZ0Owo+ICBzdGF0aWMgYXRvbWljX3QgbG9jYWxfbm1pX2Fy
ZyA9IEFUT01JQ19JTklUKExPQ0FMX05NSV9OT05FKTsKPiBAQCAtNDgsNiArNTEsMTMgQEAgdm9p
ZCBzZW5kX25taV9tYXNrKGNwdW1hc2tfdCAqbWFzaywgZW51bSBsb2NhbF9ubWlfdHlwZSB0eXBl
KQo+Cj4gIHN0YXRpYyBpbnQgbG9jYWxfbm1pX2hhbmRsZXIodTMyIGV2dCwgdm9pZCAqYXJnLCBz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+ICsgICAgICAgZW51bSBsb2NhbF9ubWlfdHlwZSB0
eXBlID0gYXRvbWljX3JlYWQoKGF0b21pY190ICopYXJnKTsKPiArICAgICAgIHVuc2lnbmVkIGlu
dCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gKwo+ICsgICAgICAgTk1JX0hBTkRMRShMT0NB
TF9OTUlfQ1JBU0gsIGNwdV9jcmFzaF9zdG9wLCBjcHUsIHJlZ3MpOwo+ICsKPiArICAgICAgIGF0
b21pY19zZXQoJmxvY2FsX25taV9hcmcsIExPQ0FMX05NSV9OT05FKTsKCkRvIG5vdCBwZXJmb3Jt
IGRpcmVjdCB6ZXJvIGNsZWFyaW5nIG9uIGxvY2FsX25taV9hcmc7IGluc3RlYWQsIG9ubHkKY2xl
YXIgdGhlIHByb2Nlc3NlZCBiaXRzLiBPdGhlcndpc2UsIGl0IG1heSBtaXNzIHJlc3BvbnNlcyB0
byBzb21lIE5NSQp0eXBlcy4KCj4gKwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC0tCj4g
Mi4zOS41Cj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
