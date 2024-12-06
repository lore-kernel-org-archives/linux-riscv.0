Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53B7E77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2qoBkZK+HsznShapOLTl9OfcthWr3xYftzyeg1sYKs=; b=z9L/IIMoi+ejNH
	miUBbiDOEpR9Ods2F/N6Xh12pw/6vogaRWPSiOiJAFMLTofIBW5GqgCJh755lHm1TayEj73bExiqj
	ZlWvOGFMg13Gp6bg+KEEvypELYnU2++5NRMRs4n5rFjxLsi/nnmG5ytwUDR2rNYeOnHs/ZkS3Xxvb
	WGTPmlYs3pd2UFxMl2bgHv8ww5Tl+Sh07mqgLjNRVf8qxReH9vwARh+VmB2+ZGeHXkoub24FMgkDM
	SzJoZDtCiWfBFiAWzJdlg97KpchJiKUmWKFZ2yLhB/pRpwazvE9yc8LJY9qT42vA+jEu1vjVTTcMb
	ogJltFNor5UTEu34ZXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVOq-00000001Een-3y5J;
	Fri, 06 Dec 2024 10:17:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVKt-00000001DBq-1hfI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 10:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733480002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sE0+Jv8p1+RSxZLSoZ0bdw7B9NQgiiacOi3XQtYmxiw=;
	b=Od6EMmhPkxiVq4D5U59FIeAec5DSUWR/NSyfnI6zcR8xwPjICJJwYGqcTQLEUUxaa8yFBG
	QNKKDq7nsT6f65M1sXNH0nJB61ig1/smstFonsoYM+hdsljk6jc5fMbg2oM9sBvIC9C9av
	sx/mUdmshhWvm4qLO2Lbn6CXbBfD67o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-HysZkeUsPkqFvfKdi0csFw-1; Fri, 06 Dec 2024 05:13:20 -0500
X-MC-Unique: HysZkeUsPkqFvfKdi0csFw-1
X-Mimecast-MFC-AGG-ID: HysZkeUsPkqFvfKdi0csFw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-434a876d15cso15047575e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 02:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479999; x=1734084799;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sE0+Jv8p1+RSxZLSoZ0bdw7B9NQgiiacOi3XQtYmxiw=;
        b=oejLwpxkbSWZXB7nTVnkN+DwfJihco+dS17A46goMbqd8XM6LDT5fI+GtLM9cNaQ/v
         uLcwdL2AIiOzeaQrQP9lXXHjYAOJyR4eTqSDdDBP6KcwozdHy/Ej6/lENEkw6EPCHZqY
         9fiIPV/V9tB93oPlV4DlkznJFok9f/5whGqjJXh5bji3pbUm3RSZil226nxR0uk7yaKI
         QAh1dVsq3EXm9ABeKEcIoNt6rk4IGEotsvAAe/P2f8xWq/X45bc0AezlvxpTLP0CaSq7
         gz57gNgsHyBvke7lUVscTKOJYZKcolUhPfvdGAQifGIL8zh1XXgIrUuLwkI5aPyZ1gw9
         jDiw==
X-Forwarded-Encrypted: i=1; AJvYcCVUm7WHPm+MZ2vNPCxsZmKDpmaaeIS73TDmXQVwQW3rk9URwqnW1ed+4X2IiIFWxIHYPZribdkWSvV14g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAbccLpJBewuiWzmooVZ0dhmPUXjUqGR51s87BgvB6a3nZxZN
	pIbTnUt8/uOOH8/nJYuycxLc/a0Jr7qvOP6kC6ES1Jq7JNBQ+t6wXvA+IpQybIV1WM2HtiVpMhw
	wZZCMsQBd6Hu4oGQl8sERVo2615sXJyyzZeo+hFfD3LdFC2AuenOdFLCHZbVZE8rXBQ==
X-Gm-Gg: ASbGnctn/8mMKmSJhsHJFGGMnVT8aQzveVlPVzz6hPEHVbsK9M1k7/jwsPS4HIzqg9O
	dm2z0NueOQCgLFEqYH0Yd+nlmYjYYUiB42xOOQr1Cxuo9VGndtNssxdRwE8cljdssBHPYCv6OEO
	mpIQsyuPSOjiSU75y3fMtPmcSfe95fzIuTr3jfEK8ji0bauTKpbLxCW1Sqr9d2pce5xuAa7WDwe
	bdgqr/ZlsS3UnUt0gR+lZ5bzbyUWYvOJFMTPMACeZAs/Jf5YMKQPfdr/7T165QusmHF9RjTqNcg
	h3KDF4VJYdyrKjqvDLokWpMXSnFf57FwXPGZcDe/PYw5svMgGKxaulUSs4aONxQRcbwyY/MHGlJ
	ntA==
X-Received: by 2002:a05:600c:1f95:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-434d91fde3fmr47410275e9.0.1733479999505;
        Fri, 06 Dec 2024 02:13:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNAgJk6SspH05tND9d7SeEiASYCdP05xI5bAcUm7iX+ghPB0Puwlk/OQoFkiQYYQToswv2GA==
