Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2441ECAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVIGe5r3yoXagGH7RS/MqjojHwJqLwj7Edm3e2XPCtQ=; b=T450gEa32g3+G+
	CNuny+znaUsJlDSYZdqoA+/a+u+0zaFhysVcsi3SUWLpXwSR8JnNQ9m04zywmHJZDd8f/u31ThD19
	3/AUIkCvsZIRje1Vbn6Vji3zJa0/B8DM3uVyCtE73VE/hugGsAK5h9lieNp0oC3mE6+f550BuZcNT
	jqxIMKgYzqrjCB+Cn+6pR2MYrkvfeLxTsS4buGBunWPC9u9HKofvBusArRDBYt8BO20NwOxjAJ+Er
	SecsOGZS2lMDhCQrDytb5fEkFELlgrGauQmccZ5oo5LsmSswdBJi2xp7nQbVk7BhPIG/X+pM92fgA
	T6lRQX0K4+CXXYJBDnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYWt-00000002c1F-2n5H;
	Fri, 19 Sep 2025 10:39:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYWq-00000002bzi-1XCp
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 10:39:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2445806e03cso24046865ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758278386; x=1758883186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3BqEGx3LZCxTScwUy93GuzHnUr5KjzApGPt4JpjdTo=;
        b=Gg8q0XGNAQ/yPTDipBSCaPMmXtCucIFodJmMjqYTeXGF8mFY2KVpje9L55VBI4z/Yc
         Hx0jAU5uEALklv10t42HYKKo3ef6Nlao/Vkamm9zq1JwTlrpBnsfzkKfH02rTNARkx1+
         Z/brw8DYXnByGzdjCqDz9/xJQdm4JAwO9jr8kYPnx8t4IkpLpJFZtOxap2oH+631UkFL
         39IW4/HczQNCGOQyVeo5Se1Eqms3vbqe1kc689qQs8mdb6ohrMQQZXEjKi7ksbwS4hmq
         HI8Yel6hOST7G+BpBe7IScGW8hXzxgy3s73M9BmCGWHTYD8o93GG/bxv7DWTJzII4OkN
         nnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758278386; x=1758883186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3BqEGx3LZCxTScwUy93GuzHnUr5KjzApGPt4JpjdTo=;
        b=tDVsnhFKiq6c8OhktOAmBiTtah7PVuM9Wfwr5+7Z1UysZTGPtHcmxE8mr5FsDGz6lM
         MXXvM5eTCXpj6AodKSKbzQT3bkB+g57jSkW/DNDoyG6Hy65J7hmAeOXq4g4WYJqpLEYC
         Siko68P7tsGwvBa3dOSCUjxPdo0/p3oIC7g7zk+6cfLmP8YxV0r/vn4AZmOJVgQojVwn
         VsI00NffDmnt3BaXMx2DNOlcRSIvUJc/aiHWuO9a1hg0HRFHvtFHwTMc1n5H6X//20zY
         ph4yhwUy1425zZ7IMoxU+zOGa6rSojfv6X/LVf1SZBJRMT+Dzcjp29Yezl803rk/bW2Q
         SY+A==
X-Forwarded-Encrypted: i=1; AJvYcCXa/ZcMza35QLWYtzBEgLboKW0G2/mru3ZdXdwo4WtBciOS68Ct5cE0f9s0nsD3nkK3Yvl32Uu/K8YKHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7q2zOlH9KSaGC5RBF00NjaAImjOltbAjUgKh1KzjrWNv26WEa
	YJUy9L+0jbv7HSHHqyPn2zaEQpIQBpN97uDDN+Lj28vrh7MyymyhKI2tzwj1L9lnDAfx9WEwbKv
	P/0No5LldRj26FTUFY1LBTSTsR2Tce/Z+Xn6SHC/Hhg==
