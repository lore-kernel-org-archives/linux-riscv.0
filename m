Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8B606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XmXMuhES;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvAVW37d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vHx4f4gCvzSkNSAvzTM1Ug2aVBME1nZp+DMEcJ8rnDM=; b=XmXMuhESLS2zKN5by36xouPgNR
	Mq7hppdaUE7wCSpiWWxdU4BGo7OFDMy6vIhGjbwvZvvZVkBCDGdO6ZMbByWOJvWEVC8hWGChNEMx/
	4GheAwy+AqAAfRY9WQNYfmKwqX4XKooMJmLeybKOhu/cpj77/BvgIP0YS81IuPweTkQlh9Efn3WAd
	dKGLz355Ciqmx6A1qvfVPt/yft2ZN9yD0ucix/UZseppDb+dCdEodotlTGPzonFlkYyic1wpQbih+
	hKi5LiAkFa1meyNPfLbkoIkDWQj4ogGxQsKgVxmeKXVBQQmTe5CbOmBFp5X9bhQqIplJ+N75XaSiM
	FTPEWw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIGL-00000005cPZ-3iXy;
	Tue, 17 Nov 2026 12:26:13 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIGJ-00000005cP8-2Ak0
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:26:12 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67db35e7953so2277106d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 04:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794918370; cv=none;
        d=google.com; s=arc-20260327;
        b=qhrX1G1VrQ1IA1ws9UBHH3SHLrAmlEWUXNeMK0WMgN0ehhVfr5d5iW3upy9KJ2M4Ko
         KhE8cEBKYtCZm7jFS1BXQ74amfXrbzKmC1Ovg6sU63Qwx0QkRbRNbdzUWuwAbFwoyjV5
         9AzjBylwnAmaTTQZpNFL3xOmBp60U8qg95IF3BdOUmHo3LKs98cim5ICF6aBblim9zRZ
         oVAS6SR4/WsUYRGubrKaPi9HKGdOWukxYq7SD00X6hv+1++aTx6lMKTOsWN7bTgMfqSB
         LvKnT0fyBdlGP5n+awpLfaD/75iJwiYbMrVUbnCsYws90Oi0eAYZGm7r27bb226h6bGA
         FeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
        fh=0v0D6hA3x7ouUvyx0QwI2Ayjoddm4i4TNMbJy7HLVBE=;
        b=I6kmziQuNmQGrALEF5R7troln1uUJqlV2YoACWLpIFE7X8tkPorydpw3EmVspJWyT/
         /mWYhBJDzgKcOIzRynkDSUHyZTXrWT8EuCUBiuAJcUURhIR7tlezHcPiaSvx5GuHfl/m
         iNM3/WGR1xXkc+Mi7iq4QrSZ1Eq8mxfgIOSaoJvzefhz8cRL0btgWo4k3cTg568AAvU2
         6ZeLNjYAW4eq9VDrfDk0zL3G3NHyOB994EvGLtHWV2jF+R7Eji8vE0GjjV7HE8svrBxG
         +ENoM/2EUycqjo/uxjVvHsvo4VnaQCWW00bKA+Q9KzKj1vQcvWJyQadImKgZelqR/Klf
         oSGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918370; x=1795523170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
        b=FvAVW37dPzqu7gfPwtj+NGGd++p1jCLQuJyyN8GF16vgBdQcPuLcw19wxCyaTBts7b
         2LEE/HvB4/sxhHuwzll4CaLgRSHeSLtMgC5af9s6rOEjvV3wgx2HjR4pBWoM/PjJ5vvS
         WlO7Ap+lIeu/QHVRZFttUNe82yarbcRgOhVkYwxjBhLTuI45XuRKTePL292kMFHhAmGE
         fwrvxYHURJSsnFmYNDLoxZMQE1m1A7UqFElEuoLEofsmAqDYs2NInGxeqIfAbwmkxktY
         +gx56MdhzG0awGXlaoD8PX89C7q72Pr/CSrow4b9yrgiVnl2Zk4PHPqPSJbkZsH5Z8qD
         6CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918370; x=1795523170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
        b=bywELaDniCNb5KeilA5XJo1Nii3KQUv/YBizJqrfHOcZQZLX9dkOp3SVj/UpXUkw5G
         n5xYL7Ki2b8uANzUh07OUCoebme6ZaijcsD3vusJP2B3k+JNk54mu/W6aH9DyaeuFEH+
         LEjg0mpGC8PdjxQqeQ4ukvWi2GzOsSt082v98llQmbj4IQztZ3i38JHUR5QlWcerQwAJ
         uBqyMYDCL9A1i3DLYeZc+jfR/dJzNIju+Cq5TB+wTroQiLu05TuR/uI6uQPJ9vTgi+5E
         YnRHhKXJIT51JkD2Un1zP0caut3NlF6zqmiyTwrwFwSXr+Rq+FmyeZB49kJx+hYPkmsh
         IEww==
