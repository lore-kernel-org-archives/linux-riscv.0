Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAE1C4167D
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/pAdSC1Di9Ned5JQnTiR3aAItQ68NHrb41IYwczBco=; b=Tlm/MYfkzuJxxd
	nFjpPuPg/eeSHQ8j6b8rjCaZPWnhOBZjObI2Y2IZEsD2WQQ4UsQ9PKJ4Qw2D3UlWpK6rxRAArmkoX
	Gh9lwI+vu2I8LIrVGB3RYyAdLr2fgtRvB9Dza+35wpHon/NqpbNRMk7eJhgILhRd5dPd17R9Wp2hf
	Xrgd8R3T9kvhQ5CTdnY/zMBWH5UzgRQVW8VCySf4FIkScncuikhs6wdCYJHv5KA4kb5562ufVH66j
	zlmGWBkqH6KVcodco+l6nFYFEhdTFahB2tV/pLR/qpwowiI4RzN/AiZnEeWziCZSedkyeCM4OovEV
	2+Osqdm6Y3pZ6rq3tJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r02Pk-00H6GR-1L;
	Mon, 06 Nov 2023 16:25:24 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r02Pi-00H6F8-0W
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 16:25:23 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b2f4a5ccebso3001218b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287920; x=1699892720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xnGb8Sp7Bw2ldCk3b7+mm/bKINtcTCgeZ/KDZ+GW64=;
        b=nO2FDFEXdRD6Ftix9OnfuOUOpl2zv2TnZvhc2zgzE0ZATmlqmigLUfsJcVokyq7vuM
         AE5uX4VOdh9bIu166TPl31L5XwR8y8h4WKTiVqP+++dujY4UsppKoy+HeLD2FLmsvoPy
         DqrfXElDB08JHR+f+v60LNn93Om5q2jPj2+CL+BmmkcGXz8mYYkoS59hjSKLzRABDrU6
         CEZFiQHz3vGWZsKTq2e4fSEySUutBIQWPo+rlqXuvMJCwLzDIHczYPEtCamzvON5Br9+
         qKjbIyCwBHMA6M/hoFUM15tutu29IoR2qkwk4mXY5dP5bVbZdtDmWBMsAOvtKQm7lPs+
         ncAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287920; x=1699892720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xnGb8Sp7Bw2ldCk3b7+mm/bKINtcTCgeZ/KDZ+GW64=;
        b=rF0NbXXLp1VgghOpLA/fDyK6ca00ASH7kwKvK8zdftgx31Y/zDU8FE/ovluSL/cztB
         kILqHFobZ/RHRh0DlvZ5uSn2JWS6osRqzc2RsXXXmlnJb1nV/4SkiCcXRT9TpF6h5dNl
         LAFO4HDVJ67veJIxq/ExPEywBw1wqYDo+wvAhj+z2oqGMfFYdsCxcLaE+C3z/8EsrQhb
         YFaBmgzH+MQzKkvBHlMwFgGFeDlLIhMx8IgQmc8/1jS27211UKQJwGOQh07fxt2p0ziw
         F2AhO47udwDRvMr51QSRvjN5eDmnm7a0p8BnAxujnx3UogQiRHPLdF64sW9wqdW/CSNw
         7k7w==
X-Gm-Message-State: AOJu0YwkGHRqarNJTdiGD6/0n6Y8aFQWvNO502c8dNbw+TB8TOIpPiyG
	AwUV1w5Zp9n56AjgzQrNsUA/mzUjm/k8JOqrLFcq8A==
X-Google-Smtp-Source: AGHT+IEz2M905daE9adgBPAvjj9bLaNYp4EiTefEe+KnfTT86zKFKrzhkzHGJH5RS/f9fNDUudL2BwXAULrnwcO9LCk=
X-Received: by 2002:a05:6808:28c:b0:3af:a107:cf68 with SMTP id
 z12-20020a056808028c00b003afa107cf68mr28980109oic.40.1699287918292; Mon, 06
 Nov 2023 08:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
 <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com> <ZUkQjW-yMnLfD7XW@google.com>
