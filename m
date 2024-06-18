Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00279C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AstaRyWt38eRA7qwLfKNUX5soc9t5l+0YLS5XhpeJ6c=; b=TkdPYXsUB3n+9x
	7I+JhWW+mLtNu26k96Ff9OAzG5BfNtgy/PbCJ+hYCR3ns/grEOEFBvoRq0WJ76PNC4RiLaxM0rLPj
	EY1EzoV9p9jB973PssGnYx2p8Pp/GSSBFJ46++ZqucmY69fYqPDWxSi8vTSobhqR1gsjhOr+W+WT0
	qCAupd/q/ekD1T1K80uM3QZAbgVky8O0QL5FPH7rBXIffRUdAR//AEcTk+Vcn51RU211peF2UkDTW
	ym/am2VhAuNzAFEZ23+X23PWBeyV4QEEKgX4/pxbkZLvn65e5rBhX89xDIs2snVkjNl58oGoeH0tE
	ESQKTv7uMTIgUaiEaiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJabY-0000000FaG5-41eJ;
	Tue, 18 Jun 2024 15:18:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJabU-0000000FaDW-2feb;
	Tue, 18 Jun 2024 15:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF825CE137B;
	Tue, 18 Jun 2024 15:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8937C3277B;
	Tue, 18 Jun 2024 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718723911;
	bh=oD3IpixnZRA6VJNpe277ZbDs/y+e0fqqwZSUwflrg8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArDhdieGvgt/FJJG8gyMkxVPlgmkx9RZYaYFNEIljcOTSvBFowjbLwZi+jv/YEC+T
	 dLKKXodefJKbY9Cr2AhIbCzmim7GSlkUbjc5mei8D6pNFRJTo7Qlf05gQqzY/LXbhd
	 KSLFGHaD76TIq8faXQHQsuLY/MAeaI0tU8Eg6TOWEHmtoXqRKF+7Sl+tN2k8bLaCJ5
	 1ViZiZRdGEb0i4hrWKJQb6v8cs18JOgsQcMLm2lDrDa6CfjevnfSECX9QNvvvpK1s+
	 Zdb5Io5eizzadhl/rUCwq+2E+Pq6toSbc5B6rXa479OV/UIbcaI/ibPedPM3r598Qm
	 Y5uYAwxiDZJ8w==
Date: Tue, 18 Jun 2024 16:18:20 +0100
From: Will Deacon <will@kernel.org>
To: Haibo Xu <xiaobo55x@gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden
 option
Message-ID: <20240618151820.GA2354@willie-the-truck>
References: <cover.1718268003.git.haibo1.xu@intel.com>
 <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
 <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_081837_060592_B4D77F50 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Robert Richter <rrichter@amd.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMDk6MzQ6MThQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gQENhdGFsaW4gTWFyaW5hcyBASHVhY2FpIENoZW4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGhh
dmUgYSBsb29rIGF0IHRoaXMgcGF0Y2ggZm9yIHRoZSBBQ1BJX05VTUEgY29uZmlnIG9uCj4gQVJN
NjQgYW5kIExPT05HQVJDSCByZXNwZWN0aXZlbHkuCj4gCj4gVGhhbmtzIQo+IAo+IE9uIFRodSwg
SnVuIDEzLCAyMDI0IGF0IDQ6MzfigK9QTSBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4geDg2L2FybTY0L2xvb25nYXJjaCB3b3VsZCBzZWxlY3QgQUNQSV9OVU1B
IGJ5IGRlZmF1bHQgYW5kIHJpc2N2Cj4gPiB3b3VsZCBkbyB0aGUgc2FtZSB0aGluZywgc28gY2hh
bmdlIGl0IHRvIGEgaGlkZGVuIG9wdGlvbiBhbmQgdGhlCj4gPiBzZWxlY3Qgc3RhdGVtZW50cyBl
eGNlcHQgZm9yIHRoZSBYODZfNjRfQUNQSV9OVU1BIGNhbiBhbHNvIGdvIGF3YXkuCj4gPgo+ID4g
U3VnZ2VzdGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4gU3VnZ2VzdGVk
LWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFN1bmls
IFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9L
Y29uZmlnICAgICAgICB8IDEgLQo+ID4gIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgfCAxIC0K
PiA+ICBkcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnIHwgNSArLS0tLQo+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCgpUaGlzIGxvb2tzIGZpbmUgZnJv
bSBhbiBhcm02NCBwZXJzcGVjdGl2ZToKCkFja2VkLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJu
ZWwub3JnPgoKV2lsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
