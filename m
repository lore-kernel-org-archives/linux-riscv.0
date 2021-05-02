Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B98C433B4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 08:15:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCC0613BC
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 08:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCC0613BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r/Y4xKX5J5tO/5OnQe96d/FiiR37eck8XU0/HyjQT1M=; b=fYonKmgYvH0lSyIz11ltSQy8w
	kOleZyyiBrM0MJw+JrLln92XAaK3FViUd4VHFayjgFtKuLXrhxk37sWsYP+XICq1zFIE+mk6T6UKc
	yFWcoyQza/MwB8VcMsw9G3/eKmA0gByMK2mPIYfsy4ul7wBNw5SFnTBOmUQZLhdTBv7xGBcxslhyo
	p22Z9tF1Kl3S0Sz8iHXBq5KS3GKcZnIFZfQzyv3kPnjeECRyIP8c2bLzxknaFLo/EwrKZm7adxoEm
	hm5sP8s/5k1mK33RjTrr4xlTSFKcu4C+GLDXMZvM0MtfaxMzsmET3CWG2zfVD/+WvYDJ8TAKGCgR3
	ADbgrO0yA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ld7FV-00BSYF-US; Sun, 02 May 2021 08:14:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ld7FT-00BSY7-3n
 for linux-riscv@desiato.infradead.org; Sun, 02 May 2021 08:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=46vfRkpX9Y+aavOq2S96NoVv71khKupw7fNdu/JtXi4=; b=w3qL1GKIKt+cKCl9bkQJ/yHnSd
 yU5uBuzrX1gHb9+8erGyubcTImjwoXdErl9cwXgSpWwr4JxwhyaBXMW4NGSK4mVj8BGF4NneaGLuu
 7SzrlfBuKzRq3k24ZhUaTiWZPRT4StOC3yhPmb8Pa3g0FKKrUD9MVjCv6/GnyG//3DVr8MCgbVEXi
 rJh9H4rc2ouCkKW++0hiPpyOe/JVH2npGpgW1QIHYDYZtsiSaKNZlAz7TiPQRk5lEFF2frYuw4kk4
 SEsY5aIENb4J8EFmxD1Zp4/8ccZK/HWO9tHrVguyXtPVxLcLg89kMxMhOEt93mpDyzl0j7hu87zMC
 C1sn2l4A==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ld7FP-002MYA-MR
 for linux-riscv@lists.infradead.org; Sun, 02 May 2021 08:14:41 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0771E1C0003;
 Sun,  2 May 2021 08:14:27 +0000 (UTC)
Subject: Re: [PATCH] RISC-V: Always define XIP_FIXUP
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com,
 rppt@kernel.org, vitaly.wool@konsulko.com, greentime.hu@sifive.com,
 0x7f454c46@gmail.com, chenhuang5@huawei.com, linux-kernel@vger.kernel.org,
 kernel-team@android.com, linux@roeck-us.net
