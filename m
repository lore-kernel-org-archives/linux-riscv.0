Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C31C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 19:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ci07DDuL42Ta7+3bpSiyk9jp7u4agc1xLfXWoYXU/iQ=; b=tBmfK8lxBy3xwE
	uLYNgzRa1YlR1qkyM0up9v9V+kIPw9ucVCEb3B+Typ8nhomTaaxtwbQSEJUTOfkD7lg+KnR+zHVRr
	I5z1JpHlpjLNDgqD3fHRrYNVSNbeDDbrKiJtO+xbnTigFbgqnTVkQM1hUMzDCOfB5WL2RNe51CclS
	ejJnUvip/Cp/Dr/5ad/yrkNd7E6bwyrpHcwBliR4eoeG743rkiWYkwPkxYCTDgLEBm1nTNJcT6Nry
	MlFNwM4JhAIRrkn62e6WxnzPJJ8PVLc+4CrKLnxz6YmegXYR3zru3fmaq6EMuxol+BcTFcOjxO4Sr
	bMAXa4ayYgsne2xA/FCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dco-00Dpx3-1D; Wed, 29 Jun 2022 19:45:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dcK-00Dpor-Ox; Wed, 29 Jun 2022 19:44:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4A51480;
	Wed, 29 Jun 2022 12:44:51 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0A83F792;
	Wed, 29 Jun 2022 12:44:48 -0700 (PDT)
Date: Wed, 29 Jun 2022 20:43:37 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	atishp@atishpatra.org, atishp@rivosinc.com,
	Sudeep Holla <sudeep.holla@arm.com>, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, wangqing@vivo.com, robh+dt@kernel.org,
	rafael@kernel.org, ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, gshan@redhat.com,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220629194337.3cmrqed2xbalihif@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184708.x5exgjoy4sblyqml@bogus>
 <88ef07ea-fbde-b997-6c0c-99f5fb7be201@microchip.com>
 <20220629191250.mg3dybgl6hnlnqee@bogus>
 <f569aff9-fbe1-66f1-d308-cec428aa5886@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f569aff9-fbe1-66f1-d308-cec428aa5886@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_124452_948585_354E26F7 
X-CRM114-Status: GOOD (  33.99  )
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