X-Gm-Gg: ASbGncvIFrdqOTzWTn6nndBsxYec4D1mZ3JeV8tUqpD0JM17I/t5GdkAEqnT9b9pYOq
	WmT4IImJjqEelrrB5PagI6TfbxizO1K8Hi+sqaIqMh9INAz+/WX6p26yMGU1XNsUZV9E8aJ40++
	U0r+Rw6qtH47/Sy3btPNAZRdVaa5wYUnC+Qr9XS4hZJQkr4aJsGN2U3DgJoxfm9hGRbh1OAvF/h
	qoxDPe/NS3o69arrclHzZaCKUebPQoi85ojuhoM5OdR6ixv5ZWR
X-Google-Smtp-Source: AGHT+IFoPK5eT+xOT+EziB16hnH4PX429eEMbYRejgpp/eimys8JXrVtWPCBLHIY/eRkxEm3X+Q383XHbTelYiczFx8=
X-Received: by 2002:a17:902:c40d:b0:24c:da3b:7379 with SMTP id
 d9443c01a7336-269ba43eed1mr42965405ad.16.1758278386437; Fri, 19 Sep 2025
 03:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250919073714.83063-1-luxu.kernel@bytedance.com> <aM0qlTNPiaQRY2Nv@andrea>
In-Reply-To: <aM0qlTNPiaQRY2Nv@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 18:39:35 +0800
X-Gm-Features: AS18NWDKwjBG8PdT7j1X6Qe6RxslbaKRfRQ1ZSXXMo0po9lxX_klUvUN6-xGGek
Message-ID: <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com, 
	mark.rutland@arm.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com, 
	shuah@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_033948_594128_5AA0B823 
X-CRM114-Status: GOOD (  28.02  )
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

