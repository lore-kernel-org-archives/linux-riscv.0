Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D1C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hnGpBe7leA4s0n9pSlgCEQbay8uBNSaqKLyNaWvN6I=; b=wS6XmMnHT2PUOW
	fCOVzWgReX9Cuvdo6MVljsqNc6oW5IFZnNL440c5X7ge/nhO+SPBysfM5oMyh4pT0Yk8pUmDHx1Ut
	wLeC110HyZPCZJF1DK0XHydsqeCy8LhumV7E6jIgInjPnTcQl35E5MJgvtJm/5/nPWy+HPNK0XVGC
	m9WI6I49nNBcOzkppZk29JoZZSaOU3jwhhmVPTWXwnamLoUhrLB8FDr3Z5mO7NjsARfb3Orfbq7aq
	TMVv4tW/zf2rwvEWNVwTwpqydyF+EsrmPFhq43iSU0gtSgo2YtPo+9Q8F8DXfU+q38hLhUbtDe+zX
	uZxoYN+p/GVymolIxQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCgx-0000000FNeG-1fi5;
	Fri, 27 Jun 2025 17:16:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBS3-0000000FC32-0CW5
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 15:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MWpQhfcMYiannUA+rJ5gOh1mNCZnzLMoO5gh2F8JmmM=;
	b=J7UV9jvriEonVqK7gcGeqnbgPgVRxrA7IZVtlIS28dkFaPEGOZUb182pYiRT6xjex1xvSU
	ayYfsOKcHqelusVBbop9PoXEwBQuoca3zrT7bHoyNoJXUHj0A35TwX7j+OpDeEsT2lSgmo
	JVG4TzkRw9gsqsBshvHBIlsjkh86Kww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-97GXj9IAOr-TOVrDEZcjDQ-1; Fri, 27 Jun 2025 11:49:31 -0400
X-MC-Unique: 97GXj9IAOr-TOVrDEZcjDQ-1
X-Mimecast-MFC-AGG-ID: 97GXj9IAOr-TOVrDEZcjDQ_1751039370
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530c186394so174025e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039370; x=1751644170;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MWpQhfcMYiannUA+rJ5gOh1mNCZnzLMoO5gh2F8JmmM=;
        b=fqfap1lMyfOUGQrScOJU2ark6D3a6tIrcUX2vhjLdkRop3UXWNHCdUjvKx0oOd5xog
         GIW+2J+sP9To4Ta4SzrO6VQg2rC3pD8YpF4SCR+O/oUMSUYUzLWHEUpL2swig/1SC4iI
         f1HUeVoKcztCB8JDvbfMszXAik19scJFc2XK6FGG1zBJZjhekZOj4r3XXipZG73cRKBO
         h3V671e9xYIaFMtFXbneo/NZ8duUZee0tmWyfeFPJiYLE6/26h8NsADoevrcFNr2ed/1
         wx2I5GrupFDBSnW3c87YPoQmUm8fLQSa1fz110Exq6KQbieBGdGysuzQ9diRlit1yhjQ
         CHhA==
X-Forwarded-Encrypted: i=1; AJvYcCWGDZRqfceQdyFDDFi0+bBX/dMvWaF8ZtaXB90Fpk3+da0qLC0iBY/iObw8ylYT2COhPvOwDpKnSa09eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPbizoFGKQyOYtwQCkOf0tav5XkYNrIyJ6Mq8Gc8hVzofAWGuW
	Y0fgsOHgBAYY3zZAEVXBH+so2E1p6UihxPFgcpIdSmSRHpdZ8rRi2r1gaA1vpkR6Ww+vTTtyJl+
	Y9BRdroE97fcreeldVby87SpGO5lGEiHIWDLPGvFtRa7FO1jdpz1vaVqM1NvGlM8DL1ON8w==
X-Gm-Gg: ASbGncv0SVLXMuhLlbZ89AaNzaQqp1TpD7tmS+CqUcXRShO+Ik2G3hJomXIeg3AsKqL
	70rP9AjfR1NrBRNLXLRxEQAafoXedRTmXvlasgXDDvBGCDCPK+k/seL4hhF4fDbXV/tNBC4MVI+
	JAwkipNjTz05pKSZWNzNanp9TUz5O0a+EPp4P5JgEvXsgm52yk+NvlEFLCuFouqFNkQLxNvrWXp
	RGSXTCm/pUty0eomK7Rjlne8fbUhdNGJxF/ef1atatZ3Qo+vyORSe/RgcX7I6zmBq7Lg6X8TAJY
	dvlwP1iew13SWDBVgrtOzw15wu5PUD7rwNzfKP9jxQUjhzMphCKiVgtOOFupPIb/59ogRre6q2y
	60cavFo6nun3flKPSogDIPiO/UM3dpgYhmjpuKEtZh+8f9Akxng==