T24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDc6MjU6NDFQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gCj4gCj4gT24gMjkvMDYvMjAyMiAyMDoxMiwgU3VkZWVwIEhv
bGxhIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDY6NTY6MjlQTSArMDAwMCwg
Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4gT24gMjkvMDYvMjAyMiAxOTo0
NywgU3VkZWVwIEhvbGxhIHdyb3RlOgo+ID4+PiBPbiBXZWQsIEp1biAyOSwgMjAyMiBhdCAwNjox
ODoyNVBNICswMDAwLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPiA+Pj4+IE9u
IDI5LzA2LzIwMjIgMTg6NDksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4+
Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4+Pj4+Cj4gPj4+Pj4gT24g
MjcvMDYvMjAyMiAxNzo1MCwgU3VkZWVwIEhvbGxhIHdyb3RlOgo+ID4+Pj4+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhlIGNhY2hlaW5mbyBp
cyBub3cgaW5pdGlhbGlzZWQgZWFybHkgYWxvbmcgd2l0aCB0aGUgQ1BVIHRvcG9sb2d5Cj4gPj4+
Pj4+IGluaXRpYWxpc2F0aW9uLiBJbnN0ZWFkIG9mIHJlbHlpbmcgb24gdGhlIExMQyBJRCBpbmZv
cm1hdGlvbiBwYXJzZWQKPiA+Pj4+Pj4gc2VwYXJhdGVseSBvbmx5IHdpdGggQUNQSSBQUFRUIGVs
c2V3aGVyZSwgbWlncmF0ZSB0byB1c2UgdGhlIHNpbWlsYXIKPiA+Pj4+Pj4gaW5mb3JtYXRpb24g
ZnJvbSB0aGUgY2FjaGVpbmZvLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBUaGlzIGlzIGdlbmVyaWMgZm9y
IGJvdGggRFQgYW5kIEFDUEkgc3lzdGVtcy4gVGhlIEFDUEkgTExDIElEIGluZm9ybWF0aW9uCj4g
Pj4+Pj4+IHBhcnNlZCBzZXBhcmF0ZWx5IGNhbiBub3cgYmUgcmVtb3ZlZCBmcm9tIGFyY2ggc3Bl
Y2lmaWMgY29kZS4KPiA+Pj4+Pgo+ID4+Pj4+IEhleSBTdWRlZXAsCj4gPj4+Pj4gSSBiaXNlY3Rl
ZCBicm9rZW4gYm9vdCBvbiBQb2xhckZpcmUgU29DIHRvIHRoaXMgcGF0Y2ggaW4gbmV4dC0yMDIy
MDYyOSA6Lwo+ID4+Pj4+IEkgc3VzcGVjdCB0aGUgaXNzdWUgaXMgYSBtaXNzaW5nICJuZXh0LWxl
dmVsLWNhY2hlIiBpbiB0aGUgdGhlIGR0Ogo+ID4+Pj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvbWlj
cm9jaGlwL21wZnMuZHRzaQo+ID4+Pgo+ID4+PiBHb29kIHRoYXQgSSBpbmNsdWRlZCB0aGlzIGlu
IC1uZXh0LCBJIGhhZCBub3QgcmVjZWl2ZWQgYW55IGZlZWRiYWNrIGZyb20KPiA+Pj4gUklTQy1W
IGV2ZW4gYWZ0ZXIgNSBpdGVyYXRpb25zLgo+ID4+Cj4gPj4gSSdsbCBiZSBob25lc3QsIEkgc2F3
IHRoZSB0aXRsZXMgYW5kIENDIGxpc3QgYW5kIG1hZGUgc29tZSBpbmNvcnJlY3QKPiA+PiBhc3N1
bXB0aW9ucyBhcyB0byB3aGV0aGVyIGxvb2tpbmcgYXQgaXQgd2FzIHdvcnRod2hpbGUhIEkgYW0g
bm90IGF0Cj4gPj4gdGhpcyBhbGwgdG9vIGxvbmcgYW5kIHdoYXQgaXMvaXNuJ3QgaW1wb3J0YW50
IHRvIGxvb2sgYXQgb2Z0ZW4gaXMgbm90Cj4gPj4gb2J2aW91cyB0byBtZS4KPiA+IAo+ID4gTm8g
d29ycmllcywgdGhhdCdzIHdoeSBJIHRob3VnaHQgYmV0dGVyIHRvIGluY2x1ZGUgaW4gLW5leHQg
dG8gZ2V0IHNvbWUKPiA+IGF0dGVudGlvbiBhbmQgSSBkaWQgZ2V0IGl0IHRoaXMgdGltZSwgaHVy
cmF5ISDwn5iECj4gPiAKPiA+PiBCdXQgaGV5LCBvdXIgQ0kgYm9vdHMgLW5leHQgZXZlcnkgZGF5
IGZvciBhIHJlYXNvbiA7KQo+ID4+Cj4gPiAKPiA+IEdvb2QgdG8ga25vdyBhbmQgdGhhdCBpcyBy
ZWFsbHkgZ3JlYXQuIEFueXdheXMgbGV0IG1lIGtub3cgaWYgdGhlIGRpZmYgSSBzZW50Cj4gPiBo
ZWxwcy4gSSBzdHJvbmdseSBzdXNwZWN0IHRoYXQgaXMgdGhlIHJlYXNvbiwgYnV0IEkgbWF5IGJl
IHdyb25nLgo+IAo+IEF5ZSwgSSdsbCBnZXQgYmFjayB0byB5b3Ugb24gdGhhdCBvbmUgaW4gYSBt
b21lbnQgb3IgdHdvCj4KClN1cmUsIHRha2UgeW91ciB0aW1lLgoKPiA+IAo+ID4+PiBJIGFsc28g
c2VlIHRoaXMgRFRTIGlzIHZlcnkgb2RkLiBJdCBhbHNvCj4gPj4+IHN0YXRlcyBDUFUwIGRvZXNu
J3QgaGF2ZSBMMS1EJCB3aGlsZSB0aGUgb3RoZXIgNCBDUFVzIGhhdmUgTDEtRCQuIElzIHRoYXQK
PiA+Pj4gYSBtaXN0YWtlIG9yIGlzIGl0IHRoZSByZWFsaXR5ID8KPiA+Pgo+ID4+IEFGQUlLLCBy
ZWFsaXR5LiBJdCdzIHRoZSBzYW1lIGZvciB0aGUgU2lGaXZlIGZ1NTQwICh3aXRoIHdoaWNoIHRo
aXMgc2hhcmVzCj4gPj4gYSBjb3JlIGNvbXBsZXguIFNlZSBwYWdlIDEyOgo+ID4+IGh0dHBzOi8v
c3RhdGljLmRldi5zaWZpdmUuY29tL0ZVNTQwLUMwMDAtdjEuMC5wZGYKPiA+Pgo+ID4+PiBBbm90
aGVyIGJyZWFrYWdlIGluIHVzZXJzcGFjZSBjYWNoZWluZm8KPiA+Pj4gc3lzZnMgZW50cnkgb2Yg
Y3B1MCBoYXMgYm90aCBJJCBhbmQgRCQuCj4gPj4KPiA+PiBDb3VsZCB5b3UgY2xhcmlmeSB3aGF0
IHRoaXMgbWVhbnMgcGxlYXNlPwo+ID4gCj4gPiBJZ25vcmUgbWUgaWYgdGhlIGNwdTAgcmVhbGx5
IGRvZXNuJ3QgaGF2ZSBMMS1EJC4gSG93ZXZlciB0aGUgdXNlcnNwYWNlCj4gPiBzeXNmcyBjYWNo
ZWluZm8gaXMgaW5jb21wbGV0ZSB3aXRob3V0IGxpbmtpbmcgTDIsIHNvIGl0IGNhbiBiZSBjb25z
aWRlcmVkCj4gPiBhcyB3cm9uZyBpbmZvIHByZXNlbnRlZCB0byB0aGUgdXNlci4KPiAKPiBZZWFo
LCBJJ2xsIHNlbmQgYSBwYXRjaCBob29raW5nIHVwIHRoZSBMMi4KPiBJdCB3YXNuJ3QgaW4gdGhl
IGluaXRpYWwgZnU1NDAgZHRzaSBzbyBJIGd1ZXNzIGl0IHdhcyBhZGRlZCBhZnRlciB0aGUKPiBp
bml0aWFsIGR0cyBmb3IgbXkgc3R1ZmYgd2FzIGNyZWF0ZWQgYmFzZWQgb24gdGhhdC4KPgoKVGhh
bmtzIQoKPiA+IAo+ID4gQ2hlY2sgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1PG4+L2NhY2hl
L2luZGV4PGk+LyouCj4gPiBMMiB3b24ndCBiZSBwcmVzZW50IHRoZXJlIGFzIHRoZSBsaW5rIHdp
dGggbmV4dC1sZXZlbC1jYWNoZSBpcyBtaXNzaW5nLgo+ID4gU28gdXNlcnNwYWNlIGNhbiBpbnRl
cnByZXQgdGhpcyBhcyBhYnNlbmNlIG9mIEwyLgo+ID4gCj4gCj4gIyBjYXQgL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MC9jYWNoZS9pbmRleDAvCj4gY29oZXJlbmN5X2xpbmVfc2l6ZSAgICBz
aGFyZWRfY3B1X2xpc3QgICAgICAgIHR5cGUKPiBsZXZlbCAgICAgICAgICAgICAgICAgIHNoYXJl
ZF9jcHVfbWFwICAgICAgICAgdWV2ZW50Cj4gbnVtYmVyX29mX3NldHMgICAgICAgICBzaXplICAg
ICAgICAgICAgICAgICAgIHdheXNfb2ZfYXNzb2NpYXRpdml0eQo+ICMgbHMgL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MC9jYWNoZS8KPiBpbmRleDAgIGluZGV4MSAgdWV2ZW50Cj4gIyBjYXQg
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MC9jYWNoZS9pbmRleDAvbGV2ZWwgCj4gMQo+ICMg
Y2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY2FjaGUvaW5kZXgxL2xldmVsIAo+IDEK
PgpJZGVhbGx5IHRoZXJlIG11c3QgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ki9jYWNoZS9p
bmRleDIvbGV2ZWwKd2hpY2ggcmVhZHMgMiBvbmNlIHlvdSBsaW5rIGl0IGluIHRoZSBEVC4KCj4g
Y3B1MCBpcyAvbm90LyB0aGUgb25lIHdpdGggb25seSBpbnN0cnVjdGlvbiBjYWNoZSwgdGhhdCBp
cyBub3QKPiBydW5uaW5nIExpbnV4LgoKQWgsIHNvIHRoZXJlIExpbnV4IHJ1bnMgb25seSBvbiBj
cHUgMS00ID8KCi0tIApSZWdhcmRzLApTdWRlZXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
