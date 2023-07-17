Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207FFEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwGDeUV8xr4HTJw4UCg1sghs0vUc6B+W4KBo7Tlk4KM=; b=Dw+o+Xt8tvLHcl
	9QKsiNxLTs+JEjYP7bzq1hfFIdY8pTDgaQOIWbR37bYf1p6K8kxl6RiUWPcQ0glMUahofQnbZzCvR
	35uUEV7iBjvwJXeZpMJMKcvfi3BIHQUfRovMHhv2+rU7tfuyX+kU43TGOOYfHd9975aFfT4/eNKue
	Av1dGa9Mkl86Ee9KtvHuOUk5WKFAD7JbVMppjUIHR/vX7PbnvVaHMly/X5de6yTq6ee/gGHr8tbhf
	jgQTw+g0iChS9i2/D8QO5xLiN3sZ4/qfpdxHmgCfjwEKIo/l3kqXBBTNOPxkWGDgAZeilE1A/P5+5
	WYHzl6I2/QukgIkdvtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0yh-005u0n-2o;
	Wed, 19 Jul 2023 06:48:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0yg-005tzV-2W
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T0vSTddCvpCRB5+yiUAWYvUbtvxTOv2Q4zjZH3DHeeg=; b=lns88EzS/nNK2oClLSR6WqMrxm
	SYWRgxbSbODn8TzzBOi00z/hNvJMW25Bf7T2oFYjQBvSc81y+GxJelrfG93FPtRsLakXWJyFfuc2c
	dVuk0JdtrfUMwdWlty+VT80gSuZrWGm1WtIfQYleOMN1olkixHKjjlNFIQBHvf3kWEla7C0qLxyKh
	j9nQRbjDGjAhYN8g+UX+uU6ouibqZCe+HX8a2xOzHV6uBUplNFbQZuuKyHTl3xMzNnGazdh1JSKJP
	LQzzOz6FFu5MKC5Ok+DqyPTyqQ8wV089SxgiO01DZ1UQqUj0XhGt4eNEtJuiExtKVZc2t2xqIg8vh
	MRNsvhpA==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLXaX-009SMn-0c
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 23:25:14 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fba03becc6so7794755e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 16:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689636186; x=1692228186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0vSTddCvpCRB5+yiUAWYvUbtvxTOv2Q4zjZH3DHeeg=;
        b=I/mUjLqy4mLdHkR+BwTOC9b9TZ5wXxeSVspl1j2Zqu3jsQwKW3DoCSqiugdzgoEVWm
         oeY70oMe9WX7hoKzgQTt/msrf/dGJysdm0YUXnhlICEDQOgHG3ckzl1Lagm0FK6Wfqo7
         c1Ueu026ITVD+35nvX4n2T/sCzjiNLb1gxqHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689636186; x=1692228186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0vSTddCvpCRB5+yiUAWYvUbtvxTOv2Q4zjZH3DHeeg=;
        b=Z4A0AEDU7i7p99rxAki/b/X16uog9YMwDt9zrYAzQv+XhGz3zc9KDUjo+5sHlbQq0x
         bXydP0C/ghsGvlzs5K7LmTqMHIW2cmOiinPMVy3m0y2/gKIqXEwmXmIU5hSIYQAo6v5S
         +kWTRrhsDwzq7j5folPMO2xkEaEs/HiG1m7KH9CjcY7JWwhIWmCBKICEDGYM6QXZic5F
         81pcAXqZk3uZBubriIx3SZGIhly4pu9Ovpz4af6rqJw7PL6a7NLHOGLGlTwnBv1ar534
         nkTcivDGsUcMmtCGn9CQjZloZ8PskHu34IDSTaQ8RKoV8IipNFLpaW0exDLdp1O5V0fY
         eb1g==
X-Gm-Message-State: ABy/qLa+jvkCkAm1GMzSBSgt0VJVr2qvFEa3fKJjXF5WxMDm7y0JpJDH
	ood92FWWWKKylJl3EqjW9VMUT3TDaK+sdUL8hYmPz5BTtUOiAQg=
