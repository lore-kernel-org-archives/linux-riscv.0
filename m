Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F68C04A6A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 01:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGyOS4PJwSI7Co5pKN8+VHv32SAtD6zvWMAmz3mkuVM=; b=MZr5gN88VkvZgG
	Xc3KOz8LwgjcIsO7typUCJPnTr4ZtJmZtzrF8li173Z4s36tjZm2djeyrY0fxDJp3kNTfV1cvThoI
	SAhsaaVdjwtGQcjnsBjxHcaHIbJsyPxTeRewtsEoH+w9aGF/FD2KynKLuCTDPmdFhaFp+BwtVxpYU
	XF9pCIP90OQrYscBuzda2zAvJM40LXBjK/zEDNQ4HKJ2FYHHt6pX8VtZH3HfLa80+rwPPgs53Dghz
	OkpLrqZrY/ADDr8MDHvhQ+7IySEw6MKuq6L2luyjhyRitgg0yVepNl/QpHbSzoNLj/hKAkY7xhSTz
	yhrHlJ7RxvVHDhGdFkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS68r-00DXnF-09;
	Sat, 05 Aug 2023 01:31:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS68o-00DXmC-0j;
	Sat, 05 Aug 2023 01:31:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6B4462199;
	Sat,  5 Aug 2023 01:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975B1C433C7;
	Sat,  5 Aug 2023 01:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691199096;
	bh=ci8WuP6g2LqliK0OHhqNPGA26G25KgSCEbHqWe0PT68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QA3cE8I1zOdVnBlgr6ab50bKaWyj8synF3xXyhjxdE4vBfRvLRXpFLYpvdCRUmIsf
	 8PkIa7yZDIjmG0Tt9ECDlTGPwfNNaDRNi25lzVsAGKvtx+QW8V+cuIL6e0ZYNDJB8M
	 UZ/rYO7JybeG7cPBx82sZS9gx8Vueqth4ZHnQ1+73AaJvXbox93IBMkiP65LRZTsjS
	 uR/EsdNk7ejMyirWMZ2HWttPmg8yvKfk6vrhZ+BtDPjigHAFhTS+nmAHYTx5JVK9Dw
	 79fnWijGBmknBOSqRRp9uu4P4yPy/Xz3rZR9pAEWoc4F9uE7UounFGmwOkBP6+joLo
	 2W0NiY2+BHLCw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so3395310a12.2;
        Fri, 04 Aug 2023 18:31:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YyC99JMzmtBK3KJdtGjEvlfymh1Aiwf1uOMYq48g5Lj/JcXvWxB
	AXeQzstHl2XyqRIxtgDsej2ElR7KntojU5LfN8s=
X-Google-Smtp-Source: AGHT+IFd+UVpJ54Cs2bzLsBO42WkS7CwRLTDvfC4S2+C8McYBhJ44DBsoDX8bvx2T1Y2vcQvTfkpUl3/zFXzIHMGMTc=
X-Received: by 2002:a50:ee81:0:b0:523:1edf:c6b6 with SMTP id
 f1-20020a50ee81000000b005231edfc6b6mr2011319edr.40.1691199094841; Fri, 04 Aug
 2023 18:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
 <20230728-879500f157954d849fb303ec@orel> <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
 <ZMsbXk4JU/Ung7qu@gmail.com> <20230803-5b7e7c0d95597b004764a296@orel>
In-Reply-To: <20230803-5b7e7c0d95597b004764a296@orel>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 5 Aug 2023 09:31:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRHGkHnQZNUi6J+xsst0-8CDJxp=79tPj=i_1s2SiW7Hg@mail.gmail.com>
Message-ID: <CAJF2gTRHGkHnQZNUi6J+xsst0-8CDJxp=79tPj=i_1s2SiW7Hg@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools: riscv: Add header file csr.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <xiaobo55x@gmail.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_183138_345110_21A7ED7B 
X-CRM114-Status: GOOD (  16.73  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAzOjQ04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwMiwgMjAyMyBhdCAxMToxMzoz
NFBNIC0wNDAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMDIsIDIwMjMgYXQgMTA6
MDU6MDBBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgSnVsIDI4LCAyMDIz
IGF0IDU6NDPigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDAzOjIwOjA1UE0gKzA4
MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiA+ID4gQm9ycm93IHNvbWUgb2YgdGhlIGNzciBkZWZp
bml0aW9ucyBhbmQgb3BlcmF0aW9ucyBmcm9tIGtlcm5lbCdzCj4gPiA+ID4gPiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2Nzci5oIHRvIHRvb2xzLyBmb3IgcmlzY3YuCj4gPiA+ID4KPiA+ID4gPiBZ
b3Ugc2hvdWxkIGNvcHkgdGhlIGVudGlyZSBmaWxlIHZlcmJhdGltLgo+ID4gPiA+Cj4gPiA+Cj4g
PiA+IE9rLCB3aWxsIGNvcHkgYWxsIHRoZSBkZWZpbml0aW9ucyBpbiB0aGUgb3JpZ2luYWwgY3Ny
LmgKPiA+IFdoeSBub3QgaW5jbHVkZSB0aGUgb3JpZ2luYWwgb25lPyBNYWludGFpbiB0aGUgb25l
IGNzci5oIGlzIG1vcmUKPiA+IGNvbWZvcnRhYmxlLgo+Cj4gc2VsZnRlc3RzIGFuZCBvdGhlciB1
c2Vyc3BhY2UgdG9vbHMgY2FuJ3QgYWx3YXlzIGNvbXBpbGUgd2hlbiBpbmNsdWRpbmcgYQo+IGtl
cm5lbCBoZWFkZXIgd2l0aG91dCBtb2RpZnlpbmcgdGhlIGhlYWRlciBpbiBzb21lIHdheS4gUmF0
aGVyIHRoYW4KPiBwb2xsdXRpbmcgaGVhZGVycyB3aXRoICNpZmRlZmZlcnksIHRoZSBwcmFjdGlj
ZSBoYXMgYmVlbiB0byBjb3B5IG5lY2Vzc2FyeQo+IGhlYWRlcnMgdG8gdG9vbHMvaW5jbHVkZSBh
bmQgbW9kaWZ5IGlmIG5lY2Vzc2FyeS4KT2theSwgZ290IGl0LgoKPgo+IFRoYW5rcywKPiBkcmV3
CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
