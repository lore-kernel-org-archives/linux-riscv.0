Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E731EE81DE9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWho5zFcHZfofg752S1KDdH82R77S6hUFRkNXWS4S8A=; b=SiAhOB4ut1K1Ba
	Y1CxWD5t4HizsebxVXcvcMUpXAuTV7RpZ52lwPBQAaYXCG90NFMaiFyV5+9I0G97itq7+eD7cuEG1
	DWLTweqwGYlE0MMtdctpVkb0W+DqO9jaaFEdfTn9yYbC4QJm3sK28uLF4aIdR+TwHho8nCplY+8XA
	DWTUDOgTAQ7o54/hCKdQqUiqEgmBxCHlcBuNX4iXY4nsroaJ9sAtVP9RMOz7c+M8NOaHWCZSys6Az
	XJXx4pGJc+86AsBkpeMWMUnkW4AmvEQLoMMaQDlYyJAXqiV8jFP3WOddA3hyE2YZr6T+7/sC62BmP
	RdOvBJRAkICKTmQ++gEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qokFA-005oSi-0F;
	Fri, 06 Oct 2023 12:47:48 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qokF4-005oPp-39
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:47:46 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d868d8363e6so2389666276.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696596459; x=1697201259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE5lcMpcuRWxeOB9S6L9Si7YaWv5hLYl1VeNlBZzT/8=;
        b=rZhc0y6yReBUGEFPd7eMPdfK6CYMZvwu+4SjaXCIXfV0nRUHNwkJ7YYwiQOt9Bx+2N
         2PTFR4EpSyNg8VElMHuzFbpPF1yWUpGhZ4JHLvziyuSrCaLAs/fvI6hClR4vrogp8nSm
         Uxa90xicOw5eiNydGb/UsQ6wbQAqIXVWOzdR8HtoKDGocyC/+GjvSMwrVwrY1h05mxhc
         gIK4fmLnQ03J2gnYMNy76ee9OB3jgG3c8hfD1V3V3QVfBLnmmT0TWq7nn9iAmgB8qX5y
         Er7isCxuo6ys9fjohf2rXxKEB88saXEjGoK2zc3LpflbE22CUacRIW9AvPUDgrr0ooY4
         K+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596459; x=1697201259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE5lcMpcuRWxeOB9S6L9Si7YaWv5hLYl1VeNlBZzT/8=;
        b=kBuU4y9holOMvvOPW3wPydb9ADseYu55BOL8iPQA3njA024qoSt8ZHwxpkSn0TR68H
         ymCEGQ5NV+to2fztu072UA6sgP8cFRgqR0Dr0fmvfGJBM3iXiflkaeyfeGX9M98iC/uc
         uoOHCm9olMi3q2m4hSr7HJl0tpSidD2SPHnzcFTHWRqjuflmVCyFd0g/xvpGWSMlGCpz
         r681HSJPAm3KrzxFddozjrGIK+IArOhzTxPGTE5iasY1z1kW1/gr7gHkfmvwWupKM/iV
         h9Yi3A/GOValYu5uBXkQC/tDGVyFKuy6ujeOQ/8v+ACh43K6ttojFTIG9Dcb10mzRwPA
         1zzg==
X-Gm-Message-State: AOJu0YwQFsgv3gBVd5BzNuPWGPhT0a5Q+oZS9F98JmHkpOZfAKS79ge1
	D1Db35YHiFHFTbyDNx0fQdKh4H1TdI/hQ+guiyoKbA==
X-Google-Smtp-Source: AGHT+IGILgsJf+f8eayHVHqX0rISrGr9tP06v0nLvKR1oTcr5riaw9zUWCGoAJpDUWeKMDK50UY6pLVZ+E+8O7Aw+dY=
X-Received: by 2002:a5b:807:0:b0:d47:8db3:8bcf with SMTP id
 x7-20020a5b0807000000b00d478db38bcfmr7283393ybp.49.1696596458614; Fri, 06 Oct
 2023 05:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
 <ZR99K_ZuWXEtfDuR@google.com>
In-Reply-To: <ZR99K_ZuWXEtfDuR@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 6 Oct 2023 13:47:01 +0100
Message-ID: <CA+EHjTyDPEY7B_a8GC7RS8gzfoT2q9kJqJPuHB58ZXQ_61NGkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, KVM <kvm@vger.kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, KVMARM <kvmarm@lists.linux.dev>, 
	LinuxMIPS <linux-mips@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_054743_021266_7AE83453 
X-CRM114-Status: GOOD (  33.14  )
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

