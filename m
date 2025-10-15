Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E290CCCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 20:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9YNAX0eaUXd0QV2vh49kSOX7iqSPxPBnyonB7rbvu0=; b=KzdsWazbqTUpLc
	Xa6HiXY+yjsyBTqd/gpOUg5xl3ZpznJnnA6b0mbbD476pIdXbxQZbp7dWtwsT3sASCOHhNfKs5VKW
	mXRu9ImAv/+hWLbltYOZZ5sUn3n7kfwTP2mqCiCc0Lpd8zq5dAYAYORZGWp9KMXOJtDSwGBDWA7Rz
	hTC2Ic4zW17rY5e6uhjj3iuXqx8HPPq8dZitM0zbKJMSyxqfuozfTP7nzzHfQGHv0u7XsHEylO915
	Iv6da11HP3tMr8nQ55J0k90/Nvi1PF7amDzy3lgEcxh8ZYb5jpc2pnnx/soTbI5OyMWDJMppOSGPt
	7Gs1MM3UGoc8wo3Yvsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97xg-00000002q14-0b3Y;
	Wed, 15 Oct 2025 20:19:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97xe-00000002q0G-46k4
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xJg9X9PlIoB/ST2nyyuoIjib7x+oaPTrM9+LsomMQTU=; b=CTDoSmU8EeniwynKYtLaawupte
	5kbRMpaolfJfc8P+KHrv0kA9CKQRDbtvJADBIVKXBK5tsgL/J6D92sbQP3ZHvagugEl+FdRgwg1f9
	ie5Y4jWNH5V5QosbKjx6NSRaoEv4VRENB7IPrJyXpmHzc5cmrYjTuSbesk/GgYDuDpjGASUJpGK2J
	2megush3d8C2K5vu9w9rsqbvub/eeLkJavvVvuSfnetAth3FfS51Jon5MZy3O4lpBdTH4K4byW/NP
	2vWqqjtpeHoKtiYA9SsgQfZueUkrGLL2FpIFCrG6Pcef8I42vjdTBnclQchT+atFAidrZ0CBu5Ymt
	TDC8NPuA==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97xV-00000006E7M-42FS
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 20:18:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63bf76fc9faso1764247a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760559531; x=1761164331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJg9X9PlIoB/ST2nyyuoIjib7x+oaPTrM9+LsomMQTU=;
        b=X/QUEmxw9Y7E7TqmZGF/1nC9Qa+QtJuirbUvJOIUqMgg7mdNJfrbf8KPJdYVbRl+a7
         ijyP88MJ78415m6c1+yYezl+PWA1ssDU0GoE4tA0TckoiBbcSNkRvaAEiOZiH+LuAxZp
         puQahHyFyYgd4Uwe0SIiQklCVIEqyB9peB9344P2jYe2m2LvSio0Lhw6Jwe15tdknmXa
         MrcT8q+0Fvtn7+Lz+5awFJV5Njtzdxf/JIc+Oo1TKWAf3cjKAfTlwQClF2eB9W++EE4x
         JaelUJnui+Ts23Rje30JCN6iuh+EClQ9O6joJY34/Aj1FrZFoGEhCnrF1lSgFfw8w/z+
         ESfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760559531; x=1761164331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJg9X9PlIoB/ST2nyyuoIjib7x+oaPTrM9+LsomMQTU=;
        b=cS8e16QmonMa1qn/5uYs8mKEWmlStGb3WgKmCqVs+BPszo9rItN0pDHQIsizhJWsQ3
         8m97Sah47jpWAbEHE4kbBAsa9yUCh3CVvitzwhH+oMqBrZG31oe80yzHGSywShv7/1oR
         ovoDbxa9K7aNCp1+aXmMcdUw5frW3XYrLLJpD3V02tjnekRpshCecdB9r7N6sgG+4sa/
         kRIIo/qOuu1dyNN5hFYZFY1I+ie5YeKROme153rELFEA6+nkx1ndnBbkFFrEXBtBx79I
         xh7t805AhryzRENGpAkz5zSXtWeyErc0t1QlkmjkPQ5X9Uli1w4Ld7/kXkE9CHZzWAQ5
         St7g==
X-Gm-Message-State: AOJu0YwHx1LWQHfpqgIBCAlHnXPhpMEkohDv9cdo6gqMKKPLjVahf1Ko
	n4Igq883b4F6c9DM2mqBe2MI5Yce69je5VOwLnvyqTO0VvGlLKg67t+4O5Uy6d3/nkpma03oHRE
	z3dXAlGhn5jcE/hrRcZLaNXhOP+SBfvE=
