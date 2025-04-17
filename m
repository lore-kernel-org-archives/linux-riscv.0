Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C040FC369C7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3In49lSXHf45yrWwo+dDj8/iIyqFz8YNqTsoOKirJuk=; b=Z1svL2b2+Qowvb
	Gu3hY9vfWUok6ZgzEWitD5nvudX2iTidTxS5Q2LEYXXEEtmCsi4mIumxoNgNnv6xctXH+L+8LJgOF
	23Y4ZBRTpBptaLkGkyuuDGlz9jDnUIfv8HGnk+Oxx352cIf/rs5EqlenaqALJ7HutlN51ntUc20DL
	KEA0u1S8rUJv4Lq8jBPADsis7rJ7dvQBjG/gq/luIVmc3nDDRjR+wnmN54Y+/0YWK0zUZ4gHZB26K
	oUNxjrJDpLDfpMaSSL89DGnhfSCN+kgyUNIOTTXsQxVuexXCfyiQJ6f92E+aETkY79xmd7hLtYwMn
	+SiJfOlTYY5YfKVfkNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Lwj-0000000CWkN-05HV;
	Thu, 17 Apr 2025 09:54:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Lwg-0000000CWip-2WKt
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 09:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744883649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8frcNR3d7ivP4NC+vlhr7MJ2cYU39BpSTQEOAw1o4aU=;
	b=ID35VpLhWpwaVM1r4/KrdZ43hdh212IgE1YbxcUtmx7YmqAS2Hk0S9ZqtAC8KIV9B5D0eC
	4+5tdUXWAh0nWhidC4SFkNTfTMoiBp0o5CYeOIe+03Sw1eoFDwjFvEMVoq2q7+SBgkuCmy
	8pUtK3bpXUtZBqmNB5cpvBvp1NLmtBU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-1oOrmxinO_6jBVj3VtwmjQ-1; Thu, 17 Apr 2025 05:54:07 -0400
X-MC-Unique: 1oOrmxinO_6jBVj3VtwmjQ-1
X-Mimecast-MFC-AGG-ID: 1oOrmxinO_6jBVj3VtwmjQ_1744883646
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so4413655e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 02:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883646; x=1745488446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8frcNR3d7ivP4NC+vlhr7MJ2cYU39BpSTQEOAw1o4aU=;
        b=iMB4wdS17hewWxXl3+t1ZB93lESJoDh5R/z0IQD4ZMyQVRsWjI65JdOXRaI8hT5F1q
         iCDC/HNOt4xx+TjPLjx/8JKDhHxvRuClitZal1tAzeBOhdn+d6YP97HdlEXm/7NlpIwS
         eQaqWnnzWB73ivYeseZHAa0ZOGuivvBc9bmoab+nxbzP94m1hphmkfmqe8cXNOd6xqmJ
         JkQsUf5Mwkt4GsawPgIGVB1ZRnIDj2flTVvE5UugJZF7D26m1/cIejSzw+EWRe0dFRDl
         D662U2roIipBiVcpBByhmqeBqqQnxHRavD0RsK73oQ17a2YTN0/fPH0/ryG8sIaRxhLd
         KwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ahXKqgKLv4FNNdCSYUMMJi0NGLeWl6xT91gdytSey5KPqGph3nmkdD69Sdcrhca1sBLsqLv1hWsE6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGwoCRyjIgLHYs1J2xiU4XYp0B1jkVlZtw5ZrxLqPp2iIVxTqc
	MhZ6IF3IORzZZgHUkqQUmER529b9wyDrec445EpVcEWun6+07SKllMyIi4uzCeCW4WGEklEOjCq
	KWxcCXX9Q73fStIYDm87M+zoDGrwbGDyIVXJVlRao6kU9fUgyY9Wf0L33cFc9kwgGkQSsZAvhhI
	5h2ILvZqOz1H8+quSdYcbuVLZ10Zmw3nLdpEX3FdZl
X-Gm-Gg: ASbGncsawAdwkGOBAHkwln5iNtHzz7uuJEA+YF1zyXJ2zvuQo0sdqpVi8eBedCYYSk7
	Y9rZoU/4Ab9PbzJQRAJdT9zpqMZoiJOnJdn0s5vFZoEbOfp/pWMW9tGYpDrjbdUsIASJmLQ==
X-Received: by 2002:a05:6000:40c7:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39ee5b9ff8fmr4783303f8f.53.1744883646475;
        Thu, 17 Apr 2025 02:54:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaUAX5A8zAgw7el/T3YwRV3GZLvfWnuHeaTHfLO1ACdU3siatVem4dbx0XtRNKUnrmhQD+B5DLQ7edX2knUB0=
