Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DF5C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 02:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIxgXlBLhzGpKvRoJPOcMNA9pTUTgNt44I2RmjpLz0g=; b=0KDZ4DOiwkje1H
	1wy9NxDtYcJATUjZUMoZTFsSF9QhI256d4PIq0G1lrWCvh3jWY1VMFt5G+T96wtoqwLUs8qeB1qcA
	608L3QFuWAMqAH6uN151ET/4ginhazbwzW3s4koGWjZ76XiunR6KHLBvURvD53XYnRq0D9O/dab7F
	cO/zGr69J2TZc2lRVLeivLxRkRZsLz91PgugU7o0BJZlufIP5xvyni7BIrIXke+25jJWYDUTzfO+e
	BqomabZ41dEpFFyinSj6A0l2vLknRtXqZadcwzg5VrF617bdiQ6J64DIp1768KRctY4dKvj7w3J19
	+cmC3HmczgebTV9vzUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOua-00000003pgw-3qwx;
	Wed, 23 Jul 2025 02:08:52 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOuY-00000003pgX-45go
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 02:08:52 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6159c26766fso2934976eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 19:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1753236529; x=1753841329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbLzezgm8dAVRZSq3TIecXQLyh3iQWeWEDlkEk8BgqE=;
        b=DyQuKZTcESU429WaX830rjTXuqnS2s0xVYyFPGRt5qR7DhykOA7udBCRE6sNwh2Nnt
         iDvj9jLlNGKa6STFQ2bQwVMvu6NlRTtRhxvsti8oXvflMwIfI9RsdoSnHSqeLTpNDQvj
         8KRjrqYlJCOt3Lf1KWX2+yWgqux3OKE99H3aGdmkQ4mx2tJsFmxKyq2K460Xz/7yL6gq
         rhXeY1JV8kGC9iCjl9qFFRI8igDlP/HtKcydK/t2RSd+GccFtPQVtnSGh46YOrxR4DMn
         QTzcccGnn+spXg7nXUGMmnZtFUozAg9po7LqmYVW2yclFFmnJGZjWNlKhrSxzmeROelw
         J0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753236529; x=1753841329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbLzezgm8dAVRZSq3TIecXQLyh3iQWeWEDlkEk8BgqE=;
        b=R9vl7HU60CMKnsKcoMYiDIcyPlDstFfLZv5nWJxeKB5JirmNALhbAEy7la10IwxWUC
         7JUUMld7Ok1auVoIYK9rcCSIhPkUupEflvtUBF21P1ajLaK8Jw6tYEJtlutRN1TqxfTF
         JIsjZ/KS38nOoPAnCdFmxp/hlYI8XYhvLSYUhgBu/apP4d6yy1cIadDZiNXSPTkp8CtV
         MCiOnryxUgitiirDrNGUjjh7MTrvZW6WbF43mOj2Ao2/aVsf7oUlDChCJv6HHs8AxDAc
         5SGtzhLn9zAVesK/LPj8KhQ6rYwsP7WA0NoVosM3bKrW0oFhjI3/1aZVwcZBiCA9SHLQ
         hKrg==
X-Gm-Message-State: AOJu0YzScrCqO43Et7GPlPmh99YBVQMVvchryJ2mbLAOKsUKIl2dCNDh
	nYTKZqhoweGNjY5lW8rPrPtKKgDeH3BspJaPxH4BjiG3+Lvse4xKhsXwX2tXm7mWjqc7kHAM4/N
	WhLsKwJSUnIYWGrz2uLaNv48M4TztNhCTiprXPILiow==
X-Gm-Gg: ASbGncu9AWqxcqKJProyhpUsKvVy44byNQcoAnmgyX5etE7vsnt/ZAnY0uvckscD6hm
	5mQU+Ugl6n5K1WOaRAJGF+fUr+dRiuiIL3bhJf2HCo3MPEsJi9eRjw9W2cXnxiirnIRRUIccVGN
	2Is7OaQoo0cRYyAD619cwJOJrFIgrJ168ycND0BA8Sq86EXLX5/Fz6MyrSxyvxrW+IEoqHmUB8U
	Pmur0eZvQ==