References: <mhng-2e1a7543-84bc-4954-843a-b577fc132157@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <436e619a-de98-9948-9ccf-62a2f943142e@ghiti.fr>
Date: Sun, 2 May 2021 04:14:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-2e1a7543-84bc-4954-843a-b577fc132157@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_011440_056438_8A6821FE 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKTGUgNC8yOS8yMSDDoCAxMjo0MyBBTSwgUGFsbWVyIERhYmJlbHQgYSDDqWNy
aXTCoDoKPiBPbiBXZWQsIDI4IEFwciAyMDIxIDAxOjI1OjU1IFBEVCAoLTA3MDApLCBhbGV4QGdo
aXRpLmZyIHdyb3RlOgo+PiBMZSA0LzI3LzIxIMOgIDExOjM0IFBNLCBQYWxtZXIgRGFiYmVsdCBh
IMOpY3JpdMKgOgo+Pj4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xl
LmNvbT4KPj4+Cj4+PiBYSVAgZGVwZW5kcyBvbiBNTVUsIGJ1dCBYSVBfRklYVVAgaXMgZGVmaW5l
ZCB0aHJvdWdob3V0IHRoZSBrZXJuZWwgaW4KPj4+IG9yZGVyIHRvIGF2b2lkIGV4Y2Vzc2l2ZSBp
ZmRlZnMuwqAgVGhpcyBqdXN0IG1ha2VzIHN1cmUgdG8gYWx3YXlzIGRlZmluZQo+Pj4gWElQX0ZJ
WElQLCB3aGljaCB3aWxsIGZpeCBNTVU9biBidWlsZHMuCj4+Cj4+IEEgc21hbGwgdHlwbyBoZXJl
Lgo+IAo+IEFjdHVhbGx5IHR3bzogImRlZmluZWQiIHNob3VsZCBoYXZlIGJlZW4gInVzZWQiLsKg
IEJvdGggYXJlIGZpeGVkLgo+IAo+Pgo+Pj4KPj4+IEZpeGVzOiA0NGM5MjI1NzI5NTIgKCJSSVND
LVY6IGVuYWJsZSBYSVAiKQo+Pj4gUmVwb3J0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4KPj4+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJi
ZWx0QGdvb2dsZS5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIAo+Pj4gYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+Pj4gaW5kZXggMmYxMzg0ZTE0ZTMxLi5mZDc0OTM1MWY0MzIgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+IEBAIC03MywxOCArNzMsNiBAQAo+
Pj4gwqAgI2VuZGlmCj4+PiDCoCAjZGVmaW5lIEZJWEFERFJfU1RBUlTCoMKgwqAgKEZJWEFERFJf
VE9QIC0gRklYQUREUl9TSVpFKQo+Pj4KPj4+IC0jaWZkZWYgQ09ORklHX1hJUF9LRVJORUwKPj4+
IC0jZGVmaW5lIFhJUF9PRkZTRVTCoMKgwqDCoMKgwqDCoCBTWl84TQo+Pj4gLSNkZWZpbmUgWElQ
X0ZJWFVQKGFkZHIpICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqAgdWludHB0cl90IF9fYSA9ICh1aW50cHRyX3QpKGFk
ZHIpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqAg
KF9fYSA+PSBDT05GSUdfWElQX1BIWVNfQUREUiAmJiBfX2EgPCBDT05GSUdfWElQX1BIWVNfQURE
UiArIAo+Pj4gU1pfMTZNKSA/wqDCoMKgIFwKPj4+IC3CoMKgwqDCoMKgwqDCoCBfX2EgLSBDT05G
SUdfWElQX1BIWVNfQUREUiArIENPTkZJR19QSFlTX1JBTV9CQVNFIC0gCj4+PiBYSVBfT0ZGU0VU
IDpcCj4+PiAtwqDCoMKgwqDCoMKgwqAgX19hO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqAgfSkKPj4+IC0j
ZWxzZQo+Pj4gLSNkZWZpbmUgWElQX0ZJWFVQKGFkZHIpwqDCoMKgwqDCoMKgwqAgKGFkZHIpCj4+
PiAtI2VuZGlmIC8qIENPTkZJR19YSVBfS0VSTkVMICovCj4+PiAtCj4+PiDCoCAjZW5kaWYKPj4+
Cj4+PiDCoCAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+Pj4gQEAgLTEwMSw2ICs4OSwxOCBAQAo+Pj4g
wqAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLTMyLmg+Cj4+PiDCoCAjZW5kaWYgLyogQ09ORklHXzY0
QklUICovCj4+Pgo+Pj4gKyNpZmRlZiBDT05GSUdfWElQX0tFUk5FTAo+Pj4gKyNkZWZpbmUgWElQ
X09GRlNFVMKgwqDCoMKgwqDCoMKgIFNaXzhNCj4+Cj4+Cj4+IFhJUF9PRkZTRVQgaXMgdXNlZCBp
biBoZWFkLlMgYW5kIHRoZW4gdGhpcyBicmVha3MgWElQX0tFUk5FTC4gWElQX09GRlNFVAo+PiBt
dXN0IGxpdmUgb3V0c2lkZSB0aGUgaWZuZGVmIF9fQVNTRU1CTFlfXy4KPiAKPiBUaGFua3MsIEkg
aGFkbid0IGV2ZW4gc2VlbiBYSVBfT0ZGU0VULsKgIFRoaXMgaXMgZml4ZWQgaW4gdGhlIHYyLgo+
IAo+IERvIHlvdSBoYXZlIGFuIFhJUCBjb25maWcgdGhhdCB3aWxsIHJ1biBvbiBRRU1VLCBhbmQg
YSB3YXkgdG8gcnVuIGl0PyBJZiAKPiBzbywgY2FuIHlvdSBwb3N0IGEgZGVmY29uZmlnIGFuZCBz
b21lIGluc3RydWN0aW9ucz/CoCBUaGF0J2xsIG1ha2UgaXQgCj4gZWFzaWVyIHRvIHRlc3Qgb24g
bXkgZW5kLgoKCkkgcG9zdGVkIGEgdHV0b3JpYWwgaGVyZSBvbiBob3cgSSB0ZXN0IFhJUCBrZXJu
ZWw6CgpodHRwczovL2FsZXhnaGl0aS5naXRodWIuaW8veGlwL1hJUC5odG1sCgpJZiBzb21ldGhp
bmcgZG9lcyBub3Qgd29yayBmb3IgeW91LCBwbGVhc2UgdGVsbCBtZS4KCkFsZXgKCj4gCj4+PiAr
I2RlZmluZSBYSVBfRklYVVAoYWRkcikgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gK8KgwqDCoCB1aW50cHRyX3QgX19hID0gKHVp
bnRwdHJfdCkoYWRkcik7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+
Pj4gK8KgwqDCoCAoX19hID49IENPTkZJR19YSVBfUEhZU19BRERSICYmIF9fYSA8IENPTkZJR19Y
SVBfUEhZU19BRERSICsgCj4+PiBTWl8xNk0pID/CoMKgwqAgXAo+Pj4gK8KgwqDCoMKgwqDCoMKg
IF9fYSAtIENPTkZJR19YSVBfUEhZU19BRERSICsgQ09ORklHX1BIWVNfUkFNX0JBU0UgLSAKPj4+
IFhJUF9PRkZTRVQgOlwKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2E7wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gK8KgwqDC
oCB9KQo+Pj4gKyNlbHNlCj4+PiArI2RlZmluZSBYSVBfRklYVVAoYWRkcinCoMKgwqDCoMKgwqDC
oCAoYWRkcikKPj4+ICsjZW5kaWYgLyogQ09ORklHX1hJUF9LRVJORUwgKi8KPj4+ICsKPj4+IMKg
ICNpZmRlZiBDT05GSUdfTU1VCj4+PiDCoCAvKiBOdW1iZXIgb2YgZW50cmllcyBpbiB0aGUgcGFn
ZSBnbG9iYWwgZGlyZWN0b3J5ICovCj4+PiDCoCAjZGVmaW5lIFBUUlNfUEVSX1BHRMKgwqDCoCAo
UEFHRV9TSVpFIC8gc2l6ZW9mKHBnZF90KSkKPj4+Cj4+Cj4+IFRoYW5rIHlvdSBmb3IgZG9pbmcg
dGhhdCEKPj4KPj4gQWxleAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
