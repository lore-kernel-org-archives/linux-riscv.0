Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9674BC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqe17Q45pUXNB78M8K+XrAmiqToSlapBMJGqn4AH89k=; b=hReS3xSW0LLXb8
	voFqp8dJfL61flJzkx+qyxaXNB6A+ViPjwPD95iAb8qaAxeSOHqxLX2gbzkmZOCSqoKQ2MaF2aekB
	dvSOzXcL+zETHBVF+cLnS562fTtFVQ+7w/ath2kNff78KqS+So++TR2bkEoXcDlTw0b2ym2ww6mCP
	FG0jLJnpjBNlbuRczu4xosRvhPqltYUK7prLap/xDe1C0Q6Zd/akRMc8ACpeRpTzdYw7wK0rKQHjG
	FqQ4lorpZkJkliy2B08f0Ul109IP4jmsGKHNFakwvCWzmc+/zKUpBAxqaqsGiabCeffHSJd2WIEve
	JrBiUnuw8zlIA2+6INkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmywp-00000000LCF-3YVu;
	Wed, 20 Mar 2024 16:37:51 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmywm-00000000LAl-1Qqa
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 16:37:50 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-60a434ea806so75849797b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710952667; x=1711557467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzn8sMMB/Oo8ceKtAuHhp4PlgYxQPVcanxyX3umUrKQ=;
        b=FWqsyzGdMtW5ij3AK5wVNX31Q9/OhRfbbCmHm/PddvN4RABkaydPhbgbr7mNVdIyNi
         golfRji4ff/mogxGyS5olOT++JOc5AQ+i5YxC5bb2KRJkhN9XBtue0MjS3q/YD31YK1N
         7vyyE+M/3lRVALLrEcilmthBPgxur1spUU3IqCcYLKh1BESPFf34AlfPT5X3PMthgaog
         tHEoBZgMxG5Ljhr83/6++Y2Z9YZvXOmaVOLctvc2QY63NzjwEtG+K6oyd8pZGhlzgMET
         C1BpKrClkn5JU/lqejWTIC9f2MQFUP3JTSRlrN6+M5Zne8FD3tRvCKl1YmQ5Oeqoy+5n
         PBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952667; x=1711557467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzn8sMMB/Oo8ceKtAuHhp4PlgYxQPVcanxyX3umUrKQ=;
        b=JKQ5yUNM/j8NweBklYrrUrUaSvPgl21fset+go44tifYQXsnMf2JpSh3er2Flh0bsP
         Fzn8EMMeXdai6jcCJGaXG5CPLkMtJqp1FBrLTao3LlALASmhG7wpCipS52tQ82GAENWC
         vviRBL7iVL1+77P/sK2hF20Y9lELgXFLHhYbAG1w+EmRyT1LVW22rJ0PeAhGmPbq/fNR
         uq8BRPE9XhI5MrlCbXkcGJGAsOzRDk2HQ1JCQAMeQ2o8QqMLjDGU2icuj9uZQ0P7ECo3
         kUw+30iy7DVb+YPOBmpreWznFDi29Vhova6DCujRzQYHoTOxgIGmMpbklOSzPpY/xrlp
         wg3g==
X-Forwarded-Encrypted: i=1; AJvYcCXj4HX5Lh3SWo+qiAzYRx/0MOm/JEK6pQ9G5NO+/1QgxgBRzQMgPlSYFh4SrB+HMGD1eRwOhHSQIu8IbFFbtZE2++lj+MeKpYdZ8k/wu0Vy
X-Gm-Message-State: AOJu0YwnZF79KdcBdOb5naeZ0zLVa9BP9w73CVHdVApYJOXrHYvRwjRb
	h/E7WfbXNp+uCB5g5KtSuUpt4wkjFDC0tmGXC1PNKE9Z/U38wHLbqLgz8tQqdnZyMJurolSD3iB
	GqELMVVngK/fL+lIendyBT8kgbcN4xEcscLmLsw==
