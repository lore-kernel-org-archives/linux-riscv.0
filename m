Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DA1C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uu15vZsHlI8T015s/JXQj+vseZple+nRawYnJMq8S00=; b=K7+uZMkIC2O3Ux
	zkuPH5Vl9R1eRrd2nHPdzfWf8OdHKrcBrdupdhzLmItqigSxiaKQyfEGv+rSc/XNFY6tz1tdG2uJa
	5SY6/5Y0z+MEDa37VopbN6RjysimVEitB3K8jJ8Ln93elF/XBZVPojTS+69Q9EVSp0QaVrojPMLkp
	PJQpEfiERht7qO0RAL2+K7eHw/6QzV8UIn7CHh7yA1tg1rHhqGx3DANt1Ou1uLR5lByfZAQFPCJNW
	eJnN+ee40+adGzXLTUoXE4hPvKMaTfUpK6Y2fnVWIhzXcDFZWCbmzdmqo4rVb5QYxVkHBQkJ5iv4Y
	4LwuCqY/dzRwtZlGpdyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSKG-00000008pzl-11s5;
	Wed, 27 Mar 2024 12:24:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSKC-00000008pxV-2iv2
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2D2A614DE
	for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 12:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E44C433C7
	for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542251;
	bh=aILctM/4IaWB0TVDutDw4QQqKI+aELVY+YewBrIQIbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lyn+UApI7G6jvuwj8RDzwBHEzsxkiild9br+8R95OBWE/hoE6C6D83/Y11m+WRbax
	 5KNcaLV6FEYOUcAvTRJBppcRwUBWDq1KWNwGDGRXartaesCMMvPxHsGEmwMvOzg9Tp
	 Tm9mTKX0Vm0TPkhTDgxVv965YljQs+jwcNsLWIeJhZUXQ5Pw9Lgk4fe/MF4509rKyH
	 brQ3hFBFhwzTjnMtGN02oY2Uotft08nHbJdKjTdqcJr+wH0n4aa23LH/LxD7zTbRX/
	 wEJycNoT6XNubPIZdTcxwZnMxYMws24voL9XGQXwb3DvEJE3HoWgPjw6riY04U0mse
	 GZqYHLV+YfcYQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56c3260a714so1684478a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 05:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd9OaZpFDb5/oQ6FRnBazraowHizZuVcZMGN3T6rKThcu4qUBFMPjYwB4ULVf7zPPM6fTceTIKaEsDr1nJnfLRAXD9kMvlft9Xzz8oPrkc
X-Gm-Message-State: AOJu0Yxv0mr45ngahhCyLLQWYwJubplmfLBN9SRdBfnESXFoUR+nyaES
	dNVIAnlR6JfF3x5xKx9QLZHi3lJGpWdyavbJQRFUpuFd7bSweyTgERK36yfBbbK9oWPsoxkCVbz
	iMIvldA11ygbczErcUC+rnyAWTdA=
X-Google-Smtp-Source: AGHT+IH5QG4gK2oTVi3ncpzY0t5JIQmgvy6v0aZwbtRBomJdCe823Y8g9QFMk8+duWZLnOUiQv1hA8IKlQ37EBfGEDU=
X-Received: by 2002:a17:906:3610:b0:a47:ae0:160 with SMTP id
 q16-20020a170906361000b00a470ae00160mr1774953ejb.73.1711542250005; Wed, 27
 Mar 2024 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240326224943.86912-1-puranjay12@gmail.com>
In-Reply-To: <20240326224943.86912-1-puranjay12@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 27 Mar 2024 13:23:58 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNgi=nB1qneuAGkpEb7GihGoegVJFVp5ZN8o-m2v3UG1yw@mail.gmail.com>
Message-ID: <CAJ+HfNgi=nB1qneuAGkpEb7GihGoegVJFVp5ZN8o-m2v3UG1yw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/2] bpf,riscv: Add support for BPF Arena
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052412_812600_3D102611 
X-CRM114-Status: GOOD (  16.22  )
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

