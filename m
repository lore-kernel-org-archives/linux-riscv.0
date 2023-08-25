Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE8DC3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H98GevbGQ86c9MH7fbo6YFhT8ZMe4LeASHSGvaL3rUU=; b=1CXiVLpQw0t7us
	zH/reHg4dLK/amwlpVA3aDu5QN3r5RxH9OvProOOphgwdXtPYRux8qxStc215u4svTaUvn8SGUlAB
	NgHc8o2FqsjxDmPNgrvpahHv3HJb1WXH/N1Zx9JWluyhvFxZc3908Bk9wvsM6ImbVimH4/kf43LGH
	yKXQkKvhBaAF1qIrunpdbpAlCZBVb2Vn4fcB6vzy7kmaPl6pZ8d1Ag7sAqrU7BnjC3X4rnt0TEVun
	ddr3wtUE3HB2+MxL/V5q8yZIxdV55yCN9I1TmmvTuEbm9XwA8G9ZMvGHt8eNccIlVHzkib4JJlIK3
	Je529KEkcBxDZdjQItfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRzz-004cOI-15;
	Fri, 25 Aug 2023 08:16:55 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRzv-004cNP-0s
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 08:16:53 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcda0aaf47so19805241fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 01:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692951409; x=1693556209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8qLj5FUc1HhOX88AvZf8qe/nxQqPd0JSuX7WV1LK3U=;
        b=QudLEjSJlDE45jVoEgorqd0O1/1o52LiTv+IUWE3+Q4kLt3FSYk4lFY1k/MmckslrS
         Ny8HAH25hgJLJCseBArQHnzPegrUqhZvJ9U/rFTPy1Zixp7vgoiGsqmcXhzVVhp/ohfx
         /cfIl58Kz5TRBMe4Rs3066BHLCnkeVH29hFB0GVtJgyVEIfvz8KChIaKghujCFesHEfP
         /ABdIhXP6HXT/5W5QGJRYRngC8VItUNd2HOebK7ZddhM/Vqou5SsjvTfls+9IIHzutIn
         fUMV+fvdncrSZZ6iCbFKzZoNkoQjdiNFWZkl2k3OBVoo8kaJBCnKKdmYxVCm2Uf+U4hi
         lnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951409; x=1693556209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8qLj5FUc1HhOX88AvZf8qe/nxQqPd0JSuX7WV1LK3U=;
        b=Ssi7/3aR2ElC/OSG9KbGLipeYe/3P6h65Uz/UDxBcG1s7MvbjWs1rbr7UcvaJB1h6r
         +kE4xZRR2XK1ZEyLaKQS965+e2fST75L/Qb/T9Hql4HaCcI75KGg6u1QEES+66QgJN3P
         fEPpGO8IF870cjlAcg2Sq6uoSXqOo5mhvr9VLBjpUNylnbeR3NDJDhm0av6X+BaivNBT
         +FsGqbqMiC9JXgki85kFVXIx9YSz3hFQOkp99koSdmlIyjkww3diBlvevMsCoQ4y8MFN
         VHv2Y1q7/EYP8T9nT6RLcRYOxSNBz0zlqWrLnR2rHBNelnB2XNhlFl/MufhH8WHC1k70
         LzsQ==
X-Gm-Message-State: AOJu0Yz/3gs29c0Qk/zM5fysR/nHjQTbWhCXBKGn5OEoiQF29HSqLEF7
	HSlGrnR/OC1AwdMRkU5erWzxcI6E5mr1ewmt3FQyJ9qpJMaupC6rId4=
X-Google-Smtp-Source: AGHT+IEwWMFcF3PSUNciUBFIp0EsqEp8/V+IZeJyYDTcpXHSu308bUJ5h4tVSR5Y5sRVVgNI8erohhczVg+T5VTRM04=
X-Received: by 2002:a05:651c:b94:b0:2b6:9f95:8118 with SMTP id
 bg20-20020a05651c0b9400b002b69f958118mr7640239ljb.7.1692951408422; Fri, 25
 Aug 2023 01:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230824133135.1176709-1-puranjay12@gmail.com> <ad5ef9ee-7fa7-b945-a303-2bdcdeb0e740@huawei.com>