X-Gm-Message-State: APuU4Z/N285W3e+VEPdFB6JQVZHxe/YH9vokUoxVX/yybQbKvkfQpFmn
	URLo/9+Gv6pg+qwqM+tLsg8+qhpYNxn/HCVPIOj/jhz+3E3wXJvgT1SbBBJvACA+KbEL5eB1dmR
	MrqZJB8ZNEd8Xe2m+t0iDQwlSdy38briOGEV1
X-Gm-Gg: AZFdTZfINAqQDiX0G0Alk/09S02U9bqqt6g7LirGO5BJ1XvuPTt3mXek0fh4XTBdE2Q
	d8jArSBmWu+pzwfybuqcmhyZsNt3m+a+0se+uFdyTFS1H82wIgjS3r+nJ/b8jm+TVIiS99abZjQ
	44UCDM/EOwBsEPqamBoRTsocHloYg9L7t2dczEEWS51wodsL7Z4x7Wig8lMqA+Pw0fiDxVyjAVp
	5pXeZ1rmucB2ezOLlQY9j4KCAtsEpLBk1ye4yOQQ1Kr4yHNP7e0MnVqrnY4IBIzHo6f7KnzH5Os
	IKEQIU0qxXyF+swkmbv0PSJe/Dk0mMZn43gFwamFaMBb7XcCbYx+elOJ2kxYaVMIy9xdDokGAoe
	8O/okkqGf24BTWJZtfI69U/jPDyMvOA/wf+7kgydqkXjHC7mQV92Js2NpvBcjMOi9JdbvXpP02h
	5zVWoeyRCuQ7dZVR8dz3ukx/rwD4E=
X-Received: by 2002:a05:690e:128e:b0:679:892f:20ba with SMTP id
 956f58d0204a3-67d89695d74mr6111796d50.54.1794918369623; Tue, 17 Nov 2026
 04:26:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
 <20261105-igloo-stunt-534496ad0518@spud> <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
 <20261116-dreamlike-uncheck-9eebf91555d6@spud>
