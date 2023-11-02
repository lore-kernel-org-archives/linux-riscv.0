Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A20AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XZsb7JeXTNIVY3T5vCnZ43qXP/Q7PZen+MpWJchRwzE=; b=u1YsXvtnF80V26tE0zPnFU7Fmr
	DG9u8LyN1ApvKR1tYfWCB1pWq1X40dGEOQXMK1GIjFBHr+LJDFBuhBPCp/QOBF9fBsOHU+zSRPxd6
	mvgWWDNAEfQbPEgQD66DpGpEnfCxT77W2fUejKzuDWr4Y1+FstmvkfMtpaHTpY5PEjNmAPBM3vu6d
	M7zSGtwvob8Xa0oCYi2drW+GpO0z039gac5LNNBm9DaQkHFgMbvlHfxkeZk9249obHG0AdyXhb/F9
	dwh/Ig+iIcFh/bYzUU4MkpOkVFv7Jr4g2V/aTWbt8ZOxriM0NtfAiyz8zJRPsK0jAFOAiInBNijij
	B8//6sWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybdS-009zRW-2x;
	Thu, 02 Nov 2023 17:37:38 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybdP-009zNp-1V
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 17:37:37 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc2ebc3b3eso8917865ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 10:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698946651; x=1699551451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN1ssLkZHjDTrGZRWby6miGmTEsoKqfVN3YbqYw1LLA=;
        b=BBdLtxJnaotx+0awbo42X18NDzSHHxFKba0JQH810CBqTgkLjk0H+VV/A2hW+/QNiA
         PUkSkBAkJNrJRIlA86J+08pRVb5ytptuLbuwso1wTH+49Am+rOKIegD7W//LZNeDJ04x
         AzCzDcwVRCLSBBi9dT8pn8kTU0RlopCYT1rRscYtTqvJ1J4dZYOL9HAn45yyVK19kba4
         A6Atn82W1vz+uqEJfSJZVFzwY2HbvY5gcrQS3c6gcwjTgsak3Va/AB6o1SGYC6EbbVFi
         4ckzYHVjxPmcTGM71G4YZpyvjz0XxgxrrBDwgeczJh6exNwwiVyo8h1e4TR1KoYUaE1w
         SEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946651; x=1699551451;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uN1ssLkZHjDTrGZRWby6miGmTEsoKqfVN3YbqYw1LLA=;
        b=ouWxPJqOr+SSm/0LhiuK7TLW9hqMehp+vzDRmpYv833QJlrGlrlgk4AxIkPQCR0tXY
         3u3qJk+p0H0l5q+MBf0oKQF/Oep18riODRe8DNd9DVOqJ7VSLXMJ4/FByrSajjiWAqJl
         sYz279eWDsj2k48FW6je/EB0j3jsNa31TxDd3F/WPatUvFknb3SelmK3H4mNesk177t4
         0REJuFMcy0j1LYCNjPwgTXm0pnh2w92Ihk2WvfuER6YgR5VPuPzdugVPiTLxmZNRYmto
         en/mF3POP9v2WlUvn1UPCMTFjnhNRsqO7Jfje/zYjiXxyWMBcGow9RGW3zHS8eRWkbga
         apXw==
X-Gm-Message-State: AOJu0YzQ4q4zHLyir2suK4faxmYeIHLzcqy/g+DQgQ0Cm32bk0XdAWpZ
	UaISX5cnecQiAERTPQPYOZDu7d0sy/s=
X-Google-Smtp-Source: AGHT+IHO2BmoMwEG0Z4p7dUErvps7DbkHqeEBbdPqNa8vmvQCAafmC1+rihoFOkAVlqXxxzUlxPm8WkwUZU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:25d2:b0:1cc:2ffe:5a27 with SMTP id
 jc18-20020a17090325d200b001cc2ffe5a27mr287356plb.9.1698946650780; Thu, 02 Nov
 2023 10:37:30 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:37:29 -0700
