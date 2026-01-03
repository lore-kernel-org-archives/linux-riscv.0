Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CC5FC6175
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qa2Vr+DqGfYekK+IjLQgjjbEoupBt+GDJVEcvavPxHM=; b=xkz4pMch4Ez9CB
	rf5q/rz2Ux8BeQiHrugviZm3qSTY2waZfq7KkNmLFhSLgtiLhBIhc23rh7aBnoPmst7sTS1oC+rBD
	Lc9bSN8wPwYDSPS1bvexbTZQ9Pg+J9MTbkNeW3bpksA7FhbkYnTOSb+zNJo9DHxln8joWq6HBs82N
	A+d73vNPzTwPCs77Yk4ptkhL5Qb7Du8V07npXVTnq2yP2WSTkKai6JalzzDOvBdkac0w076vyCbHM
	Fb0WDwaYWuRI6HkE/HSu7BgTaEGnupYd3qxPU/3rFiOYO2qX2E4a20mrLRg2ovVflTwFtd7jFn4cn
	70Oap8Y3U2cZLmhDNtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3AJ-00000009QG4-16Px;
	Sat, 03 Jan 2026 15:03:39 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3AF-00000009QFM-0yp0
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:03:36 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso9011395137.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767452614; x=1768057414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwrVIBUzkZVqv+2p7KMwhr9VJcQGMPPRO78K+5XEw1A=;
        b=dF/94+tERDIV882O+/3Do5Rycxp5S1d8fqAzYZFmof/GVvH/k4JmYeQv8/ILD3Hn8+
         wObWYS0WpSM+gTQ/OFipSdkrgiBW+HnWXZusvWxs07vymfJY9pX6Uu5Xj7WjMEJVx8dQ
         IxnEK/dr5EaSqhA/yhiSSI+jdB2Y3dNjOQpp5eg5EK1bK4ixJa9xofbn2+hcrwTYzer3
         qBXEdb2vBt9w1CgWsOpVFie6I4aQsBJp10xrdxVOuHkQM1Ev3d+cJ3NQc/TbK76iHdut
         Cuqry8i3XYFQ08xELr1B4OB18UaXqM440mtI7NK/yRBF1kdmcCw7NsduihfeBCmCWiQO
         MT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767452614; x=1768057414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwrVIBUzkZVqv+2p7KMwhr9VJcQGMPPRO78K+5XEw1A=;
        b=nvcGXsDGkNvQY8m95fKKDF+lC74OSUZLYoS24aKGejzYaEz243sPar/kE19+Nk84UB
         mCWSZOzMBwn1Iv50tgjAxkWW/p4akM+sKRS6299BOg0/UjKlVrwXsA763rAQYfAJt0EA
         JZ0McpLV+fPlRXZp1lHE6oKg/Oobd0Vp87LEIC1eKBG9L895VCNM6dwJBy2XfDGFC6T8
         orbqVot7ht8TKPhyhgGymohI0xmc4Ujeih3ZTcGdle8jIuSM9a9aygO6k3m/dWjxu/wh
         HDgRq0mTUccLXxLoKJdmQ3IwllecoJ4PcJHh8fFofTSovOLi4x6bUMS8hlrpNdu2lqtl
         2XPA==
X-Forwarded-Encrypted: i=1; AJvYcCV2SxHrTYN+NWrTDln5ElMsXAlz3xP3Ls2dK7S+G7TIBfBWytaCNf4BKVuPRUR+oBD3cimBhcUoZob55A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY3BwELg+F+hyUBOyzGCOD8tTNO2qsexwVOJNcvW1T+vN0wOTq
	VeBVNaFMRmts1LlbKmn0KM+GU/2n7LFTWhaVjXQj9DpNhFBGOv8HEKDXWveB/fo69IuXxS5O/eS
	TMM+XFbe4AANiJ8BYrIz7jEuBNNXXIuk=
X-Gm-Gg: AY/fxX5NEZLlO/Uh6ynjClMi+AVH3Rhj2KJNz4AFg7sX63hQ8o6epA5VjqHRuOHQR2b
	lYV2fsGGx999Y7otfG60QzABtbukuJcP51LE5FjLAe8gNLCPjbGHl8K50KJkIRbmIWfnIGISOsj
	ZKpJPpg4VfDpWGIlvkRPCaHK8NL/Dc1da3mSNqNUG6rkEUAPZyqOsJUpBlN7sc0ZKqVbHB0NLD2
	EttXEaxQdAjH40nWtR5jvljE+AT/v43kJAN5YpU2N5zP2Pp/4oe6FnfQaLLmYQLeD9vv427ULle
	/F++1ouO5YGEjrfxf/IeNMAVUGAN7MH9lagOYxri
