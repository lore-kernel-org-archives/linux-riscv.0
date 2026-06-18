Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C4CD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bqpbeAk0i77TFhmkCRHkvnHWSwPHVf2P88ptM3/oaw=; b=qJuWbXoHw+IHCH
	LxfYEC9ZoMPjdOluX9MoBjucKC/8gN/cmdQ7NHtSJ0K3cU2tjuoxq9FHiXjaLK+DG6f6rdBfbpVhG
	+xZd/taGSX2WqxuAwFowNc59U/7pzkfplOxxXaI744QoOH3HJEeH2Zj80mUyfhgAsbFg0e4OCFxrD
	JummUnwZvY8sobupHeGopNtCESnrlThG+PDZpwxc2uSFYYUxDbg5iY2+O3iOXte1CmaFpXVEt2XYV
	+ZwccwCCVnB/fL9N/zSFmUDYA6MNWGsGBCDs9XliG0lO/jpazKnZifOCJdi7baLj/JS8CNMq4FRd+
	FWKEkFYcKaMOZQDJ+sWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Fy-00000000lep-0FSQ;
	Thu, 18 Jun 2026 07:33:46 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Fu-00000000leL-0iYw
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 07:33:44 +0000
Received: from [192.168.0.107] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowAA30MhJnzNqCH4tAg--.7817S2;
	Thu, 18 Jun 2026 15:33:29 +0800 (CST)
Message-ID: <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn>
Date: Thu, 18 Jun 2026 15:33:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Guo Ren <guoren@kernel.org>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org,
 yuanzhu@bytedance.com
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org>
 <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
X-CM-TRANSID: qwCowAA30MhJnzNqCH4tAg--.7817S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr17uw43Kw45KFW3uFyxAFb_yoW5AF17pa
	n8G3WUKF4ktr1Iyw1qvw1xXay5K34vkayUCr95GryxZwnxZF15twsFgrW5C3WDJr1kuw1F
	vrW2q34xWFyDCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_003342_598134_B6829348 
X-CRM114-Status: GOOD (  14.77  )
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