X-Google-Smtp-Source: AGHT+IHZ5bZcpbfxkMsjRrINc0mWsf0NPrQlnBlqnVR2xAqjXulIM8jYwQB1QIgn+eKWiHW2SP6jrnZ5psftmqhGKXc=
X-Received: by 2002:a81:5cc5:0:b0:60a:1f3:5964 with SMTP id
 q188-20020a815cc5000000b0060a01f35964mr20275356ywb.31.1710952667084; Wed, 20
 Mar 2024 09:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <4fe4567b-96be-4102-952b-7d39109b2186@yadro.com> <CABgGipUGCVjy5wG1TMDpgf1Zn7Jcx5Lg1CUzQ0YLr5nOPf-TUg@mail.gmail.com>
 <51f21b87-ebed-4411-afbc-c00d3dea2bab@yadro.com> <bd7c2263-4e81-4be6-af4d-22a0842ba2e4@ghiti.fr>
 <CABgGipUtzLG2tffXOdV7-7ss+_doQvjxfwzVbfzyO56J3_3X0Q@mail.gmail.com>
 <f4506e4f-fca5-49ac-868e-f42f1f23ce9b@ghiti.fr> <c1d994e2-8f0c-4039-b790-a426fc48055c@sifive.com>
 <CABgGipX_WuB5pZ4xgLcBZF7WpHmt_J9m48k+7n-UwH-jUtXJ1A@mail.gmail.com> <79b47f1d-8332-476c-b827-28043d7b3b76@ghiti.fr>
In-Reply-To: <79b47f1d-8332-476c-b827-28043d7b3b76@ghiti.fr>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 21 Mar 2024 00:37:00 +0800
Message-ID: <CABgGipVssDpW26b8_JdrgP+BFuaAG_A4xi7+o6NU9fmZA8D2YQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel
 preemption for RISC-V
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, rostedt@goodmis.org, mingo@redhat.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, guoren@kernel.org, 
	Jessica Clarke <jrtc27@jrtc27.com>, kernel@esmil.dk, linux-riscv@lists.infradead.org, 
	linux@yadro.com, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_093748_429408_C89EE680 
X-CRM114-Status: GOOD (  42.80  )
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

