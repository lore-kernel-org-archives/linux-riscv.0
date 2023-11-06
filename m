Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA14C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oDHbPXA+0DJbvMgUmY/oJofcQk2oKhMcVi9gf+55do=; b=ph+gpCtdlRDHVu
	R8NNia2EBzhrrSK/BAH8q+rmiTbWXrd6x4p3WY5dMnaM1mK/OxngxjGrAle15i4fit8mGdodouAsA
	eoHCkqBsDq+UoxXKrvRIxVNOO2ogLbaAg/9yekwUVXnyi2fZ7eMaMAQzTpQW+QlYUQTppy2sikb7k
	NyPYW/3AKTosCrRBC1DkmbT3bSA6voQyf5oi8Ld8q7wHOKIaFrYMB79/j545OkPXP+8hxn2nAO2DR
	JCXbsCn4DIsmzU1emMSdIdqGmw7ygZtjMUWKMbsls1eeKAURG0We324Lhv6o2NMT2o7KjgnO07r3Y
	O/3Wrd6hDBlcFIAUIZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r02IT-00H5fY-0E;
	Mon, 06 Nov 2023 16:17:53 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r02IO-00H5cz-32
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 16:17:50 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d190a8f87so30187286d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287466; x=1699892266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUV8zKIdpTV0f8ZMhx633GQ2l+XRSBNMcsvYJoEfTx4=;
        b=FqLbPwga7FnNfFW2bcSh8T0aVXS3S7XFAWVVYvk0KUbbm38yO6q6u81MxFw3OECtyK
         wZVrKU2cjUii898RCt4gYYa6RAh9dcODRT5952DB80oxAFyRFsjWQi/7wI/XJZaN2fGk
         01OprthIZaUQIyvsPHtawquTuTFOw936mqiahiy0EVtDh14q8sKVfHoLILoflJMXM8BM
         +iPBdJi4j0xj6UEouF/qwXOx+gvdiH12saELYXqnxU6uMnIvOMJwwbANWyqWfhG1QMs5
         8dzsg4kNy9hyAWIz3eB8c4OsmfR4w8E1h07Mgdnkbp5LelzHOpSRE2QrlA5vWNBres87
         n4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287466; x=1699892266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUV8zKIdpTV0f8ZMhx633GQ2l+XRSBNMcsvYJoEfTx4=;
        b=toZw0b6VS80h6XsSkNQzTgE85SjjVWVo762XmvTVISdgtv76SwtUXM6ENtScZ/uIBD
         8lW1ezdwAhbTWsyuhqCra0XXC7LJ7OI0yw/OA1F6NTRRz3cCpNwfN9tToJGEM1kIyIyz
         uagXaZyNtm4aRim0fQAj1IeTQ/L6svXE+lkXN2UlfNyLTZBQzYHHIYdLsJMEMX51JQ3B
         2/OBVgtLj/7W2+kuAbRAo7Us1e5O1IziG6RlvAfhg/lnStUTgIhKXyFUsmImUlTXdSGU
         1V3xcEryI739yk0YAwHHpTz1Lyr27zaZUdoimaAWSCcwKjRrgfrEZDW7/dXPmA0ys7eO
         sWRg==
X-Gm-Message-State: AOJu0YzxoAaxgcdhISLA5jnyWYhjjm6RGRgub/lKtyhFizZAfDEED/KT
	LESsnKLqw1hUb76UT9MJyUw8YyK1QyZOMuTWWENyXw==
X-Google-Smtp-Source: AGHT+IFFqaeUa+zb1fqYMH2SBG8qERPcG1V2EKOvlLONFWJF+9JT7SC3ACnaIHdf6fX4zUtKFZJjWCRYHGHhXFDqHvM=
X-Received: by 2002:ad4:5c83:0:b0:670:9f8d:f7be with SMTP id
 o3-20020ad45c83000000b006709f8df7bemr44676404qvh.13.1699287465633; Mon, 06
 Nov 2023 08:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
 <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com> <ZUkOgdTMbH40XFGE@google.com>
In-Reply-To: <ZUkOgdTMbH40XFGE@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 16:17:09 +0000
Message-ID: <CA+EHjTzc4zwN1atU1mSnbi3Lvb0c83MATQSk1uSWxae2iKi0aw@mail.gmail.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
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
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_081749_003101_B5743749 
X-CRM114-Status: GOOD (  17.94  )
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