In-Reply-To: <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
 <6642c379-1023-4716-904f-4bbf076744c2@redhat.com> <ZUPIXt1XzZrriswG@google.com>
 <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Message-ID: <ZUPeWTdbMhvMO4QL@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
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
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_103735_503985_C96F833F 
X-CRM114-Status: GOOD (  35.91  )
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

T24gVGh1LCBOb3YgMDIsIDIwMjMsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gT24gVGh1LCBOb3Yg
MiwgMjAyMyBhdCA5OjAz4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTm92IDAyLCAyMDIzLCBQYW9sbyBCb256aW5pIHdy
b3RlOgo+ID4gPiBPbiAxMC8zMS8yMyAyMzozOSwgRGF2aWQgTWF0bGFjayB3cm90ZToKPiA+ID4g
PiA+ID4gTWF5YmUgY2FuIHlvdSBza2V0Y2ggb3V0IGhvdyB5b3Ugc2VlIHRoaXMgcHJvcG9zYWwg
YmVpbmcgZXh0ZW5zaWJsZSB0bwo+ID4gPiA+ID4gPiB1c2luZyBndWVzdF9tZW1mZCBmb3Igc2hh
cmVkIG1hcHBpbmdzPwo+ID4gPiA+ID4gRm9yIGluLXBsYWNlIGNvbnZlcnNpb25zLCBlLmcuIHBL
Vk0sIG5vIGFkZGl0aW9uYWwgZ3Vlc3RfbWVtZmQgaXMgbmVlZGVkLiAgV2hhdCdzCj4gPiA+ID4g
PiBtaXNzaW5nIHRoZXJlIGlzIHRoZSBhYmlsaXR5IHRvIChzYWZlbHkpIG1tYXAoKSBndWVzdF9t
ZW1mZCwgZS5nLiBLVk0gbmVlZHMgdG8KPiA+ID4gPiA+IGVuc3VyZSB0aGVyZSBhcmUgbm8gb3V0
c3RhbmRpbmcgcmVmZXJlbmNlcyB3aGVuIGNvbnZlcnRpbmcgYmFjayB0byBwcml2YXRlLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEZvciBURFgvU05QLCBhc3N1bWluZyB3ZSBkb24ndCBmaW5kIGEgcGVy
Zm9ybWFudCBhbmQgcm9idXN0IHdheSB0byBkbyBpbi1wbGFjZQo+ID4gPiA+ID4gY29udmVyc2lv
bnMsIGEgc2Vjb25kIGZkK29mZnNldCBwYWlyIHdvdWxkIGJlIG5lZWRlZC4KPiA+ID4gPiBJcyB0
aGVyZSBhIHdheSB0byBzdXBwb3J0IG5vbi1pbi1wbGFjZSBjb252ZXJzaW9ucyB3aXRoaW4gYSBz
aW5nbGUgZ3Vlc3RfbWVtZmQ/Cj4gPiA+Cj4gPiA+IEZvciBURFgvU05QLCB5b3UgY291bGQgaGF2
ZSBhIGhvb2sgZnJvbSBLVk1fU0VUX01FTU9SWV9BVFRSSUJVVEVTIHRvIGd1ZXN0Cj4gPiA+IG1l
bW9yeS4gIFRoZSBob29rIHdvdWxkIGludmFsaWRhdGUgbm93LXByaXZhdGUgcGFydHMgaWYgdGhl
eSBoYXZlIGEgVk1BLAo+ID4gPiBjYXVzaW5nIGEgU0lHU0VHVi9FRkFVTFQgaWYgdGhlIGhvc3Qg
dG91Y2hlcyB0aGVtLgo+ID4gPgo+ID4gPiBJdCB3b3VsZCBmb3JiaWQgbWFwcGluZ3MgZnJvbSBt
dWx0aXBsZSBnZm5zIHRvIGEgc2luZ2xlIG9mZnNldCBvZiB0aGUKPiA+ID4gZ3Vlc3RfbWVtZmQs
IGJlY2F1c2UgdGhlbiB0aGUgc2hhcmVkIHZzLiBwcml2YXRlIGF0dHJpYnV0ZSB3b3VsZCBiZSB0
aWVkIHRvCj4gPiA+IHRoZSBvZmZzZXQuICBUaGlzIHNob3VsZCBub3QgYmUgYSBwcm9ibGVtOyBm
b3IgZXhhbXBsZSwgaW4gdGhlIGNhc2Ugb2YgU05QLAo+ID4gPiB0aGUgUk1QIGFscmVhZHkgcmVx
dWlyZXMgYSBzaW5nbGUgbWFwcGluZyBmcm9tIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyB0bwo+ID4g
PiBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLgo+ID4KPiA+IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNh
biB3b3JrLiAgSXQncyBub3QgYSBNOjEgc2NlbmFyaW8gKHdoZXJlIE0gaXMgbXVsdGlwbGUgZ2Zu
cyksCj4gPiBpdCdzIGEgMTpOIHNjZW5hcmlvICh3aGVyZW4gTiBpcyBtdWx0aXBsZSBvZmZzZXRz
KS4gIFRoZSAqZ2ZuKiBkb2Vzbid0IGNoYW5nZSBvbgo+ID4gYSBjb252ZXJzaW9uLCB3aGF0IG5l
ZWRzIHRvIGNoYW5nZSB0byBkbyBub24taW4tcGxhY2UgY29udmVyc2lvbiBpcyB0aGUgcGZuLCB3
aGljaAo+ID4gaXMgZWZmZWN0aXZlbHkgdGhlIGd1ZXN0X21lbWZkK29mZnNldCBwYWlyLgo+ID4K
PiA+IFNvIHllcywgd2UgKmNvdWxkKiBzdXBwb3J0IG5vbi1pbi1wbGFjZSBjb252ZXJzaW9ucyB3
aXRoaW4gYSBzaW5nbGUgZ3Vlc3RfbWVtZmQsCj4gPiBidXQgaXQgd291bGQgcmVxdWlyZSBhIHNl
Y29uZCBvZmZzZXQsCj4gCj4gV2h5IGNhbid0IEtWTSBmcmVlIHRoZSBleGlzdGluZyBwYWdlIGF0
IGd1ZXN0X21lbWZkK29mZnNldCBhbmQKPiBhbGxvY2F0ZSBhIG5ldyBvbmUgd2hlbiBkb2luZyBu
b24taW4tcGxhY2UgY29udmVyc2lvbnM/CgpPaCwgSSBzZWUgd2hhdCB5b3UncmUgc3VnZ2VzdGlu
Zy4gIEV3dy4KCkl0J3MgY2VydGFpbmx5IHBvc3NpYmxlLCBidXQgaXQgd291bGQgbGFyZ2VseSBk
ZWZlYXQgdGhlIHB1cnBvc2Ugb2Ygd2h5IHdlIGFyZQphZGRpbmcgZ3Vlc3RfbWVtZmQgaW4gdGhl
IGZpcnN0IHBsYWNlLgoKRm9yIFREWCBhbmQgU05QLCB0aGUgZ29hbCBpcyB0byBwcm92aWRlIGEg
c2ltcGxlLCByb2J1c3QgbWVjaGFuaXNtIGZvciBpc29sYXRpbmcKZ3Vlc3QgcHJpdmF0ZSBtZW1v
cnkgc28gdGhhdCBpdCdzIGFsbCBidXQgaW1wb3NzaWJsZSBmb3IgdGhlIGhvc3QgdG8gYWNjZXNz
IHByaXZhdGUKbWVtb3J5LiAgQXMgdGhpbmdzIHN0YW5kLCBtZW1vcnkgZm9yIGEgZ2l2ZW4gZ3Vl
c3RfbWVtZmQgaXMgZWl0aGVyIHByaXZhdGUgb3Igc2hhcmVkCihhc3N1bWluZyB3ZSBzdXBwb3J0
IGEgc2Vjb25kIGd1ZXN0X21lbWZkIHBlciBtZW1zbG90KS4gIEkuZS4gdGhlcmUncyBubyBuZWVk
IHRvCnRyYWNrIHdoZXRoZXIgYSBnaXZlbiBwYWdlL2ZvbGlvIGluIHRoZSBndWVzdF9tZW1mZCBp
cyBwcml2YXRlIHZzLiBzaGFyZWQuCgpXZSBjb3VsZCB1c2UgbWVtb3J5IGF0dHJpYnV0ZXMsIGJ1
dCB0aGF0IGZ1cnRoZXIgY29tcGxpY2F0ZXMgdGhpbmdzIHdoZW4gaW50cmFob3N0Cm1pZ3JhdGlv
biAoYW5kIHBvdGVudGlhbGx5IG90aGVyIG11bHRpLXVzZXIgc2NlbmFyaW9zKSBjb21lcyBhbG9u
ZywgaS5lLiB3aGVuIEtWTQpzdXBwb3J0cyBsaW5raW5nIG11bHRpcGxlIGd1ZXN0X21lbWZkIGZp
bGVzIHRvIGEgc2luZ2xlIGlub2RlLiAgV2UnZCBoYXZlIHRvIGVuc3VyZQp0aGF0IGFsbCAic3Ry
dWN0IGt2bSIgaW5zdGFuY2VzIGhhdmUgaWRlbnRpY2FsIFBSSVZBVEUgYXR0cmlidXRlcyBmb3Ig
YSBnaXZlbgoqb2Zmc2V0KiBpbiB0aGUgaW5vZGUuICBJJ20gbm90IGV2ZW4gc3VyZSBob3cgZmVh
c2libGUgdGhhdCBpcyBmb3IgaW50cmFob3N0Cm1pZ3JhdGlvbiwgYW5kIHRoYXQncyB0aGUgKmVh
c3kqIGNhc2UsIGJlY2F1c2UgSUlSQyBpdCdzIGFscmVhZHkgYSBoYXJkIHJlcXVpcmVtZW50CnRo
YXQgdGhlIHNvdXJjZSBhbmQgZGVzdGluYXRpb24gaGF2ZSBpZGVudGljYWwgZ25mPT5ndWVzdF9t
ZW1mZCBiaW5kaW5ncywgaS5lLiBLVk0KY2FuIHNvbWV3aGF0IGVhc2lseSByZWFzb24gYWJvdXQg
Z2ZuIGF0dHJpYnV0ZXMuCgpCdXQgZXZlbiB0aGVuLCB0aGF0IG9ubHkgaGVscHMgd2l0aCB0aGUg
YWN0dWFsIG1pZ3JhdGlvbiBvZiB0aGUgVk0sIGUuZy4gd2UnZCBzdGlsbApoYXZlIHRvIGZpZ3Vy
ZSBvdXQgaG93IHRvIGRlYWwgd2l0aCAubW1hcCgpIGFuZCBvdGhlciBzaGFyZWQgdnMuIHByaXZh
dGUgYWN0aW9ucwp3aGVuIGxpbmtpbmcgYSBuZXcgZ3Vlc3RfbWVtZmQgZmlsZSBhZ2FpbnN0IGFu
IGV4aXN0aW5nIGlub2RlLgoKSSBoYXZlbid0IHNlZW4gdGhlIHBLVk0gcGF0Y2hlcyBmb3Igc3Vw
cG9ydGluZyAubW1hcCgpLCBzbyBtYXliZSB0aGlzIGlzIGFscmVhZHkKYSBzb2x2ZWQgcHJvYmxl
bSwgYnV0IEknZCBob25lc3RseSBiZSBxdWl0ZSBzdXJwcmlzZWQgaWYgaXQgYWxsIHdvcmtzIGNv
cnJlY3RseQppZi93aGVuIEtWTSBzdXBwb3J0cyBtdWx0aXBsZSBmaWxlcyBwZXIgaW5vZGUuCgpB
bmQgSSBkb24ndCBzZWUgd2hhdCB2YWx1ZSBub24taW4tcGxhY2UgY29udmVyc2lvbnMgd291bGQg
YWRkLiAgVGhlIHZhbHVlIGFkZGVkCmJ5IGluLXBsYWNlIGNvbnZlcnNpb25zLCBhc2lkZSBmcm9t
IHRoZSBvYnZpb3VzIHByZXNlcnZhdGlvbiBvZiBkYXRhLCB3aGljaCBpc24ndApyZWxldmFudCB0
byBURFgvU05QLCBpcyB0aGF0IGl0IGRvZXNuJ3QgcmVxdWlyZSBmcmVlaW5nIGFuZCByZWFsbG9j
YXRpbmcgbWVtb3J5CnRvIGF2b2lkIGRvdWJsZS1hbGxvY2F0aW5nIGZvciBwcml2YXRlIHZzLiBz
aGFyZWQuICBUaGF0J3MgZXNwZWNpYWx5IHF1aXRlIG5pY2UKd2hlbiBodWdlcGFnZXMgYXJlIGJl
aW5nIHVzZWQgYmVjYXVzZSByZWNvbnN0aXR1aW5nIGEgaHVnZXBhZ2UgIm9ubHkiIHJlcXVpcmVz
CnphcHBpbmcgU1BURXMuCgpCdXQgaWYgS1ZNIGlzIGZyZWVpbmcgdGhlIHByaXZhdGUgcGFnZSwg
aXQncyB0aGUgc2FtZSBhcyBwdW5jaGluZyBhIGhvbGUsIHByb2JhYmx5CnF1aXRlIGxpdGVyYWxs
eSwgd2hlbiBtYXBwaW5nIHRoZSBnZm4gYXMgc2hhcmVkLiAgSW4gZXZlcnkgd2F5IEkgY2FuIHRo
aW5rIG9mLCBpdCdzCndvcnNlLiAgRS5nLiBpdCdzIG1vcmUgY29tcGxleCBmb3IgS1ZNLCBhbmQg
dGhlIFBVTkNIX0hPTEUgPT4gYWxsb2NhdGlvbiBvcGVyYXRpb25zCm11c3QgYmUgc2VyaWFsaXpl
ZC4KClJlZ2FyZGluZyBkb3VibGUtYWxsb2NhdGluZywgSSByZWFsbHksIHJlYWxseSB0aGluayB3
ZSBzaG91bGQgc29sdmUgdGhhdCBpbiB0aGUKZ3Vlc3QuICBJLmUuIHRlYWNoIExpbnV4LWFzLWEt
Z3Vlc3QgdG8gYWdncmVzc2l2ZWx5IGNvbnZlcnQgYXQgMk1pQiBncmFudWxhcml0eQphbmQgYXZv
aWQgNEtpQiBjb252ZXJzaW9ucy4gIDRLaUIgY29udmVyc2lvbnMgYXJlbid0IGp1c3QgYSBtZW1v
cnkgdXRpbGl6YXRpb24KcHJvYmxlbSwgdGhleSdyZSBhbHNvIGEgcGVyZm9ybWFuY2UgcHJvYmxl
bSwgZS5nLiBzaGF0dGVycyBodWdlcGFnZXMgKHdoaWNoIEtWTQpkb2Vzbid0IHlldCBzdXBwb3J0
IHJlY292ZXJpbmcpIGFuZCBpbmNyZWFzZXMgVExCIHByZXNzdXJlIGZvciBib3RoIHN0YWdlLTEg
YW5kCnN0YWdlLTIgbWFwcGluZ3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
