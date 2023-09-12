Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A07CA0EC6
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 00:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFdSAqPUdXPtTAzMcWPnIilgIBVtOnt8cuAz2se38Ic=; b=0Qyv8iBBAhViby
	0xdxJjUeb/GWQ7mRKHKKigr88m5pifltf9k1xPyQ77Hp5Wxkj0ALYAgwGwvLNm7Ozkor3aPj0sWOl
	1rXSwbwG7wEbJuGh19b1rJLBk7Z5cncPaBe0va2v47dYK43wkZ9CYXnEYDclcZb7UbikeDGg9z/hL
	PAob3+5nH+3pT53WBcpDGhn3U8qpbBeDsi9mmmX5nbb04Slh5JPcNRJJzHO5EArJMSo1nX0O7nMBR
	fjY/n1/45G6yzUd2CetvwBn2vwbEDfy/BR6A7ZMaxDvWQFqpKNlgyTg0FmSn3TSCNmC3mctBbeOHu
	lSKQm+VRY2eF8U+pyXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrBA-001fWK-1M;
	Tue, 12 Sep 2023 00:22:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrB7-001fVb-1C
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 00:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694478172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ESV40xUlx4Zvo6LdHszoOUWYzAUZO18uva7dc5H6tc=;
	b=NxIoSqnlw8RWGm1UVOoKaF1Qq4pW23aSRMjgu0MwLrlZeL0lNB70AAEy/TG0+Bxv7+8gBc
	48fxKUSRfA5S95k1UYfV+P+ImfpkJSjCvjEhmsO55vgeuu8J5DnDK2PVomDwLfScLW43Um
	G4GZ4o8rIssfc+tEMPD2sxA4YMdJnp4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-tITOTCsZNt2wDQIWTYxalg-1; Mon, 11 Sep 2023 20:22:50 -0400
X-MC-Unique: tITOTCsZNt2wDQIWTYxalg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76de9c1d13cso555396685a.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 17:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694478170; x=1695082970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ESV40xUlx4Zvo6LdHszoOUWYzAUZO18uva7dc5H6tc=;
        b=t65XeG6zEMbY3X75zp7+OhM/MmPvF9olRoYHnM1ice94S7YRaIg3MrW52tXmdBBU0V
         r9BTBYavajDed0SN5CQRiUJ9IONYoGY/CJIXdbvmxYXLUpxshaP0JAQ+O/9LDvKISGYw
         ktRDIA27y2jkYO36UP2owu6ocSWv4aNyP82DqVH2TvUYq/TXUjBaFLGe/Z8UUCr2UJeL
         J2QbTu8CwW6NwDjWUNU5RJHHh0ItkhJt8lfJ1EqqHs7ktJqa1F8GcI0TSLJoKLo1ahl7
         6ec7zUWzFXjKeRrTmWEY6sHc3xz+VnjqP/tpfYuQbwP43I/5ALEu9WNh91C17MLKax8x
         oa+w==
X-Gm-Message-State: AOJu0YzN3QcNZez/AzPDD0/J8VEkoTjBoTCA9jL/oC85VE7Xq8+s5CTE
	rmzoL3fcbgHDDuu2D2dZpQtaAsc8n1hg3Tt8wpR0g10U+MuD+lsj4/5XoP/zR0dxVt6R/UT0S5f
	QOOjDAdxJoQv//cK1GHGbiEiy76XqAsVRZYXvitEpUWlE
X-Received: by 2002:a05:620a:4d4:b0:76f:e1f:c0c7 with SMTP id 20-20020a05620a04d400b0076f0e1fc0c7mr10583968qks.27.1694478170395;
        Mon, 11 Sep 2023 17:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIjneWL4eV17pupEmKZzT1JMBUjL92fultN54QbYD24lyaScOqRPbkaMjuPELM3lKhP/W4wfHneM05ql+GDfQ=
X-Received: by 2002:a05:620a:4d4:b0:76f:e1f:c0c7 with SMTP id
 20-20020a05620a04d400b0076f0e1fc0c7mr10583950qks.27.1694478170068; Mon, 11
 Sep 2023 17:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230810040349.92279-2-leobras@redhat.com> <ZP2DVap64lJZj9g4@gmail.com>
