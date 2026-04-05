Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D667E9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 22:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOdc718w6oHchi1fk7hvTRltlyCGVLIQBVT/2cO2cGA=; b=tAIbE1/fbv+xKX
	KAxqJY8WiZV4kB+CosCB4AhNlIEXVWExCvH5I4YgaX8lITlA0uDWBjC9qpBF8GrfZmq0LjGcnP7al
	u8PcW4gK77ZUCknti4bkXzbmlx6878J2J/vTcoSf95IHMtlwEXYBSo82ASiJmzMTJA/sJICBnhbSo
	6UqGtNMya02sIhsblDOkMixMI23AV2cPq7qn/GPydDNTcT/D5D30jB1L5+A5xO9hgLPAzJDH576Hh
	TiA9q+dAzomItF7oofu+ngAL5GHoG1MoZoeGb58tzV+TNO66nIPbwk+AmorG58y/Kgc5Gc/WxRDaf
	HmSLJTKELcvkqZ55uKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9WJ3-00000004XNb-1t87;
	Sun, 05 Apr 2026 22:51:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9WJ0-00000004XN9-34Fb
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 22:50:59 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b9bff57cb62so552493266b.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775429456; x=1776034256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=mGyXaXI5shehBOmcuhUqmZ+qpy8B+oOEKv6bsXcEG3MyHK5G7+afu7aRooakG8ARdp
         XMtOKjSM+2xA1xr/1P5Uc1unbztuN4q82g/5vQXYfgUNtLz6zTlZWF9O4ZcTpPEKnkKH
         F61LN/qIrrk/G9tooPFZbot1koY3mv0ZWABVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775429456; x=1776034256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=jrvfgxQKMbvBcOBIa1CRCXDPl+L1Fiqicr4FbmUYiqhc8xrmk9w0v5nzrCPMZ4lZkQ
         jPcFVikQfinkx78GzMtPozWZGEV91E+Jg//0ENgyo+avS6DdgUcqKVR1sN7pZzbQO54S
         GoqmC7+YOL1aIvT/woiSEtjPKq7dsxM18fjGjIxlyp8sg3sdkpgYykw87HuvFm7Vzwx2
         4srIujmoX+yA+SLXTmomqG+3+fJLodU80h5kEulRb0QgO4zFvCBOy2TMbaLolpULVB3n
         cxiMlxoN19lFjfB91OzOHcYDBwiwv8kxJOjFHdoDv3L9Dl1fyY5UqpYNDu13ikoVtCNy
         oPPA==
X-Forwarded-Encrypted: i=1; AJvYcCWOf78AW4IKEKQUZ2bPOuqqrgcbKjhMbu5gCe1BilkEhYt1A0A5lWGRXJvxjFmbVp7SuqCueUmY2+sCMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfO4MFYxlgPn6lXbbd2/PM/iaeT9lEDj6m84aBkIwO4hwMI74d
	CY5V6NKt9uqB9nwtnBrzpqX5NkigCeHOyTah1wBUZqBS1BcbopnjRdo3kCS7V9Y3dOt/My1s9zW
	fkODXyj+Z
X-Gm-Gg: AeBDievbaOQ38vwyzKH1TfygZJNZP3veBsiCkH3hoqmL3r1RLrFdRu4kZNfy2urUrvQ
	aIhVLx665Yd5slG+nDnuc/n+2FAuLLbxHGvV1I6Gu4Ykfeq+fMxwxdkmWJpxFzp86q8+62TBKod
	6QDk5Sw4j43CKPb69a18jzswiFVX/yRse7zQjMcdnPbXmC4SWdmsgUzr6JGm0HGw/45mCaQDaK5
	B8kJDL0SU/rA2bQxlODcCMJW4xbWIgWhyy1vY9PnmzxBq1Wj3EWH8nrt9SzbRqmMsPqjOietL9g
	tInU6uj8CoChA4FOYZ+DV7VrO7IHgakNNBf9EQ9Suwz+NwrdwaiaqyfA8gmD9Sdav4kaNbxrO7a
	ZX4FBAtnpFt6jyx3F9bexCqy+KFw9xzZL5wdLPmxqaZoMXlw6cQE0AI7XE2IyhFFmkl2R+cAt9C
	OgmVVFrZTLzezDC88VHCXfo32o1fCZiT8Prh6pDskXesApcJlQEn/LrEWdX+p/QA==
X-Received: by 2002:a17:906:ee83:b0:b8f:ae35:cbdf with SMTP id a640c23a62f3a-b9c67b67376mr580090266b.48.1775429456396;
        Sun, 05 Apr 2026 15:50:56 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c97219dsm422506466b.5.2026.04.05.15.50.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:50:56 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso6183366a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 15:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+8z/2LTprh7UdlxJike5U48WqHFBGIMnZlp8SrbA8m4DkiXr8JeV+Yf66E/23Arcd87fulrarhB2KPA==@lists.infradead.org
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id
 ffacd0b85a97d-43d292d34e1mr14051064f8f.29.1775429026066; Sun, 05 Apr 2026
 15:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org> <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
X-Gm-Features: AQROBzBHjVedWun0AWH98b5RajBbraAAaRvLQSenEhaNEY8p1Czch8mAczvPiQQ
Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_155058_814765_46052386 
X-CRM114-Status: GOOD (  27.31  )
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

