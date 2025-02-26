Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26519C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F18yGo0UPPx3ShkKs65zVGAS/2UA4HnpN4yi6QL+21I=; b=ajAFbIsYyxwsEp
	u/bkrR44j2sqY7bLm811PxFft/mHh+vkXdvLsoEXZrhf69qBPImpkstMhityBZIEvRra0f2KacO+N
	QydHjyuB2OggZQnifZXbFSThMwlgBpa/gBkBsgBZ7+Ua0HH2REFR3cPdfZnW/TCQE5yPVJ2N9u3OW
	KSl/oya85isGktiwqhN+lJ73dsnGdRVVyiVn3aUycuUYpFtqdEtT0KlJYjt4dA4YeGGQDArMZ5UKE
	OYHbCQKF+ZNe0Y1jTnFy7DR8d65Q7C7Lm3hL1lsZtv/8tkMn2+SKJHvn2V7on+KEQBqqTtO+DuYAn
	EpG4T/eH7tICI7oWnJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFP-00000004GXW-2jcA;
	Wed, 26 Feb 2025 15:22:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIrS-00000004Bqb-1UOq
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 14:58:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so12442343a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740581888; x=1741186688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Cx+xJGKu5N0JmZ2sR9g+qa3HIRq8K6zYLh9TIcwjV0=;
        b=vrlNdG466n1hWwWNBLSVV6PQvU4lEJZ1OeAWLoCWmSv8v7UjID2Bwh/gTMlwZSwtdR
         KM92OKdqEWjxewgTeoScrWh6d1LvOvW1UZyww5uXTxW+u1gDdjf7217vXYS4+Afx2gae
         UT5fl8ldfJsfJGZdQxdsX4C0y5UHv9MjSVl5PytLX2zaBO1/M16Rth/PN/7YWi2W4Dwl
         oFwyPbXgWREsKst1Z0V49c3Qfysvxsm4uQx1RywFOM4WbnToOUYwRxqyWK3SU/zb1oGs
         myWyEbL0dscUXpdq3yTEylIjvfj/7dsk3dp7ZkaQr1OrjWF/Qtc4Kfs2OWHguI3EzdEA
         ZjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581888; x=1741186688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Cx+xJGKu5N0JmZ2sR9g+qa3HIRq8K6zYLh9TIcwjV0=;
        b=PtwKNUaZzbTfL0sOmNnT04VaHfbmDVQgO/aCC+arlGBxitR52AGPodfLYa3DO9LCS0
         Nc/IryPqV87rQVuNE8IZux2IL/t/vNtC7dCkHPDSB5aEFCA8chIyec7TJjgHoQ/AFXs/
         slljAZjPEo/kJwz7LYTpxI3mFrccUIlZgO9RpRzraBThh1LO9exRx4G95+yYsIV7UwX8
         0hV7kSYgOIkbP6JhqpkmohB5Ix01n04hYZkjAl79wmjVEn3FChQzJNCsp86bTO3UjS9c
         D88aY17Z7mL+ljv9BeIa9wkNfi9Qg9cUpMxpIYyjuixec8+28Ajn0oG5aBxBlLzAUGzQ
         q5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUGSr4xWL1FwIoUetiQ9fDPj6qddj9Gt3aLvXHbQT++BfkZbxPy1Lu59TMcu4UYWNw4zSAvJkYbTr0WcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI0nPdLP90h7qXuNKmpGdshUC4K0BkzclswHy913TFCZTbroep
	AkLfrZBihkOrGFdmU3H6iHIFlcxGOjCtbuic9tRqGP/CkCWynM8TLHWOnwXrbZy1y2cbYxCN/fR
	k/wiNSyQcnxj9XwmYcfBNy1iSLc0u5ojJa21BvA==
X-Gm-Gg: ASbGncv9DTbYh9gPjIK60Zgsq79QGOuYPxhsf8CLZGhReZr0pd3CQIw9PJ0Ug6V/Lnd
	lhfyOBMj+8LAA4hmP0S/sX/G5BM1t3wAkHt53Yxg4bqIu9SzTFsyohJUcuhPe50UgkMmauu2MD4
	gTCrkgG1YYOvTbd4hglrHP6iiwLnk/A71pyFmFXiEx
X-Google-Smtp-Source: AGHT+IE5KIbB4z+VdU6KvYCJ8GmmazCYgsdMxoVEY76uzggD9TD+2odB1KQGXMJsPgsKuEa+422vj8CyF4RJmBCfmf0=
X-Received: by 2002:a05:6402:34cc:b0:5dc:cfc5:9305 with SMTP id
 4fb4d7f45d1cf-5e4a0dfc8b9mr4917673a12.25.1740581888192; Wed, 26 Feb 2025
 06:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20250201110607.34766-1-cuiyunhui@bytedance.com> <CAEEQ3w=uYad7UAedSU4M_L277v=RQGWHpJQwOW-p7W6=hcijsQ@mail.gmail.com>
