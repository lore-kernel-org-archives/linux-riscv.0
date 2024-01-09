Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4198C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSEVsQHQVdV6gXc5JEf8SawUeWlyDTbmTPFow5cybHo=; b=uDybBJbYQOCIP1
	tEKGX9h/UMFsR422ttlHbiJwHANrBhRVtv5jEMPPRGaw+2h/qoSxFlZd1v7WYx5k1e+J5Y+rCm1KD
	gwEQ3AKN9Yq1i0nXlNIixS/KS2rQkj5APBvX5ETQyrYF/eTeEtLoG8AZ5voRLH2O7Cp7MQKbwAdw/
	/d4IduGoa8wedDiyE/jeW6wDw4l3fyv7oFaNgIgC1DUay4nP7JpjvHyCF+3HQi4WBv2uNaXrvelie
	79IGiXjl6xT1oU68TT9TCPLB3WruCsbp+Rgdrx0kJM6x5Vwez4/V7mGTjvE2IqYP8y7NpA9PYCJov
	afRmO1kb++KQFhPw+hFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEOA-008jPy-1x;
	Tue, 09 Jan 2024 15:51:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEO6-008iqT-0b;
	Tue, 09 Jan 2024 15:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tZu+pKrUWqvj1u7XXOZ361qKXLT14yOTmWAUg/xb9K8=; b=nN/okoV4vFIiLWpy1C8jbd7tdw
	Qv36Z2Gb+2ode/mlOC9FGuq844QXK7cH1QtvswvkKjPFNn3crE3ejxFH+peDwTmHOW4G/GWbH6Jpn
	0qzKOvO75N3PC9BVsubbFulOPfcPT9peor+qGDaJvLE1hDNNoKtb0pRiolyX60ZvDTRC5WW3imUyZ
	1xyVORTa/XshnAfR1BtvDgMDdHcKzUMxaBI9H8XnwA0OUVxFBs03HPJwS8ZWzD+a9pTAz9kjYXkvu
	D81k2SVTALrUMdf78FrSRpsd/686oC+ZFg2iPb8F+4cDR8NoTEmsESKvjPSBSJuSGwKrJgRpTa/j3
	34Jq5IPg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53760)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rNELt-0004Hq-18;
	Tue, 09 Jan 2024 15:49:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rNELr-0004Of-RO; Tue, 09 Jan 2024 15:49:15 +0000