SGksCgpPbiBTYXQsIEFwciA0LCAyMDI2IGF0IDEwOjI44oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFu
CjxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAwMywg
MjAyNiBhdCAwNTowNDo1NFBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gTk9U
RTogb25lIHBvdGVudGlhbGx5ICJjb250cm92ZXJzaWFsIiBjaG9pY2UgSSBtYWRlIGluIHNvbWUg
cGF0Y2hlcwo+ID4gd2FzIHRvIGFsd2F5cyByZXNlcnZlIGEgZmxhZyBJRCBldmVuIGlmIGEgZmxh
ZyBpcyBvbmx5IHVzZWQgdW5kZXIKPiA+IGNlcnRhaW4gQ09ORklHXyBzZXR0aW5ncy4gVGhpcyBp
cyBhIGNoYW5nZSBmcm9tIGhvdyB0aGluZ3Mgd2VyZQo+ID4gYmVmb3JlLiBLZWVwaW5nIHRoZSBu
dW1iZXJpbmcgY29uc2lzdGVudCBhbmQgYWxsb3dpbmcgZWFzeQo+ID4gY29tcGlsZS10ZXN0aW5n
IG9mIGJvdGggQ09ORklHIHNldHRpbmdzIHNlZW1lZCB3b3J0aCBpdCwgZXNwZWNpYWxseQo+ID4g
c2luY2UgaXQgd29uJ3QgdGFrZSB1cCBhbnkgZXh0cmEgc3BhY2UgdW50aWwgd2UndmUgYWRkZWQg
YSBsb3QgbW9yZQo+ID4gZmxhZ3MuCj4KPiBOYWgsIHRoaXMgaXMgZmluZSwgSSBkb24ndCBzZWUg
YW55IHByb2JsZW1zIHdpdGggdGhpcyBhcyB0aGUgb3JpZ2luYWwKPiBjb2RlIGtpbmQgb2Ygd2Fz
IGRvaW5nIHRoZSBzYW1lIHRoaW5nIHdpdGggdGhlICJob2xlIiBpbiB0aGUgc3RydWN0dXJlCj4g
aWYgdGhvc2Ugb3B0aW9ucyB3ZXJlIG5vdCBlbmFibGVkLgo+Cj4gPiBJIG9ubHkgbWFya2VkIHRo
ZSBmaXJzdCBwYXRjaCBhcyBhICJGaXgiIHNpbmNlIGl0IGlzIHRoZSBvbmx5IG9uZQo+ID4gZml4
aW5nIG9ic2VydmVkIHByb2JsZW1zLiBPdGhlciBwYXRjaGVzIGNvdWxkIGJlIGNvbnNpZGVyZWQg
Zml4ZXMgdG9vCj4gPiBpZiBmb2xrcyB3YW50Lgo+ID4KPiA+IEkgdGVzdGVkIHRoZSBmaXJzdCBw
YXRjaCBpbiB0aGUgc2VyaWVzIGJhY2twb3J0ZWQgdG8ga2VybmVsIDYuNiBvbiB0aGUKPiA+IFBp
eGVsIHBob25lIHRoYXQgd2FzIGV4cGVyaWVuY2luZyB0aGUgcmFjZS4gSSBhZGRlZCBleHRyYSBw
cmludG91dHMgdG8KPiA+IG1ha2Ugc3VyZSB0aGF0IHRoZSBwcm9ibGVtIHdhcyBoaXR0aW5nIC8g
YWRkcmVzc2VkLiBUaGUgcmVzdCBvZiB0aGUKPiA+IHBhdGNoZXMgYXJlIHRlc3RlZCB3aXRoIGFs
bG1vZGNvbmZpZyB3aXRoIGFybTMyLCBhcm02NCwgcHBjLCBhbmQKPiA+IHg4Ni4gSSBib290IHRl
c3RlZCBvbiBhbiBhcm02NCBDaHJvbWVib29rIHJ1bm5pbmcgbWFpbmxpbmUuCj4KPiBJJ20gZ3Vl
c3NpbmcgeW91ciB0ZXN0cyBwYXNzZWQ/ICA6KQoKWXVwLCBhbGwgdGhlIHRlc3RzIHRoYXQgSSd2
ZSBydW4gaGF2ZSBwYXNzZWQuIEkgYWxzbyB0aHJldyBpbiBhbgoiYWxsbm9jb25maWciIGNvbXBp
bGUgdGVzdCBqdXN0IGZvciBnb29kIG1lYXN1cmUuCgoKPiBBbnl3YXksIHRoaXMgbG9va3MgZ3Jl
YXQsIHVubGVzcyB0aGVyZSBhcmUgYW55IG9iamVjdGlvbnMsIG90aGVyIHRoYW4KPiB0aGUgIm5l
ZWRzIHRvIGJlIHVuZGVmaW5lZCIsIHdoaWNoIGEgZm9sbG93LW9uIHBhdGNoIGNhbiBoYW5kbGUs
IEknbGwKPiBxdWV1ZSB0aGVtIHVwIG5leHQgd2VlayBmb3IgNy4xLXJjMS4KClRoYW5rcy4gQXMg
cGVyIHRoZSBvdGhlciB0aHJlYWQsIEknbSBoYXBweSBpZiB5b3Ugb3IgRGFuaWxvIHdhbnQgdG8K
YXBwbHkgaXQsIGFuZCBJJ20gaGFwcHkgaWYgeW91IHdhbnQgdG8gbWFrZSBtaW5vciBmaXh1cHMg
d2hlbgphcHBseWluZy4KCldoZW4gSSBzZWUgdGhlIHBhdGNoZXMgYXBwbGllZCwgSSdsbCBzZW5k
IGEgZm9sbG93dXAgcGF0Y2ggdG8gYWRkcmVzcwp0aGUgIm5lZWRzIHRvIGJlIHVuZGVmaW5lZCIg
Y29tbWVudCwgdW5sZXNzIERhbmlsbyBtYWtlcyB0aGF0IGNoYW5nZQpoaW1zZWxmIHdoZW4gYXBw
bHlpbmcuCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
