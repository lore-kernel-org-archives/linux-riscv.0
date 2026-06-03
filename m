Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B27CD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTmiycCNyLUVUwuMNcYlSDBYB7NDSxI5YZMT/rXZsj8=; b=QGuP8VSjeVbUzl
	w+z7pmBGglY1w0RRTxTz78oxOGkrgrty6GqzeF2QpfFAViYiSIt7JQRgOmEW4Ai6v+T0QOaLwOOm4
	8ktpPviJjH2/L1ki7JyX+AcvCYZzx84p6Coy0cRvUMcw4/IsNbfxOP6SNfg4MiBS54I3JHuydnvvS
	0DAPyHP9GvVjDkJgxzpBAvJpXtOSRt+JBpwPW2gYyXSrv0SC4zK3Ij/KAkASpvgTSa+QvwUuyIoZ1
	qswrabyaG72r6o1HHTb7/DNS3j0sIlYtQfeYVHJEbNGlKBRit9D35sMUEHRA5q6zHoDEU3pE7sWTw
	xO3x19/lilY+7zYQwgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfqh-0000000ESkY-2Got;
	Wed, 03 Jun 2026 07:17:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfqf-0000000ESkP-3qHt
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:17:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D66D6022E
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 07:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1104D1F0089F
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471029;
	bh=B9gE9LR8WZKp5FJX5lQdc0Rrvfx5JZgnmoXVQiOoRCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PAYInVB46E2dDqjJ29B2BFLzz9Gn67N2C6rxnXCE4mCy5tzp43H/Subkl0sjKINMa
	 Z94fNReCDxYcbFCWvtkj/+jeMebrXXCBJya3kkPi16BQ9xIhCXYfPb8IuBG401Gcd+
	 RdkT4/Tbmh2/H+EhCzm1nM1HLi59Jk8zzgMdciWKfI777EfwMb8VKfus3qctWQvOlj
	 iIvHpLBpS6Y8VP9YXxCxVV4eH7YLtSjqOisRCdHdHPHe6ecKsC0itUSrT4XKqRG7vO
	 Xlv2QxD3TKfoqK3zVOSRa7RC7xqXoYR6noYXtaoPf48InL7n+GmDyChtYCR8hx51Xe
	 45d0bZammIeVQ==
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5174a1d78f8so30966171cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XAZ/+5ufAEfa5oM4ECs4rUHSfvLXlDSe40zqyNIqTQOMb1pTPR+Nvhb4Pk3a4XZzlH7nNZqUOS24a+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/WVdr7agZH//gL7qSlmOM9dAPQaVP3ToROr0KqbVCA7kQEwsB
	wCJPw4mGeo1HdaI/y5ANA4Er26Y08nQvR8GEi8+J5/Wdes8W2tNnfTuGmowhU+ceiEOdz+DInrc
	X/lR1iiYsPxt5TQI1fhtk4Ctsuhstc4I=
X-Received: by 2002:a05:622a:5c14:b0:517:29b1:5433 with SMTP id
 d75a77b69052e-51778635927mr34758491cf.24.1780471028254; Wed, 03 Jun 2026
 00:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260602205847.102825-1-varunrmallya@gmail.com> <20260602205847.102825-3-varunrmallya@gmail.com>
In-Reply-To: <20260602205847.102825-3-varunrmallya@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 3 Jun 2026 09:16:56 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNgWvufshCz2CwTeJ=NyjGKVhCrkTLz_v0g+34K=5MEC1A@mail.gmail.com>
X-Gm-Features: AVHnY4JoiPpI56R-HIsCyr_W1-sI4CUWK3ue5cXpYoYT5evyAosvlghYOrHtCUw
Message-ID: <CAJ+HfNgWvufshCz2CwTeJ=NyjGKVhCrkTLz_v0g+34K=5MEC1A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf, riscv: inline bpf_get_current_task()
 and bpf_get_current_task_btf()
To: Varun R Mallya <varunrmallya@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	puranjay@kernel.org, menglong8.dong@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	pulehui@huawei.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
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

