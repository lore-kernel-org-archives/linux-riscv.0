Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A975C5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CPDh0KUUBC06mq/cEWCPfqeZ7NMy13NtgwKv4ieH3A=; b=a4v6tK5pMJDmRy
	dEmzV36zPU2dRP1RmRbBXN1UyEmHjb01pXdiaHuRbbTkD13izMLoy6LqtamPbjfEvNRM+aL9C5atX
	htAhnhxm4nfGzf8TXqAVUBRiiziEGziztb4uAVIG1Gdq0ScS9EC54Bkhgia8xKA4QS9DDoHdtK7xU
	WcdpumIUQhRRWrCYE2i8v66sNqqgAbejz5Ilnmy8GFYBa9r570KqMCngwgYsYsnG4LzUmjKDQmaj3
	Mn7J0Odsz/KyMJP8G++dAp3L59viBi37NzbFMo/IGXqgYmbH+6hijQu9oUIkJBg8hFuD+e+W3/uNI
	LH+qrHRwcywfV7EKhmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNH8N-0000000GaTz-3A8X;
	Thu, 05 Jun 2025 20:24:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNH83-0000000GaQR-0dRe
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 20:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749155038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wGRAUX3Vi4mrKdBS2NEw0LJip1BNYoUgoRIdRDK4JKI=;
	b=Ag31gNMoWyM512azaZvYlfTaqSoFeogaL3HUyU51LzGgAbK28rOj7p8wTQiH21xh/gllzP
	cmg/r4OzyxI21XmQ9BdzkNRZpFttXNMmkuC2g+//2cjL6VSpD7aVqOSiURHyp/Mb2H2p1F
	SdrhbOtTt2z9aL7Dd3BwtNfHvmxRiuw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-QKDrQRdzP42_O0iN7w5Mwg-1; Thu, 05 Jun 2025 16:23:56 -0400
X-MC-Unique: QKDrQRdzP42_O0iN7w5Mwg-1
X-Mimecast-MFC-AGG-ID: QKDrQRdzP42_O0iN7w5Mwg_1749155035
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450eaae2934so11135075e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 13:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749155035; x=1749759835;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wGRAUX3Vi4mrKdBS2NEw0LJip1BNYoUgoRIdRDK4JKI=;
        b=e9ZyueGzexX75F2mMG4t7LoW3JKaaQjBQqn/xlsb+xKQLimImu3sotoNknV5bw6yF+
         MfQpWDLvxrgsW1a1v1s9cVnzLYfpIsF8deYOM1LMvDNE/3fcp8XZmgeT+VG5poiasnGx
         VyWH7fnMpFhr6yUTcYjQ509TIpPyp6jtDo+Ow6wYQErVkgehh75IAZuFeoqEnSCQ8uSV
         1RS4a0lYHPaUI44vSVqbxIpXzo+1ljt1nXI5snknbPy5Zaomb+7BZNr3kPXf4FMg911l
         B+drtILONBtoFIO6wM1p292GSwd6JwxXq7cvLO8UP4C/TDzEiGremvu2eTbCamKJxGqH
         BSVg==
X-Forwarded-Encrypted: i=1; AJvYcCVsUtm6NZE3P3u8e55Kkw1shg3oJ6OR9gT1JWAVBojqkZHwaJDZ21c4M6EJfFdWD0OVL6v5ROPc6l8SlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1vpDT0YfGtA3vmLbbS0WeZLbgBOUgk9GvPYRnM8osbO+lCcoO
	XSObG4lDExf8HXQmalNrStE8ergtc+FmKew/iS+rlrkRwtkrsHHSTXvAUM4oSr/drqsX1EEv62P
	r3WhIrDFrmAmdQ4SQdPMG5aERUVNM5CCQTnEyCB7GShnBUy2AvjCSVDIkI8ut4NHY1+lWgw==