T24gNi8xOC8yNiAxMTo0NSwgR3VvIFJlbiB3cm90ZToKPiBPbiBUaHUsIEp1biAxOCwgMjAyNiBh
dCAxMToyMOKAr0FNIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6
Cj4+IE9uIDYvMTUvMjYgMjA6MzgsIEd1byBSZW4gd3JvdGU6Cj4+PiBIaSBaaGFucGVuZyBaaGFu
ZywKPj4+Cj4+PiBJIG5vdGljZWQgeW91IHBvc3RlZCBhIHNpbWlsYXIgZml4IHJlY2VudGx5LiBI
b3dldmVyLCBJIGhhZCBhbHJlYWR5Cj4+PiBzdWJtaXR0ZWQgYSBzaW1pbGFyIHNvbHV0aW9uIGJh
Y2sgaW4gU2VwdGVtYmVyIDIwMjUgWzFdLiBJdCB3b3VsZCBiZQo+Pj4gZ3JlYXQgaWYgeW91IGNv
dWxkIHJldmlldyBpdC4gQSBmZXcgY29uY2VybnMgd2l0aCB0aGUgY3VycmVudCBwYXRjaDoKPj4+
Cj4+PiAxLiBVc2luZyBzcGluX2xvY2tfaXJxc2F2ZSBpbiBzdWNoIGEgc21hbGwgc2VtYW50aWMg
c3RydWN0dXJlIGlzCj4+PiB1bm5lY2Vzc2FyeS4gSVJRIHByb3RlY3Rpb24gc2hvdWxkIGJlIHBy
b3ZpZGVkIGJ5IHRoZSBoaWdoZXItbGV2ZWwKPj4+IElPTU1VIGRyaXZlciBpbnRlcmZhY2VzLiBN
YW55IGV4aXN0aW5nIGNhbGwgc2l0ZXMgYWxyZWFkeSBoYW5kbGUgSVJRCj4+PiBkaXNhYmxpbmcs
IHNvIGFkZGluZyBpdCBoZXJlIGZlZWxzIHJlZHVuZGFudCBhbmQgYWRkcyBhdm9pZGFibGUKPj4+
IG92ZXJoZWFkLgo+Pj4KPj4+IDIuIE1vcmUgY3JpdGljYWxseSwgdGhlIFJJU0NWX0lPTU1VXzMy
QklUX0FDQ0VTUyBLY29uZmlnIG9wdGlvbiBpcwo+Pj4gcHJvYmxlbWF0aWMuIEFjY29yZGluZyB0
byB0aGUgUklTQy1WIElPTU1VIHNwZWNpZmljYXRpb24gKFNvZnR3YXJlCj4+PiBHdWlkZWxpbmVz
LCDigJxSZWFkaW5nIGFuZCB3cml0aW5nIElPTU1VIHJlZ2lzdGVyc+KAnSk6Cj4+Pgo+Pj4+IFJl
Z2lzdGVycyB0aGF0IGFyZSA2NC1iaXQgd2lkZSBtYXkgYmUgYWNjZXNzZWQgdXNpbmcgZWl0aGVy
IGEgMzItYml0Cj4+Pj4gb3IgYSA2NC1iaXQgYWNjZXNzLgo+Pj4gVGhpcyBjbGVhcmx5IHJlcXVp
cmVzIHRoYXQgYW55IGhhcmR3YXJlIHN1cHBvcnRpbmcgNjQtYml0IE1NSU8gYWNjZXNzCj4+PiBt
dXN0IGFsc28gc3VwcG9ydCAzMi1iaXQgTU1JTyBhY2Nlc3MuIFRoZXJlZm9yZSwgdGhlIElPTU1V
IGRyaXZlciBzaG91bGQKPj4+IGJlIGJ1aWx0IG9uIGEgMzItYml0IGFjY2VzcyBiYXNlIGZvciBt
YXhpbXVtIGhhcmR3YXJlIGNvbXBhdGliaWxpdHkuCj4+IEkgYWdyZWUgdGhhdCB0aGUgZHJpdmVy
IHNob3VsZCBiZSBidWlsZCB3aXRoIDMyLWJpdCBhY2Nlc3NlcyB0byBzdXBwb3J0Cj4+IHRoZXNl
IGhhcmR3YXJlLiBIb3dldmVyIHRoZXJlJ3Mgb25lIG1pbm9yIHRoaW5nIHRoYXQgSSB3YW50IHRv
IHByb3Bvc2UKPj4gcmVnYXJkaW5nIHRoaXMsIGZvciB0aGUgc2FrZSBvZiBjbGFyaXR5Ogo+Pgo+
PiBSSVNDLVYgSU9NTVUgaW1wbGVtZW50YXRpb25zIHRoYXQgZG8gbm90IHN1cHBvcnQgNjQtYml0
IGFjY2Vzc2VzIGFyZSBub3QKPj4gZnVsbHkgY29tcGxpYW50IHdpdGggdGhlIFJJU0MtViBJT01N
VSBzcGVjaWZpY2F0aW9uIGFuZCBzaG91bGQgbm90IHVzZQo+PiB0aGUgc3RhbmRhcmQgUklTQy1W
IGlkZW50aWZpZXJzLCBuYW1lbHk6Cj4+Cj4+IC0gRGV2aWNldHJlZSBjb21wYXRpYmxlIHJpc2N2
LGlvbW11Cj4+IC0gQUNQSSBISUQgUlNDVjAwMDQKPj4KPj4gVGhpcywgaW4gbXkgb3Bpbmlvbiwg
aXMgbm90IG9ubHkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIChub3QgY2xhaW1pbmcgdG8KPj4gYmUg
c3RhbmRhcmQgaGFyZHdhcmUgd2l0aG91dCBhY3R1YWxseSBiZWluZyBzdGFuZGFyZCBoYXJkd2Fy
ZSksIGJ1dCBhbHNvCj4+IHNhdmVzIGEgbG90IG9mIHRyb3VibGUgZm9yIG9wZXJhdGluZyBzeXN0
ZW0gZGV2ZWxvcGVycyAoeWVzLCB0aGVyZSBhcmUKPj4gUklTQy1WIG9wZXJhdGluZyBzeXN0ZW1z
IG90aGVyIHRoYW4gTGludXggb3V0IHRoZXJlKSwgc2luY2UgaW52YWxpZCBJTwo+PiBhY2Nlc3Nl
cyB1c3VhbGx5IG1hbmlmZXN0IGFzIG15c3RlcmlvdXMgYWNjZXNzIGZhdWx0cyAodGhhdCB3b3Vs
ZAo+PiB1c3VhbGx5IHN1Z2dlc3QgYW4gaW5jb3JyZWN0IElPTU1VIGFkZHJlc3MpLCBvciB3b3Jz
ZSwgc3lzdGVtIGhhbmdzLgo+Pgo+PiBJIHdvdWxkIGFwcHJlY2lhdGUgaWYgdGhlIGhhcmR3YXJl
IHZlbmRvcnMgc2hpcHBpbmcgMzItYml0LWFjY2Vzcy1vbmx5Cj4+IElPTU1VcyB3b3VsZCBjb25z
aWRlciB0aGlzLgo+Pgo+PiBWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCj4+Cj4gMzItYml0IE1N
SU8gYWNjZXNzIGlzIGV4cGxpY2l0bHkgc3VwcG9ydGVkIGJ5IHRoZSBSSVNDLVYgSU9NTVUKPiBz
cGVjaWZpY2F0aW9uIGFuZCBpcyBhIHZhbGlkIGNob2ljZSAoNjQtYml0IE1NSU8gYWNjZXNzIGlz
IG9wdGlvbmFsKS4KCkhtbS4uLiBJIHRoaW5rIGl0J3Mgb3B0aW9uYWwgaW4gc29mdHdhcmUgYnV0
IG5vdCBvcHRpb25hbCBpbiBoYXJkd2FyZSwKYnV0IHRoZSBzcGVjcyBhcmUgbm90IHN1cGVyIGNs
ZWFyIG9uIHRoaXMuIEkndmUgb3BlbmVkIGEgR2l0SHViIGlzc3VlIHRvCmFzazoKCiAgICBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1pb21tdS9pc3N1ZXMvNzY1Cgo+IDY0
LWJpdCBNTUlPIGFjY2VzcyBpcyBub3QgImZyZWUiIOKAlCBpdCBjb25zdW1lcyBhZGRpdGlvbmFs
IGludGVyY29ubmVjdAo+IGhhcmR3YXJlIHJlc291cmNlcy4KPgo+IENvdWxkIHlvdSBlbGFib3Jh
dGUgb24gdGhlIGNvbmNyZXRlIGJlbmVmaXQgb2YgdXNpbmcgNjQtYml0IE1NSU8KPiBhY2Nlc3Mg
aW4gdGhpcyBkcml2ZXIsIGZvciB0aGVzZSBub24tUE1VIHJlZ2lzdGVycz8gQSBjbGVhcgo+IGp1
c3RpZmljYXRpb24gd291bGQgaGVscCBldmFsdWF0ZSB3aGV0aGVyIHRoZSB0cmFkZS1vZmYgaXMg
d29ydGh3aGlsZS4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
