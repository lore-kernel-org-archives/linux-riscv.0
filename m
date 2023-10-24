Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61B1C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 19:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53WVK/XcapXDMRonB3xOdx/EIFRIdvR3e/D9f2dgTvc=; b=Nhkk0bvqYIYeLa
	STsEgpUz2pf5D6Ts3HqQQ3fKTHZ6/KdVP/h8ASXShLgIacEX61IS4GjE3I69vDLyj+f0qk2LSVQ2D
	37b8mwVpXglUWpJBv15k9ibnnAyEk4wv2RfEnAt86HQKDWv98hXfRc8MdmbJ+fsouqHc9RQwVWURf
	LENQvhTzU1GesWgdp5WEKFAjfJjzN3oaE73RDh6M5MeMQWQY00iMrysMj86bp+s9N6ZkMAYvMt56V
	s2DSteZ20F3w/zwNFvG/HYzKAe6updP/V+ymhVTYFW5jivgzU3eefxwK0nZDhMUL2THyUuJfhxJUF
	RE1Jzhhi2X9/hzSGWUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvN5P-00AkbH-2V;
	Tue, 24 Oct 2023 19:29:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvN5L-00AkaD-2J;
	Tue, 24 Oct 2023 19:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4y6l7G1s0Dqeh+0zp9FkvmwtEOSFGk+0AxUmVITMGPU=; b=DtkWRF3bmONSx32KVn6ChvxqI2
	u16XWvdfg/5pScH/5dNy7MZzEuQM6lSUzqd632z1Ah6E0EXL0ZDVxeNrjefPodzVuHe8LE30ZUOxc
	ynQdnLV6CRnNzRke0MCL1Dsm3nCLqUX500XhUr0pRHQsjzRcIJS6tPIGxJfePtgxo5h6+HqithRzO
	ME7uEgNuCsnLh/16YcmBRUCb1HSbefoNKFgjh9sok9tyCuiBOmle2d/zkCDTk438cLD03S2yBO8bL
	sGnAoFnOhJr91vckXF5qi2Q/jfyomzUMGuw1rIWP6pD1VltxAlpxOTCoiIQYP90MMgcgDaVNQtEqe
	b/akFbdA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48356)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qvN5B-0004q9-0c;
	Tue, 24 Oct 2023 20:28:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qvN58-0006FV-Kl; Tue, 24 Oct 2023 20:28:50 +0100
Date: Tue, 24 Oct 2023 20:28:50 +0100
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
Subject: Re: [RFC PATCH v3 00/39] ACPI/arm64: add support for virtual
 cpuhotplug