SGkgU2VhbiwKCk9uIEZyaSwgT2N0IDYsIDIwMjMgYXQgNDoyMeKAr0FNIFNlYW4gQ2hyaXN0b3Bo
ZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDA1LCAyMDIz
LCBGdWFkIFRhYmJhIHdyb3RlOgo+ID4gSGkgU2VhbiwKPiA+Cj4gPiBPbiBUdWUsIE9jdCAzLCAy
MDIzIGF0IDk6NTHigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4g
d3JvdGU6Cj4gPiA+ID4gTGlrZSBJIHNhaWQsIHBLVk0gZG9lc24ndCBuZWVkIGEgdXNlcnNwYWNl
IEFCSSBmb3IgbWFuYWdpbmcgUFJJVkFURS9TSEFSRUQsCj4gPiA+ID4ganVzdCBhIHdheSBvZiB0
cmFja2luZyBpbiB0aGUgaG9zdCBrZXJuZWwgb2Ygd2hhdCBpcyBzaGFyZWQgKGFzIG9wcG9zZWQg
dG8KPiA+ID4gPiB0aGUgaHlwZXJ2aXNvciwgd2hpY2ggYWxyZWFkeSBoYXMgdGhlIGtub3dsZWRn
ZSkuIFRoZSBzb2x1dGlvbiBjb3VsZCBzaW1wbHkKPiA+ID4gPiBiZSB0aGF0IHBLVk0gZG9lcyBu
b3QgZW5hYmxlIEtWTV9HRU5FUklDX01FTU9SWV9BVFRSSUJVVEVTLCBoYXMgaXRzIG93bgo+ID4g
PiA+IHRyYWNraW5nIG9mIHRoZSBzdGF0dXMgb2YgdGhlIGd1ZXN0IHBhZ2VzLCBhbmQgb25seSBz
ZWxlY3RzIEtWTV9QUklWQVRFX01FTS4KPiA+ID4KPiA+ID4gQXQgdGhlIHJpc2sgb2Ygb3ZlcnN0
ZXBwaW5nIG15IGJvdW5kcywgSSB0aGluayB0aGF0IGVmZmVjdGl2ZWx5IGdpdmluZyB0aGUgZ3Vl
c3QKPiA+ID4gZnVsbCBjb250cm9sIG92ZXIgd2hhdCBpcyBzaGFyZWQgdnMuIHByaXZhdGUgaXMg
YSBtaXN0YWtlLiAgSXQgbW9yZSBvciBsZXNzIGxvY2tzCj4gPiA+IHBLVk0gaW50byBhIHNpbmds
ZSBtb2RlbCwgYW5kIGV2ZW4gd2l0aGluIHRoYXQgbW9kZWwsIGRlYWxpbmcgd2l0aCBlcnJvcnMg
YW5kL29yCj4gPiA+IG1pc2JlaGF2aW5nIGd1ZXN0cyBiZWNvbWVzIHVubmVjZXNzYXJpbHkgcHJv
YmxlbWF0aWMuCj4gPiA+Cj4gPiA+IFVzaW5nIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMgbWF5
IG5vdCBwcm92aWRlIHZhbHVlICp0b2RheSosIGUuZy4gdGhlIHVzZXJzcGFjZQo+ID4gPiBzaWRl
IG9mIHBLVk0gY291bGQgc2ltcGx5ICJyZWZsZWN0IiBhbGwgY29udmVyc2lvbiBoeXBlcmNhbGxz
LCBhbmQgdGVybWluYXRlIHRoZQo+ID4gPiBWTSBvbiBlcnJvcnMuICBCdXQgdGhlIGNvc3QgaXMg
dmVyeSBtaW5pbWFsLCBlLmcuIGEgc2luZ2xlIGV4dHJhIGlvY3RsKCkgcGVyCj4gPiA+IGNvbnZl
cmlvbiwgYW5kIHRoZSB1cHNpZGUgaXMgdGhhdCBwS1ZNIHdvbid0IGJlIHN0dWNrIGlmIGEgdXNl
IGNhc2UgY29tZXMgYWxvbmcKPiA+ID4gdGhhdCB3YW50cyB0byBnbyBiZXlvbmQgImFsbCBjb252
ZXJzaW9uIHJlcXVlc3RzIGVpdGhlciBpbW1lZGlhdGVseSBzdWNjZWVkIG9yCj4gPiA+IHRlcm1p
bmF0ZSB0aGUgZ3Vlc3QiLgo+ID4KPiA+IE5vdyB0aGF0IEkgdW5kZXJzdGFuZCB0aGUgcHVycG9z
ZSBvZiBLVk1fU0VUX01FTU9SWV9BVFRSSUJVVEVTLCBJCj4gPiBhZ3JlZS4gSG93ZXZlciwgcEtW
TSBuZWVkcyB0byB0cmFjayBhdCB0aGUgaG9zdCBrZXJuZWwgKGkuZS4sIEVMMSkKPiA+IHdoZXRo
ZXIgZ3Vlc3QgbWVtb3J5IGlzIHNoYXJlZCBvciBwcml2YXRlLgo+Cj4gV2h5IGRvZXMgRUwxIG5l
ZWQgaXQncyBvd24gdmlldy9vcGluaW9uPyAgRS5nLiBpcyBpdCB0byBhdm9pZCBhIGFjY2Vzc2lu
ZyBkYXRhCj4gdGhhdCBpcyBzdGlsbCBwcml2YXRlIGFjY29yZGluZyB0byBFTDIgKG9uIGJlaGFs
ZiBvZiB0aGUgZ3Vlc3QpPwo+Cj4gQXNzdW1pbmcgdGhhdCdzIHRoZSBjYXNlLCB3aHkgY2FuJ3Qg
RUwxIHdhaXQgdW50aWwgaXQgZ2V0cyBjb25maXJtYXRpb24gZnJvbSBFTDIKPiB0aGF0IHRoZSBk
YXRhIGlzIGZ1bGx5IHNoYXJlZCBiZWZvcmUgZG9pbmcgd2hhdGV2ZXIgaXQgaXMgdGhhdCBuZWVk
cyB0byBiZSBkb25lPwo+Cj4gQWgsIGlzIHRoZSBwcm9ibGVtIHRoYXQgd2hldGhlciBvciBub3Qg
Lm1tYXAoKSBpcyBhbGxvd2VkIGtleXMgb2ZmIG9mIHRoZSBzdGF0ZQo+IG9mIHRoZSBtZW1vcnkg
YXR0cmlidXRlcz8gIElmIHRoYXQncyBzbywgdGhlbiB5ZWFoLCBhbiBpbnRlcm5hbCBmbGFnIGlu
IGF0dHJpYnV0ZXMKPiBpcyBwcm9iYWJseSB0aGUgd2F5IHRvIGdvLiAgSXQgZG9lc24ndCBuZWVk
IHRvIGJlIGEgImhvc3Qga2VybmVsIHByaXZhdGUiIGZsYWcKPiB0aG91Z2gsIGUuZy4gYW4gSU5f
RkxVWCBmbGFnIHRvIGNhcHR1cmUgdGhhdCB0aGUgYXR0cmlidXRlcyBhcmVuJ3QgZnVsbHkgcmVh
bGl6ZWQKPiBtaWdodCBiZSBtb3JlIGludHVpdGl2ZSBmb3IgcmVhZGVycywgYW5kIG1pZ2h0IGhh
dmUgdXRpbGl0eSBmb3Igb3RoZXIgYXR0cmlidXRlcwo+IGluIHRoZSBmdXR1cmUgdG9vLgoKWWVz
LCBpdCdzIGJlY2F1c2Ugb2YgbW1hcC4gSSB0aGluayB0aGF0IGFuIElOX0ZMVVggZmxhZyBtaWdo
dCB3b3JrCmhlcmUuIEknbGwgaGF2ZSBhIGdvIGF0IGl0IGFuZCBzZWUgaG93IGl0IHR1cm5zIG91
dC4KClRoYW5rcywKL2Z1YWQKCj4KPiA+IE9uZSBhcHByb2FjaCB3b3VsZCBiZSB0byBhZGQgYW5v
dGhlciBmbGFnIHRvIHRoZSBhdHRyaWJ1dGVzIHRoYXQKPiA+IHRyYWNrcyB0aGUgaG9zdCBrZXJu
ZWwgdmlldy4gVGhlIHdheSBLVk1fU0VUX01FTU9SWV9BVFRSSUJVVEVTIGlzCj4gPiBpbXBsZW1l
bnRlZCBub3csIHVzZXJzcGFjZSBjYW4gemVybyBpdCwgc28gaW4gdGhhdCBjYXNlLCB0aGF0Cj4g
PiBvcGVyYXRpb24gd291bGQgbmVlZCB0byBiZSBtYXNrZWQgdG8gYXZvaWQgdGhhdC4KPiA+Cj4g
PiBBbm90aGVyIGFwcHJvYWNoIHdvdWxkIGJlIHRvIGhhdmUgYSBwS1ZNLXNwZWNpZmljIHhhcnJh
eSAob3Igc2ltaWxhcikKPiA+IHRvIGRvIHRoZSB0cmFja2luZywgYnV0IHNpbmNlIHRoZXJlIGlz
IGEgc3RydWN0dXJlIHRoYXQncyBhbHJlYWR5Cj4gPiBkb2luZyBzb21ldGhpbmcgc2ltaWxhciAo
aS5lLix0aGUgYXR0cmlidXRlcyBhcnJheSksIGl0IHNlZW1zIGxpa2UgaXQKPiA+IHdvdWxkIGJl
IHVubmVjZXNzYXJ5IG92ZXJoZWFkLgo+ID4KPiA+IERvIHlvdSBoYXZlIGFueSBpZGVhcyBvciBw
cmVmZXJlbmNlcz8KPiA+Cj4gPiBDaGVlcnMsCj4gPiAvZnVhZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
