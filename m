Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046DDC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWgjd6jM1J+Mu2zPdnyZsDvhFIaalWP44wBrmYytsgo=; b=IwDCt83+n8VM55
	2D7Qmi8UE4oT/ZYjiRQ3WjLfO7RVyk/fgmOQDgKFd23KXust1eD0uzCM7D3F9rzsJQiTg94eEMGUJ
	Czs5LRKp2SmfStdIFf1dZTBQ3BzB1BzPL+WwU4vtBPq2p7GNB03QcJXK1sbOCKrwEnkPu/07g0gCV
	qqCvyxfKzO+SPVG6zKqdmm/WJPt7Y8Y4IcSyBVrE1aQrJLPYZm3mSum54yZhzYOSF69z+nYcHg/FJ
	hRTnOnTsdgVfFdp39Tl42h1P98mjHylkNk+JfVQi8sVACOE19Kum2+slfx3Y7eVhIGxGEBiqNZAaC
	Cohy06VISNfrf8VdMylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3yS-008983-B6; Tue, 13 Sep 2022 11:21:04 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3yN-0088wE-Qb
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 11:21:02 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRgsP3rTzzkWwT;
	Tue, 13 Sep 2022 19:16:57 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 19:20:54 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 19:20:53 +0800
Message-ID: <b48224e6-a83e-b36f-edbd-42367d97d8b2@huawei.com>
Date: Tue, 13 Sep 2022 19:20:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
From: Yipeng Zou <zouyipeng@huawei.com>
Subject: Re: [PATCH] riscv: Fix TRACE_IRQFLAGS call points in entry.S
To: Guo Ren <guoren@kernel.org>
CC: <paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mark.rutland@arm.com>,
	<frederic@kernel.org>, <nsaenzju@redhat.com>, <paulmck@kernel.org>,
	<liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220909094230.252031-1-zouyipeng@huawei.com>
 <CAJF2gTQhUFBGb7yXJ71=soGxXgNRXzBz6Da-EaXQYR9Y-FS2kw@mail.gmail.com>
In-Reply-To: <CAJF2gTQhUFBGb7yXJ71=soGxXgNRXzBz6Da-EaXQYR9Y-FS2kw@mail.gmail.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_042100_456901_47B1394D 
X-CRM114-Status: GOOD (  11.35  )
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

