Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B72CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5b4kQ8H04NVWqTjvjqGcyMY/b8XbQc1VHbzihgiPpc=; b=0fFOg1nWX4R6uu
	VGKra3fTygi19bq6BzJa7DSz5QCSTqhRYhV9879FqyGuBhz+Y/5+O6qYDAt/G2+zZvXAYUJC1dBqN
	4f+6Sx7ucai1a6DVl/h32TcgRxaN5u+weBYiN9zss135HPT8nmIqAPjQ6OzoGA62oHtFWa6aYdkPB
	TZOnzDV6JCHlo/bGboze3b5SVo/13WuGXJh5W8IpulnVUW+4EImVbfB94qWql6aL2qWqvQVyiCL85
	aps6/ExkIiWPHjlu3s//t3j2Zq4tBgE23v1el+fz0RQ2mHKb19P2RtpO/HabLuJcaC5dgar9ZEyx9
	TvEgq55Ih9aVvI+5f5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs4U9-0000000HCy9-3Wdk;
	Wed, 03 Apr 2024 17:33:17 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs4U7-0000000HCwz-1qVC
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 17:33:17 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so112852a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712165593; x=1712770393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdtmFuCQtKqL7XQB5yBZBXcGu9/7lkplVdP/I75yquc=;
        b=xTow7DSoo7rzFInKy413Uq5l4tLgItwfSmn13/61aEI/qwK1sDJhAUAMRLwcnqSQQE
         eqBVyWON0MRDxxihsm7WG2ilM8rwvJnjhm6+8EMZHmoa7eZD1+C9/H/Z60uqOpA+crZL
         w0mh5brvdCNLr0FD7njbO2gFGgwchxsjElmEvdSqoIO/C8nEnYXY1sspqEPDduPSe9W/
         GsiQ4VIJjCNGFR/xejOu3xg9fwPHqMeAejZ0qQor08QamjlbeT8sCtK6X261IXXYF899
         OBirRw73ebbvuyFQXNI7J4Ruh6xhgGU4oDTUvt9jnA8WtFPzAKqOv32H1Bef9ZGVHV0j
         sDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712165593; x=1712770393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdtmFuCQtKqL7XQB5yBZBXcGu9/7lkplVdP/I75yquc=;
        b=mSkbJeyFrKSmdnKBNHh+ocymHVeX4ScwFr9g4THsKW2QR9Xj/2B0X9NOvxBV8IyYt7
         aYJc8xUWtvG3eS3U3rq9G2/ZgDaJyf424XFoIrakfB3Xv5JKiLUQpJ77rqDAOoUnoYzS
         PjcGAJBiAuVqoetHPxlX13ASPIcqPCEIm1RRGr5b7d/z5LSVaOc6eASRorciIH8EjK5f
         vdq7eUifjh8qS3WNL+lGiP210VrBMWAop0S5NKQDJ2lv7khzN4EVKkA//OKjH8O2tJh7
         C9XUgbkKsdGOYXTdRB4YBuYggLDM8JXF01qkwQF7iTtSgBKrkxRp/M8toTJO5p81aGsr
         mUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcRwVCA+7NWaafXRfujIJaYkwt4ndnp2Hl2uOo07MZZCEfFV5J2YjKz6MzjDgkvP8yIVGhkFtaCbR862G/wS6Rp2gaEk0SPXTFRP74nIVc
X-Gm-Message-State: AOJu0YwP2r1NxdeNkOOd8u7Y6cZNKnsH6wqGAo49VyDOtnF5vE6F2LLG
	oxw0/2BFVfHuJwlqN5cOo9AS73gWEFiZXqcuXQcCiJTDDQlhT9siBd6jlvb11ZI=
X-Google-Smtp-Source: AGHT+IFBs/XuJJMQmrVQUKGAA9J8OyyBRTsBqretCIWUOoly3HJp/hb+dobtV3ICE1IfQjtI5xaAtQ==
X-Received: by 2002:a17:90a:886:b0:2a2:c354:64dd with SMTP id v6-20020a17090a088600b002a2c35464ddmr202756pjc.38.1712165593547;
        Wed, 03 Apr 2024 10:33:13 -0700 (PDT)
Received: from [10.0.16.165] ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id ga4-20020a17090b038400b002a04f430937sm3863480pjb.43.2024.04.03.10.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 10:33:13 -0700 (PDT)
Message-ID: <314e0216-a667-4bba-bdc7-3ae8af351800@rivosinc.com>
Date: Wed, 3 Apr 2024 10:33:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix vector state restore in rt_sigreturn()
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Vincent Chen <vincent.chen@sifive.com>, Ben Dooks
 <ben.dooks@codethink.co.uk>, Greentime Hu <greentime.hu@sifive.com>,
 Haorong Lu <ancientmodern4@gmail.com>, Jerry Shih <jerry.shih@sifive.com>,
 Nick Knight <nick.knight@sifive.com>, linux-kernel@vger.kernel.org,
 Charlie Jenkins <charlie@rivosinc.com>, Vineet Gupta <vgupta@kernel.org>
