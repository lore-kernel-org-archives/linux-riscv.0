Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95779C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUeKvv8XmUclUhxWkk1lg/EF1batx0CX8SWi5G97/GE=; b=VZJHCUEaHC/v3t
	WsG3EiLs4h5zEgUV+CQP2GJPPGtmUgBCc7H1iiOSBqZnNZ2ic+O3z0R7VGvaAfXVqpB0ebJvoWsha
	7di/iNIlDDCQAd5sEnyHbLKfAnWtH+6guoKlezZwh1yBon5dcjkCaYT0lC5Zvd1+qB77DsegdcO8z
	GSLw4gG30SSXjEIxZq/RvuEECvFPKms8m5Jc9dRSN85EPUDdp60ksLs2PYE1asANCDloMforPnvCg
	P2DG62G2pkVcqiKRQ2GDNrzSVHswlxXy5bkDYzrG6RgU3SO0q6Cly3H+U7V0qCwgQNvPFKTChTwA9
	NqSDGolFXP218stSN/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Z9O-0000000DG6m-3v5C;
	Thu, 02 May 2024 16:19:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Z9M-0000000DG65-1OR1
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67845CE1759;
	Thu,  2 May 2024 16:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20565C113CC;
	Thu,  2 May 2024 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714666747;
	bh=cfpd7jyzmkAweaa0hD3uTqGADQ0i4iCKVXcnU1BPD5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iznJJ4qbBWR7NpsLRpKzCXcgRKLWAZYR171nJcG3Nespiw1EWNbUbDk87RXO15exq
	 QWyNqSgjM5+PIbIa2LpqoJdaumaWvVXIKuOm+d/vOR63qEsvpXRDS/27rFY6rdrWj/
	 VO2P/mcatsHtq9y+T7efokkMSu8CdwHGDVScWM+fdNFUgE7c/hOE1xBLfdcxPfBNHr
	 oKZQtD57RNlxH4L6Sgd+61BJzHbqPKocp+1+shNYIi1ufyJg2Ght67OrjYpfqFCGUu
	 +5azFcRRYEtKDPT8nGPqgaZRWIfMctYvcVwa+TBhT7egp6kFM8Q9KciRdKnySwQe2m
	 D+1lx2W9khUxA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Pu Lehui
 <pulehui@huawei.com>
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next v2 2/2] riscv, bpf: inline
 bpf_get_smp_processor_id()
In-Reply-To: <20240430175834.33152-3-puranjay@kernel.org>
References: <20240430175834.33152-1-puranjay@kernel.org>
 <20240430175834.33152-3-puranjay@kernel.org>
Date: Thu, 02 May 2024 18:19:04 +0200
Message-ID: <87edakw5jb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_091912_572987_F5931E13 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gSW5saW5lIHRo
ZSBjYWxscyB0byBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWQoKSBpbiB0aGUgcmlzY3YgYnBmIGpp
dC4KPgo+IFJJU0NWIHNhdmVzIHRoZSBwb2ludGVyIHRvIHRoZSBDUFUncyB0YXNrX3N0cnVjdCBp
biB0aGUgVFAgKHRocmVhZAo+IHBvaW50ZXIpIHJlZ2lzdGVyLiBUaGlzIG1ha2VzIGl0IHRyaXZp
YWwgdG8gZ2V0IHRoZSBDUFUncyBwcm9jZXNzb3IgaWQuCj4gQXMgdGhyZWFkX2luZm8gaXMgdGhl
IGZpcnN0IG1lbWJlciBvZiB0YXNrX3N0cnVjdCwgd2UgY2FuIHJlYWQgdGhlCj4gcHJvY2Vzc29y
IGlkIGZyb20gVFAgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSkuCj4KPiAgICAg
ICAgICAgUklTQ1Y2NCBKSVQgb3V0cHV0IGZvciBgY2FsbCBicGZfZ2V0X3NtcF9wcm9jZXNzb3Jf
aWRgCj4gCSAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4KPiAgICAgICAgICAgICAgICAgQmVmb3JlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQWZ0ZXIKPiAgICAgICAgICAgICAgICAtLS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAg
ICAtLS0tLS0tCj4KPiAgICAgICAgICBhdWlwYyAgIHQxLDB4ODQ4YyAgICAgICAgICAgICAgICAg
IGxkICAgIGE1LDMyKHRwKQo+ICAgICAgICAgIGphbHIgICAgNjA0KHQxKQo+ICAgICAgICAgIG12
ICAgICAgYTUsYTAKPgo+IEJlbmNobWFyayB1c2luZyBbMV0gb24gUWVtdS4KPgo+IC4vYmVuY2hz
L3J1bl9iZW5jaF90cmlnZ2VyLnNoIGdsb2ItYXJyLWluYyBhcnItaW5jIGhhc2gtaW5jCj4KPiAr
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tLS0rCj4gfCAgICAgIE5hbWUgICAgIHwgICAgIEJlZm9yZSAgICAgICB8ICAgICAg
IEFmdGVyICAgICAgfCAgICUgY2hhbmdlICAgfAo+IHwtLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLXwKPiB8IGdsb2ItYXJy
LWluYyAgfCAxLjA3NyDCsSAwLjAwNk0vcyB8IDEuMzM2IMKxIDAuMDEwTS9zIHwgICArIDI0LjA0
JSAgIHwKPiB8IGFyci1pbmMgICAgICAgfCAxLjA3OCDCsSAwLjAwMk0vcyB8IDEuMzMyIMKxIDAu
MDE1TS9zIHwgICArIDIzLjU2JSAgIHwKPiB8IGhhc2gtaW5jICAgICAgfCAwLjQ5NCDCsSAwLjAw
NE0vcyB8IDAuNjUzIMKxIDAuMDAxTS9zIHwgICArIDMyLjE4JSAgIHwKPiArLS0tLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0r
Cj4KPiBOT1RFOiBUaGlzIGJlbmNobWFyayBpbmNsdWRlcyBjaGFuZ2VzIGZyb20gdGhpcyBwYXRj
aCBhbmQgdGhlIHByZXZpb3VzCj4gICAgICAgcGF0Y2ggdGhhdCBpbXBsZW1lbnRlZCB0aGUgcGVy
LWNwdSBpbnNuLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hbmFrcnlpa28vbGludXgvY29t
bWl0LzhkZWM5MDA5NzVlZgo+Cj4gU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFu
amF5QGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
