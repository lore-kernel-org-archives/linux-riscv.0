Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC63C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaCMmHV0URkeZRD1k8p3Cq+tTNTtX2xYVydmQJFz1/4=; b=tbqpV6exVYVYcN
	WDAI35KLEVog3uGA2wfYjZpLVKiKsPlx2afAn/Uk25gND5T4rgtHai+ocb8E5DZjEhfoXYZ6ruqWC
	SI2HNXvhjgHNcbwl213zXttG8cGQR//XpfiAg0De8bW7aMIRtVQ/BzZGmDqF/mlKwyTsJIxUmO0bk
	EORwUD8fCF3Ot6F1k6aEh3SnrzqFJa5hNhvDcFNWBOr+DgEGLxU85IoBjfvnqHHedbRXYXXW2CPZZ
	wm1jQLBAuC02hoNbDgfASZRHndWdyW2ejLHyxJDHS5/YPfhvHCGzb7CmMNd2mb99XbNvml6ywxlFO
	KcUFEb2OUR62i0e6Uktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNi-0000000DEN8-1o4A;
	Mon, 29 Jan 2024 15:17:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNe-0000000DEKJ-3QvD;
	Mon, 29 Jan 2024 15:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=98Gr9ITR366GR6pU9VeYRdKpJCJHm8fElGj3k6A8yhQ=; b=XPirihBlNGWgXcIxNottRzcHGS
	NoDXCharW/9OS/EVteV5i5UEkYdapJIGEis1ZIPLbbJarGR3tDTlk9DQdykevMyYiBM22zXTWlJtv
	l/ASau/dV30a1KcQZ1PRAwizv1rWCgTgTUcsZJ4f0+s5kR0GnJU+5Yuxt2ixt4dEPcNY4EZkharl1
	Kkb9pv1otyt7lkLicWQlhfAq564HCDlX/tSE6QnXWmCmGTk2trVwgwSQDZwC+fua5mF5NmHYGrn0Z
	Si8uI1ArLvDovc9gHZ10bH1dfhdlYxx95pVaY4Z9Co+XhQ8IpJaUv453QExZXwxFeqqZ34/TVR5YZ
	z0Az2T1Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48498)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUTNV-0000Zx-1f;
	Mon, 29 Jan 2024 15:16:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUTNS-0004ei-Ql; Mon, 29 Jan 2024 15:16:50 +0000
Date: Mon, 29 Jan 2024 15:16:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <ZbfBYgdLzvEX/VjN@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
 <20231215161539.00000940@Huawei.com>
 <5760569.DvuYhMxLoT@kreacher>
 <20240102143925.00004361@Huawei.com>
 <20240111101949.000075dc@Huawei.com>
 <ZZ/CR/6Voec066DR@shell.armlinux.org.uk>
 <20240112115205.000043b0@Huawei.com>
 <Zbe8WQRASx6D6RaG@shell.armlinux.org.uk>
 <CAJZ5v0iba93EhQB2k3LMdb2YczndbRmF5WGRYHhnqCHq6TQJ0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iba93EhQB2k3LMdb2YczndbRmF5WGRYHhnqCHq6TQJ0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071702_899653_5E8EBFB4 
