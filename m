Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF1CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNxZk1zYvi6y7LqJ31MYNF2EVvDQmbsx1SKciRVqBNA=; b=i1EpQtt2scCSdD
	UtU2ZRWxV1PoGVK71dJg8wCcZY3OMdGzNbdjBNhf1D1Q/6JYqUijQYT+bY/wG/gd59z3scmj2I/o9
	sVCf7EnhKIo5g5DAj4aHYgiHOqa4EqcddH0Y1E826NOhW0TR5cnMOOq/BauGKLN8bPJjJzpDA9Fdr
	cvFdKCi/jx2QH2VQkHT4iYigZ4+jl2frRqadj70xWDruoyveITDhdq+DV3ePmBOoSI1nPXk3uv4Bx
	fJxer4E+CxoI/G2vvkCubKCnqxivzD1Lzsvlyp6GKtTe3szts1dd43LHm+pIllQf9UzasjSDW3pjZ
	JPgpCANmbzEKlpFLr3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPddA-00000004Etx-3l6F;
	Wed, 20 May 2026 09:54:24 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdd6-00000004Er6-1UEa
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779270856; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=wHQ9qfRCExCn044qkCOJYBlx1vnsQcVgKurXXWpgTbI=;
	b=lTNUu/sFCJgXbLOqEgRNwN9lpoqYzmT80bLFB1gCibsjvrYH1it7WMbtdF1VZkrJ8Ux4Nb1S3HiKROj5yZe0u4T0rUq2eXeauj5CNklhQP6MURgRjJgGDaONq+zB3ScwGBhyqtgJ9iAg3JXzDptLMlwciF6fUOClzbOuqe18xoo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X3IbTSf_1779270853;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X3IbTSf_1779270853 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 May 2026 17:54:14 +0800
From: fangyu.yu@linux.alibaba.com
To: sunilvl@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org
Subject: Re: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are described 
Date: Wed, 20 May 2026 17:54:11 +0800
Message-Id: <20260520095411.92045-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAB19ukGk2AUA3yjsrBxjsUsH9pUSeeu5F6vo1FFBcd504VQPzg@mail.gmail.com>
References: <CAB19ukGk2AUA3yjsrBxjsUsH9pUSeeu5F6vo1FFBcd504VQPzg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_025421_091572_2367C446 
X-CRM114-Status: GOOD (  16.43  )
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

