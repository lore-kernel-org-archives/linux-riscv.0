Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1FDC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 06:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTKbqgm1qYFLyLK6OjSCjdfiNfrzehTyqSOOucucxQY=; b=C2W61GK66gQgMN
	ZXD7RDEk9lh6ec4E49HfjDVMMETMkc8Ef4DNyyAvhgMSakLx5uU+JF21BdQhHTRy7hyy44T9605TL
	6dhV7RQ0MwEzw7oEC9gN5aQjG1IPN8n9JTIXbRrq70SaMoTiHKM4nRaUeHaTNlV91tmqu7+sRdSr7
	SU/Sv9Ril/QqWV9+02PSBaQrXBFqCw4qypWd8jD0HQHcRItlFMFTzVmlYwGMw5uBYS8WxSVN3S+hr
	hTkqVTh+8j+IwY0O23dmpcL4ge09VIr4VqnYo9Zhj9sNTkFsJfne19d30KsXATjVtzZJLSHpwt7Wh
	VG6rICIDnNGaGkuaPZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xLG-00000000Zzc-3WhK;
	Thu, 09 May 2024 06:33:22 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xLC-00000000ZyJ-3S4H
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 06:33:21 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-61be4b9869dso4734847b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715236396; x=1715841196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmaABryygHKi61pe95KisDbKOMR4+gIFPU4VfIf1H/s=;
        b=TOxSoCAnutgAdVxGjQYwrjnnqfUshpnJjvNtMDYPnG665gGUXfqn0G/rya52wQaR7I
         BW1yu+k/kgBqDhbLoFSNCb6wTK6ZqTPGmJWHKpI6F+/dX4yZw3iz8+xI+irfvgzNIaxY
         gxcelgRVg2ufwzEZnchZ3LjW9mSjHzELPyV0x27aa/6gdBU4Z1JFu4GBtwh7CdcnDzwd
         XK3VMKAE0qqJHZ5oY5onKli3NjFQafzSRlNsyZCjpRt5M5pmeGyQUxE9H0/rfOiCt9A7
         RDVEGIb8mAKBrEyJV4C2rxZ0vWZjzThI5r2lB1KuIoXPgGyha66QjC1aQft+uNK0DKyB
         KM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715236396; x=1715841196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmaABryygHKi61pe95KisDbKOMR4+gIFPU4VfIf1H/s=;
        b=v1MXiKLL2xnnM+91N+louM3FVMkKbZ/uZI00Xk17UaidToe19Up2jHfqEXyoPIYZ3Y
         On8MKEbtOjEG5/5lF8J6q4ghNuiKXyJbaRdBQfJe/xXqgnOvzTninFUzGw1az4fGgxpX
         zahDVE15QVsQdZlPee5WX4OVjYrnYvWhG64EhFHJyu7sTw84pJMrQrUATzS0HhRI5/a3
         s/3eb/GuJ1YbXTNaqyOBVO1lXZJI5sygGxOo0DUPBtyTwRYKstCrSCNbYb7CTPWASp55
         wIKpRZH3uWuS2PL1G8G+hKvlZHcoD71nFToedn55wmnoHeX15kBY+xMHOIKsUUDaao/D
         3RXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMFRmls43y32ZvwhYmozlDKVIwQtZccqNT7C9obdf8yV3YU+oMLuy96lxvyhw5YyntHYNVmlo1czxvv4vD0p1kzDkNwAVXOFJF/8vU6b4j
X-Gm-Message-State: AOJu0YwVbU1+GOYm5aeKIY662jwMQkswWFJQMgpBwbiDWD5Qr3L3arvT
	phHhNEqPVOzPx4X2h7FyFRRMpjma7Ds9bgGkRXOVV5OAQF5A4hqM01+EgEelneFsjC0aj0WtS22
	cnPy5whcheCS0eydtHEWqtF7xVDbH2btl0SoR8g==
X-Google-Smtp-Source: AGHT+IEXJTVJqWuGMj45szsPBdEDa0ZZRrVrBfnBKFJJ+YWMRi72V45R4q79h8iLNNrsewGt1/l+6+fFu6D0Mt1TJUE=
X-Received: by 2002:a81:49c2:0:b0:615:1294:d6b6 with SMTP id
 00721157ae682-620861f37dbmr51700667b3.9.1715236396090; Wed, 08 May 2024
 23:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com> <ZjxMfQOqc8ML8nrD@sunil-laptop>
In-Reply-To: <ZjxMfQOqc8ML8nrD@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 9 May 2024 14:33:04 +0800
Message-ID: <CAEEQ3wkTR7BcnOn_iMzmj2_NejeaY=RymoUyu27A8TrXdHtQ9A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com, 
	john.garry@huawei.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_233319_341369_C5DA32C7 