In-Reply-To: <ZP2DVap64lJZj9g4@gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Sep 2023 21:22:38 -0300
Message-ID: <CAJ6HWG6yED5eUVgaygHqVb7NUbHBzb8dz73dq9cyKAGj5_Sh5g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/5] Rework & improve riscv cmpxchg.h and atomic.h
To: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_172253_499502_10CA681E 
X-CRM114-Status: GOOD (  31.69  )
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

T24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNTo1MOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDEwLCAyMDIzIGF0IDAxOjAzOjQyQU0gLTAzMDAs
IExlb25hcmRvIEJyYXMgd3JvdGU6Cj4gPiBXaGlsZSBzdHVkeWluZyByaXNjdidzIGNtcHhjaGcu
aCBmaWxlLCBJIGdvdCByZWFsbHkgaW50ZXJlc3RlZCBpbgo+ID4gdW5kZXJzdGFuZGluZyBob3cg
UklTQ1YgYXNtIGltcGxlbWVudGVkIHRoZSBkaWZmZXJlbnQgdmVyc2lvbnMgb2YKPiA+IHtjbXAs
fXhjaGcuCj4gPgo+ID4gV2hlbiBJIHVuZGVyc3Rvb2QgdGhlIHBhdHRlcm4sIGl0IG1hZGUgc2Vu
c2UgZm9yIG1lIHRvIHJlbW92ZSB0aGUKPiA+IGR1cGxpY2F0aW9ucyBhbmQgY3JlYXRlIG1hY3Jv
cyB0byBtYWtlIGl0IGVhc2llciB0byB1bmRlcnN0YW5kIHdoYXQgZXhhY3RseQo+ID4gY2hhbmdl
cyBiZXR3ZWVuIHRoZSB2ZXJzaW9uczogSW5zdHJ1Y3Rpb24gc3VmaXhlcyAmIGJhcnJpZXJzLgo+
ID4KPiA+IEFsc28sIGRpZCB0aGUgc2FtZSBraW5kIG9mIHdvcmsgb24gYXRvbWljLmMuCj4gPgo+
ID4gQWZ0ZXIgdGhhdCwgSSBub3RlZCBib3RoIGNtcHhjaGcgYW5kIHhjaGcgb25seSBhY2NlcHQg
dmFyaWFibGVzIG9mCj4gPiBzaXplIDQgYW5kIDgsIGNvbXBhcmVkIHRvIHg4NiBhbmQgYXJtNjQg
d2hpY2ggZG8gMSwyLDQsOC4KPiA+Cj4gPiBOb3cgdGhhdCBkZWR1cGxpY2F0aW9uIGlzIGRvbmUs
IGl0IGlzIHF1aXRlIGRpcmVjdCB0byBpbXBsZW1lbnQgdGhlbQo+ID4gZm9yIHZhcmlhYmxlIHNp
emVzIDEgYW5kIDIsIHNvIEkgZGlkIGl0LiBUaGVuIEd1byBSZW4gYWxyZWFkeSBwcmVzZW50ZWQK
PiA+IG1lIHNvbWUgcG9zc2libGUgdXNlcnMgOikKPiA+Cj4gPiBJIGRpZCBjb21wYXJlIHRoZSBn
ZW5lcmF0ZWQgYXNtIG9uIGEgdGVzdC5jIHRoYXQgY29udGFpbmVkIHVzYWdlIGZvciBldmVyeQo+
ID4gY2hhbmdlZCBmdW5jdGlvbiwgYW5kIGNvdWxkIG5vdCBkZXRlY3QgYW55IGNoYW5nZSBvbiBw
YXRjaGVzIDEgKyAyICsgMwo+ID4gY29tcGFyZWQgd2l0aCB1cHN0cmVhbS4KPiA+Cj4gPiBQYXRo
ZXMgNCAmIDUgd2VyZSBjb21waWxlZC10ZXN0ZWQsIG1lcmdlZCB3aXRoIGd1b3Jlbi9xc3Bpbmxv
Y2tfdjExIGFuZAo+ID4gYm9vdGVkIGp1c3QgZmluZSB3aXRoIHFlbXUgLW1hY2hpbmUgdmlydCAt
YXBwZW5kICJxc3BpbmxvY2siLgo+ID4KPiA+ICh0cmVlOiBodHRwczovL2dpdGxhYi5jb20vTGVv
QnJhcy9saW51eC8tL2NvbW1pdHMvZ3VvX3FzcGlubG9ja192MTEpCj4gVGVzdGVkLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPgo+IFNvcnJ5IGZvciBsYXRlIHJlcGx5LCBiZWNhdXNl
IHdlIGFyZSBzdHJlc3MgdGVzdGluZyBDTkEgcXNwaW5sb2NrIG9uCj4gc2cyMDQyIDEyOCBjb3Jl
cyBoYXJkd2FyZSBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgaGFzIHBhc3NlZCBvdXIgdGVzdCBmb3IK
PiBzZXZlcmFsIHdlZWtzLiBGb3IgbW9yZSBkZXRhaWwsIHJlZjoKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxMDA4MjkxMS4zMzc4NzgyLTEtZ3VvcmVuQGtlcm5l
bC5vcmcvCj4KClRoYXQncyBhd2Vzb21lIQpUaGFua3MgZm9yIHRlc3RpbmchCgpMZW8KCj4gPgo+
ID4gVGhhbmtzIQo+ID4gTGVvCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSBzcXVhc2hlZCBjbXB4Y2hn
IFJGQ3Y0Ogo+ID4gLSBBZGRlZCAoX190eXBlb2ZfXygqKHApKSkgYmVmb3JlIHJldHVybmluZyBm
cm9tIHtjbXAsfXhjaGcsIGFzIGRvbmUKPiA+ICAgaW4gY3VycmVudCB1cHN0cmVhbSwgKHBvc3Np
Ymx5KSBmaXhpbmcgdGhlIGJ1ZyBmcm9tIGtlcm5lbCB0ZXN0IHJvYm90Cj4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzA4MDkwMjEzMTEuMTM5MDU3OC0yLWxlb2JyYXNAcmVkaGF0
LmNvbS8KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHNxdWFzaGVkIGNtcHhjaGcgUkZDdjM6Cj4gPiAt
IEZpeGVkIGJ1ZyBvbiBjbXB4Y2hnIG1hY3JvIGZvciB2YXIgc2l6ZSAxICYgMjogbm93IHdvcmtp
bmcKPiA+IC0gTWFjcm9zIGZvciB2YXIgc2l6ZSAxICYgMidzIGxyLncgYW5kIHNjLncgbm93IGFy
ZSBndWFyYW50ZWVkIHRvIHJlY2VpdmUKPiA+ICAgaW5wdXQgb2YgYSAzMi1iaXQgYWxpZ25lZCBh
ZGRyZXNzCj4gPiAtIFJlbmFtZWQgaW50ZXJuYWwgbWFjcm9zIGZyb20gX21hc2sgdG8gX21hc2tl
ZCBmb3IgcGF0Y2hlcyA0ICYgNQo+ID4gLSBfX3JjIHZhcmlhYmxlIG9uIG1hY3JvcyBmb3IgdmFy
IHNpemUgMSAmIDIgY2hhbmdlZCBmcm9tIHJlZ2lzdGVyIHRvIHVsb25nCj4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzA4MDQwODQ5MDAuMTEzNTY2MC0yLWxlb2JyYXNAcmVkaGF0
LmNvbS8KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHNxdWFzaGVkIGNtcHhjaGcgUkZDdjI6Cj4gPiAt
IFJlbW92ZWQgcmMgcGFyYW1ldGVyIGZyb20gdGhlIG5ldyBtYWNybzogaXQgY2FuIGJlIGludGVy
bmFsIHRvIHRoZSBtYWNybwo+ID4gLSAyIG5ldyBwYXRjaGVzOiBjbXB4Y2hnIHNpemUgMSBhbmQg
MiwgeGNoZyBzaXplIDEgYW5kIDIKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIz
MDgwMzA1MTQwMS43MTAyMzYtMi1sZW9icmFzQHJlZGhhdC5jb20vCj4gPgo+ID4gQ2hhbmdlcyBz
aW5jZSBzcXVhc2hlZCBjbXB4Y2hnIFJGQ3YxOgo+ID4gLSBVbmlmaWVkIHdpdGggYXRvbWljLmMg
cGF0Y2hzZXQKPiA+IC0gUmViYXNlZCBvbiB0b3Agb2YgdG9ydmFsZHMvbWFzdGVyICh0aGFua3Mg
QW5kcmVhIFBhcnJpISkKPiA+IC0gUmVtb3ZlZCBoZWxwZXIgbWFjcm9zIHRoYXQgd2VyZSBub3Qg
YmVpbmcgdXNlZCBlbHNld2hlcmUgaW4gdGhlIGtlcm5lbC4KPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMDQxOTA2MjUwNS4yNTcyMzEtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4g
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA0MDYwODIwMTguNzAzNjctMS1sZW9i
cmFzQHJlZGhhdC5jb20vCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSAoY21weGNoZykgUkZDdjM6Cj4g
PiAtIFNxdWFzaGVkIHRoZSA2IG9yaWdpbmFsIHBhdGNoZXMgaW4gMjogb25lIGZvciBjbXB4Y2hn
IGFuZCBvbmUgZm9yIHhjaGcKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQw
NDE2Mzc0MS4yNzYyMTY1LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+ID4KPiA+IENoYW5nZXMgc2lu
Y2UgKGNtcHhjaGcpIFJGQ3YyOgo+ID4gLSBGaXhlZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhh
dmluZyBhIGxvY2FsIHZhcmlhYmxlIHdpdGggYSBtYWdpYyBuYW1lCj4gPiAtIFByZXZpb3VzIGNh
c3QgdG8gKGxvbmcpIGlzIG5vdyBvbmx5IGFwcGxpZWQgb24gNC1ieXRlcyBjbXB4Y2hnCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAzMjEwNzQyNDkuMjIyMTY3NC0xLWxlb2Jy
YXNAcmVkaGF0LmNvbS8KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4Y2hnKSBSRkN2MToKPiA+
IC0gRml4ZWQgcGF0Y2ggNC82IHN1ZmZpeCBmcm9tICd3LmFxcmwnIHRvICcudy5hcXJsJywgdG8g
YXZvaWQgYnVpbGQgZXJyb3IKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMx
ODA4MDA1OS4xMTA5Mjg2LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+ID4KPiA+IExlb25hcmRvIEJy
YXMgKDUpOgo+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0ZSB4Y2hnKCkgYXNtIGZ1bmN0
aW9ucwo+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0ZSBjbXB4Y2hnKCkgYXNtIGFuZCBt
YWNyb3MKPiA+ICAgcmlzY3YvYXRvbWljLmggOiBEZWR1cGxpY2F0ZSBhcmNoX2F0b21pYy4qCj4g
PiAgIHJpc2N2L2NtcHhjaGc6IEltcGxlbWVudCBjbXB4Y2hnIGZvciB2YXJpYWJsZXMgb2Ygc2l6
ZSAxIGFuZCAyCj4gPiAgIHJpc2N2L2NtcHhjaGc6IEltcGxlbWVudCB4Y2hnIGZvciB2YXJpYWJs
ZXMgb2Ygc2l6ZSAxIGFuZCAyCj4gPgo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWlj
LmggIHwgMTY0ICsrKysrKy0tLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhj
aGcuaCB8IDQwNCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAyMDAgaW5zZXJ0aW9ucygrKSwgMzY4IGRlbGV0aW9ucygtKQo+ID4KPiA+Cj4gPiBi
YXNlLWNvbW1pdDogY2FjYzZlMjI5MzJmMzczYTkxZDdiZTU1YTliOTkyZGM3N2Y0YzU5Ygo+ID4g
LS0KPiA+IDIuNDEuMAo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPgo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
