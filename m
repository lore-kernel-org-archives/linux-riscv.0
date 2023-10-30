Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C35C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9SOsefkvPed1Ymiyk9psC3vpjXlpqmqbUewcDikxZY=; b=m46+RdBGI+iFnh
	IISoifCJVYCuhA3P18jAKWm9QCDXvMeJUvIGESBqZovpqOJrEVKqVN2+KXbISIVxCayXB9ol4F1+O
	ZSRoCQMexX90W3DCDFy/SUrLpFVGJhwPTxCbEkpVerl9GvcYHcgkDUD7HcNrxmd5BAkPUTtkPWpxD
	F8zYq61sRfqPHXgWb6Oz49DwcoRzn3BE1+HmOo4JGJ0Hjm+zKkBZQh2s3RvsUGUFon1FNXVquyUdB
	me71tDZKc2HkXKlb31R9xZSUm5ggU8OYXWEnobbyzFkZnuN/XjtvdtE/BNqy1O58i9RXWOcfjMX8M
	mo6HsSaNfFZJaNgKZb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVdp-003i6D-2a;
	Mon, 30 Oct 2023 17:01:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVdl-003i4V-1X
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 17:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698685284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySiJbXtvuo/ap347BrtctuG5UsffPvyxiWszBOWPpzU=;
	b=ISCSkS+nQsr6eWynoby3mOPf0wNmep2EKnPErYXcAFZUpljLr1y3xsCtHXFB5A300DxpTC
	W66WVQCs1WIUjCdKxFg/UkcPOZZeqVbEe5DKpqiaCqFwfH8n0tvHF3ifxC3jIz2ZhCgyz7
	kCPkdJS1CtBWWB8UO9w1QIhhmoRCpQA=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-YKbGW4eINDyRKwRF508KQA-1; Mon, 30 Oct 2023 13:01:16 -0400
X-MC-Unique: YKbGW4eINDyRKwRF508KQA-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1d66b019a27so6490778fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 10:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698685266; x=1699290066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySiJbXtvuo/ap347BrtctuG5UsffPvyxiWszBOWPpzU=;
        b=YfkDaBQ0RaFwkvYx17/wdDAmPFUgMvX+bq8+0gGLJsu+lPAt5r/AxSooIlo6/VlWpR
         iwSLQUtY4ekiNWdNeq16Gyh60kpouNAnlQlFTUQigBS2F2SYATDln+Qxx+mv7a3tl93l
         /KRgmWnZWHj9kOtbIjafHBxqKhBNlTubsmrTVL2QjvtM2PEKW5jnOPfWkcLHdzrgsomP
         d+B6iUrl2/FEJoFc2F7FAxxyCKxWM/B8UXBbCxMy3A0ri90ZQRBksPn+Q/w207ql9c+B
         B2WjRjZRf205dInexWU/vVw3x4ig4bAMVfrTWjN++zIIpj/2ZuaqgB8RjDFBvpzfGeW+
         EsOA==
X-Gm-Message-State: AOJu0YwPr1R9FEiNs3463mQMxRVy/tnLlPPMZEjAF9PAviMtHQk0eQFE
	QPPo8bE8dQen1Onwux4Ab6vn6/5Zf8eBHEYnsfLGItvYYeLEtDNMVk3wm/T4IVWthJ+++BMUVpj
	Eoe0Af7oS4+h66dIUSQeHxLevDQqD1EoBuSW5dz4ZujF3
X-Received: by 2002:a05:6871:5c45:b0:1ea:3f79:defb with SMTP id os5-20020a0568715c4500b001ea3f79defbmr14807520oac.52.1698685265955;
        Mon, 30 Oct 2023 10:01:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUXzp0cSzQuFI/AWzKwhXt4UU+QvY8z/fyApz/M7sPoBiF5GZjJ7SszJVxAGAXDpAW5+AxTqFEaHAzsc1Bic=
X-Received: by 2002:a05:6871:5c45:b0:1ea:3f79:defb with SMTP id
 os5-20020a0568715c4500b001ea3f79defbmr14807416oac.52.1698685264406; Mon, 30
 Oct 2023 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com>
In-Reply-To: <ZT_fnAcDAvuPCwws@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:00:49 +0100
Message-ID: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To: David Matlack <dmatlack@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_100125_584599_74978E6E 
X-CRM114-Status: GOOD (  19.06  )
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

