Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02702C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGCd9s5Frvmy1KoHWGRYkx2n3ZK8KVRaCbAi4/Txe7E=; b=w6A4v03K7197j/
	madH6pnULWgYJVTQNNyhBsf0J8G8JlaYStqgiKzN+bxeBgvDTN7It7qXDRkLGYINLUljVBGdUAOJf
	srwSTLWYBgKBEMrOy2FZWyK/N3UL2ZPTaLKePkYsdBOJDbObfEaZAFhBCGlOIp3z8cotTL1EW5LUt
	/PX5Aa9s4T6GzTxZLnYsX/qP9M4leuqh6at+AfS5QLv9r0q/hth9nawNH3RpVI4po8J0Drsg9Xpel
	a24GtnFUsUrfhQ1/rtZi0wRJyeV1w7Kx/KvDgKF8+cx9WrrYOZxywCfbPArVyGPqCG1iWaAPWdk/m
	eI15tDXXdM9k6c2J17sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnm2-00BJXQ-1k;
	Mon, 27 Mar 2023 14:24:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnlu-00BJTN-0S
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 14:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679927063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCb5CYARt/ke0PXUaZENV1Zy7rv4z1suyv4cHWiEzRY=;
	b=Hn80hCBCNCUyFIXgn9PZYriiCiDVT1yW1X/9lEPxisIrXL6exOM7OzIVD3utZ9GtSj8ilP
	PUkFLdHZOIrfMu6fgVvReVvYqno9UUqg1C+GGevg14XNz/byl1UuCCN63W6FRZJhOxUjse
	uxIw0SfxqCEYnRcg3fO6LdzoiuNz9aY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-umNRG5RaMjqHn0eklC85qQ-1; Mon, 27 Mar 2023 10:24:22 -0400
X-MC-Unique: umNRG5RaMjqHn0eklC85qQ-1
Received: by mail-vs1-f69.google.com with SMTP id y22-20020a67d216000000b00425ef23aa54so2644670vsi.20
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 07:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679927062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCb5CYARt/ke0PXUaZENV1Zy7rv4z1suyv4cHWiEzRY=;
        b=wErLy5h6w5cj2cqGEqLNj1W3g3mqAZEB9tKsubVrzs6qkm5XW1nnasJep1//IX0Rz9
         8xVLki1YjZx6CQQOZmhUbWCy8jn91j6VYMqfCa1Xdt0mJG09p8IChXFxDGNUUFjAGhhL
         1Xg8NVLkM3kEO+xnOoR6J/s+rVwKvSrzszGacxGYfy4KKnNIAopGcjbb4SNwxJOwAnsa
         FfUUOiKKo1/wvQofdKNelOxLZhJ+RUiUrtwYtNMAdQNXmAnP5RGnaZkU/q78mI3rJcy9
         23XpP1PS9zexXpc8Au0FOvO8ShBuPPHgdCiQKn1UQpia+sN6+2pU5sZ/G1SBWG9VJhpq
         /xuw==
X-Gm-Message-State: AAQBX9dKvgHKvqTQnPPBQxXv6rz27+0kG9NTwGiL4u9tLIDhzifG3/Md
	BVCYBnUWM9iMdeP8/LzwII1G9BoAMPvhgrgh6/fnazEaYKYgkMWhH8dtY+xCiD4/FAeMNxs9bEE
	430OsXlbsKB3qVswShJxaPwZS8zrCBsH7Dxy0drVKDmjk
X-Received: by 2002:a05:6130:c91:b0:68b:94c5:7683 with SMTP id ch17-20020a0561300c9100b0068b94c57683mr8105355uab.0.1679927062162;
        Mon, 27 Mar 2023 07:24:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKtMex/tpaadhC7/A3kbiPaqwpdCTnb7TmvYuHGDG5Er/ULTE+vcIozX5oGSBN+/KNP3M3qgRvXJabwVIbX7U=
X-Received: by 2002:a05:6130:c91:b0:68b:94c5:7683 with SMTP id
 ch17-20020a0561300c9100b0068b94c57683mr8105338uab.0.1679927061918; Mon, 27
 Mar 2023 07:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy320bsv7=EBLcdiXyJcO6NWUFK9_XUvwF_KvFF8v91RpA@mail.gmail.com>
In-Reply-To: <CAAhSdy320bsv7=EBLcdiXyJcO6NWUFK9_XUvwF_KvFF8v91RpA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 27 Mar 2023 16:24:10 +0200
Message-ID: <CABgObfaCR0NDj7ipZg2YYHnv4vQbOW4yz9140e+nyZBnF0QgyA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.3, take #1
To: anup@brainfault.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_072430_300721_DE92FD2F 
X-CRM114-Status: GOOD (  10.79  )
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

UHVsbGVkLCB0aGFua3MuCgpQYW9sbwoKT24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMTI6MzPigK9Q
TSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+
Cj4gV2UgaGF2ZSBvbmUgS1ZNIFJJU0MtViBmaXggZm9yIDYuMzoKPiAxKSBGaXggVk0gaGFuZyBp
biBjYXNlIG9mIHRpbWVyIGRlbHRhIGJlaW5nIHplcm8KPgo+IFBsZWFzZSBwdWxsLgo+Cj4gUmVn
YXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGVlYWM4
ZWRlMTc1NTc2ODA4NTUwMzFjNmYzMDVlY2UyMzc4YWYzMjY6Cj4KPiAgIExpbnV4IDYuMy1yYzIg
KDIwMjMtMDMtMTIgMTY6MzY6NDQgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5n
aXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNi4zLTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA2ZWZmMzgwNDg5NDRjYWRjM2NkZGNmMTE3YWNmYTUxOTllYzMyNDkwOgo+Cj4gICBy
aXNjdi9rdm06IEZpeCBWTSBoYW5nIGluIGNhc2Ugb2YgdGltZXIgZGVsdGEgYmVpbmcgemVyby4K
PiAoMjAyMy0wMy0xNyAxMzozMjo1NCArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4
ZXMgZm9yIDYuMywgdGFrZSAjMQo+Cj4gLSBGaXggVk0gaGFuZyBpbiBjYXNlIG9mIHRpbWVyIGRl
bHRhIGJlaW5nIHplcm8KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBSYWpuZXNoIEthbndhbCAoMSk6Cj4gICAgICAg
cmlzY3Yva3ZtOiBGaXggVk0gaGFuZyBpbiBjYXNlIG9mIHRpbWVyIGRlbHRhIGJlaW5nIHplcm8u
Cj4KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
