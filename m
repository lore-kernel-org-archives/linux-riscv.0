Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14263C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttt/+VKlOEoDnevvBmNOIqRYRcx3EYjN9SyCLZAA9bw=; b=VKkNFopq+Nork1
	D9X6JFFWmIB4LvSZowRHUzxYrp0nHKSuKXxAqc228FxQEBtaUEfaXuG9LpWasuyrYYYxM5jXOnnGz
	BQnkaTqRSG3YDdHgZh/HnOkqiOzvtRLOnHFf1v9aXFD8Zzlar08QHy/RKCkcc5sn3dr4+uZ3ihNkx
	B/HAAtMPjm3VGm18IOiJSyhGp3PUKRTdLt2NoDBj0qTkWFYMhBT2wbZDN8ZARZGjAhI6TwAP91eGb
	SA8e7PRDv02hf+S3Nrn8JKfdiq7GRU8eR4uAzd2ZyS3vQt6ok+Yc01q8G8V6R9C8u5+M7IXIk/vM8
	I8C2q9//dR8Rd+/2V/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9q1X-00000003h7t-44cN;
	Wed, 22 May 2024 17:45:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9q1U-00000003h4T-10aX
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 17:45:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5724736770cso641a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716399904; x=1717004704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46egnT16tVwxmfnNBO145wZ0ppbM6j0s2l6EqdlS1tY=;
        b=4pJA0z6NcXU7B8vqWkLTEWAmHHp6NrCStWkw61JfKuxtowvSU8gERiMyJQ/2U5lNFi
         ZWyausdwibkadRKoQeWPjqeJZpz8A1jLslXxEHjEEkzJplHgtY+UfFZS++JNWoDdi/Fg
         zBkamjG5gqHkvBHuigjEOIzOctyBlOLPAFu4+XysZ4JXKdU7w9IjQ2WU2MJzG6mUSaJa
         Fr/ej28Rvji3GwRF7oyDruNNQKug2KxoIfAdo/BC4l0FozSZyxr0MFRBKcLcFEtrydK5
         CGWTGWNAVcbaKjqU8fMHb9efY0ii3P4NYfF5M0/nQDXWtuQD3zFawYnhRheWjBVU8KA4
         eNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399904; x=1717004704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46egnT16tVwxmfnNBO145wZ0ppbM6j0s2l6EqdlS1tY=;
        b=pa5+P+C2rjKxEfLQnRK3tPZxl+pP+bYLpIHapu2a8XmlznUx0VbGBlT9i+p5GQQELv
         oEAv1doU0t8mVAZh2rUaICOH0RF8OfoSXntfY4KXc6RY1Ay7XB5azCjqMZ8q0lGML7ho
         NyLuMGCzGEYqNIZKSzJ3nEP9D2x9oLIW7mXN1FKTqqgJgpREy0551xDL6l6iz2eKDTk6
         ipkAnIPoqNsbop1nvpfxZSnXFidoJlRLXh4Y1TFSQ3E3WOOGDocFyKH8Tnh7B8vku+tW
         RhXu91OKochr3grJEWLiixTvXCb0djMdaT9J649gjMn72SuvyPJJdn4pcuH2x7Enj7Vq
         WNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBi9tkngcH3JghTkHTKDlm0pQWXZkJqAICAGhecZBwOzo6arbCDyEVJ1ebMpeovOq1J+t6EKmG1jpSw9ZM2cM5zBfjtb1LWxPQituG5m8y
X-Gm-Message-State: AOJu0YzXYvoUaFD2i7qOJcpWQSGaMsl7cSH2pFy8THZw+fhpeuiaIXH6
	FHAigDgwF5PCnnsRRsJZd+bRsifYVwC4Oa2qqyZZVwP8I13IbxdciVrhUYsqVgXe2QbcnRyYj6O
	VgddoOoISmpQIfmjs5ADSHDM+/pOUAwGF3Q0TPUQ5XNkeYXWkpvto
X-Google-Smtp-Source: AGHT+IEv8xe30GVN53LXujFuOLIK2Susr76GRSHxvaCa6Bcn17UOTkMRnicosfESbnqEFHs+NH8WrFmg8Sb7+erv/0Q=
X-Received: by 2002:a05:6402:2685:b0:572:e6fb:ab07 with SMTP id
 4fb4d7f45d1cf-5783237b9e4mr236808a12.7.1716399903775; Wed, 22 May 2024
 10:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com> <6caf3332-9ed9-4257-9532-4fd71c465c0d@linuxfoundation.org>
 <20240522101349.565a745e@kernel.org>
