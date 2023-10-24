Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DEEC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 11:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cmH7wZH1cwNjc3blaz+ja8KBJLVP2lszwScXdt1kIY=; b=dpa8dqn9P/djL7
	l54kfVgmKcrdVi/EIY2ydv0JCjOaxbkJRCECCdrhGXmUkwFp7/rqfEGSX4dSpggjmJVLJ7aLAmsQv
	k+gXgNwRoJAV2t8KdJJi1wJhzGfbrgsw+kvumB+EHEj0GinetMoJGyGPCPO+m6N/prd2ZdzoYi6oC
	ev+OFJl4CLXwc8T1yusI8yqmoI6g/r/mjNBULo4ryTeOSOXQHxpVaSgvK+jejYVvQhBZL/1nPYzxD
	hy1e3flZJ0/Rssxvl5+ApEFBWTI7xX6oBSVZP2u+P1/uztPAtBVQ4ym+T4wtU5dEUTbJAJedfqzqm
	33twBoxkbRWpOAwhxGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFd3-009eTr-2u;
	Tue, 24 Oct 2023 11:31:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFcz-009eMn-2X;
	Tue, 24 Oct 2023 11:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p9Xk6+oVu2eZSCHniKsbVUw777g3shFxugtPS4C2Azc=; b=ZVtRI3i8atfSABmwqYOam92raQ
	sGbWV0A3UKiGLSAkdhisvJ/Q3AW4A8vqe+K9zP0mN5nimUsw9Q/zg1bAMTEvwX3VL9oPE208SBLW5
	CdkR3e9MhuDKI0nOCcqkMgGfjmaH0CjVXYUptjRbTY24/ebqcC69b3MRM7jiKvWj/Z8icCFy6dtK+
	hmRSLuuC/iJ9jau8xMEmZGgM8xSCFtfxZxyNWuwijdN5Pmzom9RlONQ+ddjwAj+YxHH8f4rP9LN8b
	jx5jcWOGsmFNUeFBI7LlmTTt5LkAl3+llaabm8ykn15h2Okzsikzg1rvRM/CnB5RupJcx2+whac05
	/7r1Emsw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47178)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qvFal-00045E-1p;
	Tue, 24 Oct 2023 12:28:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qvFaj-0005rQ-FG; Tue, 24 Oct 2023 12:28:57 +0100
Date: Tue, 24 Oct 2023 12:28:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Miguel Luis <miguel.luis@oracle.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	James Morse <james.morse@arm.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	"jianyong.wu@arm.com" <jianyong.wu@arm.com>,
	"justin.he@arm.com" <justin.he@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Subject: Re: [PATCH] ACPI: Rename acpi_scan_device_not_present() to be about
 enumeration
Message-ID: <ZTeqeRRbJgEdbMV3@shell.armlinux.org.uk>
References: <E1qtuWW-00AQ7P-0W@rmk-PC.armlinux.org.uk>
 <5589E5A5-9F97-416A-9C48-9828B0BE58CD@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5589E5A5-9F97-416A-9C48-9828B0BE58CD@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_043117_843982_3E0EC54A 
X-CRM114-Status: GOOD (  17.14  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMTA6MTU6MDdBTSArMDAwMCwgTWlndWVsIEx1aXMgd3Jv
dGU6Cj4gSGkgUnVzc2VsbCwKPiAKPiA+IE9uIDIwIE9jdCAyMDIzLCBhdCAxODo0NywgUnVzc2Vs
bCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiAKPiA+IEZyb206
IEphbWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gCj4gPiBhY3BpX3NjYW5fZGV2
aWNlX25vdF9wcmVzZW50KCkgaXMgY2FsbGVkIHdoZW4gYSBkZXZpY2UgaW4gdGhlCj4gPiBoaWVy
YXJjaHkgaXMgbm90IGF2YWlsYWJsZSBmb3IgZW51bWVyYXRpb24uIEhpc3RvcmljYWxseSBlbnVt
ZXJhdGlvbgo+ID4gd2FzIG9ubHkgYmFzZWQgb24gd2hldGhlciB0aGUgZGV2aWNlIHdhcyBwcmVz
ZW50Lgo+ID4gCj4gPiBUbyBhZGQgc3VwcG9ydCBmb3Igb25seSBlbnVtZXJhdGluZyBkZXZpY2Vz
IHRoYXQgYXJlIGJvdGggcHJlc2VudAo+ID4gYW5kIGVuYWJsZWQsIHRoaXMgaGVscGVyIHNob3Vs
ZCBiZSByZW5hbWVkLiBJdCB3YXMgb25seSBldmVyIGFib3V0Cj4gPiBlbnVtZXJhdGlvbiwgcmVu
YW1lIGl0IGFjcGlfc2Nhbl9kZXZpY2Vfbm90X2VudW1lcmF0ZWQoKS4KPiA+IAo+ID4gTm8gY2hh
bmdlIGluIGJlaGF2aW91ciBpcyBpbnRlbmRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hh
biA8Z3NoYW5AcmVkaGF0LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gCj4gRml4ZXM6IDQ0M2ZjODIwMjI3
MiAoIkFDUEkgLyBob3RwbHVnOiBSZXdvcmsgZ2VuZXJpYyBjb2RlIHRvIGhhbmRsZSBzdXByaXNl
IHJlbW92YWxz4oCdKSA/CgpJJ20gbm90IHN1cmUgYSBwYXRjaCB0aGF0IGlzIG1lcmVseSByZW5h
bWluZyBhIGZ1bmN0aW9uIHNob3VsZCBldmVyCmhhdmUgYSBGaXhlcyB0YWcsIHNpbmNlIGl0J3Mg
anVzdCBhIG5hbWluZyBpc3N1ZSwgaXQgZG9lc24ndCBmaXggYQpidWcsIGNoYW5nZSBmdW5jdGlv
bmFsaXR5IG9yIGFueXRoaW5nIGxpa2UgdGhhdC4KCkkgd291bGQgc3VnZ2VzdCB0aGF0IHRoZXJl
IHdvdWxkIG5lZWQgdG8gYmUgZ29vZCByZWFzb24gd2h5IHN1Y2ggYQpwYXRjaCBzaG91bGQgYmUg
YmFja3BvcnRlZCB0byBzdGFibGUga2VybmVscyAtIGZvciBleGFtcGxlLCBzb21ldGhpbmcKZWxz
ZSB0aGF0IGRvZXMgZml4IGEgdXNlciB2aXNpYmxlIGJ1ZyByZXF1aXJlcyB0aGlzIGNoYW5nZS4K
ClRoYW5rcy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9y
Zy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMg
dXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