X-Google-Smtp-Source: AGHT+IH5/4hhNDfu2k3Ql3fZz+CRyaz5rAVD38pyJ1AKTpYYbyIP0e3dxSYqzAcvV5Yk4hNajxf0ROaZJDHHAiphsuU=
X-Received: by 2002:a05:6871:e78e:b0:2fe:f4f4:8506 with SMTP id
 586e51a60fabf-306c6fea1abmr949872fac.10.1753236529442; Tue, 22 Jul 2025
 19:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <CABvJ_xjsawGX33f1LLPeLR=OgT635GcqOSrMQpyzn6LQFqx00w@mail.gmail.com>
 <92e9a9a0-2654-4a0a-9e26-ee4de998aab1@ghiti.fr>
In-Reply-To: <92e9a9a0-2654-4a0a-9e26-ee4de998aab1@ghiti.fr>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 23 Jul 2025 10:08:38 +0800
X-Gm-Features: Ac12FXzbkfjxNgxvqhoBnCc_YmgoRtjzmeQM_BRXBi28dVcjMSFqMa9nZu4VtVM
Message-ID: <CABvJ_xh0dg1s_9c+6EJmL9-jZdmskTSvWyDSUc-ccUwWx4F=jw@mail.gmail.com>
Subject: Re: Question About Access Fault Handling in the Kernel
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_190851_041011_56352571 
X-CRM114-Status: GOOD (  30.89  )
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

