Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB69C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nG/2Qb+K8JwZD/Tu/Ta/VR0FpOw1seViGgZebtie/lE=; b=blxQb+ZVcy9JN3
	by4pW4ASoApzhGpf2CW5Kt6DG9HFfvYxTHQ7nMgJeAV2YPAK/ZrwAaW54za2JGkC0FiBF6q6+Rg2R
	o/Ql1SzpEJhfsdBt5KjnRcB9xs0JF6iC7Wyb80a++gQBu+Kng6PGJMZRx2vwsoyFt8+E6J46KEBEw
	UPnHej9sjemKxNwK06CocqcRjsUPsFJVAXcbLYNtQUMLNGKqlDC4pI88fc4V81NnDelRtg0mtQ1qz
	FfD9a7OGaT6tLh029+CkezZ7yt/mqss324n7SP9iggHwGzvQbYTmeMyxupph3uS82ejDn7JvsCNNf
	DHKEaGgyFcLpCM60IdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ClM-00AVKa-BG; Thu, 08 Dec 2022 09:00:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ChA-00ARIg-I7
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 08:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670489755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZzQND0XXn/ac1VVVRiwKzVF2wPIGejtH8QPoB1hHfA=;
	b=QPFkG++A/8JL5La+pALQpMxgOwAt4ktwVCkc0B7GKmSOmsQdJwO6bUe02qtZHfivaxVdc3
	G9Wjgdcy6CTAaGzTr8Cckc2sdx+1EbdNMrC++y5ZAPBbYS5RMOrBZy9yOPYliW8bDkf1S/
	1Ay3qqX5PGov4onlFtRbv5LxaYRg05Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-zY9-DbNeMtO_IpB9RKPy5Q-1; Thu, 08 Dec 2022 03:55:54 -0500
X-MC-Unique: zY9-DbNeMtO_IpB9RKPy5Q-1
Received: by mail-wm1-f69.google.com with SMTP id v125-20020a1cac83000000b003cfa148576dso515749wme.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 00:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZzQND0XXn/ac1VVVRiwKzVF2wPIGejtH8QPoB1hHfA=;
        b=shf25ycu0PZMhyRqmiB25EnGiNYMQRPnYDEMU+ITPTm3+vmMiU2u5dLh7XTWaWNUHb
         Nydn4dHCfF+g5bxECAW7xyueQGbLm2UAZ9RSfQXjBqirKjuokgluXavXkRev7H96mQo1
         SoBC43LWYG0aJzokx6u8wBKNR0jsdA+1nKe/W2sKpEDd77uoTO9oqLWzU1vCUk+i0BYK
         ydh02jqDjIIP/qCuuIlIOjecztU3g6iW3I9I73T7VKQVfnofWo9xB+c/jUdiryIIXm8z
         Hix/fNZtYbxnxGghwpggrq+yBYmOUME/8NUXMfg1qHYZkn2x4OenNz/m+ISK/4uEezlm
         ipHg==
X-Gm-Message-State: ANoB5pkPNlHMkwIcZbbMu8y06SNRWpAuE2g48sPrBSchFBy/Xf64FXos
	OS/NW42hzMihnjxSpM2GS6GQ7xxBbxW+EY+pDKZnMDXfkCU+8KieZ7orQJ270AVxfyXCHecW+0Z
	xhkT+KyIuj/+709dlWRDI3tsxRDE8
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id h13-20020a5d504d000000b00242246c2f89mr22919600wrt.108.1670489752976;
        Thu, 08 Dec 2022 00:55:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf668NfxbMXQWSDBD6iCzqqUG4mJSCJROvTfbJs0ERpg3lPeZTVH/8wev7o0MHbpIs1xArxqSg==
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id h13-20020a5d504d000000b00242246c2f89mr22919565wrt.108.1670489752626;
        Thu, 08 Dec 2022 00:55:52 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id o29-20020adfa11d000000b0024278304ef6sm6288982wro.13.2022.12.08.00.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 00:55:52 -0800 (PST)
Message-ID: <c904aa67-1add-119c-162f-e35d8243a11a@redhat.com>
Date: Thu, 8 Dec 2022 09:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH mm-unstable RFC 17/26] powerpc/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
From: David Hildenbrand <david@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Yang Shi <shy828301@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Nadav Amit <namit@vmware.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20221206144730.163732-1-david@redhat.com>
 <20221206144730.163732-18-david@redhat.com>
 <8be167b6-3836-25c3-9f69-b8b3916ee5b4@csgroup.eu>
 <0b5b1303-8bcb-c19d-5f63-0e4a3517fea5@redhat.com>
