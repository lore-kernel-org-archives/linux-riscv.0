Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CE0ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLugtTYwIP+a+PACdICHxfp4yIRks/tbu0B2Ej3Tzn0=; b=mf1fB+WH4lk6W3
	lGTU2qgb9ZVv0RGAatSHRwg2O2Cmtkz6McKvCxOhbzvC8GyUB+QDknwHQp9rqMmXgsl6rC1U6Fda+
	a+qL72s3qJxZ4kTXheK0NjjSrV5x0Ur5YmtcvZiI9MXvcUAnVS7ZELDci39h4T16+VSDF3oYhVBIW
	/Bg3TUpiCtyygjCz459hY0AjVwUfhUyrzJjIjOjjoq22GsvSbGl5vh/J1SPILY7c1HsmgCoh3TcDx
	68MiU4ZZiZfv/u+vcuEhn2kA6WudBy/kiJB3Tf5vxOUY49P2HgvIHLmIuqr3RpgEyvL+OklN2GIC+
	/ksjSc5mHbNgSzzQP8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJ6C-004xXQ-V8; Wed, 31 Aug 2022 08:29:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJ5q-004xGd-TN
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 08:29:09 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHcgc5THgzlW0W;
	Wed, 31 Aug 2022 16:25:32 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 16:28:56 +0800
Message-ID: <7cd9d59e-9c5f-bca4-1d77-eeb7f1445979@huawei.com>
Date: Wed, 31 Aug 2022 16:28:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] arch/riscv: kprobes: implement optprobes
To: <Conor.Dooley@microchip.com>, <chenguokai17@mails.ucas.ac.cn>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220831041014.1295054-1-chenguokai17@mails.ucas.ac.cn>
 <882e9efc-7222-c3af-e37b-f339789e94c0@microchip.com>
 <2ab8be67-fad5-7bef-6140-43312870d845@huawei.com>
 <8c79280f-ef55-ba38-e1a2-5fd1dbff0114@microchip.com>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <8c79280f-ef55-ba38-e1a2-5fd1dbff0114@microchip.com>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_012903_334657_2C70FF4E 
X-CRM114-Status: GOOD (  11.52  )
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