X-Received: by 2002:a05:600c:4e8b:b0:453:8a63:b484 with SMTP id 5b1f17b1804b1-4538ee75d5emr46069235e9.30.1751039369707;
        Fri, 27 Jun 2025 08:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf34PqbJ8qzLhvpscXunFC56wXeCg2MQwLGMyj61jFGMywYScq+JOuap9GUf8ACPcIqst2ow==
X-Received: by 2002:a05:600c:4e8b:b0:453:8a63:b484 with SMTP id 5b1f17b1804b1-4538ee75d5emr46068935e9.30.1751039369204;
        Fri, 27 Jun 2025 08:49:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453923a22fbsm13811675e9.34.2025.06.27.08.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:49:28 -0700 (PDT)
Message-ID: <790e550f-3d6e-4eb2-be3c-a5feaaac1ce0@redhat.com>
Date: Fri, 27 Jun 2025 17:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
 <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
 <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
 <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
 <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jVI6T91KiR-8lFrdhdKvs-IOyFc8AIcPRphqbhwwCk0_1751039370
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_085719_153962_500DD594 
X-CRM114-Status: GOOD (  25.18  )
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

T24gMjcuMDYuMjUgMTc6MjksIExhbmNlIFlhbmcgd3JvdGU6Cj4gCj4gCj4gT24gMjAyNS82LzI3
IDE4OjEzLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMjcuMDYuMjUgMDk6MzYsIEJh
cnJ5IFNvbmcgd3JvdGU6Cj4+PiBPbiBGcmksIEp1biAyNywgMjAyNSBhdCA3OjE14oCvUE0gTGFu
Y2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5kZXY+IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+
IE9uIDIwMjUvNi8yNyAxNDo1NSwgQmFycnkgU29uZyB3cm90ZToKPj4+Pj4gT24gRnJpLCBKdW4g
MjcsIDIwMjUgYXQgNjo1MuKAr1BNIEJhcnJ5IFNvbmcgPDIxY25iYW9AZ21haWwuY29tPiB3cm90
ZToKPj4+Pj4+Cj4+Pj4+PiBPbiBGcmksIEp1biAyNywgMjAyNSBhdCA2OjIz4oCvUE0gTGFuY2Ug
WWFuZyA8aW93b3JrZXIwQGdtYWlsLmNvbT4KPj4+Pj4+IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4g
RnJvbTogTGFuY2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5kZXY+Cj4+Pj4+Pj4KPj4+Pj4+PiBB
cyBwb2ludGVkIG91dCBieSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9naWMgaW4KPj4+
Pj4+PiB0cnlfdG9fdW5tYXBfb25lKCkKPj4+Pj4+PiBjYW4gcmVhZCBwYXN0IHRoZSBlbmQgb2Yg
YSBQVEUgdGFibGUgaWYgYSBsYXJnZSBmb2xpbyBpcyBtYXBwZWQKPj4+Pj4+PiBzdGFydGluZyBh
dAo+Pj4+Pj4+IHRoZSBsYXN0IGVudHJ5IG9mIHRoYXQgdGFibGUuIEl0IHdvdWxkIGJlIHF1aXRl
IHJhcmUgaW4gcHJhY3RpY2UsIGFzCj4+Pj4+Pj4gTUFEVl9GUkVFIHR5cGljYWxseSBzcGxpdHMg
dGhlIGxhcmdlIGZvbGlvIDspCj4+Pj4+Pj4KPj4+Pj4+PiBTbyBsZXQncyBmaXggdGhlIHBvdGVu
dGlhbCBvdXQtb2YtYm91bmRzIHJlYWQgYnkgcmVmYWN0b3JpbmcgdGhlCj4+Pj4+Pj4gbG9naWMg
aW50bwo+Pj4+Pj4+IGEgbmV3IGhlbHBlciwgZm9saW9fdW5tYXBfcHRlX2JhdGNoKCkuCj4+Pj4+
Pj4KPj4+Pj4+PiBUaGUgbmV3IGhlbHBlciBub3cgY29ycmVjdGx5IGNhbGN1bGF0ZXMgdGhlIHNh
ZmUgbnVtYmVyIG9mIHBhZ2VzCj4+Pj4+Pj4gdG8gc2NhbiBieQo+Pj4+Pj4+IGxpbWl0aW5nIHRo
ZSBvcGVyYXRpb24gdG8gdGhlIGJvdW5kYXJpZXMgb2YgdGhlIGN1cnJlbnQgVk1BIGFuZAo+Pj4+
Pj4+IHRoZSBQVEUKPj4+Pj4+PiB0YWJsZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIGFkZGl0aW9uLCB0
aGUgImFsbC1vci1ub3RoaW5nIiBiYXRjaGluZyByZXN0cmljdGlvbiBpcyByZW1vdmVkIHRvCj4+
Pj4+Pj4gc3VwcG9ydCBwYXJ0aWFsIGJhdGNoZXMuIFRoZSByZWZlcmVuY2UgY291bnRpbmcgaXMg
YWxzbyBjbGVhbmVkIHVwCj4+Pj4+Pj4gdG8gdXNlCj4+Pj4+Pj4gZm9saW9fcHV0X3JlZnMoKS4K
Pj4+Pj4+Pgo+Pj4+Pj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8KPj4+
Pj4+PiBhNjk0Mzk4Yy05ZjAzLTQ3MzctODFiOS03ZTQ5Yzg1N2ZjYmVAcmVkaGF0LmNvbQo+Pj4+
Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gV2hhdCBhYm91dCA/Cj4+Pj4+Pgo+Pj4+Pj4gQXMgcG9pbnRlZCBv
dXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVkIHVubWFwIGxvZ2ljIGluCj4+Pj4+PiB0cnlfdG9f
dW5tYXBfb25lKCkKPj4+Pj4+IG1heSByZWFkIHBhc3QgdGhlIGVuZCBvZiBhIFBURSB0YWJsZSB3
aGVuIGEgbGFyZ2UgZm9saW8gc3BhbnMKPj4+Pj4+IGFjcm9zcyB0d28gUE1EcywKPj4+Pj4+IHBh
cnRpY3VsYXJseSBhZnRlciBiZWluZyByZW1hcHBlZCB3aXRoIG1yZW1hcCgpLiBUaGlzIHBhdGNo
IGZpeGVzIHRoZQo+Pj4+Pj4gcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgYWNjZXNzIGJ5IGNhcHBp
bmcgdGhlIGJhdGNoIGF0IHZtX2VuZCBhbmQKPj4+Pj4+IHRoZSBQTUQKPj4+Pj4+IGJvdW5kYXJ5
Lgo+Pj4+Pj4KPj4+Pj4+IEl0IGFsc28gcmVmYWN0b3JzIHRoZSBsb2dpYyBpbnRvIGEgbmV3IGhl
bHBlciwKPj4+Pj4+IGZvbGlvX3VubWFwX3B0ZV9iYXRjaCgpLAo+Pj4+Pj4gd2hpY2ggc3VwcG9y
dHMgYmF0Y2hpbmcgYmV0d2VlbiAxIGFuZCBmb2xpb19ucl9wYWdlcy4gVGhpcyBpbXByb3Zlcwo+
Pj4+Pj4gY29kZQo+Pj4+Pj4gY2xhcml0eS4gTm90ZSB0aGF0IHN1Y2ggY2FzZXMgYXJlIHJhcmUg
aW4gcHJhY3RpY2UsIGFzIE1BRFZfRlJFRQo+Pj4+Pj4gdHlwaWNhbGx5Cj4+Pj4+PiBzcGxpdHMg
bGFyZ2UgZm9saW9zLgo+Pj4+Pgo+Pj4+PiBTb3JyeSwgSSBtZWFudCB0aGF0IE1BRFZfRlJFRSB0
eXBpY2FsbHkgc3BsaXRzIGxhcmdlIGZvbGlvcyBpZiB0aGUKPj4+Pj4gc3BlY2lmaWVkCj4+Pj4+
IHJhbmdlIGRvZXNuJ3QgY292ZXIgdGhlIGVudGlyZSBmb2xpby4KPj4+Pgo+Pj4+IEhtbS4uLiBJ
IGdvdCBpdCB3cm9uZyBhcyB3ZWxsIDooIEl0J3MgdGhlIHBhcnRpYWwgY292ZXJhZ2UgdGhhdCB0
cmlnZ2Vycwo+Pj4+IHRoZSBzcGxpdC4KPj4+Pgo+Pj4+IGhvdyBhYm91dCB0aGlzIHJldmlzZWQg
dmVyc2lvbjoKPj4+Pgo+Pj4+IEFzIHBvaW50ZWQgb3V0IGJ5IERhdmlkWzFdLCB0aGUgYmF0Y2hl
ZCB1bm1hcCBsb2dpYyBpbgo+Pj4+IHRyeV90b191bm1hcF9vbmUoKQo+Pj4+IG1heSByZWFkIHBh
c3QgdGhlIGVuZCBvZiBhIFBURSB0YWJsZSB3aGVuIGEgbGFyZ2UgZm9saW8gc3BhbnMgYWNyb3Nz
IHR3bwo+Pj4+IFBNRHMsIHBhcnRpY3VsYXJseSBhZnRlciBiZWluZyByZW1hcHBlZCB3aXRoIG1y
ZW1hcCgpLiBUaGlzIHBhdGNoIGZpeGVzCj4+Pj4gdGhlIHBvdGVudGlhbCBvdXQtb2YtYm91bmRz
IGFjY2VzcyBieSBjYXBwaW5nIHRoZSBiYXRjaCBhdCB2bV9lbmQgYW5kCj4+Pj4gdGhlCj4+Pj4g
UE1EIGJvdW5kYXJ5Lgo+Pj4+Cj4+Pj4gSXQgYWxzbyByZWZhY3RvcnMgdGhlIGxvZ2ljIGludG8g
YSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKSwKPj4+PiB3aGljaCBzdXBwb3J0
cyBiYXRjaGluZyBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzLiBUaGlzIGltcHJvdmVzIGNv
ZGUKPj4+PiBjbGFyaXR5LiBOb3RlIHRoYXQgc3VjaCBib3VuZGFyeS1zdHJhZGRsaW5nIGNhc2Vz
IGFyZSByYXJlIGluCj4+Pj4gcHJhY3RpY2UsIGFzCj4+Pj4gTUFEVl9GUkVFIHdpbGwgdHlwaWNh
bGx5IHNwbGl0IGEgbGFyZ2UgZm9saW8gaWYgdGhlIGFkdmljZSByYW5nZSBkb2VzCj4+Pj4gbm90
Cj4+Pj4gY292ZXIgdGhlIGVudGlyZSBmb2xpby4KPj4+Cj4+PiBJIGFzc3VtZSB0aGUgb3V0LW9m
LWJvdW5kcyBhY2Nlc3MgbXVzdCBiZSBmaXhlZCwgZXZlbiB0aG91Z2ggaXQgaXMgdmVyeQo+Pj4g
dW5saWtlbHkuIEl0IG1pZ2h0IG9jY3VyIGFmdGVyIGEgbGFyZ2UgZm9saW8gaXMgbWFya2VkIHdp
dGggTUFEVl9GUkVFIGFuZAo+Pj4gdGhlbiByZW1hcHBlZCB0byBhbiB1bmFsaWduZWQgYWRkcmVz
cywgcG90ZW50aWFsbHkgY3Jvc3NpbmcgdHdvIFBURQo+Pj4gdGFibGVzLgo+Pgo+PiBSaWdodC4g
SWYgaXQgY2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVzZXJzcGFjZSwgaXQgZG9lc24ndCBtYXR0ZXIg
aG93Cj4+IGxpa2VseS9jb21tb24vd2hhdGV2ZXIgaXQgaXMuIEl0IG11c3QgYmUgZml4ZWQuCj4g
Cj4gQWdyZWVkLiBJdCBtdXN0IGJlIGZpeGVkIHJlZ2FyZGxlc3Mgb2YgaG93IHJhcmUgdGhlIHNj
ZW5hcmlvIGlzIDspCj4gCj4+Cj4+Pgo+Pj4gQSBiYXRjaCBzaXplIGJldHdlZW4gMiBhbmQgbnJf
cGFnZXMgLSAxIGlzIHByYWN0aWNhbGx5IHJhcmUsIGFzIHdlCj4+PiB0eXBpY2FsbHkKPj4+IHNw
bGl0IGxhcmdlIGZvbGlvcyB3aGVuIE1BRFZfRlJFRSBkb2VzIG5vdCBjb3ZlciB0aGUgZW50aXJl
IGZvbGlvIHJhbmdlLgo+Pj4gQ2FzZXMgd2hlcmUgYSBiYXRjaCBvZiBzaXplIDIgb3IgbnJfcGFn
ZXMgLSAxIG9jY3VycyBtYXkgb25seSBoYXBwZW4gaWYgYQo+Pj4gbGFyZ2UgZm9saW8gaXMgcGFy
dGlhbGx5IHVubWFwcGVkIGFmdGVyIGJlaW5nIG1hcmtlZCBNQURWX0ZSRUUsIHdoaWNoIGlzCj4+
PiBxdWl0ZSBhbiB1bnVzdWFsIHBhdHRlcm4gaW4gdXNlcnNwYWNlLgo+Pgo+PiBJIHRoaW5rIHRo
ZSBwb2ludCBpcyByYXRoZXIgIlNpbXBsaWZ5IHRoZSBjb2RlIGJ5IG5vdCBzcGVjaWFsLWNhc2lu
ZyBmb3IKPj4gY29tcGxldGVseSBtYXBwZWQgZm9saW9zLCB0aGVyZSBpcyBubyByZWFsIHJlYXNv
biB3aHkgd2UgY2Fubm90IGJhdGNoCj4+IHJhbmdlcyB0aGF0IGRvbid0IGNvdmVyIHRoZSBjb21w
bGV0ZSBmb2xpby4iLgo+IAo+IFllYWguIFRoYXQgbWFrZXMgdGhlIGNvZGUgY2xlYW5lciBhbmQg
bW9yZSBnZW5lcmljLCBhcyB0aGVyZSBpcyBubwo+IHN0cm9uZyByZWFzb24gdG8gc3BlY2lhbC1j
YXNlIGZvciBmdWxseSBtYXBwZWQgZm9saW9zIDspCj4gCj4gQmFzZWQgb24gdGhhdCwgSSB0aGlu
ayB3ZSdyZSBvbiB0aGUgc2FtZSBwYWdlIG5vdy4gSSdkIGxpa2UgdG8gcG9zdAo+IHRoZSBmb2xs
b3dpbmcgY29tbWl0IG1lc3NhZ2UgZm9yIHRoZSBuZXh0IHZlcnNpb246Cj4gCj4gYGBgCj4gQXMg
cG9pbnRlZCBvdXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVkIHVubWFwIGxvZ2ljIGluIHRyeV90
b191bm1hcF9vbmUoKQo+IG1heSByZWFkIHBhc3QgdGhlIGVuZCBvZiBhIFBURSB0YWJsZSB3aGVu
IGEgbGFyZ2UgZm9saW8ncyBQVEUgbWFwcGluZ3MKPiBhcmUgbm90IGZ1bGx5IGNvbnRhaW5lZCB3
aXRoaW4gYSBzaW5nbGUgcGFnZSB0YWJsZS4KPiAKPiBXaGlsZSB0aGlzIHNjZW5hcmlvIG1pZ2h0
IGJlIHJhcmUsIGFuIGlzc3VlIHRyaWdnZXJhYmxlIGZyb20gdXNlcnNwYWNlIG11c3QKPiBiZSBm
aXhlZCByZWdhcmRsZXNzIG9mIGl0cyBsaWtlbGlob29kLiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBv
dXQtb2YtYm91bmRzCj4gYWNjZXNzIGJ5IHJlZmFjdG9yaW5nIHRoZSBsb2dpYyBpbnRvIGEgbmV3
IGhlbHBlciwgZm9saW9fdW5tYXBfcHRlX2JhdGNoKCkuCj4gCj4gVGhlIG5ldyBoZWxwZXIgY29y
cmVjdGx5IGNhbGN1bGF0ZXMgdGhlIHNhZmUgYmF0Y2ggc2l6ZSBieSBjYXBwaW5nIHRoZQo+IHNj
YW4gYXQgYm90aCB0aGUgVk1BIGFuZCBQTUQgYm91bmRhcmllcy4gVG8gc2ltcGxpZnkgdGhlIGNv
ZGUsIGl0IGFsc28KPiBzdXBwb3J0cyBwYXJ0aWFsIGJhdGNoaW5nIChpLmUuLCBhbnkgbnVtYmVy
IG9mIHBhZ2VzIGZyb20gMSB1cCB0byB0aGUKPiBjYWxjdWxhdGVkIHNhZmUgbWF4aW11bSksIGFz
IHRoZXJlIGlzIG5vIHN0cm9uZyByZWFzb24gdG8gc3BlY2lhbC1jYXNlCj4gZm9yIGZ1bGx5IG1h
cHBlZCBmb2xpb3MuCj4gYGBgCj4gCj4gU28sIHdkeXQ/CgpTb3VuZHMgZ29vZCB0byBtZS4KCi0t
IApDaGVlcnMsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