CuWcqCAyMDIyLzkvMTEgODo0NSwgR3VvIFJlbiDlhpnpgZM6Cj4gSSB0aGluayBpdCB3b3VsZCBi
ZSBmaXhlZCBieSBHRU5FUklDX0VOVFJZLiBZb3UgY291bGQgaGF2ZSBhIHRyeS4KPgo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwOTA4MDIyNTA2LjEyNzU3OTktMS1n
dW9yZW5Aa2VybmVsLm9yZy8KCkkgdGVzdCB5b3VyIHBhdGNoIGFuZCB5ZXMgdGhlIFdBUk5JTkcg
d2FzIGdvbmUuCgpCdXQgSSdtIGp1c3Qgd29uZGVyaW5nIGFib3V0IHRoZSBvdGhlciBzdGFibGUg
YnJhbmNoZXMsIHdpbGwgeW91ciBwYXRjaCAKYmUgbWVyZ2VkIGludG8gdGhlc2UgYnJhbmNoZXM/
Cgo+IE9uIEZyaSwgU2VwIDksIDIwMjIgYXQgNTo0NiBQTSBZaXBlbmcgWm91PHpvdXlpcGVuZ0Bo
dWF3ZWkuY29tPiAgd3JvdGU6Cj4+IFRSQUNFX0lSUUZMQUdTIG5lZWQgdHJhY2UgYWxsIHtFbmFi
bGUsRGlzYWJsZX0gaGFyZCBpbnRlcnJ1cHRzIHBvaW50cwo+PiBpbiBlbnRyeS5TLgo+PiBXZSBt
aXNzIGEgcGF0aCh3b3JrX25vdGlmeXNpZykgdGhhdCBjYXVzZSBhbiBXQVJOIGFzIHNob3duIGJl
bG93Lgo+Pgo+PiBbICAgNTAuMzYyNDMxXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0t
LS0tLS0KPj4gWyAgIDUwLjM2MzYwN10gREVCVUdfTE9DS1NfV0FSTl9PTighbG9ja2RlcF9oYXJk
aXJxc19lbmFibGVkKCkpCj4+IFsgICA1MC4zNjcyMjldIFdBUk5JTkc6IENQVTogMyBQSUQ6IDc0
IGF0IGtlcm5lbC9sb2NraW5nL2xvY2tkZXAuYzo1NTEwIGNoZWNrX2ZsYWdzKzB4MTBhLzB4MWUw
Cj4+IFsgICA1MC4zNjg5MDVdIE1vZHVsZXMgbGlua2VkIGluOgo+PiBbICAgNTAuMzY5NDQwXSBD
UFU6IDMgUElEOiA3NCBDb21tOiByY1MgVGFpbnRlZDogRwo+PiBbICAgNTAuMzcwMjI1XSBIYXJk
d2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+IFsgICA1MC4zNzA2MzJdIGVwYyA6
IGNoZWNrX2ZsYWdzKzB4MTBhLzB4MWUwCj4+IFsgICA1MC4zNzEwMTVdICByYSA6IGNoZWNrX2Zs
YWdzKzB4MTBhLzB4MWUwCj4+IFsgICA1MC4zNzE3NTFdIGVwYyA6IGZmZmZmZmZmODA4ZTI2NzAg
cmEgOiBmZmZmZmZmZjgwOGUyNjcwIHNwIDogZmYyMDAwMDAwMGMzYmNhMAo+PiBbICAgNTAuMzcy
NzIxXSAgZ3AgOiBmZmZmZmZmZjgxN2UyMTg4IHRwIDogZmY2MDAwMDAwMmZlMTgwMCB0MCA6IGZm
ZmZmZmZmODE2MmEyYTgKPj4gWyAgIDUwLjM3MzMyMV0gIHQxIDogMDAwMDAwMDAwMDAwMDAwMSB0
MiA6IDJkMmQyZDJkMmQyZDJkMmQgczAgOiBmZjIwMDAwMDAwYzNiY2MwCj4+IFsgICA1MC4zNzM5
MDNdICBzMSA6IGZmZmZmZmZmODE3ZTMzNDAgYTAgOiAwMDAwMDAwMDAwMDAwMDMwIGExIDogZmZm
ZmZmZmY4MTY5M2ZhOAo+PiBbICAgNTAuMzc0NDc2XSAgYTIgOiAwMDAwMDAwMDAwMDAwMDEwIGEz
IDogZmZmZmZmZmZmZmZmZmZmZSBhNCA6IDA4MzE1MWE0MjJiOGRmMDAKPj4gWyAgIDUwLjM3NTAz
OV0gIGE1IDogMDgzMTUxYTQyMmI4ZGYwMCBhNiA6IGZmZmZmZmZmODAwNjg5MWUgYTcgOiAwODMx
NTFhNDIyYjhkZjAwCj4+IFsgICA1MC4zNzYwMjhdICBzMiA6IGZmZmZmZmZmODE3ZTU0ZTAgczMg
OiBmZmZmZmZmZjgxNjk1MDcwIHM0IDogZmY2MDAwMDAwMjdkNzgwMAo+PiBbICAgNTAuMzc2OTc4
XSAgczUgOiBmZmZmZmZmZjgwYzIyNzcwIHM2IDogMDAwMDAwMDIwMDAwMDAyMiBzNyA6IGZmZmZm
ZmZmZmZmZmZmZmYKPj4gWyAgIDUwLjM3Nzc3OV0gIHM4IDogZmZmZmZmZmY4MjMwMWVkMCBzOSA6
IDAwMDAwMDAwMDAwMDEwMDAgczEwOiAwMDAwMDAwMDAwMWE5OTA1Cj4+IFsgICA1MC4zNzgzMzVd
ICBzMTE6IDAwMDAwMDAwMDAxNGYzZTggdDMgOiBmZmZmZmZmZjgyMmQ3MTRmIHQ0IDogZmZmZmZm
ZmY4MjJkNzE0Zgo+PiBbICAgNTAuMzc4OTU1XSAgdDUgOiBmZmZmZmZmZjgyMmQ3MTUwIHQ2IDog
ZmYyMDAwMDAwMGMzYmE5OAo+PiBbICAgNTAuMzc5NzgzXSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAx
MDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+PiBb
ICAgNTAuMzgwODEwXSBbPGZmZmZmZmZmODA4ZTI3YmU+XSBsb2NrX2lzX2hlbGRfdHlwZSsweDc4
LzB4MTRlCj4+IFsgICA1MC4zODE0NzddIFs8ZmZmZmZmZmY4MDAzZTg1MD5dIF9fbWlnaHRfcmVz
Y2hlZCsweDI2LzB4MjJjCj4+IFsgICA1MC4zODIwMDZdIFs8ZmZmZmZmZmY4MDAzZWE5Mj5dIF9f
bWlnaHRfc2xlZXArMHgzYy8weDY2Cj4+IFsgICA1MC4zODI0NzddIFs8ZmZmZmZmZmY4MDAyMzI0
ZT5dIGdldF9zaWduYWwrMHhhYS8weDkxMgo+PiBbICAgNTAuMzgyOTQ3XSBbPGZmZmZmZmZmODAw
MDUzNjg+XSBkb19ub3RpZnlfcmVzdW1lKzB4ODIvMHg0MzQKPj4gWyAgIDUwLjM4MzgzOV0gWzxm
ZmZmZmZmZjgwMDAzYmVjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDEwCj4+Cj4+IEZpeGVz
OiAzYzQ2OTc5ODI5ODIgKCJyaXNjdjogRW5hYmxlIExPQ0tERVBfU1VQUE9SVCAmIGZpeHVwIFRS
QUNFX0lSUUZMQUdTX1NVUFBPUlQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBZaXBlbmcgWm91PHpvdXlp
cGVuZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIHwg
NiArKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9y
aXNjdi9rZXJuZWwvZW50cnkuUwo+PiBpbmRleCBiOWVkYTNmY2JkNmQuLmY0ZDIzOTk1YTRmMSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+PiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9lbnRyeS5TCj4+IEBAIC0zNzAsMTYgKzM3MCwyMCBAQCByZXN1bWVfa2VybmVs
Ogo+Pgo+PiAgIHdvcmtfcGVuZGluZzoKPj4gICAgICAgICAgLyogRW50ZXIgc2xvdyBwYXRoIGZv
ciBzdXBwbGVtZW50YXJ5IHByb2Nlc3NpbmcgKi8KPj4gLSAgICAgICBsYSByYSwgcmV0X2Zyb21f
ZXhjZXB0aW9uCj4+ICAgICAgICAgIGFuZGkgczEsIHMwLCBfVElGX05FRURfUkVTQ0hFRAo+PiAg
ICAgICAgICBibmV6IHMxLCB3b3JrX3Jlc2NoZWQKPj4gICB3b3JrX25vdGlmeXNpZzoKPj4gKyNp
ZmRlZiBDT05GSUdfVFJBQ0VfSVJRRkxBR1MKPj4gKyAgICAgICBjYWxsIF9fdHJhY2VfaGFyZGly
cXNfb24KPj4gKyNlbmRpZgo+PiArICAgICAgIGxhIHJhLCByZXRfZnJvbV9leGNlcHRpb24KPj4g
ICAgICAgICAgLyogSGFuZGxlIHBlbmRpbmcgc2lnbmFscyBhbmQgbm90aWZ5LXJlc3VtZSByZXF1
ZXN0cyAqLwo+PiAgICAgICAgICBjc3JzIENTUl9TVEFUVVMsIFNSX0lFIC8qIEVuYWJsZSBpbnRl
cnJ1cHRzIGZvciBkb19ub3RpZnlfcmVzdW1lKCkgKi8KPj4gICAgICAgICAgbW92ZSBhMCwgc3Ag
LyogcHRfcmVncyAqLwo+PiAgICAgICAgICBtb3ZlIGExLCBzMCAvKiBjdXJyZW50X3RocmVhZF9p
bmZvLT5mbGFncyAqLwo+PiAgICAgICAgICB0YWlsIGRvX25vdGlmeV9yZXN1bWUKPj4gICB3b3Jr
X3Jlc2NoZWQ6Cj4+ICsgICAgICAgbGEgcmEsIHJldF9mcm9tX2V4Y2VwdGlvbgo+PiAgICAgICAg
ICB0YWlsIHNjaGVkdWxlCj4+Cj4+ICAgLyogU2xvdyBwYXRocyBmb3IgcHRyYWNlLiAqLwo+PiAt
LQo+PiAyLjE3LjEKPj4KLS0gClJlZ2FyZHMsCllpcGVuZyBab3UKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