X-Gm-Gg: ASbGncsk3QFijS6K7QpjsDp5PAsyzJNgCJ1VTeEr8Eg0C3O98GJL6OvcHtw9jUNL2lW
	hqfWID8w7jPde1mAQI6TK2HvT3KIFIPCoMLMz68kpw2aGHkXJ3YMMRuL/YFPymdvYN3bezUM7f1
	EMvS8mqDkmk1vnj1LiFXCLLEL4g++ZG96yM/8RGxC24L7Wi4KdLsYSuwhzE80vCizubd95S4WeF
	MYlBIeUW4IG4mxctqKFTQOPfuPw5iIOAeA4ljsZUXiEP4cA59mp2GnG7QWuv7TxYDOma4XQIG4B
	i3Hc1Apgu6EosErmVZP9vNzjdp8c6EUg2zc8fkasIKDlazycLp1CTw==
X-Received: by 2002:a05:600c:8b6f:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-45201437a3bmr7944215e9.5.1749155035363;
        Thu, 05 Jun 2025 13:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiHsw/Y4RMekktDUGS/INXjLuw1e2xyTzcANzwqsfxHShQSLVh4rDvLAoSpveuDwSISxQApw==
X-Received: by 2002:a05:600c:8b6f:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-45201437a3bmr7943865e9.5.1749155034932;
        Thu, 05 Jun 2025 13:23:54 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f5ef.dip0.t-ipconnect.de. [79.224.245.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532436555sm138250f8f.61.2025.06.05.13.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 13:23:54 -0700 (PDT)
Message-ID: <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
Date: Thu, 5 Jun 2025 22:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song
 <baohua@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V_EbiMki8DguxtJLrq8-enPzcIeLyk3Nolyfjsx_XwM_1749155035
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_132359_611205_47775D26 
X-CRM114-Status: GOOD (  19.82  )
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

T24gMDUuMDYuMjUgMjE6MTksIEphbm4gSG9ybiB3cm90ZToKPiBPbiBXZWQsIEp1biA0LCAyMDI1
IGF0IDQ6MjHigK9QTSBMb3JlbnpvIFN0b2FrZXMKPiA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5j
b20+IHdyb3RlOgo+PiBUaGUgd2Fsa19wYWdlX3JhbmdlX25vdm1hKCkgZnVuY3Rpb24gaXMgcmF0
aGVyIGNvbmZ1c2luZyAtIGl0IHN1cHBvcnRzIHR3bwo+PiBtb2Rlcywgb25lIHVzZWQgb2Z0ZW4s
IHRoZSBvdGhlciB1c2VkIG9ubHkgZm9yIGRlYnVnZ2luZy4KPj4KPj4gVGhlIGZpcnN0IG1vZGUg
aXMgdGhlIGNvbW1vbiBjYXNlIG9mIHRyYXZlcnNhbCBvZiBrZXJuZWwgcGFnZSB0YWJsZXMsIHdo
aWNoCj4+IGlzIHdoYXQgbmVhcmx5IGFsbCBjYWxsZXJzIHVzZSB0aGlzIGZvci4KPj4KPj4gU2Vj
b25kbHkgaXQgcHJvdmlkZXMgYW4gdW51c3VhbCBkZWJ1Z2dpbmcgaW50ZXJmYWNlIHRoYXQgYWxs
b3dzIGZvciB0aGUKPj4gdHJhdmVyc2FsIG9mIHBhZ2UgdGFibGVzIGluIGEgdXNlcmxhbmQgcmFu
Z2Ugb2YgbWVtb3J5IGV2ZW4gZm9yIHRoYXQgbWVtb3J5Cj4+IHdoaWNoIGlzIG5vdCBkZXNjcmli
ZWQgYnkgYSBWTUEuCj4+Cj4+IEl0IGlzIGZhciBmcm9tIGNlcnRhaW4gdGhhdCBzdWNoIHBhZ2Ug
dGFibGVzIHNob3VsZCBldmVuIGV4aXN0LCBidXQgcGVyaGFwcwo+PiB0aGlzIGlzIHByZWNpc2Vs
eSB3aHkgaXQgaXMgdXNlZnVsIGFzIGEgZGVidWdnaW5nIG1lY2hhbmlzbS4KPj4KPj4gQXMgYSBy
ZXN1bHQsIHRoaXMgaXMgdXRpbGlzZWQgYnkgcHRkdW1wIG9ubHkuIEhpc3RvcmljYWxseSwgdGhp
bmdzIHdlcmUKPj4gcmV2ZXJzZWQgLSBwdGR1bXAgd2FzIHRoZSBvbmx5IHVzZXIsIGFuZCBvdGhl
ciBwYXJ0cyBvZiB0aGUga2VybmVsIGV2b2x2ZWQKPj4gdG8gdXNlIHRoZSBrZXJuZWwgcGFnZSB0
YWJsZSB3YWxraW5nIGhlcmUuCj4gCj4gSnVzdCBmb3IgdGhlIHJlY29yZCwgY29weS1wYXN0aW5n
IG15IGNvbW1lbnQgb24gdjEgdGhhdCB3YXMKPiBhY2NpZGVudGFsbHkgc2VudCBvZmYtbGlzdDoK
PiBgYGAKPiBTb3J0IG9mIGEgdGFuZ2VudGlhbCBjb21tZW50OiBJIHdvbmRlciBpZiBpdCB3b3Vs
ZCBtYWtlIHNlbnNlIHRvIGdpdmUKPiBwdGR1bXAgYSBkaWZmZXJlbnQgcGFnZSB0YWJsZSB3YWxr
ZXIgdGhhdCB1c2VzIHJvdWdobHkgdGhlIHNhbWUgc2FmZXR5Cj4gY29udHJhY3QgYXMgZ3VwX2Zh
c3QoKSAtIHR1cm4gb2ZmIElSUXMgYW5kIHRoZW4gd2FsayB0aGUgcGFnZSB0YWJsZXMKPiBsb2Nr
bGVzc2x5LiBXZSdkIG5lZWQgYmFzaWNhbGx5IG5vIGxvY2tpbmcgYW5kIG5vIHNwZWNpYWwgY2Fz
ZXMKPiAocmVnYXJkaW5nIHVzZXJzcGFjZSBtYXBwaW5ncyBhdCBsZWFzdCksIGF0IHRoZSBjb3N0
IG9mIGhhdmluZyB0bwo+IHdyaXRlIHRoZSB3YWxrZXIgY29kZSBzdWNoIHRoYXQgd2UgcGVyaW9k
aWNhbGx5IHJlc3RhcnQgdGhlIHdhbGsgZnJvbQo+IHNjcmF0Y2ggYW5kIG5vdCBiZWluZyBhYmxl
IHRvIGluc3BlY3QgcmVmZXJlbmNlZCBwYWdlcy4gKFRoYXQgbWlnaHQKPiBhbHNvIGJlIG5pY2Vy
IGZvciBkZWJ1Z2dpbmcsIHNpbmNlIGl0IHdvdWxkbid0IGJsb2NrIG9uIGxvY2tzLi4uKQo+IGBg
YAoKSSBhc3N1bWUgd2UgZG9uJ3QgaGF2ZSB0byBkdW1wIG1vcmUgdGhhbiBwdGUgdmFsdWVzIGV0
Yz8gU28gCnB0ZV9zcGVjaWFsKCkgYW5kIGZyaWVuZHMgYXJlIG5vdCByZWxldmFudCB0byBnZXQg
aXQgcmlnaHQuCgpHVVAtZmFzdCBkZXBlbmQgb24gQ09ORklHX0hBVkVfR1VQX0ZBU1QsIG5vdCBz
dXJlIGlmIHRoYXQgd291bGQgYmUgYSAKY29uY2VybiBmb3Igbm93LgoKLS0gCkNoZWVycywKCkRh
dmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
