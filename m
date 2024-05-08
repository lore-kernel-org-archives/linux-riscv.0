Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF3C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCOfhnNIzCF3mqbuDEERU6RU/Qsai6IbTHMdCo2r3Mc=; b=XbPfqwcYKfBdoL
	/1ksf/b0EB3KYGWy5pk9domHXl00REQWF563KfTjW4mHGW00IAcHw30ZwM/2ilN63zNlu2K0FvIHZ
	l0SjIfI3jzCDLHZ0OrOg6vQw1l0+koOAtg8GO0kWlpfP4BAtU4+LvcxQoHuzSffdnhhi2v8nFTyuV
	ilf0l3HvGIpD4Uwy31uw5xS47w3gkdbHE6SdOhYWt6k6xIy9a0F17tZfYFkgx5opyCg7TeZMl8Zad
	iPFS/nZPSR08/jC5ZJVpTPmCfes2f0g+27GX4hIj6ZQTMIVIg3WSgmFMBPqZXifWON85QigmG/QVD
	1dUvU+Yx5lUh18pYFvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fKT-0000000FApY-0Foq;
	Wed, 08 May 2024 11:19:21 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fKQ-0000000FAlK-149p
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:19:19 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-23f5a31d948so2094685fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715167152; x=1715771952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx+9Xgjt8qYgmhILpcyWB1vEDTF6K3IN0xYImBlQY5U=;
        b=GEcJxaAK4vZ2btlCF0Kg66Ar4Dl2OPQOwQ7l/PQ6kY1a9gRJkmz4DAiCzSN51z86dm
         PFAYIFnX5R8rYgW6n6WSaUTen89f9ww+hRVk2KFmq/RkVLLliV9nR+biwThtcQy7UZui
         lCKiPJZq5w/mXgBEfFTZ4G49AmPBIZIfGxkz8spERKipvJ1LeKBs3RwMwivXklBQnyxS
         5pFb+ed1tg4k6Ouae/4TLPuLST0BRUzR1FDQ+Fb9aKODnuyyQ786cdgE1otQ6Fg+9koq
         Ko/24+nTqvruu6nXH4PyX3yuKHVEcIs67cwGwZeBgZfNK75wxFlabn3Q812SV32G1L3+
         35Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167152; x=1715771952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lx+9Xgjt8qYgmhILpcyWB1vEDTF6K3IN0xYImBlQY5U=;
        b=O0vtCYrb+V+c08e31U1oPohtbTZYft5whU6mMPCIlRd6S5xcsaQoLp2fyc8eP6o32W
         yFrw32ygG/e0AiZVz9sdpYBPlHBnVw8uYlmYgLtUKIStP3SvI2Arne27SUK5wv+aCVdG
         4RAoeR7701xJ0cBGeLdvU+xZbfxNYu4SM0/ikgQ8G6+UPg1b3tHjHolsHSP6jlAIacCW
         mGvNgpDaPEaxWLGdAVJ/0V8znOkEzBmR7NUZDinv66G42q5HKK5prj7n9rrwZGVvr5gK
         zfaKN9+gGCUXsONMsl96IOYooHGOpb6ID4ktapSxJ4VdN3S8vrr5LEE332TSLiru6+zv
         Ur+g==
X-Forwarded-Encrypted: i=1; AJvYcCWVP5rWXtLv+U33L2R4yZbQ4JNxXgJM++0Z7ylQA0wHdVWteLngn6b1JSnIRr4eyEZWAw8srqcO26TB7BQwko1sPWe37rLtDLVI5QsiccUg
X-Gm-Message-State: AOJu0YxS3kRUg0BAqefnpP75YWJ7IIIG7sVkWBcnA0qQxjkF6XXuHU6u
	alD98ClA/Q3Vw3MJgG4BCDvDc5DpU+vH2o0JZbefef5NlbEMx+fjx59lvCIv6MTClIGQI6AtJHz
	dWfF9I6fD/2syuQy4LYAPds71QIzWEm76VU/2qnZjz7QcCGeMarEGxw==
X-Google-Smtp-Source: AGHT+IF3+5FujeR3kO7PsOpHF+5mMBxLYw8Z1NzywDpU6OEN5QBCAec77PNwgwaACUPo4GNnUyl3QXQ0Gu3mZ2LA98k=
X-Received: by 2002:a05:6870:c155:b0:23d:45cd:ee66 with SMTP id
 586e51a60fabf-240992d1c8bmr2486931fac.55.1715167152059; Wed, 08 May 2024
 04:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com> <20240502-herald-catty-a03eafc4e6b1@spud>
In-Reply-To: <20240502-herald-catty-a03eafc4e6b1@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 8 May 2024 19:19:01 +0800
Message-ID: <CAEEQ3wnthxGbrJ_qLnZUQ9w3E_1UWgMign5P=+rNP2p5xGm4Bg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Conor Dooley <conor@kernel.org>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com, 
	john.garry@huawei.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_041918_321092_89A10B9A 
X-CRM114-Status: GOOD (  13.41  )
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

SGkgUGFsbWVyLAoKR2VudGxlIHBpbmcuLi4KCk9uIEZyaSwgTWF5IDMsIDIwMjQgYXQgMTI6Mzfi
gK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBB
cHIgMTgsIDIwMjQgYXQgMTE6NDM6MjlBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEJl
Zm9yZSBjYWNoZWluZm8gY2FuIGJlIGJ1aWx0IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0aWFs
aXplIGxldmVsCj4gPiBhbmQgdHlwZS4gU2luY2UgUlNJQy1WIGN1cnJlbnRseSBkb2VzIG5vdCBo
YXZlIGEgcmVnaXN0ZXIgZ3JvdXAgdGhhdAo+ID4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQgYXR0
cmlidXRlcyBsaWtlIEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPiA+IGRpcmVjdGx5LCBz
byBub3cgd2Ugb2J0YWluIGNhY2hlIGxlYXZlcyBmcm9tIHRoZSBBQ1BJIFBQVFQgdGFibGUKPiA+
IChhY3BpX2dldF9jYWNoZV9pbmZvKCkpIGFuZCBzZXQgdGhlIGNhY2hlIHR5cGUgdGhyb3VnaCBz
cGxpdF9sZXZlbHMuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBKZXJlbXkgTGludG9uIDxqZXJlbXku
bGludG9uQGFybS5jb20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhv
bGxhQGFybS5jb20+Cj4gOiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4KPgo+IEknbSBub3QgYW4gQUNQSSBoZWFkLCBzbyB3aGV0aGVyIG9yIG5vdCB0
aGUgdGFibGUgaXMgdmFsaWQgb24gUklTQy1WIG9yCj4gdy9lIEkgZG8gbm90IGtub3csIGJ1dCB0
aGUgY29kZSBoZXJlIGxvb2tzIHNhbmUgdG8gbWUsIHNvCgo+IFJldmlld2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgoK
VGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
