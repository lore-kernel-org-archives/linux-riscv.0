Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E043CCDD560
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqKrC+HYcfMIt6J1bre86WqXtWtdNEYRNUPQmlXqNv8=; b=wqf3CkSMU1U5c2
	xbxi6B9MWx19c+uPQCer+hIZoc3Vvx7gRWP3TOaFVr3IMc92/EZFKk6jZ6WNNjQYHdWs356GuGQWl
	8Rkux2C7APZMISPW2EvNEb+nDV08/u76M8lycTXNw9Y44YMfT1VwDeVIr3Ji+qwg5uSvrAWouTTnt
	/RElPh/uO+IUyJ3P35jUua9CG+DNiybrkI8rJoYqewfu5KiyDUrdQFdOFYMPXBDxn4sAl8J8yCyj7
	G+V38/NwF24cxFpj3OevKvc3b6O4DlJHXq8p0ihhBZmtod0RpOKT9m5T9ji7LEvr4nYT5P4No57cK
	rgR2aZ/RInXZeWb71sew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sr41h-000000098gw-2Niy;
	Wed, 18 Sep 2024 23:24:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sr41d-000000098gX-3IvL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 23:23:59 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so984418b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726701837; x=1727306637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fcaG1aPLyqtXvqRgyQZU+xgi/vEYBuWe1gbQxqTPNA=;
        b=oWETlXFACsL+HJXxbxr78DgzxXKYLH8t9lJn16wL5MUKsHhcMiRVDV9V/HyYmWiQbK
         bZhIa668M4Db9fS3JU4GtJ1eeESL/BuE4j6xLOkii7bjUvRPye2Mgb6P5Ur0VLWfq1DA
         tiArokITN4qDxTdE3v3NamTEivalwqT168BNOixXVO1gJcDAmXAtcr7NZsFHSqA7dgTZ
         zStbPfuC6cFy70Pmx1TD0wsPbna4AkrT05oGEuJg+KCoD5yJExbxziHdosJaDBF2sXqX
         QriUtYlvFIW/C6YqOTYtKPuYLZqnmryJ+d1OKh/yVzbo7/b/aAvDmiOhASugcp73E6hD
         C0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726701837; x=1727306637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fcaG1aPLyqtXvqRgyQZU+xgi/vEYBuWe1gbQxqTPNA=;
        b=tG9DIgN81DtQCgFXUfTInWTSIPu1a56WNxJnTBsf4xNBicmykT1Ci4g/xk4wh3mOuT
         3C/OWQbIgRTXqsPrZ2qVrVXV177cAOLfGxLnWun5nqOwZggQN6sXXxwNsWTYPRZKgPUs
         +/zWzdqFIA1Upp1xDSbBhGzyzld9QNwEkNbLaJFBkeF8Fm/qbWP7ZYmDbPSQBGAruF7Z
         g0B5LJys6kZTt65GruDGc62PCBb6d+/E5Igh8bhKi438tSI2Pg2NE0ulTQHFhlnTejil
         sqaKhLcrDkbqYfDNUNAHXdLuuuib/hMDYu0MUibnpQo8gJZStqlxyRluVZQgsF+havAa
         /pUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz87/y5hXINX6cH0rlXH+fdpq+o9oMOICpxstfK7nmj5siXyEP8EJM1Tt+BSqimqO4+K8nXRZYxagx6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQdKA0RLBuTVK8LjUif6oQTC2DF3OhbrgZFFoFa31bo0Nsoy6y
	PJw+UEerqE6g8ab4N3c0qEvpWXfQy329KbiGNur6Gz+mj5d5AUOSuX8W85YLiXVF2X18f1u7cCX
	6+EjcjSMlFrHtLX5Xg1urMPs6qxFLH0pjdE/+fQ==
X-Google-Smtp-Source: AGHT+IEdAyiUtTa+4zOlgoa1GxilH8W1w69t4wGIrgLeOOI0wySmIPAElMGfIhy33t77DLzT3QTJDcEmeQ19sUR7wmo=
X-Received: by 2002:a05:6a20:6f08:b0:1d2:bc91:ba33 with SMTP id
 adf61e73a8af0-1d2fc900ef9mr2535184637.0.1726701836892; Wed, 18 Sep 2024
 16:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
 <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk> <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
 <1bf46ac0-2ab4-44d3-bcf0-7a29ba6380c1@codethink.co.uk>
