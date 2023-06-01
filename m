Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2AEC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12Jq4jUt+Af7KwANeSGTyHXn6ETSEWyY0B/eeaK6baU=; b=Qe6NF6G/wpbPJl
	DZwIiC0EMX3NFJKu1Nb367iw48gZlcgkS4hE1VuU4P+x9+Qz9rqCwAkh3q24KWno7v/AS/C+SPnFX
	c/bXBl2fMS9BXlWX+plV5M7zx4qTvX9Wz7mIT41bYX+Clj1319FW+FPVAlHXSMCY8vpzJlhk+wBAS
	9+YvuyoWQMWgO84p+3DoJCfDFyzHv0f4Slq6CT6z5omsrPXzl4dpJXuz0n7A3ZItn52GWhMNvcl5i
	AlO3JThhcRNxJbEHM2DE2NnwrpVWlIrghx1ak9z5zG1mkAkGnKpNNGprW3vHdMsdwojLWEzCbwhvk
	k48PARLq25ZLV//0DSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qu0-0059G7-0A;
	Thu, 01 Jun 2023 22:36:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qtx-0059D3-1D;
	Thu, 01 Jun 2023 22:36:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00DB964AAD;
	Thu,  1 Jun 2023 22:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66F8C433AC;
	Thu,  1 Jun 2023 22:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685658961;
	bh=HByQUJENQcDPWiijaDFhYT8jA4bRcfOqcVglu/ddG6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FOEYRJKpnW4iKM1qTP1RubJNm9oWcin4d1pqMhfHH1jHWxeA9v7cAr5+A08be7Fvr
	 zIIQ+RK+VnwmRh4dV8eSpzAC9vuNvbbjJOCAUkLs9IEIoqPeldosvmDlneE7uI7zOd
	 MEOs6GaTT4piHutYs3mvFo1SqMwdjh24tg3ZUrqf+ZV0OcZYne8qDSmsAgVG5/lRkC
	 oXr4pi7df6VNXbdn9AQ54C0O6ISTgYI6uFDZwH8n+ZPgRbBtlTQ2kYBiwhgF0xcuce
	 QXcem6qexEf8Xds1Y609C0dKziypJ0zgLG99S8eQ6nOm/bUVZH+kysGTa5OEj33f00
	 mI/aIAuZGqq9Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so1889273e87.0;
        Thu, 01 Jun 2023 15:36:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDzOe024bmsgyeJRVANcMW4ro7AOqTEYrLT03gMhZHzNsq8YvYyr
	VDv/WCy8NamQS3mwTSyMyyBYtXWFwn/5AxhELZ8=
X-Google-Smtp-Source: ACHHUZ5IpAtCBKLINxhk+Z0SWINwbFkPqmi++HI/k6BNegfGNCzvnzTim5Gy3oJJLp9NHmq3+FFn0pl72eGk9Pzb3ws=
X-Received: by 2002:ac2:48ba:0:b0:4ec:8816:f4fc with SMTP id
 u26-20020ac248ba000000b004ec8816f4fcmr792426lfg.6.1685658959623; Thu, 01 Jun
 2023 15:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <20230601101257.530867-5-rppt@kernel.org>
In-Reply-To: <20230601101257.530867-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 15:35:47 -0700
X-Gmail-Original-Message-ID: <CAPhsuW70o=8QwcNJPx=qxaKoPkOzwYt8xxzjK38dF2tJB-18jQ@mail.gmail.com>
Message-ID: <CAPhsuW70o=8QwcNJPx=qxaKoPkOzwYt8xxzjK38dF2tJB-18jQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] mm/jitalloc, arch: convert remaining overrides of
 module_alloc to jitalloc
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_153613_492119_806E44E5 
X-CRM114-Status: GOOD (  19.79  )
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

