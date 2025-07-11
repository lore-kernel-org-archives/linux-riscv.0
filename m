Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC650C83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pplcfq+r/vU7p4sZk9q6K8lvLAaS7jZBPg/UGWMQnHc=; b=kPowmBZIaNsA/m
	9v/HRbNzHr1f5cQKmmNhWpUSOqNzkf1vo/nPhhHpstBuJFfR8HsCmZ72V+sHAL29wmLfp6bFKs13S
	PaV0CYt4n7pfxY5mhixt+qe3RMWj7xUxVdLZPq2GtNUH6vFc7ofygHIWuvHwZ4qt9oF7wJc7oKMXP
	Cn0ijtNTS8SaIpV2dtKCHHnWFw8HXWaMca05fqyGROl6xMeWuIjOfAMtKt0fZtPuTtWlNsiQtANtS
	tiEDnbl9GBA+Rn7uA48gIts2m69HwTyeM7NC/2eo1FSeqJy++vDlAEw/LcnzUIrIfTJ+961vIzvP6
	8Lu/c4WeEf14X4AWvacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDRW-0000000EpTz-1GLW;
	Fri, 11 Jul 2025 13:05:34 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDRT-0000000EpST-2U0F
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 13:05:32 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-8797652b1f2so100613039f.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752239130; x=1752843930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJE3CLjEeonNUb8mT2xwmsMp3adhwfxqmRNHfpesc2o=;
        b=GAFxoNmPZ9ao7NrAIoG7Sahe+7G15kFqx5Sezn2LIdR20vy55/0xIB9gcz/Ks4wKZG
         fvNQQHHcUJESB5GCq1iO91qJVZI14DIuQuwqgfbMYMl92X2YRl5LrBhUL45bieiklUEX
         ouMu/lFbMIpcCWC0vKaGeEWSNXzGB/1n9kNCTGG85pzFOXwcfq5QuL1qpOIIGDOoBE2Y
         0SizqbXvSrD1sRafgKDTnfwFf9CmPNKljdhORtXcBTSt4H21iE6IcWFXVMiAdFcJJzZM
         OQ+RcEQzWgqlgSLF7SU0R09Rbd8QdIqZnohYC3Nabwcvw6+B4p8ADO2s/wCSuV4oSbOc
         me8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752239130; x=1752843930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJE3CLjEeonNUb8mT2xwmsMp3adhwfxqmRNHfpesc2o=;
        b=s2/rho/HXGh0uZvgTLz5y7kcskC8r/zsTLBW6FI7xUzZ4J1CrwLbSIgK4ixJZyHq7p
         4BPeNYXE9iUYlnXmpshWfL9/108JRNHpe2qwLa5QIRjwW//8dDoASIsHFnCcJ3bXK6aG
         HjXbM/Q8dJxge8MKoQle2JZO901psdmFzH+ZMpzdaqIwE39h53FwsjIerITmYBZ6vFTh
         b3of8KU+CHInohDAjVDiQw86ZzsXRjFVzewPkj7Hrb7+/cK3WTDxWn3Vt4/eOtfmtjcj
         z4+LOCwLYKDjpYlD5e7/4eaotH7BSm7iaFJ4zzb4+UF8kjQ/8ucVQy7WLdeZfsQD3O0i
         vWBA==
X-Forwarded-Encrypted: i=1; AJvYcCXjG99vpol40KKxOdzhh0VFYeQj3/hu8XTUTAY2a7GFbBxm6j7+Zgo7P4B8Ja+pNFYfdbdftgTv1j5qtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGODKeTZW8Z709OZymQb646282x9YwCq9Wk5GktEeKujx4rzg6
	C4xmBWwhtPk6zOGjSdDA0tW+l6BlBSpnJkcBOvBMsKQqzRKTp071VX7pr7t2gXY5Wl6mBx0tGN7
	OHYEVEseHghldPKufffLW4VGKWNTxWHl6xoBPPCPY4g==
X-Gm-Gg: ASbGncugggThHf4ti0ebp708fwHxUkLNOkHSLEG+358okNFJ9i3qBESu2Ohcz/RCuss
	FQGJ9mSwhIJQRdRvnKsqUfF2XUeJ13r1hX7NjiTZAzH9xmOW70oFyYWLeo7rpbBa+LUntxK8O/G
	RVoUfWqy3k8IE6d+8lBHSmoi6jZl1Uolkx/LlKAH9/Z1H/xGKxIGUt/ch2r2kBNVCekmXhsNnO2
	K8YwqAL
X-Google-Smtp-Source: AGHT+IEPU9SyMA3ByH+HpMG+YsQr79SQw8svyUaMdhj2IE3tiGFc6RjWYvNGPYPV7cSMIf3tPt5HkTmZtilB6ri5/o4=
X-Received: by 2002:a05:6e02:2682:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3e253341fe2mr44338105ab.18.1752239130172; Fri, 11 Jul 2025
 06:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250707035345.17494-1-apatel@ventanamicro.com>
