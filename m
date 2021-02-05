Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA04FC433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 11:09:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E37A64F70
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 11:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E37A64F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4vnDdiT4lXwXa3A0pyfIVOhw97CoMoyvPitwMxZxgMc=; b=ZMe6MUXEAWZ6RpLTHC671RbEJ
	Qdm3PjmQqh8P0Uc+LgLdWfdj/iuTl9I7pzLHVW1F4OjhAaqNcjE8czkKNW4cRaQgamd3AlFz0avqt
	Vf0M+ih3TFlPpeaK0sJef0ONGAvUxGIe2OadY4o33DT9Qc8/lHPw35/jONyVgb9rE2oVTTbsGPoQN
	sV9lXRT+BnlySNVxLghbQ8sVz9RKaX/siynxSlFP7He4bkTkK8dmrZpOG55uNx9EXLmiImRR5gYWF
	JTX77Gk/xQ7NIMfX+gDtTLgTQDbrVieB+25jS2i67bAtbmxrlY/lWeb63lNhOCKGF4oTq4bgS/AEQ
	bVnq/GAXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7yz2-0003Wv-GP; Fri, 05 Feb 2021 11:09:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7yz0-0003WX-BW
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 11:09:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85037D6E;
 Fri,  5 Feb 2021 03:08:59 -0800 (PST)
