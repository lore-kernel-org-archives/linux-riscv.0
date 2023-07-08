Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D391FEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0+G+l9/NG+TDbhZ/7jekSEjMex7TcEchYZOER/oevM=; b=nxRIzuTMqB/S2j
	GAqkUCY3dAaB3vewnu7M4SZ5RxkVkzSVaV7ooKsda0KCtMstcFDUHrmP5N/98ILFjdMO3mpL8wJHq
	z3oQcizx4/81LVutSwTA3t3pcCdoCq4lhM8LsFoB+KR/0nLTL/TTNeWZZDZLxqB3rnXzMJrFFnTyX
	kl0mINesS3YNDLt/gu1jTbVpzlPovvPCuwD6eYlVSLBzXil0j8nuLYYsdAhX0fbZ93fuSTljvupxh
	qTYRixAyOnCg1VYZizBcBrJj2ds2wfFM/v8T4TqZXJSWsHSS2AM+Q/ExX8k7sNJcLU6RTCD4BMApw
	o2Q8Qb+PfUeu6KqS2j1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qI30l-006oOP-2Y;
	Sat, 08 Jul 2023 08:09:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qI30i-006oNl-1E
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 08:09:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B86460B42;
	Sat,  8 Jul 2023 08:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5A8C433C8;
	Sat,  8 Jul 2023 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688803779;
	bh=hMxDvTSCmpzzyFQNw140/iCDQpgewmXQyl9v5IUyvvk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YXllSzrD6dh7bm3E7O+yNPQgCySArB5BoefZ0+HaBR+r+LW3Xn/GoxfzCbdGKvUYH
	 KWK8h+NdoSX7r6M9RQXeVw7rpl6LPmhDX2V3J1zVyTkpcmhxvkkf12matpiponyZ+M
	 QWGyrXIFPTV5uvgCVNLHC2FRlixL/PPN1ycrYmmdyrEsrHGlGEFk05tvkBhRxglsOG
	 Bc6MuV4fwCyxMwCtskQWwAfD2bReMSyUl++5AlpVP9f86EOlKrEixjCPtro4Be4aXx
	 7kyJ9ZGizQtWNJvf/AjalMnxNql+Gkk/e2yuJ17dqGI9aeIo9t+AnusGY7L0eVzKIE
	 tC8cMmdat9qKA==
Date: Sat, 08 Jul 2023 09:09:36 +0100
From: Conor Dooley <conor@kernel.org>
To: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>,
 =?UTF-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>