T24gVHVlLCAyIEp1biAyMDI2IGF0IDIyOjU5LCBWYXJ1biBSIE1hbGx5YSA8dmFydW5ybWFsbHlh
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBSSVNDLVYsIHRoZSBjdXJyZW50IHRhc2sgcG9pbnRl
ciBpcyBzdG9yZWQgaW4gdGhlIHRocmVhZCBwb2ludGVyCj4gcmVnaXN0ZXIgKHRwKS4gRW1pdCBh
IHNpbmdsZSBgbXYgYTUsIHRwYCBpbnN0ZWFkIG9mIGEgZnVsbCBoZWxwZXIKPiBjYWxsIGZvciBC
UEZfRlVOQ19nZXRfY3VycmVudF90YXNrIGFuZCBCUEZfRlVOQ19nZXRfY3VycmVudF90YXNrX2J0
Zi4KPgo+IFJlZ2lzdGVyIGJwZl9qaXRfaW5saW5lc19oZWxwZXJfY2FsbCgpIGVudHJpZXMgZm9y
IGJvdGggaGVscGVycyBzbyB0aGUKPiB2ZXJpZmllciB0cmVhdHMgdGhlbSBhcyBpbmxpbmVkLCBh
bmQgYWRkIHRoZSBleHBlY3RlZCBgbXYgYTUsIHRwYAo+IGFubm90YXRpb24gdG8gdGhlIHJpc2N2
NjQgc2VsZnRlc3RzLgo+Cj4gVGhlIGZvbGxvd2luZyBzaG93IGNoYW5nZXMgYmVmb3JlIGFuZCBh
ZnRlciB0aGlzIHBhdGNoLgo+Cj4gQmVmb3JlIHBhdGNoOgo+Cj4gICAgICAgYXVpcGMgIHQxLDB4
ODE3YSAgICAjIGxvYWQgdXBwZXIgUEMtcmVsYXRpdmUgYWRkcmVzcwo+ICAgICAgIGphbHIgICAt
MjAwNCh0MSkgICAgIyBjYWxsIGJwZl9nZXRfY3VycmVudF90YXNrIGhlbHBlcgo+ICAgICAgIG12
ICAgICBhNSxhMCAgICAgICAgIyBtb3ZlIHJldHVybiB2YWx1ZSB0byBCUEZfUkVHXzAKPgo+IEFm
dGVyIHBhdGNoOgo+Cj4gICAgICAgbXYgICAgIGE1LHRwICAgICAgICAjIGRpcmVjdGx5OiBhNSA9
IGN1cnJlbnQgKHRwID0gdGhyZWFkIHBvaW50ZXIpCj4KPiBCZW5jaG1hcmsgKGJwZl9wcm9nX3Rl
c3RfcnVuIHdyYXBwaW5nIGJwZl9nZXRfY3VycmVudF90YXNrIGluIGxvb3AsCj4gYmF0Y2g9MTAw
LCAxMHMsIFFFTVUgUklTQy1WKToKPgo+ICAgICAgICAgICAgICAgfCBydW5zL3NlYyAgfCBoZWxw
ZXItY2FsbHMvc2VjIHwgbnMvY2FsbAo+ICAtLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0KPiAgQmVmb3JlIHBhdGNoIHwgICAxNzMsNDkwIHwgICAg
ICAgMTcsMzQ5LDA5MCB8ICAgICAgNTcKPiAgQWZ0ZXIgcGF0Y2ggIHwgICAzMjAsNDk3IHwgICAg
ICAgMzIsMDQ5LDc4MCB8ICAgICAgMzEKPiAgLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tCj4gIEltcHJvdmVtZW50ICB8ICAgKzg0LjclICB8ICAg
ICAgICAgICs4NC43JSAgfCAgLTQ1LjYlCj4KPiBTaWduZWQtb2ZmLWJ5OiBWYXJ1biBSIE1hbGx5
YSA8dmFydW5ybWFsbHlhQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