X-CRM114-Status: GOOD (  27.66  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMDQ6MDU6NDJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMzo1NeKAr1BNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IEhpIEpv
bmF0aGFuLAo+ID4KPiA+IE9uIEZyaSwgSmFuIDEyLCAyMDI0IGF0IDExOjUyOjA1QU0gKzAwMDAs
IEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gPiA+IE9uIFRodSwgMTEgSmFuIDIwMjQgMTA6MjY6
MTUgKzAwMDAKPiA+ID4gIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az4gd3JvdGU6Cj4gPiA+ID4gQEAgLTIzODEsMTYgKzIzODgsMzggQEAgRVhQT1JUX1NZTUJP
TF9HUEwoYWNwaV9kZXZfY2xlYXJfZGVwZW5kZW5jaWVzKTsKPiA+ID4gPiAgICogYWNwaV9kZXZf
cmVhZHlfZm9yX2VudW1lcmF0aW9uIC0gQ2hlY2sgaWYgdGhlIEFDUEkgZGV2aWNlIGlzIHJlYWR5
IGZvciBlbnVtZXJhdGlvbgo+ID4gPiA+ICAgKiBAZGV2aWNlOiBQb2ludGVyIHRvIHRoZSAmc3Ry
dWN0IGFjcGlfZGV2aWNlIHRvIGNoZWNrCj4gPiA+ID4gICAqCj4gPiA+ID4gLSAqIENoZWNrIGlm
IHRoZSBkZXZpY2UgaXMgcHJlc2VudCBhbmQgaGFzIG5vIHVubWV0IGRlcGVuZGVuY2llcy4KPiA+
ID4gPiArICogQ2hlY2sgaWYgdGhlIGRldmljZSBpcyBmdW5jdGlvbmFsIG9yIGVuYWJsZWQgYW5k
IGhhcyBubyB1bm1ldCBkZXBlbmRlbmNpZXMuCj4gPiA+ID4gICAqCj4gPiA+ID4gLSAqIFJldHVy
biB0cnVlIGlmIHRoZSBkZXZpY2UgaXMgcmVhZHkgZm9yIGVudW1lcmF0aW5vLiBPdGhlcndpc2Us
IHJldHVybiBmYWxzZS4KPiA+ID4gPiArICogUmV0dXJuIHRydWUgaWYgdGhlIGRldmljZSBpcyBy
ZWFkeSBmb3IgZW51bWVyYXRpb24uIE90aGVyd2lzZSwgcmV0dXJuIGZhbHNlLgo+ID4gPiA+ICAg
Ki8KPiA+ID4gPiAgYm9vbCBhY3BpX2Rldl9yZWFkeV9mb3JfZW51bWVyYXRpb24oY29uc3Qgc3Ry
dWN0IGFjcGlfZGV2aWNlICpkZXZpY2UpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgaWYgKGRldmlj
ZS0+ZmxhZ3MuaG9ub3JfZGVwcyAmJiBkZXZpY2UtPmRlcF91bm1ldCkKPiA+ID4gPiAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4KPiA+ID4gPiAtICAgcmV0dXJuIGFjcGlfZGV2aWNl
X2lzX3ByZXNlbnQoZGV2aWNlKTsKPiA+ID4gPiArICAgLyoKPiA+ID4gPiArICAgICogQUNQSSA2
LjUncyA2LjMuNyAiX1NUQSAoRGV2aWNlIFN0YXR1cykiIGFsbG93cyBmaXJtd2FyZSB0byByZXR1
cm4KPiA+ID4gPiArICAgICogKCFwcmVzZW50ICYmIGZ1bmN0aW9uYWwpIGZvciBjZXJ0YWluIHR5
cGVzIG9mIGRldmljZXMgdGhhdCBzaG91bGQgYmUKPiA+ID4gPiArICAgICogZW51bWVyYXRlZC4g
Tm90ZSB0aGF0IHRoZSBlbmFibGVkIGJpdCBzaG91bGQgbm90IGJlIHNldCB1bmxlc3MgdGhlCj4g
PiA+ID4gKyAgICAqIHByZXNlbnQgYml0IGlzIHNldC4KPiA+ID4gPiArICAgICoKPiA+ID4gPiAr
ICAgICogSG93ZXZlciwgbGltaXQgdGhpcyBvbmx5IHRvIHByb2Nlc3NvciBkZXZpY2VzIHRvIHJl
ZHVjZSBwb3NzaWJsZQo+ID4gPiA+ICsgICAgKiByZWdyZXNzaW9ucyB3aXRoIGZpcm13YXJlLgo+
ID4gPiA+ICsgICAgKi8KPiA+ID4gPiArICAgaWYgKGRldmljZS0+c3RhdHVzLmZ1bmN0aW9uYWwp
Cj4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPgo+ID4gSSBoYXZlIGEgcmVwb3J0
IGZyb20gd2l0aGluIE9yYWNsZSB0aGF0IHRoaXMgY2F1c2VzIHRlc3RpbmcgZmFpbHVyZXMKPiA+
IHdpdGggUUVNVSB1c2luZyAtc21wIGNwdXM9MixtYXhjcHVzPTQuIEkgdGhpbmsgaXQgbmVlZHMg
dG8gYmU6Cj4gPgo+ID4gICAgICAgICBpZiAoIWRldmljZS0+c3RhdHVzLnByZXNlbnQpCj4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIGRldmljZS0+c3RhdHVzLmZ1bmN0aW9uYWw7Cj4gPgo+ID4g
ICAgICAgICBpZiAoZGV2aWNlLT5zdGF0dXMuZW5hYmxlZCkKPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gdHJ1ZTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiAhYWNwaV9kZXZpY2VfaXNfcHJvY2Vz
c29yKGRldmljZSk7Cj4gCj4gVGhlIGFib3ZlIGlzIGZpbmUgYnkgbWUuCj4gCj4gPiBTbyB3ZSBj
YW4gYmV0dGVyIHVuZGVyc3RhbmQgdGhlIGhpc3RvcnkgaGVyZSwgbGV0J3MgbGlzdCBpdCBhcyBh
Cj4gPiB0cnV0aCB0YWJsZS4gUD1wcmVzZW50LCBGPWZ1bmN0aW9uYWwsIEU9ZW5hYmxlZCwgT3Jp
Zz1ob3cgdGhlIGNvZGUKPiA+IGlzIGluIG1haW5saW5lLCBKYW1lcz1KYW1lcycgb3JpZ2luYWwg
cHJvcG9zYWwsIFJhZmFlbD10aGUgcHJvcG9zZWQKPiA+IHJlcGxhY2VtZW50IGJ1dCBzZWVtcyB0
byBiZSBidWdneSwgUm1rPXRoZSBmaXhlZCB2ZXJzaW9uIHRoYXQgcGFzc2VzCj4gPiB0ZXN0czoK
PiA+Cj4gPiBQIEYgRSAgIE9yaWcgICAgSmFtZXMgICBSYWZhZWwgICAgICAgICAgUm1rCj4gPiAw
IDAgMCAgIDAgICAgICAgMCAgICAgICAwICAgICAgICAgICAgICAgMAo+ID4gMCAwIDEgICAwICAg
ICAgIDAgICAgICAgMCAgICAgICAgICAgICAgIDAKPiA+IDAgMSAwICAgMSAgICAgICAxICAgICAg
IDEgICAgICAgICAgICAgICAxCj4gPiAwIDEgMSAgIDEgICAgICAgMCAgICAgICAxICAgICAgICAg
ICAgICAgMQo+ID4gMSAwIDAgICAxICAgICAgIDAgICAgICAgIXByb2Nlc3NvciAgICAgICFwcm9j
ZXNzb3IKPiA+IDEgMCAxICAgMSAgICAgICAxICAgICAgIDEgICAgICAgICAgICAgICAxCj4gPiAx
IDEgMCAgIDEgICAgICAgMCAgICAgICAxICAgICAgICAgICAgICAgIXByb2Nlc3Nvcgo+ID4gMSAx
IDEgICAxICAgICAgIDEgICAgICAgMSAgICAgICAgICAgICAgIDEKPiA+Cj4gPiBBbnkgb2JqZWN0
aW9ucyB0byB0aGlzPwo+IAo+IFNvIEFGQUlBQyBpdCBjYW4gcmV0dXJuIGZhbHNlIGlmIG5vdCBl
bmFibGVkLCBidXQgcHJlc2VudCBhbmQKPiBmdW5jdGlvbmFsLiAgW1NpZGUgbm90ZTogSSdtIHdv
bmRlcmluZyB3aGF0ICJmdW5jdGlvbmFsIiBtZWFucyB0aGVuLAo+IGJ1dCB3aGF0ZXZlci5dCgpG
cm9tIEFDUEkgdjYuNSAoYml0IDMgaXMgb3VyICJzdGF0dXMuZnVuY3Rpb25hbCI6CgogX1NUQSBt
YXkgcmV0dXJuIGJpdCAwIGNsZWFyIChub3QgcHJlc2VudCkgd2l0aCBiaXQgWzNdIHNldCAoZGV2
aWNlIGlzCiBmdW5jdGlvbmFsKS4gVGhpcyBjYXNlIGlzIHVzZWQgdG8gaW5kaWNhdGUgYSB2YWxp
ZCBkZXZpY2UgZm9yIHdoaWNoIG5vCiBkZXZpY2UgZHJpdmVyIHNob3VsZCBiZSBsb2FkZWQgKGZv
ciBleGFtcGxlLCBhIGJyaWRnZSBkZXZpY2UuKSBDaGlsZHJlbgogb2YgdGhpcyBkZXZpY2UgbWF5
IGJlIHByZXNlbnQgYW5kIHZhbGlkLiBPU1BNIHNob3VsZCBjb250aW51ZQogZW51bWVyYXRpb24g
YmVsb3cgYSBkZXZpY2Ugd2hvc2UgX1NUQSByZXR1cm5zIHRoaXMgYml0IGNvbWJpbmF0aW9uLgoK
U28sIGZvciB0aGlzIGNhc2UsIGFjcGlfZGV2X3JlYWR5X2Zvcl9lbnVtZXJhdGlvbigpIHJldHVy
bmluZyB0cnVlIGZvcgp0aGlzIGNhc2UgaXMgY29ycmVjdCwgc2luY2Ugd2UncmUgc3VwcG9zZWQg
dG8gZW51bWVyYXRlIGl0IGFuZCBjaGlsZApkZXZpY2VzLgoKSXQncyBwcm9iYWJseSBhbHNvIHdv
cnRoIHBvaW50aW5nIG91dCB0aGF0IGluIHRoZSBhYm92ZSB0YWJsZSwgdGhlIHR3bwpjb21iaW5h
dGlvbnMgd2l0aCBQPTAgRT0xIGdvZXMgYWdhaW5zdCB0aGUgc3BlYywgYnV0IGFyZSBpbmNsdWRl
ZCBmb3IKY29tcGxldG5lc3MuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5h
cm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRv
d24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
