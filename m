Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E890C00528
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7P+Dp9btUzNC1ql7HtZKvLpNwWPh1p+9YEtWH4r/gLg=; b=jRgRcTcYJ8coXl
	RxLjgnosq3DuRaNyCMkSwDtnPt1hwOXOKcdleTEMgGpFRx1izRnaAf0akZ66kOT/bcKNJlZV4L4Dp
	kn5JCMyjpgqybTXYqUGiJEnydNX+OevUXV9GOLrjP1JoUkZ19Jcpp8twRvt7IdUtfy01SQlDQ9d4t
	pmyaNVE0P9nefQlzIPiacSfE9CuBfJwicuboOu5J2jvMzd1GjidPxsjHKNUm699DYVgxXVmFENysN
	sXGHFgFyOR8DWo56AwBr9jcuFOc7xOnNwNmlsLeLqFeyP+vIiZb9wUH86nDo8zbRNKA1ioW47D/9U
	lG7eIeIQqVv2X8FrjY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkQX-00BMel-0I;
	Fri, 04 Aug 2023 02:20:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkQU-00BMdj-1D
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691115625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zdWnPk6F5WHva5/zuaCLJfKple79vvN3Kgzu831Wvw=;
	b=O84LxE2UaJwcFLi1f8YqLNGHoZ8FVQpA3EsAcRIfsYlKc/RPlBtXrNhqRYp9tDZ9Y5XWIo
	vPDzWy3MPU53keih2G/0InvfksHT8YfYX8iseZGh7OsSbG4In2gI7dGzZbHBkyJ+klz7kW
	CnIAx/lFcZJvKPJLXinG+S1xQLi0T4A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-UFxs4EabO8urzyCgoaT1_w-1; Thu, 03 Aug 2023 22:20:24 -0400
X-MC-Unique: UFxs4EabO8urzyCgoaT1_w-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-40831789e55so18305031cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115623; x=1691720423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zdWnPk6F5WHva5/zuaCLJfKple79vvN3Kgzu831Wvw=;
        b=QbswTRw/NhxlOjOzOj8XCFKLnm45IajD+/ihPVtOkmoGnj1bEDEQuymvvgV+ITMYiV
         gPZJ4bsQMxpr7iZZM6tMurlYz65j4OZ9Vl02TxDSqspiN6AoRrz0lGzxoPgcyPn2eQ7q
         UDLaq5lJMosBFKSGkafARbidYT1uQYbgo5pqyBu0cDZ2vkOJoD1eTlUAFaff5h4i4SiJ
         aBN9D7A5x0p1RCDGL96GEWDeCTmnmx121AmEkTLdBcnLEa4ODsSYcRHgO0kmBUMsX4sW
         wCZbIpjTfn4EUvNYy4jOk631Vzws4ka/rPTyhn1bcOHtMgkoy6Zs4aRxKfzofE/jXUhJ
         xyYg==
X-Gm-Message-State: AOJu0YwbIPY4Rkh7ZglFNun97yaf5d2nZiFQVBZZu2oRCXOM8yfwxRTJ
	SF+r/K0tovIWj+a1d2Orq63z+ShBECBvc1MfMZV10961kjVS6dVjaPlXoHhJArTcN3nqopOIgQ2
	uQBfRVTnnXVvPBmSHMXZo52plE3JiYZOd75WFQqPIeVRN
X-Received: by 2002:a05:622a:1746:b0:403:a9aa:571f with SMTP id l6-20020a05622a174600b00403a9aa571fmr755009qtk.16.1691115623681;
        Thu, 03 Aug 2023 19:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIDNlU9dDUknqAPNntSU8bwFxDV44Os16/hv3nXknImBVDvVlxKU8/v7gGSkdHVl8v+fMIo3sWZofirmJj1/c=
X-Received: by 2002:a05:622a:1746:b0:403:a9aa:571f with SMTP id
 l6-20020a05622a174600b00403a9aa571fmr754997qtk.16.1691115623460; Thu, 03 Aug
 2023 19:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230803051401.710236-2-leobras@redhat.com> <ZMuxYXQgR446JwUp@andrea>