X-CRM114-Status: GOOD (  23.22  )
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

SGkgU3VuaWwsCgpPbiBUaHUsIE1heSA5LCAyMDI0IGF0IDEyOjA54oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQg
YXQgMTE6NDM6MjlBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEJlZm9yZSBjYWNoZWlu
Zm8gY2FuIGJlIGJ1aWx0IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0aWFsaXplIGxldmVsCj4g
PiBhbmQgdHlwZS4gU2luY2UgUlNJQy1WIGN1cnJlbnRseSBkb2VzIG5vdCBoYXZlIGEgcmVnaXN0
ZXIgZ3JvdXAgdGhhdAo+Cj4gTklUOiBUeXBvIFJJU0MtVgpPa2F5LCBJJ2xsIHVwZGF0ZSBpdCBp
biB2NS4KCj4KPiA+IGRlc2NyaWJlcyBjYWNoZS1yZWxhdGVkIGF0dHJpYnV0ZXMgbGlrZSBBUk02
NCwgd2UgY2Fubm90IG9idGFpbiB0aGVtCj4gPiBkaXJlY3RseSwgc28gbm93IHdlIG9idGFpbiBj
YWNoZSBsZWF2ZXMgZnJvbSB0aGUgQUNQSSBQUFRUIHRhYmxlCj4gPiAoYWNwaV9nZXRfY2FjaGVf
aW5mbygpKSBhbmQgc2V0IHRoZSBjYWNoZSB0eXBlIHRocm91Z2ggc3BsaXRfbGV2ZWxzLgo+ID4K
PiA+IFN1Z2dlc3RlZC1ieTogSmVyZW15IExpbnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29tPgo+
ID4gU3VnZ2VzdGVkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyB8IDIyICsrKysrKysrKysrKysr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NhY2hlaW5mby5jCj4gPiBpbmRleCAzMGE2ODc4Mjg3YWQuLmU0N2ExZTZiZDNmZSAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwo+ID4gQEAgLTYsNiArNiw3IEBACj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2NwdS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4gICNpbmNsdWRl
IDxhc20vY2FjaGVpbmZvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+Cj4gQ2Fu
IHRoaXMgYmUgYWRkZWQgaW4gdGhlIG9yZGVyPyBMaWtlLCBpbmNsdWRlIGFjcGkuaCBwcmlvciB0
byBjcHUuaD8KT2theSwgSSdsbCB1cGRhdGUgaXQgaW4gdjUuCgo+Cj4gPiAgc3RhdGljIHN0cnVj
dCByaXNjdl9jYWNoZWluZm9fb3BzICpydl9jYWNoZV9vcHM7Cj4gPgo+ID4gQEAgLTc4LDYgKzc5
LDI3IEBAIGludCBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXModW5zaWduZWQgaW50IGNwdSkKPiA+ICAg
ICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcHJldiA9IE5VTEw7Cj4gPiAgICAgICBpbnQgbGV2ZWxz
ID0gMSwgbGV2ZWwgPSAxOwo+ID4KPiA+ICsgICAgIGlmICghYWNwaV9kaXNhYmxlZCkgewo+ID4g
KyAgICAgICAgICAgICBpbnQgcmV0LCBmd19sZXZlbHMsIHNwbGl0X2xldmVsczsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgcmV0ID0gYWNwaV9nZXRfY2FjaGVfaW5mbyhjcHUsICZmd19sZXZlbHMs
ICZzcGxpdF9sZXZlbHMpOwo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgIEJVR19PTigo
c3BsaXRfbGV2ZWxzID4gZndfbGV2ZWxzKSB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgKHNw
bGl0X2xldmVscyArIGZ3X2xldmVscyA+IHRoaXNfY3B1X2NpLT5udW1fbGVhdmVzKSk7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgIGZvciAoOyBsZXZlbCA8PSB0aGlzX2NwdV9jaS0+bnVtX2xldmVs
czsgbGV2ZWwrKykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChsZXZlbCA8PSBzcGxp
dF9sZXZlbHMpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNpX2xlYWZfaW5p
dCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9EQVRBLCBsZXZlbCk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjaV9sZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZUEVfSU5T
VCwgbGV2ZWwpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjaV9sZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZ
UEVfVU5JRklFRCwgbGV2ZWwpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAg
ICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgIH0KPiA+ICsK
PiBPdGhlciB0aGFuIGFib3ZlIG5pdHMsIGl0IGxvb2tzIGdvb2QgdG8gbWUuIFRoYW5rcyBmb3Ig
dGhlIHBhdGNoIQo+Cj4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWlj
cm8uY29tPgoKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