X-Gm-Gg: ASbGncuWdFRWeroxOw9luFdOr7SJ44uJG6/n9INlSZNoVRJXBOhxUVOmBfQEPGaNTBf
	TsoE8lQCMbPgODXviCXMrQThgM7XRdGpOS40ZmzOcX7JwUfKq0js1Zsvs37K+7vYbD+OaDLRlba
	AJHexyuoPzYDBjSNrZWOEf+1DdJ7T/dGu9n77dxa+04IaMDZ1hOAODGuNlelvk3039/MV4ATerQ
	DDZNSqzJKqWK3tN/xZBNMc=
X-Google-Smtp-Source: AGHT+IENKf4WvhhBBJ2iUPr22yFEcCC4h7iTdaK4CP7B8HphHP1g/duXTL3pcv4SsEGCtifhINNijtPNnW4w/XdOi2o=
X-Received: by 2002:a05:6402:5205:b0:634:5297:e3bc with SMTP id
 4fb4d7f45d1cf-639d5b5e42bmr29802751a12.6.1760559530474; Wed, 15 Oct 2025
 13:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251007115840.2320557-1-geomatsi@gmail.com> <20251007115840.2320557-5-geomatsi@gmail.com>
In-Reply-To: <20251007115840.2320557-5-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 15 Oct 2025 15:18:38 -0500
X-Gm-Features: AS18NWAb6axIg7I2IqjVTHpzLs99BpK8lkg12YGdZJcKZxCb1gstwLw4-MW_Txc
Message-ID: <CAFTtA3MObvXRHxbULghGcT=ThrBDeFDJzUY7LOhgNnarzpYeGg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] riscv: vector: allow to force vector context save
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Han Gao <rabenda.cn@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nam Cao <namcao@linutronix.de>, 
	Joel Granados <joel.granados@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_211856_225002_51540B31 
X-CRM114-Status: GOOD (  23.51  )
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