CgrlnKggMjAyMi84LzMxIDE1OjUyLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSDlhpnpgZM6
Cj4gT24gMzEvMDgvMjAyMiAwODo0OSwgbGlhb2NoYW5nIChBKSB3cm90ZToKPj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Cj4+IOWcqCAyMDIyLzgvMzEgMTU6MjQsIENvbm9y
LkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoKPj4+IEhleSBDaGVuLAo+Pj4KPj4+IEZZSSB0
aGVyZSBpcyBhIGJ1aWxkIHdhcm5pbmcgd2l0aCB0aGlzIHBhdGNoOgo+Pj4gYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvYmVzL29wdC5jOjM0OjI3OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yICdjYW5fa3Byb2JlX2RpcmVjdF9leGVjJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4+PiAg
ICAgIDM0IHwgZW51bSBwcm9iZV9pbnNuIF9fa3Byb2JlcyBjYW5fa3Byb2JlX2RpcmVjdF9leGVj
KGtwcm9iZV9vcGNvZGVfdCAqYWRkcikKPj4+Cj4+PiBBbHNvLCBpZiB5b3UgcnVuIHNjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLXN0cmljdCwgaXQgd2lsbCBoYXZlIGEKPj4+IGZldyBjb21wbGFpbnRz
IGFib3V0IGNvZGUgc3R5bGUgZm9yIHlvdSB0b28uIE90aGVyIHRoYW4gdGhhdCwgSQo+Pj4gaGF2
ZSBhIGZldyBjb21tZW50cyBmb3IgeW91IGJlbG93Ogo+Pj4KPj4+IE9uIDMxLzA4LzIwMjIgMDU6
MTAsIENoZW4gR3Vva2FpIHdyb3RlOgo+Pj4+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZy
b20gY2hlbmd1b2thaTE3QG1haWxzLnVjYXMuYWMuY24uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9y
dGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+
Pj4+Cj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Pj4KPj4+PiBUaGlz
IHBhdGNoIGFkZHMganVtcCBvcHRpbWl6YXRpb24gc3VwcG9ydCBmb3IgUklTQy1WLgo+Pj4KPj4+
IHMvVGhpcyBwYXRjaCBhZGRzL0FkZAo+Pj4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggcmVwbGFjZXMg
ZWJyZWFrIGluc3RydWN0aW9ucyB1c2VkIGJ5IG5vcm1hbCBrcHJvYmVzIHdpdGggYW4KPj4+Cj4+
PiBzL1RoaXMgcGF0Y2ggcmVwbGFjZXMvUmVwbGFjZQo+Pj4KPj4+PiBhdWlwYytqYWxyIGluc3Ry
dWN0aW9uIHBhaXIsIGF0IHRoZSBhaW0gb2Ygc3VwcHJlc3NpbmcgdGhlIHByb2JlLWhpdAo+Pj4+
IG92ZXJoZWFkLgo+Pj4+Cj4+Pj4gQWxsIGtub3duIG9wdHByb2JlLWNhcGFibGUgUklTQyBhcmNo
aXRlY3R1cmVzIGhhdmUgYmVlbiB1c2luZyBhIHNpbmdsZQo+Pj4+IGp1bXAgb3IgYnJhbmNoIGlu
c3RydWN0aW9ucyB3aGlsZSB0aGlzIHBhdGNoIGNob29zZXMgbm90LiBSSVNDLVYgaGFzIGEKPj4+
PiBxdWl0ZSBsaW1pdGVkIGp1bXAgcmFuZ2UgKDRLQiBvciAyTUIpIGZvciBib3RoIGl0cyBicmFu
Y2ggYW5kIGp1bXAKPj4+PiBpbnN0cnVjdGlvbnMsIHdoaWNoIHByZXZlbnQgb3B0aW1pemF0aW9u
cyBmcm9tIHN1cHBvcnRpbmcgcHJvYmVzIHRoYXQKPj4+PiBzcHJlYWQgYWxsIG92ZXIgdGhlIGtl
cm5lbC4KPj4+Pgo+Pj4+IEF1aXBjLWphbHIgaW5zdHJ1Y3Rpb24gcGFpciBpcyBpbnRyb2R1Y2Vk
IHdpdGggYSBtdWNoIHdpZGVyIGp1bXAgcmFuZ2UKPj4+PiAoNEdCKSwgd2hlcmUgYXVpcGMgbG9h
ZHMgdGhlIHVwcGVyIDEyIGJpdHMgdG8gYSBmcmVlIHJlZ2lzdGVyIGFuZCBqYWxyCj4+Pj4gYXBw
ZW5kcyB0aGUgbG93ZXIgMjAgYml0cyB0byBmb3JtIGEgMzIgYml0IGltbWVkaWF0ZS4gTm90ZSB0
aGF0IHJldHVybmluZwo+Pj4+IGZyb20gcHJvYmUgaGFuZGxlciByZXF1aXJlcyBhbm90aGVyIGZy
ZWUgcmVnaXN0ZXIuIEFzIGtwcm9iZXMgY2FuIGFwcGVhcgo+Pj4+IGFsbW9zdCBhbnl3aGVyZSBp
bnNpZGUgdGhlIGtlcm5lbCwgdGhlIGZyZWUgcmVnaXN0ZXIgc2hvdWxkIGJlIGZvdW5kIGluIGEK
Pj4+PiBnZW5lcmljIHdheSwgbm90IGRlcGVuZGluZyBvbiBjYWxsaW5nIGNvbnZlbnNpb24gb3Ig
YW55IG90aGVyIHJlZ3VsYXRpb25zLgo+Pj4KPj4+IGNvbnZlbnRpb24KPj4+Cj4+Pj4KPj4+PiBU
aGUgYWxnb3JpdGhtIGZvciBmaW5kaW5nIHRoZSBmcmVlIHJlZ2lzdGVyIGlzIGluc3BpcmVkIGJ5
IHRoZSByZWdpdGVyCj4+Pgo+Pj4gcmVnaXN0ZXIKPj4+Cj4+Pj4gcmVuYW1pbmcgaW4gbW9kZXJu
IHByb2Nlc3NvcnMuIEZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIHJlZ2lzdGVyIHJlbmFtaW5nLCBh
Cj4+Pj4gcmVnaXN0ZXIgY291bGQgYmUgcmVwcmVzZW50ZWQgYXMgdHdvIGRpZmZlcmVudCByZWdp
c3RlcnMgaWYgdHdvIG5laWdoYm91cgo+Pj4+IGluc3RydWN0aW9ucyBib3RoIHdyaXRlIHRvIGl0
IGJ1dCBubyBvbmUgZXZlciByZWFkcy4gRXh0ZW5kaW5nIHRoaXMgZmFjdCwKPj4+PiBhIHJlZ2lz
dGVyIGlzIGNvbnNpZGVyZWQgdG8gYmUgZnJlZSBpZiB0aGVyZSBpcyBubyByZWFkIGJlZm9yZSBp
dHMgbmV4dAo+Pj4+IHdyaXRlIGluIHRoZSBleGVjdXRpb24gZmxvdy4gV2UgYXJlIGZyZWUgdG8g
Y2hhbmdlIGl0cyB2YWx1ZSB3aXRob3V0Cj4+Pj4gaW50ZXJmZXJpbmcgbm9ybWFsIGV4ZWN1dGlv
bi4KPj4+Pgo+Pj4+IFN0YXRpYyBhbmFseXNpcyBzaG93cyB0aGF0IDUxJSBpbnN0cnVjdGlvbnMg
b2YgdGhlIGtlcm5lbCAoZGVmYXVsdCBjb25maWcpCj4+Pj4gaXMgY2FwYWJsZSBvZiBiZWluZyBy
ZXBsYWNlZCBpLmUuIHR3byBmcmVlIHJlZ2lzdGVycyBjYW4gYmUgZm91bmQgYXQgYm90aAo+Pj4+
IHRoZSBzdGFydCBhbmQgZW5kIG9mIHJlcGxhY2VkIGluc3RydWN0aW9uIHBhaXJzIHdoaWxlIHRo
ZSByZXBsYWNlZAo+Pj4+IGluc3RydWN0aW9ucyBjYW4gYmUgZGlyZWN0bHkgZXhlY3V0ZWQuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIEd1b2thaSA8Y2hlbmd1b2thaTE3QG1haWxzLnVj
YXMuYWMuY24+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTGlhbyBDaGFuZyA8bGlhb2NoYW5nMUBodWF3
ZWkuY29tPgo+Pj4KPj4+IFdoYXQgZG9lcyBMaWFvIGhhdmUgdG8gZG8gd2l0aCB0aGlzIHBhdGNo
Pwo+PiBJIGp1c3QgcHJvdmlkZSBzb21lIHN1Z2dlc3Rpb24gdG8gQ2hlbiBHdW9rYWkgZHVyaW5n
IGRldmVsb3BtZW50IDspCj4+IHBsZWFzZSByZW1vdmUgbXkgaW5mbyBmcm9tIFNpZ25lZC1vZmYt
YnkgdGFnLgo+IAo+IERvZXMgdGhhdCBtZWFuIHRoYXQgdGhlICJjb3B5cmlnaHQgMjAyMiBIdWF3
ZWkiIGlzIGFsc28gbm90IGFjY3VyYXRlPwpJbmFjY3VyYXRlLCBwbGVhc2UgcmVtb3ZlICJjb3B5
cmlnaHQgMjAyMiBIdWF3ZWkiLHRoYW5rcyBmb3IgY2hlY2tpbmcuCgo+ICAgCj4gCj4gCgotLSAK
QlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
