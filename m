Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07627C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fl5v1hMM6FL3JpAZqWNHhkPrqerdqrOd/N9gsLJuGgc=; b=Yk9PhUcfmfXUnw
	Nzj8hqYlAXlQAJDD79B612wcwTUoJEdd9zPzARe7viWRmNHGpdtMTmNVgk0TgSjNmCTHTE2rHxYIV
	Vi8wL4w7dVBLkK5XnhsWWd4cZr+UQhJ7B7WqiNxLNEU5gt2El9p/n9obj+tAOKvYErPR8QwY2R882
	Ue4neBm9bPE5zrJF2zJMe3nUkn2XsZDf9cQcKMXTuRRF8xiaqPFjfzI7ILU4AYYZ5X1xWalBHlQPp
	/KSTJMOgwOEoU0k/TvDaWKgHOdqsHPQSBUyUReyf5uHuYvnv7kdD/ODIS5BVXDAHC177CUI05/dst
	BzDzH8gLfTyQxEGa2+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8fh-0028M4-1V;
	Fri, 17 Mar 2023 11:54:57 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8fe-0028L7-1N
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:54:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id eh3so19244821edb.11
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679054090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZfMRNa8FGIfSyoZfd7pNoeUbhvxMUZ3twk8JQtru4g=;
        b=qp5ET6DrTIyWL2fuyhLZ6S8luibcTZS89HQWeG5N2nlLMokpiCK5elK1fWS/l1+0sy
         NgIwpXLPGXTDamDiuGsVafQ2EICWkyuGx0C62fEmLHpjgdQ5vr4uT+Py2ey5Ys9zlHFK
         7vw7SqmFdKcGaoHTkCa1MqJ4fAgNUa+CV3m7VkTwYtLn0mKYnK1z8e4+n2HBxIkvdIr6
         iQxZ5SLshxHhfAmUvlqzqtLkWGOeEnsk7lmWBGwHiPl5SySQPiCvo44IdY0fEvAUogqk
         MMpXtucluoRl6/JDJiF8JR07lN9hm/tv1myRRWErQwqboe3onHVDKNqH+3W8MpYi9ZYd
         nsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZfMRNa8FGIfSyoZfd7pNoeUbhvxMUZ3twk8JQtru4g=;
        b=f9DY4gdqIrz4CEB5eZZJRgF8CRhoOc9f74q5M4Rkxi1Rqp2y9vXxNoDodMslKpqBET
         Bh1y/BhNgINX1dqWS3mHF98Ox6VWLEVjxyjf+GV/7bfArqeH3iwpwY0MST/RBxrzpvOe
         Gfv6olKcWrroOPSVnfLbzP2oCQVoxJ6ISJ9u1JtWDecXpljRaE2cwMQT1Yjtb1t5JJ3v
         hHrh6b0OQc6YrHjJfzrqtqtBIyNX11sUlPdrWJ1dTVq4hrZO5iFji1suAKpSvGx64Zqh
         9KYdoCpkqvj9FfYuoQTlV8lj3zaIIy9QR8hJEP0hg1OLWJGZ+SOhEOFSIwFLHOPP8UoE
         xsyg==
X-Gm-Message-State: AO0yUKW1NNugXC31IFzv60JzPkiISx/XFy7gzenB75di9R+1P63AiXGK
	jQZEP1tDkXd4K9MQ1tvQ3SrZ41YbKNeP20r19/kuUw==
X-Google-Smtp-Source: AK7set9r1yJmif39um2UY6hYIh0CxgK4zk2KfkaIEQg56O8rtyFHNyMFbFX4EJuK0xaPwNEjtviX3o54r8Yp668IyEg=
X-Received: by 2002:a17:906:9b94:b0:931:8502:ad29 with SMTP id
 dd20-20020a1709069b9400b009318502ad29mr1578620ejc.13.1679054089719; Fri, 17
 Mar 2023 04:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230317113538.10878-1-andy.chiu@sifive.com> <20230317113538.10878-18-andy.chiu@sifive.com>
In-Reply-To: <20230317113538.10878-18-andy.chiu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Mar 2023 17:24:37 +0530
Message-ID: <CAAhSdy2yFkxpM3CyCvXcbUwDeMnF3BDRVt28fSuTwAkDUThT0A@mail.gmail.com>
Subject: Re: [PATCH -next v15 17/19] riscv: kvm: Add V extension to KVM ISA
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, vineetg@rivosinc.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_045454_502628_3854D471 
X-CRM114-Status: GOOD (  12.34  )
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

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgNTowOOKAr1BNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lm
aXZlLmNvbT4KPgo+IEFkZCBWIGV4dGVuc2lvbiB0byBLVk0gaXNhIGV4dGVuc2lvbiBsaXN0IHRv
IGVuYWJsZSBzdXBwb3J0aW5nIG9mIFYKPiBleHRlbnNpb24gb24gVkNQVXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkxvb2tzIGdvb2QgdG8gbWUu
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAxICsKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdS5jICAgICAgICAgICAgIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggOTJhZjZmM2YwNTdj
Li4zZTNkZTdkNDg2ZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAgLTEw
NSw2ICsxMDUsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiAgICAgICAgIEtWTV9S
SVNDVl9JU0FfRVhUX1NWSU5WQUwsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlRQ
QVVTRSwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0JPTSwKPiArICAgICAgIEtWTV9S
SVNDVl9JU0FfRVhUX1YsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCj4gIH07Cj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jCj4gaW5kZXggN2QwMTBiMGJlNTRlLi5hN2RkYjdjZjgxM2UgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTU3
LDYgKzU3LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10g
PSB7Cj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfSF0gPSBSSVNDVl9JU0FfRVhUX2gsCj4g
ICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfSV0gPSBSSVNDVl9JU0FfRVhUX2ksCj4gICAgICAg
ICBbS1ZNX1JJU0NWX0lTQV9FWFRfTV0gPSBSSVNDVl9JU0FfRVhUX20sCj4gKyAgICAgICBbS1ZN
X1JJU0NWX0lTQV9FWFRfVl0gPSBSSVNDVl9JU0FfRVhUX3YsCj4KPiAgICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihTU1RDKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVklOVkFMKSwKPiAtLQo+
IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