T24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgNTo1M+KAr1BNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy0xMC0yNyAxMToyMSBBTSwgU2VhbiBDaHJp
c3RvcGhlcnNvbiB3cm90ZToKPiA+IEZyb206IENoYW8gUGVuZyA8Y2hhby5wLnBlbmdAbGludXgu
aW50ZWwuY29tPgo+ID4KPiA+IEN1cnJlbnRseSBpbiBtbXVfbm90aWZpZXIgaW52YWxpZGF0ZSBw
YXRoLCBodmEgcmFuZ2UgaXMgcmVjb3JkZWQgYW5kCj4gPiB0aGVuIGNoZWNrZWQgYWdhaW5zdCBi
eSBtbXVfbm90aWZpZXJfcmV0cnlfaHZhKCkgaW4gdGhlIHBhZ2UgZmF1bHQKPiA+IGhhbmRsaW5n
IHBhdGguIEhvd2V2ZXIsIGZvciB0aGUgdG8gYmUgaW50cm9kdWNlZCBwcml2YXRlIG1lbW9yeSwg
YSBwYWdlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl4KPgo+IElzIHRoZXJlIGEgbWlzc2luZyB3b3JkIGhlcmU/CgpObyBidXQgdGhlcmUgY291bGQg
YmUgbWlzc2luZyBoeXBoZW5zICgiZm9yIHRoZSB0by1iZS1pbnRyb2R1Y2VkCnByaXZhdGUgbWVt
b3J5Iik7IHBvc3NpYmx5IGEgInNvb24iIGNvdWxkIGhlbHAgcGFyc2luZyBhbmQgdGhhdCBpcwp3
aGF0IHlvdSB3ZXJlIHRhbGtpbmcgYWJvdXQ/Cgo+ID4gICAgICAgaWYgKGxpa2VseShrdm0tPm1t
dV9pbnZhbGlkYXRlX2luX3Byb2dyZXNzID09IDEpKSB7Cj4gPiArICAgICAgICAgICAgIGt2bS0+
bW11X2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgPSBJTlZBTElEX0dQQTsKPiA+ICsgICAgICAgICAg
ICAga3ZtLT5tbXVfaW52YWxpZGF0ZV9yYW5nZV9lbmQgPSBJTlZBTElEX0dQQTsKPgo+IEkgZG9u
J3QgdGhpbmsgdGhpcyBpcyBpbmNvcnJlY3QsIGJ1dCBJIHdhcyBhIGxpdHRsZSBzdXByaXNlZCB0
byBzZWUgdGhpcwo+IGhlcmUgcmF0aGVyIHRoYW4gaW4gZW5kKCkgd2hlbiBtbXVfaW52YWxpZGF0
ZV9pbl9wcm9ncmVzcyBkZWNyZW1lbnRzIHRvCj4gMC4KCkkgdGhpbmsgdGhhdCB3b3VsZCBiZSBp
bmNvcnJlY3Qgb24gdGhlIHZlcnkgZmlyc3Qgc3RhcnQ/Cgo+ID4gKyAgICAgfQo+ID4gK30KPiA+
ICsKPiA+ICt2b2lkIGt2bV9tbXVfaW52YWxpZGF0ZV9yYW5nZV9hZGQoc3RydWN0IGt2bSAqa3Zt
LCBnZm5fdCBzdGFydCwgZ2ZuX3QgZW5kKQo+ID4gK3sKPiA+ICsgICAgIGxvY2tkZXBfYXNzZXJ0
X2hlbGRfd3JpdGUoJmt2bS0+bW11X2xvY2spOwo+Cj4gRG9lcyB0aGlzIGNvbXBpbGUvZnVuY3Rp
b24gb24gS1ZNIGFyY2hpdGVjdHVyZXMgd2l0aAo+ICFLVk1fSEFWRV9NTVVfUldMT0NLPwoKWWVz
OgoKI2RlZmluZSBsb2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKGwpICAgIFwKICAgICAgICBsb2Nr
ZGVwX2Fzc2VydChsb2NrZGVwX2lzX2hlbGRfdHlwZShsLCAwKSkKCndoZXJlIDAgaXMgdGhlIGxv
Y2staGVsZCB0eXBlIHVzZWQgYnkgbG9ja19hY3F1aXJlX2V4Y2x1c2l2ZS4gSW4gdHVybgppcyB3
aGF0IHlvdSBnZXQgZm9yIGEgc3BpbmxvY2sgb3IgbXV0ZXgsIGluIGFkZGl0aW9uIHRvIGEgcnds
b2NrIG9yCnJ3c2VtIHRoYXQgaXMgdGFrZW4gZm9yIHdyaXRlLgoKSW5zdGVhZCwgbG9ja2RlcF9h
c3NlcnRfaGVsZCgpIGFzc2VydHMgdGhhdCB0aGUgbG9jayBpcyB0YWtlbiB3aXRob3V0CmFzc2Vy
dGluZyBhIHBhcnRpY3VsYXIgbG9jay1oZWxkIHR5cGUuCgo+ID4gQEAgLTgzNCw2ICs4NTEsMTIg
QEAgdm9pZCBrdm1fbW11X2ludmFsaWRhdGVfZW5kKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQg
bG9uZyBzdGFydCwKPgo+IExldCdzIGFkZCBhIGxvY2tkZXBfYXNzZXJ0X2hlbGRfd3JpdGUoJmt2
bS0+bW11X2xvY2spIGhlcmUgdG9vIHdoaWxlCj4gd2UncmUgYXQgaXQ/CgpZZXMsIGdvb2QgaWRl
YS4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