In-Reply-To: <20261116-dreamlike-uncheck-9eebf91555d6@spud>
From: Avi <thnkslprpt@gmail.com>
Date: Tue, 17 Nov 2026 14:25:32 +0200
X-Gm-Features: AclHuK_Nw2nzCV6_b2EqU23EZNYUKsyvIU71Aq-l_ghKizzn7KRtca-eeEF59Eo
Message-ID: <CA+jvY9EjGVmUqMtEugdq=6rj6NwL87e_E5YgBSZOfkD7Br0sOQ@mail.gmail.com>
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_042611_593303_1FDD7FD4 
X-CRM114-Status: GOOD (  33.66  )
X-Spam-Score: -0.6 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WWVzIHlvdXIgc3VnZ2VzdGlvbiBtYWtlcyBzZW5zZSBDb25vci4KSSdsbCBxdWlja2x5IGNoZWNr
IGl0IGFuZCBpZiBJIGdldCBpdCB2YWxpZGF0ZWQgc2VuZCBhIHYyIHNob3J0bHkuCkNoZWVycwoK
T24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgNzoyMOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAxNCwgMjAyNiBhdCAwNzo0MDo0MlBNICsw
MjAwLCBBdmkgd3JvdGU6Cj4gPiBPbiBUaHUsIE5vdiA1LCAyMDI2IGF0IDg6MjTigK9QTSBDb25v
ciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIE9j
dCAyOCwgMjAyNiBhdCAwMzoxOTo0MFBNICswMjAwLCBBdmkgV2Vpc3Mgd3JvdGU6Cj4gPiA+ID4g
c2lmaXZlX2NjYWNoZV9pbml0KCkgdXNlcyBvZl9maW5kX21hdGNoaW5nX25vZGVfYW5kX21hdGNo
KCksIHdoaWNoIGFsc28KPiA+ID4gPiByZXR1cm5zIG5vZGVzIG1hcmtlZCBhcyBkaXNhYmxlZC4g
VGhlIGluaXRpYWxpemVyIGNhbiB0aGVyZWZvcmUgbWFwIGFuZAo+ID4gPiA+IGFjY2VzcyBhIGNh
Y2hlIGNvbnRyb2xsZXIgdGhhdCB0aGUgZGV2aWNlIHRyZWUgbWFya3MgdW5hdmFpbGFibGUuCj4g
PiA+ID4KPiA+ID4gPiBTZWxlY3QgdGhlIGZpcnN0IGF2YWlsYWJsZSBtYXRjaGluZyBub2RlIGJl
Zm9yZSBhY2Nlc3NpbmcgaXRzIHJlZ2lzdGVycy4KPiA+ID4gPiBUaGlzIGFsc28gaGFuZGxlcyBh
IGRpc2FibGVkIG5vZGUgcHJlY2VkaW5nIGFuIGVuYWJsZWQgb25lLgo+ID4gPiA+Cj4gPiA+ID4g
Rml4ZXM6IGE5NjdhMjg5ZjE2OSAoIlJJU0MtVjogc2lmaXZlX2wyX2NhY2hlOiBBZGQgTDIgY2Fj
aGUgY29udHJvbGxlciBkcml2ZXIgZm9yIFNpRml2ZSBTb0NzIikKPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBdmkgV2Vpc3MgPHRobmtzbHBycHRAZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICBkcml2ZXJzL2NhY2hlL3NpZml2ZV9jY2FjaGUuYyB8IDQgKysrLQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jYWNoZS9zaWZpdmVfY2NhY2hlLmMgYi9kcml2ZXJzL2NhY2hl
L3NpZml2ZV9jY2FjaGUuYwo+ID4gPiA+IGluZGV4IDcxZDNmOTQ5ODdmYS4uMDI4NzhkNTQzODFk
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2FjaGUvc2lmaXZlX2NjYWNoZS5jCj4gPiA+
ID4gKysrIGIvZHJpdmVycy9jYWNoZS9zaWZpdmVfY2NhY2hlLmMKPiA+ID4gPiBAQCAtMjk3LDcg
KzI5Nyw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHNpZml2ZV9jY2FjaGVfaW5pdCh2b2lkKQo+ID4g
PiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgcXVpcmtzIF9fbWF5YmVfdW51c2VkOwo+ID4gPiA+ICAg
ICAgIGludCByYzsKPiA+ID4gPgo+ID4gPiA+IC0gICAgIG5wID0gb2ZfZmluZF9tYXRjaGluZ19u
b2RlX2FuZF9tYXRjaChOVUxMLCBzaWZpdmVfY2NhY2hlX2lkcywgJm1hdGNoKTsKPiA+ID4gPiAr
ICAgICBmb3JfZWFjaF9tYXRjaGluZ19ub2RlX2FuZF9tYXRjaChucCwgc2lmaXZlX2NjYWNoZV9p
ZHMsICZtYXRjaCkKPiA+ID4gPiArICAgICAgICAgICAgIGlmIChvZl9kZXZpY2VfaXNfYXZhaWxh
YmxlKG5wKSkKPiA+ID4KPiA+ID4gQXJlIHRoZXJlIGFueSBkZXZpY2VzIHdoZXJlIHRoaXMgaXMg
YWN0dWFsbHkgcG9zc2libGU/IElPVywgd2hlcmUgdGhlcmUKPiA+ID4gYXJlIDIgY2NhY2hlIGlu
c3RhbmNlcy4KPgo+ID4gSXQncyBtb3JlIG9mIGEgZGVmZW5zaXZlIHRoaW5nLiBUaGUgMiBjY2Fj
aGUgaW5zdGFuY2Ugd2FzIGFuIGV4YW1wbGUgLQo+ID4gdGhlIGlzc3VlIGlzIGFsc28gcmVsZXZh
bnQgZm9yIG9uZSBkaXNhYmxlZCBjY2FjaGUgbm9kZSBubz8KPgo+IFRoYXQgaXMgdHJ1ZS4KPiBB
bmQgb24gdGhlIHR3byBub2RlIGZyb250LCB0aGUgZHJpdmVyIGRvZXNuJ3Qgc3VwcG9ydCB0aGF0
IGFueXdheSBlaXRoZXIKPiBiZWZvcmUgb3IgYWZ0ZXIgdGhlIHBhdGNoLiBDb25zaWRlciB3aGF0
IHRoZSBuZXcgY29kZSBkb2VzIGlmIHRoZXJlIGFyZQo+IHR3byBub2RlcywgYm90aCBlbmFibGVk
Lgo+Cj4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhlIGNjYWNoZSBvciBsbGMtY2FjaGUgc3VjY2Vzc29y
IGFyZSBpbnRlbmRlZCBmb3IKPiB0aGF0IGtpbmQgb2Ygc2l0dWF0aW9uIGFueXdheS4KPgo+ID4g
U2luY2Ugb2ZfZmluZF9tYXRjaGluZ19ub2RlX2FuZF9tYXRjaCgpIGRvZXNuJ3QgY2hlY2sgd2hl
dGhlciBhIG5vZGUKPiA+IGlzIGVuYWJsZWQsIGl0IGNhbiByZXR1cm4gYSBkaXNhYmxlZCBvbmUu
Cj4gPgo+ID4gc2lmaXZlX2NjYWNoZV9pbml0KCkgdGhlbiBnb2VzIGFoZWFkIGFuZCBtYXBzIGFu
ZCBhY2Nlc3NlcyBpdHMKPiA+IHJlZ2lzdGVycywgZXZlbiB0aG91Z2ggdGhlIGRldmljZSB0cmVl
IG1hcmtzIGl0IGFzIGRpc2FibGVkIGFuZCBub3JtYWwKPiA+IE9GIHBsYXRmb3JtLWRldmljZSBj
cmVhdGlvbiB3b3VsZCBza2lwIGl0Lgo+Cj4gQ291bGQgd2UgaW5zdGVhZCBkcm9wIHRoZSBsb29w
IGFuZCBqdXN0IGNoZWNrIGZvciBhdmFpbGFiaWxpdHksIHdoaWxlCj4gcmV0YWluaW5nIG9mX2Zp
bmRfbWF0Y2hpbmdfbm9kZV9hbmRfbWF0Y2goKT8gSSBraW5kYSBmZWVsIGxpa2UgdGhlIGxvb3AK
PiBnaXZlcyB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZSBkcml2ZXIgc3VwcG9ydHMgbXVsdGlwbGUg
bm9kZXMsIHdoZW4gaXQKPiByZWFsaXN0aWNhbGx5IGRvZXMgbm90Lgo+Cj4gQ2hlZXJzLAo+IENv
bm9yLgo+Cj4gPgo+ID4gPgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
ID4gPiAgICAgICBpZiAoIW5wKQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7
Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IGJhc2UtY29tbWl0OiA2NWJhOGYzNGVjODg2ZWM3MmIy
YzA3ZGRjOGNmM2Q4MTVjMzI4NjlkCj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQzLjAKPiA+ID4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