Received: from [10.37.8.15] (unknown [10.37.8.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54CB33F73B;
 Fri,  5 Feb 2021 03:08:58 -0800 (PST)
Subject: Re: [PATCH] selftests/vDSO: fix ABI selftest on riscv
To: Palmer Dabbelt <palmer@dabbelt.com>, tklauser@distanz.ch, shuah@kernel.org
References: <mhng-1ed0f9e8-84ec-4f2e-ac42-5a608726e2fe@palmerdabbelt-glaptop>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <019fcafc-09b5-a13c-a83f-d6a0b1eb3224@arm.com>
Date: Fri, 5 Feb 2021 11:12:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-1ed0f9e8-84ec-4f2e-ac42-5a608726e2fe@palmerdabbelt-glaptop>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_060902_521695_4701D6B2 
X-CRM114-Status: GOOD (  14.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi81LzIxIDc6MDYgQU0sIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFRodSwgMDQgRmVi
IDIwMjEgMDY6NTA6NDIgUFNUICgtMDgwMCksIHRrbGF1c2VyQGRpc3RhbnouY2ggd3JvdGU6Cj4+
IE9ubHkgb2xkZXIgdmVyc2lvbnMgb2YgdGhlIFJJU0MtViBHQ0MgdG9vbGNoYWluIGRlZmluZSBf
X3Jpc2N2X18uIENoZWNrCj4+IGZvciBfX3Jpc2N2IGFzIHdlbGwsIHdoaWNoIGlzIHVzZWQgYnkg
bmV3ZXIgR0NDIHRvb2xjaGFpbnMuIEFsc28gc2V0Cj4+IFZEU09fMzJCSVQgYmFzZWQgb24gX19y
aXNjdl94bGVuLgo+Pgo+PiBCZWZvcmUgKG9uIHJpc2N2NjQpOgo+Pgo+PiAkIC4vdmRzb190ZXN0
X2FiaQo+PiBbdkRTTyBrc2VsZnRlc3RdIFZEU09fVkVSU0lPTjogTElOVVhfNAo+PiBDb3VsZCBu
b3QgZmluZCBfX3Zkc29fZ2V0dGltZW9mZGF5Cj4+IENvdWxkIG5vdCBmaW5kIF9fdmRzb19jbG9j
a19nZXR0aW1lCj4+IENvdWxkIG5vdCBmaW5kIF9fdmRzb19jbG9ja19nZXRyZXMKPj4gY2xvY2tf
aWQ6IENMT0NLX1JFQUxUSU1FIFtQQVNTXQo+PiBDb3VsZCBub3QgZmluZCBfX3Zkc29fY2xvY2tf
Z2V0dGltZQo+PiBDb3VsZCBub3QgZmluZCBfX3Zkc29fY2xvY2tfZ2V0cmVzCj4+IGNsb2NrX2lk
OiBDTE9DS19CT09UVElNRSBbUEFTU10KPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX2Nsb2NrX2dl
dHRpbWUKPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX2Nsb2NrX2dldHJlcwo+PiBjbG9ja19pZDog
Q0xPQ0tfVEFJIFtQQVNTXQo+PiBDb3VsZCBub3QgZmluZCBfX3Zkc29fY2xvY2tfZ2V0dGltZQo+
PiBDb3VsZCBub3QgZmluZCBfX3Zkc29fY2xvY2tfZ2V0cmVzCj4+IGNsb2NrX2lkOiBDTE9DS19S
RUFMVElNRV9DT0FSU0UgW1BBU1NdCj4+IENvdWxkIG5vdCBmaW5kIF9fdmRzb19jbG9ja19nZXR0
aW1lCj4+IENvdWxkIG5vdCBmaW5kIF9fdmRzb19jbG9ja19nZXRyZXMKPj4gY2xvY2tfaWQ6IENM
T0NLX01PTk9UT05JQyBbUEFTU10KPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX2Nsb2NrX2dldHRp
bWUKPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX2Nsb2NrX2dldHJlcwo+PiBjbG9ja19pZDogQ0xP
Q0tfTU9OT1RPTklDX1JBVyBbUEFTU10KPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX2Nsb2NrX2dl
dHRpbWUKPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX2Nsb2NrX2dldHJlcwo+PiBjbG9ja19pZDog
Q0xPQ0tfTU9OT1RPTklDX0NPQVJTRSBbUEFTU10KPj4gQ291bGQgbm90IGZpbmQgX192ZHNvX3Rp
bWUKPj4KPj4gQWZ0ZXIgKG9uIHJpc2N2MzIpOgo+Pgo+PiAkIC4vdmRzb190ZXN0X2FiaQo+PiBb
dkRTTyBrc2VsZnRlc3RdIFZEU09fVkVSU0lPTjogTElOVVhfNC4xNQo+PiBUaGUgdGltZSBpcyAx
NjEyNDQ5Mzc2LjAxNTA4Ngo+PiBUaGUgdGltZSBpcyAxNjEyNDQ5Mzc2LjE4MzQwNzg0Cj4+IFRo
ZSByZXNvbHV0aW9uIGlzIDAgMQo+PiBjbG9ja19pZDogQ0xPQ0tfUkVBTFRJTUUgW1BBU1NdCj4+
IFRoZSB0aW1lIGlzIDc3NC44NDI1ODYxODIKPj4gVGhlIHJlc29sdXRpb24gaXMgMCAxCj4+IGNs
b2NrX2lkOiBDTE9DS19CT09UVElNRSBbUEFTU10KPj4gVGhlIHRpbWUgaXMgMTYxMjQ0OTM3Ni4y
MjUzNjU2NQo+PiBUaGUgcmVzb2x1dGlvbiBpcyAwIDEKPj4gY2xvY2tfaWQ6IENMT0NLX1RBSSBb
UEFTU10KPj4gVGhlIHRpbWUgaXMgMTYxMjQ0OTM3Ni4yMDg4NTE3Mgo+PiBUaGUgcmVzb2x1dGlv
biBpcyAwIDQwMDAwMDAKPj4gY2xvY2tfaWQ6IENMT0NLX1JFQUxUSU1FX0NPQVJTRSBbUEFTU10K
Pj4gVGhlIHRpbWUgaXMgNzc0Ljg0NTQ5MTI2OQo+PiBUaGUgcmVzb2x1dGlvbiBpcyAwIDEKPj4g
Y2xvY2tfaWQ6IENMT0NLX01PTk9UT05JQyBbUEFTU10KPj4gVGhlIHRpbWUgaXMgNzc0Ljg0OTUz
NDIwMAo+PiBUaGUgcmVzb2x1dGlvbiBpcyAwIDEKPj4gY2xvY2tfaWQ6IENMT0NLX01PTk9UT05J
Q19SQVcgW1BBU1NdCj4+IFRoZSB0aW1lIGlzIDc3NC44NDIxMzk2ODQKPj4gVGhlIHJlc29sdXRp
b24gaXMgMCA0MDAwMDAwCj4+IGNsb2NrX2lkOiBDTE9DS19NT05PVE9OSUNfQ09BUlNFIFtQQVNT
XQo+PiBDb3VsZCBub3QgZmluZCBfX3Zkc29fdGltZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb2Jp
YXMgS2xhdXNlciA8dGtsYXVzZXJAZGlzdGFuei5jaD4KPj4gLS0tCj4+IMKgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvdkRTTy92ZHNvX2NvbmZpZy5oIHwgNCArKystCj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvdkRTTy92ZHNvX2NvbmZpZy5oCj4+IGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvdkRTTy92ZHNvX2NvbmZpZy5oCj4+IGluZGV4IDZhNmZlOGQ0ZmY1NS4uNjE4
OGIxNjgyN2QxIDEwMDY0NAo+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92RFNPL3Zk
c29fY29uZmlnLmgKPj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdkRTTy92ZHNvX2Nv
bmZpZy5oCj4+IEBAIC00NywxMCArNDcsMTIgQEAKPj4gwqAjZWxpZiBkZWZpbmVkKF9feDg2XzY0
X18pCj4+IMKgI2RlZmluZSBWRFNPX1ZFUlNJT07CoMKgwqDCoMKgwqDCoCAwCj4+IMKgI2RlZmlu
ZSBWRFNPX05BTUVTwqDCoMKgwqDCoMKgwqAgMQo+PiAtI2VsaWYgZGVmaW5lZChfX3Jpc2N2X18p
Cj4+ICsjZWxpZiBkZWZpbmVkKF9fcmlzY3ZfXykgfHwgZGVmaW5lZChfX3Jpc2N2KQo+PiDCoCNk
ZWZpbmUgVkRTT19WRVJTSU9OwqDCoMKgwqDCoMKgwqAgNQo+PiDCoCNkZWZpbmUgVkRTT19OQU1F
U8KgwqDCoMKgwqDCoMKgIDEKPj4gKyNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPj4gwqAjZGVmaW5l
IFZEU09fMzJCSVTCoMKgwqDCoMKgwqDCoCAxCj4+ICsjZW5kaWYKPj4gwqAjZWxzZSAvKiBuZHMz
MiAqLwo+PiDCoCNkZWZpbmUgVkRTT19WRVJTSU9OwqDCoMKgwqDCoMKgwqAgNAo+PiDCoCNkZWZp
bmUgVkRTT19OQU1FU8KgwqDCoMKgwqDCoMKgIDEKPiAKPiBSZXZpZXdlZC1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPiBBY2tlZC1ieTogUGFsbWVyIERhYmJl
bHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPgoKQWNrZWQtYnk6IFZpbmNlbnpvIEZyYXNj
aW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgoKPiBOb3Qgc3VyZSBpZiB5b3Ugd2FudCB0
aGlzIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlLCBzbyBJJ20gbGVhdmluZyBpdCBvdXQgZm9yCj4g
bm93IGFuZCBhc3N1bWluZyBpdCdsbCBnbyB0aHJvdWdoIGEga3NlbGZ0ZXN0IHRyZWUuCj4gCj4g
VGhhbmtzIQoKLS0gClJlZ2FyZHMsClZpbmNlbnpvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