X-Received: by 2002:a05:6000:40c7:b0:398:fd9b:b935 with SMTP id
 ffacd0b85a97d-39ee5b9ff8fmr4783241f8f.53.1744883646039; Thu, 17 Apr 2025
 02:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250409014136.2816971-1-mlevitsk@redhat.com> <20250409014136.2816971-3-mlevitsk@redhat.com>
 <20250410081640.GX9833@noisy.programming.kicks-ass.net> <60b7607b-8ada-447d-9dcb-034d93b9abe8@redhat.com>
 <20250416185001.GA38216@noisy.programming.kicks-ass.net>
In-Reply-To: <20250416185001.GA38216@noisy.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Apr 2025 11:53:54 +0200
X-Gm-Features: ATxdqUE3EOhyuH0suu9pJLVTpoJVqiaHW5bjmzNK_nqhnV7Z7kL2fl3XehvCGu8
Message-ID: <CABgObfbH6JAh0Puu6gTKfkLd+e5uqSyHHP5i86W-=G6x5zr1wg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: x86: move sev_lock/unlock_vcpus_for_migration
 to kvm_main.c
To: Peter Zijlstra <peterz@infradead.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, kvm-riscv@lists.infradead.org, 
	Oliver Upton <oliver.upton@linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jing Zhang <jingzhangos@google.com>, Waiman Long <longman@redhat.com>, x86@kernel.org, 
	Kunkun Jiang <jiangkunkun@huawei.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>, 
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Sebastian Ott <sebott@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sean Christopherson <seanjc@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bpnxFQjWu9471b7ASj8VnPo_tD7uc_qiwt9BTPEzmjQ_1744883646
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_025410_718083_924CB0B2 
X-CRM114-Status: GOOD (  11.25  )
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

T24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgODo1MOKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiBGb3IgdGhlIEFSTSBjYXNlLCB3aGljaCBpcyB0aGUg
YWN0dWFsIGJ1Z2d5IG9uZSAoaXQgd2FzIGNvbXBsYWluaW5nCj4gPiBhYm91dCB0b28gaGlnaCBh
IGRlcHRoKSBpdCBzdGlsbCBuZWVkcyBtdXRleF90cnlsb2NrX25lc3RfbG9jaygpOwo+ID4gdGhl
IG5lc3RfbG9jayBpcyBuZWVkZWQgdG8gYXZvaWQgYnVtcGluZyB0aGUgZGVwdGggb24gZXZlcnkK
PiA+IG11dGV4X3RyeWxvY2soKS4KPgo+IEdvdCBhIGxpbmsgdG8gdGhlIEFSTSBjb2RlIGluIHF1
ZXN0aW9uID8KCmxvY2tfYWxsX3ZjcHVzKCkgaW4gYXJjaC9hcm02NC9rdm0vYXJtLmM6CgogICAg
ICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmt2bS0+bG9jayk7CiAgICAgICAga3ZtX2Zvcl9lYWNo
X3ZjcHUoYywgdG1wX3ZjcHUsIGt2bSkgewogICAgICAgICAgICAgICAgaWYgKCFtdXRleF90cnls
b2NrKCZ0bXBfdmNwdS0+bXV0ZXgpKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIHVubG9ja192
Y3B1cyhrdm0sIGMgLSAxKTsKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwog
ICAgICAgICAgICAgICAgfQogICAgICAgIH0KCj4gQW5kIEknbSBhc3N1bWluZyB5b3UncmUgdGFs
a2luZyBhYm91dCB0YXNrX3N0cnVjdDo6bG9ja2RlcF9kZXB0aCA/Cj4gVGhlIG5lc3QgbG9jayBh
bm5vdGF0aW9uIGRvZXMgbm90IGluIGZhY3QgaW5jcmVtZW50IGRlcHRoIGJleW9uZAo+IG9uZSBv
ZiBlYWNoIHR5cGUuIEl0IGRvZXMgYSByZWZjb3VudCBsaWtlIHRoaW5nLgoKWWVzLCBleGFjdGx5
IC0gbXV0ZXhfdHJ5bG9ja19uZXN0X2xvY2soKSBpcyBuZWVkZWQgc28gdGhhdCB0aGUKY29kZSBh
Ym92ZSBjb3VudHMgcGVyLWxvY2sgaW5zdGVhZCBvZiB1c2luZyB0aGUgcGVyLXRhc2sgZGVwdGgu
CgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
