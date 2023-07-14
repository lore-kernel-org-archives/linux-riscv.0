Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BCCC001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqdOQCv2UvEb19HA+5Oo55IjirerVJev6MIdf/mFAJY=; b=5GsO00PM33WuWN
	x62rNTy0kxJzf7qrrYT/G2pnCO8nDiu9eho0L/kbW+GWXsnaLm9WT/kj/lVRBWyR5O9OkPgsMDHWH
	0MIZSoq76eYtJN+k75gzOTmXZQCyX+z8PN/Njhx5jocbU9kayfBdS7DuwQLEZ7e9/D8f49YRZsBMD
	AnkjuloVEYePI0zwQtMz3KVcsCiOZ9YB3UEd0PJtCDOUkWGK7KN1PBT/7sSuACCLd2EKBmk0DzL3M
	p4VN0nlOVifFIjfC2CITIsb1FaxpqzttO3AsLRDwwGLlWxI/fcxXXpW9CfhVJdtrSeubQJE81nu96
	EZEijhaHWCts3idH87+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK7Cb-004fpD-2c;
	Fri, 14 Jul 2023 01:02:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK7CZ-004fo6-0z
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 01:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689296548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCZyb3R24GuDipQIPDZ95wX4wOQwTE4wykLLz/wfDdA=;
	b=UIdG4MNe07bfTv1OG8hYWIARq0uwzWYCDBzxERFnIp667ozNVxwUyeTPSsue5wE0wXvMfk
	ExFAd0IShA0auZ2c2GlsLfwqlYEGvnRF3iPNLRqlch4H1ipXF3QujtNDaF0Wx4Fn16nFQP
	8J3LuIYB4Fy5HTUXx9BHNu55z2Brzm0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-eVbivdUkO6WUvDH53zvdMw-1; Thu, 13 Jul 2023 21:02:27 -0400
X-MC-Unique: eVbivdUkO6WUvDH53zvdMw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-262cf62e9b4so947130a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 18:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689296546; x=1691888546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCZyb3R24GuDipQIPDZ95wX4wOQwTE4wykLLz/wfDdA=;
        b=AjiRI/EWfYS8DO3l09vr9M4pDtvAVN6bm6pW0LecknVJu5mgwiRw0bFr7ib9Ccv1Kq
         Ez9JlWk9VekH2AWb/od6l9cj94NYnt7F8VsmcGHdcl4VRS0WxgY0pRDekh/JykIZfm3s
         ReFXUmVVe8peYzryUFGBQMwsXtYeENuyIUAUtQ1S61KkvlZW05uxC8VsE1t2nZhDADNs
         QcgMW/J2yLidYMD5OYNX+0eCXJda8+uvwFjqqZxUJvzG7aXNvNaz24J0Jo6KHeca2+Et
         dljBADT3bmNm0xC14VWR733rXg67v9DWp5YtitOv0FxOYvZo8ABgDi3hB5NyVS0S7Ids
         364g==
X-Gm-Message-State: ABy/qLbVVdKTLJywmD8ChlXORjcHueXRrPP3/Unq7z73YFFVqndCuag2
	XYrAvFpmMPOUfkOyWER2kF6/z7Ow9EfXnIzGhGGPMPbY4BQyO5KqVQeVkFJKtSDJYXdenXwYkra
	PH9A8uz32oB71MiILmK+aIfI4BDFO
X-Received: by 2002:a17:90a:950b:b0:261:1141:b716 with SMTP id t11-20020a17090a950b00b002611141b716mr2709735pjo.33.1689296546062;
        Thu, 13 Jul 2023 18:02:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFSSCf8gGL9MdVrTrliVfiTlZBbSVuaYTkwu2FoRn5pnrMxd9r/+WlBrcYEXoTEJAZF8xXaVA==
