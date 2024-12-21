Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7654E7718B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpBBCq/M4ZvBp2i0PZ30pYmPklB+Xs54kDm7FsKHa6I=; b=L0eDauq22XWyRF
	fS6RyjOU1p7Z6W29dC1w8fVx9VmbVU/qj9C8mD31/kD80sn39p7qvxYZH/oXCZ21SNjAJySeb+vkD
	nilvlnTbk4bq+MNkCbpyCBrapKb5clBxMsB+DtVcUsQsJge6SxAGNq8F1RmjyYrvNV3qnnlPI29fO
	uFLFZoRBvCLbIUy1lPntDTjeo5ti5FPURYsLYX/BuNwCuJM3265Id6UDO3T7bvcf9aOyZF/MkeBpz
	IfsRAIHuKQqOlDVwXA3TpmT5DqeDDrbiOnj+V3jHw0wUXO+92kTbNxsfukj//cEJgBDStomag7g3f
	KL2vPu5Sonzay4QW4gOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0AT-000000072d5-3NoB;
	Sat, 21 Dec 2024 14:09:21 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0AQ-000000072cK-3qHx;
	Sat, 21 Dec 2024 14:09:20 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a7ccb2c618so1452598fac.2;
        Sat, 21 Dec 2024 06:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734790157; x=1735394957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBog1LJdntPo57cyHdGkHydPz04prdcJbkki5MzpWU=;
        b=KUwkwe1OXDEcj2PDkf1t+AgGx44QyXKKP6X3y3OsiunAMHLXQWxP9nWk7XqCXv2Bih
         Mc5RkciSn3Qp+dB6cuKRVhaIJGzX9n8+PGZD00C0nZsoi8Y3ZOCHGkQVChNWfSCBn5+w
         AeKUnSd1mb6rxpcv+fnJBf5CcqR/qIrRqT0EqJkCCecDhgmiTBVXixDpsVmd6reZ9UfJ
         Ch+tXELTnRq57uwdksbJ6a/UjDLEbzF/yVsRWEkrF0xIP2MGEKDluEfMc6NTfig9grjH
         Mw4T7QpHYFlwOw2zNIVXmvP+PpM/vN+fgIqPd+4YjIlfF+i0S7aiwpmxRflScohQ4lL4
         VwHw==
X-Forwarded-Encrypted: i=1; AJvYcCVmgbY1JiVUkNHLNIQ5msTh5qBcghOZapgSSpASZ/aQ3SgvDCtQcrnZghDvFkiWVbSYFVNBSXdWQUnqAtQ=@lists.infradead.org, AJvYcCW1wJo/O38HyccTKouFtf3TijXKSGADyCsEsXdeIj+DvaPcXrIl+wQoL+HlddweiN37nSvyw6j4Uah1e8ANL5P3@lists.infradead.org, AJvYcCWwNbfhk36E8dMkDT+oSFvMOJ8xCNaSDOtsT7WPeobrE3iqkVR2uvcTZzKkKxxCVH67YTCQ5845EeU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsKvlBlY2LvagnXdc3kLOPBDEpx5qVtqKq9heKAeCaic7qJe73
	7Y6sqSpXauVdALTwu8vJsyDIg3a7ttr9Z6uoHUYVzYMYmaUiTeQ07L8YVPnU
X-Gm-Gg: ASbGncvpCOfPUVAYES1Kg8ecQbQEcYCtA+7WntLV04lQALJzt4kSZsn6jB5c4q2gBBr
	P4I1q2c/Q/Kn+/JR4QLVPruwYnsdz+2NBMxWVjk65lNIk4pMVsc4MdqLiB4v85UPAim5ftxL6aA
	RSIFz7ZCrfapzM7itq1BszTGLEuaeeqC/FXSrMN21+M9NSK3jfUHi3AemuGYMDogA63PBlR2pBr
	KtLTCWbDtZQeu5Lkzv8MjgWNt71Xf9UHf4VEg+WGj0wKPOPh9LRORfdWelLXuTA2dfufvUGuUMt
	gDl/2nSxYXVJiCIP9ho=
X-Google-Smtp-Source: AGHT+IHzXPd9afD5N6v6cuNVvgBw32yVL7gNMhb2fpCksbBT647FEDE4Zxygzk+/7AEqUxkS4jY7qA==
X-Received: by 2002:a05:6870:8928:b0:29e:6814:19d with SMTP id 586e51a60fabf-2a7fb18a63emr3989789fac.9.1734790156711;
        Sat, 21 Dec 2024 06:09:16 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d751095esm1528015fac.22.2024.12.21.06.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 06:09:16 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71ded02b779so1443360a34.2;
        Sat, 21 Dec 2024 06:09:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCgBvXesTyQ39YecdBkIN4Uq0VcJPtUfi+1fXd/1YELTbl84GUptznZitCIhGIuwWYJdh0Ykv5zjE=@lists.infradead.org, AJvYcCVHp5bsMmqBroaJBQXPk9rQtjVsAJhPNmBDaJweVBXl5teno5dtgoR2fC5oqi4ON+YeZNQJauC2Sh/N914=@lists.infradead.org, AJvYcCWKVqnVpN6RkJs8TRlse6jFXDZU3sxaqqBX/ForK+1oO+weOL4x9guZjRrU2el51kI498gogMq46I/hzzjyZm23@lists.infradead.org
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr7064126137.5.1734789822327; Sat, 21 Dec 2024
 06:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