X-Google-Smtp-Source: APBJJlEnOlGbG17t3bsZWN7lS8b9NLFGSd6K+pYqObwoUMfSLiOXoJ40L/qgWyCLgjJKxgZhkFeJ9Be2g3Q/07jG5TY=
X-Received: by 2002:ac2:4c45:0:b0:4eb:46c2:e771 with SMTP id
 o5-20020ac24c45000000b004eb46c2e771mr4215007lfk.14.1689636186128; Mon, 17 Jul
 2023 16:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <DDB4EEB8-12A0-4E66-8E96-808E84A82078@remlab.net>
In-Reply-To: <DDB4EEB8-12A0-4E66-8E96-808E84A82078@remlab.net>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 17 Jul 2023 16:22:54 -0700
Message-ID: <CAOnJCU+ee=FXWp7mz_Tn07TbRBb3eXLFBqyRBAJbhQTO-Jxvrw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>, 
	Jan Newger <jannewger@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_002509_825907_CC86454A 
X-CRM114-Status: GOOD (  33.33  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNjozOOKAr0FNIFLDqW1pIERlbmlzLUNvdXJtb250IDxy
ZW1pQHJlbWxhYi5uZXQ+IHdyb3RlOgo+Cj4gSGksCj4KPiBMZSAzIGp1aWxsZXQgMjAyMyAxNTo0
NjozNyBHTVQrMDM6MDAsIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4g
YSDDqWNyaXQgOgo+ID5yaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVjdCBhY2Nlc3MgdG8gY3ljbGUv
dGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+ID5ieXBhc3NpbmcgdGhlIHBlcmYgZnJhbWV3b3JrLCB0
aGlzIHBhdGNoc2V0IGludGVuZHMgdG8gYWxsb3cgdGhlIHVzZXIgdG8KPiA+bW1hcCBhbnkgY291
bnRlciB3aGVuIGFjY2Vzc2VkIHRocm91Z2ggcGVyZi4gQnV0IHdlIGNhbid0IGJyZWFrIHRoZQo+
ID5leGlzdGluZyBiZWhhdmlvdXIgc28gd2UgaW50cm9kdWNlIGEgc3lzY3RsIHBlcmZfdXNlcl9h
Y2Nlc3MgbGlrZSBhcm02NAo+ID5kb2VzLCB3aGljaCBkZWZhdWx0cyB0byB0aGUgbGVnYWN5IG1v
ZGUgZGVzY3JpYmVkIGFib3ZlLgo+Cj4gQUZBSUssIGlmIHRoZSBkZWZhdWx0IHNldHRpbmdzIGJy
ZWFrcyB1c2VyIHNwYWNlLCB0aGUgcGF0Y2hzZXQgaXMgY29uc2lkZXJlZCB0byBicmVhayB1c2Vy
IHNwYWNlLiBUaGF0IGJlaW5nIHRoZSBjYXNlLCBlaXRoZXIgdGhpcyBjYXNlIGlzIGRlZW1lZCBz
cGVjaWFsIGVub3VnaCB0aGF0IGJyZWFraW5nIHVzZXIgc3BhY2UgaXMgT0ssIG9yIGl0IGlzIG5v
dC4KPgoKVGhpcyBjYXNlIGlzIGEgc3BlY2lhbCBjYXNlIGFzIHRoZSB1c2FnZSB3YXMgaW5jb3Jy
ZWN0IGluIHRoZSBmaXJzdApwbGFjZS4gQW55IGFwcGxpY2F0aW9uIHRoYXQgZ2VudWluZWx5IHJl
cXVpcmVzIHJkY3ljbGUgY2FuIGFsd2F5cyBnZXQKaXQgbm93IHZpYSB0aGUgcGVyZiBpbnRlcmZh
Y2UuCklmIHRoZSBpbnNlY3VyZSBhbmQgaW5jb3JyZWN0IGJlaGF2aW9yIGlzIGFsbG93ZWQsIHdl
IHN1c3BlY3QgdGhlIHVzZXIKc3BhY2UgYmVoYXZpb3Igd2lsbCBuZXZlciBiZSBmaXhlZCBhcyBp
dCBpcyBoYXJkIHRvIHB1dCBhIGZ1dHVyZSBmbGFnCmRhdGUgaW4gdGhlc2UgY2FzZXMuCkdpdmVu
IHRoYXQgdGhlIFJJU0MtViBlY28tc3lzdGVtIGlzIHN0aWxsIHlvdW5nLCBpdCBpcyBiZXR0ZXIg
dG8KZGlzYWxsb3cgdGhpcyBiZWhhdmlvciB0byBhdm9pZCBmdXJ0aGVyIHByb2xpZmVyYXRpb24g
b2YgdGhlIHNhbWUKaW5jb3JyZWN0IHVzYWdlLgoKPiBJZiBpdCBpcyBub3QgT0ssIHRoZW4gdGhl
IG9ubHkgd2F5IG91dCB0aGF0IEkgY2FuIHRoaW5rIG9mLCBjb25zaXN0cyBvZiB0cmFwcGluZyBh
bmQgZW11bGF0aW5nIHRoZSBjb3VudGVycywgcmV0dXJuaW5nIHRoZSBzYW1lIHNhbml0aXNlZCB2
YWx1ZXMgdGhhdCBMaW51eCBwZXJmIHdvdWxkIHJldHVybi4gVGhlbiB5b3UgY2FuIGFkZCBhIGtl
cm5lbCBjb25maWcgb3B0aW9uIHRvIGRpc2FibGUgdGhhdCB0cmFwLWFuZC1lbXVsYXRpb24gY29k
ZSBpbiB0aGUgZnV0dXJlLgo+CgpXaGF0IGRvIHlvdSBtZWFuIGJ5ICJzYW5pdGlzZWQiIHZhbHVl
ID8gSWYgeW91IG1lYW4gdGhlIGNvcnJlY3QgdmFsdWUsCml0IGRvZXNuJ3Qga25vdyB3aGVuIHRv
IHN0b3AgcHJvdmlkaW5nIHRoYXQgdmFsdWUgKHdpdGhvdXQgcmVpbnZlbnRpbmcKdGhlIGVudGly
ZSBjb250ZXh0IHN3aXRjaCB3aGljaCB0aGUgcGVyZiBmcmFtZXdvcmsgYWxyZWFkeSBkb2VzIGZv
cgp1cykuCklmIHdlIGp1c3QgcHJvdmlkZSBhIGR1bW15IHZhbHVlLCB0aGF0IGRvZXNuJ3QgaGVs
cCB0aGUgY3VycmVudCB1c2VycwphcyB3ZWxsLiBUaGV5IHdpbGwgcHJvYmFibHkgZ2V0IHVuZXhw
ZWN0ZWQgcmVzdWx0cyBpbnN0ZWFkIG9mIHNpZ2lsbC4KCkkgaGF2ZSBjYydkIGEgZmV3IGZvbGtz
IHdobyB3ZXJlIGludm9sdmVkIGluIHRoZSBpbml0aWFsIGRpc2N1c3Npb25zCndoZW4gdGhpcyBp
c3N1ZSB3YXMgcmVwb3J0ZWQgdG8gY29sbGVjdCB0aGUgZmVlZGJhY2suCgo+IEVpdGhlciB3YXks
IEkgZG9uJ3Qgc3VwcG9zZSB0aGF0IHRoZXJlIHNob3VsZCBiZSBhbiBvcHRpb24gdG8gYmUgaW5z
ZWN1cmVseSBiYWNrd2FyZCBjb21wYXRpYmxlLgo+Cj4gPgo+ID5UaGlzIHZlcnNpb24gbmVlZHMg
b3BlblNCSSB2MS4zICphbmQqIGEga2VybmVsIGZpeCB0aGF0IHdlbnQgdXBzdHJlYW0gbGF0ZWx5
Cj4gPihodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwNjE2MTE0ODMxLjMxODY5ODAt
MS1tYXpAa2VybmVsLm9yZy9ULykuCj4gPgo+ID4qKkltcG9ydGFudCoqOiBJbiB0aGlzIHZlcnNp
b24sIHRoZSBkZWZhdWx0IG1vZGUgaXMgbm93IHVzZXIgYWNjZXNzLCBub3QKPiA+dGhlIGxlZ2Fj
eSBzbyBzb21lIGFwcGxpY2F0aW9ucyB3aWxsIGJyZWFrLgo+ID4KPiA+YmFzZS1jb21taXQtdGFn
OiB2Ni40LXJjNgo+ID4KPiA+Q2hhbmdlcyBpbiB2NDoKPiA+LSBGaXhlZCBzb21lIG5pdHMgaW4g
cmlzY3ZfcG11X3NiaS5jIHRoYW5rcyB0byBBbmRyZXcKPiA+LSBGaXhlZCB0aGUgZG9jdW1lbnRh
dGlvbiB0aGFua3MgdG8gQW5kcmV3Cj4gPi0gQWRkZWQgUkIgZnJvbSBBbmRyZXcgXG8vCj4gPgo+
ID5DaGFuZ2VzIGluIHYzOgo+ID4tIHBhdGNoIDEgbm93IGNvbnRhaW5zIHRoZSByZWYgdG8gdGhl
IGZhdWx0eSBjb21taXQgKG5vIEZpeGVzIHRhZyBhcyBpdCBpcyBvbmx5IGEgY29tbWVudCksIGFz
IEFuZHJldyBzdWdnZXN0ZWQKPiA+LSBSZW1vdmVkIFJJU0NWX1BNVV9MRUdBQ1lfVElNRSBmcm9t
IHBhdGNoIDMsIGFzIEFuZHJldyBzdWdnZXN0ZWQKPiA+LSBSZW5hbWUgUklTQ1ZfUE1VX1BERVZf
TkFNRSB0byAicmlzY3YtcG11LXNiaSIsIHBhdGNoNCBpcyBqdXN0IGNvc21ldGljIG5vdywgYXMg
QW5kcmV3IHN1Z2dlc3RlZAo+ID4tIFJlbW92ZWQgYSBmZXcgdXNlbGVzcyAoYW5kIHdyb25nKSBj
b21tZW50cywgYXMgQW5kcmV3IHN1Z2dlc3RlZAo+ID4tIFNpbXBsaWZ5IGFyY2hfcGVyZl91cGRh
dGVfdXNlcnBhZ2UgY29kZSwgYXMgQW5kcmV3IHN1Z2dlc3RlZAo+ID4tIERvY3VtZW50YXRpb24g
bm93IG1lbnRpb25zIHRoYXQgdGltZSBDU1IgaXMgKmFsd2F5cyogYWNjZXNzaWJsZSwgd2hhdGV2
ZXIgdGhlIG1vZGUsIGFzIHN1Z2dlc3RlZCBieSBBbmRyZXcKPiA+LSBSZW1vdmVkIENZQ0xFSCBy
ZWZlcmVuY2UgYW5kIGFkZCBUT0RPIGZvciBydjMyIHN1cHBvcnQsIGFzIHN1Z2dlc3RlZCBieSBB
dGlzaAo+ID4tIERvIG5vdCByZW5hbWUgdGhlIHBtdSBpbnN0YW5jZSBhcyBBdGlzaCBzdWdnZXN0
ZWQKPiA+LSBTZXQgcG1jX3dpZHRoIG9ubHkgaWYgcmRwbWMgaXMgZW5hYmxlZCBhbmQgQ09ORklH
X1JJU0NWX1BNVSBpcyBzZXQgYW5kIHRoZSBldmVudCBpcyBhIGh3IGV2ZW50Cj4gPi0gTW92ZSBh
cmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
MzA2MTYxMTQ4MzEuMzE4Njk4MC0xLW1hekBrZXJuZWwub3JnL1QvCj4gPi0gKipTd2l0Y2ggdG8g
dXNlciBtb2RlIGFjY2VzcyBieSBkZWZhdWx0KioKPiA+Cj4gPkNoYW5nZXMgaW4gdjI6Cj4gPi0g
U3BsaXQgaW50byBzbWFsbGVyIHBhdGNoZXMsIHdheSBiZXR0ZXIhCj4gPi0gQWRkIFJCIGZyb20g
Q29ub3IKPiA+LSBTaW1wbGlmeSB0aGUgd2F5IHdlIGNoZWNrZWQgcmlzY3YgYXJjaGl0ZWN0dXJl
Cj4gPi0gRml4IHJhY2UgbW1hcCBhbmQgb3RoZXIgdGhyZWFkIHJ1bm5pbmcgb24gb3RoZXIgY3B1
cwo+ID4tIFVzZSBod2Mgd2hlbiBhdmFpbGFibGUKPiA+LSBTZXQgYWxsIHVzZXJzcGFjZSBhY2Nl
c3MgZmxhZ3MgaW4gZXZlbnRfaW5pdCwgdG9vIGN1bWJlcnNvbWUgdG8gaGFuZGxlIHN5c2N0bCBj
aGFuZ2VzCj4gPi0gRml4IGFyY2hfcGVyZl91cGRhdGVfdXNlcnBhZ2UgZm9yIHBtdSBvdGhlciB0
aGFuIHJpc2N2LXBtdSBieSByZW5hbWluZyBwbXUgZHJpdmVyCj4gPi0gRml4ZWQga2VybmVsIHRl
c3Qgcm9ib3QgYnVpbGQgZXJyb3IKPiA+LSBGaXhlZCBkb2N1bWVudGF0aW9uIChBbmRyZXcgYW5k
IEJhZ2FzKQo+ID4tIHBlcmYgdGVzdHN1aXRlIHBhc3NlcyBtbWFwIHRlc3RzIGluIGFsbCAzIG1v
ZGVzCj4gPgo+ID5BbGV4YW5kcmUgR2hpdGkgKDEwKToKPiA+ICBwZXJmOiBGaXggd3JvbmcgY29t
bWVudCBhYm91dCBkZWZhdWx0IGV2ZW50X2lkeAo+ID4gIGluY2x1ZGU6IHJpc2N2OiBGaXggd3Jv
bmcgaW5jbHVkZSBndWFyZCBpbiByaXNjdl9wbXUuaAo+ID4gIHJpc2N2OiBNYWtlIGxlZ2FjeSBj
b3VudGVyIGVudW0gbWF0Y2ggdGhlIEhXIG51bWJlcmluZwo+ID4gIGRyaXZlcnM6IHBlcmY6IFJl
bmFtZSByaXNjdiBwbXUgc2JpIGRyaXZlcgo+ID4gIHJpc2N2OiBQcmVwYXJlIGZvciB1c2VyLXNw
YWNlIHBlcmYgZXZlbnQgbW1hcCBzdXBwb3J0Cj4gPiAgZHJpdmVyczogcGVyZjogSW1wbGVtZW50
IHBlcmYgZXZlbnQgbW1hcCBzdXBwb3J0IGluIHRoZSBsZWdhY3kgYmFja2VuZAo+ID4gIGRyaXZl
cnM6IHBlcmY6IEltcGxlbWVudCBwZXJmIGV2ZW50IG1tYXAgc3VwcG9ydCBpbiB0aGUgU0JJIGJh
Y2tlbmQKPiA+ICBEb2N1bWVudGF0aW9uOiBhZG1pbi1ndWlkZTogQWRkIHJpc2N2IHN5c2N0bF9w
ZXJmX3VzZXJfYWNjZXNzCj4gPiAgdG9vbHM6IGxpYjogcGVyZjogSW1wbGVtZW50IHJpc2N2IG1t
YXAgc3VwcG9ydAo+ID4gIHBlcmY6IHRlc3RzOiBBZGFwdCBtbWFwLWJhc2ljLmMgZm9yIHJpc2N2
Cj4gPgo+ID4gRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8ICAy
NyArKy0KPiA+IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyAgICAgICAgICAgICAgICAgICAgfCAx
MTMgKysrKysrKysrKysKPiA+IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgICAgICAg
ICAgICAgfCAgMjggKystCj4gPiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jICAgICAgICAg
ICAgICAgIHwgMTk2ICsrKysrKysrKysrKysrKysrKystCj4gPiBpbmNsdWRlL2xpbnV4L3BlcmYv
cmlzY3ZfcG11LmggICAgICAgICAgICAgIHwgIDEyICstCj4gPiBpbmNsdWRlL2xpbnV4L3BlcmZf
ZXZlbnQuaCAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gPiB0b29scy9saWIvcGVyZi9tbWFw
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDY1ICsrKysrKysKPiA+IHRvb2xzL3BlcmYvdGVz
dHMvbW1hcC1iYXNpYy5jICAgICAgICAgICAgICAgfCAgIDQgKy0KPiA+IDggZmlsZXMgY2hhbmdl
ZCwgNDI4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+ID4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgoKLS0gClJlZ2FyZHMs
CkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