Pj4KPj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+
IFRoZSBSSVNDLVYgSU9NTVUgc3BlYyBkZWZpbmVzIElHUz1CT1RIIGFzIHN1cHBvcnRpbmcgYm90
aCBNU0kgYW5kCj4+IFdTSSwgd2l0aCBzb2Z0d2FyZSBzZWxlY3RpbmcgdGhlIHBhdGguIFRoZSBE
VCBwYXRoIGFscmVhZHkgYmVoYXZlcwo+PiBhcyBleHBlY3RlZCBieSBzZWxlY3RpbmcgV1NJIHdo
ZW4gd2lyZWQgSVJRIHJlc291cmNlcyBhcmUgZGVzY3JpYmVkLgo+PiBUaGUgQUNQSSBwYXRoLCBo
b3dldmVyLCBjdXJyZW50bHkgZmFsbHMgYmFjayB0byBNU0kgZXZlbiB3aGVuCj4+IGZpcm13YXJl
IGRlc2NyaWJlcyB3aXJlZCBJUlEgcmVzb3VyY2VzLgo+Pgo+PiBVc2UgZmlybXdhcmUtZGVzY3Jp
YmVkIHdpcmVkIElSUSByZXNvdXJjZXMgYXMgdGhlIHRyaWdnZXIgdG8gc2VsZWN0Cj4+IFdTSSBm
b3IgSUdTPUJPVEg6Cj4+ICAgLSBEVDogImludGVycnVwdHMiIHByZXNlbnQsIG5vICJtc2ktcGFy
ZW50Igo+PiAgIC0gQUNQSTogRFNEVCBfQ1JTIEludGVycnVwdCgpIGRlc2NyaXB0b3JzCj4+ICAg
ICAobWFpbmxpbmUgZG9lcyBub3QgeWV0IHBhcnNlIHRoZSBSSU1UIEludGVycnVwdCBXaXJlIEFy
cmF5KQo+Pgo+PiBXaGVuIHRyaWdnZXJlZCwgcmV3cml0ZSBpZ3MgdG8gSUdTX1dTSSBhbmQgcmV1
c2UgdGhlIGV4aXN0aW5nIFdTSQo+PiBoYW5kbGluZy4gS2VlcCB0aGUgZXhpc3RpbmcgYmVoYXZp
b3VyIG90aGVyd2lzZS4KPj4KPj4gRml4ZXM6IGQ1Zjg4YWNkZDZmZiAoImlvbW11L3Jpc2N2OiBB
ZGQgc3VwcG9ydCBmb3IgcGxhdGZvcm0gbXNpIikKPj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1
IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9pb21tdS9y
aXNjdi9pb21tdS1wbGF0Zm9ybS5jIHwgMTUgKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9y
aXNjdi9pb21tdS1wbGF0Zm9ybS5jIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wbGF0Zm9y
bS5jCj4+IGluZGV4IDM5OWJhOGZlMWIzZS4uYmQ3NzEyMjMxMTQwIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMKPj4gKysrIGIvZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jCj4+IEBAIC03MSw2ICs3MSwyMSBAQCBzdGF0aWMgaW50
IHJpc2N2X2lvbW11X3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4+ICAgICAgICAgaW9tbXUtPmlycXNfY291bnQgPSBSSVNDVl9JT01NVV9JTlRSX0NPVU5UOwo+
Pgo+PiAgICAgICAgIGlncyA9IEZJRUxEX0dFVChSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSUdT
LCBpb21tdS0+Y2Fwcyk7Cj4+ICsKPj4gKyAgICAgICAvKgo+PiArICAgICAgICAqIElHUz1CT1RI
IG1lYW5zIHRoZSBJT01NVSBzdXBwb3J0cyBlaXRoZXIgTVNJIG9yIFdTSTsKPj4gKyAgICAgICAg
KiB0aGUgc3BlYyBsZWF2ZXMgdGhlIGNob2ljZSB0byBzb2Z0d2FyZS4gVXNlIHRoZSBmaXJtd2Fy
ZS1kZXNjcmliZWQKPj4gKyAgICAgICAgKiB3aXJlZCBpbnRlcnJ1cHQgcmVzb3VyY2VzIGFzIHRo
ZSB0cmlnZ2VyOgo+PiArICAgICAgICAqICAgLSBEVCAgOiAiaW50ZXJydXB0cyIgcHJvcGVydHkg
cHJlc2VudCwgbm8gIm1zaS1wYXJlbnQiICAtPiBXU0kKPj4gKyAgICAgICAgKiAgIC0gQUNQSTog
RFNEVCBfQ1JTIEludGVycnVwdCgpIHByZXNlbnQgIC0+IFdTSQo+PiArICAgICAgICAqIE90aGVy
d2lzZSBkZWZhdWx0IHRvIHRoZSBNU0kgcGF0aC4KPj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBp
ZiAoaWdzID09IFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19JR1NfQk9USCAmJgo+PiArICAgICAg
ICAgICBwbGF0Zm9ybV9pcnFfY291bnQocGRldikgPiAwKSB7Cj4+ICsgICAgICAgICAgICAgICBk
ZXZfaW5mbyhkZXYsICJmaXJtd2FyZSBkZXNjcmliZXMgd2lyZWQgSVJRczsgcHJlZmVycmluZyBX
U0kgb24gSUdTPUJPVEhcbiIpOwo+PiArICAgICAgICAgICAgICAgaWdzID0gUklTQ1ZfSU9NTVVf
Q0FQQUJJTElUSUVTX0lHU19XU0k7Cj4+ICsgICAgICAgfQo+PiArCj5Xb24ndCBpdCBjaGFuZ2Ug
dGhlIERUIGJlaGF2aW9yIGFzIGl0IGRvZXNuJ3QgY2hlY2sgbXNpLXBhcmVudAo+YW55bW9yZT8g
IElPVywgc2hvdWxkIHRoaXMgYmUgbWFkZSBzcGVjaWZpYyB0byBBQ1BJCj5ieSBjaGVja2luZyB3
aGV0aGVyIHRoZSBkZXZpY2Ugbm9kZSBpcyBhY3BpIG5vZGU/Cj4KClRoYW5rcyBmb3IgdGhlIHJl
dmlldywgeW91J3JlIHJpZ2h0IHRoYXQgdGhlIGN1cnJlbnQgY29uZGl0aW9uIHdvdWxkCmFmZmVj
dCBEVCBhcyB3ZWxsLgoKTXkgYXNzdW1wdGlvbiB3YXMgdGhhdCBEVCB3b3VsZCBkZXNjcmliZSBl
aXRoZXIgImludGVycnVwdHMiIGZvciBXU0kKb3IgIm1zaS1wYXJlbnQiIGZvciBNU0ksIGJ1dCBu
b3QgYm90aCwgc28gcGxhdGZvcm1faXJxX2NvdW50KCkgPiAwCndvdWxkIGVmZmVjdGl2ZWx5IGlt
cGx5ICJubyBtc2ktcGFyZW50IiBpbiBwcmFjdGljZS4KClRoYXQgc2FpZCwgSSBhZ3JlZSB0aGF0
IHRoaXMgc2hvdWxkIGJlIGxpbWl0ZWQgdG8gdGhlIEFDUEkgcGF0aC4gVGhhdAptYXRjaGVzIHRo
ZSBhY3R1YWwgYnVnIHNjb3BlIOKAlCBvbmx5IEFDUEkgd2FzIGZhbGxpbmcgYmFjayB0byBNU0kg
d2hlbgp3aXJlZCBJUlFzIHdlcmUgZGVzY3JpYmVkIOKAlCBhbmQgbGVhdmVzIERUIHVuY2hhbmdl
ZC4KCkknbGwgcmVzcGluIGEgdjIgdG8gc2NvcGUgdGhlIGZpeCB0byBBQ1BJIG9ubHksIGFuZCB0
aWdodGVuIHRoZSBjb21taXQKbWVzc2FnZSBhY2NvcmRpbmdseS4KClRoYW5rcywKRmFuZ3l1Cgo+
VGhhbmtzLAo+U3VuaWwKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
