Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B265C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebnN4wp1ECYFT1h+1HaYEu3HuX+9Kd8kMDx/RWCzg8s=; b=xfeiG44O1gwVRH
	6pWnnsB9xYvM7AfJukjWJRMdfbNbgXsagOlhC1k1ELU1PpNGmJvMKrOx7Zz5lpvZe5kOydVMg+VQl
	uc4F4SNP4du991pBQc0E2zlru1FHCLN2jOQHQlgI8/Cu81q/SkcMosv3ued+o4SYqDQhT1ErbYvms
	IfGcX861NjVRnnhW8PxmnwAHFQoSESnQX40rINK1Cb8hAf0Cbh0qVeb/WSCNIIS1X6wbfip9HhtKz
	HnvfUOkt9cLEzS/AFDGjthw9/EtitTpiS0VXGyJ9rDxlv3pWFm9nG2U5V3AjYjxaVRwXGpJYAd+qV
	TeJ0ImD8hapmOCd55LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6d8o-00DiTS-ER; Wed, 29 Jun 2022 19:14:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6d8b-00DiOK-NP; Wed, 29 Jun 2022 19:14:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 151EA1480;
	Wed, 29 Jun 2022 12:14:05 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A06C63F792;
	Wed, 29 Jun 2022 12:14:01 -0700 (PDT)
Date: Wed, 29 Jun 2022 20:12:50 +0100
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
Message-ID: <20220629191250.mg3dybgl6hnlnqee@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184708.x5exgjoy4sblyqml@bogus>
 <88ef07ea-fbde-b997-6c0c-99f5fb7be201@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88ef07ea-fbde-b997-6c0c-99f5fb7be201@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_121409_896362_F425397D 
X-CRM114-Status: GOOD (  26.18  )
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

