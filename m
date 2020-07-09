Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D899CC433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 08:00:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43E32073A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 08:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W2w8Oa4w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtCT+Ofj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A43E32073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pX/dVZKZ3nyBKzazqqCW22HpqjFpLInAAHm5lfSWXs4=; b=W2w8Oa4wF7HJ6WNJKhGt5dG17
	epYJG2naEe9Uio91ClJtXNu5f3giY4d2pgt04IPcjeq6393jAaK7HAEhQAPd1CPbFpcQyqQoJWEwg
	T4enN/nQpntBajB3qkqo2XclHaP6O2G7itw4/9nqyjN+9CWtjQOk6VFYnTv4yKSG63+/XZx88oAcY
	L1fzClrkfy0QkHkTQ0RhSjLPGSqMCbti25huQNI7n0bpCsOjOgd0aFIZ+WpU9C56G6oh5ahgBUNOu
	otr6CLYyEsujBGrEK7Vjsi60Tw8TsWhiL/rnyCpYvGcaS2zEPXJ4HJwFOHnfFVmNP5UD/RlexV4LX
	pmJu/AkCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtRTF-0006pw-Iz; Thu, 09 Jul 2020 07:59:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtRTC-0006pN-VN
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 07:59:52 +0000
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2B99206C3
 for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2020 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594281590;
 bh=n8KuoxvesWiAIY+opfod/4XWjPg+flAzBwzo6WbZ1nU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZtCT+Ofj8X751NtW4t93j95+HisHO+Zg6Cayf2kjUr3HAhz7wQB5t2WMZkwMra5mX
 hOgOPsCmW1ujWjt8/3MKy7jH/DdJ6ZraVCcoovUUOJKhzwSnCmyGXZxlItqdRbnrDw
 +k+UuTbdwNDMJy+TQRgWE/r2k4cA5YSmy9Cfd3WQ=
Received: by mail-lj1-f177.google.com with SMTP id f5so1309617ljj.10
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 00:59:49 -0700 (PDT)
X-Gm-Message-State: AOAM532UVbGc0U/QOXp7LcYxPpeq8mZ2lv0KUQvRZtTxZWLPaBZP7IOO
 1NhmCrZ9J8X8ZaJVJEcdHaHre0UgaLqLSiUxx7U=
X-Google-Smtp-Source: ABdhPJyYE8JVjLzbw3nJJvf2cbSZOzBgUbCeBR8sdnHEUjqpORlM6Sa6qf1SVXghITca69v+n3jBtWTcX/1A1ezqC1A=
X-Received: by 2002:a2e:959a:: with SMTP id w26mr4755601ljh.79.1594281588092; 
 Thu, 09 Jul 2020 00:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <1594269511-13340-1-git-send-email-guoren@kernel.org>
 <5c7e9eb0-d811-2e08-87c4-12de9b869b79@ghiti.fr>
In-Reply-To: <5c7e9eb0-d811-2e08-87c4-12de9b869b79@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Jul 2020 15:59:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQnE-J25Jr=qmTqoTopOY9+kHh5ULkUOWvN5SmkZPOOAg@mail.gmail.com>
Message-ID: <CAJF2gTQnE-J25Jr=qmTqoTopOY9+kHh5ULkUOWvN5SmkZPOOAg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Enable ELF-ASLR for riscv
To: Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_035951_615697_B786CA20 
X-CRM114-Status: GOOD (  15.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Greentime Hu <green.hu@gmail.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgOSwgMjAyMCBhdCAxOjMyIFBNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGkuZnI+
IHdyb3RlOgo+Cj4gSGkgR3VvLAo+Cj4gTGUgNy85LzIwIMOgIDEyOjM4IEFNLCBndW9yZW5Aa2Vy
bmVsLm9yZyBhIMOpY3JpdCA6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPgo+ID4gTGV0IHJpc2N2IGVuYWJsZSByYW5kb21pemVzIHRoZSBzdGFjaywgaGVh
cCBhbmQgYmluYXJ5IGltYWdlcyBvZgo+ID4gRUxGIGJpbmFyaWVzLiBTZWVtcyBpdCdzIG9rIGF0
IGFsbCBhZnRlciBxZW11ICYgY2hpcCB0ZXN0IGFuZAo+ID4gdGhlcmUgaXMgbm8gZm91bmRlZCBz
aWRlIGVmZmVjdC4KPiA+Cj4gPiBTbyBqdXN0IHNpbXBseSBzZWxlY3QgQVJDSF9IQVNfRUxGX1JB
TkRPTUlaRSA6KQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUu
Y29tPgo+ID4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiA+
IENjOiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiBDYzogR3JlZW50aW1lIEh1IDxn
cmVlbi5odUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSAr
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IDkxYmZj
NmMuLmVlZDY2NDcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gQEAgLTIwLDYgKzIwLDcgQEAgY29uZmlnIFJJU0NWCj4g
PiAgICAgICBzZWxlY3QgQVJDSF9IQVNfR0lHQU5USUNfUEFHRQo+ID4gICAgICAgc2VsZWN0IEFS
Q0hfSEFTX01NSU9XQgo+ID4gICAgICAgc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCj4gPiAr
ICAgICBzZWxlY3QgQVJDSF9IQVNfRUxGX1JBTkRPTUlaRQo+ID4gICAgICAgc2VsZWN0IEFSQ0hf
SEFTX1NFVF9ESVJFQ1RfTUFQCj4gPiAgICAgICBzZWxlY3QgQVJDSF9IQVNfU0VUX01FTU9SWQo+
ID4gICAgICAgc2VsZWN0IEFSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldYIGlmIE1NVQo+ID4KPgo+
IEFjdHVhbGx5IGl0IGlzIGFscmVhZHkgdGhlIGNhc2U6IEFSQ0hfSEFTX0VMRl9SQU5ET01JWkUg
aXMgYWxyZWFkeQo+IHNlbGVjdGVkIGJ5IEFSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9M
QVlPVVQuCk9vcHMgOlAsIFRoeCBmb3IgY29ycmVjdGluZywgYWJhbmRvbiB0aGUgcGF0Y2guCgot
LSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
