Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C0EE8FDB6
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=the2EuE+jDKSYYKQXaM0rLzecCMIyNP0rXyrZ5Im60A=; b=1tCcSJqvPNhanBxmBl9VwAZ1sx
	uFH0foLd9beieKy6YkTFqRJvXG/meHuyFbTln8QtjxprBnBYPizMRgDQNmwaF55qngejJpgc+YL9y
	eMWd0ShxVBYtPjnJh4zoCBqt8lZuz3eY5Bw2lLFX4t7my6O1No5hFh538ocYskKm2VK+ur1pDzyAp
	q2i2Bn08PRtElWIZSZ5vphDgWuFMdt5ub+Z6Rem3tz283DZhufy+/GAsHCnBGnAr/exZFf4MUsQtg
	7b9LRLuIxNZK5ZzQLd8dM40pxYDPJQsMIYn6uvVsptyaiz3d3ktgcaAS4rtgoxY+WSzXFAMaCh0qy
	2XFojQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnmN9-00FH04-0L;
	Tue, 03 Oct 2023 20:52:03 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnmN5-00FGwL-2V
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 20:52:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a1f12cf1ddso2029187b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696366314; x=1696971114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN51NFJCcwM1r+zCqreeXDah/vTq4bXHZX6Qt4tveaY=;
        b=gBLRXfZoM+80FxhVym2ng0jITavuKXXpsHNJIaxxKsqco8zjhISRtsDXRutvtrs4Ce
         h5J1AwxtKJh4rQ+LTa1X9AGZMQyVDZVk/0P3llVsZm+8CP/YMccyXXnxYo/ZMRi9qmAt
         WfHUjIH5IKvab5BotKCFj/2PRoovvHDlkjUFLTMf9R+xlzcHp32ZsOUTjImLhTEHFAGa
         DdrgAlrDp9nQpXyRsQ9g/InVdRK6tznEvi59N0uMtDKbjpuTMab63XrC/cLRB/WCHDh5
         NBqt25juWlUqeEcp9loigrDdv/5l6//NOKnDxEVaPRDIk+QFs7pw3v5NZy5U/9F4w+AM
         DyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696366314; x=1696971114;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iN51NFJCcwM1r+zCqreeXDah/vTq4bXHZX6Qt4tveaY=;
        b=ma8TjxTJZkB/uV3riM5WcDsfCPveJDfGdQyBd6/DGhdm2uw8MHRXEVFNNxZINCRSdc
         PLYwQWYlC0na9Etwpd8rUmKLN8kKXsRMGBYXkDxF6VhoO06BlvA5Ae1aY5Kcj3RHWBqg
         sT2sHVy5nmFaOVSn31KDWpl9iWl9sy6Ba2opzWmFN/VVg+pJlVVNHgBeWWFM9OPHeN5n
         tHBUmOamiJmdiswszBa8XaDrLTA4fJx0KxVUQEqLQVfqQM2xpEgY6F8BMvPOr3yGKVF8
         Nw8abEJXVvw2Bl19ISKaQzKdUWF0l8Ga7Nt0gkodQRZo3PEmyGI3kyF9ZzKylbPeAVLb
         7cDg==
X-Gm-Message-State: AOJu0Yx3G9YXZZTxybXKt1AdzIWYPKhAIK03Y9NIGjgPJFeXlVvuCE1X
	WI36VeZsvut5PnVSCYT9HkL7mldZb3E=
X-Google-Smtp-Source: AGHT+IH9SpWB5ZYki6B4kneRjXWww1fW5aqwjgYpBvf3LyPRvX5qN4iOqywaVkHZ9PW5pYyi5WCeWQUyODc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:b83:b0:59b:b0b1:d75a with SMTP id
 ck3-20020a05690c0b8300b0059bb0b1d75amr85511ywb.4.1696366314084; Tue, 03 Oct
 2023 13:51:54 -0700 (PDT)