Date: Tue, 9 Jan 2024 15:49:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZZ1q+7GXqnMMwKNR@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_075134_245609_60F697C3 
X-CRM114-Status: GOOD (  31.99  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMDk6MTc6MzRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IEZyb206IEphbWVz
IE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4KPiA+IEFDUEkgaGFzIHR3byB3YXlzIG9m
IGRlc2NyaWJpbmcgcHJvY2Vzc29ycyBpbiB0aGUgRFNEVC4gRnJvbSBBQ1BJIHY2LjUsCj4gPiA1
LjIuMTI6Cj4gPgo+ID4gIlN0YXJ0aW5nIHdpdGggQUNQSSBTcGVjaWZpY2F0aW9uIDYuMywgdGhl
IHVzZSBvZiB0aGUgUHJvY2Vzc29yKCkgb2JqZWN0Cj4gPiB3YXMgZGVwcmVjYXRlZC4gT25seSBs
ZWdhY3kgc3lzdGVtcyBzaG91bGQgY29udGludWUgd2l0aCB0aGlzIHVzYWdlLiBPbgo+ID4gdGhl
IEl0YW5pdW0gYXJjaGl0ZWN0dXJlIG9ubHksIGEgX1VJRCBpcyBwcm92aWRlZCBmb3IgdGhlIFBy
b2Nlc3NvcigpCj4gPiB0aGF0IGlzIGEgc3RyaW5nIG9iamVjdC4gVGhpcyB1c2FnZSBvZiBfVUlE
IGlzIGFsc28gZGVwcmVjYXRlZCBzaW5jZSBpdAo+ID4gY2FuIHByZWNsdWRlIGFuIE9TUE0gZnJv
bSBiZWluZyBhYmxlIHRvIG1hdGNoIGEgcHJvY2Vzc29yIHRvIGEKPiA+IG5vbi1lbnVtZXJhYmxl
IGRldmljZSwgc3VjaCBhcyB0aG9zZSBkZWZpbmVkIGluIHRoZSBNQURULiBGcm9tIEFDUEkKPiA+
IFNwZWNpZmljYXRpb24gNi4zIG9ud2FyZCwgYWxsIHByb2Nlc3NvciBvYmplY3RzIGZvciBhbGwg
YXJjaGl0ZWN0dXJlcwo+ID4gZXhjZXB0IEl0YW5pdW0gbXVzdCBub3cgdXNlIERldmljZSgpIG9i
amVjdHMgd2l0aCBhbiBfSElEIG9mIEFDUEkwMDA3LAo+ID4gYW5kIHVzZSBvbmx5IGludGVnZXIg
X1VJRCB2YWx1ZXMuIgo+ID4KPiA+IEFsc28gc2VlIGh0dHBzOi8vdWVmaS5vcmcvc3BlY3MvQUNQ
SS82LjUvMDhfUHJvY2Vzc29yX0NvbmZpZ3VyYXRpb25fYW5kX0NvbnRyb2wuaHRtbCNkZWNsYXJp
bmctcHJvY2Vzc29ycwo+ID4KPiA+IER1cGxpY2F0ZSBkZXNjcmlwdGlvbnMgYXJlIG5vdCBhbGxv
d2VkLCB0aGUgQUNQSSBwcm9jZXNzb3IgZHJpdmVyIGFscmVhZHkKPiA+IHBhcnNlcyB0aGUgVUlE
IGZyb20gYm90aCBkZXZpY2VzIGFuZCBjb250YWluZXJzLiBhY3BpX3Byb2Nlc3Nvcl9nZXRfaW5m
bygpCj4gPiByZXR1cm5zIGFuIGVycm9yIGlmIHRoZSBVSUQgZXhpc3RzIHR3aWNlIGluIHRoZSBE
U0RULgo+IAo+IEknbSBub3QgcmVhbGx5IHN1cmUgaG93IHRoZSBhYm92ZSBpcyByZWxhdGVkIHRv
IHRoZSBhY3R1YWwgcGF0Y2guCj4gCj4gPiBUaGUgbWlzc2luZyBwcm9iZSBmb3IgQ1BVcyBkZXNj
cmliZWQgYXMgcGFja2FnZXMKPiAKPiBJdCBpcyB1bmNsZWFyIHdoYXQgZXhhY3RseSBpcyBtZWFu
dCBieSAiQ1BVcyBkZXNjcmliZWQgYXMgcGFja2FnZXMiLgo+IAo+IEZyb20gdGhlIHBhdGNoLCBp
dCBsb29rcyBsaWtlIHRob3NlIHdvdWxkIGJlIFByb2Nlc3NvcigpIG9iamVjdHMKPiBkZWZpbmVk
IHVuZGVyIGEgcHJvY2Vzc29yIGNvbnRhaW5lciBkZXZpY2UuCj4gCj4gPiBjcmVhdGVzIGEgcHJv
YmxlbSBmb3IKPiA+IG1vdmluZyB0aGUgY3B1X3JlZ2lzdGVyKCkgY2FsbHMgaW50byB0aGUgYWNw
aV9wcm9jZXNzb3IgZHJpdmVyLCBhcyBDUFVzCj4gPiBkZXNjcmliZWQgbGlrZSB0aGlzIGRvbid0
IGdldCByZWdpc3RlcmVkLCBsZWFkaW5nIHRvIGVycm9ycyBmcm9tIG90aGVyCj4gPiBzdWJzeXN0
ZW1zIHdoZW4gdGhleSB0cnkgdG8gYWRkIG5ldyBzeXNmcyBlbnRyaWVzIHRvIHRoZSBDUFUgbm9k
ZS4KPiA+IChlLmcuIHRvcG9sb2d5X3N5c2ZzX2luaXQoKSdzIHVzZSBvZiB0b3BvbG9neV9hZGRf
ZGV2KCkgdmlhIGNwdWhwKQo+ID4KPiA+IFRvIGZpeCB0aGlzLCBwYXJzZSB0aGUgcHJvY2Vzc29y
IGNvbnRhaW5lciBhbmQgY2FsbCBhY3BpX3Byb2Nlc3Nvcl9hZGQoKQo+ID4gZm9yIGVhY2ggcHJv
Y2Vzc29yIHRoYXQgaXMgZGlzY292ZXJlZCBsaWtlIHRoaXMuCj4gCj4gRGlzY292ZXJlZCBsaWtl
IHdoYXQ/Cj4gCj4gPiBUaGUgcHJvY2Vzc29yIGNvbnRhaW5lcgo+ID4gaGFuZGxlciBpcyBhZGRl
ZCB3aXRoIGFjcGlfc2Nhbl9hZGRfaGFuZGxlcigpLCBzbyBubyBkZXRhY2ggY2FsbCB3aWxsCj4g
PiBhcnJpdmUuCj4gCj4gVGhlIGFib3ZlIHJlcXVpcmVzIGNsYXJpZmljYXRpb24gdG9vLgoKVGhl
IGFib3ZlIGNvbW1lbnRzLi4uIHllYS4gQXMgSSBkaWRuJ3Qgd3JpdGUgdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbiwgYnV0CkphbWVzIGRpZCwgYW5kIEphbWVzIGhhcyBiYXNpY2FsbHkgdmFuaXNoZWQs
IEkgZG9uJ3QgdGhpbmsgdGhlc2UgY2FuIGJlCmFuc3dlcmVkLCBzaG9ydCBvZiByZXdyaXRpbmcg
dGhlIGVudGlyZSBjb21taXQgbWVzc2FnZSwgd2l0aCBtZSBzcGVuZGluZwphIGxvdCBvZiB0aW1l
IHdpdGggdGhlIEFDUEkgc3BlY2lmaWNhdGlvbiB0cnlpbmcgdG8gZ2V0IHRoZSB0ZXJtaW5vbG9n
eQpyaWdodCAtIGJlY2F1c2UgYXQgbG90IG9mIHRoZSBhYm92ZSBvbiB0aGUgZmFjZSBvZiBpdCBz
ZWVtcyB0byBiZSB0aGluZ3MKdG8gZG8gd2l0aCB3cm9uZyB0ZXJtaW5vbG9neSBiZWluZyB1c2Vk
LgoKSSB3YXNuJ3QgZXhwZWN0aW5nIHRoaXMgbGV2ZWwgb2YgaXNzdWVzIHdpdGggdGhpcyBwYXRj
aCBzZXQsIGFuZCBJIG5vdwpmZWVsIGNvbXBsZXRlbHkgb3V0IG9mIG15IGRlcHRoIHdpdGggdGhp
cyBzZXJpZXMuIEknbSB3b25kZXJpbmcgd2hldGhlcgpJIHNob3VsZCBldmVuIGNvbnRpbnVlIHdp
dGggaXQsIHNpbmNlIEkgZG9uJ3QgaGF2ZSB0aGUgQUNQSSBrbm93bGVkZ2UKdG8gYWRkcmVzcyBh
IGxvdCBvZiB0aGVzZSBjb21tZW50cy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8v
d3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1i
cHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