Message-ID: <ZTga8sDSJ+Tg80Fs@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_122903_755269_8B18ADE3 
X-CRM114-Status: GOOD (  44.60  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMDg6MjY6NThQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNToxNeKAr1BNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IEhpLAo+
ID4KPiA+IEknbSBwb3N0aW5nIEphbWVzJyBwYXRjaCBzZXQgdXBkYXRlZCB3aXRoIG1vc3Qgb2Yg
dGhlIHJldmlldyBjb21tZW50cwo+ID4gZnJvbSBoaXMgUkZDIHYyIHNlcmllcyBiYWNrIGluIFNl
cHRlbWJlci4gSW5kaXZpZHVhbCBwYXRjaGVzIGhhdmUgYQo+ID4gY2hhbmdlbG9nIGF0dGFjaGVk
IGF0IHRoZSBib3R0b20gb2YgdGhlIGNvbW1pdCBtZXNzYWdlLiBUaG9zZSB3aGljaAo+ID4gSSBo
YXZlIGZpbmlzaGVkIHVwZGF0aW5nIGhhdmUgbXkgUy1vLWIgb24gdGhlbSwgdGhvc2Ugd2hpY2gg
c3RpbGwgaGF2ZQo+ID4gb3V0c3RhbmRpbmcgcmV2aWV3IGNvbW1lbnRzIGZyb20gUkZDIHYyIGRv
IG5vdC4gSW4gc29tZSBvZiB0aGVzZSBjYXNlcwo+ID4gSSd2ZSBhc2tlZCBxdWVzdGlvbnMgYW5k
IGFtIHdhaXRpbmcgZm9yIHJlc3BvbnNlcy4KPiA+Cj4gPiBJJ20gcG9zdGluZyB0aGlzIGFzIFJG
QyB2MyBiZWNhdXNlIHRoZXJlJ3Mgc3RpbGwgc29tZSB1bmFkZHJlc3NlZAo+ID4gY29tbWVudHMg
YW5kIGl0J3MgY2xlYXJseSBub3QgcmVhZHkgZm9yIG1lcmdpbmcuIEV2ZW4gaWYgaXQgd2FzIHJl
YWR5Cj4gPiB0byBiZSBtZXJnZWQsIGl0IGlzIHRvbyBsYXRlIGluIHRoaXMgZGV2ZWxvcG1lbnQg
Y3ljbGUgdG8gYmUgdGFraW5nCj4gPiB0aGlzIGNoYW5nZSBpbiwgc28gdGhlcmUgd291bGQgYmUg
bGl0dGxlIHBvaW50IHBvc3RpbmcgaXQgbm9uLVJGQy4KPiA+IEFsc28gSmFtZXMgc3RhdGVkIHRo
YXQgaGUncyB3YWl0aW5nIGZvciBjb25maXJtYXRpb24gZnJvbSB0aGUKPiA+IEt1YmVybmV0ZXMv
S2F0YSBmb2xrIC0gSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGUgc3RhdHVzIGlzIHRoZXJlLgo+ID4K
PiA+IEkgd2lsbCBiZSBzZW5kaW5nIGVhY2ggcGF0Y2ggaW5kaXZpZHVhbGx5IHRvIGEgd2lkZXIg
YXVkaWVuY2UKPiA+IGFwcHJvcHJpYXRlIGZvciB0aGF0IHBhdGNoIC0gYXBvbG9naWVzIHRvIHRo
b3NlIG1pc3Npbmcgb3V0IG9uIHRoaXMKPiA+IGNvdmVyIG1lc3NhZ2UuIEkgaGF2ZSBhZGRlZCBt
b3JlIG1haWxpbmcgbGlzdHMgdG8gdGhlIHNlcmllcyB3aXRoIHRoZQo+ID4gZXhjZXB0aW9uIG9m
IHRoZSBhY3BpY2EgbGlzdCBpbiBhIGhvcGUgb2YgdGhpcyBjb3ZlciBtZXNzYWdlIGFsc28KPiA+
IHJlYWNoaW5nIHRob3NlIGZvbGsuCj4gPgo+ID4gVGhlIGNoYW5nZXMgdGhhdCBhcmVuJ3QgaW5j
bHVkZWQgYXJlOgo+ID4KPiA+IDEuIFVwZGF0ZXMgZm9yIG15IHBhdGNoIHRoYXQgd2FzIG1lcmdl
ZCB2aWEgVGhvbWFzICh0aGFua3MhKToKPiA+ICAgIGM0ZGQ4NTRmNzQwYyBjcHUtaG90cGx1Zzog
UHJvdmlkZSBwcm90b3R5cGVzIGZvciBhcmNoIENQVSByZWdpc3RyYXRpb24KPiA+ICAgIHJhdGhl
ciB0aGFuIGhhdmluZyB0aGlzIGNoYW5nZSBzcHJlYWQgdGhyb3VnaCBKYW1lcycgcGF0Y2hlcy4K
PiA+Cj4gPiAyLiBOZXcgcGF0Y2ggLSBzaW1wbGlmaWNhdGlvbiBvZiBQQS1SSVNDJ3Mgc21wX3By
ZXBhcmVfYm9vdF9jcHUoKQo+ID4KPiA+IDMuIE1vdmVkICJBQ1BJOiBVc2UgdGhlIGFjcGlfZGV2
aWNlX2lzX3ByZXNlbnQoKSBoZWxwZXIgaW4gbW9yZSBwbGFjZXMiCj4gPiAgICBhbmQgIkFDUEk6
IFJlbmFtZSBhY3BpX3NjYW5fZGV2aWNlX25vdF9wcmVzZW50KCkgdG8gYmUgYWJvdXQKPiA+ICAg
IGVudW1lcmF0aW9uIiB0byB0aGUgYmVnaW5uaW5nIG9mIHRoZSBzZXJpZXMgLSB0aGVzZSB0d28g
cGF0Y2hlcyBhcmUKPiA+ICAgIGFscmVhZHkgcXVldWVkIHVwIGZvciBtZXJnaW5nIGludG8gNi43
Lgo+ID4KPiA+IDQuIE1vdmVkICJhcm02NCwgaXJxY2hpcC9naWMtdjMsIEFDUEk6IE1vdmUgTUFE
VCBHSUNDIGVuYWJsZWQgY2hlY2sgaW50bwo+ID4gICAgYSBoZWxwZXIiIHRvIHRoZSBiZWdpbm5p
bmcgb2YgdGhlIHNlcmllcywgd2hpY2ggaGFzIGJlZW4gc3VibWl0dGVkLAo+ID4gICAgYnV0IGFz
IHlldCB0aGUgZmF0ZSBvZiB0aGF0IHBvc3RpbmcgaXNuJ3Qga25vd24uCj4gPgo+ID4gVGhlIGZp
cnN0IGZvdXIgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBhcmUgcHJvdmlkZWQgZm9yIGNvbXBsZXRu
ZXNzIG9ubHkuCj4gPgo+ID4gVGhlcmUgaXMgYW4gYWRkaXRpb25hbCBwYXRjaCBpbiBKYW1lcycg
Z2l0IHRyZWUgdGhhdCBpc24ndCBpbiB0aGUgc2V0Cj4gPiBvZiBwYXRjaGVzIHRoYXQgSmFtZXMg
cG9zdGVkOiAiQUNQSTogcHJvY2Vzc29yOiBPbmx5IGNhbGwKPiA+IGFyY2hfdW5yZWdpc3Rlcl9j
cHUoKSBpZiBIT1RQTFVHX0NQVSBpcyBzZWxlY3RlZCIgd2hpY2ggbG9va3MgdG8gbWUgdG8KPiA+
IGJlIGEgd29ya2Fyb3VuZCBmb3IgYXJjaF91bnJlZ2lzdGVyX2NwdSgpIGJlaW5nIHVuZGVyIHRo
ZSBpZmRlZi4gSSd2ZQo+ID4gY29tbWVudGVkIG9uIHRoaXMgb24gdGhlIFJGQyB2MiBwb3N0aW5n
IG1ha2luZyBhIHN1Z2dlc3Rpb24sIGJ1dCBhcyB5ZXQKPiA+IGhhdmVuJ3QgaGFkIGFueSByZXNw
b25zZS4KPiA+Cj4gPiBJJ3ZlIGluY2x1ZGVkIGFsbW9zdCBhbGwgb2YgSmFtZXMnIG9yaWdpbmFs
IGNvdmVyaW5nIGJvZHkgYmVsb3cgdGhlCj4gPiBkaWZmc3RhdC4KPiA+Cj4gPiBUaGUgcmVhc29u
IHRoYXQgSSdtIGRvaW5nIHRoaXMgaXMgdG8gaGVscCBtb3ZlIHRoaXMgY29kZSBmb3J3YXJkIHNv
Cj4gPiBob3BlZnVsbHkgaXQgY2FuIGJlIG1lcmdlZCAtIHdoaWNoIGlzIHdoeSBJIGhhdmUgYmVl
biBrZWVuIHRvIGRpZyBvdXQKPiA+IGZyb20gSmFtZXMnIHBhdGNoZXMgYW55dGhpbmcgdGhhdCBj
YW4gYmUgbWVyZ2VkIGFuZCBzdWJtaXQgaXQKPiA+IHNlcGFyYXRlbHksIHNpbmNlIHRoaXMgaXMg
YSBmZWF0dXJlIGZvciB3aGljaCBzb21lIHVzZXJzIGhhdmUgYQo+ID4gZGVmaW5pdGUgbmVlZCBm
b3IuCj4gCj4gSSd2ZSBnb25lIHRocm91Z2ggdGhlIHNlcmllcyBhbmQgdGhlcmUgaXMgYXQgbGVh
c3Qgb25lIHRoaW5nIGluIGl0Cj4gdGhhdCBjb25jZXJucyBtZSBhIGxvdCBhbmQgc29tZSBvdGhl
cnMgdGhhdCBhdCBsZWFzdCBhcHBlYXIgdG8gYmUKPiByZWFsbHkgcXVlc3Rpb25hYmxlLgo+IAo+
IEkgbmVlZCBtb3JlIHRpbWUgdG8gc2VuZCBjb21tZW50cyB3aGljaCBJJ20gbm90IGdvaW5nIHRv
IGRvIGJlZm9yZSB0aGUKPiA2LjcgbWVyZ2Ugd2luZG93IChzb3JyeSksIGJ1dCBmcm9tIHdoYXQg
SSBjYW4gc2F5IHJpZ2h0IG5vdywgdGhpcyBpcwo+IG5vdCBsb29raW5nIGdvb2QuCgpUaGFua3Mg
Zm9yIGhhdmluZyBhIGxvb2sgLSB0aGVyZSB3YXMgdGhlIGZlZWxpbmcgdGhhdCB0aGlzIHdhcyBy
ZWFkeQpmb3IgbWVyZ2luZyBiYXNlZCBvbiB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gdGhlIHBy
ZXZpb3VzIHNlcmllcyBzZW50CmJ5IEphbWVzLgoKSG93ZXZlciwgd2hlbiBJIHNlbnQgdGhpcyBz
ZXJpZXMsIEkgZGlkIG5vdGljZSB0aGF0IHNvbWUgbWFpbGluZyBsaXN0cwp3ZXJlIG1pc3Npbmcs
IHNvIEkgZ3Vlc3MgdGhhdCdzIGNvdWxkIGJlIHdoeSB5b3UgaGF2ZW4ndCBjb21tZW50ZWQKYmVm
b3JlLCBhbmQgd2UgZmluZCBvdXQgbm93IHRoYXQgdGhlcmUgYXJlIG1ham9yIGNvbmNlcm5zLgoK
TXkgaW50ZXJlc3QgaW4gaXQgaXMgYmVjYXVzZSBteSBlbXBsb3llciB3YW50cyB0byBiZSBhYmxl
IHRvIGhvdHBsdWcKQ1BVcyBpbiBhIHZpcnR1YWwgbWFjaGluZSwgYW5kIHRoaXMgc2FnYSB3aXRo
IGFhcmNoNjQgaGFzIGJlZW4gcnVubmluZwpmb3IgeWVhcnMgd2l0aCBkaWZmZXJlbnQgYXBwcm9h
Y2hlcyBlbmRpbmcgdXAgZGVhZCBpbiB0aGUgd2F0ZXIuIEkKaG9wZSB5b3VyIGNvbmNlcm5zIGRv
IG5vdCByZXN1bHQgaW4gdGhpcyBhcHByb2FjaCBiZWluZyBlbnRpcmVseQpzY3JhcHBlZCwgYW5k
IHRoZXJlIGNhbiBiZSBzb21lIHNvbHV0aW9uIGZvdW5kLgoKSSB0aGluayBKYW1lcyBNb3JzZSB3
aWxsIG5lZWQgdG8gYmUgaW52b2x2ZWQgaW4gYWRkcmVzc2luZyB5b3VyCmNvbmNlcm5zIHNpbmNl
IGhlIGhhcyB0aGUgZGV0YWlsZWQgYmFja2dyb3VuZCBhYm91dCB0aGUgaGlzdG9yeSBvZgp0aGlz
IHNlcmllcy4gSG93ZXZlciwgSmFtZXMgc2VlbWVkIHRvIGZhbGwgdG90YWxseSBzaWxlbnQgYWZ0
ZXIgdGhlCmxhc3QgcG9zdGluZyBiYWNrIGluIFNlcHRlbWJlciwgc28gd2hldGhlciB0aGF0IGlz
IHBvc3NpYmxlIGlzCmN1cnJlbnRseSB1bmtub3duLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTog
aHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhl
cmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
