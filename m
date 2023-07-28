Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559B3C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjZd89zO9IClSlEvxv07M6wfK9CUXVwvcPGH3UJeH4U=; b=Df327kZ8Kt/CHZ
	A5d+FsKjphOBhf6i50D4UF8nY/BlSPyckceFWRg9QzpIuH0gjAdcNpVrc0omOxkSgIYBJrVga31DB
	RdWElmOyTA1sd5fLQdO/bmK0OBrh6SxRvIeiygrrLi8BKJhdh12sLi7plBRA3cBoXbsNxuH8jhbZD
	qHxNDda1i/0wqTOlsry6AkKMYH9XOK/45pEZybdIBuPQ5MGBKuqc/Jaz0Qtf2uKlsrXxBVSpZm1jm
	jJreRFF2yUdV2Tu6weYrtoULzcdDEk6uK37rxrt/AiJJRcIdRqZwYM9hDRGfjdO8aEW3Mc3bHkf67
	cyX3pOJENbcrjYf+ToIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKDa-002hoj-2e;
	Fri, 28 Jul 2023 09:57:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKDY-002hf2-1R
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:57:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdd262bb0so221424666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690538221; x=1691143021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaDqHuP1/L0EWrVmqB4LDOlJLLXlDAKqsrZaIwzPq3M=;
        b=CiZw0lQlVNebikYEyzCGQwxP6oTaockZvcNTF5lhpUssizJZ0bAA3EEuC6Tb9lcj3Y
         ULPlZJ2+qXx0oToN3wpzQyWpwzOaXu2TpcN7isx4h6mFOoTB5MWaCWIjQRo9TTzLFkCe
         GudPlPLWQwqmIzUprt5rUDEJYS8qdmq0BoTlcA4Dhf0HVqU80A9aZGkGQ6+bW6kNUewp
         hrqto0T0KRzWRPIu7GbyTh2rABfCdM6761meIXZP3jvaIk/Tw0UeMdME6VbrNMj6m5hL
         3mX/unrEmdBuN/L9rF8W7HsnwEDjbSY3BcVYkpC2IVfmpKYqW9i8cWMLMhNfe+xK6mMY
         +Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690538221; x=1691143021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaDqHuP1/L0EWrVmqB4LDOlJLLXlDAKqsrZaIwzPq3M=;
        b=B63z6t86qdy88t5j8K7sG2nZ7Tc3Of8U+Sk8oNQRXJSumFTwrU2vvqYsFzRZEM/t+Z
         Dib5Nsldks35SgHEd4KpMWd7vfA/7Cwiipn8NDqOtljCg1TNugywyK4y253idfUhSiRf
         1zsNyX9eHHnCcVI8/jv0vKHJjB9n0t0muarqD461SVN8O65OoFlWodQ9X0u7ULXmqtqp
         GjxFJ1UWRq1modbe4JDQBfB8vdTuMXf9R8B1cX/7Tw3/jaP26RLx8sOReWqNHXkNC2R9
         HvVwqll+vrd13revjqo4YE33+zEx2IH0se2xnyDtJW4Kw8nBKrwus43Q+5NLAryWH0EF
         FCyQ==
X-Gm-Message-State: ABy/qLbRdLzbsj1UlCjbMNnAF7B4nZhYUExEvWpG6BHpv3agpB2tgm+V
	oRwmJxFWZRD9sE2IXNs+GYfJHg==
X-Google-Smtp-Source: APBJJlHqWfBWRzK8qa3KtWSlfnaMwOND59ErRJQPppTu7WEQ5KiBxDjr8woTjRI48lVKdKnl5PO0Vw==
X-Received: by 2002:a17:906:9bf1:b0:99b:c952:309b with SMTP id de49-20020a1709069bf100b0099bc952309bmr1700096ejc.55.1690538221588;
        Fri, 28 Jul 2023 02:57:01 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id qk29-20020a170906d9dd00b0099b42c90830sm1866923ejb.36.2023.07.28.02.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:57:01 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:57:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
Message-ID: <20230728-5b0f530eba70ad08e8f4a67d@orel>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <ZMKI8RknjjZBOaxf@google.com>
 <CAJve8o=GZnLLedT7TvCLvgd5Z3ZxJNfM6gG03Eyc+7krtMY--g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8o=GZnLLedT7TvCLvgd5Z3ZxJNfM6gG03Eyc+7krtMY--g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_025704_487544_65FBE67B 
X-CRM114-Status: GOOD (  18.85  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMDk6Mzc6MzZBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMTE6MTTigK9QTSBTZWFuIENocmlzdG9waGVyc29u
IDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBKdWwgMjcsIDIwMjMs
IEhhaWJvIFh1IHdyb3RlOgo+ID4gPiBUaGUgc3N0Y190aW1lciBzZWxmdGVzdCBpcyB1c2VkIHRv
IHZhbGlkYXRlIFNzdGMgdGltZXIgZnVuY3Rpb25hbGl0eQo+ID4gPiBpbiBhIGd1ZXN0LCB3aGlj
aCBzZXRzIHVwIHBlcmlvZGljIHRpbWVyIGludGVycnVwdHMgYW5kIGNoZWNrIHRoZQo+ID4gPiBi
YXNpYyBpbnRlcnJ1cHQgc3RhdHVzIHVwb24gaXRzIHJlY2VpcHQuCj4gPiA+Cj4gPiA+IFRoaXMg
S1ZNIHNlbGZ0ZXN0IHdhcyBwb3J0ZWQgZnJvbSBhYXJjaDY0IGFyY2hfdGltZXIgYW5kIHRlc3Rl
ZAo+ID4gPiB3aXRoIExpbnV4IHY2LjUtcmMzIG9uIGEgUWVtdSByaXNjdjY0IHZpcnQgbWFjaGlu
ZS4KPiA+Cj4gPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBleHRyYWN0IHRoZSBBUk0gYml0cyBm
cm9tIGFyY2hfdGltZXIgYW5kIG1ha2UgdGhlIGJ1bGsgb2YKPiA+IHRoZSB0ZXN0IGNvbW1vbiB0
byBBUk0gYW5kIFJJU0MtVj8gIEF0IGEgZ2xhbmNlLCB0aGVyZSBpcyBxdWl0ZSBhIGJpdCBvZiBj
b3B5K3Bhc3RlLgo+IAo+IFN1cmUsIEkgd2lsbCBoYXZlIGEgdHJ5IHRvIGNvbnNvbGlkYXRlIHRo
ZSBjb21tb24gY29kZSBmb3IgQVJNIGFuZCBSSVNDLVYgaW4gdjIuCj4KClllcywgYWZhaWN0LCB3
ZSBzaG91bGQgYmUgYWJsZSB0byBtYWtlIGFhcmNoNjQvYXJjaF90aW1lci5jIGFub3RoZXIgInNw
bGl0CnRlc3QiLCBsaWtlIHdlIGRpZCBmb3IgYWFyY2g2NC9nZXQtcmVnLWxpc3QuYywgYnV0IGJl
Zm9yZSB3ZSBkbyB0aGF0LCBJJ2QKbGlrZSB0byBnZXQgYW4gYWNrIGZyb20gdGhlIEFybSBtYWlu
dGFpbmVycyBvbiB0aGUgZ2V0LXJlZy1saXN0IHNwbGl0IHRvCmJlIHN1cmUgdGhhdCBhcHByb2Fj
aCBpcyBhY2NlcHRhYmxlLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