In-Reply-To: <20250707035345.17494-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jul 2025 18:35:17 +0530
X-Gm-Features: Ac12FXwUE-a6Xf4G6F5Wb87U6THpUu9QoAOdL2yGtZJMrmr3dB1cTnbnWmVVvS8
Message-ID: <CAAhSdy17yUD=7aMcX2VuFHm+1-TQ6jhwsnPJAQsGS_AmmP1WCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Few timer and AIA fixes for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_060531_867472_9094B6E3 
X-CRM114-Status: GOOD (  16.23  )
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

T24gTW9uLCBKdWwgNywgMjAyNSBhdCA5OjIz4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIFJJU0MtViBQcml2aWxlZ2VkIHNwZWNpZmljYWl0
b24gc2F5cyB0aGUgZm9sbG93aW5nOiAiV0ZJIGlzIGFsc28KPiByZXF1aXJlZCB0byByZXN1bWUg
ZXhlY3V0aW9uIGZvciBsb2NhbGx5IGVuYWJsZWQgaW50ZXJydXB0cyBwZW5kaW5nCj4gYXQgYW55
IHByaXZpbGVnZSBsZXZlbCwgcmVnYXJkbGVzcyBvZiB0aGUgZ2xvYmFsIGludGVycnVwdCBlbmFi
bGUgYXQKPiBlYWNoIHByaXZpbGVnZSBsZXZlbC4iCj4KPiBCYXNlZCBvbiB0aGUgYWJvdmUsIGlm
IHRoZXJlIGlzIHBlbmRpbmcgVlMtdGltZXIgaW50ZXJydXB0IHdoZW4gdGhlCj4gaG9zdCAoYWth
IEhTLW1vZGUpIGV4ZWN1dGVzIFdGSSB0aGVuIHN1Y2ggYSBXRkkgd2lsbCBzaW1wbHkgYmVjb21l
IE5PUAo+IGFuZCBub3QgZG8gYW55dGhpbmcuIFRoaXMgcmVzdWx0IGluIFFFTVUgUklTQy1WIGNv
bnN1bWluZyBhIGxvdCBvZiBDUFUKPiB0aW1lIG9uIHRoZSB4ODYgbWFjaGluZSB3aGVyZSBpdCBp
cyBydW5uaW5nLiBUaGUgUEFUQ0gxIHNvbHZlcyB0aGlzCj4gaXNzdWUgYnkgYWRkaW5nIGFwcHJv
cHJpYXRlIGNsZWFudXAgaW4gS1ZNIFJJU0MtViB0aW1lciB2aXJ0dWFsaXphdGlvbi4KPgo+IEFz
IGEgcmVzdWx0IFBBVENIMSwgcmFjZSBjb25kaXRpb25zIGluIHVwZGF0aW5nIEhHRUlbRXxQXSBD
U1JzIHdoZW4gYQo+IFZDUFUgaXMgbW92ZWQgZnJvbSBvbmUgaG9zdCBDUFUgdG8gYW5vdGhlciBh
cmUgYmVpbmcgb2JzZXJ2ZWQgb24gUUVNVQo+IHNvIHRoZSBQQVRDSDIgdHJpZXMgdG8gbWluaW1p
emUgdGhlIGNoYW5jZXMgb2YgdGhlc2UgcmFjZSBjb25kaXRpb25zLgo+Cj4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiAgLSBBZGRlZCBtb3JlIGRldGFpbHMgYWJvdXQgcmFjZSBjb25kaXRpb24gaW4gUEFU
Q0gyIGNvbW1pdCBkZXNjcmlwdGlvbi4KPgo+IEFudXAgUGF0ZWwgKDIpOgo+ICAgUklTQy1WOiBL
Vk06IERpc2FibGUgdnN0aW1lY21wIGJlZm9yZSBleGl0aW5nIHRvIHVzZXItc3BhY2UKPiAgIFJJ
U0MtVjogS1ZNOiBNb3ZlIEhHRUlbRXxQXSBDU1IgYWNjZXNzIHRvIElNU0lDIHZpcnR1YWxpemF0
aW9uCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggfCAgNCArKy0KPiAgYXJj
aC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICAgICAgfCA1MSArKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgICAgICB8IDQ1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAg
ICAgfCAgMiAtLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgICAgICB8IDE2ICsrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMo
LSkKPgoKUXVldWVkIHRoaXMgc2VyaWVzIGFzIGZpeGVzIGZvciBMaW51eC02LjE2CgpJIGhhdmUg
dGFrZW4gY2FyZSBvZiB0aGUgY29tbWVudCBvbiBQQVRDSDIgYXQgdGhlIHRpbWUgb2YgcXVldWlu
Zy4KClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