Organization: Red Hat
In-Reply-To: <0b5b1303-8bcb-c19d-5f63-0e4a3517fea5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_005556_734411_D986A0BD 
X-CRM114-Status: GOOD (  16.18  )
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

T24gMDguMTIuMjIgMDk6NTIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDA3LjEyLjIy
IDE0OjU1LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAwNi8xMi8yMDIyIMOg
IDE1OjQ3LCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+Pj4gV2UgYWxyZWFkeSBpbXBs
ZW1lbnRlZCBzdXBwb3J0IGZvciA2NGJpdCBib29rM3MgaW4gY29tbWl0IGJmZjliZWFhMmU4MAo+
Pj4gKCJwb3dlcnBjL3BndGFibGU6IHN1cHBvcnQgX19IQVZFX0FSQ0hfUFRFX1NXUF9FWENMVVNJ
VkUgZm9yIGJvb2szcyIpCj4+Pgo+Pj4gTGV0J3Mgc3VwcG9ydCBfX0hBVkVfQVJDSF9QVEVfU1dQ
X0VYQ0xVU0lWRSBhbHNvIGluIDMyYml0IGJ5IHJldXNpbmcgeWV0Cj4+PiB1bnVzZWQgTFNCIDIg
LyBNU0IgMjkuIFRoZXJlIHNlZW1zIHRvIGJlIG5vIHJlYWwgcmVhc29uIHdoeSB0aGF0IGJpdCBj
YW5ub3QKPj4+IGJlIHVzZWQsIGFuZCByZXVzaW5nIGl0IGF2b2lkcyBoYXZpbmcgdG8gc3RlYWwg
b25lIGJpdCBmcm9tIHRoZSBzd2FwCj4+PiBvZmZzZXQuCj4+Pgo+Pj4gV2hpbGUgYXQgaXQsIG1h
c2sgdGhlIHR5cGUgaW4gX19zd3BfZW50cnkoKS4KPj4+Cj4+PiBDYzogTWljaGFlbCBFbGxlcm1h
biA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+Pj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBn
bWFpbC5jb20+Cj4+PiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhh
dC5jb20+Cj4+PiAtLS0KPj4+ICAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMy
L3BndGFibGUuaCB8IDM4ICsrKysrKysrKysrKysrKysrLS0tCj4+PiAgICAgMSBmaWxlIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgKPj4+IGluZGV4IDc1ODIzZjM5ZTA0
Mi4uODEwNzgzNWIzOGMxIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2Jvb2szcy8zMi9wZ3RhYmxlLmgKPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvMzIvcGd0YWJsZS5oCj4+PiBAQCAtNDIsNiArNDIsOSBAQAo+Pj4gICAgICNkZWZpbmUg
X1BNRF9QUkVTRU5UX01BU0sgKFBBR0VfTUFTSykKPj4+ICAgICAjZGVmaW5lIF9QTURfQkFECSh+
UEFHRV9NQVNLKQo+Pj4gICAgIAo+Pj4gKy8qIFdlIGJvcnJvdyB0aGUgX1BBR0VfVVNFUiBiaXQg
dG8gc3RvcmUgdGhlIGV4Y2x1c2l2ZSBtYXJrZXIgaW4gc3dhcCBQVEVzLiAqLwo+Pj4gKyNkZWZp
bmUgX1BBR0VfU1dQX0VYQ0xVU0lWRQlfUEFHRV9VU0VSCj4+PiArCj4+PiAgICAgLyogQW5kIGhl
cmUgd2UgaW5jbHVkZSBjb21tb24gZGVmaW5pdGlvbnMgKi8KPj4+ICAgICAKPj4+ICAgICAjZGVm
aW5lIF9QQUdFX0tFUk5FTF9STwkJMAo+Pj4gQEAgLTM2MywxNyArMzY2LDQyIEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBfX3B0ZXBfc2V0X2FjY2Vzc19mbGFncyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwKPj4+ICAgICAjZGVmaW5lIHBtZF9wYWdlKHBtZCkJCXBmbl90b19wYWdlKHBtZF9wZm4o
cG1kKSkKPj4+ICAgICAKPj4+ICAgICAvKgo+Pj4gLSAqIEVuY29kZSBhbmQgZGVjb2RlIGEgc3dh
cCBlbnRyeS4KPj4+IC0gKiBOb3RlIHRoYXQgdGhlIGJpdHMgd2UgdXNlIGluIGEgUFRFIGZvciBy
ZXByZXNlbnRpbmcgYSBzd2FwIGVudHJ5Cj4+PiAtICogbXVzdCBub3QgaW5jbHVkZSB0aGUgX1BB
R0VfUFJFU0VOVCBiaXQgb3IgdGhlIF9QQUdFX0hBU0hQVEUgYml0IChpZiB1c2VkKS4KPj4+IC0g
KiAgIC0tIHBhdWx1cwo+Pj4gKyAqIEVuY29kZS9kZWNvZGUgc3dhcCBlbnRyaWVzIGFuZCBzd2Fw
IFBURXMuIFN3YXAgUFRFcyBhcmUgYWxsIFBURXMgdGhhdAo+Pj4gKyAqIGFyZSAhcHRlX25vbmUo
KSAmJiAhcHRlX3ByZXNlbnQoKS4KPj4+ICsgKgo+Pj4gKyAqIEZvcm1hdCBvZiBzd2FwIFBURXMg
KDMyYml0IFBURXMpOgo+Pj4gKyAqCj4+PiArICogICAgICAgICAgICAgICAgICAgICAgICAgMSAx
IDEgMSAxIDEgMSAxIDEgMiAyIDIgMiAyIDIgMiAyIDIgMiAzIDMKPj4+ICsgKiAgIDAgMSAyIDMg
NCA1IDYgNyA4IDkgMCAxIDIgMyA0IDUgNiA3IDggOSAwIDEgMiAzIDQgNSA2IDcgOCA5IDAgMQo+
Pj4gKyAqICAgRSBIIFAgPC0gdHlwZSAtLT4gPC0tLS0tLS0tLS0tLS0tLS0tIG9mZnNldCAtLS0t
LS0tLS0tLS0tLS0tLS0+Cj4+Cj4+IFRoYXQncyBpbiByZXZlcnNlZCBvcmRlci4gX1BBR0VfSEFT
SFBURSBpcyBiaXQgMzAgYW5kIHNob3VsZCBiZSBvbiB0aGUKPj4gcmlnaHQgaGFuZCBzaWRlLiBF
dGMgLi4uCj4gCj4gVWdoLCBtZXNzZWQgaXQgdXAgd2hpbGUgY29udmVydGluZyBiYWNrIGFuZCBm
b3J0aCBiZXR3ZWVuIExTQiAwIGFuZCBNU0IgMC4KPiAKPiAvKgo+ICAgICogRm9ybWF0IG9mIHN3
YXAgUFRFcyAoMzJiaXQgUFRFcyk6Cj4gICAgKgo+ICAgICogICAgICAgICAgICAgICAgICAgICAg
ICAgMSAxIDEgMSAxIDEgMSAxIDEgMiAyIDIgMiAyIDIgMiAyIDIgMiAzIDMKPiAgICAqICAgMCAx
IDIgMyA0IDUgNiA3IDggOSAwIDEgMiAzIDQgNSA2IDcgOCA5IDAgMSAyIDMgNCA1IDYgNyA4IDkg
MCAxCj4gICAgKiAgIDwtLS0tLS0tLS0tLS0tLS0tLSBvZmZzZXQgLS0tLS0tLS0tLS0tLS0tLS0t
PiA8LSB0eXBlIC0tPiBFIEggUAo+IAo+IAoKU3RpbGwgd3JvbmcsIHRoZSB0eXBlIGlzIG9ubHkg
NSBiaXRzOgoKKyAqIEZvcm1hdCBvZiBzd2FwIFBURXMgKDMyYml0IFBURXMpOgorICoKKyAqICAg
ICAgICAgICAgICAgICAgICAgICAgIDEgMSAxIDEgMSAxIDEgMSAxIDIgMiAyIDIgMiAyIDIgMiAy
IDIgMyAzCisgKiAgIDAgMSAyIDMgNCA1IDYgNyA4IDkgMCAxIDIgMyA0IDUgNiA3IDggOSAwIDEg
MiAzIDQgNSA2IDcgOCA5IDAgMQorICogICA8LS0tLS0tLS0tLS0tLS0tLS0gb2Zmc2V0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tPiA8IHR5cGUgLT4gRSBIIFAKKyAqCgoKLS0gClRoYW5rcywKCkRhdmlk
IC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