Date: Tue, 3 Oct 2023 13:51:52 -0700
In-Reply-To: <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
 <ZRw6X2BptZnRPNK7@google.com> <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
Message-ID: <ZRx-6F6NSd9QU8QT@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_135159_833023_C9E68F4D 
X-CRM114-Status: GOOD (  45.88  )
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

T24gVHVlLCBPY3QgMDMsIDIwMjMsIEZ1YWQgVGFiYmEgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMywg
MjAyMyBhdCA0OjU54oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+
IHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMDMsIDIwMjMsIEZ1YWQgVGFiYmEgd3JvdGU6Cj4gPiA+
ID4gKyNkZWZpbmUgS1ZNX01FTU9SWV9BVFRSSUJVVEVfUFJJVkFURSAgICAgICAgICAgKDFVTEwg
PDwgMykKPiA+ID4gPiArCj4gPiA+Cj4gPiA+IEluIHBLVk0sIHdlIGRvbid0IHdhbnQgdG8gYWxs
b3cgc2V0dGluZyAob3IgY2xlYXJpbmcpIG9mIFBSSVZBVEUvU0hBUkVECj4gPiA+IGF0dHJpYnV0
ZXMgZnJvbSB1c2Vyc3BhY2UuCj4gPgo+ID4gV2h5IG5vdD8gIFRoZSB3aG9sZSB0aGluZyBmYWxs
cyBhcGFydCBpZiB1c2Vyc3BhY2UgZG9lc24ndCAqa25vdyogdGhlIHN0YXRlIG9mIGEKPiA+IHBh
Z2UsIGFuZCB0aGUgb25seSB3YXkgZm9yIHVzZXJzcGFjZSB0byBrbm93IHRoZSBzdGF0ZSBvZiBh
IHBhZ2UgYXQgYSBnaXZlbiBtb21lbnQKPiA+IGluIHRpbWUgaXMgaWYgdXNlcnNwYWNlIGNvbnRy
b2xzIHRoZSBhdHRyaWJ1dGVzLiAgRS5nLiBldmVuIGlmIEtWTSB3ZXJlIHRvIHByb3ZpZGUKPiA+
IGEgd2F5IGZvciB1c2Vyc3BhY2UgdG8gcXVlcnkgYXR0cmlidXRlcywgdGhlIGF0dHJpYnV0ZXMg
ZXhwb3NlZCB0byB1c3JzcGFjZSB3b3VsZAo+ID4gYmVjb21lIHN0YWxlIHRoZSBpbnN0YW50IEtW
TSBkcm9wcyBzbG90c19sb2NrIChvciB3aGF0ZXZlciBsb2NrIHByb3RlY3RzIHRoZSBhdHRyaWJ1
dGVzKQo+ID4gc2luY2UgdXNlcnNwYWNlIGNvdWxkbid0IHByZXZlbnQgZnV0dXJlIGNoYW5nZXMu
Cj4gCj4gSSB0aGluayBJIG1pZ2h0IG5vdCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSBwdXJwb3NlIG9m
IHRoZQo+IEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMgQUJJLiBJbiBwS1ZNLCBhbGwgb2YgYSBw
cm90ZWN0ZWQgZ3Vlc3QncyBtZW1vcnkgaXMKPiBwcml2YXRlIGJ5IGRlZmF1bHQsIHVudGlsIHRo
ZSBndWVzdCBzaGFyZXMgaXQgd2l0aCB0aGUgaG9zdCAodmlhIGEKPiBoeXBlcmNhbGwpLCBvciBh
bm90aGVyIGd1ZXN0IChmdXR1cmUgd29yaykuIFdoZW4gdGhlIGd1ZXN0IHNoYXJlcyBpdCwKPiB1
c2Vyc3BhY2UgaXMgbm90aWZpZWQgdmlhIEtWTV9FWElUX0hZUEVSQ0FMTC4gSW4gbWFueSB1c2Ug
Y2FzZXMsIHVzZXJzcGFjZQo+IGRvZXNuJ3QgbmVlZCB0byBrZWVwIHRyYWNrIGRpcmVjdGx5IG9m
IGFsbCBvZiB0aGlzLCBidXQgY2FuIHJlYWN0aXZlbHkgdW4vbWFwCj4gdGhlIG1lbW9yeSBiZWlu
ZyB1bi9zaGFyZWQuCgpZZXMsIGFuZCB0aGVuIHVzZXJzcGFjZSBuZWVkcyB0byB0ZWxsIEtWTSwg
dmlhIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMsIHRoYXQKdXNlcnNwYWNlIGhhcyBhZ3JlZWQg
dG8gY2hhbmdlIHRoZSBzdGF0ZSBvZiB0aGUgcGFnZS4gIFVzZXJzcGFjZSBtYXkgbm90IG5lZWQv
d2FudAp0byBleHBsaWNpdGx5IHRyYWNrIHRoZSBzdGF0ZSBvZiBwYWdlcywgYnV0IHVzZXJzcGFj
ZSBzdGlsbCBuZWVkcyB0byB0ZWxsIEtWTSB3aGF0CnVzZXJzcGFjZSB3YW50cy4KCktWTSBpcyBw
cmltYXJpbHkgYW4gYWNjZWxlcmF0b3IsIGUuZy4gS1ZNJ3Mgcm9sZSBpcyB0byBtYWtlIHRoaW5n
cyBnbyBmYXN0IChyZWxhdGl2ZQp0byBkb2luZyB0aGluZ3MgaW4gdXNlcnNwYWNlKSBhbmQgcHJv
dmlkZSBhY2Nlc3MgdG8gcmVzb3VyY2VzL2luc3RydWN0aW9ucyB0aGF0CnJlcXVpcmUgZWxldmF0
ZWQgcHJpdmlsZWdlcy4gIEFzIGEgZ2VuZXJhbCBydWxlLCB3ZSB0cnkgdG8gYXZvaWQgZGVmaW5p
bmcgdGhlIHZDUFUKbW9kZWwsIHNlY3VyaXR5IHBvbGljaWVzLCBldGMuIGluIEtWTSwgYmVjYXVz
ZSBoYXJkY29kaW5nIHBvbGljeSBpbnRvIEtWTSAoYW5kIHRoZQprZXJuZWwgYXMgYSB3aG9sZSkg
ZXZlbnR1YWxseSBsaW1pdHMgdGhlIHV0aWxpdHkgb2YgS1ZNLgoKQXMgaXQgcGVydGFpbnMgdG8g
UFJJVkFURSB2cy4gU0hBUkVELCBLVk0ncyByb2xlIGlzIHRvIGRlZmluZSBhbmQgZW5mb3JjZSB0
aGUgYmFzaWMKcnVsZXMsIGJ1dCBLVk0gc2hvdWxkbid0IGRvIHRoaW5ncyBsaWtlIGRlZmluZSB3
aGVuIGl0IGlzIChpbClsZWdhbCB0byBjb252ZXJ0Cm1lbW9yeSB0by9mcm9tIFNIQVJFRCwgd2hh
dCBwYWdlcyBjYW4gYmUgY29udmVydGVkLCB3aGF0IGhhcHBlbnMgaWYgdGhlIGd1ZXN0IGFuZAp1
c2Vyc3BhY2UgZGlzYWdyZWUsIGV0Yy4KCj4gPiBXaHkgZG9lcyBwS1ZNIG5lZWQgdG8gcHJldmVu
dCB1c2Vyc3BhY2UgZnJvbSBzdGF0aW5nICppdHMqIHZpZXcgb2YgYXR0cmlidXRlcz8KPiA+Cj4g
PiBJZiB0aGUgZ29hbCBpcyB0byByZWR1Y2UgbWVtb3J5IG92ZXJoZWFkLCB0aGF0IGNhbiBiZSBz
b2x2ZWQgYnkgdXNpbmcgYW4gaW50ZXJuYWwsCj4gPiBub24tQUJJIGF0dHJpYnV0ZXMgZmxhZyB0
byB0cmFjayBwS1ZNJ3MgdmlldyBvZiBTSEFSRUQgdnMuIFBSSVZBVEUuICBJZiB0aGUgZ3Vlc3QK
PiA+IGF0dGVtcHRzIHRvIGFjY2VzcyBtZW1vcnkgd2hlcmUgcEtWTSBhbmQgdXNlcnNwYWNlIGRv
bid0IGFncmVlIG9uIHRoZSBzdGF0ZSwKPiA+IGdlbmVyYXRlIGFuIGV4aXQgdG8gdXNlcnNwYWNl
LiAgT3Iga2lsbCB0aGUgZ3Vlc3QuICBPciBkbyBzb21ldGhpbmcgZWxzZSBlbnRpcmVseS4KPiAK
PiBGb3IgdGhlIHBLVk0gaHlwZXJ2aXNvciB0aGUgZ3Vlc3QncyB2aWV3IG9mIHRoZSBhdHRyaWJ1
dGVzIGRvZXNuJ3QKPiBtYXR0ZXIuIFRoZSBoeXBlcnZpc29yIGF0IHRoZSBlbmQgb2YgdGhlIGRh
eSBpcyB0aGUgdWx0aW1hdGUgYXJiaXRlcgo+IGZvciB3aGF0IGlzIHNoYXJlZCBhbmQgd2l0aCBo
b3cuIEZvciBwS1ZNIChhdCBsZWFzdCBpbiBteSBwb3J0IG9mCj4gZ3Vlc3RtZW0pLCB3ZSB1c2Ug
dGhlIG1lbW9yeSBhdHRyaWJ1dGVzIGZyb20gZ3Vlc3RtZW0gZXNzZW50aWFsbHkgdG8KPiBjb250
cm9sIHdoaWNoIG1lbW9yeSBjYW4gYmUgbWFwcGVkIGJ5IHRoZSBob3N0LgoKVGhlIGd1ZXN0J3Mg
dmlldyBhYnNvbHV0ZWx5IG1hdHRlcnMuICBUaGUgZ3Vlc3QncyB2aWV3IG1heSBub3QgYmUgZXhw
cmVzc2VkIGF0CmFjY2VzcyB0aW1lLCBlLmcuIGFzIHlvdSBub3RlIGJlbG93LCBwS1ZNIGFuZCBv
dGhlciBzb2Z0d2FyZS1wcm90ZWN0ZWQgVk1zIGRvbid0CmhhdmUgYSBkZWRpY2F0ZWQgc2hhcmVk
IHZzLiBwcml2YXRlIGJpdCBsaWtlIFREWCBhbmQgU05QLiAgQnV0IHRoZSB2aWV3IGlzIHN0aWxs
CnRoZXJlLCBlLmcuIGluIHRoZSBwS1ZNIG1vZGVsLCB0aGUgZ3Vlc3QgZXhwcmVzc2VzIGl0cyBk
ZXNpcmUgZm9yIHNoYXJlZCB2cy4KcHJpdmF0ZSB2aWEgaHlwZXJjYWxsLCBhbmQgSUlSQywgdGhl
IGd1ZXN0J3MgdmlldyBpcyB0cmFja2VkIGJ5IHRoZSBoeXBlcnZpc29yCmluIHRoZSBzdGFnZS0y
IFBURXMuICBwS1ZNIGl0c2VsZiBtYXkgdHJhY2sgdGhlIGd1ZXN0J3MgdmlldyBvbiB0aGluZ3Ms
IGJ1dCB0aGUKdmlldyBpcyBzdGlsbCB0aGUgZ3Vlc3Qncy4KCkUuZy4gaWYgdGhlIGd1ZXN0IHRo
aW5rcyBhIHBhZ2UgaXMgcHJpdmF0ZSwgYnV0IGluIHJlYWxpdHkgS1ZNIGFuZCBob3N0IHVzZXJz
cGFjZQpoYXZlIGl0IGFzIHNoYXJlZCwgdGhlbiB0aGUgZ3Vlc3QgbWF5IHVuaW50ZW50aW9uYWxs
eSBsZWFrIGRhdGEgdG8gdGhlIHVudHJ1c3RlZAp3b3JsZC4KCklJVUMsIHlvdSBoYXZlIGltcGxl
bWVudGVkIGd1ZXN0X21lbWZkIHN1cHBvcnQgaW4gcEtWTSBieSBjaGFuZ2luZyB0aGUgYXR0cmli
dXRlcwp3aGVuIHRoZSBndWVzdCBtYWtlcyB0aGUgaHlwZXJjYWxsLiAgVGhpcyBjYW4gd29yaywg
YnV0IG9ubHkgc28gbG9uZyBhcyB0aGUgZ3Vlc3QKYW5kIHVzZXJzcGFjZSBhcmUgd2VsbC1iZWhh
dmVkLCBhbmQgaXQgd2lsbCBsaWtlbHkgcGFpbnQgcEtWTSBpbnRvIGEgY29ybmVyIGluCnRoZSBs
b25nIHJ1bi4KCkUuZy4gaWYgdGhlIGd1ZXN0IG1ha2VzIGEgaHlwZXJjYWxsIHRvIGNvbnZlcnQg
bWVtb3J5IHRvIFBSSVZBVEUsIGJ1dCB0aGVyZSBpcwpubyBtZW1zbG90IG9yIHRoZSBtZW1zbG90
IGRvZXNuJ3Qgc3VwcG9ydCBwcml2YXRlIG1lbW9yeSwgdGhlbiB1bmxlc3MgdGhlcmUgaXMKcG9s
aWN5IGJha2VkIGludG8gS1ZNLCBvciBhbiBBQkkgZm9yIHRoZSBndWVzdDw9Pmhvc3QgaHlwZXJj
YWxsIGludGVyZmFjZSB0aGF0CmFsbG93cyB1bndpbmRpbmcgdGhlIHByb2dyYW0gY291bnRlciwg
eW91J3JlIHN0dWNrLiAgUmV0dXJuaW5nIGFuIGVycm9yIGZvciB0aGUKaHlwZXJjYWxsIHN0cmFp
Z2h0IGZyb20gS1ZNIGlzIHVuZGVzaXJhYmxlIGFzIHRoYXQgd291bGQgcHV0IHBvbGljeSBpbnRv
IEtWTSB0aGF0CmRvZXNuJ3QgbmVlZCB0byBiZSB0aGVyZSwgZS5nLiB0aGF0IHdvdWxkIHByZXZl
bnQgdXNlcnNwYWNlIGZyb20gbWFuaXB1bGF0aW5nCm1lbXNsb3RzIGluIHJlc3BvbnNlIHRvICh1
bilzaGFyZSByZXF1ZXN0cyBmcm9tIHRoZSBndWVzdC4gIEl0J3MgYSBzaW1pbGFyIHN0b3J5Cmlm
IEtWTSBtYXJrcyB0aGUgcGFnZSBhcyBQUklWQVRFLCBhcyB0aGF0IHdvdWxkIHByZXZlbnQgdXNl
cnNwYWNlIGZyb20gcmV0dXJuaW5nCmFuIGVycm9yIGZvciB0aGUgaHlwZXJjYWxsLCBpLmUuIHdv
dWxkIHByZXZlbnQgdXNlcnNlcGFjZSBmcm9tIGRlbnlpbmcgdGhlIHJlcXVlc3QKdG8gY29udmVy
dCB0byBQUklWQVRFLgoKPiBPbmUgZGlmZmVyZW5jZSBiZXR3ZWVuIHBLVk0gYW5kIFREWCAoYXMg
SSB1bmRlcnN0YW5kIGl0KSwgaXMgdGhhdCBURFgKPiB1c2VzIHRoZSBtc2Igb2YgdGhlIGd1ZXN0
J3MgSVBBIHRvIGluZGljYXRlIHdoZXRoZXIgbWVtb3J5IGlzIHNoYXJlZAo+IG9yIHByaXZhdGUs
IGFuZCB0aGF0IGNhbiBnZW5lcmF0ZSBhIG1pc21hdGNoIG9uIGd1ZXN0IG1lbW9yeSBhY2Nlc3MK
PiBiZXR3ZWVuIHdoYXQgaXQgdGhpbmtzIHRoZSBzdGF0ZSBpcywgYW5kIHdoYXQgdGhlIHNoYXJp
bmcgc3RhdGUgaW4KPiByZWFsaXR5IGlzLiBwS1ZNIGRvZXNuJ3QgaGF2ZSB0aGF0LiBNZW1vcnkg
aXMgcHJpdmF0ZSBieSBkZWZhdWx0LCBhbmQKPiBjYW4gYmUgc2hhcmVkIGluLXBsYWNlLCBib3Ro
IGluIHRoZSBndWVzdCdzIElQQSBzcGFjZSBhcyB3ZWxsIGFzIHRoZQo+IHVuZGVybHlpbmcgcGh5
c2ljYWwgcGFnZS4KClREWCdzIHNoYXJlZCBiaXQgYW5kIFNOUCdzIGVuY3J5cHRpb24gYml0IGFy
ZSBqdXN0IGEgbWVhbnMgb2YgaGFyZHdhcmUgZW5mb3JjZW1lbnQuCnBLVk0gZG9lcyBoYXZlIGEg
aGFyZHdhcmUgYml0IGJlY2F1c2UgaGFyZHdhcmUgZG9lc24ndCBwcm92aWRlIGFueSBlbmZvcmNl
bWVudC4KQnV0IGFzIGFib3ZlLCBwS1ZNIGRvZXMgaGF2ZSBhbiBlcXVpdmFsZW50ICpzb21ld2hl
cmUqLgoKPiA+ID4gVGhlIG90aGVyIHRoaW5nLCB3aGljaCB3ZSBuZWVkIGZvciBwS1ZNIGFueXdh
eSwgaXMgdG8gbWFrZQo+ID4gPiBrdm1fdm1fc2V0X21lbV9hdHRyaWJ1dGVzKCkgZ2xvYmFsLCBz
byB0aGF0IGl0IGNhbiBiZSBjYWxsZWQgZnJvbSBvdXRzaWRlIG9mCj4gPiA+IGt2bV9tYWluLmMg
KGFscmVhZHkgaGF2ZSBhIGxvY2FsIHBhdGNoIGZvciB0aGlzIHRoYXQgZGVjbGFyZXMgaXQgaW4K
PiA+ID4ga3ZtX2hvc3QuaCksCj4gPgo+ID4gVGhhdCdzIG5vIHByb2JsZW0sIGJ1dCBJIGFtIGRl
ZmluaXRlbHkgb3Bwb3NlZCB0byBLVk0gbW9kaWZ5aW5nIGF0dHJpYnV0ZXMgdGhhdAo+ID4gYXJl
IG93bmVkIGJ5IHVzZXJzcGFjZS4KPiA+Cj4gPiA+IGFuZCBub3QgZ2F0ZSB0aGlzIGZ1bmN0aW9u
IGJ5IEtWTV9HRU5FUklDX01FTU9SWV9BVFRSSUJVVEVTLgo+ID4KPiA+IEFzIGFib3ZlLCBJIGFt
IG9wcG9zZWQgdG8gcEtWTSBoYXZpbmcgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBBQkkgZm9yIG1h
bmFnaW5nCj4gPiBQUklWQVRFIHZzLiBTSEFSRUQuICBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvIHBL
Vk0gdXNpbmcgdW5jbGFpbWVkIGZsYWdzIGluIHRoZQo+ID4gYXR0cmlidXRlcyB0byBzdG9yZSBl
eHRyYSBtZXRhZGF0YSwgYnV0IGlmIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMgZG9lc24ndCB3
b3JrCj4gPiBmb3IgcEtWTSwgdGhlbiB3ZSd2ZSBmYWlsZWQgbWlzZXJhYmx5IGFuZCBzaG91bGQg
cmV2aXN0IHRoZSB1QVBJLgo+IAo+IExpa2UgSSBzYWlkLCBwS1ZNIGRvZXNuJ3QgbmVlZCBhIHVz
ZXJzcGFjZSBBQkkgZm9yIG1hbmFnaW5nIFBSSVZBVEUvU0hBUkVELAo+IGp1c3QgYSB3YXkgb2Yg
dHJhY2tpbmcgaW4gdGhlIGhvc3Qga2VybmVsIG9mIHdoYXQgaXMgc2hhcmVkIChhcyBvcHBvc2Vk
IHRvCj4gdGhlIGh5cGVydmlzb3IsIHdoaWNoIGFscmVhZHkgaGFzIHRoZSBrbm93bGVkZ2UpLiBU
aGUgc29sdXRpb24gY291bGQgc2ltcGx5Cj4gYmUgdGhhdCBwS1ZNIGRvZXMgbm90IGVuYWJsZSBL
Vk1fR0VORVJJQ19NRU1PUllfQVRUUklCVVRFUywgaGFzIGl0cyBvd24KPiB0cmFja2luZyBvZiB0
aGUgc3RhdHVzIG9mIHRoZSBndWVzdCBwYWdlcywgYW5kIG9ubHkgc2VsZWN0cyBLVk1fUFJJVkFU
RV9NRU0uCgpBdCB0aGUgcmlzayBvZiBvdmVyc3RlcHBpbmcgbXkgYm91bmRzLCBJIHRoaW5rIHRo
YXQgZWZmZWN0aXZlbHkgZ2l2aW5nIHRoZSBndWVzdApmdWxsIGNvbnRyb2wgb3ZlciB3aGF0IGlz
IHNoYXJlZCB2cy4gcHJpdmF0ZSBpcyBhIG1pc3Rha2UuICBJdCBtb3JlIG9yIGxlc3MgbG9ja3MK
cEtWTSBpbnRvIGEgc2luZ2xlIG1vZGVsLCBhbmQgZXZlbiB3aXRoaW4gdGhhdCBtb2RlbCwgZGVh
bGluZyB3aXRoIGVycm9ycyBhbmQvb3IKbWlzYmVoYXZpbmcgZ3Vlc3RzIGJlY29tZXMgdW5uZWNl
c3NhcmlseSBwcm9ibGVtYXRpYy4KClVzaW5nIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMgbWF5
IG5vdCBwcm92aWRlIHZhbHVlICp0b2RheSosIGUuZy4gdGhlIHVzZXJzcGFjZQpzaWRlIG9mIHBL
Vk0gY291bGQgc2ltcGx5ICJyZWZsZWN0IiBhbGwgY29udmVyc2lvbiBoeXBlcmNhbGxzLCBhbmQg
dGVybWluYXRlIHRoZQpWTSBvbiBlcnJvcnMuICBCdXQgdGhlIGNvc3QgaXMgdmVyeSBtaW5pbWFs
LCBlLmcuIGEgc2luZ2xlIGV4dHJhIGlvY3RsKCkgcGVyCmNvbnZlcmlvbiwgYW5kIHRoZSB1cHNp
ZGUgaXMgdGhhdCBwS1ZNIHdvbid0IGJlIHN0dWNrIGlmIGEgdXNlIGNhc2UgY29tZXMgYWxvbmcK
dGhhdCB3YW50cyB0byBnbyBiZXlvbmQgImFsbCBjb252ZXJzaW9uIHJlcXVlc3RzIGVpdGhlciBp
bW1lZGlhdGVseSBzdWNjZWVkIG9yCnRlcm1pbmF0ZSB0aGUgZ3Vlc3QiLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