X-Received: by 2002:a05:600c:1f95:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-434d91fde3fmr47410045e9.0.1733479999159;
        Fri, 06 Dec 2024 02:13:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:d000:1d1f:238e:aeaf:dbf7? (p200300cbc71bd0001d1f238eaeafdbf7.dip0.t-ipconnect.de. [2003:cb:c71b:d000:1d1f:238e:aeaf:dbf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d43a100csm80243435e9.1.2024.12.06.02.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 02:13:17 -0800 (PST)
Message-ID: <315752c5-6129-4c8b-bf8c-0cc26f0ad5c5@redhat.com>
Date: Fri, 6 Dec 2024 11:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/21] riscv: Introduce 64K base page
To: Zi Yan <ziy@nvidia.com>, Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, anup@brainfault.org, atishp@atishpatra.org,
 xieyongji@bytedance.com, lihangjing@bytedance.com,
 punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Linux MM <linux-mm@kvack.org>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
 <F94D21C0-8189-404A-B796-BB3C6620AB89@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <F94D21C0-8189-404A-B796-BB3C6620AB89@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aZkrHmTxl8sXbY9Mhsh6lSljh_GWK7NukbZoCFBqyaE_1733479999
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021323_538091_E8C725BA 
X-CRM114-Status: GOOD (  14.23  )
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

T24gMDYuMTIuMjQgMDM6MDAsIFppIFlhbiB3cm90ZToKPiBPbiA1IERlYyAyMDI0LCBhdCA1OjM3
LCBYdSBMdSB3cm90ZToKPiAKPj4gVGhpcyBwYXRjaCBzZXJpZXMgYXR0ZW1wdHMgdG8gYnJlYWsg
dGhyb3VnaCB0aGUgbGltaXRhdGlvbiBvZiBNTVUgYW5kCj4+IHN1cHBvcnRzIGxhcmdlciBiYXNl
IHBhZ2Ugb24gUklTQy1WLCB3aGljaCBvbmx5IHN1cHBvcnRzIDRLIHBhZ2Ugc2l6ZQo+PiBub3cu
IFRoZSBrZXkgaWRlYSBpcyB0byBhbHdheXMgbWFuYWdlIGFuZCBhbGxvY2F0ZSBtZW1vcnkgYXQg
YQo+PiBncmFudWxhcml0eSBvZiA2NEsgYW5kIHVzZSBTVk5BUE9UIHRvIGFjY2VsZXJhdGUgYWRk
cmVzcyB0cmFuc2xhdGlvbi4KPj4gVGhpcyBpcyB0aGUgc2Vjb25kIHZlcnNpb24gYW5kIHRoZSBk
ZXRhaWxlZCBpbnRyb2R1Y3Rpb24gY2FuIGJlIGZvdW5kCj4+IGluIFsxXS4KPj4KPj4gQ2hhbmdl
cyBmcm9tIHYxOgo+PiAtIFJlYmFzZSBvbiB2Ni4xMi4KPj4KPj4gLSBBZGp1c3QgdGhlIHBhZ2Ug
dGFibGUgZW50cnkgc2hpZnQgdG8gcmVkdWNlIHBhZ2UgdGFibGUgbWVtb3J5IHVzYWdlLgo+PiAg
ICAgIEZvciBleGFtcGxlLCBpbiBTVjM5LCB0aGUgdHJhZGl0aW9uYWwgdmEgYmVoYXZlcyBhczoK
Pj4KPj4gICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+ICAgICAgfCBwZ2QgaW5kZXggfCBwbWQgaW5kZXggfCBwdGUgaW5kZXggfCBvZmZzZXQgfAo+
PiAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
ICAgICB8IDM4ICAgICAzMCB8IDI5ICAgICAyMSB8IDIwICAgICAxMiB8IDExICAgMCB8Cj4+ICAg
ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiAg
ICAgIFdoZW4gd2UgY2hvb3NlIDY0SyBhcyBiYXNpYyBzb2Z0d2FyZSBwYWdlLCB2YSBub3cgYmVo
YXZlcyBhczoKPj4KPj4gICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+ICAgICAgfCBwZ2QgaW5kZXggfCBwbWQgaW5kZXggfCBwdGUgaW5kZXggfCBv
ZmZzZXQgfAo+PiAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gICAgICB8IDM4ICAgICAzNCB8IDMzICAgICAyNSB8IDI0ICAgICAxNiB8IDE1ICAg
MCB8Cj4+ICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pgo+PiAtIEZpeCBzb21lIGJ1Z3MgaW4gdjEuCj4+Cj4+IFRoYW5rcyBpbiBhZHZhbmNlIGZv
ciBjb21tZW50cy4KPj4KPj4gWzFdIGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85NTI3MjIvCj4g
Cj4gVGhpcyBsb29rcyB2ZXJ5IGludGVyZXN0aW5nLiBDYW4geW91IGNjIG1lIGFuZCBsaW51eC1t
bUBrdmFjay5vcmcKPiBpbiB0aGUgZnV0dXJlPyBUaGFua3MuCj4gCj4gSGF2ZSB5b3UgdGhvdWdo
dCBhYm91dCBkb2luZyBpdCBmb3IgQVJNNjQgNEtCIGFzIHdlbGw/IEFSTTY04oCZcyBjb250aWcg
UFRFCj4gc2hvdWxkIGhhdmUgc2ltaWxhciBlZmZlY3Qgb2YgUklTQy1W4oCZcyBTVk5BUE9ULCBy
aWdodD8KCldoYXQgaXMgdGhlIHJlYWwgYmVuZWZpdCBvdmVyIDRrICsgbGFyZ2UgZm9saW9zL21U
SFA/Cgo2NEsgY29tZXMgd2l0aCB0aGUgcHJvYmxlbSBvZiBpbnRlcm5hbCBmcmFnbWVudGF0aW9u
OiBmb3IgZXhhbXBsZSwgYSAKcGFnZSB0YWJsZSB0aGF0IG9ubHkgb2NjdXBpZXMgNGsgb2YgbWVt
b3J5IHN1ZGRlbmx5IGNvbnN1bWVzIDY0SzsgcXVpdGUgCmEgZG93bnNpZGUuCgotLSAKQ2hlZXJz
LAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
