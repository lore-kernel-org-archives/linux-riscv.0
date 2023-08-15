Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585A1C001DB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 00:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFpDK7cZBB4qBG+uDMqiizIsoZ4JlDKR9bKiprpwQO8=; b=LtJ3C7PKT5AksZ
	akpQrf6o+YHg9OgjcYGAQ4iDRJ1TkjA8/AnQwsFfmo4i8UdmhFaNev0IW3t2jNhy5cW+OBt/VPM7E
	v5ksA/c1x2AV0q/q8dSklK1w3qz+cInG9gDHBNNzNc4BPIPidPgR6YzZXbe38f4mzHcLYDxX5b2kn
	WGXE78Fivdmm9DqqF0h6raC92Bl/kCrhz4fvkVTNW2+DghuRVCN3udp/4BCRNvvBgR3uhb2MnDq5p
	yv95E9AjwzEASC3ARq36T/USgA0czAPmLr/ORetQAIgXgq0HEiZs7wTWZ66kb73HGxbU2bBZ+r4S3
	xCqxSKnjgozA8QQUURZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVhx4-000b2Z-2N;
	Tue, 15 Aug 2023 00:30:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVhx1-000b1F-0v
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 00:30:25 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-40a47e8e38dso75791cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692059411; x=1692664211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNJoaJWeIvUddw5R6SlhDX5IJGHqkE8DYyIqOAmI/Gc=;
        b=dTFmXzF41H/n0mK5Jfs/y8u8AIBRo6B27+rwi8uJSpQ/wDiNzZvL4lLXxVNTiAFnkY
         suX0m2QNqLhILSSE09Qp0EukFkzTu5fkVeX9h2uqxOukcSvGAGoFfI/tN7OJN6Tmf4hp
         2mQFyYwAgzeVf26n6t7iWvkYuXuBdnimEIsWJq+Q0pT1f5LSRaCImOR8BywZSjIJIdOq
         cAmcg3NOXGzR2UQrLQh9p0Dfa+ukixiNWjSnvTSaiF7HQoZ6Tumr7UhEepy6riEpq6V6
         Q96VUWIOScaDoDQ5SHJBhUhM3mvGwEwsUjr+/ALmvdKPAVvLMf2FUm7Gsdz4zcVfLTzN
         vJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692059411; x=1692664211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNJoaJWeIvUddw5R6SlhDX5IJGHqkE8DYyIqOAmI/Gc=;
        b=dnrI7xUZEzspruL6ysEkCK5E/qEXNsNC9GpdiDruCn90WYUi3GgDtTORyOPkZAJhOj
         uRciA1Nm7l6vRyvg7qPwXcrTcVuXsrx+WfjFdHRz+cUtZ3Xh9m4wY3W+3mVDan7vKwXa
         bakvqP++unS3vsV5MuQZu6HkDFBhBCPVHSn6rud2DmfL9CqBYstvgXUT2GRKXUOqE5pu
         Mgl8WO/57lXTWy6RS1HxCk5cZ0lrp6eZq9jl7+z594AEjYljy6DwW32T1YrfUzvDWv0L
         2AMdpHf/+JZ9JkKBQ9YKFBC5iBdjR1jzPAt0XIx45QnGSNvFzA6NGctCwKDYTdqepe2B
         BGkQ==
X-Gm-Message-State: AOJu0YzUjyQ/4OHSdfAiBNGBfYXVc7XzEUvNtqk70r893I0MEpLAaSfi
	Cwa/E+InRcpyfuG1Km8Gk5KuPej5QHlPt1j7M2ikkA==
X-Google-Smtp-Source: AGHT+IH5y5MbCy4rjhKShz2AECkzIJQAfVMplY8s8RsyVo2A8Q6lT4pFb0RwiAA0GgJLzfktk2kf1TttUxP9ICKRKm4=
X-Received: by 2002:ac8:5b51:0:b0:40f:d3db:f328 with SMTP id
 n17-20020ac85b51000000b0040fd3dbf328mr724022qtw.2.1692059411605; Mon, 14 Aug
 2023 17:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <ZNq15SZ+53umvOfx@google.com>