X-Google-Smtp-Source: AGHT+IEe0TGbcVDQqYkKLDV2fz4CdCsKkxINqQGJz/SsAWdLoWUyDnC12Cf+IziDzjbrjZgNHmrLfFHz+90HMxyIiJs=
X-Received: by 2002:a05:6102:c47:b0:5df:aff3:c433 with SMTP id
 ada2fe7eead31-5eb1a699b01mr15138065137.16.1767452613476; Sat, 03 Jan 2026
 07:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
 <20260103094501.5625-2-naohiko.shimizu@gmail.com> <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
In-Reply-To: <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Sun, 4 Jan 2026 00:03:24 +0900
X-Gm-Features: AQt7F2qE5-G8e1VDYm3BBWvysOBQQbD6CjAauhjy-Wp1nfvQllESnaQ8TjIZqrU
Message-ID: <CAA7_YY-t2wWaqztey6Y3+eS8R=uvQnY6kT2h+vMzFAiZkGh4og@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Anup Patel <apatel@ventanamicro.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_070335_286538_6154C4FF 
X-CRM114-Status: GOOD (  17.34  )
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

SGkgQW51cCwKClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCgpJIGFncmVlLiBJIHdpbGwgdXBk
YXRlIHRoZSBjb21taXQgZGVzY3JpcHRpb24gaW4gdjIgdG8gZXhwbGljaXRseSBjaXRlCnRoZSBS
SVNDLVYgUHJpdmlsZWdlZCBTcGVjaWZpY2F0aW9uIGFuZCBleHBsYWluIHdoeSB0aGUgMy1zdGVw
CnByb2dyYW1taW5nIHNlcXVlbmNlIGlzIG5lY2Vzc2FyeSB0byBhdm9pZCB0aW1lciBoYXphcmRz
IG9uIFJWMzIuCgpCcmllZmx5LCB0aGUgY3VycmVudCBjb2RlIHdyaXRlcyB0aGUgTFNCIGZpcnN0
IHdpdGhvdXQgZW5zdXJpbmcgaXQncwppbiB0aGUgZnV0dXJlLCB3aGljaCBjYW4gdHJpZ2dlciBh
IHNwdXJpb3VzIGludGVycnVwdCBpZiBUaW1lID49CntzdGltZWNtcGgob2xkKSwgc3RpbWVjbXAo
bmV3KX0gYmVjb21lcyB0cnVlIG1vbWVudGFyaWx5LiBUaGUgbmV3CnNlcXVlbmNlIGZvbGxvd3Mg
dGhlIHNwZWMncyByZWNvbW1lbmRhdGlvbiBmb3IgbXRpbWVjbXAgKFNlY3Rpb24KMy4yLjEpIHRv
IGVuc3VyZSB0aGUgNjQtYml0IHZhbHVlIGlzIGFsd2F5cyAiaW4gdGhlIGZ1dHVyZSIgZHVyaW5n
IHRoZQp1cGRhdGUuCgpJIHdpbGwgYXBwbHkgdGhlIHNhbWUgZGV0YWlsZWQgZGVzY3JpcHRpb24g
dG8gW1BBVENIIDIvM10gYXMgd2VsbC4KClJlZ2FyZHMsIE5hb2hpa28gU2hpbWl6dQoKCk9uIFNh
dCwgSmFuIDMsIDIwMjYgYXQgMTE6NDbigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1p
Y3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEphbiAzLCAyMDI2IGF0IDM6MTbigK9QTSBOYW9o
aWtvIFNoaW1penUKPiA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQbGVh
c2UgYWRkIGEgZGV0YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uIGFib3V0IHdoeSB0aGUKPiBuZXcg
d2F5IG9mIHByb2dyYW1taW5nIHN0aW1lY21wIGlzIGJldHRlci4gQWxzbywgZXhwbGFpbgo+IHdo
YXQgdGhlIGN1cnJlbnQgUHJpdiBzcGVjIHNheXMgaW4gdGhpcyBjb250ZXh0Lgo+Cj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMyArKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0
ZDgzYzQyYzAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
LmMKPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gQEAgLTUw
LDggKzUwLDkgQEAgc3RhdGljIGludCByaXNjdl9jbG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxv
bmcgZGVsdGEsCj4gPgo+ID4gICAgICAgICBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2
X3NzdGNfYXZhaWxhYmxlKSkgewo+ID4gICNpZiBkZWZpbmVkKENPTkZJR18zMkJJVCkKPiA+IC0g
ICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZG
RkZGKTsKPiA+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19N
QVgpOwo+ID4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBuZXh0X3R2
YWwgPj4gMzIpOwo+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5l
eHRfdHZhbCAmIDB4RkZGRkZGRkYpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgICAgICAgICAgY3Ny
X3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAy
LjM5LjUKPiA+Cj4gPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
