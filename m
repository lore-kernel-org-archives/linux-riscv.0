Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7BAC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xn69+TWlpZ79FmFVismh61c5NDLGhYpXGUAQtMv1Rs0=; b=V94xyhJ9N6JXcW
	F6+ZLWHLAR8IzvktPWCZwCr/5G0ksweFpQ0p4n3P89rsdxJKtuu7GLN5pDg6CGCpkTRZM0DCGs//I
	EoQYMJqgJjFawvwIv4A0V6rSqcSkPH7VpJnM3PcjjlT8DjmL56xyOFj435YstKsdUi9QsDyJIF4W4
	DKEQ0XDy/vJ31DKXgxbmcIDjz+o0GN5DQq33eVjrhWunzWAXLcpijqqtd5WbRckvZ1J0zcXtoM+qK
	nUpH4/8HrCCoKLE4senwoWy3xsRPXtkcotnbho+or+NvY0rC8A4Ac2O2W+6hlUNSi+FYKwKJlu9Rn
	R5S+mJMy3zIfpIpFPJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADbN-005HnG-2H;
	Mon, 04 Dec 2023 18:23:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADbI-005Hkt-1N;
	Mon, 04 Dec 2023 18:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OVfC8HmVSUtxQSExvUxbBU1pNZlzr2LJhw+rAKbX5PE=; b=yocSKJDCG9Uq3lu3L6Vrl+Aa1r
	hRWP9mRlH8sq12iLzchSEn00N5gmtrXOrFxLBNbR5mZygwpfm35B6cyE+GVr+/PzVFYlmkHqrAwvr
	iIE5YHq2YvOTv8yWAuDG1g2luAQ9ig0vVnSn7XLSMu+D7/SPDmP2V78Fe3cj5XQug/dcyZ2X+MlNr
	pLAJlYa5DIv3yhIoRvY18doA0PBzavkAmkkl8VLUKq+nG7ker/GZ8/nnZqdFecoAx0X10dVEH0AW0
	6cGst5/hVpu9tiNV+37ht5O02SqHfmN5alCAKSWBmod/hT3V7vYe9wq3qzhqKiISEDdpBQBQZbYTI
	w96wF+BQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rADay-0005sX-2j;
	Mon, 04 Dec 2023 18:23:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rADaw-0000tZ-LP; Mon, 04 Dec 2023 18:23:02 +0000
Date: Mon, 4 Dec 2023 18:23:02 +0000
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
Message-ID: <ZW4ZBkj2oCmxv55T@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_102324_465443_05B0527D 
X-CRM114-Status: GOOD (  43.92  )
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
SSBjYW4gc2F5IHJpZ2h0IG5vdywgdGhpcyBpcwo+IG5vdCBsb29raW5nIGdvb2QuCgpIaSBSYWZh
ZWwsCgpXaWxsIHlvdSBiZSBhYmxlIHRvIHNlbmQgeW91ciBjb21tZW50cywgc28gdGhhdCB3ZSBj
YW4gZmluZCBvdXQgd2hhdAp5b3VyIG90aGVyIGNvbmNlcm5zIGFyZSBwbGVhc2U/IEknbSBnZXR0
aW5nIHF1ZXN0aW9ucyBmcm9tIGludGVyZXN0ZWQKcGFydGllcyB3aG8gd2FudCB0byBrbm93IHdo
YXQgeW91ciBjb25jZXJucyBhcmUuCgpOb3RoaW5nIG11Y2ggaGFzIGNoYW5nZWQgdG8gdGhlIEFD
UEkgY2hhbmdlcywgc28gSSB0aGluayBpdCdzIHN0aWxsCnZhbGlkIHRvIGhhdmUgdGhlIGNvbW1l
bnRzIGJhY2sgZm9yIHRoaXMuCgpUaGFua3MuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRw
czovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEg
ODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