In-Reply-To: <ZMuxYXQgR446JwUp@andrea>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 3 Aug 2023 23:20:12 -0300
Message-ID: <CAJ6HWG6rwi04eWuTDbx=WJABch59m5H2=N0BS3UQRTH2=c=-6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c macros
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Guo Ren <guoren@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_192026_488053_FE5D751B 
X-CRM114-Status: GOOD (  22.43  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMDo1M+KAr0FNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwMjoxMzo1
N0FNIC0wMzAwLCBMZW9uYXJkbyBCcmFzIHdyb3RlOgo+ID4gSSB1bmlmaWVkIHByZXZpb3VzIHBh
dGNoc2V0cyBpbnRvIGEgc2luZ2xlIG9uZSwgc2luY2UgdGhlIHdvcmsgaXMgcmVsYXRlZC4KPiA+
Cj4gPiBXaGlsZSBzdHVkeWluZyByaXNjdidzIGNtcHhjaGcuaCBmaWxlLCBJIGdvdCByZWFsbHkg
aW50ZXJlc3RlZCBpbgo+ID4gdW5kZXJzdGFuZGluZyBob3cgUklTQ1YgYXNtIGltcGxlbWVudGVk
IHRoZSBkaWZmZXJlbnQgdmVyc2lvbnMgb2YKPiA+IHtjbXAsfXhjaGcuCj4gPgo+ID4gV2hlbiBJ
IHVuZGVyc3Rvb2QgdGhlIHBhdHRlcm4sIGl0IG1hZGUgc2Vuc2UgZm9yIG1lIHRvIHJlbW92ZSB0
aGUKPiA+IGR1cGxpY2F0aW9ucyBhbmQgY3JlYXRlIG1hY3JvcyB0byBtYWtlIGl0IGVhc2llciB0
byB1bmRlcnN0YW5kIHdoYXQgZXhhY3RseQo+ID4gY2hhbmdlcyBiZXR3ZWVuIHRoZSB2ZXJzaW9u
czogSW5zdHJ1Y3Rpb24gc3VmaXhlcyAmIGJhcnJpZXJzLgo+ID4KPiA+IEFsc28sIGRpZCB0aGUg
c2FtZSBraW5kIG9mIHdvcmsgb24gYXRvbWljLmMuCj4gPgo+ID4gTm90ZSB0byBHdW8gUmVuOgo+
ID4gSSBkaWQgc29tZSBmdXJ0aGVyIGltcHJvdmVtZW50IGFmdGVyIHlvdXIgcHJldmlvdXMgcmV2
aWV3cywgc28gSSBlbmRlZAo+ID4gdXAgYWZyYWlkIGluY2x1ZGluZyB5b3VyIFJldmlld2VkLWJ5
IGJlZm9yZSBjaGVjaGluZyBpZiB0aGUgY2hhbmdlcyBhcmUKPiA+IG9rIGZvciB5b3UuIFBsZWFz
ZSBjaGVjayBpdCBvdXQgYWdhaW4sIEkganVzdCByZW1vdmVkIHNvbWUgaGVscGVyIG1hY3Jvcwo+
ID4gdGhhdCB3ZXJlIG5vdCBiZWluZyB1c2VkIGVsc2V3aGVyZSBpbiB0aGUga2VybmVsLgo+ID4K
PiA+IFRoYW5rcyEKPiA+IExlbwo+ID4KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHNxdWFzaGVkIGNt
cHhjaGc6Cj4gPiAtIFVuaWZpZWQgd2l0aCBhdG9taWMuYyBwYXRjaHNldAo+ID4gLSBSZWJhc2Vk
IG9uIHRvcCBvZiB0b3J2YWxkcy9tYXN0ZXIgKHRoYW5rcyBBbmRyZWEgUGFycmkhKQo+ID4gLSBS
ZW1vdmVkIGhlbHBlciBtYWNyb3MgdGhhdCB3ZXJlIG5vdCBiZWluZyB1c2VkIGVsc2V3aGVyZSBp
biB0aGUga2VybmVsLgo+ID4KPiA+IENoYW5nZXMgc2luY2UgKGNtcHhjaGcpIFJGQ3YzOgo+ID4g
LSBTcXVhc2hlZCB0aGUgNiBvcmlnaW5hbCBwYXRjaGVzIGluIDI6IG9uZSBmb3IgY21weGNoZyBh
bmQgb25lIGZvciB4Y2hnCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA0MDQx
NjM3NDEuMjc2MjE2NS0xLWxlb2JyYXNAcmVkaGF0LmNvbS8KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNl
IChjbXB4Y2hnKSBSRkN2MjoKPiA+IC0gRml4ZWQgIG1hY3JvcyB0aGF0IGRlcGVuZCBvbiBoYXZp
bmcgYSBsb2NhbCB2YXJpYWJsZSB3aXRoIGEgbWFnaWMgbmFtZQo+ID4gLSBQcmV2aW91cyBjYXN0
IHRvIChsb25nKSBpcyBub3cgb25seSBhcHBsaWVkIG9uIDQtYnl0ZXMgY21weGNoZwo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMzIxMDc0MjQ5LjIyMjE2NzQtMS1sZW9icmFz
QHJlZGhhdC5jb20vCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSAoY21weGNoZykgUkZDdjE6Cj4gPiAt
IEZpeGVkIHBhdGNoIDQvNiBzdWZmaXggZnJvbSAndy5hcXJsJyB0byAnLncuYXFybCcsIHRvIGF2
b2lkIGJ1aWxkIGVycm9yCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAzMTgw
ODAwNTkuMTEwOTI4Ni0xLWxlb2JyYXNAcmVkaGF0LmNvbS8KPiA+Cj4gPgo+ID4gTGVvbmFyZG8g
QnJhcyAoMyk6Cj4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIHhjaGcoKSBhc20gZnVu
Y3Rpb25zCj4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGNtcHhjaGcoKSBhc20gYW5k
IG1hY3Jvcwo+ID4gICByaXNjdi9hdG9taWMuaCA6IERlZHVwbGljYXRlIGFyY2hfYXRvbWljLioK
PiA+Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaCAgfCAxNjQgKysrKysrKyst
LS0tLS0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMzE4ICsrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNl
cnRpb25zKCspLCAzNTkgZGVsZXRpb25zKC0pCj4KPiBMR1RNLiAgRm9yIHRoZSBzZXJpZXMsCj4K
PiBSZXZpZXdlZC1ieTogQW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29tPgo+Cj4g
ICBBbmRyZWEKClRoYW5rcyBBbmRyZWEhCgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