References: <20240403072638.567446-1-bjorn@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20240403072638.567446-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_103315_603249_5157BD38 
X-CRM114-Status: GOOD (  19.08  )
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

T24gNC8zLzI0IDAwOjI2LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IFRoZSBSSVNDLVYgVmVjdG9yIHNwZWNpZmljYXRp
b24gc3RhdGVzIGluICJBcHBlbmRpeCBEOiBDYWxsaW5nCj4gQ29udmVudGlvbiBmb3IgVmVjdG9y
IFN0YXRlIiBbMV0gdGhhdCAiRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2VzCj4gYWxsIGNh
bGxlci1zYXZlZCB2ZWN0b3IgcmVnaXN0ZXJzICh2MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZzdGFy
dCB0bwo+IGJlY29tZSB1bnNwZWNpZmllZC4iLiBJbiB0aGUgUklTQy1WIGtlcm5lbCB0aGlzIGlz
IGNhbGxlZCAiZGlzY2FyZGluZwo+IHRoZSB2c3RhdGUiLgo+Cj4gUmV0dXJuaW5nIGZyb20gYSBz
aWduYWwgaGFuZGxlciB2aWEgdGhlIHJ0X3NpZ3JldHVybigpIHN5c2NhbGwsIHZlY3Rvcgo+IGRp
c2NhcmQgaXMgYWxzbyBwZXJmb3JtZWQuIEhvd2V2ZXIsIHRoaXMgaXMgbm90IGFuIGlzc3VlIHNp
bmNlIHRoZQo+IHZlY3RvciBzdGF0ZSBzaG91bGQgYmUgcmVzdG9yZWQgZnJvbSB0aGUgc2lnY29u
dGV4dCwgYW5kIHRoZXJlZm9yZSBub3QKPiBjYXJlIGFib3V0IHRoZSB2ZWN0b3IgZGlzY2FyZC4K
Pgo+IFRoZSAibGl2ZSBzdGF0ZSIgaXMgdGhlIGFjdHVhbCB2ZWN0b3IgcmVnaXN0ZXIgaW4gdGhl
IHJ1bm5pbmcgY29udGV4dCwKPiBhbmQgdGhlICJ2c3RhdGUiIGlzIHRoZSB2ZWN0b3Igc3RhdGUg
b2YgdGhlIHRhc2suIEEgZGlydHkgbGl2ZSBzdGF0ZSwKPiBtZWFucyB0aGF0IHRoZSB2c3RhdGUg
YW5kIGxpdmUgc3RhdGUgYXJlIG5vdCBpbiBzeW5jaC4KPgo+IFdoZW4gdmVjdG9yaXplZCB1c2Vy
X2Zyb21fY29weSgpIHdhcyBpbnRyb2R1Y2VkLCBhbiBidWcgc25lYWtlZCBpbiBhdAo+IHRoZSBy
ZXN0b3JhdGlvbiBjb2RlLCByZWxhdGVkIHRvIHRoZSBkaXNjYXJkIG9mIHRoZSBsaXZlIHN0YXRl
Lgo+Cj4gQW4gZXhhbXBsZSB3aGVuIHRoaXMgZ28gd3Jvbmc6Cj4KPiAgIDEuIEEgdXNlcmxhbmQg
YXBwbGljYXRpb24gaXMgZXhlY3V0aW5nIHZlY3RvciBjb2RlCj4gICAyLiBUaGUgYXBwbGljYXRp
b24gcmVjZWl2ZXMgYSBzaWduYWwsIGFuZCB0aGUgc2lnbmFsIGhhbmRsZXIgaXMKPiAgICAgIGVu
dGVyZWQuCj4gICAzLiBUaGUgYXBwbGljYXRpb24gcmV0dXJucyBmcm9tIHRoZSBzaWduYWwgaGFu
ZGxlciwgdXNpbmcgdGhlCj4gICAgICBydF9zaWdyZXR1cm4oKSBzeXNjYWxsLgo+ICAgNC4gVGhl
IGxpdmUgdmVjdG9yIHN0YXRlIGlzIGRpc2NhcmRlZCB1cG9uIGVudGVyaW5nIHRoZQo+ICAgICAg
cnRfc2lncmV0dXJuKCksIGFuZCB0aGUgbGl2ZSBzdGF0ZSBpcyBtYXJrZWQgYXMgImRpcnR5Iiwg
aW5kaWNhdGluZwo+ICAgICAgdGhhdCB0aGUgbGl2ZSBzdGF0ZSBuZWVkIHRvIGJlIHN5bmNocm9u
aXplZCB3aXRoIHRoZSBjdXJyZW50Cj4gICAgICB2c3RhdGUuCj4gICA1LiBydF9zaWdyZXR1cm4o
KSByZXN0b3JlcyB0aGUgdnN0YXRlLCBleGNlcHQgdGhlIFZlY3RvciByZWdpc3RlcnMsCj4gICAg
ICBmcm9tIHRoZSBzaWdjb250ZXh0Cj4gICA2LiBydF9zaWdyZXR1cm4oKSByZXN0b3JlcyB0aGUg
VmVjdG9yIHJlZ2lzdGVycywgZnJvbSB0aGUgc2lnY29udGV4dCwKPiAgICAgIGFuZCBub3cgdGhl
IHZlY3Rvcml6ZWQgdXNlcl9mcm9tX2NvcHkoKSBpcyB1c2VkLiBUaGUgZGlydHkgbGl2ZQo+ICAg
ICAgc3RhdGUgZnJvbSB0aGUgZGlzY2FyZCBpcyBzYXZlZCB0byB0aGUgdnN0YXRlLCBtYWtpbmcg
dGhlIHZzdGF0ZQo+ICAgICAgY29ycnVwdC4KPiAgIDcuIHJ0X3NpZ3JldHVybigpIHJldHVybnMg
dG8gdGhlIGFwcGxpY2F0aW9uLCB3aGljaCBjcmFzaGVzIGR1ZSB0bwo+ICAgICAgY29ycnVwdGVk
IHZzdGF0ZS4KPgo+IE5vdGUgdGhhdCB0aGUgdmVjdG9yaXplZCB1c2VyX2Zyb21fY29weSgpIGlz
IGludm9rZWQgZGVwZW5kaW5nIG9uIHRoZQo+IHZhbHVlIG9mIENPTkZJR19SSVNDVl9JU0FfVl9V
Q09QWV9USFJFU0hPTEQuIERlZmF1bHQgaXMgNzY4LCB3aGljaAo+IG1lYW5zIHRoYXQgdmxlbiBo
YXMgdG8gYmUgbGFyZ2VyIHRoYW4gMTI4YiBmb3IgdGhpcyBidWcgdG8gdHJpZ2dlci4KPgo+IFRo
ZSBmaXggaXMgc2ltcGx5IHRvIG1hcmsgdGhlIGxpdmUgc3RhdGUgYXMgbm9uLWRpcnR5L2NsZWFu
IHByaW9yCj4gcGVyZm9ybWluZyB0aGUgdnN0YXRlIHJlc3RvcmUuCj4KPiBMaW5rOiBodHRwczov
L2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbC9yZWxlYXNlcy9kb3dubG9hZC9yaXNj
di1pc2EtcmVsZWFzZS04YWJkYjQxLTIwMjQtMDMtMjYvdW5wcml2LWlzYS1hc2NpaWRvYy5wZGYg
IyBbMV0KPiBSZXBvcnRlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNv
bT4KPiBSZXBvcnRlZC1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAa2VybmVsLm9yZz4KPiBGaXhl
czogYzJhNjU4ZDQxOTI0ICgicmlzY3Y6IGxpYjogdmVjdG9yaXplIGNvcHlfdG9fdXNlci9jb3B5
X2Zyb21fdXNlciIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgoKVGVzdGVkLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgoK
Rm9yIGNvbXBsZXRlbmVzcyAoYW5kIGZ1bikKCjEuIFRoZSBpc3N1ZSB3YXMgdHJpZ2dlcmVkIG9u
IGR1YWwgY29yZSBzcGlrZSBydW4gd2l0aCBhIHNlZW1pbmdseQpiZW5pZ24gd29ya2xvYWQgKHRo
ZSBrZXkgaXMgcmVwZWF0ZWQgZm9yay9leGVjdmUvZXhpdCB3aXRoIGEgbGl0dGxlIEkvTykKCiAg
ICBzb21lLXNoZWxsLXNjcmlwdC5zaAoKICAgICMhL2Jpbi9iYXNoCgogICAgKHdoaWxlIHRydWU7
IGRvIGxzOyBkb25lKSAmCgogICAgZm9yIGkgaW4gJHNlcSAoMSAyMCk7IGRvCiAgICDCoMKgIDxs
b25nIHJ1bm5pbmcgam9iPgogICAgZG9uZQoKMi4gVGhlIGlzc3VlIGluaXRpYWxseSBhcHBlYXJz
IGFzIGZvbGxvd3M6IFZlY3RvciBzdG9yZSBpbnN0cnVjdGlvbiwKYmVmb3JlIHN0YXJ0aW5nIHRv
IHJ1biBpbnZhbGlkYXRlcyBpdCdzIG93biBjb250ZXh0IChwYWdlIGZhdWx0IC0+CnByZWVtcHRp
b24gLT4gaGFuZGxlLXNpZ25hbCAtPiBzaWdyZXR1cm4gLT4gVklMTCAvIFYtY2xvYmJlciksIHNv
IHdoZW4KaXQgZXZlbnR1YWxseSBydW5zLCBpdCB0YWtlcyBhbiBpbGxlZ2FsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbiwgdGFraW5nCmRvd24gdGhlIGVudGlyZSBwcm9ncmFtLgoKVGh4LAotVmluZWV0
CsKgwqDCoAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