In-Reply-To: <ad5ef9ee-7fa7-b945-a303-2bdcdeb0e740@huawei.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 25 Aug 2023 10:16:37 +0200
Message-ID: <CANk7y0gxHpes-O4z6_+qW=b-ubkbc3Lf1=rxhkSjEU6=uR27sw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/3] bpf, riscv: use BPF prog pack allocator
 in BPF JIT
To: Pu Lehui <pulehui@huawei.com>
Cc: bjorn@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yhs@fb.com, kpsingh@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_011651_329359_26EE4B1F 
X-CRM114-Status: GOOD (  33.19  )
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

T24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMTA6MDbigK9BTSBQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWkuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDIzLzgvMjQgMjE6MzEsIFB1cmFuamF5IE1vaGFu
IHdyb3RlOgo+ID4gQ2hhbmdlcyBpbiB2MSAtPiB2MjoKPiA+IDEuIEltcGxlbWVudCBhIG5ldyBm
dW5jdGlvbiBwYXRjaF90ZXh0X3NldF9ub3N5bmMoKSB0byBiZSB1c2VkIGluIGJwZl9hcmNoX3Rl
eHRfaW52YWxpZGF0ZSgpLgo+ID4gICAgIFRoZSBpbXBsZW1lbnRhdGlvbiBpbiB2MSBjYWxsZWQg
cGF0Y2hfdGV4dF9ub3N5bmMoKSBpbiBhIGxvb3AgYW5kIGl0IHdhcyBiYWQgYXMgaXQgd291bGQK
PiA+ICAgICBjYWxsIGZsdXNoX2ljYWNoZV9yYW5nZSgpIGZvciBldmVyeSB3b3JkIG1ha2luZyBp
dCByZWFsbHkgc2xvdy4gVGhpcyB3YXMgZm91bmQgYnkgcnVubmluZwo+ID4gICAgIHRoZSB0ZXN0
X3RhZyBzZWxmdGVzdCB3aGljaCB3b3VsZCB0YWtlIGZvcmV2ZXIgdG8gY29tcGxldGUuCj4gPgo+
ID4gSGVyZSBpcyBzb21lIGRhdGEgdG8gcHJvdmUgdGhlIFYyIGZpeGVzIHRoZSBwcm9ibGVtOgo+
ID4KPiA+IFdpdGhvdXQgdGhpcyBzZXJpZXM6Cj4gPiByb290QHJ2LXNlbGZ0ZXN0ZXI6fi9zcmMv
a3NlbGZ0ZXN0L2JwZiMgdGltZSAuL3Rlc3RfdGFnCj4gPiB0ZXN0X3RhZzogT0sgKDQwOTQ1IHRl
c3RzKQo+ID4KPiA+IHJlYWwgICAgN200Ny41NjJzCj4gPiB1c2VyICAgIDBtMjQuMTQ1cwo+ID4g
c3lzICAgICA2bTM3LjA2NHMKPiA+Cj4gPiBXaXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQ6Cj4gPiBy
b290QHJ2LXNlbGZ0ZXN0ZXI6fi9zcmMvc2VsZnRlc3QvYnBmIyB0aW1lIC4vdGVzdF90YWcKPiA+
IHRlc3RfdGFnOiBPSyAoNDA5NDUgdGVzdHMpCj4gPgo+ID4gcmVhbCAgICA3bTI5LjQ3MnMKPiA+
IHVzZXIgICAgMG0yNS44NjVzCj4gPiBzeXMgICAgIDZtMTguNDAxcwo+ID4KPiA+IEJQRiBwcm9n
cmFtcyBjdXJyZW50bHkgY29uc3VtZSBhIHBhZ2UgZWFjaCBvbiBSSVNDVi4gRm9yIHN5c3RlbXMg
d2l0aCBtYW55IEJQRgo+ID4gcHJvZ3JhbXMsIHRoaXMgYWRkcyBzaWduaWZpY2FudCBwcmVzc3Vy
ZSB0byBpbnN0cnVjdGlvbiBUTEIuIEhpZ2ggaVRMQiBwcmVzc3VyZQo+ID4gdXN1YWxseSBjYXVz
ZXMgc2xvdyBkb3duIGZvciB0aGUgd2hvbGUgc3lzdGVtLgo+ID4KPiA+IFNvbmcgTGl1IGludHJv
ZHVjZWQgdGhlIEJQRiBwcm9nIHBhY2sgYWxsb2NhdG9yWzFdIHRvIG1pdGlnYXRlIHRoZSBhYm92
ZSBpc3N1ZS4KPiA+IEl0IHBhY2tzIG11bHRpcGxlIEJQRiBwcm9ncmFtcyBpbnRvIGEgc2luZ2xl
IGh1Z2UgcGFnZS4gSXQgaXMgY3VycmVudGx5IG9ubHkKPiA+IGVuYWJsZWQgZm9yIHRoZSB4ODZf
NjQgQlBGIEpJVC4KPiA+Cj4gPiBJIGVuYWJsZWQgdGhpcyBhbGxvY2F0b3Igb24gdGhlIEFSTTY0
IEJQRiBKSVRbMl0uIEl0IGlzIGJlaW5nIHJldmlld2VkIG5vdy4KPiA+Cj4gPiBUaGlzIHBhdGNo
IHNlcmllcyBlbmFibGVzIHRoZSBCUEYgcHJvZyBwYWNrIGFsbG9jYXRvciBmb3IgdGhlIFJJU0NW
IEJQRiBKSVQuCj4gPiBUaGlzIHNlcmllcyBuZWVkcyBhIHBhdGNoWzNdIGZyb20gdGhlIEFSTTY0
IHNlcmllcyB0byB3b3JrLgo+Cj4gSXMgdGhlcmUgYSBuZXcgdmVyc2lvbiBmb3IgYXJtNjQgY3Vy
cmVudGx5PyBNYXliZSB3ZSBjb3VsZCBzdWJtaXQgdGhpcwo+IHBhdGNoIGZpcnN0IGFzIGEgc2Vw
YXJhdGUgcGF0Y2ggdG8gYXZvaWQgZGVwZW5kZW5jaWVzLgoKT2theSwgSSB3aWxsIHNlbmQgdGhh
dCBwYXRjaCBhcyBhIHNlcGFyYXRlIHBhdGNoIGJlY2F1c2UgaXQgaXMgbmVlZGVkIGZvciBhbGwK
YXJjaGl0ZWN0dXJlcy4KCj4KPiA+Cj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPiA+IFBlcmZvcm1hbmNlIEFuYWx5c2lzIG9mIHByb2cg
cGFjayBhbGxvY2F0b3Igb24gUklTQ1Y2NAo+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPgo+ID4gVGVzdCBzZXR1cDoKPiA+ID09PT09
PT09PT09Cj4gPgo+ID4gSG9zdCBtYWNoaW5lOiBEZWJpYW4gR05VL0xpbnV4IDExIChidWxsc2V5
ZSkKPiA+IFFlbXUgVmVyc2lvbjogUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDguMC4zIChEZWJpYW4g
MTo4LjAuMytkZnNnLTEpCj4gPiB1LWJvb3QtcWVtdSBWZXJzaW9uOiAyMDIzLjA3K2Rmc2ctMQo+
ID4gb3BlbnNiaSBWZXJzaW9uOiAxLjMtMQo+ID4KPiA+IFRvIHRlc3QgdGhlIHBlcmZvcm1hbmNl
IG9mIHRoZSBCUEYgcHJvZyBwYWNrIGFsbG9jYXRvciBvbiBSViwgYSBzdHJlc3Nlcgo+ID4gdG9v
bFs0XSBsaW5rZWQgYmVsb3cgd2FzIGJ1aWx0LiBUaGlzIHRvb2wgbG9hZHMgOCBCUEYgcHJvZ3Jh
bXMgb24gdGhlIHN5c3RlbSBhbmQKPiA+IHRyaWdnZXJzIDUgb2YgdGhlbSBpbiBhbiBpbmZpbml0
ZSBsb29wIGJ5IGRvaW5nIHN5c3RlbSBjYWxscy4KPiA+Cj4gPiBUaGUgcnVubmVyIHNjcmlwdCBz
dGFydHMgMjAgaW5zdGFuY2VzIG9mIHRoZSBhYm92ZSB3aGljaCBsb2FkcyA4KjIwPTE2MCBCUEYK
PiA+IHByb2dyYW1zIG9uIHRoZSBzeXN0ZW0sIDUqMjA9MTAwIG9mIHdoaWNoIGFyZSBiZWluZyBj
b25zdGFudGx5IHRyaWdnZXJlZC4KPiA+IFRoZSBzY3JpcHQgaXMgcGFzc2VkIGEgY29tbWFuZCB3
aGljaCB3b3VsZCBiZSBydW4gaW4gdGhlIGFib3ZlIGVudmlyb25tZW50Lgo+ID4KPiA+IFRoZSBz
Y3JpcHQgd2FzIHJ1biB3aXRoIGZvbGxvd2luZyBwZXJmIGNvbW1hbmQ6Cj4gPiAuL3J1bi5zaCAi
cGVyZiBzdGF0IC1hIFwKPiA+ICAgICAgICAgIC1lIGlUTEItbG9hZC1taXNzZXMgXAo+ID4gICAg
ICAgICAgLWUgZFRMQi1sb2FkLW1pc3NlcyAgXAo+ID4gICAgICAgICAgLWUgZFRMQi1zdG9yZS1t
aXNzZXMgXAo+ID4gICAgICAgICAgLWUgaW5zdHJ1Y3Rpb25zIFwKPiA+ICAgICAgICAgIC0tdGlt
ZW91dCA2MDAwMCIKPiA+Cj4gPiBUaGUgb3V0cHV0IG9mIHRoZSBhYm92ZSBjb21tYW5kIGlzIGRp
c2N1c3NlZCBiZWxvdyBiZWZvcmUgYW5kIGFmdGVyIGVuYWJsaW5nIHRoZQo+ID4gQlBGIHByb2cg
cGFjayBhbGxvY2F0b3IuCj4gPgo+ID4gVGhlIHRlc3RzIHdlcmUgcnVuIG9uIHFlbXUtc3lzdGVt
LXJpc2N2NjQgd2l0aCA4IGNwdXMsIDE2RyBtZW1vcnkuIFRoZSByb290ZnMKPiA+IHdhcyBjcmVh
dGVkIHVzaW5nIEJqb3JuJ3MgcmlzY3YtY3Jvc3MtYnVpbGRlcls1XSBkb2NrZXIgY29udGFpbmVy
IGxpbmtlZCBiZWxvdy4KPiA+Cj4gPiBSZXN1bHRzCj4gPiA9PT09PT09Cj4gPgo+ID4gQmVmb3Jl
IGVuYWJsaW5nIHByb2cgcGFjayBhbGxvY2F0b3I6Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lz
dGVtIHdpZGUnOgo+ID4KPiA+ICAgICAgICAgICAgIDQ5MzkwNDggICAgICBpVExCLWxvYWQtbWlz
c2VzCj4gPiAgICAgICAgICAgICA1NDY4Njg5ICAgICAgZFRMQi1sb2FkLW1pc3Nlcwo+ID4gICAg
ICAgICAgICAgIDQ2NTIzNCAgICAgIGRUTEItc3RvcmUtbWlzc2VzCj4gPiAgICAgICAxNDQxMDgy
MDk3OTk4ICAgICAgaW5zdHJ1Y3Rpb25zCj4gPgo+ID4gICAgICAgIDYwLjA0NTc5MTIwMCBzZWNv
bmRzIHRpbWUgZWxhcHNlZAo+ID4KPiA+IEFmdGVyIGVuYWJsaW5nIHByb2cgcGFjayBhbGxvY2F0
b3I6Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4KPiA+IFBlcmZv
cm1hbmNlIGNvdW50ZXIgc3RhdHMgZm9yICdzeXN0ZW0gd2lkZSc6Cj4gPgo+ID4gICAgICAgICAg
ICAgMzQzMDAzNSAgICAgIGlUTEItbG9hZC1taXNzZXMKPiA+ICAgICAgICAgICAgIDUwMDg3NDUg
ICAgICBkVExCLWxvYWQtbWlzc2VzCj4gPiAgICAgICAgICAgICAgNDA5OTQ0ICAgICAgZFRMQi1z
dG9yZS1taXNzZXMKPiA+ICAgICAgIDE0NDE1MzU2Mzc5ODggICAgICBpbnN0cnVjdGlvbnMKPiA+
Cj4gPiAgICAgICAgNjAuMDQ2Mjk2NjAwIHNlY29uZHMgdGltZSBlbGFwc2VkCj4gPgo+ID4gSW1w
cm92ZW1lbnRzIGluIG1ldHJpY3MKPiA+ID09PT09PT09PT09PT09PT09PT09PT09Cj4gPgo+ID4g
SXQgd2FzIGV4cGVjdGVkIHRoYXQgdGhlIGlUTEItbG9hZC1taXNzZXMgd291bGQgZGVjcmVhc2Ug
YXMgbm93IGEgc2luZ2xlIGh1Z2UKPiA+IHBhZ2UgaXMgdXNlZCB0byBrZWVwIGFsbCB0aGUgQlBG
IHByb2dyYW1zIGNvbXBhcmVkIHRvIGEgc2luZ2xlIHBhZ2UgZm9yIGVhY2gKPiA+IHByb2dyYW0g
ZWFybGllci4KPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gVGhlIGltcHJvdmVtZW50IGluIGlUTEItbG9hZC1taXNzZXM6IC0zMC41ICUKPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPgo+ID4gSSBy
ZXBlYXRlZCB0aGlzIGV4cHJpbWVudCBtb3JlIHRoYW4gMTAwIHRpbWVzIGluIGRpZmZlcmVudCBz
ZXR1cHMgYW5kIHRoZQo+ID4gaW1wcm92ZW1lbnQgd2FzIGFsd2F5cyBncmVhdGVyIHRoYW4gMzAl
Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGJvb3QgdGVzdGVkIG9uIHRoZSBTdGFyZml2
ZSBWaXNpb25GaXZlIDIgYm9hcmRbNl0uCj4gPiBUaGUgcGVyZm9ybWFuY2UgYW5hbHlzaXMgd2Fz
IG5vdCBkb25lIG9uIHRoZSBib2FyZCBiZWNhdXNlIGl0IGRvZXNuJ3QKPiA+IGV4cG9zZSBpVExC
LWxvYWQtbWlzc2VzLCBldGMuIFRoZSBzdHJlc3NlciBwcm9ncmFtIHdhcyBydW4gb24gdGhlIGJv
YXJkIHRvIHRlc3QKPiA+IHRoZSBsb2FkaW5nIGFuZCB1bmxvYWRpbmcgb2YgQlBGIHByb2dyYW1z
Cj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDIyMDIwNDE4NTc0Mi4y
NzEwMzAtMS1zb25nQGtlcm5lbC5vcmcvCj4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjMwNjI2MDg1ODExLjMxOTI0MDItMS1wdXJhbmpheTEyQGdtYWlsLmNvbS8KPiA+IFsz
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA2MjYwODU4MTEuMzE5MjQwMi0yLXB1
cmFuamF5MTJAZ21haWwuY29tLwo+ID4gWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9wdXJhbmpheW1v
aGFuL0JQRi1BbGxvY2F0b3ItQmVuY2gKPiA+IFs1XSBodHRwczovL2dpdGh1Yi5jb20vYmpvdG8v
cmlzY3YtY3Jvc3MtYnVpbGRlcgo+ID4gWzZdIGh0dHBzOi8vd3d3LnN0YXJmaXZldGVjaC5jb20v
ZW4vc2l0ZS9ib2FyZHMKPiA+Cj4gPiBQdXJhbmpheSBNb2hhbiAoMyk6Cj4gPiAgICByaXNjdjog
ZXh0ZW5kIHBhdGNoX3RleHRfbm9zeW5jKCkgZm9yIG11bHRpcGxlIHBhZ2VzCj4gPiAgICByaXNj
djogaW1wbGVtZW50IGEgbWVtc2V0IGxpa2UgZnVuY3Rpb24gZm9yIHRleHQKPiA+ICAgIGJwZiwg
cmlzY3Y6IHVzZSBwcm9nIHBhY2sgYWxsb2NhdG9yIGluIHRoZSBCUEYgSklUCj4gPgo+ID4gICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhdGNoLmggIHwgICAxICsKPiA+ICAgYXJjaC9yaXNjdi9r
ZXJuZWwvcGF0Y2guYyAgICAgICB8IDExMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LQo+ID4gICBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggICAgICAgIHwgICAzICsKPiA+ICAgYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8ICA1NiArKysrKysrKysrKysrLS0tCj4gPiAg
IGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jICAgfCAxMTMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0KPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyNTUgaW5zZXJ0aW9ucygrKSwg
MzEgZGVsZXRpb25zKC0pCj4gPgoKCgotLSAKVGhhbmtzIGFuZCBSZWdhcmRzCgpZb3VycyBUcnVs
eSwKClB1cmFuamF5IE1vaGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