T24gVHVlLCBPY3QgNywgMjAyNSBhdCA2OjU44oCvQU0gU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9t
YXRzaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBwdHJhY2UgdXBkYXRlcyB2ZWN0b3IgQ1NS
IHJlZ2lzdGVycyBmb3IgYSB0cmFjZWQgcHJvY2VzcywgdGhlCj4gY2hhbmdlcyBtYXkgbm90IGJl
IGltbWVkaWF0ZWx5IHZpc2libGUgdG8gdGhlIG5leHQgcHRyYWNlIG9wZXJhdGlvbnMKPiBkdWUg
dG8gdmVjdG9yIGNvbnRleHQgc3dpdGNoIG9wdGltaXphdGlvbnMuCj4KPiBUaGUgZnVuY3Rpb24g
J3Jpc2N2X3ZfdnN0YXRlX3NhdmUnIHNhdmVzIGNvbnRleHQgb25seSBpZiBtc3RhdHVzLlZTIGlz
Cj4gJ2RpcnR5Jy4gSG93ZXZlciBtc3RhdHVzLlZTIG9mIHRoZSB0cmFjZWQgcHJvY2VzcyBjb250
ZXh0IG1heSByZW1haW4KPiAnY2xlYW4nIGJldHdlZW4gdHdvIGJyZWFrcG9pbnRzLCBpZiBubyB2
ZWN0b3IgaW5zdHJ1Y3Rpb25zIHdlcmUgZXhlY3V0ZWQKPiBiZXR3ZWVuIHRob3NlIHR3byBicmVh
a3BvaW50cy4gSW4gdGhpcyBjYXNlIHRoZSB2ZWN0b3IgY29udGV4dCB3aWxsIG5vdAo+IGJlIHNh
dmVkIGF0IHRoZSBzZWNvbmQgYnJlYWtwb2ludC4gQXMgYSByZXN1bHQsIHRoZSBzZWNvbmQgcHRy
YWNlIG1heQo+IHJlYWQgc3RhbGUgdmVjdG9yIENTUiB2YWx1ZXMuCgpJSVVDLCB0aGUgc2Vjb25k
IHB0cmFjZSBzaG91bGQgbm90IGdldCB0aGUgc3RhbGUgdmVjdG9yIENTUiB2YWx1ZXMuClRoZSBz
ZWNvbmQgcmlzY3ZfdnJfZ2V0KCkgc2hvdWxkIGJlIHJlYWRpbmcgZnJvbSB0aGUgY29udGV4dCBt
ZW1vcnkKKHZzdGF0ZSksIHdoaWNoIGlzIHVwZGF0ZWQgZnJvbSB0aGUgbGFzdCByaXNjdl92cl9z
ZXQoKS4gVGhlIHVzZXIncwp2c3RhdGUgc2hvdWxkIHJlbWFpbiB0aGUgc2FtZSBzaW5jZSBsYXN0
IHJpc2N2X3ZyX3NldCgpLiBDb3VsZCB5b3UKZXhwbGFpbiBtb3JlIG9uIGhvdyB0aGlzIGJ1ZyBp
cyBvYnNlcnZlZCBhbmQgd2h5IG9ubHkgQ1NScyBhcmUKYWZmZWN0ZWQgYnV0IG5vdCB2LXJlZ3Mg
YXMgd2VsbD8KClRoYW5rcywKQW5keQoKPgo+IEZpeCB0aGlzIGJ5IGludHJvZHVjaW5nIGEgVElG
IGZsYWcgdGhhdCBmb3JjZXMgdmVjdG9yIGNvbnRleHQgc2F2ZSBvbgo+IHRoZSBuZXh0IGNvbnRl
eHQgc3dpdGNoLCByZWdhcmRsZXNzIG9mIG1zdGF0dXMuVlMgc3RhdGUuIFNldCB0aGlzCj4gZmxh
ZyBvbiBwdHJhY2Ugb3ByYXRpb25zIHRoYXQgbW9kaWZ5IHZlY3RvciBDU1IgcmVnaXN0ZXJzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDIgKysKPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICAgIHwgMyArKysKPiAgYXJjaC9yaXNj
di9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9w
dHJhY2UuYyAgICAgICAgICAgfCA1ICsrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2lu
Zm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAo+IGluZGV4IDgzNmQ4
MGRkMjkyMS4uZTA1ZTlhYTg5YzQzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGhyZWFkX2luZm8uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2lu
Zm8uaAo+IEBAIC0xMTgsNyArMTE4LDkgQEAgaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVj
dCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7Cj4KPiAgI2RlZmlu
ZSBUSUZfMzJCSVQgICAgICAgICAgICAgICAgICAgICAgMTYgICAgICAvKiBjb21wYXQtbW9kZSAz
MmJpdCBwcm9jZXNzICovCj4gICNkZWZpbmUgVElGX1JJU0NWX1ZfREVGRVJfUkVTVE9SRSAgICAg
IDE3ICAgICAgLyogcmVzdG9yZSBWZWN0b3IgYmVmb3JlIHJldHVyaW5nIHRvIHVzZXIgKi8KPiAr
I2RlZmluZSBUSUZfUklTQ1ZfVl9GT1JDRV9TQVZFICAgICAgICAgMTMgICAgICAvKiBmb3JjZSBW
ZWN0b3IgY29udGV4dCBzYXZlICovCj4KPiAgI2RlZmluZSBfVElGX1JJU0NWX1ZfREVGRVJfUkVT
VE9SRSAgICAgQklUKFRJRl9SSVNDVl9WX0RFRkVSX1JFU1RPUkUpCj4gKyNkZWZpbmUgX1RJRl9S
SVNDVl9WX0ZPUkNFX1NBVkUgICAgICAgICAgICAgICAgQklUKFRJRl9SSVNDVl9WX0ZPUkNFX1NB
VkUpCj4KPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfVEhSRUFEX0lORk9fSCAqLwo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZWN0b3IuaAo+IGluZGV4IGI2MTc4NmQ0M2MyMC4uZDM3NzBlMTNkYTkzIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gQEAgLTM3MCw2ICszNzAsOSBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJldiwKPiAgewo+
ICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3M7Cj4KPiArICAgICAgIGlmICh0ZXN0X2FuZF9j
bGVhcl90c2tfdGhyZWFkX2ZsYWcocHJldiwgVElGX1JJU0NWX1ZfRk9SQ0VfU0FWRSkpCj4gKyAg
ICAgICAgICAgICAgIF9fcmlzY3Zfdl92c3RhdGVfZGlydHkodGFza19wdF9yZWdzKHByZXYpKTsK
PiArCj4gICAgICAgICBpZiAocmlzY3ZfcHJlZW1wdF92X3N0YXJ0ZWQocHJldikpIHsKPiAgICAg
ICAgICAgICAgICAgaWYgKHJpc2N2X3ZfaXNfb24oKSkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIFdBUk5fT04ocHJldi0+dGhyZWFkLnJpc2N2X3ZfZmxhZ3MgJiBSSVNDVl9WX0NUWF9ERVBU
SF9NQVNLKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggMzFhMzkyOTkzY2I0Li40Nzk1OWM1NWNl
ZmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTE4Myw2ICsxODMsNyBAQCB2b2lkIGZsdXNo
X3RocmVhZCh2b2lkKQo+ICAgICAgICAga2ZyZWUoY3VycmVudC0+dGhyZWFkLnZzdGF0ZS5kYXRh
cCk7Cj4gICAgICAgICBtZW1zZXQoJmN1cnJlbnQtPnRocmVhZC52c3RhdGUsIDAsIHNpemVvZihz
dHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSkpOwo+ICAgICAgICAgY2xlYXJfdHNrX3RocmVhZF9m
bGFnKGN1cnJlbnQsIFRJRl9SSVNDVl9WX0RFRkVSX1JFU1RPUkUpOwo+ICsgICAgICAgY2xlYXJf
dHNrX3RocmVhZF9mbGFnKGN1cnJlbnQsIFRJRl9SSVNDVl9WX0ZPUkNFX1NBVkUpOwo+ICAjZW5k
aWYKPiAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfU1VQTQo+ICAgICAgICAgaWYgKHJpc2N2X2hh
c19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TVVBNKSkKPiBAQCAtMjA1LDYgKzIw
Niw3IEBAIGludCBhcmNoX2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwg
c3RydWN0IHRhc2tfc3RydWN0ICpzcmMpCj4gICAgICAgICBtZW1zZXQoJmRzdC0+dGhyZWFkLnZz
dGF0ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7Cj4gICAgICAgICBt
ZW1zZXQoJmRzdC0+dGhyZWFkLmtlcm5lbF92c3RhdGUsIDAsIHNpemVvZihzdHJ1Y3QgX19yaXNj
dl92X2V4dF9zdGF0ZSkpOwo+ICAgICAgICAgY2xlYXJfdHNrX3RocmVhZF9mbGFnKGRzdCwgVElG
X1JJU0NWX1ZfREVGRVJfUkVTVE9SRSk7Cj4gKyAgICAgICBjbGVhcl90c2tfdGhyZWFkX2ZsYWco
ZHN0LCBUSUZfUklTQ1ZfVl9GT1JDRV9TQVZFKTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9wdHJhY2UuYwo+IGluZGV4IDkwNmNmMTE5N2VkYy4uNTY5Zjc1NmJlZjIzIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHRyYWNlLmMKPiBAQCAtMTQ4LDYgKzE0OCwxMSBAQCBzdGF0aWMgaW50IHJpc2N2X3ZyX3Nl
dChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKPiAgICAgICAgIGlmICh2c3RhdGUtPnZsZW5i
ICE9IHB0cmFjZV92c3RhdGUudmxlbmIpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+Cj4gKyAgICAgICBpZiAodnN0YXRlLT52dHlwZSAhPSBwdHJhY2VfdnN0YXRlLnZ0eXBlIHx8
Cj4gKyAgICAgICAgICAgdnN0YXRlLT52Y3NyICE9IHB0cmFjZV92c3RhdGUudmNzciB8fAo+ICsg
ICAgICAgICAgIHZzdGF0ZS0+dmwgIT0gcHRyYWNlX3ZzdGF0ZS52bCkKPiArICAgICAgICAgICAg
ICAgc2V0X3Rza190aHJlYWRfZmxhZyh0YXJnZXQsIFRJRl9SSVNDVl9WX0ZPUkNFX1NBVkUpOwo+
ICsKPiAgICAgICAgIHZzdGF0ZS0+dnN0YXJ0ID0gcHRyYWNlX3ZzdGF0ZS52c3RhcnQ7Cj4gICAg
ICAgICB2c3RhdGUtPnZsID0gcHRyYWNlX3ZzdGF0ZS52bDsKPiAgICAgICAgIHZzdGF0ZS0+dnR5
cGUgPSBwdHJhY2VfdnN0YXRlLnZ0eXBlOwo+IC0tCj4gMi41MS4wCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