T24gVHVlLCAyNiBNYXIgMjAyNCBhdCAyMzo0OSwgUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJA
Z21haWwuY29tPiB3cm90ZToKPgo+IENoYW5nZXMgaW4gVjMKPiBWMjogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnBmLzIwMjQwMzI1MTU1NDM0LjY1NTg5LTEtcHVyYW5qYXkxMkBnbWFpbC5jb20v
Cj4gLSBVc2UgUkVHX0RPTlRfQ0xFQVJfTUFSS0VSIGluIHBsYWNlIG9mIERPTlRfQ0xFQVIgYXMg
dGhlIG5hbWUuCj4gLSBVc2UgUlZfUkVHX1pFUk8gZm9yIHRoZSBhYm92ZSBhcyBpdCBpcyBndWFy
YW50ZWVkIHRvIGJlIG5ldmVyIHVzZWQgaW4gYXMKPiAgIGRzdC9zcmMgcmVnaXN0ZXIgaW4gQlBG
IExEWC9TVFgvU1QgaW5zdHJ1Y3Rpb25zLgo+IC0gVXNlICNkZWZpbmUgUlZfUkVHX0FSRU5BIGZv
ciBSVl9SRUdfUzcKPgo+IENoYW5nZXMgaW4gVjIKPiBWMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnBmLzIwMjQwMzIzMTU0NjUyLjU0NTcyLTEtcHVyYW5qYXkxMkBnbWFpbC5jb20vCj4gLSBV
c2VkIFM3IGluIHBsYWNlIG9mIFMxMSBmb3Igc3RvcmluZyB0aGUga2VybmVsX3ZtX3N0YXJ0Cj4g
LSBVc2VkIDE3IGluIHBsYWNlIG9mIDE2IGZvciBET05UX0NMRUFSIG1hcmtlcgo+IC0gUmVtb3Zl
IGFuIHVudXNlZCB2YXJpYWJsZQo+IC0gUmVtb3ZlZCBzb21lIG1pc2xlYWRpbmcgaW5mb3JtYXRp
b24gZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UuCj4KPiBUaGlzIHNlcmllcyBhZGRzIHRoZSBzdXBw
b3J0IGZvciBQUk9CRV9NRU0zMiBhbmQgYnBmX2FkZHJfc3BhY2VfY2FzdAo+IGluc3RydWN0aW9u
cyB0byB0aGUgUklTQ1YgQlBGIEpJVC4gVGhlc2UgdHdvIGluc3RydWN0aW9ucyBhbGxvdyB0aGUK
PiBlbmFibGVtZW50IG9mIEJQRiBBcmVuYS4KPgo+IEFsbCBhcmVuYSByZWxhdGVkIHNlbGZ0ZXN0
cyBhcmUgcGFzc2luZzoKPgo+ICAgcm9vdEBydi10ZXN0ZXI6fi9icGYjIHVuYW1lIC1wCj4gICBy
aXNjdjY0Cj4gICByb290QHJ2LXRlc3Rlcjp+L2JwZiMgLi90ZXN0X3Byb2dzIC1hICIqYXJlbmEq
Igo+ICAgIzMvMSAgICAgYXJlbmFfaHRhYi9hcmVuYV9odGFiX2xsdm06T0sKPiAgICMzLzIgICAg
IGFyZW5hX2h0YWIvYXJlbmFfaHRhYl9hc206T0sKPiAgICMzICAgICAgIGFyZW5hX2h0YWI6T0sK
PiAgICM0LzEgICAgIGFyZW5hX2xpc3QvYXJlbmFfbGlzdF8xOk9LCj4gICAjNC8yICAgICBhcmVu
YV9saXN0L2FyZW5hX2xpc3RfMTAwMDpPSwo+ICAgIzQgICAgICAgYXJlbmFfbGlzdDpPSwo+ICAg
IzQzNC8xICAgdmVyaWZpZXJfYXJlbmEvYmFzaWNfYWxsb2MxOk9LCj4gICAjNDM0LzIgICB2ZXJp
Zmllcl9hcmVuYS9iYXNpY19hbGxvYzI6T0sKPiAgICM0MzQvMyAgIHZlcmlmaWVyX2FyZW5hL2Jh
c2ljX2FsbG9jMzpPSwo+ICAgIzQzNC80ICAgdmVyaWZpZXJfYXJlbmEvaXRlcl9tYXBzMTpPSwo+
ICAgIzQzNC81ICAgdmVyaWZpZXJfYXJlbmEvaXRlcl9tYXBzMjpPSwo+ICAgIzQzNC82ICAgdmVy
aWZpZXJfYXJlbmEvaXRlcl9tYXBzMzpPSwo+ICAgIzQzNCAgICAgdmVyaWZpZXJfYXJlbmE6T0sK
PiAgIFN1bW1hcnk6IDMvMTAgUEFTU0VELCAwIFNLSVBQRUQsIDAgRkFJTEVECj4KPiBUaGlzIGZl
YXR1cmUgbmVlZHMgdGhlIGZvbGxvd2luZyB0d28gZml4ZXMgaW4gdGhlIGJwZi9icGYuZ2l0IHRv
IHdvcmsKPiBwcm9wZXJseToKPgo+IGY3ZjVkMTgwOGIxYjYgKCJicGY6IHZlcmlmaWVyOiBmaXgg
YWRkcl9zcGFjZV9jYXN0IGZyb20gYXMoMSkgdG8gYXMoMCkiKQo+IDQ0MzU3NGIwMzM4NzYgKCJy
aXNjdiwgYnBmOiBGaXgga2Z1bmMgcGFyYW1ldGVycyBpbmNvbXBhdGliaWxpdHkgYmV0d2VlbiBi
cGYgYW5kIHJpc2N2IGFiaSIpCj4KPiBUaGVyZSBpcyBhIGxvdCBvZiBjb2RlIHJlcGV0aXRpb24g
Zm9yIExEWCwgU1RYLCBhbmQgU1QuIEkgd2lsbCBiZSBzZW5kaW5nIGEKPiBmb2xsb3ctdXAgcGF0
Y2ggdG8gcmVmYWN0b3IgdGhlc2UuCgpUaGFuayB5b3UsIGFuZCBwbGVhc2UgYWRkcmVzcyBMZWh1
aSdzIHJlbWFya3MgYXMgd2VsbC4KCkZvciB0aGUgc2VyaWVzOgoKVGVzdGVkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