T24gVGh1LCBKdW4gMSwgMjAyMyBhdCAzOjEz4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206ICJNaWtlIFJhcG9wb3J0IChJQk0pIiA8cnBwdEBrZXJu
ZWwub3JnPgo+Cj4gRXh0ZW5kIGppdGFsbG9jIHBhcmFtZXRlcnMgdG8gYWNjb21tb2RhdGUgbW9y
ZSBjb21wbGV4IG92ZXJyaWRlcyBvZgo+IG1vZHVsZV9hbGxvYygpIGJ5IGFyY2hpdGVjdHVyZXMu
Cj4KPiBUaGlzIGluY2x1ZGVzIHNwZWNpZmljYXRpb24gb2YgYSBmYWxsYmFjayByYW5nZSByZXF1
aXJlZCBieSBhcm0sIGFybTY0Cj4gYW5kIHBvd2VycGMgYW5kIHN1cHBvcnQgZm9yIGFsbG9jYXRp
b24gb2YgS0FTQU4gc2hhZG93IHJlcXVpcmVkIGJ5Cj4gYXJtNjQsIHMzOTAgYW5kIHg4Ni4KPgo+
IFRoZSBjb3JlIGltcGxlbWVudGF0aW9uIG9mIGppdF9hbGxvYygpIHRha2VzIGNhcmUgb2Ygc3Vw
cHJlc3Npbmcgd2FybmluZ3MKPiB3aGVuIHRoZSBpbml0aWFsIGFsbG9jYXRpb24gZmFpbHMgYnV0
IHRoZXJlIGlzIGEgZmFsbGJhY2sgcmFuZ2UgZGVmaW5lZC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1p
a2UgUmFwb3BvcnQgKElCTSkgPHJwcHRAa2VybmVsLm9yZz4KClsuLi5dCgo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jIGIvYXJjaC9hcm02NC9rZXJuZWwvbW9kdWxl
LmMKPiBpbmRleCA1YWY0OTc1Y2FlYjUuLmVjZjFmNDAzMDMxNyAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5j
Cj4gQEAgLTE3LDU2ICsxNyw0OSBAQAo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlbG9hZGVyLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9zY3MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L2ppdGFsbG9jLmg+Cj4gICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRp
dmUuaD4KPiAgI2luY2x1ZGUgPGFzbS9pbnNuLmg+Cj4gICNpbmNsdWRlIDxhc20vc2NzLmg+Cj4g
ICNpbmNsdWRlIDxhc20vc2VjdGlvbnMuaD4KPgo+IC12b2lkICptb2R1bGVfYWxsb2ModW5zaWdu
ZWQgbG9uZyBzaXplKQo+ICtzdGF0aWMgc3RydWN0IGppdF9hbGxvY19wYXJhbXMgaml0X2FsbG9j
X3BhcmFtcyA9IHsKPiArICAgICAgIC5hbGlnbm1lbnQgICAgICA9IE1PRFVMRV9BTElHTiwKPiAr
ICAgICAgIC5mbGFncyAgICAgICAgICA9IEpJVF9BTExPQ19LQVNBTl9TSEFET1csCj4gK307Cj4g
Kwo+ICtzdHJ1Y3Qgaml0X2FsbG9jX3BhcmFtcyAqaml0X2FsbG9jX2FyY2hfcGFyYW1zKHZvaWQp
Cj4gIHsKPiAgICAgICAgIHU2NCBtb2R1bGVfYWxsb2NfZW5kID0gbW9kdWxlX2FsbG9jX2Jhc2Ug
KyBNT0RVTEVTX1ZTSVpFOwoKbW9kdWxlX2FsbG9jX2Jhc2UoKSBpcyBpbml0aWFsaXplZCBpbiBr
YXNscl9pbml0KCksIHdoaWNoIGlzIGNhbGxlZCBhZnRlcgptbV9jb3JlX2luaXQoKS4gV2Ugd2ls
bCBuZWVkIHNvbWUgc3BlY2lhbCBsb2dpYyBmb3IgdGhpcy4KClRoYW5rcywKU29uZwoKPiAtICAg
ICAgIGdmcF90IGdmcF9tYXNrID0gR0ZQX0tFUk5FTDsKPiAtICAgICAgIHZvaWQgKnA7Cj4gLQo+
IC0gICAgICAgLyogU2lsZW5jZSB0aGUgaW5pdGlhbCBhbGxvY2F0aW9uICovCj4gLSAgICAgICBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfQVJNNjRfTU9EVUxFX1BMVFMpKQo+IC0gICAgICAgICAgICAg
ICBnZnBfbWFzayB8PSBfX0dGUF9OT1dBUk47Cj4KClsuLi5dCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