T24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDY6NTY6MjlQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gT24gMjkvMDYvMjAyMiAxOTo0NywgU3VkZWVwIEhvbGxhIHdy
b3RlOgo+ID4gT24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDY6MTg6MjVQTSArMDAwMCwgQ29ub3Iu
RG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4gT24gMjkvMDYvMjAyMiAxODo0OSwgQ29u
b3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZQo+ID4+Pgo+ID4+PiBPbiAyNy8wNi8yMDIyIDE3OjUwLCBTdWRlZXAgSG9s
bGEgd3JvdGU6Cj4gPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPiA+Pj4+
Cj4gPj4+PiBUaGUgY2FjaGVpbmZvIGlzIG5vdyBpbml0aWFsaXNlZCBlYXJseSBhbG9uZyB3aXRo
IHRoZSBDUFUgdG9wb2xvZ3kKPiA+Pj4+IGluaXRpYWxpc2F0aW9uLiBJbnN0ZWFkIG9mIHJlbHlp
bmcgb24gdGhlIExMQyBJRCBpbmZvcm1hdGlvbiBwYXJzZWQKPiA+Pj4+IHNlcGFyYXRlbHkgb25s
eSB3aXRoIEFDUEkgUFBUVCBlbHNld2hlcmUsIG1pZ3JhdGUgdG8gdXNlIHRoZSBzaW1pbGFyCj4g
Pj4+PiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBjYWNoZWluZm8uCj4gPj4+Pgo+ID4+Pj4gVGhpcyBp
cyBnZW5lcmljIGZvciBib3RoIERUIGFuZCBBQ1BJIHN5c3RlbXMuIFRoZSBBQ1BJIExMQyBJRCBp
bmZvcm1hdGlvbgo+ID4+Pj4gcGFyc2VkIHNlcGFyYXRlbHkgY2FuIG5vdyBiZSByZW1vdmVkIGZy
b20gYXJjaCBzcGVjaWZpYyBjb2RlLgo+ID4+Pgo+ID4+PiBIZXkgU3VkZWVwLAo+ID4+PiBJIGJp
c2VjdGVkIGJyb2tlbiBib290IG9uIFBvbGFyRmlyZSBTb0MgdG8gdGhpcyBwYXRjaCBpbiBuZXh0
LTIwMjIwNjI5IDovCj4gPj4+IEkgc3VzcGVjdCB0aGUgaXNzdWUgaXMgYSBtaXNzaW5nICJuZXh0
LWxldmVsLWNhY2hlIiBpbiB0aGUgdGhlIGR0Ogo+ID4+PiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL21p
Y3JvY2hpcC9tcGZzLmR0c2kKPiA+IAo+ID4gR29vZCB0aGF0IEkgaW5jbHVkZWQgdGhpcyBpbiAt
bmV4dCwgSSBoYWQgbm90IHJlY2VpdmVkIGFueSBmZWVkYmFjayBmcm9tCj4gPiBSSVNDLVYgZXZl
biBhZnRlciA1IGl0ZXJhdGlvbnMuCj4gCj4gSSdsbCBiZSBob25lc3QsIEkgc2F3IHRoZSB0aXRs
ZXMgYW5kIENDIGxpc3QgYW5kIG1hZGUgc29tZSBpbmNvcnJlY3QKPiBhc3N1bXB0aW9ucyBhcyB0
byB3aGV0aGVyIGxvb2tpbmcgYXQgaXQgd2FzIHdvcnRod2hpbGUhIEkgYW0gbm90IGF0Cj4gdGhp
cyBhbGwgdG9vIGxvbmcgYW5kIHdoYXQgaXMvaXNuJ3QgaW1wb3J0YW50IHRvIGxvb2sgYXQgb2Z0
ZW4gaXMgbm90Cj4gb2J2aW91cyB0byBtZS4KCk5vIHdvcnJpZXMsIHRoYXQncyB3aHkgSSB0aG91
Z2h0IGJldHRlciB0byBpbmNsdWRlIGluIC1uZXh0IHRvIGdldCBzb21lCmF0dGVudGlvbiBhbmQg
SSBkaWQgZ2V0IGl0IHRoaXMgdGltZSwgaHVycmF5ISDwn5iECgo+IEJ1dCBoZXksIG91ciBDSSBi
b290cyAtbmV4dCBldmVyeSBkYXkgZm9yIGEgcmVhc29uIDspCj4KCkdvb2QgdG8ga25vdyBhbmQg
dGhhdCBpcyByZWFsbHkgZ3JlYXQuIEFueXdheXMgbGV0IG1lIGtub3cgaWYgdGhlIGRpZmYgSSBz
ZW50CmhlbHBzLiBJIHN0cm9uZ2x5IHN1c3BlY3QgdGhhdCBpcyB0aGUgcmVhc29uLCBidXQgSSBt
YXkgYmUgd3JvbmcuCgo+ID4gSSBhbHNvIHNlZSB0aGlzIERUUyBpcyB2ZXJ5IG9kZC4gSXQgYWxz
bwo+ID4gc3RhdGVzIENQVTAgZG9lc24ndCBoYXZlIEwxLUQkIHdoaWxlIHRoZSBvdGhlciA0IENQ
VXMgaGF2ZSBMMS1EJC4gSXMgdGhhdAo+ID4gYSBtaXN0YWtlIG9yIGlzIGl0IHRoZSByZWFsaXR5
ID8KPiAKPiBBRkFJSywgcmVhbGl0eS4gSXQncyB0aGUgc2FtZSBmb3IgdGhlIFNpRml2ZSBmdTU0
MCAod2l0aCB3aGljaCB0aGlzIHNoYXJlcwo+IGEgY29yZSBjb21wbGV4LiBTZWUgcGFnZSAxMjoK
PiBodHRwczovL3N0YXRpYy5kZXYuc2lmaXZlLmNvbS9GVTU0MC1DMDAwLXYxLjAucGRmCj4gCj4g
PiBBbm90aGVyIGJyZWFrYWdlIGluIHVzZXJzcGFjZSBjYWNoZWluZm8KPiA+IHN5c2ZzIGVudHJ5
IG9mIGNwdTAgaGFzIGJvdGggSSQgYW5kIEQkLgo+IAo+IENvdWxkIHlvdSBjbGFyaWZ5IHdoYXQg
dGhpcyBtZWFucyBwbGVhc2U/CgpJZ25vcmUgbWUgaWYgdGhlIGNwdTAgcmVhbGx5IGRvZXNuJ3Qg
aGF2ZSBMMS1EJC4gSG93ZXZlciB0aGUgdXNlcnNwYWNlCnN5c2ZzIGNhY2hlaW5mbyBpcyBpbmNv
bXBsZXRlIHdpdGhvdXQgbGlua2luZyBMMiwgc28gaXQgY2FuIGJlIGNvbnNpZGVyZWQKYXMgd3Jv
bmcgaW5mbyBwcmVzZW50ZWQgdG8gdGhlIHVzZXIuCgpDaGVjayAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU8bj4vY2FjaGUvaW5kZXg8aT4vKi4KTDIgd29uJ3QgYmUgcHJlc2VudCB0aGVyZSBh
cyB0aGUgbGluayB3aXRoIG5leHQtbGV2ZWwtY2FjaGUgaXMgbWlzc2luZy4KU28gdXNlcnNwYWNl
IGNhbiBpbnRlcnByZXQgdGhpcyBhcyBhYnNlbmNlIG9mIEwyLgoKLS0gClJlZ2FyZHMsClN1ZGVl
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