In-Reply-To: <ZNq15SZ+53umvOfx@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 14 Aug 2023 17:29:59 -0700
Message-ID: <CAJHc60wMueazp3Wm=b6-tnFPAyX0zeYuVQe9uPEJrpAm0azw2A@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_173023_385624_494EE13D 
X-CRM114-Status: GOOD (  17.63  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgNDoxNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDExLCAyMDIzLCBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gVGhlIHNlcmllcyBpcyBiYXNlZCBvZmYgb2YgdXBz
dHJlYW0gdjYuNS1yYzEuCj4KPiBMaWVzISAgOi0pCj4KPiBUaGlzIGlzIGJhc2VkIG9mZiBvbmUg
b2YgdGhlIGt2bWFybS5naXQgdG9waWMgYnJhbmNoZXMgKEkgZGlkbid0IGJvdGhlciB0byBmaWd1
cmUKPiBvdXQgd2hpY2ggb25lKSwgbm90IHY2LjUtcmMxLgo+ClNvcnJ5LCB3aGF0IGFtIEkgbWlz
c2luZyBoZXJlPyBNeSBnaXQgbG9nIGlzIGFzIGZvbGxvd3M6CgokIGdpdCBsb2cgLS1vbmVsaW5l
IHVwc3RyZWFtX3RsYmlfcmFuZ2VfdjkKNTAyNTg1NzUwN2FiZSAodXBzdHJlYW1fdGxiaV9yYW5n
ZV92OSkgS1ZNOiBhcm02NDogVXNlIFRMQkkKcmFuZ2UtYmFzZWQgaW5zdHJ1Y3Rpb25zIGZvciB1
bm1hcAo1YzAyOTFiOTlhOGZjIEtWTTogYXJtNjQ6IEludmFsaWRhdGUgdGhlIHRhYmxlIGVudHJp
ZXMgdXBvbiBhIHJhbmdlCjhjNDZiNTRkNGFhZWMgS1ZNOiBhcm02NDogRmx1c2ggb25seSB0aGUg
bWVtc2xvdCBhZnRlciB3cml0ZS1wcm90ZWN0CjIzMWFiYWViN2ZmYzIgS1ZNOiBhcm02NDogSW1w
bGVtZW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkKNWVjMjkxYjg2MzMwOSBL
Vk06IGFybTY0OiBEZWZpbmUga3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKCkKNWJjZDdhMDg1YzM0
ZSBLVk06IGFybTY0OiBJbXBsZW1lbnQgIF9fa3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKCkKZWEw
OGY5ZGZmN2U1YiBhcm02NDogdGxiOiBJbXBsZW1lbnQgX19mbHVzaF9zMl90bGJfcmFuZ2Vfb3Ao
KQpiMzE3ODY4Nzk0N2M5IGFybTY0OiB0bGI6IFJlZmFjdG9yIHRoZSBjb3JlIGZsdXNoIGFsZ29y
aXRobSBvZiBfX2ZsdXNoX3RsYl9yYW5nZQphNDg1MGZhOTg4ZWVmIEtWTTogTW92ZSBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxic19tZW1zbG90KCkgdG8gY29tbW9uIGNvZGUKMzA2ZGM0ZTZhZmQz
NyBLVk06IEFsbG93IHJhbmdlLWJhc2VkIFRMQiBpbnZhbGlkYXRpb24gZnJvbSBjb21tb24gY29k
ZQpkMDI3ODVhMGExZTAxIEtWTTogUmVtb3ZlIENPTkZJR19IQVZFX0tWTV9BUkNIX1RMQl9GTFVT
SF9BTEwKMTM2ZmEyZDI1NDUzNyBLVk06IGFybTY0OiBVc2Uga3ZtX2FyY2hfZmx1c2hfcmVtb3Rl
X3RsYnMoKQplMzVjNjhhNzUxNzBkIEtWTTogRGVjbGFyZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVf
dGxicygpIGdsb2JhbGx5CjVkNTkyNzc3YjliYmEgS1ZNOiBSZW5hbWUga3ZtX2FyY2hfZmx1c2hf
cmVtb3RlX3RsYigpIHRvCmt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKCkKMDZjMmFmYjg2MmY5
ZCAodGFnOiB2Ni41LXJjMSwgdGFnOiBsaW51eC92Ni41LXJjMSkgTGludXggNi41LXJjMQpjMTky
YWM3MzU3NjgzIE1BSU5UQUlORVJTIDI6IEVsZWN0cmljIEJvb2dhbG9vCmY3MWY2NDIxMGQ2OTgg
TWVyZ2UgdGFnICdkbWEtbWFwcGluZy02LjUtMjAyMy0wNy0wOScgb2YKZ2l0Oi8vZ2l0LmluZnJh
ZGVhZC5vcmcvdXNlcnMvaGNoL2RtYS1tYXBwaW5nCi4uLgoKSXNuJ3QgdGhlIGNvbW1pdCwgMDZj
MmFmYjg2MmY5ZCAoMDZjMmFmYjg2MmY5ZCAodGFnOiB2Ni41LXJjMSwgdGFnOgpsaW51eC92Ni41
LXJjMSkgTGludXggNi41LXJjMSkgdGhlICdiYXNlJyBjb21taXQ/CgpUaGFuayB5b3UuClJhZ2hh
dmVuZHJhCgo+IFBsZWFzZSB0cnkgdG8gaW5jb3Jwb3JhdGUgZ2l0IGZvcm1hdC1wYXRjaCdzICIt
LWJhc2UiIG9wdGlvbiBpbnRvIHlvdXIgd29ya2Zsb3csCj4gZS5nLiBJIGRvICJnaXQgZm9ybWF0
LXBhdGNoIC0tYmFzZT1IRUFEfiRuciIgd2hlcmUgJG5yIGlzIHRoZSBudW1iZXIgb2YgcGF0Y2hl
cwo+IEkgYW0gcG9zdGluZy4KPgo+IEl0J3Mgbm90IGZvb2xwcm9vZiwgZS5nLiBteSBhcHByb2Fj
aCBkb2Vzbid0IGhlbHAgaWYgSSBoYXZlIGEgbG9jYWwgcGF0Y2ggdGhhdAo+IEknbSBub3QgcG9z
dGluZywgYnV0IDk5JSBvZiB0aGUgdGltZSBpdCBKdXN0IFdvcmtzIGFuZCBlbGltaW5hdGVzIGFu
eSBhbWJ1aXRpdHkuCj4KPiBZb3UgY2FuIGFsc28gZG8gIi0tYmFzZT1hdXRvIiwgYnV0IHRoYXQg
b25seSBkb2VzIHRoZSByaWdodCB0aGluZyBpZiB5b3VyIHNlcmllcwo+IGhhcyBpdHMgdXBzdHJl
YW0gYnJhbmNoIHNldCB0byB0aGUgYmFzZS90cmVlIHRoYXQgeW91IHdhbnQgeW91ciBwYXRjaGVz
IGFwcGxpZWQKPiB0byAoSSB1c2UgdGhlIHVwc3RyZWFtIGJyYW5jaCBmb3IgYSBjb21wbGV0ZWx5
IGRpZmZlcmVudCBwdXJwb3NlIGZvciBteSBkZXYgYnJhbmNoZXMpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
