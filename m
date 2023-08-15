Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC83C001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5kHr+A+xNJaW0Les4TmCcFdHTVjdqBzFBk7r1rLBWo=; b=Adh0R51egkba9F
	khfYLtbPPdMDKmIaVCEZLT8HmIMBB0U57U7TqU5ftkxeiYu58v28RbIO0v7ksFzRXoUuszx9+PqnM
	VU8HoIjPEfKz+HLyFZRotMiHjCNOvO7VEULsw4T0Jsb/eq26zvorFHEbfE+4PwsPkn3xFdtMsuqmX
	e6bDtgmXoP0r9kjyfU2ojoQY+vlpQpsXTmzEoZdcPy4JInsPSg+Px88VCgIyq8tsBkwmedq80KCoJ
	7D32oXWyc71nWnGhupXV6PO1UdD0BXkmYUv830yRQ25qFujINfuhAP0vcn+xHHpg91ajmvcMFFk2v
	xcpNXnudcrdsc3HS38sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVyko-0029sD-0G;
	Tue, 15 Aug 2023 18:26:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVykl-0029rK-1i;
	Tue, 15 Aug 2023 18:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NcH3MbcmaQtEb8CZ/TmIJ1Va7X5hDyCbzaHQ5CUJ5JM=; b=EHXPxJbIWzx4NuTZ/yBRUZmiOl
	Ge3fmfbgH0X5m5UUCoiu3GjChY9p7hFjS8BkiQoZAIZY5Gc4oQvvs2seiv1cRcTmRONH+USuNxqtV
	YAhQH5gaaY2lNZEi7IeDSG6nsy50HwvyhJbCGDkQvAWtzEhQfFlVJYlZEev7a9PPZGVaTHidAxsA1
	clG3478+EoSEal/Txd2plC2KwhtwztfdB/gSXlvBRTJn3V65EurQD0mYGul6xHbTGptyrgDjvxBps
	bWFnOen8Lxy/6Dn46HDxd2MxojYqz7eDafFe3NY64N++6g9NNtO+fZqzf93ygwsGv0VJnUGTfL0oh
	3NKeSrbg==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVykj-00C0oV-2i;
	Tue, 15 Aug 2023 18:26:50 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 54185404DF; Tue, 15 Aug 2023 15:26:47 -0300 (-03)
Date: Tue, 15 Aug 2023 15:26:47 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v6 10/10] perf: tests: Adapt mmap-basic.c for riscv
Message-ID: <ZNvDZxIS1OhXGqg0@kernel.org>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-11-alexghiti@rivosinc.com>
 <CAP-5=fVcMg7TL6W_jH61PW6dYMobuTs13d4JDuTAx=mxJ+PNtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fVcMg7TL6W_jH61PW6dYMobuTs13d4JDuTAx=mxJ+PNtQ@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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

RW0gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMDk6NDQ6NThBTSAtMDcwMCwgSWFuIFJvZ2VycyBlc2Ny
ZXZldToKPiBPbiBXZWQsIEF1ZyAyLCAyMDIzIGF0IDE6MTTigK9BTSBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IHJpc2N2IG5vdyBzdXBwb3J0
cyBtbWFwaW5nIGhhcmR3YXJlIGNvdW50ZXJzIHRvIHVzZXJzcGFjZSBzbyBhZGFwdCB0aGUgdGVz
dAo+ID4gdG8gcnVuIG9uIHRoaXMgYXJjaGl0ZWN0dXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5
OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBJYW4g
Um9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpUaGFua3MsIGFwcGxpZWQuCgotIEFybmFsZG8K
CiAKPiBUaGFua3MsCj4gSWFuCj4gCj4gPiAtLS0KPiA+ICB0b29scy9wZXJmL3Rlc3RzL21tYXAt
YmFzaWMuYyB8IDYgKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi90ZXN0cy9tbWFw
LWJhc2ljLmMgYi90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+ID4gaW5kZXggZTY4Y2E2
MjI5NzU2Li44ODZhMTNhNzdhMTYgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3Rlc3RzL21t
YXAtYmFzaWMuYwo+ID4gKysrIGIvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMKPiA+IEBA
IC0yODQsNyArMjg0LDggQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2UgdGVzdHNfX2Jhc2ljX21t
YXBbXSA9IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAicGVybWlzc2lvbnMiKSwKPiA+
ICAgICAgICAgVEVTVF9DQVNFX1JFQVNPTigiVXNlciBzcGFjZSBjb3VudGVyIHJlYWRpbmcgb2Yg
aW5zdHJ1Y3Rpb25zIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBtbWFwX3VzZXJfcmVh
ZF9pbnN0ciwKPiA+IC0jaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9f
KSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQo+ID4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBk
ZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pIHx8IFwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAoZGVmaW5lZChfX3Jpc2N2KSAmJiBfX3Jpc2N2X3hsZW4gPT0g
NjQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgInBlcm1pc3Npb25zIgo+ID4gICNlbHNl
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgInVuc3VwcG9ydGVkIgo+ID4gQEAgLTI5Miw3
ICsyOTMsOCBAQCBzdGF0aWMgc3RydWN0IHRlc3RfY2FzZSB0ZXN0c19fYmFzaWNfbW1hcFtdID0g
ewo+ID4gICAgICAgICAgICAgICAgICksCj4gPiAgICAgICAgIFRFU1RfQ0FTRV9SRUFTT04oIlVz
ZXIgc3BhY2UgY291bnRlciByZWFkaW5nIG9mIGN5Y2xlcyIsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgbW1hcF91c2VyX3JlYWRfY3ljbGVzLAo+ID4gLSNpZiBkZWZpbmVkKF9faTM4Nl9f
KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pCj4gPiArI2lm
IGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2Fh
cmNoNjRfXykgfHwgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIChkZWZpbmVkKF9fcmlz
Y3YpICYmIF9fcmlzY3ZfeGxlbiA9PSA2NCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAi
cGVybWlzc2lvbnMiCj4gPiAgI2Vsc2UKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAidW5z
dXBwb3J0ZWQiCj4gPiAtLQo+ID4gMi4zOS4yCj4gPgoKLS0gCgotIEFybmFsZG8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
