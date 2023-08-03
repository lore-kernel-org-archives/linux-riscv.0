Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E30C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 03:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG07+y+YVWNBI36yhxC3bEvMcgmTu1T3YxfsEiG40+E=; b=UNJAuJhksHxTxg
	H5+PhEWN9c1xFVLnlaqeykTm+00ziybW15YvepPhYE1GX/Scq8LvJdLi1+KdT5JLCisasxL8nLgYx
	Knjyym4mZTpRMq/8z034Eo7Ieq8QMlpCSGv6J8xomgpkAkTOubB/ZNVLKddPfeSYoVqoJXl2zIKY0
	9QfZzgDubwAI97miLI024s4TYY3Zn1hYFWkNj3FtwFaH2T+rB5buc5K7iWdeJPlv0zFnWbAj1CGM/
	Sx14zzQTzoRD8abp5AF57f+pvJ6vXfidQOIgLckWD3wVJjI442ArNw2QFqbniiT4ghAAfCo/eCFvN
	PqCpfDlnyhWla5oLWE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qROmh-006WkB-0e;
	Thu, 03 Aug 2023 03:13:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qROmd-006WjR-2D;
	Thu, 03 Aug 2023 03:13:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3039E61BBA;
	Thu,  3 Aug 2023 03:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E38EC433C8;
	Thu,  3 Aug 2023 03:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691032430;
	bh=uSf3xwCl9efisUoSoRQolXl/7p0nzj1kHz1aHfTxnaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFvnua7i+h2fTCQnHkPAqHkhk4HR3P1ec2xaUq82RSv28DeurXfTFLyeOVT3N6t2T
	 Zi+KP8sQToelogOWDV8DtPiMR8Rqu841G+Vuso7CJTxQ98EG+AF8RqM7YpeLTlpL10
	 /4rLkdHqqROKCyrS3vD9SjL/Rxbarby8sOFZ4Z3IemhHX+8Mvn0S2m+wG5IeJaw0Qv
	 //FtbaC5/s05HRXE2/IJULu1h+H3jOspin6MkVFkt/x5ye+ArRtbSknZeUkLpjePT1
	 lnNdOodIgzRMyXO5qWmI0uFmc1vIVy5l22EvaYnDOJhFV8arl2VglqsgA+KhySREUp
	 /U9Srj+PmyrCQ==
Date: Wed, 2 Aug 2023 23:13:34 -0400
From: Guo Ren <guoren@kernel.org>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Haibo Xu <haibo1.xu@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>,
	Colton Lewis <coltonlewis@google.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vishal Annapurve <vannapurve@google.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] tools: riscv: Add header file csr.h
Message-ID: <ZMsbXk4JU/Ung7qu@gmail.com>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
 <20230728-879500f157954d849fb303ec@orel>
 <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_201351_768431_E7E2767B 
X-CRM114-Status: GOOD (  13.52  )
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

T24gV2VkLCBBdWcgMDIsIDIwMjMgYXQgMTA6MDU6MDBBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNTo0M+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0
IDAzOjIwOjA1UE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiBCb3Jyb3cgc29tZSBvZiB0
aGUgY3NyIGRlZmluaXRpb25zIGFuZCBvcGVyYXRpb25zIGZyb20ga2VybmVsJ3MKPiA+ID4gYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB0byB0b29scy8gZm9yIHJpc2N2Lgo+ID4KPiA+IFlv
dSBzaG91bGQgY29weSB0aGUgZW50aXJlIGZpbGUgdmVyYmF0aW0uCj4gPgo+IAo+IE9rLCB3aWxs
IGNvcHkgYWxsIHRoZSBkZWZpbml0aW9ucyBpbiB0aGUgb3JpZ2luYWwgY3NyLmgKV2h5IG5vdCBp
bmNsdWRlIHRoZSBvcmlnaW5hbCBvbmU/IE1haW50YWluIHRoZSBvbmUgY3NyLmggaXMgbW9yZQpj
b21mb3J0YWJsZS4KPiAKPiA+IFRoYW5rcywKPiA+IGRyZXcKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