T24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMTA6NTDigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4gT24gMTEvMDMvMjAyNCAxNToyNCwgQW5keSBDaGl1IHdyb3Rl
Ogo+ID4gT24gVGh1LCBNYXIgNywgMjAyNCBhdCAxMTo1N+KAr1BNIFNhbXVlbCBIb2xsYW5kCj4g
PiA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPj4gSGkgQWxleCwKPiA+Pgo+
ID4+IE9uIDIwMjQtMDMtMDcgNzoyMSBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4+PiBC
dXQgVEJILCBJIGhhdmUgc3RhcnRlZCB0aGlua2luZyBhYm91dCB0aGUgaXNzdWUgeW91ciBwYXRj
aCBpcyB0cnlpbmcgdG8gZGVhbAo+ID4+PiB3aXRoLiBJSVVDIHlvdSdyZSB0cnlpbmcgdG8gYXZv
aWQgdHJhcHMgKG9yIHNpbGVudCBlcnJvcnMpIHRoYXQgY291bGQgaGFwcGVuCj4gPj4+IGJlY2F1
c2Ugb2YgY29uY3VycmVudCBhY2Nlc3NlcyB3aGVuIHBhdGNoaW5nIGlzIGhhcHBlbmluZyBvbiBh
IHBhaXIgYXVpcGMvamFybC4KPiA+Pj4KPiA+Pj4gSSdtIHdvbmRlcmluZyBpZiBpbnN0ZWFkLCB3
ZSBjb3VsZCBub3QgYWN0dWFsbHkgaGFuZGxlIHRoZSBwb3RlbnRpYWwgdHJhcHM6Cj4gPj4+IGJl
Zm9yZSBzdG9yaW5nIHRoZSBhdWlwYyArIGphbHIgcGFpciwgd2UgY291bGQgdXNlIGEgd2VsbC1p
ZGVudGlmaWVkIHRyYXBwaW5nCj4gPj4+IGluc3RydWN0aW9uIHRoYXQgY291bGQgYmUgcmVjb2du
aXplZCBpbiB0aGUgdHJhcCBoYW5kbGVyIGFzIGEgbGVnaXRpbWF0ZSB0cmFwLgo+ID4+PiBGb3Ig
ZXhhbXBsZToKPiA+Pj4KPiA+Pj4KPiA+Pj4gYXVpcGMgIC0tPiAgYXVpcGMgIC0tPiAgWFhYWCAg
LS0+ICBYWFhYICAtLT4gIGF1aXBjCj4gPj4+IGphbHIgICAgICAgIFhYWFggICAgICAgIFhYWFgg
ICAgICAgamFsciAgICAgICBqYWxyCj4gPj4+Cj4gPj4+Cj4gPj4+IElmIGEgY29yZSB0cmFwcyBv
biBhIFhYWFggaW5zdHJ1Y3Rpb24sIHdlIGtub3cgdGhpcyBhZGRyZXNzIGlzIGJlaW5nIHBhdGNo
ZWQsIHNvCj4gPj4+IHdlIGNhbiByZXR1cm4gYW5kIHByb2JhYmx5IHRoZSBwYXRjaGluZyB3aWxs
IGJlIG92ZXIuIFdlIGNvdWxkIGFsc28gaWRlbnRpZnkKPiA+Pj4gaGFsZiBwYXRjaGVkIHdvcmQg
aW5zdHJ1Y3Rpb24gKEkgbWVhbiB3aXRoIG9ubHkgWFgpLgo+ID4+IFVuZm9ydHVuYXRlbHkgdGhp
cyBkb2VzIG5vdCB3b3JrIHdpdGhvdXQgc29tZSBmZW5jZS5pIGluIHRoZSBtaWRkbGUuIFRoZQo+
ID4+IHByb2Nlc3NvciBpcyBmcmVlIHRvIGZldGNoIGFueSBpbnN0cnVjdGlvbiB0aGF0IGhhcyBi
ZWVuIHdyaXR0ZW4gdG8gYSBsb2NhdGlvbgo+ID4+IHNpbmNlIHRoZSBsYXN0IGZlbmNlLmkgaW5z
dHJ1Y3Rpb24uIFNvIGl0IHdvdWxkIGJlIHBlcmZlY3RseSB2YWxpZCB0byBmZXRjaCB0aGUKPiA+
PiBvbGQgYWl1cGMgYW5kIG5ldyBqYWxyIG9yIHZpY2UgdmVyc2EgYW5kIG5vdCB0cmFwLiBUaGlz
IHdvdWxkIGhhcHBlbiBpZiwgZm9yCj4gPj4gZXhhbXBsZSwgdGhlIHR3byBpbnN0cnVjdGlvbnMg
d2VyZSBpbiBkaWZmZXJlbnQgY2FjaGUgbGluZXMsIGFuZCBvbmx5IG9uZSBvZiB0aGUKPiA+PiBj
YWNoZSBsaW5lcyBnb3QgZXZpY3RlZCBhbmQgcmVmaWxsZWQuCj4gPj4KPiA+PiBCdXQgc2VuZGlu
ZyBhbiBJUEkgdG8gcnVuIHRoZSBmZW5jZS5pIHByb2JhYmx5IG5lZ2F0ZXMgdGhlIHBlcmZvcm1h
bmNlIGJlbmVmaXQuCj4gPiBNYXliZSBzb21ldGhpbmcgbGlrZSB4ODYsIHdlIGNhbiBob29rIGZ0
cmFjZV9yZXBsYWNlX2NvZGUoKSBvdXQgYW5kCj4gPiBiYXRjaCBzZW5kIElQSXMgdG8gcHJldmVu
dCBzdG9ybXMgb2YgcmVtb3RlIGZlbmNlcy4gVGhlIHNvbHV0aW9uIEFsZXgKPiA+IHByb3Bvc2Vk
IGNhbiBzYXZlIHRoZSBjb2RlIHNpemUgZm9yIGZ1bmN0aW9uIGVudHJpZXMuIEJ1dCB3ZSBoYXZl
IHRvCj4gPiBzZW5kIG91dCByZW1vdGUgZmVuY2VzIGF0IGVhY2ggIi0tPiIgdHJhbnNpdGlvbiwg
d2hpY2ggaXMgNCBzZXRzIG9mCj4gPiByZW1vdGUgSVBJcy4gT24gdGhlIG90aGVyIGhhbmQsIHRo
aXMgc2VyaWVzIGluY3JlYXNlcyB0aGUgcGVyLWZ1bmN0aW9uCj4gPiBwYXRjaCBzaXplIHRvIDI0
IGJ5dGVzLiBIb3dldmVyLCBpdCBkZWNyZWFzZXMgdGhlIG51bWJlciBvZiByZW1vdGUKPiA+IGZl
bmNlcyB0byAxIHNldC4KPiA+Cj4gPiBUaGUgcGVyZm9ybWFuY2UgaGl0IGNvdWxkIGJlIG9ic2Vy
dmFibGUgZm9yIHRoZSBhdWlwYyArIGphbHIgY2FzZSwKPiA+IGJlY2F1c2UgYWxsIHJlbW90ZSBj
b3JlcyB3aWxsIGJlIGV4ZWN1dGluZyBvbiBYWFhYIGluc3RydWN0aW9ucyBhbmQKPiA+IHRha2Ug
YSB0cmFwIGF0IGVhY2ggZnVuY3Rpb24gZW50cnkgZHVyaW5nIGNvZGUgcGF0Y2hpbmcuCj4gPgo+
ID4gQmVzaWRlcywgdGhpcyBzZXJpZXMgd291bGQgZ2l2ZSB1cyBhIGNoYW5jZSBub3QgdG8gc2Vu
ZCBhbnkgcmVtb3RlCj4gPiBmZW5jZXMgaWYgd2Ugd2VyZSB0byBjaGFuZ2Ugb25seSB0aGUgZGVz
dGluYXRpb24gb2YgZnRyYWNlIChlLmcuIHRvIGEKPiA+IGN1c3RvbSBmdHJhY2UgdHJhbXBvbGlu
ZSkuIEFzIGl0IHdvdWxkIGJlIGEgcmVndWxhciBzdG9yZSBmb3IgdGhlCj4gPiB3cml0ZXIgYW5k
IHJlZ3VsYXIgbG9hZCBmb3IgcmVhZGVycywgb25seSBmZW5jZSB3LHcgaXMgbmVlZGVkLgo+ID4g
SG93ZXZlciwgSSBhbSBub3QgdmVyeSBjZXJ0YWluIG9uIGhvdyBvZnRlbiB3b3VsZCBiZSBmb3Ig
dGhpcwo+ID4gcGFydGljdWxhciB1c2UgY2FzZS4gSSdkIG5lZWQgc29tZSB0aW1lIHRvIGludmVz
dGlnYXRlIGl0Lgo+ID4KPiA+PiBNYXliZSB0aGVyZSBpcyBzb21lIGNyZWF0aXZlIHdheSB0byBv
dmVyY29tZSB0aGlzLgo+ID4+Cj4gPj4+IEJ1dCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhhdCdz
IGNvbXBsZXRlbHkgc3R1cGlkIGFuZCBJIGRpZCBub3QgdW5kZXJzdGFuZCB0aGUKPiA+Pj4gcHJv
YmxlbSwgc2luY2UgbXkgcGF0Y2hzZXQgdG8gc3VwcG9ydCBzdnZwdGMsIEkgYW0gd29uZGVyaW5n
IGlmIGl0IGlzIG5vdCBtb3JlCj4gPj4+IHBlcmZvcm1hbnQgdG8gYWN0dWFsbHkgdGFrZSB2ZXJ5
IHVubGlrZWx5IHRyYXBzIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGF2b2lkIHRoZW0uCj4gPj4gSSBh
Z3JlZSBpbiBnZW5lcmFsIGl0IGlzIGEgZ29vZCBpZGVhIHRvIG9wdGltaXplIHRoZSBob3QgcGF0
aCBsaWtlIHRoaXMuCj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IFNhbXVlbAo+ID4+Cj4gPiBSZWdh
cmRzLAo+ID4gQW5keQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+Cj4gU28gaW5kZWVkIG15IHNvbHV0aW9uIHdhcyB3
YXkgdG9vIG5haXZlIGFuZCB3ZSd2ZSBiZWVuIGRpc2N1c3NpbmcgdGhhdAo+IHdpdGggQmrDtnJu
IGxhdGVseS4gSGUgd29ya2VkIGEgbG90IG9uIHRoYXQgYW5kIGNhbWUgdXAgd2l0aCB0aGUgc29s
dXRpb24KPiBoZSBwcm9wb3NlZCBoZXJlCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvODd6ZnYwb25yZS5mc2ZAYWxsLnlvdXIuYmFzZS5hcmUuYmVsb25nLnRvLnVzLwo+Cj4g
VGhlIHRoaW5nIGlzIGZ0cmFjZSBzZWVtcyB0byBiZSBxdWl0ZSBicm9rZW4gYXMgdGhlIGZ0cmFj
ZSBrc2VsZnRlc3RzCj4gcmFpc2UgYSBsb3Qgb2YgaXNzdWVzIHdoaWNoIEkgaGF2ZSBzdGFydGVk
IHRvIGRlYnVnIGJ1dCBhcmUgbm90IHRoYXQKPiBlYXN5LCBzbyB3ZSBhcmUgd29uZGVyaW5nIGlm
ICpzb21lb25lKiBzaG91bGQgbm90IHdvcmsgb24gQmpvcm4ncwo+IHNvbHV0aW9uIChvciBhbm90
aGVyLCBvcGVuIHRvIGRpc2N1c3Npb25zKSBmb3IgNi4xMC4gQEFuZHkgV0RZVD8gRG8geW91Cj4g
aGF2ZSBmcmVlIGN5Y2xlcz8gQmrDtnJuIGNvdWxkIHdvcmsgb24gdGhhdCB0b28gKGFuZCBJJ2xs
IGhlbHAgaWYgbmVlZGVkKS4KCkRvIHlvdSBtZWFuIHRoZSBGVFJBQ0VfU1RBUlRVUF9URVNULCBv
ciBzb21ldGhpbmcgZWxzZT8gSSBhbSBhbHNvCmhhcHB5IHRvIGhlbHAgb24gdGV4dCBwYXRjaGlu
ZyBpc3N1ZXMuIEl0IHdvdWxkIGJlIGdyZWF0IGlmIHdlIGNvdWxkCmRlZmluZSB0aGUgcmVtYWlu
aW5nIHdvcmtzIGFuZCBzaGFyZSB0aGVtLiBDdXJyZW50bHkgSSBhbSBmb2N1c2luZyBvbgpoYXZp
bmcgZHluYW1pYyBmdHJhY2Ugd2l0aCBwcmVlbXB0aW9uIGFuZCBnZXR0aW5nIHJpZCBvZgpzdG9w
X21hY2hpbmUoKSB3aGlsZSBwYXRjaGluZyBjb2RlLiBJIGFtIGdvaW5nIHRvIHNwaW4gYSByZXZp
c2lvbiBvZgp0aGlzIHBhdGNoIHNlcmllcyBpbiBhIGZldyBkYXlzIGlmIHBvc3NpYmxlLiBUaGVy
ZSBhcmUgcXVpdGUgc29tZQp0aGluZ3MgbmVlZGVkIHRvIGJlIGRpc2N1c3NlZCBhbmQgSSdkIGxp
a2UgdG8gam9pbiBhbnkgY29udmVyc2F0aW9uIQoKPgo+IExldCBtZSBrbm93IHdoYXQgeW91IHRo
aW5rIQo+Cj4gQWxleAo+Cj4KCkNoZWVycywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
