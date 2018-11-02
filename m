Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DBCC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 22:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEEE20657
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 22:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jAG3g0FP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LTfb9Jg2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CEEE20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OEHJ89YhljUfFpWp8VhkK5I063lDDvTP+r8YOnGaYJw=; b=jAG3g0FP8sJcacWZsM6d8JAEv
	PQqnwEkDBajbK9HbhkkBUH7eCxxFQ9cW0CDzz7RoMN4UEE+37oeF+NOkPUNqOm/me7L/7WgQbcvP0
	BLXxKqdlqxBRBtR1PhWoX2wPeeFWoELXbhZzB/8oRhJzLQBslXWnCgi09+ZjaQ8pV7r3IKASzHFOz
	oeKVqWppL8I8ritTUfXdXRn3v9dxegDP9VycZu0Qs6lO/f+SrGIC5pKMN7WqCzhT+gFeEPSoVR6zt
	fedyxTctYDna2jNFp0onITfByhZVYxmp8nFqqgGTboRVcgu3A86ys309M3XSv9ZgnZUzJTFO3EzkZ
	GDeJ+pahw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIhyJ-0003mk-9y; Fri, 02 Nov 2018 22:31:19 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIhyG-0003m4-P2
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 22:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541197885; x=1572733885;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RC0e+fQk2Nrh6kxQmSRsu2vjFDoHSGHqyVXrvN8QdsM=;
 b=LTfb9Jg23Tpl0OV0NKtFpSS2fdaNqY5Hx5rawPY5kHjdmqljGmeGW4Ak
 DMg3tU5+hMLsGbgwRg48IA1hXOrg16bGd8D1DTOp6TPX1KxWCeO78F0WI
 HQqJsgknkyT85/1/o7ijNGVGKV+Pd8ZUGlImXvEJc/aPCVeEvMQVe7gi/
 aao2KTEABMT9FaZDUTXpp4wbtRYRPuXRN+IE68hNblWVlvoCY8ZECbNom
 pA+pO54qp4Thu3BYV8ukuLz/76wMjCkEWpfuu2EnCE83wnHdJFfqC8GkM
 vcCm6hY2uWea+X8Ad0nYVVReLxqBskcQSMPiwVPIc2ADIpS8vBMj4PaZV w==;
X-IronPort-AV: E=Sophos;i="5.54,457,1534780800"; d="scan'208";a="191166164"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Nov 2018 06:31:07 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Nov 2018 15:14:48 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Nov 2018 15:31:04 -0700
Subject: Re: SBI extension proposal
To: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>,
 Olof Johansson <olof.johansson@gmail.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
 <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
 <cf729ca1-3ad0-8fe8-5cfa-d09d6c28d831@wdc.com>
 <TU4PR8401MB09581F92A2F7C0C7FFFA190EFFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7da86c7a-d06a-82ae-ef01-35efeeda7c3a@wdc.com>
Date: Fri, 2 Nov 2018 15:31:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <TU4PR8401MB09581F92A2F7C0C7FFFA190EFFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_153116_885190_618A5E9A 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "zong@andestech.com" <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Andrew Waterman <andrew@sifive.com>,
 "alankao@andestech.com" <alankao@andestech.com>, "Chen,
 Gilbert" <gilbert.chen@hpe.com>, "anup@brainfault.org" <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "rjones@redhat.com" <rjones@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "vincentc@andestech.com" <vincentc@andestech.com>,
 "mjc@sifive.com" <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102223103.ZqgsLiUo5QyrcVYWqgNwFrl6pOc1enh-_qW5PDEaSFs@z>

