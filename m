Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C817EEB64DB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 18:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkpnXpJ58mifkJsR2EYSMRfv1sy8W1MewQ9UYP/jT+A=; b=b/XUuc+x8mKcJx
	PMVbjc48yNyjBK48Uti6Qt6myUesOshGUsQLCQH4aui4H4+LBGQ5GCqDYASeEnPv5WBo2GJjWv6SE
	vvNLrGLbphhbO37TogVDkvstECmyisn82QH3ufecd9FKTWuuH74YUgm4QQ5lPS7kuv7YnVM3rj1G7
	BDGNzby6roq7tGFQsoNdC3ZGanhfkN+g8LnANe7tTU7AUNACi3EJquY7nn76vYfgqJThxIjbG7RHe
	7PmEiC07N14q5iB+lHedVldIlqJxp5jo2HDtqQNrsk6OYl93CwPudL3yIunHFvRWSiDdhgg/G5T6g
	P6ovkwv2A7JecFn2hCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK5N-009Fna-03;
	Mon, 19 Jun 2023 18:58:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK5J-009Fmt-32
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 18:58:43 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b466744368so36342051fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687201119; x=1689793119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIUqA0rcSlk22wNkCwu8p2OK1XKL+AlvaBKhRl9Deog=;
        b=Df4GXWhRRUFLnOveDK8hfvwd48RBrvQO8w2FAxtEuEwDdipeUoSfZ50kZXGW0h9VSb
         gbEczQ+4zmK62ezKKxFoMO7CM9ActHZjxlk5clXTK7MCLdZJEQbp8Iaj7dO5/H+FZCV7
         haf8zABDvR53HP3z3HjL9X7d20Vjmr6PAMifc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201119; x=1689793119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIUqA0rcSlk22wNkCwu8p2OK1XKL+AlvaBKhRl9Deog=;
        b=UwTPyN0pNrLniJH9zSzxomE/B0Y6FNuN6eg8Z1g6x3my+23xYMlxLYRZj/rTWPxYsk
         2+Eun6WwVcUQ5TjS8Lo+NDGJoItHTXyIjYkVdVmWSR8EosS9f27B689Mnx5VjUXWTyXu
         XK+LzmGvUaRyOxbadM5Ab+va2cxb0YBr9OW6sGtkme+KjKRe/TJhpbHJ4vazgaYnc/sI
         5bVJEGQPW6nCi6x4p6CJG+eLu1gD20/i+3rGo5JV1wOUWBvcu3gg6gUtU6eY7u9fyH+N
         D+qz3kZuThAycSlycLHD1+ykXAjqmzqqmO0QUF0s5oRKccz04uaplWXbMThl0tafWQaA
         uSpg==
X-Gm-Message-State: AC+VfDx83YpXu2yK8OQEgo8LnTindSM+fi4jKbHW++gqyYpvoPCbZPmX
	s8jFLNyZhOvGM4+ZUb1Npy4mFl2fP91wZTMId9jP
X-Google-Smtp-Source: ACHHUZ6la5UyKR8hrXvI002lIEv1MDyAtdLvfOV6K2EKG0u9ts0sSq+5LA8R8Q0q7PRSIdMI7FtvKjtqtc3ZTgaiRuE=
X-Received: by 2002:a2e:9548:0:b0:2ad:99dd:de07 with SMTP id
 t8-20020a2e9548000000b002ad99ddde07mr5430627ljh.16.1687201119335; Mon, 19 Jun
 2023 11:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230619094705.51337-1-alexghiti@rivosinc.com> <20230619094705.51337-2-alexghiti@rivosinc.com>
In-Reply-To: <20230619094705.51337-2-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Jun 2023 11:58:28 -0700
Message-ID: <CAOnJCUJ5BgApWz3=F7f_CwATF0CV8dnZNw6hPYL0=b7-p63TiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: riscv: Update boot image header since
 EFI stub is supported
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_115842_188842_8C4CE855 
X-CRM114-Status: GOOD (  21.27  )
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

T24gTW9uLCBKdW4gMTksIDIwMjMgYXQgMjo0OOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgRUZJIHN0dWIgaXMgc3VwcG9ydGVkIG9u
IFJJU0MtViBzbyB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gdGhhdAo+IGV4cGxhaW5zIGhvdyB0
aGUgYm9vdCBpbWFnZSBoZWFkZXIgd2FzIHJldXNlZCB0byBzdXBwb3J0IGl0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+
ICBEb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdCB8IDEwICsrKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdCBi
L0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0Cj4gaW5kZXggYTRhNDUz
MTBjNGM0Li5kZjJmZmMxNzNlODAgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9i
b290LWltYWdlLWhlYWRlci5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1h
Z2UtaGVhZGVyLnJzdAo+IEBAIC0yOCwxMSArMjgsMTEgQEAgaGVhZGVyIGluIGZ1dHVyZS4KPiAg
Tm90ZXMKPiAgPT09PT0KPgo+IC0tIFRoaXMgaGVhZGVyIGNhbiBhbHNvIGJlIHJldXNlZCB0byBz
dXBwb3J0IEVGSSBzdHViIGZvciBSSVNDLVYgaW4gZnV0dXJlLiBFRkkKPiAtICBzcGVjaWZpY2F0
aW9uIG5lZWRzIFBFL0NPRkYgaW1hZ2UgaGVhZGVyIGluIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGtl
cm5lbCBpbWFnZQo+IC0gIGluIG9yZGVyIHRvIGxvYWQgaXQgYXMgYW4gRUZJIGFwcGxpY2F0aW9u
LiBJbiBvcmRlciB0byBzdXBwb3J0IEVGSSBzdHViLAo+IC0gIGNvZGUwIHNob3VsZCBiZSByZXBs
YWNlZCB3aXRoICJNWiIgbWFnaWMgc3RyaW5nIGFuZCByZXMzKGF0IG9mZnNldCAweDNjKSBzaG91
bGQKPiAtICBwb2ludCB0byB0aGUgcmVzdCBvZiB0aGUgUEUvQ09GRiBoZWFkZXIuCj4gKy0gVGhp
cyBoZWFkZXIgaXMgYWxzbyByZXVzZWQgdG8gc3VwcG9ydCBFRkkgc3R1YiBmb3IgUklTQy1WLiBF
Rkkgc3BlY2lmaWNhdGlvbgo+ICsgIG5lZWRzIFBFL0NPRkYgaW1hZ2UgaGVhZGVyIGluIHRoZSBi
ZWdpbm5pbmcgb2YgdGhlIGtlcm5lbCBpbWFnZSBpbiBvcmRlciB0bwo+ICsgIGxvYWQgaXQgYXMg
YW4gRUZJIGFwcGxpY2F0aW9uLiBJbiBvcmRlciB0byBzdXBwb3J0IEVGSSBzdHViLCBjb2RlMCBp
cyByZXBsYWNlZAo+ICsgIHdpdGggIk1aIiBtYWdpYyBzdHJpbmcgYW5kIHJlczMoYXQgb2Zmc2V0
IDB4M2MpIHBvaW50cyB0byB0aGUgcmVzdCBvZiB0aGUKPiArICBQRS9DT0ZGIGhlYWRlci4KPgo+
ICAtIHZlcnNpb24gZmllbGQgaW5kaWNhdGUgaGVhZGVyIHZlcnNpb24gbnVtYmVyCj4KPiAtLQo+
IDIuMzkuMgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
