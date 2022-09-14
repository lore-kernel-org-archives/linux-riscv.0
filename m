Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2E1C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 00:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdmpEiiv3acjanNLYXJ64b6SXgQt1pRwSOmW4bQJdd8=; b=n0Fe2e6rzbP7nZ
	Hj51tpOOTmIX+CXNjqtJKPXRWotmrB/d96bxtEl8bJv0ZdxURzmmIaXCMlYZPG9kRrZKdT6NeOcYI
	KNgPox9AGX07BeJcyB9ouG0RNLrz8v7/8xUMrpM4UaAr8HKAIeoaWNkpOpOAT0l/YSBtnse2sKYEG
	anSunDnf2f+50HsfI3RDg9OxmLlNUIgbmDPFYFj3A+s617JTPjSpUq2YQPlZYt9KhbAYSR5KkIeej
	bncLD9vClp5XLsk2HrzedAmNXLQ0RzTE1GrjvHhmM59p2vdE963TsDqE2NVBzu+Qw1pnpXNYTfpIH
	V1VdPpoGgJrI9b9L9G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYGWn-002dsr-6n; Wed, 14 Sep 2022 00:45:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYGWi-002dnn-3R
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 00:45:18 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS1hg4tMvzNmCJ;
	Wed, 14 Sep 2022 08:40:35 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 08:45:10 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 08:45:10 +0800
Message-ID: <09622f14-9c17-a946-3158-27224391e08d@huawei.com>
Date: Wed, 14 Sep 2022 08:45:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH] riscv: Fix TRACE_IRQFLAGS call points in entry.S
To: Guo Ren <guoren@kernel.org>
CC: <paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mark.rutland@arm.com>,
	<frederic@kernel.org>, <nsaenzju@redhat.com>, <paulmck@kernel.org>,
	<liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220909094230.252031-1-zouyipeng@huawei.com>
 <CAJF2gTQhUFBGb7yXJ71=soGxXgNRXzBz6Da-EaXQYR9Y-FS2kw@mail.gmail.com>
 <b48224e6-a83e-b36f-edbd-42367d97d8b2@huawei.com>
 <CAJF2gTRAPW-HoT9gPUvY2h8W9Ue2L1RFzZxnWYrS06Qg0QuhBw@mail.gmail.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <CAJF2gTRAPW-HoT9gPUvY2h8W9Ue2L1RFzZxnWYrS06Qg0QuhBw@mail.gmail.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_174516_550263_25E6C478 
X-CRM114-Status: GOOD (  11.20  )
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