T24gMTEvMS8xOCAxMTozMSBQTSwgQ2hhbmcsIEFibmVyIChIUFMgU1cvRlcgVGVjaG5vbG9naXN0
KSB3cm90ZToKPiAKPj4+Pj4gLS0gaW50IHNiaV9oYXJ0X3VwKHVuc2lnbmVkIGxvbmcgaGFydGlk
LCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+Pj4+PiB1bnNpZ25lZCBsb25nIHByaXYpCj4+Pj4+Cj4+
Pj4+IEJyaW5ncyB1cCAiaGFydGlkIiBlaXRoZXIgZHVyaW5nIGluaXRpYWwgYm9vdCBvciBhZnRl
ciBhCj4+Pj4+IHNiaV9oYXJ0X2Rvd24gU0JJIGNhbGwuCj4+Pj4+Cj4+Pj4+ICJzdGFydCIgcG9p
bnRzIHRvIGEgcnVudGltZS1zcGVjaWZpZWQgYWRkcmVzcyB3aGVyZSBhIGhhcnQgY2FuIGVudGVy
Cj4+Pj4+IGludG8gc3VwZXJ2aXNvciBtb2RlLiBUaGlzIG11c3QgYmUgYSBwaHlzaWNhbCBhZGRy
ZXNzLgo+Pj4+Pgo+Pj4+PiAicHJpdiIgaXMgYSBwcml2YXRlIGRhdGEgdGhhdCBjYWxsZXIgY2Fu
IHVzZSB0byBwYXNzIGluZm9ybWF0aW9uCj4+Pj4+IGFib3V0IGV4ZWN1dGlvbiBjb250ZXh0Lgo+
Pj4+Pgo+Pj4+PiBSZXR1cm4gdGhlIGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2RlLgo+Pj4+Pgo+
Pj4+PiAtLSBpbnQgc2JpX2hhcnRfc3VzcGVuZCh1MzIgc3RhdGUsIHVuc2lnbmVkIGxvbmcgcmVz
dW1lX2VudHJ5LAo+Pj4+PiB1bnNpZ25lZCBsb25nIHByaXYpCj4+Pj4+Cj4+Pj4+IFN1c3BlbmRz
IHRoZSBjYWxsaW5nIGhhcnQgdG8gYSBwYXJ0aWN1bGFyIHBvd2VyIHN0YXRlLiBTdXNwZW5kZWQK
Pj4+Pj4gaGFydCB3aWxsIGF1dG9tYXRpY2FsbHkgd2FrZS11cCBiYXNlZCBvbiBzb21lIHdha2V1
cCBldmVudHMgYXQKPj4+Pj4gcmVzdW1lX2VudHJ5IHBoeXNpY2FsIGFkZHJlc3MuCj4+Pj4+Cj4+
Pj4+ICJwcml2IiBpcyBhIHByaXZhdGUgZGF0YSB0aGF0IGNhbGxlciBjYW4gdXNlIHRvIHBhc3Mg
aW5mb3JtYXRpb24KPj4+Pj4gYWJvdXQgZXhlY3V0aW9uIGNvbnRleHQuIFRoZSBTQkkgaW1wbGVt
ZW50YXRpb24gbXVzdCBzYXZlIGEgY29weSBzbwo+Pj4+PiB0aGF0IGNhbGxlciBjYW4gcmV1c2Ug
d2hpbGUgcmVzdG9yaW5nIGhhcnQgZnJvbSBzdXNwZW5kLgo+Pj4+Pgo+Pj4+PiBSZXR1cm4gdGhl
IGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2RlLgo+Pj4+Pgo+Pj4+PiAtLSBpbnQgc2JpX2hhcnRf
ZG93bigpCj4+Pj4+Cj4+Pj4+IEl0IHBvd2VycyBvZmYgdGhlIGhhcnQgYW5kIHdpbGwgYmUgdXNl
ZCBpbiBjcHUtaG90cGx1Zy4KPj4+Pj4gT25seSBpbmRpdmlkdWFsIGhhcnQgY2FuIHJlbW92ZSBp
dHNlbGYgZnJvbSBzdXBlcnZpc29yIG1vZGUuIEl0IGNhbgo+Pj4+PiBiZSBtb3ZlZCB0byBub3Jt
YWwgc3RhdGUgb25seSBieSBzYmlfaGFydF91cCBmdW5jdGlvbi4KPj4+Pj4KPj4+Pj4gUmV0dXJu
IHRoZSBhcHByb3ByaWF0ZSBTQkkgZXJyb3IgY29kZS4KPj4+Pj4KPj4+Pj4gLS0gdTMyIHNiaV9o
YXJ0X3N0YXRlKHVuc2lnbmVkIGxvbmcgaGFydGlkKQo+Pj4+Pgo+Pj4+PiBSZXR1cm5zIHRoZSBS
SVNDVl9QT1dFUl9TVEFURSBmb3IgYSBzcGVjaWZpYyBoYXJ0aWQuIFRoaXMgd2lsbCBoZWxwCj4+
Pj4+IG1ha2Uga2V4ZWMgbGlrZSBmdW5jdGlvbmFsaXR5IG1vcmUgcm9idXN0Lgo+Pj4+Pgo+Pj4+
PiAtLSB2b2lkIHNiaV9zeXN0ZW1fc2h1dGRvd24oKQo+Pj4+Pgo+Pj4+PiBQb3dlcnMgb2ZmIHRo
ZSBlbnRpcmUgc3lzdGVtLgo+Pj4+Cj4+Pj4KPj4+PiBUaGlzIGlzIGEgc2xpZ2h0bHkgd2VpcmQg
b25lIHRvIHB1dCBpbiBTQkkuIFRoZXJlJ3MgdXN1YWxseSBvdGhlciBhY3Rpb25zCj4+IG5lZWRl
ZCBmb3IgX3N5c3RlbV8gbGV2ZWwgc2h1dGRvd24sIHN1Y2ggYXMgZXh0ZXJuYWwgcG93ZXIgcmVn
dWxhdG9ycy4KPj4+Pgo+Pgo+PiBUaGlzIG1pZ2h0IGJlIGJlY2F1c2Ugb2YgbXkgbGltaXRlZCBr
bm93bGVkZ2Ugb24gcG93ZXIgbWFuYWdlbWVudC4KPiBJbiBBQ1BJLCBpdCBkZWZpbmVzIHRoZSBy
ZWdpc3RlciBibG9jayB0byBwdXQgcHJvY2Vzc29yIGludG8gZGlmZmVyZW50IGxldmVscyBvZiBz
bGVlcCBtb2RlIChzdXNwZW5kIG1vZGUpLiBIb3dldmVyLCB0aGlzIHJlcXVpcmVzIGFkZGl0aW9u
YWwgcG93ZXIgbWFuYWdlbWVudCBjb250cm9sbGVyIG9yIHByb2Nlc3NvciBDU1JzIG9uIFJJU0Mt
Vi4gSWYgd2UgZG9u4oCZdCBjb25zaWRlciBBQ1BJIGFuZCBIL1cgY2FwYWJpbGl0aWVzIG9mIHBv
d2VyIE1HTVQgb24gUklTQy1WIGF0IHRoaXMgbW9tZW50LCB0aGVuIFNCSSBmb3IgcHJvY2Vzc29y
IHBvd2VyIG1hbmFnZW1lbnQgbWF5IGJlIG5lZWRlZC4KPiBNeSBxdWVzdGlvbiBpcyBjYW4gU0JJ
X2hhcnRfdXAgKCkgdG8gZXhlY3V0ZSAic3RhcnQiIGV2ZW4gdGhlIGhhcnQgaXMgbm90IGluIFN1
c3BlbmQgb3IgRG93biBzdGF0ZT8gSSBhbSBhc2tpbmcgdGhpcyBiZWNhdXNlIG9uIFVFRkkgd2Ug
d291bGQgbGlrZSB0byBoYXZlIFNCSSBmb3Igc3VwZXJ2aXNvciBtb2RlIGZpcm13YXJlIHRvIGlu
dm9rZSBmdW5jdGlvbnMgcHJvdmlkZWQgYnkgTS1tb2RlIGRyaXZlciwganVzdCB0cnlpbmcgdG8g
bGV2ZXJhZ2UgU0JJX2hhcnRfdXAgKCkgZm9yIHRoaXMgaW50ZW50aW9uLiBIb3dldmVyLCAiU3Rh
cnQiIGlzIGRlZmluZWQgYXMgYW4gYWRkcmVzcyB0byBlbnRyeSBpbnRvIHN1cGVydmlzb3IgbW9k
ZS4gV2UgbWF5IG5lZWQgdG8gYWRkIGFuIGFkZGl0aW9uYWwgcGFyYW1ldGVyIHRvIHRoaXMgU0JJ
IHdoaWNoIGluZGljYXRlcyB0aGUgcHJpdmlsZWdlIHRvIGV4ZWN1dGUgIlN0YXJ0IiB0aG91Z2gu
Cj4gRm9yZ2V0IHRoaXMgaWYgdGhpcyBTQkkgaXMgZGVkaWNhdGVkIGZvciBwcm9jZXNzb3IgcG93
ZXIgbWFuYWdlbWVudC4gV2UgY2FuIHByb3Bvc2UgbmV3IFNCSSBmb3IgYWJvdmUgaW50ZW50aW9u
Lgo+IAppbnQgc2JpX2hhcnRfdXAodW5zaWduZWQgbG9uZyBoYXJ0aWQsIHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkCmxvbmcgcHJpdikKCkl0IGhhcyBhbHJlYWR5IGEgb3BhcXVlIHRoaXJk
IHBhcmFtZXRlciB0aGF0IGNhbiBiZSB1c2VkIHRvIGFkZHJlc3MgeW91ciAKY2FzZS4gSXNuJ3Qg
aXQgPwoKPj4gV2UgYWxyZWFkeSBoYXZlIGEgc3lzdGVtIHJlc2V0IGNhbGwgaW4gU0JJICYgUFND
SSBhbHNvIGhhZCBzeXN0ZW0gc2h1dGRvd24KPiBJcyBzeXN0ZW0gcmVzZXQgY2FsbCBkZWZpbmVk
IGluIFNCSSBzcGVjIGFzIHdlbGw/IEkgZG9u4oCZdCBzZWUgdGhpcyBpbiBHaXRodWIuCj4gClNv
cnJ5LiBJIGhhdmUgbWFkZSBteXNlbGYgY29uZnVzZWQgd2hpbGUgd3JpdGluZy4gWW91IGFyZSBj
b3JyZWN0LgoKClJlZ2FyZHMsCkF0aXNoCj4+IGZ1bmN0aW9uLiBBcyBwZXIgbXkgdW5kZXJzdGFu
ZGluZywgdGhpcyBBUEkgd2lsbCBwcm92aWRlIGEgd2F5IHRvIGhhbmRsZSBhbGwKPj4gY29tbW9u
IHN1c3BlbmQgcmVsYXRlZCBvcGVyYXRpb25zIG9uIG1hY2hpbmUgbW9kZS4KPj4gSW4gY2FzZSBv
ZiB2aXJ0dWFsIE9TLCBpdCB3aWxsIG5vdCByZXN1bHQgaW4gYW55IGV4dGVybmFsIHBvd2VyIHJl
Z3VsYXRpb25zLgo+IAo+IAo+IAo+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