In-Reply-To: <1bf46ac0-2ab4-44d3-bcf0-7a29ba6380c1@codethink.co.uk>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 18 Sep 2024 16:23:45 -0700
Message-ID: <CAHBxVyGAJOXwws92M13vf-=+7Z2Nk0c8VjwsQ_YwMa0y+PgtoQ@mail.gmail.com>
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
To: Ben Dooks <ben.dooks@codethink.co.uk>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_162358_119176_9328D3C7 
X-CRM114-Status: GOOD (  34.22  )
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

T24gV2VkLCBTZXAgMTgsIDIwMjQgYXQgMjo1N+KAr0FNIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNv
ZGV0aGluay5jby51az4gd3JvdGU6Cj4KPiBPbiAxOC8wOS8yMDI0IDEwOjU1LCBBdGlzaCBQYXRy
YSB3cm90ZToKPiA+IE9uIDkvMTcvMjQgNzowMSBBTSwgQmVuIERvb2tzIHdyb3RlOgo+ID4+IE9u
IDE3LzA5LzIwMjQgMTQ6NDYsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4+PiBPbiBUdWUsIDE3
IFNlcCAyMDI0IDA2OjA4OjUwIFBEVCAoLTA3MDApLCBiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVr
Cj4gPj4+IHdyb3RlOgo+ID4+Pj4gVGhpcyBpcyBhIFJGQyBzZXJpZXMgdG8gY2hhbmdlIGhvdyB0
aGUgaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwCj4gPj4+PiBpcyBoYW5kbGVkIGFuZCB0aGVuIGhv
dyB0byB0cmFwIFJEQ1lDTEUgYW5kIGVtdWxhdGUgaXQgd2l0aCBSRFRJTUUKPiA+Pj4+IGluc3Rl
YWQuCj4gPj4+Cj4gPj4+IE9ubHkgMS8zIG1hZGUgaXQgdG8gbG9yZSBmb3IgbWUsIG5vdCBzdXJl
IGlmIGl0J3MganVzdCBzdHVjayBzb21ld2hlcmUuCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gSSBkaWQg
dGhpcyB3aGVuIHdlIGZvdW5kIG11bHRpcGxlIGxpYnJhcmllcyB1c2luZyBSRENZQ0xFIGFuZAo+
ID4+Pj4gdXBncmFkaW5nIG11bHRpcGxlIHJ1bm5lcnMgdG8gbmV3ZXIga2VybmVscyBjYXVzZWQg
bWFueSBwcm9ibGVtcwo+ID4+Pgo+ID4+PiBPSywgc28gSSB0aGluayB3ZSdyZSBraW5kIG9mIGp1
c3Qgc3R1Y2sgd2l0aCBSRENZQ0xFIHRoZW4gLS0gaXQgd2FzCj4gPj4+IHBhcnQgb2YgdGhlIGJh
c2UgSVNBIHdoZW4gd2UgbWVyZ2VkIHRoZSBwb3J0LCBhbmQgZXZlcnkgdGltZSBpdAo+ID4+PiBk
aXNhcHBlYXJzIHdlIGVuZCB1cCBicmVha2luZyB1c2Vyc3BhY2UuCj4gPj4KPiA+PiBZZXMsIGl0
IHdhcyBhbiBhbm5veWFuY2UsIHdlIG1hbmFnZWQgdG8gdHJhY2sgZG93biBhbGwgdGhlIHVzZXJz
IGFuZAo+ID4+IHBhdGNoIG91dC4KPiA+Pgo+ID4+IEkgdGhvdWdodCB0aGlzIG1pZ2h0IGJlIGEg
dXNlZnVsIGlkZWEgZm9yIG1vcmUgZ2VuZXJpYyB0eXBlLCBzbyBtaWdodAo+ID4+IGxvb2sgYXQg
dXBkYXRpbmcgdG8gaGF2ZSBhIHRhYmxlIG9mIGluc3RydWN0aW9uIG1hc2tzIHRvIGNhbGwuCj4g
Pj4KPiA+Pj4gSSdtIG5vdCBzdXJlIHdoYXQgZXhhY3RseSB0aGUgcmlnaHQgd2F5IHRvIGRvIHRo
aXMgaXM6IElJUkMgdGhlcmUncwo+ID4+PiBzb21lIHBlcmYtcmVsYXRlZCBob29rcyBmb3IgdGhp
cywgYnV0IHRoZXJlJ3MgYWxzbyBzeXN0ZW1zIHRoYXQganVzdAo+ID4+PiBkb24ndCBpbXBsZW1l
bnQgdGhlIFJEQ1lDTEUgaW5zdHJ1Y3Rpb24gYXQgYWxsIGFuZCB0aHVzIHdlJ2xsIG5lZWQKPiA+
Pj4gc29tZSBzb3J0IG9mIGVtdWxhdGlvbiBmb3IgdGhvc2UuCj4gPj4KPiA+PiBJIGNvdWxkbid0
IGdldCB0aGUgUE1VIGRyaXZlciB0byBhbGxvdyBpdCwgbm90IHN1cmUgaWYgdGhlcmUgd2FzIGFu
Cj4gPj4gaXNzdWUgaGlnaGVyIHVwIG9yIHNvbWUgb3RoZXIgaXNzdWU/Cj4gPj4KPiA+Cj4gPiBI
ZXJlIGlzIHRoZSB3YXkgdG8gcHJvcGVybHkgYWxsb3cgaXQgdmlhIHRoZSBkcml2ZXIuCj4gPgo+
ID4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9z
eXNjdGwva2VybmVsLnJzdAo+ID4KPiA+IENoZWNrIHRoZSBwZXJmX3VzZXJfYWNjZXNzCj4KPiBE
aWRuJ3Qgd29yayBmb3IgbWUsIG5vdCBzdXJlIHdoeQo+CgorQWxleGFuZHJlIEdoaXRpCgpIbW0u
IFRoYXQncyB3ZWlyZC4gTWF5YmUgc29tZSBidWcgY3JlcHQgaW4gcmVjZW50bHkuIENhbiB5b3Ug
cHJvdmlkZQpzb21lIG1vcmUgZGV0YWlscwpvbiB0aGUgcGxhdGZvcm0sIGtlcm5lbCB2ZXJzaW9u
IGFuZCBwcm9jZWR1cmUgZm9sbG93ZWQgdG8gY2hhbmdlIGl0ID8KCj4gPgo+ID4gQXMgeW91IG5v
dGVkLCB0aGUgdXNlciBzcGFjZSBhcHBsaWNhdGlvbiBzaG91bGRuJ3QgdXNlIFJEQ1lDTEUgZm9y
Cj4gPiB2YXJpb3VzIHJlYXNvbnMgZGlzY3Vzc2VkIGluIHRoZSBwYXN0Lgo+ID4KPiA+IElmIFJE
VElNRSBpcyByZWFsbHkgbm90IGFuIG9wdGlvbiwgeW91IGNhbiBhbHdheXMgc2V0IHRoZSBsZWdh
Y3kgbW9kZSB0bwo+ID4gZW5hYmxlIGFjY2Vzcy4KPiA+Cj4gPj4+IFNvIGhvcGVmdWxseSB0aGUg
b3RoZXIgdHdvIHBhdGNoZXMgZ2V0IHRocm91Z2ggdGhlIGxpc3RzIGF0IHNvbWUKPiA+Pj4gcG9p
bnQsIGJ1dCBJIHRoaW5rIGluIGdlbmVyYWwgdGhpcyBpcyBhIHJlYXNvbmFibGUgdGhpbmcgdG8g
ZG8gLS0gb3IKPiA+Pj4gSSBndWVzcyBtYXliZSBhIGNvbXBsZXRlbHkgdW5yZWFzb25hYmxlIHRo
aW5nIHRvIGJlIHN0dWNrIG5lZWRpbmcgdG8KPiA+Pj4gZG8sIGJ1dCBubyB3YXkgYXJvdW5kIGl0
IDspCj4gPj4KPiA+PiBJJ2xsIGNoZWNrIGJhY2sgbGF0ZXIsIGN1cnJlbnRseSBhcyBPU1MtRVUK
PiA+Pgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
ID4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+Pj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4+Pgo+ID4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cj4gPj4+Cj4gPj4KPiA+Pgo+ID4KPiA+Cj4KPgo+IC0tCj4gQmVuIERvb2tzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwo+IFNl
bmlvciBFbmdpbmVlciAgICAgICAgICAgICAgICAgICAgICAgICBDb2RldGhpbmsgLSBQcm92aWRp
bmcgR2VuaXVzCj4KPiBodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