Subject: =?US-ASCII?Q?Re=3A_=5BExternal=5D_Re=3A_=5BPATCH_v3_4/4=5D_dt-bin?= =?US-ASCII?Q?dings=3A_firmware=3A_Document_ffitbl_binding?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAEEQ3wkgxagOPYrg3g8apLHHDOcAR3hFKpHA3ZQDm9PKvO1xUg@mail.gmail.com>
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <20230705114251.661-5-cuiyunhui@bytedance.com> <20230707-brigade-myth-86ee252b2e4a@spud> <CAN3iYbP_dQOOJKLjAf+pVeYUZRBqwZBG7eq6=pR0upsjT2GpOA@mail.gmail.com> <CAEEQ3wkgxagOPYrg3g8apLHHDOcAR3hFKpHA3ZQDm9PKvO1xUg@mail.gmail.com>
Message-ID: <FEAC0857-A90B-42EC-A426-09AF3C9F463D@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_010944_526098_075E66FD 
X-CRM114-Status: GOOD (  26.49  )
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
Cc: mark.rutland@arm.com, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA4IEp1bHkgMjAyMyAwNDowNDowNSBJU1QsICLov5DovonltJQiIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj5IaSBDb25vciwKPgo+T24gU2F0LCBKdWwgOCwgMjAyMyBhdCAx
Mjo1M+KAr0FNIOiRm+Wjq+W7uiA8Z2VzaGlqaWFuQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Pgo+
Pgo+Pgo+Pgo+PiBPbiBTYXQsIEp1bCA4LCAyMDIzIGF0IDEyOjE24oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+Cj4+PiBIZXksCj4+Pgo+Pj4gT24gV2VkLCBK
dWwgMDUsIDIwMjMgYXQgMDc6NDI6NTFQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPj4+ID4g
QWRkIHRoZSBkZXNjcmlwdGlvbiBmb3IgZmZpdGJsIHN1Ym5vZGUuCj4+PiA+Cj4+PiA+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+Pj4gPiAtLS0K
Pj4+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQgICB8IDI3
ICsrKysrKysrKysrKysrKysrKysKPj4+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKPj4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKQo+Pj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4+PiA+Cj4+PiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4+PiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzQyMzY4NjI2
MTk5Cj4+PiA+IC0tLSAvZGV2L251bGwKPj4+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQKPj4+ID4gQEAgLTAsMCArMSwyNyBAQAo+
Pj4gPiArRkZJKEZEVCBGSVJNV0FSRSBJTlRFUkZBQ0UpIGRyaXZlcgo+Pj4gPiArCj4+PiA+ICtS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+Pj4gPiArIC0gZW50cnkgICAgICAgICAgICAgOiBhY3BpIG9y
IHNtYmlvcyByb290IHBvaW50ZXIsIHU2NAo+Pj4gPiArIC0gcmVnICAgICAgICAgICAgICAgICAg
ICAgICA6IGFjcGkgb3Igc21iaW9zIHZlcnNpb24sIHUzMgo+Pj4gPiArCj4+PiA+ICtTb21lIGJv
b3Rsb2FkZXJzLCBzdWNoIGFzIENvcmVib290IGRvIG5vdCBzdXBwb3J0IEVGSSwKPj4+ID4gK29u
bHkgZGV2aWNldHJlZSBhbmQgc29tZSBhcmNoZXMgZG8gbm90IGhhdmUgYSByZXNlcnZlZAo+Pj4g
PiArYWRkcmVzcyBzZWdtZW50LiBBZGQgImZmaXRibCIgc3Vibm9kZSB0byBvYnRhaW4gQUNQSSBS
U0RQCj4+PiA+ICthbmQgU01CSU9TIGVudHJ5Lgo+Pj4KPj4+IFNpbmNlIHRoZSBjb252ZXJzYXRp
b24gb24gdGhpcyBzdHVmZiBhbGwgc2VlbXMgdG8gYmUgZ29pbmcgYWJzb2x1dGVseQo+Pj4gbm93
aGVyZSwgdGhlIEFDUEkgcG9ydGlvbiBvZiB0aGlzIGlzIGludGVuZGVkIGZvciB1c2Ugb24gUklT
Qy1WIGluCj4+PiB2aW9sYXRpb24gb2YgdGhlIFJJU0MtViBBQ1BJIHNwZWNzLiBJdCBhbHNvIGdv
ZXMgYWdhaW5zdCB0aGUKPj4+IHJlcXVpcmVtZW50cyBvZiB0aGUgcGxhdGZvcm0gc3BlYy4gUXVv
dGluZyBmcm9tIFsxXToKPj4+Cj4+PiB8ID4gSnVzdCBzbyB3ZSdyZSBhbGwgb24gdGhlIHNhbWUg
cGFnZSwgSSBqdXN0IG5vdyBhc2tlZCBNYXJrIEhpbWVsc3RlaW4KPj4+IHwgPiBvZiBSSVNDLVYg
SW50ZXJuYXRpb25hbCBpZiB0aGVyZSBpcyBhbnl0aGluZyBpbiBSSVNDLVYgc3RhbmRhcmRzIHRo
YXQKPj4+IHwgPiByZXF1aXJlcyBVRUZJLCBhbmQgdGhlIGFuc3dlciBpcyBhIHNvbGlkICJuby4i
Cj4+PiB8Cj4+PiB8IEh1aD8gRmlyc3RseSwgcnVubmluZyBvZmYgdG8gaW52b2tlIFJWSSBpcyBu
b3QgcHJvZHVjdGl2ZSAtIHRoZXkgZG9uJ3QKPj4+IHwgbWFpbnRhaW4gdGhlIHZhcmlvdXMgb3Bl
cmF0aW5nIHN5c3RlbSBrZXJuZWxzIGV0Yy4KPj4+IHwgU2Vjb25kbHksIHRoYXQgZG9lcyBub3Qg
c2VlbSB0byBiZSB0cnVlLiBUaGUgcGxhdGZvcm0gc3BlYyBtYW5kYXRlcyBVRUZJCj4+PiB8IGZv
ciB0aGUgT1MtQSBzZXJ2ZXIgcGxhdGZvcm0sIGFsb25nc2lkZSBBQ1BJOgo+Pj4gfCBodHRwczov
L2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcGxhdGZvcm0tc3BlY3MvYmxvYi9tYWluL3Jpc2N2LXBs
YXRmb3JtLXNwZWMuYWRvYyMzMi1ib290LXByb2Nlc3MKPj4+IHwgYW5kIHRoZSBPUy1BIGVtYmVk
ZGVkIHBsYXRmb3JtIG5lZWRzIHRvIGNvbXBseSB3aXRoIEVCQlIgJiB1c2UgRFQ6Cj4+PiB8IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1wbGF0Zm9ybS1zcGVjcy9ibG9iL21haW4vcmlz
Y3YtcGxhdGZvcm0tc3BlYy5hZG9jIzMyLWJvb3QtcHJvY2Vzcwo+Pj4gfAo+Pj4gfCBFQkJSIGRv
ZXMgc2F5IHRoYXQgc3lzdGVtcyBtdXN0IG5vdCBwcm92aWRlIGJvdGggQUNQSSBhbmQgRFQgdG8g
dGhlIE9TCj4+PiB8IGxvYWRlciwgYnV0IEkgYW0gZmFyIGZyb20gYW4gZXhwZXJ0IG9uIHRoZXNl
IGtpbmQgb2YgdGhpbmdzICYgYW0gbm90Cj4+PiB8IHN1cmUgd2hlcmUgc29tZXRoaW5nIGxpa2Ug
dGhpcyB3aGVyZSB0aGUgRFQgImNvbnRhaW5zIiBBQ1BJIHdvdWxkIHN0YW5kLgo+Pj4gfAo+Pj4g
fCBUaGUgUklTQy1WIEFDUEkgc3BlYyBhbHNvIHNheXMgIlVFRkkgZmlybXdhcmUgaXMgbWFuZGF0
b3J5IHRvIHN1cHBvcnQKPj4+IHwgQUNQSSI6Cj4+PiB8IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di1ub24taXNhL3Jpc2N2LWFjcGkvYmxvYi9tYXN0ZXIvcmlzY3YtYWNwaS1ndWlkYW5jZS5hZG9j
Cj4+Cj4+ICBVRUZJIGZpcm13YXJlIGlzIG1hbmRhdG9yeSB0byBzdXBwb3J0IEFDUEkgYW5kIGNv
cmVib290IGlzIGFuIG9wdGlvbiB0byBzdXBwb3J0IEFDUEkgYXMgd2VsbC4gaSB0aGluayBpdCB3
b3JrcyB3ZWxsIGZvciBib3RoLCBJIGRvbid0IHRoaW5rIFVFRkkgYW5kIEFDUEkgbmVlZCB0byBi
ZSBiaW5kaW5nIHRvZ2V0aGVyLCBlYWNoIFVFRkkgYW5kIEFDUEkgYWxzbyB3b3JrcyB3ZWxsIHdp
dGggb3RoZXIgc29sdXRpb25zLgo+Cj5UaGFua3MgZm9yIHNoaWppYW4oTmlsbCkncyBzdWdnZXN0
aW9ucy4KPgo+SGkgQ29ub3IsCj5UaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHZhbHVhYmxl
IGNvbW1lbnRzIG9uIHRoaXMgc2V0IG9mIHBhdGNoCj5jb2Rlcywgd2hpY2ggYXJlIHZlcnkgaGVs
cGZ1bC4KPgo+SnVkZ2luZyBmcm9tIHRoZSBjdXJyZW50IHNwZWNpZmljYXRpb25zLCBtYXliZSB5
ZXMsIHlvdSBjYW4gTkFDSywgYnV0Cj5pdCdzIGJldHRlciBub3QgdG8gcnVzaCB0byBjb25jbHVz
aW9ucy4KCk5ha3MgYXJlIG5vdCBwZXJtYW5lbnQsIEkgY2FuIHJlbW92ZSBpdCBpbiB0aGUgZnV0
dXJlIGlmIHRoZSBzcGVjcyBjaGFuZ2UuCgo+VGhlIHNvLWNhbGxlZCBzcGVjaWZpY2F0aW9ucyBy
ZXByZXNlbnQgdGhlIGlkZWFzIG9mIEZGSSBvcHBvbmVudHMuCgoiU28tY2FsbGVkIj8gVGhleSBf
YXJlXyB0aGUgc3BlY3MuCgo+V2hhdCB3ZSBoYXZlIHRvIGRvIGlzIHRvIGRpc2N1c3Mgd2l0aCB0
aGVtIGFuZCBnZXQgYW4gZWZmZWN0aXZlCj5jb25zZW5zdXMsIHNvIGFzIHRvIGFjaGlldmUgdGhl
IHB1cnBvc2Ugb2YgdXBkYXRpbmcgdGhlIHNwZWNpZmljYXRpb24uCgpZZXMsIGJ1dCB0aGF0IG5l
ZWRzIHRvIGJlIGRvbmUgb24gdGVjaC1icnMsIG5vdCBsa21sLgoKVGhhbmtzLApDb25vci4KCj4K
Pj4+Cj4+Pgo+Pj4KPj4+IE5BS2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Pj4KPj4+IENoZWVycywKPj4+IENvbm9yLgo+Pj4KPj4+IFsxXSAtIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwNzA3LWF0dGFjaC1jb25qdXJvci0z
MDZkOTY3MzQ3Y2VAd2VuZHkvCj4KPlRoYW5rcywKPll1bmh1aQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