T24gTW9uLCBOb3YgNiwgMjAyMyBhdCA0OjA04oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMDYsIDIwMjMsIEZ1YWQgVGFi
YmEgd3JvdGU6Cj4gPiBPbiBTdW4sIE5vdiA1LCAyMDIzIGF0IDQ6MzTigK9QTSBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogU2VhbiBD
aHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gPiA+Cj4gPiA+IEFkZCBhICJ2bV9z
aGFwZSIgc3RydWN0dXJlIHRvIGVuY2Fwc3VsYXRlIHRoZSBzZWxmdGVzdHMtZGVmaW5lZCAibW9k
ZSIsCj4gPiA+IGFsb25nIHdpdGggdGhlIEtWTS1kZWZpbmVkICJ0eXBlIiBmb3IgdXNlIHdoZW4g
Y3JlYXRpbmcgYSBuZXcgVk0uICAibW9kZSIKPiA+ID4gdHJhY2tzIHBoeXNpY2FsIGFuZCB2aXJ0
dWFsIGFkZHJlc3MgcHJvcGVydGllcywgYXMgd2VsbCBhcyB0aGUgcHJlZmVycmVkCj4gPiA+IGJh
Y2tpbmcgbWVtb3J5IHR5cGUsIHdoaWxlICJ0eXBlIiBjb3JyZXNwb25kcyB0byB0aGUgVk0gdHlw
ZS4KPiA+ID4KPiA+ID4gVGFraW5nIHRoZSBWTSB0eXBlIHdpbGwgYWxsb3cgYWRkaW5nIHRlc3Rz
IGZvciBLVk1fQ1JFQVRFX0dVRVNUX01FTUZELAo+ID4gPiBhLmsuYS4gZ3Vlc3QgcHJpdmF0ZSBt
ZW1vcnksIHdpdGhvdXQgbmVlZGluZyBhbiBlbnRpcmVseSBzZXBhcmF0ZSBzZXQgb2YKPiA+ID4g
aGVscGVycy4gIEd1ZXN0IHByaXZhdGUgbWVtb3J5IGlzIGVmZmVjdGl2ZWx5IHVzYWJsZSBvbmx5
IGJ5IGNvbmZpZGVudGlhbAo+ID4gPiBWTSB0eXBlcywgYW5kIGl0J3MgZXhwZWN0ZWQgdGhhdCB4
ODYgd2lsbCBkb3VibGUgZG93biBhbmQgcmVxdWlyZSB1bmlxdWUKPiA+ID4gVk0gdHlwZXMgZm9y
IFREWCBhbmQgU05QIGd1ZXN0cy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gPiA+IE1lc3NhZ2UtSWQ6IDwyMDIzMTAy
NzE4MjIxNy4zNjE1MjExLTMwLXNlYW5qY0Bnb29nbGUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+Cj4gPiBu
aXQ6IGFzIGluIGEgcHJpb3Igc2VsZnRlc3QgY29tbWl0IG1lc3NhZ2VzLCByZWZlcmVuY2VzIGlu
IHRoZSBjb21taXQKPiA+IG1lc3NhZ2UgdG8gZ3Vlc3QgX3ByaXZhdGVfIG1lbW9yeS4gU2hvdWxk
IHRoZXNlIGJlIGNoYW5nZWQgdG8ganVzdAo+ID4gZ3Vlc3QgbWVtb3J5Pwo+Cj4gSG1tLCBubywg
InByaXZhdGUiIGlzIG1vc3RseSBhcHByb3ByaWF0ZSBoZXJlLiAgQXQgdGhpcyBwb2ludCBpbiB0
aW1lLCBvbmx5IHg4Ngo+IHN1cHBvcnRzIEtWTV9DUkVBVEVfR1VFU1RfTUVNRkQsIGFuZCB4ODYg
b25seSBzdXBwb3J0cyBpdCBmb3IgcHJpdmF0ZSBtZW1vcnkuCj4gQW5kIHRoZSBwdXJwb3NlIG9m
IGxldHRpbmcgeDg2IHNlbGZ0ZXN0cyBzcGVjaWZ5IEtWTV9YODZfU1dfUFJPVEVDVEVEX1ZNLCBp
LmUuCj4gdGhlIHJlYXNvbiB0aGlzIHBhdGNoIGV4aXN0cywgaXMgcHVyZWx5IHRvIGdldCBwcml2
YXRlIG1lbW9yeS4KPgo+IE1heWJlIHR3ZWFrIHRoZSBzZWNvbmQgcGFyYWdyYXBoIHRvIHRoaXM/
Cj4KPiBUYWtpbmcgdGhlIFZNIHR5cGUgd2lsbCBhbGxvdyBhZGRpbmcgdGVzdHMgZm9yIEtWTV9D
UkVBVEVfR1VFU1RfTUVNRkQKPiB3aXRob3V0IG5lZWRpbmcgYW4gZW50aXJlbHkgc2VwYXJhdGUg
c2V0IG9mIGhlbHBlcnMuICBBdCB0aGlzIHRpbWUsCj4gZ3Vlc3RfbWVtZmQgaXMgZWZmZWN0aXZl
bHkgdXNhYmxlIG9ubHkgYnkgY29uZmlkZW50aWFsIFZNIHR5cGVzIGluIHRoZQo+IGZvcm0gb2Yg
Z3Vlc3QgcHJpdmF0ZSBtZW1vcnksIGFuZCBpdCdzIGV4cGVjdGVkIHRoYXQgeDg2IHdpbGwgZG91
YmxlIGRvd24KPiBhbmQgcmVxdWlyZSB1bmlxdWUgVk0gdHlwZXMgZm9yIFREWCBhbmQgU05QIGd1
ZXN0cy4KCnNndG0KL2Z1YWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