X-Received: by 2002:a17:90a:950b:b0:261:1141:b716 with SMTP id t11-20020a17090a950b00b002611141b716mr2709710pjo.33.1689296545727;
        Thu, 13 Jul 2023 18:02:25 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 12-20020a17090a1a0c00b00263dfe1f8d8sm140821pjk.23.2023.07.13.18.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 18:02:25 -0700 (PDT)
Message-ID: <874fdca6-e029-98fe-8e6f-b21dc1eaa467@redhat.com>
Date: Fri, 14 Jul 2023 11:02:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 07/11] KVM: arm64: Define
 kvm_tlb_flush_vmid_range()
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>,
 David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-8-rananta@google.com>
 <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
 <CAJHc60xQtjvVsWRE=w-pAioNJW6uh-qKuZz2wp6bkT=X4oCm5A@mail.gmail.com>
 <60ba5bb4-6fad-0e51-2cd5-845610e6631d@redhat.com>
 <CAJHc60y6AaAUVy=V6GHTpVhHGO3Bjn1vpTnYpdFiFLjS-vR-uA@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAJHc60y6AaAUVy=V6GHTpVhHGO3Bjn1vpTnYpdFiFLjS-vR-uA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_180231_440284_1D89E7E3 
X-CRM114-Status: GOOD (  17.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUmFnaGF2ZW5kcmEsCgpPbiA3LzE0LzIzIDA0OjQ3LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRh
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDUsIDIwMjMgYXQgNTowNOKAr1BNIEdhdmluIFNoYW4gPGdz
aGFuQHJlZGhhdC5jb20+IHdyb3RlOgo+Pgo+PiBPbiA3LzYvMjMgMDQ6MjgsIFJhZ2hhdmVuZHJh
IFJhbyBBbmFudGEgd3JvdGU6Cj4+PiBPbiBUdWUsIEp1bCA0LCAyMDIzIGF0IDU6MzHigK9QTSBH
YXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPiB3cm90ZToKPj4+PiBPbiA2LzIyLzIzIDAzOjQ5
LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+Pj4+PiBJbXBsZW1lbnQgdGhlIGhlbHBl
ciBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UoKSB0aGF0IGFjdHMKPj4+Pj4gYXMgYSB3cmFwcGVy
IGZvciByYW5nZS1iYXNlZCBUTEIgaW52YWxpZGF0aW9ucy4gRm9yIHRoZQo+Pj4+PiBnaXZlbiBW
TUlELCB1c2UgdGhlIHJhbmdlLWJhc2VkIFRMQkkgaW5zdHJ1Y3Rpb25zIHRvIGRvCj4+Pj4+IHRo
ZSBqb2Igb3IgZmFsbGJhY2sgdG8gaW52YWxpZGF0aW5nIGFsbCB0aGUgVExCIGVudHJpZXMuCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFA
Z29vZ2xlLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2
bV9wZ3RhYmxlLmggfCAxMCArKysrKysrKysrCj4+Pj4+ICAgICBhcmNoL2FybTY0L2t2bS9oeXAv
cGd0YWJsZS5jICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+Pj4+PiAgICAgMiBm
aWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4KPj4+PiBJdCBtYXkgYmUg
cmVhc29uYWJsZSB0byBmb2xkIHRoaXMgdG8gUEFUQ0hbMDgvMTFdIHNpbmNlIGt2bV90bGJfZmx1
c2hfdm1pZF9yYW5nZSgpIGlzCj4+Pj4gb25seSBjYWxsZWQgYnkgQVJNNjQncyBrdm1fYXJjaF9m
bHVzaF9yZW1vdGVfdGxic19yYW5nZSgpLCB3aGljaCBpcyBhZGRlZCBieSBQQVRDSFswOC8xMV0u
Cj4+Pj4gSW4gZWl0aGVyIHdheSwgdGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lOgo+Pj4+Cj4+
PiBBaCwgdGhlIHBhdGNoZXMgMTAgYW5kIDExIGFsc28gY2FsbCBrdm1fdGxiX2ZsdXNoX3ZtaWRf
cmFuZ2UoKSwgc28KPj4+IHByb2JhYmx5IGl0J3MgYmV0dGVyIHRvIGtlZXAgdGhlIGRlZmluaXRp
b24gaXNvbGF0ZWQ/Cj4+Pgo+Pgo+PiBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uIEl0J3Mg
ZmluZSB0byBoYXZlIHR3byBzZXBhcmF0ZSBwYXRjaGVzIGluIHRoaXMKPj4gY2FzZS4gSSBzdGls
bCBuZWVkIHRvIHNwZW5kIHNvbWUgdGltZSB0byBsb29rIGF0IFBBVENIWzExLzExXSB3aG9zZSBz
dWJqZWN0Cj4+IGluY2x1ZGVzIHR5cG8gKGludHJ1Y3Rpb25zIC0+IGluc3RydWN0aW9ucykKPj4K
PiBJJ20gcGxhbm5pbmcgdG8gc2VuZCB2NiBzb29uLCBidXQgSSdtIGhhcHB5IHRvIHdhaXQgaWYg
eW91IGhhdmUgYW55Cj4gb3RoZXIgY29tbWVudHMgb24gdjUgcGF0Y2gtMTEuCj4gQXBwcmVjaWF0
ZSB5b3VyIGhlbHAgd2l0aCB0aGUgcmV2aWV3cy4KPiAKCkkgZGlkbid0IGdldCBhIGNoYW5jZSB0
byBsb29rIGF0IFBBVENIWzExLzExXSB5ZXQuIFBsZWFzZSBwb3N0IHY2IGFuZCBJIHdpbGwKdGFr
ZSBhIGxvb2sgb24gUEFUQ0hbdjYgMTEvMTFdLiBTb3JyeSBmb3IgdGhlIGRlbGF5LgoKVGhhbmtz
LApHYXZpbgoKPj4+PiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4K
Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fcGd0YWJs
ZS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fcGd0YWJsZS5oCj4+Pj4+IGluZGV4IDRj
ZDY3NjJiZGE4MDUuLjFiMTIyOTVhODM1OTUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20va3ZtX3BndGFibGUuaAo+Pj4+PiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2t2bV9wZ3RhYmxlLmgKPj4+Pj4gQEAgLTY4Miw0ICs2ODIsMTQgQEAgZW51bSBrdm1fcGd0
YWJsZV9wcm90IGt2bV9wZ3RhYmxlX3N0YWdlMl9wdGVfcHJvdChrdm1fcHRlX3QgcHRlKTsKPj4+
Pj4gICAgICAqICAgICBrdm1fcGd0YWJsZV9wcm90IGZvcm1hdC4KPj4+Pj4gICAgICAqLwo+Pj4+
PiAgICAgZW51bSBrdm1fcGd0YWJsZV9wcm90IGt2bV9wZ3RhYmxlX2h5cF9wdGVfcHJvdChrdm1f
cHRlX3QgcHRlKTsKPj4+Pj4gKwo+Pj4+PiArLyoqCj4+Pj4+ICsgKiBrdm1fdGxiX2ZsdXNoX3Zt
aWRfcmFuZ2UoKSAtIEludmFsaWRhdGUvZmx1c2ggYSByYW5nZSBvZiBUTEIgZW50cmllcwo+Pj4+
PiArICoKPj4+Pj4gKyAqIEBtbXU6ICAgICBTdGFnZS0yIEtWTSBNTVUgc3RydWN0Cj4+Pj4+ICsg
KiBAYWRkcjogICAgVGhlIGJhc2UgSW50ZXJtZWRpYXRlIHBoeXNpY2FsIGFkZHJlc3MgZnJvbSB3
aGljaCB0byBpbnZhbGlkYXRlCj4+Pj4+ICsgKiBAc2l6ZTogICAgU2l6ZSBvZiB0aGUgcmFuZ2Ug
ZnJvbSB0aGUgYmFzZSB0byBpbnZhbGlkYXRlCj4+Pj4+ICsgKi8KPj4+Pj4gK3ZvaWQga3ZtX3Rs
Yl9mbHVzaF92bWlkX3JhbmdlKHN0cnVjdCBrdm1fczJfbW11ICptbXUsCj4+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IGFkZHIsIHNpemVfdCBzaXplKTsKPj4+
Pj4gICAgICNlbmRpZiAgICAgIC8qIF9fQVJNNjRfS1ZNX1BHVEFCTEVfSF9fICovCj4+Pj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jIGIvYXJjaC9hcm02NC9rdm0v
aHlwL3BndGFibGUuYwo+Pj4+PiBpbmRleCAzZDYxYmQzZTU5MWQyLi5kZjhhYzE0ZDlkM2Q0IDEw
MDY0NAo+Pj4+PiAtLS0gYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4+Pj4+ICsrKyBi
L2FyY2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxlLmMKPj4+Pj4gQEAgLTYzMSw2ICs2MzEsMjYgQEAg
c3RhdGljIGJvb2wgc3RhZ2UyX2hhc19md2Ioc3RydWN0IGt2bV9wZ3RhYmxlICpwZ3QpCj4+Pj4+
ICAgICAgICAgcmV0dXJuICEocGd0LT5mbGFncyAmIEtWTV9QR1RBQkxFX1MyX05PRldCKTsKPj4+
Pj4gICAgIH0KPj4+Pj4KPj4+Pj4gK3ZvaWQga3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKHN0cnVj
dCBrdm1fczJfbW11ICptbXUsCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBo
eXNfYWRkcl90IGFkZHIsIHNpemVfdCBzaXplKQo+Pj4+PiArewo+Pj4+PiArICAgICB1bnNpZ25l
ZCBsb25nIHBhZ2VzLCBpbnZhbF9wYWdlczsKPj4+Pj4gKwo+Pj4+PiArICAgICBpZiAoIXN5c3Rl
bV9zdXBwb3J0c190bGJfcmFuZ2UoKSkgewo+Pj4+PiArICAgICAgICAgICAgIGt2bV9jYWxsX2h5
cChfX2t2bV90bGJfZmx1c2hfdm1pZCwgbW11KTsKPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm47
Cj4+Pj4+ICsgICAgIH0KPj4+Pj4gKwo+Pj4+PiArICAgICBwYWdlcyA9IHNpemUgPj4gUEFHRV9T
SElGVDsKPj4+Pj4gKyAgICAgd2hpbGUgKHBhZ2VzID4gMCkgewo+Pj4+PiArICAgICAgICAgICAg
IGludmFsX3BhZ2VzID0gbWluKHBhZ2VzLCBNQVhfVExCSV9SQU5HRV9QQUdFUyk7Cj4+Pj4+ICsg
ICAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlLCBtbXUs
IGFkZHIsIGludmFsX3BhZ2VzKTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAgICAgIGFkZHIgKz0g
aW52YWxfcGFnZXMgPDwgUEFHRV9TSElGVDsKPj4+Pj4gKyAgICAgICAgICAgICBwYWdlcyAtPSBp
bnZhbF9wYWdlczsKPj4+Pj4gKyAgICAgfQo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICAgICAjZGVm
aW5lIEtWTV9TMl9NRU1BVFRSKHBndCwgYXR0cikgUEFHRV9TMl9NRU1BVFRSKGF0dHIsIHN0YWdl
Ml9oYXNfZndiKHBndCkpCj4+Pj4+Cj4+Pj4+ICAgICBzdGF0aWMgaW50IHN0YWdlMl9zZXRfcHJv
dF9hdHRyKHN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0LCBlbnVtIGt2bV9wZ3RhYmxlX3Byb3QgcHJv
dCwKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
