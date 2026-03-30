Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D57FF4934
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXJTb4MFxfJnJ7iwjkN6azlN6J2Gwd1njOc6154jdOc=; b=0lW2jpmtiKZUOg
	WC/ZJ1DaKmuHRDa648wmV8qLQb25J0V3DZhWH0146ly4Uam5BP6t0QeKbNKgdIWHq+R7rkiiA+oWA
	RUQ8eN1orEg3OQSaDdc50apRKJICMnwi8iBWxJZuYqdyfqSU9dWM3r2XEd3+qJpfrmAkD9D55uzau
	34B4DiF44RrSOSXmBCFKuJedzvJ+6tVUxxbi+eQRlZncIXGH1T4j68lGE18j4bQ8MVgxfc6UEKDZ7
	jclhjcO6cp7aZX33lTDLDGWTInhqFzvDrJZWg/lTsqOYj2hF5bhuBCyMYwC4EGg2wj5Af3bVwYxlW
	TlGo0zC3qnJ2P88gpmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w73bS-0000000AZLr-00VQ;
	Mon, 30 Mar 2026 03:47:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w73bO-0000000AZL0-1vrq
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 03:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55F244457D
	for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 03:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FBAC2BCB4
	for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 03:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774842465;
	bh=nbn+1wU01z27PHPiB6pyjlcWzi6QRevgboBAEreZK0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Scb0MZjy9cW04DoU9XXgbCQXHVOKa8DZVHDYfIiIKz2Fqgl3FbLxeTL5wH1FsnBpY
	 bDiVv31JMHV56ZOzGCkfJIHGhtdSgwDDoOdmQZHEVQJr0OiUIlyPhAzciiHFsWHUE5
	 yOl5buCFMT8PBAhOjjBMBO9ikE5Iebn/0Ej0dSz4tPpx94aoiMHtf1yBtqO3rFwQOq
	 7F3RSd6YK57Ou0xLcJTTjr8bkmKSvHsISlzMFKdyUGKweTQfm0r1NvzqhVLExwzHGA
	 TF+qUuaMfIQSuIAcVONoEBik/na74YLUlofcP75mpWWxJS29GiNl6QhjqFIjVRgmQm
	 EvkNHCPAr+0FQ==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b949bf4easo2265759f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 20:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOr//nYdppkSwZeFfWkfK0zxmyR2XuTzKjqEQfLhTIVMOrn7+vTODcSgXd+d3Xsp1XcQfZbT2xqk14xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy/G8tOLMV4ZDpT2sSlB/BMikgz4zgBFXkhnK2LpCMIBYafpEQ
	OWo5bsrJfj7UKLTPH/9fvJ4V6AR2uzXfHovUZ+rxwCmGTmA8+HrNNoQKQoJx1sKrmdka8gdzDo6
	tXSxNyjdYMM0a2a5w5suEHxHGZavqERE=
X-Received: by 2002:a05:6000:1a8e:b0:43b:45c6:7ad with SMTP id
 ffacd0b85a97d-43b97a90decmr23305904f8f.29.1774842462488; Sun, 29 Mar 2026
 20:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260328074013.3589544-1-ruanjinjie@huawei.com> <20260328074013.3589544-6-ruanjinjie@huawei.com>
In-Reply-To: <20260328074013.3589544-6-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 Mar 2026 11:47:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQu0ekP6Emz=F3uEhPsyqNvH_PwwJU5yOADbR9poQ4noQ@mail.gmail.com>
X-Gm-Features: AQROBzBPJeJ2Q-LIGCNdFWKdGbP9VQWOujey1zE68GwImpeUgj1lBD6fgh2uH4Y
Message-ID: <CAJF2gTQu0ekP6Emz=F3uEhPsyqNvH_PwwJU5yOADbR9poQ4noQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] riscv: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	peterz@infradead.org, feng.tang@linux.alibaba.com, 
	pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	rppt@kernel.org, leitao@debian.org, ardb@kernel.org, cfsworks@gmail.com, 
	osandov@fb.com, jbohac@suse.cz, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, coxu@redhat.com, fuqiang.wang@easystack.cn, 
	liaoyuanhong@vivo.com, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_204746_547142_0590CCD5 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMzo0MeKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVu
IHRoZSBrZXhlY19sb2FkKCkgc3lzdGVtIGNhbGwKPiAoY3Jhc2gga2VybmVsIGxvYWRpbmcgcGF0
aCkgYW5kIG1lbW9yeSBob3RwbHVnIG9wZXJhdGlvbnMgdGhhdCBjYW4gbGVhZAo+IHRvIGJ1ZmZl
ciBvdmVyZmxvdyBhbmQgcG90ZW50aWFsIGtlcm5lbCBjcmFzaC4KcmlzY3YgbGVmdCBubyBtYXJn
aW4gZm9yIGhvdHBsdWcgaW4gcHJlcGFyZV9lbGZfaGVhZGVycygpLiBBY3R1YWxseSwKdGhpcyBj
aGVjayBoYXMgYmVlbiBpbiBjcmFzaF9leGNsdWRlX21lbV9yYW5nZSgpOyB0aGlzIHBhdGNoIG1h
a2VzIGl0CmhhcHBlbiBlYXJsaWVyLgoKQWx0aG91Z2ggdGhpcyBwYXRjaCBoYXMgbm8gcmVhbCBl
ZmZlY3QgZm9yIHJpc2N2IGZvciB0aGUgY3VycmVudC4gSQpzdGlsbCBnaXZlIGFuIGFja2VkLWJ5
LCBiZWNhdXNlIGl0J3MgYSBwcm9wZXIgY2hlY2sgc3RlcCBpbiB0aGlzCmNhbGxiYWNrLgoKUmV2
aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
