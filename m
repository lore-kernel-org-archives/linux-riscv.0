Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2CEC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 05:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C0B214C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 05:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fEuHVbqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C0B214C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJwnK4IDQzellMEfxVmi2PaWET6Ylm5gKL+Da120GRU=; b=fEuHVbqmRCTAHB
	s5y9KfGDaQifT98eHkrT537ArzeHDMmRQk3mx+D0Cldrbm/vjGGYRvfQG9n3o1tMmZqVYNIegCcWd
	0jZtmGW88jCfBXD5EFOH8Wr7sNp7LZYO6MqCBd0FV+qnEfOpb97GPuvHlm3XFT8wQZx3chfsJu49X
	D7fXvM08GaWYSdPctSBvrv9NX7AA9mWYKvijE5Y9THDOyt4jFjsEuKZseI15Xq/8E2TrZGz3EBNQG
	YTWJAC4qkohG7rmzJ5HccPsV6BoAq69KB0ZUGBkrl1Kee3sDQlBHrVgyAoU01wMNrizA3rOFYg0o2
	piETaMye7RE7pg+H+MfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCeF9-0007zH-1C; Wed, 17 Oct 2018 05:19:39 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCeEy-0007qs-Ia
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 05:19:36 +0000
Received: from excalibur.cnev.de ([213.196.203.128]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHX3R-1gQAuJ1vcX-00DXn8; Wed, 17 Oct 2018 07:19:06 +0200
Received: from excalibur.cnev.de ([213.196.203.128]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHX3R-1gQAuJ1vcX-00DXn8; Wed, 17 Oct 2018 07:19:06 +0200
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1gCeEa-0003fx-Nt; Wed, 17 Oct 2018 07:19:04 +0200
Date: Wed, 17 Oct 2018 07:19:04 +0200
From: Karsten Merker <merker@debian.org>
To: Michael Clark <michaeljclark@mac.com>
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for
 vda device
Message-ID: <20181017051904.ulsm4trmhjrtnwfh@excalibur.cnev.de>
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
 <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
 <D9003246-0336-4327-97D3-D8F079F640D3@mac.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9003246-0336-4327-97D3-D8F079F640D3@mac.com>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:JV+2fJpJxUEVIV4Y7VRojizjCJr2eNvs0/tIiNkbfItEjam9NA9
 HURMXfmjARZQbjIF+Jn/8+o3NXMKyfVb7MqeL21fyjX8iIwhBwcR/xSSsyZSwMDDcHondzM
 9IId7ZoCXfhGQTFWzV9GbkcNSKfp3pb/QsEBJasE8Uy22Plm3R+MCpwgxwRE9IQeUfFEwaB
 MfBMVveT8gayec7X7C0JA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9vvCWoa4g+c=:zkFaT4NC0qU6zAc7HIhZH1
 QU3Z5BSLSVIs5x4OV+zzd3AQevM6v02YEyL7TIydEq1fRhp4Gu2MZuflCMY+6XOR+BsNJ4Gfx
 crxYayn1V7YeMINSoVPLdTc3Ma8IKv0dJ7EGoZtd8EQB5ku4LM7Kp2L98djO319Pn3gBsE5fw
 +IX9RWq2Bda+SeX7csqL0WiK26Rx1IXV1BQe73+zzwZV12wrtBvYwnYJ6L9TpoQYlOd1alDzj
 70djZ2697uFgf4es+ICJ9JrQXtm3wQvJ9V2MFf4YE0hgZzNICAedkBIdfR8s4cEhBgTjwjPGA
 Dh6axE7IWtJygEkd7sC3owHptWw/0h7s1i5m/zM4tlT+uk2aEGfWjDY0ARNo+Hm9e+jSBXtVH
 CMi9djSZpCGKWkPepaFYnghm9N8T/N0nY/C3ZhabLcGv6cMU3pj8s9jPplLDPoWLVe5bacrRH
 SmYNuGXWaBgkAYCZ137IaS3lUXkwVAuQ1P0tzx/KLVKV2uYzH/ORBYva3cSSGR3ToSy0JUvvT
 N2cXw7Oc/b4RGQzXWqJkmVE8b60lIZ/8bJ1X3g5rp3mBNDDcXLiehnDINhmSUQClr9va+UAUD
 aGrkOMISA2kfAgIDW+XmVxcOyUUOkSYf81SvRqyZfVopFFXl3cUAX0k7//vqcsMEga4hOw5mo
 3SQtq6qpOon2MHO17Bxsd+YRRCOoqWQuqvnxK4EDVh78W878oj1NgeYAiC3r0yRf8v7Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_221928_929536_1343F624 
X-CRM114-Status: GOOD (  17.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: pintu.ping@gmail.com, Palmer Dabbelt <palmer@sifive.com>, rjones@redhat.com,
 sw-dev@groups.riscv.org, Karsten Merker <merker@debian.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTcsIDIwMTggYXQgMTE6MzA6NTBBTSArMTMwMCwgTWljaGFlbCBDbGFyayB3
cm90ZToKPiA+IE9uIDE3LzEwLzIwMTgsIGF0IDk6MDIgQU0sIEthcnN0ZW4gTWVya2VyIDxtZXJr
ZXJAZGViaWFuLm9yZz4gd3JvdGU6Cj4gPiAKPiA+PiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCAx
MTozODo1M0FNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+Pj4gT24gVHVlLCAxNiBP
Y3QgMjAxOCAwNjoxMjoxMSBQRFQgKC0wNzAwKSwgcGludHUucGluZ0BnbWFpbC5jb20gd3JvdGU6
Cj4gPj4+PiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCA2OjEwIEFNIFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPj4+PiBPbiBNb24sIDE1IE9jdCAyMDE4IDE0OjE0
OjUxIFBEVCAoLTA3MDApLCByam9uZXNAcmVkaGF0LmNvbSB3cm90ZToKPiA+IFsuLi5dCj4gPj4+
PiBZb3VyIGJlc3QgYmV0IHRvZGF5IGlzIHRvIHJ1biA0LjE5LXJjOCwgd2hpY2ggc2hvdWxkIGJl
IHByZXR0eSBzdGFibGUuCj4gPj4+IAo+ID4+PiBZZXMsIEkgY2hlY2tlZCB3aXRoIG1haW5saW5l
IGxpbnV4LWtlcm5lbCA0LjE5Lgo+ID4+PiBOb3cgSSBhbSBhYmxlIHRvIGJvb3Qgc3VjY2Vzc2Z1
bGx5IGFuZCBsb2dpbiBpbnRvIHFlbXUtcmlzY3Ygc2hlbGwuCj4gPj4+IFRoYW5rIHlvdSBzbyBt
dWNoIDopCj4gPj4+IAo+ID4+PiBCdXQgSSBhbSBjdXJpb3VzIHRvIGtub3cgd2hhdCBjaGFuZ2Vz
IHJlc3VsdGVkIGludG8gdGhpcyBmaXgsIGluIDQuMTkga2VybmVsID8KPiA+Pj4gV2hpY2ggaXMg
dGhlIGV4YWN0IHBhdGNoIGluIG1haW5saW5lLCB0aGF0IGZpeGVzIHRoaXMgaXNzdWU/Cj4gPj4+
IEJlY2F1c2UgYXQgdGltZXMgZHVyaW5nIHRoZSBkZXZlbG9wbWVudCwgaXQgd2lsbCBiZSBkaWZm
aWN1bHQgdG8KPiA+Pj4gc2ltcGx5IHVwZ3JhZGUgdGhlIGtlcm5lbCB2ZXJzaW9uLgo+ID4+IAo+
ID4+IFllcywgdGhhdCdzIGV4cGVjdGVkLiAgUklTQy1WIExpbnV4IGlzIHN0aWxsIHByZXR0eSBi
bGVlZGluZyBlZGdlLCB5b3UganVzdAo+ID4+IGhhcHBlbmVkIHRvIGNhdGNoIGl0IGJldHdlZW4g
d2hlbiBtYXN0ZXIgc3RhcnRlZCB3b3JraW5nIGFuZCB3aGVuIHRoZXJlIHdhcwo+ID4+IGEgcHJv
cGVyIHJlbGVhc2UgdGhhdCBjb250YWluZWQgeW91ciBwYXRjaGVzLiAgU2luY2UgbWFzdGVyIGlz
IHZlcnkgY2FsbQo+ID4+IHJpZ2h0IG5vdyAodGhlcmUgd2FzIGFuIHJjOCBiZWZvcmUgcmVsZWFz
ZSwgYnV0IGl0J3MgdmVyeSBjbG9zZSB0byBhCj4gPj4gcmVsZWFzZSkgaXQncyBPSyB0byB1c2Us
IGJ1dCB5b3UgYmVzdCBiZXQgZ29pbmcgZm9yd2FyZCBpcyB0byB1c2UgdGhlCj4gPj4gcmVsZWFz
ZSB0YXJiYWxscyBqdXN0IGxpa2Ugbm9ybWFsLgo+ID4gCj4gPiBKdXN0IGFzIGEgZGF0YSBwb2lu
dCBpbiBjYXNlIHlvdSBzaG91bGQgZmluZCBpdCBoZWxwZnVsOiBJJ20KPiA+IHNpbmNlIHR3byB3
ZWVrcyBydW5uaW5nIDQuMTktcmM2Ly1yYzcgb24gdGhlIHFlbXUtcmlzY3YgInZpcnQiCj4gPiBi
b2FyZCB1bmRlciBwZXJtYW5lbnQgaGVhdnkgbG9hZCAodGhlIHN5c3RlbSBpcyBydW5uaW5nIGEg
RGViaWFuCj4gPiBwYWNrYWdlIGJ1aWxkZXIpIHdpdGhvdXQgYSBzaW5nbGUgaGljY3VwLgo+IAo+
IEhpIEthcnN0ZW4sCj4gCj4gSGF2ZSB5b3UgdHJpZWQgcmlzY3YtcWVtdT8gIEkga25vdyBxZW11
LXJpc2N2IGdldHMgcXVpdGUgYSBsb3Qgb2YgdGVzdGluZwo+IGJ1dCBJ4oCZZCBsaWtlIHRvIGdh
aW4gc29tZSBtb3JlIGNvbmZpZGVuY2UgaW4gcmlzY3YtcWVtdS4KCkkgaGF2ZSB1cHN0cmVhbSBx
ZW11IHJ1bm5pbmcgb24gb25lIGJveCBhbmQgcmlzY3YtcWVtdSBmcm9tCmh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1xZW11LywgYnJhbmNoICJxZW11LWZvci11cHN0cmVhbSIsCm9uIGFu
b3RoZXIsIGFuZCBoYXZlbid0IGVuY291bnRlcmVkIGFueSBzdGFiaWxpdHkgcHJvYmxlbXMgb24K
ZWl0aGVyIG9mIHRob3NlLgoKUmVnYXJkcywKS2Fyc3RlbgotLSAKR2VtLiBQYXIuIDI4IEFicy4g
NCBCdW5kZXNkYXRlbnNjaHV0emdlc2V0eiB3aWRlcnNwcmVjaGUgaWNoIGRlciBOdXR6dW5nCnNv
d2llIGRlciBXZWl0ZXJnYWJlIG1laW5lciBwZXJzb25lbmJlem9nZW5lbiBEYXRlbiBmw7xyIFp3
ZWNrZSBkZXIKV2VyYnVuZyBzb3dpZSBkZXIgTWFya3QtIG9kZXIgTWVpbnVuZ3Nmb3JzY2h1bmcu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