CuWcqCAyMDIyLzkvMTMgMjE6NDUsIEd1byBSZW4g5YaZ6YGTOgo+IE9uIFR1ZSwgU2VwIDEzLCAy
MDIyIGF0IDc6MjEgUE0gWWlwZW5nIFpvdSA8em91eWlwZW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+
Pgo+PiDlnKggMjAyMi85LzExIDg6NDUsIEd1byBSZW4g5YaZ6YGTOgo+Pj4gSSB0aGluayBpdCB3
b3VsZCBiZSBmaXhlZCBieSBHRU5FUklDX0VOVFJZLiBZb3UgY291bGQgaGF2ZSBhIHRyeS4KPj4+
Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIyMDkwODAyMjUwNi4x
Mjc1Nzk5LTEtZ3VvcmVuQGtlcm5lbC5vcmcvCj4+IEkgdGVzdCB5b3VyIHBhdGNoIGFuZCB5ZXMg
dGhlIFdBUk5JTkcgd2FzIGdvbmUuCj4gVGh4LCBjb3VsZCB5b3UgZ2l2ZSBtZSBhIFRlc3RlZC1i
eT8Kc3VyZSwgaSB3aWxsIHJlcGx5IGl0IGxhdGUuCj4+IEJ1dCBJJ20ganVzdCB3b25kZXJpbmcg
YWJvdXQgdGhlIG90aGVyIHN0YWJsZSBicmFuY2hlcywgd2lsbCB5b3VyIHBhdGNoCj4+IGJlIG1l
cmdlZCBpbnRvIHRoZXNlIGJyYW5jaGVzPwo+IE5vLCB5b3VyIHBhdGNoIGlzIHN0aWxsIHdvcnRo
IGZvciBzdGFibGUgYnJhbmNoZXMuCm9rLiBnb3QgaXQuCj4+PiBPbiBGcmksIFNlcCA5LCAyMDIy
IGF0IDU6NDYgUE0gWWlwZW5nIFpvdTx6b3V5aXBlbmdAaHVhd2VpLmNvbT4gIHdyb3RlOgo+Pj4+
IFRSQUNFX0lSUUZMQUdTIG5lZWQgdHJhY2UgYWxsIHtFbmFibGUsRGlzYWJsZX0gaGFyZCBpbnRl
cnJ1cHRzIHBvaW50cwo+Pj4+IGluIGVudHJ5LlMuCj4+Pj4gV2UgbWlzcyBhIHBhdGgod29ya19u
b3RpZnlzaWcpIHRoYXQgY2F1c2UgYW4gV0FSTiBhcyBzaG93biBiZWxvdy4KPj4+Pgo+Pj4+IFsg
ICA1MC4zNjI0MzFdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+Pj4+IFsg
ICA1MC4zNjM2MDddIERFQlVHX0xPQ0tTX1dBUk5fT04oIWxvY2tkZXBfaGFyZGlycXNfZW5hYmxl
ZCgpKQo+Pj4+IFsgICA1MC4zNjcyMjldIFdBUk5JTkc6IENQVTogMyBQSUQ6IDc0IGF0IGtlcm5l
bC9sb2NraW5nL2xvY2tkZXAuYzo1NTEwIGNoZWNrX2ZsYWdzKzB4MTBhLzB4MWUwCj4+Pj4gWyAg
IDUwLjM2ODkwNV0gTW9kdWxlcyBsaW5rZWQgaW46Cj4+Pj4gWyAgIDUwLjM2OTQ0MF0gQ1BVOiAz
IFBJRDogNzQgQ29tbTogcmNTIFRhaW50ZWQ6IEcKPj4+PiBbICAgNTAuMzcwMjI1XSBIYXJkd2Fy
ZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+Pj4gWyAgIDUwLjM3MDYzMl0gZXBjIDog
Y2hlY2tfZmxhZ3MrMHgxMGEvMHgxZTAKPj4+PiBbICAgNTAuMzcxMDE1XSAgcmEgOiBjaGVja19m
bGFncysweDEwYS8weDFlMAo+Pj4+IFsgICA1MC4zNzE3NTFdIGVwYyA6IGZmZmZmZmZmODA4ZTI2
NzAgcmEgOiBmZmZmZmZmZjgwOGUyNjcwIHNwIDogZmYyMDAwMDAwMGMzYmNhMAo+Pj4+IFsgICA1
MC4zNzI3MjFdICBncCA6IGZmZmZmZmZmODE3ZTIxODggdHAgOiBmZjYwMDAwMDAyZmUxODAwIHQw
IDogZmZmZmZmZmY4MTYyYTJhOAo+Pj4+IFsgICA1MC4zNzMzMjFdICB0MSA6IDAwMDAwMDAwMDAw
MDAwMDEgdDIgOiAyZDJkMmQyZDJkMmQyZDJkIHMwIDogZmYyMDAwMDAwMGMzYmNjMAo+Pj4+IFsg
ICA1MC4zNzM5MDNdICBzMSA6IGZmZmZmZmZmODE3ZTMzNDAgYTAgOiAwMDAwMDAwMDAwMDAwMDMw
IGExIDogZmZmZmZmZmY4MTY5M2ZhOAo+Pj4+IFsgICA1MC4zNzQ0NzZdICBhMiA6IDAwMDAwMDAw
MDAwMDAwMTAgYTMgOiBmZmZmZmZmZmZmZmZmZmZlIGE0IDogMDgzMTUxYTQyMmI4ZGYwMAo+Pj4+
IFsgICA1MC4zNzUwMzldICBhNSA6IDA4MzE1MWE0MjJiOGRmMDAgYTYgOiBmZmZmZmZmZjgwMDY4
OTFlIGE3IDogMDgzMTUxYTQyMmI4ZGYwMAo+Pj4+IFsgICA1MC4zNzYwMjhdICBzMiA6IGZmZmZm
ZmZmODE3ZTU0ZTAgczMgOiBmZmZmZmZmZjgxNjk1MDcwIHM0IDogZmY2MDAwMDAwMjdkNzgwMAo+
Pj4+IFsgICA1MC4zNzY5NzhdICBzNSA6IGZmZmZmZmZmODBjMjI3NzAgczYgOiAwMDAwMDAwMjAw
MDAwMDIyIHM3IDogZmZmZmZmZmZmZmZmZmZmZgo+Pj4+IFsgICA1MC4zNzc3NzldICBzOCA6IGZm
ZmZmZmZmODIzMDFlZDAgczkgOiAwMDAwMDAwMDAwMDAxMDAwIHMxMDogMDAwMDAwMDAwMDFhOTkw
NQo+Pj4+IFsgICA1MC4zNzgzMzVdICBzMTE6IDAwMDAwMDAwMDAxNGYzZTggdDMgOiBmZmZmZmZm
ZjgyMmQ3MTRmIHQ0IDogZmZmZmZmZmY4MjJkNzE0Zgo+Pj4+IFsgICA1MC4zNzg5NTVdICB0NSA6
IGZmZmZmZmZmODIyZDcxNTAgdDYgOiBmZjIwMDAwMDAwYzNiYTk4Cj4+Pj4gWyAgIDUwLjM3OTc4
M10gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTAwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1
c2U6IDAwMDAwMDAwMDAwMDAwMDMKPj4+PiBbICAgNTAuMzgwODEwXSBbPGZmZmZmZmZmODA4ZTI3
YmU+XSBsb2NrX2lzX2hlbGRfdHlwZSsweDc4LzB4MTRlCj4+Pj4gWyAgIDUwLjM4MTQ3N10gWzxm
ZmZmZmZmZjgwMDNlODUwPl0gX19taWdodF9yZXNjaGVkKzB4MjYvMHgyMmMKPj4+PiBbICAgNTAu
MzgyMDA2XSBbPGZmZmZmZmZmODAwM2VhOTI+XSBfX21pZ2h0X3NsZWVwKzB4M2MvMHg2Ngo+Pj4+
IFsgICA1MC4zODI0NzddIFs8ZmZmZmZmZmY4MDAyMzI0ZT5dIGdldF9zaWduYWwrMHhhYS8weDkx
Mgo+Pj4+IFsgICA1MC4zODI5NDddIFs8ZmZmZmZmZmY4MDAwNTM2OD5dIGRvX25vdGlmeV9yZXN1
bWUrMHg4Mi8weDQzNAo+Pj4+IFsgICA1MC4zODM4MzldIFs8ZmZmZmZmZmY4MDAwM2JlYz5dIHJl
dF9mcm9tX2V4Y2VwdGlvbisweDAvMHgxMAo+Pj4+Cj4+Pj4gRml4ZXM6IDNjNDY5Nzk4Mjk4MiAo
InJpc2N2OiBFbmFibGUgTE9DS0RFUF9TVVBQT1JUICYgZml4dXAgVFJBQ0VfSVJRRkxBR1NfU1VQ
UE9SVCIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogWWlwZW5nIFpvdTx6b3V5aXBlbmdAaHVhd2VpLmNv
bT4KPj4+PiAtLS0KPj4+PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIHwgNiArKysrKy0K
Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMKPj4+PiBpbmRleCBiOWVkYTNmY2JkNmQuLmY0ZDIzOTk1YTRmMSAx
MDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4+Pj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+Pj4+IEBAIC0zNzAsMTYgKzM3MCwyMCBAQCByZXN1bWVf
a2VybmVsOgo+Pj4+Cj4+Pj4gICAgd29ya19wZW5kaW5nOgo+Pj4+ICAgICAgICAgICAvKiBFbnRl
ciBzbG93IHBhdGggZm9yIHN1cHBsZW1lbnRhcnkgcHJvY2Vzc2luZyAqLwo+Pj4+IC0gICAgICAg
bGEgcmEsIHJldF9mcm9tX2V4Y2VwdGlvbgo+Pj4+ICAgICAgICAgICBhbmRpIHMxLCBzMCwgX1RJ
Rl9ORUVEX1JFU0NIRUQKPj4+PiAgICAgICAgICAgYm5leiBzMSwgd29ya19yZXNjaGVkCj4+Pj4g
ICAgd29ya19ub3RpZnlzaWc6Cj4+Pj4gKyNpZmRlZiBDT05GSUdfVFJBQ0VfSVJRRkxBR1MKPj4+
PiArICAgICAgIGNhbGwgX190cmFjZV9oYXJkaXJxc19vbgo+Pj4+ICsjZW5kaWYKPj4+PiArICAg
ICAgIGxhIHJhLCByZXRfZnJvbV9leGNlcHRpb24KPj4+PiAgICAgICAgICAgLyogSGFuZGxlIHBl
bmRpbmcgc2lnbmFscyBhbmQgbm90aWZ5LXJlc3VtZSByZXF1ZXN0cyAqLwo+Pj4+ICAgICAgICAg
ICBjc3JzIENTUl9TVEFUVVMsIFNSX0lFIC8qIEVuYWJsZSBpbnRlcnJ1cHRzIGZvciBkb19ub3Rp
ZnlfcmVzdW1lKCkgKi8KPj4+PiAgICAgICAgICAgbW92ZSBhMCwgc3AgLyogcHRfcmVncyAqLwo+
Pj4+ICAgICAgICAgICBtb3ZlIGExLCBzMCAvKiBjdXJyZW50X3RocmVhZF9pbmZvLT5mbGFncyAq
Lwo+Pj4+ICAgICAgICAgICB0YWlsIGRvX25vdGlmeV9yZXN1bWUKPj4+PiAgICB3b3JrX3Jlc2No
ZWQ6Cj4+Pj4gKyAgICAgICBsYSByYSwgcmV0X2Zyb21fZXhjZXB0aW9uCj4+Pj4gICAgICAgICAg
IHRhaWwgc2NoZWR1bGUKPj4+Pgo+Pj4+ICAgIC8qIFNsb3cgcGF0aHMgZm9yIHB0cmFjZS4gKi8K
Pj4+PiAtLQo+Pj4+IDIuMTcuMQo+Pj4+Cj4+IC0tCj4+IFJlZ2FyZHMsCj4+IFlpcGVuZyBab3UK
Pj4KPgotLSAKUmVnYXJkcywKWWlwZW5nIFpvdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