In-Reply-To: <ZUkQjW-yMnLfD7XW@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 16:24:42 +0000
Message-ID: <CA+EHjTw8Om6DGatxGhLJHpUb4RY_ma1pidd=mYxTQseE7vDB4A@mail.gmail.com>
Subject: Re: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
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
X-CRM114-CacheID: sfid-20231106_082522_198906_A039C610 
X-CRM114-Status: GOOD (  13.62  )
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

T24gTW9uLCBOb3YgNiwgMjAyMyBhdCA0OjEz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMDYsIDIwMjMsIEZ1YWQgVGFi
YmEgd3JvdGU6Cj4gPiBPbiBTdW4sIE5vdiA1LCAyMDIzIGF0IDQ6MzTigK9QTSBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gK3ZvaWQgdm1fZ3Vlc3RfbWVt
X2ZhbGxvY2F0ZShzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0X3QgYmFzZSwgdWludDY0X3Qgc2l6
ZSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHVuY2hfaG9sZSkKPiA+
ID4gK3sKPiA+ID4gKyAgICAgICBjb25zdCBpbnQgbW9kZSA9IEZBTExPQ19GTF9LRUVQX1NJWkUg
fCAocHVuY2hfaG9sZSA/IEZBTExPQ19GTF9QVU5DSF9IT0xFIDogMCk7Cj4gPiA+ICsgICAgICAg
c3RydWN0IHVzZXJzcGFjZV9tZW1fcmVnaW9uICpyZWdpb247Cj4gPiA+ICsgICAgICAgdWludDY0
X3QgZW5kID0gYmFzZSArIHNpemU7Cj4gPiA+ICsgICAgICAgdWludDY0X3QgZ3BhLCBsZW47Cj4g
PiA+ICsgICAgICAgb2ZmX3QgZmRfb2Zmc2V0Owo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgICBmb3IgKGdwYSA9IGJhc2U7IGdwYSA8IGVuZDsgZ3BhICs9IGxlbikg
ewo+ID4gPiArICAgICAgICAgICAgICAgdWludDY0X3Qgb2Zmc2V0Owo+ID4gPiArCj4gPiA+ICsg
ICAgICAgICAgICAgICByZWdpb24gPSB1c2Vyc3BhY2VfbWVtX3JlZ2lvbl9maW5kKHZtLCBncGEs
IGdwYSk7Cj4gPiA+ICsgICAgICAgICAgICAgICBURVNUX0FTU0VSVChyZWdpb24gJiYgcmVnaW9u
LT5yZWdpb24uZmxhZ3MgJiBLVk1fTUVNX0dVRVNUX01FTUZELAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIlByaXZhdGUgbWVtb3J5IHJlZ2lvbiBub3QgZm91bmQgZm9yIEdQQSAw
eCVseCIsIGdwYSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIG9mZnNldCA9IChncGEg
LSByZWdpb24tPnJlZ2lvbi5ndWVzdF9waHlzX2FkZHIpOwo+ID4KPiA+IG5pdDogd2h5IHRoZSBw
YXJlbnRoZXNlcz8KPgo+IEkgc2ltcGx5IGZvcmdvdCB0byByZW1vdmUgdGhlbSB3aGVuIEkgY2hh
bmdlZCB0aGUgZnVuY3Rpb24gdG8gc3VwcG9ydCBzcGFubmluZwo+IG11bHRpcGxlIG1lbXNsb3Rz
LCBpLmUuIHdoZW4gdGhlIGNvZGUgd2VudCBmcm9tIHRoaXMKPgo+ICAgICAgICAgZmRfb2Zmc2V0
ID0gcmVnaW9uLT5yZWdpb24uZ21lbV9vZmZzZXQgKwo+ICAgICAgICAgICAgICAgICAgICAgKGdw
YSAtIHJlZ2lvbi0+cmVnaW9uLmd1ZXN0X3BoeXNfYWRkcik7Cj4KPiB0byB3aGF0IHlvdSBzZWUg
YWJvdmUuCgpJIHdhc24ndCBhY3R1YWxseSBleHBlY3RpbmcgYW4gYW5zd2VyLCBidXQgSSBsaXRl
cmFsbHkgX2RpZF8gYXNrIGZvciBpdCA6KQoKVGhhbmtzLAovZnVhZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