In-Reply-To: <CAEEQ3w=uYad7UAedSU4M_L277v=RQGWHpJQwOW-p7W6=hcijsQ@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 26 Feb 2025 15:57:56 +0100
X-Gm-Features: AQ5f1Jq3NwdOzWli4GS6uC6Juk-y-5UTRJ8pwcbzU1SmN5IAfAxHrxw4vEUMxl0
Message-ID: <CAHVXubhW9b6fw8ZvHtn7zmyRSUVt-3JjmFbE-_L42wZ9W6=vKA@mail.gmail.com>
Subject: Re: [PATCH] riscv: print hartid on bringup
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: apatel@ventanamicro.com, atishp@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com, 
	jassisinghbrar@gmail.com, takakura@valinux.co.jp, 
	valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com, 
	charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com, 
	andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_065810_645591_F3EC2144 
X-CRM114-Status: GOOD (  16.72  )
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

SGkgWXVuaHVpLAoKT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMTo1NOKAr1BNIHl1bmh1aSBjdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFsbCwKPgo+IEdlbnRsZSBw
aW5nLiBBbnkgY29tbWVudHMgb24gdGhpcyBwYXRjaD8KPgo+IE9uIFNhdCwgRmViIDEsIDIwMjUg
YXQgNzowNuKAr1BNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToK
PiA+Cj4gPiBGaXJtd2FyZSByYW5kb21seSByZWxlYXNlcyBjb3Jlcywgc28gQ1BVIG51bWJlcnMg
ZG9uJ3QgbGluZWFybHkgbWFwCj4gPiB0byBoYXJ0aWRzLiBXaGVuIHRoZSBzeXN0ZW0gaGFzIGFu
IGV4Y2VwdGlvbiwgd2UgY2FyZSBtb3JlIGFib3V0IGhhcnRpZHMuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyAgICAgfCAyICsrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwv
c21wYm9vdC5jIHwgNCArKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zbXAuYwo+ID4gaW5kZXggZDU4YjVlNzUxMjg2Li5lNjUwZGVjNDQ4MTcgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc21wLmMKPiA+IEBAIC00OCw2ICs0OCw4IEBAIEVYUE9SVF9TWU1CT0xfR1BMKF9fY3B1
aWRfdG9faGFydGlkX21hcCk7Cj4gPiAgdm9pZCBfX2luaXQgc21wX3NldHVwX3Byb2Nlc3Nvcl9p
ZCh2b2lkKQo+ID4gIHsKPiA+ICAgICAgICAgY3B1aWRfdG9faGFydGlkX21hcCgwKSA9IGJvb3Rf
Y3B1X2hhcnRpZDsKPiA+ICsKPiA+ICsgICAgICAgcHJfaW5mbygiQm9vdGluZyBMaW51eCBvbiBo
YXJ0aWQgJWx1XG4iLCBib290X2NwdV9oYXJ0aWQpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIERF
RklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGludCwgaXBpX2R1bW15X2Rldik7Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21w
Ym9vdC5jCj4gPiBpbmRleCBlMzZkMjAyMDViZDcuLmJlYmEwZWZiMDBiOSAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc21wYm9vdC5jCj4gPiBAQCAtMjMxLDYgKzIzMSwxMCBAQCBhc21saW5rYWdlIF9fdmlzaWJs
ZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiA+ICAgICAgICAgcmlzY3ZfaXBpX2VuYWJsZSgpOwo+
ID4KPiA+ICAgICAgICAgbnVtYV9hZGRfY3B1KGN1cnJfY3B1aWQpOwo+ID4gKwo+ID4gKyAgICAg
ICBwcl9pbmZvKCJDUFUldTogQm9vdGVkIHNlY29uZGFyeSBoYXJ0aWQgJWx1XG4iLCBjdXJyX2Nw
dWlkLAo+ID4gKyAgICAgICAgICAgICAgIGNwdWlkX3RvX2hhcnRpZF9tYXAoY3Vycl9jcHVpZCkp
Owo+ID4gKwo+ID4gICAgICAgICBzZXRfY3B1X29ubGluZShjdXJyX2NwdWlkLCB0cnVlKTsKPiA+
Cj4gPiAgICAgICAgIC8qCj4gPiAtLQo+ID4gMi4zOS4yCj4gPgo+Cj4gVGhhbmtzLAo+IFl1bmh1
aQoKSUlSQyB0aGF0J3MgYSBkZWJ1ZyBmZWF0dXJlIHdoZW4geW91IGNhbid0IHJlYWNoIHVzZXJz
cGFjZSBhbmQgdXNlCmNwdWluZm8sIHNvIHdoYXQgYWJvdXQgdXNpbmcgcHJfZGVidWcoKSBpbnN0
ZWFkPwoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