SGkgQW5kcmVhLAoKT24gRnJpLCBTZXAgMTksIDIwMjUgYXQgNjowNOKAr1BNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAxOSwgMjAy
NSBhdCAwMzozNzowNlBNICswODAwLCBYdSBMdSB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggYWRkcyBz
dXBwb3J0IGZvciB0aGUgWmFsYXNyIElTQSBleHRlbnNpb24sIHdoaWNoIHN1cHBsaWVzIHRoZQo+
ID4gcmVhbCBsb2FkIGFjcXVpcmUvc3RvcmUgcmVsZWFzZSBpbnN0cnVjdGlvbnMuCj4gPgo+ID4g
VGhlIHNwZWNpZmljYXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6Cj4gPiBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3YtemFsYXNyL2Jsb2IvbWFpbi9jaGFwdGVyMi5hZG9jCj4gPgo+ID4gVGhp
cyBwYXRjaCBzZWlyZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggbHRwIG9uIFFlbXUgd2l0aCBCcmVu
c2FuJ3MgemFsYXNyCj4gPiBzdXBwb3J0IHBhdGNoWzFdLgo+ID4KPiA+IFNvbWUgZmFsc2UgcG9z
aXRpdmUgc3BhY2luZyBlcnJvciBoYXBwZW5zIGR1cmluZyBwYXRjaCBjaGVja2luZy4gVGh1cyBJ
Cj4gPiBDQ2VkIG1haW50YWluZXJzIG9mIGNoZWNrcGF0Y2gucGwgYXMgd2VsbC4KPiA+Cj4gPiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBR1BTWHdKRWR0cVc9bng3MW91ZlpwNjRu
SzZ0Sz0wcnl0VkVjejRGLWdmdkNPWGsyd0BtYWlsLmdtYWlsLmNvbS8KPiA+Cj4gPiB2MzoKPiA+
ICAtIEFwcGx5IGFjcXVpcmUvcmVsZWFzZSBzZW1hbnRpY3MgdG8gYXJjaF94Y2hnL2FyY2hfY21w
eGNoZyBvcGVyYXRpb25zCj4gPiAgc28gYXMgdG8gZW5zdXJlIEZFTkNFLlRTTyBvcmRlcmluZyBi
ZXR3ZWVuIG9wZXJhdGlvbnMgd2hpY2ggcHJlY2VkZSB0aGUKPiA+ICBVTkxPQ0srTE9DSyBzZXF1
ZW5jZSBhbmQgb3BlcmF0aW9ucyB3aGljaCBmb2xsb3cgdGhlIHNlcXVlbmNlLiBUaGFua3MKPiA+
ICB0byBBbmRyZWEuCj4gPiAgLSBTdXBwb3J0IGh3cHJvYmUgb2YgWmFsYXNyLgo+ID4gIC0gQWxs
b3cgWmFsYXNyIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+ID4KPiA+IHYyOgo+ID4gIC0gQWRq
dXN0IHRoZSBvcmRlciBvZiBaYWxhc3IgYW5kIFphbHJzYyBpbiBkdC1iaW5kaW5ncy4gVGhhbmtz
IHRvCj4gPiAgQ29ub3IuCj4gPgo+ID4gWHUgTHUgKDgpOgo+ID4gICByaXNjdjogYWRkIElTQSBl
eHRlbnNpb24gcGFyc2luZyBmb3IgWmFsYXNyCj4gPiAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRk
IFphbGFzciBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCj4gPiAgIHJpc2N2OiBod3Byb2JlOiBF
eHBvcnQgWmFsYXNyIGV4dGVuc2lvbgo+ID4gICByaXNjdjogSW50cm9kdWNlIFphbGFzciBpbnN0
cnVjdGlvbnMKPiA+ICAgcmlzY3Y6IFVzZSBaYWxhc3IgZm9yIHNtcF9sb2FkX2FjcXVpcmUvc21w
X3N0b3JlX3JlbGVhc2UKPiA+ICAgcmlzY3Y6IEFwcGx5IGFjcXVpcmUvcmVsZWFzZSBzZW1hbnRp
Y3MgdG8gYXJjaF94Y2hnL2FyY2hfY21weGNoZwo+ID4gICAgIG9wZXJhdGlvbnMKPiA+ICAgUklT
Qy1WOiBLVk06IEFsbG93IFphbGFzciBleHRlbnNpb25zIGZvciBHdWVzdC9WTQo+ID4gICBLVk06
IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaYWxhc3IgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3Qg
dGVzdAo+ID4KPiA+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAg
ICAgfCAgIDUgKy0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwgfCAgIDUgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmggICAgICAg
ICAgICAgICB8ICAgNiAtCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iYXJyaWVyLmggICAg
ICAgICAgICAgIHwgIDkxICsrKysrKysrKystLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y21weGNoZy5oICAgICAgICAgICAgICB8IDEzNiArKysrKysrKy0tLS0tLS0tLS0KPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaCAgICAgICAgICAgICB8ICA3OSArKysrKysr
KysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAgICAgICAgIHwg
ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAg
fCAgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAg
ICAgIHwgICAxICsKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAg
ICAgICAgfCAgIDIgKwo+ID4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5j
ICAgICAgICB8ICAgNCArCj4gPiAgMTMgZmlsZXMgY2hhbmdlZCwgMjQyIGluc2VydGlvbnMoKyks
IDkxIGRlbGV0aW9ucygtKQo+Cj4gSSB3b3VsZG4ndCBoYXZlIHJ1c2hlZCB0aGlzIHN1Ym1pc3Np
b24gd2hpbGUgdGhlIGRpc2N1c3Npb24gb24gdjIgc2VlbXMKPiBzbyBtdWNoIGFsaXZlOyAgSUFD
LCB0byBhZGQgYW5kIGxpbmsgdG8gdGhhdCBkaXNjdXNzaW9uLCB0aGlzIHZlcnNpb24KClRoYW5r
cy4gVGhpcyB2ZXJzaW9uIGlzIHNlbnQgb3V0IHRvIHNob3cgbXkgc29sdXRpb24gdG8gdGhlIEZF
TkNFLlRTTwpwcm9ibGVtIHlvdSBwb2ludGVkIG91dCBiZWZvcmUuIEkgd2lsbCBjb250aW51ZSB0
byBpbXByb3ZlIGl0LiBMb29rCmZvcndhcmQgdG8gbW9yZSBzdWdnZXN0aW9ucyBmcm9tIHlvdS4K
Cj4gKG5vdCBhIHJldmlldywganVzdCBsb29raW5nIGF0IHRoaXMgZGlmZiBzdGF0KSBpcyBjaGFu
Z2luZyB0aGUgZmFzdHBhdGgKPgo+ICAgcmVhZF91bmxvY2soKQo+ICAgcmVhZF9sb2NrKCkKPgo+
IGZyb20gc29tZXRoaW5nIGxpa2UKPgo+ICAgZmVuY2Ugcncsdwo+ICAgYW1vZGFkZC53Cj4gICBh
bW9hZGQudwo+ICAgZmVuY2Ugcixydwo+Cj4gdG8KPgo+ICAgZmVuY2UgcncscncKPiAgIGFtb2Fk
ZC53Cj4gICBhbW9hZGQudwo+ICAgZmVuY2UgcncscncKPgo+IG5vIG1hdHRlciBaYWxhc3Igb3Ig
IVphbGFzci4gIFNpbWlsYXJseSBmb3Igb3RoZXIgYXRvbWljIG9wZXJhdGlvbnMgd2l0aAo+IHJl
bGVhc2Ugb3IgYWNxdWlyZSBzZW1hbnRpY3MuICBJIGd1ZXNzIHRoZSBjaGFuZ2Ugd2FzIG5vdCBp
bnRlbnRpb25hbD8KPiBJZiBpdCB3YXMgaW50ZW50aW9uYWwsIGl0IHNob3VsZCBiZSBwcm9wZXJs
eSBtZW50aW9uZWQgaW4gdGhlIGNoYW5nZWxvZy4KClNvcnJ5IGFib3V0IHRoYXQuIEl0IGlzIGlu
dGVuZGVkLiBUaGUgYXRvbWljIG9wZXJhdGlvbiBiZWZvcmUKX19hdG9taWNfYWNxdWlyZV9mZW5j
ZSBvciBvcGVyYXRpb24gYWZ0ZXIgX19hdG9taWNfcmVsZWFzZV9mZW5jZSBjYW4KYmUganVzdCBh
IHNpbmdsZSBsZCBvciBzZCBpbnN0cnVjdGlvbiBpbnN0ZWFkIG9mIGFtb2NhcyBvciBhbW9zd2Fw
LiBJbgpzdWNoIGNhc2VzLCB3aGVuIHRoZSBzdG9yZSByZWxlYXNlIG9wZXJhdGlvbiBiZWNvbWVz
ICdzZC5ybCcsIHRoZQpfX2F0b21pY19hY3F1aXJlX2ZlbmNlIHZpYSAnZmVuY2UgciwgcncnIGNh
biBub3QgZW5zdXJlIEZFTkNFLlRTTwphbnltb3JlLiBUaHVzIEkgcmVwbGFjZSBpdCB3aXRoICdm
ZW5jZSBydywgcncnLgoKSSB3aWxsIG1ha2UgaXQgYSBzZXBhcmF0ZSBjb21taXQgYW5kIHByb3Zp
ZGUgbW9yZSBtZXNzYWdlcyBpbiB0aGUKY2hhbmdlbG9nLiBNYXliZSBhbHRlcm5hdGl2ZSBtZWNo
YW5pc20gY2FuIGJlIGFwcGxpZWQgdG8gYWNjZWxlcmF0ZQppdC4KCkJlc3QgUmVnYXJkcywKWHUg
THUKCj4KPiAgIEFuZHJlYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