In-Reply-To: <20240522101349.565a745e@kernel.org>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 22 May 2024 10:44:36 -0700
Message-ID: <CAG4es9VZ3r34sUkp31+GCrA_XOq6WqwUUitPMQFViLL83mezYg@mail.gmail.com>
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	shuah@kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_104508_306978_AF53AB75 
X-CRM114-Status: GOOD (  17.43  )
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

T24gV2VkLCBNYXkgMjIsIDIwMjQgYXQgMTA6MTPigK9BTSBKYWt1YiBLaWNpbnNraSA8a3ViYUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMjIgTWF5IDIwMjQgMTA6MTk6MzMgLTA2MDAg
U2h1YWggS2hhbiB3cm90ZToKPiA+IE9uIDUvMjEvMjQgMTg6NTYsIEVkd2FyZCBMaWF3IHdyb3Rl
Ogo+ID4gPiBDZW50cmFsaXplcyB0aGUgZGVmaW5pdGlvbiBvZiBfR05VX1NPVVJDRSBpbnRvIEtI
RFJfSU5DTFVERVMgYW5kIHJlbW92ZXMKPiA+ID4gcmVkZWZpbml0aW9ucyBvZiBfR05VX1NPVVJD
RSBmcm9tIHNvdXJjZSBjb2RlLgo+ID4gPgo+ID4gPiA4MDkyMTYyMzM1NTUgKCJzZWxmdGVzdHMv
aGFybmVzczogcmVtb3ZlIHVzZSBvZiBMSU5FX01BWCIpIGludHJvZHVjZWQKPiA+ID4gYXNwcmlu
dGYgaW50byBrc2VsZnRlc3RfaGFybmVzcy5oLCB3aGljaCBpcyBhIEdOVSBleHRlbnNpb24gYW5k
IG5lZWRzCj4gPgo+ID4gRWFzaWVyIHNvbHV0aW9uIHRvIGRlZmluZSBMSU5FX01BWCBsb2NhbGx5
LiBJbiBnZXJlbmFsIGl0IGlzIGFkdmlzYWJsZQo+ID4gdG8gbm90IGFkZCBsb2NhbCBkZWZpbmVz
LCBidXQgaXQgaXMgZGVzaXJhYmxlIGluIHNvbWUgY2FzZXMgdG8gYXZvaWQKPiA+IGNodXJuIGxp
a2UgdGhpcyBvbmUuCj4KPiBXaWxsIHRoZSBwYXRjaCB0aGF0IEFuZHJldyBhcHBsaWVkOgo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDUxOTIxMzczMy4yQUU4MUMzMjc4MUBzbXRw
Lmtlcm5lbC5vcmcvCj4gbWFrZSBpdHMgd2F5IHRvIExpbnVzPyBBcyB5b3Ugc2F5IHRoYXQncyBh
IG11Y2ggc2ltcGxlciBmaXguCgpSaWdodCwgdGhpcyBwYXRjaCBzZXJpZXMgbWF5IGJlIHVubmVj
ZXNzYXJ5IGFmdGVyIGFsbCwgc2luY2UgdGhlCnByb2JsZW0gaXMgZml4ZWQgYnkgdGhhdCBwYXRj
aC4KCkl0IG1pZ2h0IGJlIGJldHRlciB0byBkcm9wIHRoZSBzZXJpZXMgdW5sZXNzIGl0IGlzIGRl
c2lyYWJsZSB0bwpjZW50cmFsaXplIHRoZSBkZWNsYXJhdGlvbiBvZiBfR05VX1NPVVJDRSB0byB0
aGUgcm9vdCBNYWtlZmlsZSAvCmxpYi5tay4gIElmIHRoYXQgaXMgc3RpbGwgd2FudGVkLCBtYXli
ZSBhIG1vcmUgcGFsYXRhYmxlIGFwcHJvYWNoCndvdWxkIGJlIHRvIHN1cnJvdW5kIGV2ZXJ5IGlu
c3RhbmNlIG9mICNkZWZpbmUgX0dOVV9TT1VSQ0Ugd2l0aAojaWZuZGVmIF9HTlVfU09VUkNFIGZp
cnN0LCB0aGVuIGluZHVjZSB0aGUgY2hhbmdlIHRvIENGTEFHUyBpbiBsaWIubWsuClRoYXQgd291
bGQgcHJldmVudCBhIHBhcnRpYWwgbWVyZ2UgZnJvbSB0cmlnZ2VyaW5nIGJ1aWxkIHdhcm5pbmdz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