T24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgOTo1OeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBWaW5jZW50LAo+Cj4gRmlyc3Qgc29ycnkgZm9yIHRoZSB2
ZXJ5IGxhdGUgcmVwbHkuCj4KSGkgQWxleGFuZHJlLAoKTm8gcHJvYmxlbSwgSSdtIGdsYWQgdG8g
aGVhciB0aGF0IHNvbWVvbmUgZWxzZSBpcyBhbHNvIGludGVyZXN0ZWQgaW4gdGhpcyBpc3N1ZS4K
Cj4gT24gNi8zLzI1IDA2OjI1LCBWaW5jZW50IENoZW4gd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPiBJ
IGhhdmUgYSBxdWVzdGlvbiByZWdhcmRpbmcgdGhlIGN1cnJlbnQgaGFuZGxpbmcgZmxvdyBmb3Ig
YWNjZXNzCj4gPiBmYXVsdHMgaW4gdGhlIGtlcm5lbC4KPiA+Cj4gPiBJbiB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbiwgdGhlIGtlcm5lbCBjb25zaXN0ZW50bHkgcmVwb3J0cyB0YWxsCj4gPiBh
Y2Nlc3MgZmF1bHRzIHVzaW5nIGEgU0lHU0VHViB3aXRoIGVycm9yIGNvZGUgU0VHVl9BQ0NFUlIs
IHdoZXJlCj4gPiBTRUdWX0FDQ0VSUiBzaWduaWZpZXMgIkludmFsaWQgcGVybWlzc2lvbnMgZm9y
IG1hcHBlZCBvYmplY3QiCj4gPiBhY2NvcmRpbmcgdG8gdGhlIFBPU0lYIHNwZWNpZmljYXRpb24u
Cj4gPgo+ID4gSG93ZXZlciwgaW4gdGhlIFJJU0MtViBwcml2aWxlZ2Ugc3BlY2lmaWNhdGlvbiwg
aXQgc3RhdGVzIHRoYXQKPiA+ICJJbXBsZW1lbnRhdGlvbnMgbWF5IHJhaXNlIGFjY2Vzcy1mYXVs
dCBleGNlcHRpb25zIGluc3RlYWQgb2YKPiA+IGFkZHJlc3MtbWlzYWxpZ25lZCBleGNlcHRpb25z
IGZvciBzb21lIG1pc2FsaWduZWQgYWNjZXNzZXMsIGluZGljYXRpbmcKPiA+IHRoZSBpbnN0cnVj
dGlvbiBzaG91bGQgbm90IGJlIGVtdWxhdGVkIGJ5IGEgdHJhcCBoYW5kbGVyIi4gSW4gb3RoZXIK
PiA+IHdvcmRzLCBhIGxvYWQvc3RvcmUgYWNjZXNzIGZhdWx0IG1heSBiZSBjYXVzZWQgYnkgYSBt
aXNhbGlnbmVkIEFNTwo+ID4gaW5zdHJ1Y3Rpb24uIEluIHN1Y2ggY2FzZXMsIGl0IHNlZW1zIG1v
cmUgYXBwcm9wcmlhdGUgdG8gcmVwb3J0IHRoZQo+ID4gZXJyb3IgdXNpbmcgU0lHQlVTIHdpdGgg
dGhlIGVycm9yIGNvZGUgQlVTX0FEUkFMTiwgd2hpY2ggaW5kaWNhdGVzCj4gPiAiSW52YWxpZCBh
ZGRyZXNzIGFsaWdubWVudC4iCj4KPgo+IEkgdGhpbmsgeW91J3JlIHJpZ2h0LCBpdCBzZWVtcyBt
b3JlIGFwcHJvcHJpYXRlLiBCdXQgdGhlbiBob3cgZG8gd2UKPiByZWNvZ25pemUgYW4gYWNjZXNz
IGZhdWx0IGV4Y2VwdGlvbiB0aGF0IGlzIGNhdXNlZCBieSBhIG1pc2FsaWduZWQKPiBhY2Nlc3M/
IERvIHlvdSBoYXZlIGEgc29sdXRpb24/IElmIHRoYXQgZG9lcyBub3Qgc2xvdyBkb3duIHRoZSAi
bm9ybWFsIgo+IGFjY2VzcyBmYXVsdCwgSSBndWVzcyB3ZSBjYW4gZ2l2ZSBpdCBhIHRyeSwgd2hh
dCBkbyB5b3UgdGhpbms/Cj4KCkluZGVlZCwgSSBkbyBub3QgeWV0IGhhdmUgYSBjb25jcmV0ZSBz
b2x1dGlvbiB0byB0aGlzIHByb2JsZW0uIE15CmN1cnJlbnQgdGhvdWdodCBpcyB0aGF0IHdlIG1h
eSBuZWVkIGFjY2VzcyB0byB0aGUgZnVsbCBQTUEKY29uZmlndXJhdGlvbiBhbmQgUE1QIHNldHRp
bmdzIGluIG9yZGVyIHRvIGFjY3VyYXRlbHkgZGlhZ25vc2UgdGhlCnJvb3QgY2F1c2Ugb2YgYW4g
YWNjZXNzIGZhdWx0LgoKRm9yIGV4YW1wbGUsIHdoZW4gdGhlIGtlcm5lbCBlbmNvdW50ZXJzIGFu
IGFjY2VzcyBmYXVsdCB3aXRoIHN0dmFsID0KMHgxMDAwMDAyLCB3ZSBjYW5ub3QgZGlyZWN0bHkg
ZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNhdXNlIGlzIGEKbWlzYWxpZ25lZCBBTU8gYWNjZXNzLCBh
IFBNUCB2aW9sYXRpb24sIG9yIHNvbWUgb3RoZXIgUE1BIHZpb2xhdGlvbnMuCkFzIGEgcmVzdWx0
LCB0aGUga2VybmVsIG1heSBub3QgYmUgYWJsZSB0byByYWlzZSBhbiBhcHByb3ByaWF0ZSBzaWdu
YWwKd2l0aCB0aGUgY29ycmVjdCBlcnJvciBjb2RlLgoKRnJvbSBhIHNlY3VyaXR5IHBlcnNwZWN0
aXZlLCBleHBvc2luZyBQTUEgY29uZmlndXJhdGlvbnMgb3V0c2lkZSBvZgpNLW1vZGUgbWF5IG5v
dCBiZSBhcHByb3ByaWF0ZS4gSWYgdGhpcyBjb25jZXJuIGlzIHZhbGlkLCB3ZSBtYXkgbmVlZAp0
byByZWx5IG9uIE9wZW5TQkkgdG8gYXNzaXN0IGluIGRpYWdub3Npbmcgc3VjaCBmYXVsdHMuIEhv
d2V2ZXIsIHRoaXMKd291bGQgaW50cm9kdWNlIGFkZGl0aW9uYWwgb3ZlcmhlYWQgdG8gc2xvdyBk
b3duIHRoZSBwcm9jZXNzIG9mIHRoZQoibm9ybWFsIiBhY2Nlc3MgZmF1bHQuCgpPbiB0aGUgb3Ro
ZXIgaGFuZCwgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gY29uc2lzdGVudGx5IHJlcG9ydHMg
YW4KYWNjZXNzIGZhdWx0IHZpYSB0aGUgU0lHU0VHViBzaWduYWwgd2l0aCB0aGUgU0VHVl9BQ0NF
UlIgZXJyb3IgY29kZS4KRm9yIG1lLCB0aGlzIGFwcHJvYWNoIGNvdWxkIGJlIG1vcmUgcHJlY2lz
ZSBmb3Igc29tZSBjYXNlcy4gRm9yCmV4YW1wbGUsIHdoZW4gdGhlIENQVSBleGVjdXRlcyBhbiBB
TU8gaW5zdHJ1Y3Rpb24gb24gYSByZWdpb24gbWFya2VkCndpdGggdGhlIEFNT05vbmUgUE1BIGF0
dHJpYnV0ZSwgcmVwb3J0aW5nIHRoZSBmYXVsdCB1c2luZyB0aGUgU0lHQlVTCndpdGggdGhlIEJV
U19PQkpFUlIgZXJyb3IgY29kZSBtaWdodCBiZSBtb3JlIGFwcHJvcHJpYXRlLiBIb3dldmVyLCBJ
CmhhdmUgbm90IGRpc2NvdmVyZWQgYW55IGRpc2N1c3Npb25zIGFib3V0IHNpbWlsYXIgaXNzdWVz
IG9uIHRoZQptYWlsaW5nIGxpc3QsIHdoaWNoIG1ha2VzIG1lIHF1ZXN0aW9uIHdoZXRoZXIgaXQn
cyB3b3J0aCBkb2luZyB0aGlzCmFwcHJvYWNoLgoKPiBEaWQgeW91IGVuY291bnRlciB0aGlzIHNp
dHVhdGlvbiB3aGVyZSB5b3Ugd2VyZSByZXBvcnRlZCBhIFNJR1NFR1YgYnV0Cj4gaXQgd2FzIGFj
dHVhbGx5IGEgU0lHQlVTPwo+CgpZZXMsIEkgZW5jb3VudGVyZWQgdGhpcyBpc3N1ZSB3aGVuIHJ1
bm5pbmcgdGhlIGxvY2tidXMgdGVzdCBpbgpzdHJlc3MtbmcgdmVyc2lvbiB2MC4xOC4xMi4gVGhp
cyB0ZXN0Y2FzZSBpbnRlbmRzIHRvIHVzZSB0aGUgQU1PCmluc3RydWN0aW9uIHRvIGFjY2VzcyBh
biB1bmFsaWduZWQgYWRkcmVzcyBhbmQgZXhwZWN0cyB0byBnZXQgYSBTSUdCVVMKc2lnbmFsIGR1
ZSB0byB0aGlzIGFjY2Vzcy4KCj4gU29ycnkgYWdhaW4gZm9yIHRoZSBkZWxheSwKPgo+IFRoYW5r
cywKPgo+IEFsZXgKPgo+Cj4gPgo+ID4gQXMgSSB1bmRlcnN0YW5kIGl0LCBtb3N0IGFjY2VzcyBm
YXVsdHMgYXJlIHR5cGljYWxseSBjYXVzZWQgYnkKPiA+IHZpb2xhdGlvbnMgb2YgZWl0aGVyIFBN
QSBvciBQTVAgc2V0dGluZ3MuIElmIHRoZXNlIHNldHRpbmdzIGFyZQo+ID4gY29uc2lkZXJlZCBh
IGZvcm0gb2YgcGVybWlzc2lvbiBmb3IgYSBtYXBwZWQgb2JqZWN0LCB0aGVuIHRoZSBjdXJyZW50
Cj4gPiBpbXBsZW1lbnRhdGlvbiB1c2luZyBTSUdTRUdWIHdpdGggU0VHVl9BQ0NFUlIgbWFrZXMg
c2Vuc2UgYW5kIGhlbHBzCj4gPiBzaW1wbGlmeSB0aGUgZmF1bHQtaGFuZGxpbmcgbG9naWMuCj4g
Pgo+ID4gSeKAmWQgbGlrZSB0byBjb25maXJtIHdoZXRoZXIgdGhpcyBpbnRlcnByZXRhdGlvbiBy
ZWZsZWN0cyB0aGUgcmVhc29uaW5nCj4gPiBiZWhpbmQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24uIEFueSBjbGFyaWZpY2F0aW9uIHdvdWxkIGJlCj4gPiBhcHByZWNpYXRlZC4gVGhhbmtzIQo+
ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