In-Reply-To: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Dec 2024 15:03:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_060918_961409_19251D96 
X-CRM114-Status: GOOD (  21.89  )
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

SGkgR3VvLAoKT24gU2F0LCBEZWMgMjEsIDIwMjQgYXQgMTE6NDPigK9BTSBHdW8gV2Vpa2FuZwo8
Z3Vvd2Vpa2FuZy5rZXJuZWxAZ21haWwuY29tPiB3cm90ZToKPiBCZWZvcmUgU0xVQiBpbml0aWFs
aXphdGlvbiwgdmFyaW91cyBzdWJzeXN0ZW1zIHVzZWQgbWVtYmxvY2tfYWxsb2MgdG8KPiBhbGxv
Y2F0ZSBtZW1vcnkuIEluIG1vc3QgY2FzZXMsIHdoZW4gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMs
IGFuIGltbWVkaWF0ZQo+IHBhbmljIGlzIHJlcXVpcmVkLiBUbyBzaW1wbGlmeSB0aGlzIGJlaGF2
aW9yIGFuZCByZWR1Y2UgcmVwZXRpdGl2ZSBjaGVja3MsCj4gaW50cm9kdWNlIGBtZW1ibG9ja19h
bGxvY19vcl9wYW5pY2AuIFRoaXMgZnVuY3Rpb24gZW5zdXJlcyB0aGF0IG1lbW9yeQo+IGFsbG9j
YXRpb24gZmFpbHVyZXMgcmVzdWx0IGluIGEgcGFuaWMgYXV0b21hdGljYWxseSwgaW1wcm92aW5n
IGNvZGUKPiByZWFkYWJpbGl0eSBhbmQgY29uc2lzdGVuY3kgYWNyb3NzIHN1YnN5c3RlbXMgdGhh
dCByZXF1aXJlIHRoaXMgYmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gV2Vpa2FuZyA8
Z3Vvd2Vpa2FuZy5rZXJuZWxAZ21haWwuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21lbWJs
b2NrLmgKPiBAQCAtNDE3LDYgKzQxNywyMCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQg
Km1lbWJsb2NrX2FsbG9jKHBoeXNfYWRkcl90IHNpemUsIHBoeXNfYWRkcl90IGFsaWduKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNQkxPQ0tfQUxMT0NfQUNDRVNT
SUJMRSwgTlVNQV9OT19OT0RFKTsKPiAgfQo+Cj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCAqX19tZW1ibG9ja19hbGxvY19vcl9wYW5pYyhwaHlzX2FkZHJfdCBzaXplLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJf
dCBhbGlnbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqZnVuYykKPiArewo+ICsgICAgICAgdm9pZCAqYWRkciA9IG1l
bWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiArCj4gKyAgICAgICBpZiAodW5saWtlbHkoIWFk
ZHIpKQo+ICsgICAgICAgICAgICAgICBwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbGx1
IGJ5dGVzXG4iLCBmdW5jLCBzaXplKTsKPiArICAgICAgIHJldHVybiBhZGRyOwo+ICt9CgpQbGVh
c2UgbWFrZSB0aGlzIG91dC1vZi1saW5lLCBhbmQgbW92ZSBpdCB0byBtbS9tZW1ibG9jay5jLCBz
byB3ZSBoYXZlCmp1c3QgYSBzaW5nbGUgY29weSBpbiB0aGUgZmluYWwgYmluYXJ5LgoKPiArCj4g
KyNkZWZpbmUgbWVtYmxvY2tfYWxsb2Nfb3JfcGFuaWMoc2l6ZSwgYWxpZ24pICAgIFwKPiArICAg
ICAgICBfX21lbWJsb2NrX2FsbG9jX29yX3BhbmljKHNpemUsIGFsaWduLCBfX2Z1bmNfXykKPiAr
Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCAqbWVtYmxvY2tfYWxsb2NfcmF3KHBoeXNfYWRkcl90IHNp
emUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlz
X2FkZHJfdCBhbGlnbikKPiAgewo+IGRpZmYgLS1naXQgYS9pbml0L21haW4uYyBiL2luaXQvbWFp
bi5jCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
