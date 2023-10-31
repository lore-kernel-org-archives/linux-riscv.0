Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5049FC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0llw2U2FT1hrhol9BS2MQLNejB4l5qVGr12g24j6jp4=; b=eGGOz/P6PQc3Ou
	vpOqaj0pPDezA9pTqvnZq3jFDl7mJnHYIOcUthUJNO4mDpbu5aKXTvwPwSEUMOYGzUQQmykVFyQHd
	XFuxakzVn7bpgDS0GrJe7yvNU/rjN9sjbZZexB/uKr0/3xPDBXqcad76+k4LTQeeM0lYml6aC1k0a
	X3QC6exPZlnhO5IlcI+io3PvXowes/PN4MFeFdFYMLSRihaAmiflJY2aIPTrmux1ZihQeRKO3+6G9
	0On1lNA7Jayk4ZlrdT8inX/WN9wCmDsy1eMAu+arECkBY7KhhaQoXL9Nz8wdElmdsf/E+w0rAJ/NN
	EGaPk1FhLGCJlnU6Ultw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxx44-006Dby-1A;
	Tue, 31 Oct 2023 22:18:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxx42-006Daz-0T
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 22:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698790699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfYGCdpNkdX5yz1jUhkJ/3qqRF866UiTHuuzMPk/uy0=;
	b=U/HXjC4KoPV/Btr64/oDMmCFswL4JdEWUn4iFg7PbR6UdUT1dd6oFwZb7jZHNNWz7DNOLc
	IJOCnsxuYILAR6fmdvARcSHeDfsbBnkn+LUGE/ZMRrZUi0MZcHESk15m8WxqI5yX5haiHd
	rYEWAv/sukBArIm1PoLdvJz0Oh2u6PE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-sZBjtiAFOSWzqLeusT-zUA-1; Tue, 31 Oct 2023 18:18:17 -0400
X-MC-Unique: sZBjtiAFOSWzqLeusT-zUA-1
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-457cbda3299so2031440137.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 15:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698790697; x=1699395497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfYGCdpNkdX5yz1jUhkJ/3qqRF866UiTHuuzMPk/uy0=;
        b=W8OkupYZfC/nwjIhxaV3jMXKaZqfUoYlrlI636DBMoO+I39LBsHsp56PUY8vtEC99H
         3vEQ+Yl1YjW2fhVPaaAJsX6FcEcgowfZnUQg2ulD6dUzy6vsRvXkQJYVngAXj29v1AtH
         MYyfPjkKbTl09VDIFeCZBVYqEEQm7EgLYvrccaSJBRrODVYWa0IAYlhkWibkTttVoprK
         Uyozm3QU54zk8sfk9jgONhjr1H7bZLcBwKTglAGNJ3rtlSpcFsLwQfH68wezv0htImR+
         WmDaPEtHo9j7ajcutLeDFzZFb+OMSS3wFIBlx8NuF67HuaCrA0G+qAG0UvJz7F9jYi5y
         l/tQ==
X-Gm-Message-State: AOJu0Yx0uvc8D0VJPqbtIJ4Aru5Z/Fl4MSIBjKbqZZKMHVJMsJS9mc80
	a8444I4UWH2NSapIPYFabnIzYIUN0KLQNI0IYsW+tU4N6CNNmv+3sw555n75aehtL3OvnOCRlpx
	GAHzUiXUOTVKBYEhLI8dhPOPi6RHOsCSYv308iFiPYYo/
X-Received: by 2002:a67:c218:0:b0:44e:99a2:a42 with SMTP id i24-20020a67c218000000b0044e99a20a42mr9981765vsj.11.1698790697104;
        Tue, 31 Oct 2023 15:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQrBiQJHLqXrbYP+Ue59NphHDME9ef8CfXr1engDM3UMhS/wxqjXJBm4DCAAdJKCtZSXIUO7Qf2zwxIf8biNY=
X-Received: by 2002:a67:c218:0:b0:44e:99a2:a42 with SMTP id
 i24-20020a67c218000000b0044e99a20a42mr9981736vsj.11.1698790696825; Tue, 31
 Oct 2023 15:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com> <ZUF8A5KpwpA6IKUH@google.com>
In-Reply-To: <ZUF8A5KpwpA6IKUH@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Oct 2023 23:18:04 +0100
Message-ID: <CABgObfbLonVYk2WE4TC6-J_0ShanY7TbcLXStxji=XDU+9qQ7g@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: Fuad Tabba <tabba@google.com>, Marc Zyngier <maz@kernel.org>, 
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
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_151822_299341_04F61D76 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMTE6MTPigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBPY3QgMzEsIDIwMjMsIEZ1YWQgVGFi
YmEgd3JvdGU6Cj4gPiBPbiBGcmksIE9jdCAyNywgMjAyMyBhdCA3OjIz4oCvUE0gU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+IFNpbmNlIHdlIG5vdyBrbm93
IHRoYXQgYXQgbGVhc3QgcEtWTSB3aWxsIHVzZSBndWVzdF9tZW1mZCBmb3Igc2hhcmVkIG1lbW9y
eSwgYW5kCj4gb2RkcyBhcmUgcXVpdGUgZ29vZCB0aGF0ICJyZWd1bGFyIiBWTXMgd2lsbCBhbHNv
IGRvIHRoZSBzYW1lLCBpLmUuIHdpbGwgd2FudAo+IGd1ZXN0X21lbWZkIHdpdGggdGhlIGNvbmNl
cHQgb2YgcHJpdmF0ZSBtZW1vcnksIEkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgYXZvaWQKPiBQUklW
QVRFLgo+Cj4gVGhvdWdoIEkgdm90ZSBmb3IgS1ZNX01FTV9HVUVTVF9NRU1GRCAob3IgS1ZNX01F
TV9HVUVTVF9NRU1GRF9WQUxJRCBvcgo+IEtWTV9NRU1fVVNFX0dVRVNUX01FTUZEKS4gIEkuZS4g
ZG8gb3VyIGJlc3QgdG8gYXZvaWQgYW1iaWd1aXR5IGJldHdlZW4gcmVmZXJyaW5nCj4gdG8gImd1
ZXN0IG1lbW9yeSIgYXQtbGFyZ2UgYW5kIGd1ZXN0X21lbWZkLgoKSSB3YXMgZ29pbmcgdG8gcHJv
cG9zZSBLVk1fTUVNX0hBU19HVUVTVE1FTUZELiAgQW55IG9wdGlvbgppcyBva2F5IGZvciBtZSBz
bywgaWYgbm8gb25lIGNvbXBsYWlucywgSSdsbCBnbyBmb3IgS1ZNX01FTV9HVUVTVE1FTUZECihu
byB1bmRlcnNjb3JlIGJlY2F1c2UgSSBmb3VuZCB0aGUgcmVwZWF0ZWQgIl9NRU0iIGRpc3RyYWN0
aW5nKS4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
