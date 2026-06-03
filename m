Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B50CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h70h07xItzH4v5wueJSVL47Mlke8rWLaPx7chTNJU8w=; b=h36BYXBWO01uol
	sMOIPtejLaEyCcmrHd6Ud70T4lBmCM+T6eZLNQ8S1LTk7KxpDlLyjt/72NAWSuvdU4gu+usDUE+rM
	DvnlGCl0qVdSMIQ9EVeXHhk+u90jEtEAjIgB2i56oyJLukCrMwATVkBo2Q/QqJD1g7V8i94wnlfxR
	RlZPqa5ASjE+KWJtnzhopPXGFUVfeqICPSfTsz8kUVtDgP0XPRiurXThiODP6XJmpLSwfaZP3dlgd
	gmrW0PUn6xzuB70lR5JrsO3/lzLTbWRyHFjiMVEV3tGDyQHgQZMulROvj/TWdTf8pCxlB4uoh1nC6
	82kMoh4XYR/BDwkxqffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgZ0-0000000EXK8-2038;
	Wed, 03 Jun 2026 08:02:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgYx-0000000EXJF-3uNd
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:02:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so3345416a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780473775; x=1781078575; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MuF+yWJKjzDQs0kKZtPPTCGk9WmA5u/lg0Mr9iL+po=;
        b=qx0L3e/ksbu0dkw/rsdap1sDAAcMmmOiysHuTsAfw7S+0NyROdbINYmRVAcrcx4TJ4
         0TZWbQjp4ZENSlbqH0zd8aj36YZgEQCADEje9AH3l4eq16cvmbXFher7RzwOkZ/119uo
         FM9if6CeY8nhQS/iPP+0RKBHFOgAOPuTUV0JuI3G4XQAPaCR6ImzghgEFw9NJj2Y5UFl
         fWkkmH4HTBK05n3RIWPGo2pshQyGz6ALU+29R1DO6dIia+I2OEO49JzAlTky0QHhOrpz
         DERFP2K/qW03FyT46F+i6oJ63XOLXObnlvsL66F0VAkFdIcR9zl4J0bJqePHY3YJIoat
         uZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473775; x=1781078575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MuF+yWJKjzDQs0kKZtPPTCGk9WmA5u/lg0Mr9iL+po=;
        b=XU250wbmw5jCsIpBYP6o+ji6A5dujm6CObbxivsmJSToMBEypWKL7pCSMuLZWML9QN
         gNO3squympMnU4fcrDwSzMnYPmGbAjtLdRSwkfzF+aCCZl5eWdZItZsYgIEX17egErv1
         +UHGi0jbxUer+yzJ9bvBCJJFh5UiRz6Q6z9hZy7hzxhB+1ZLBKTStcsAE6rbeP5da8eh
         Um9iWSPq1/DvLXuwuOyEJekDdlxqqODAetvASSW7Ts8UpIcbbOGePdJ3beVS95a32tUi
         wwB924yfouTQ1EXOqQBtzPy00eQFM5gGZEFb/pCTvjUCQDYQ+IPZN4c3drE4vmu89l9L
         DdTg==
X-Forwarded-Encrypted: i=1; AFNElJ99zTBw6drjUjN7N0pqcxZiUMbWzifpprcn+5xRnu3o6okeWd9np+N/uSzGNIabw7JhF0klEfOk/v6vUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqu4BG2k7KvTU5hgCJz5liIFPUcmtJXNLERa44z/NogfBn2Vvy
	7suyTjsy/V3Q0hi8nPDFXt/v5lszDWZcjFt/CPWDbOPiN601RQhKQrtS
X-Gm-Gg: Acq92OG+7eDw6CotoVFg1bIGgFcpKxoqIkBXSAN7+wgPDRkuuctVaS5fM9QOe1LgBUV
	bP2IKDbrwMRI5DIi8F02fWj4b9d88+IFzWPJMBYBFcdORg7CgA/3+6ee1ekeX+Tlvd1iJZVVD44
	dxGzv9WjaogAQO9U32+iz80/wW0zHkN3kqks5ACCFY/RLySu9J+4iRJTx8xQ+DOEhp5GWOeJEGH
	ij5zpLgbEBJXNLAMNvgbQrlCInYE5fXh8m6l/NOgYcnXWglTmpVvFCTG9xo1Oq4a8LseE48fRDs
	Jgca2R1XpSIpJT1VnyNmAgm2ka4Z1XAF1Sf6IXjGjFJ2SjIgUAzhVR7zaXKfiAT6yHvJo1UpvB0
	v8oLjxZdOW7aZAdlBUIojdiXKio5mK2OIBflnbKo9ji5Mz2NiVOujQBoYPnS2klgXPh//MVdoJC
	DbURXmApAgKCBGxat25AolWXb+RDMljjsSTg==
X-Received: by 2002:a17:90b:5610:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-36e30d1c00fmr2269817a91.8.1780473774886;
        Wed, 03 Jun 2026 01:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd98797fesm5144475a91.13.2026.06.03.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:02:54 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:02:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for
 Guest/VM
Message-ID: <ah_fkXOLpNHvnmNM@inochi.infowork>
References: <20260601084336.2601675-1-inochiama@gmail.com>
 <20260601084336.2601675-5-inochiama@gmail.com>
 <ah1pgb4S-UoSWhC_@inochi.infowork>
 <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_010255_993793_DB3E4D23 
X-CRM114-Status: GOOD (  16.52  )
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

T24gV2VkLCBKdW4gMDMsIDIwMjYgYXQgMDE6MTY6MTRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIEp1biAxLCAyMDI2IGF0IDQ6NDbigK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1biAwMSwgMjAyNiBhdCAw
NDo0MzozMlBNICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiBFeHRlbmQgdGhlIEtW
TSBJU0EgZXh0ZW5zaW9uIGFycmF5IHRvIGFsbG93IEtWTSB1c2Vyc3BhY2UgdG8KPiA+ID4gZGV0
ZWN0IGFuZCBlbmFibGUgWmljZmlzcy9aaWNmaWxwIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+
ID4gPgo+ID4gPiBBc3Npc3RlZC1ieTogWXVhblNoZW5nOmNsYXVkZS00Ljctb3B1cwo+ID4gPiBD
by1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiArKwo+ID4gPiAgYXJj
aC9yaXNjdi9rdm0vaXNhLmMgICAgICAgICAgICAgIHwgMiArKwo+ID4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4KPiA+Cj4gPiBJIGhhdmUgZm9yZ290IHRvIGFkZCBD
U1JfU1NQIHRvIHRoZSBjb250ZXh0LCB3aWxsIGFkZCBpbiB0aGUgbmV4dAo+ID4gdmVyc2lvbi4g
QnV0IEkgaGF2ZSBhIHNtYWxsIHF1ZXN0aW9uIGZvciBpdDogY291bGQgSSByZXVzZSB0aGUKPiA+
IGdlbmVyaWMgc3VidHlwZSBvciB1c2UgYSBuZXcgQ1NSIHN1YnR5cGU/Cj4gPgo+IAo+IEFkZCBh
bm90aGVyIENTUiBzdWJ0eXBlIGZvciBaaWNmaXNzLgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKVGhh
bmtzLCBJIHdpbGwgZG8gaXQuCgpSZWdhcmRzLApJbm9jaGkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
