Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC6FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCBi2dgOgws0SDTHbfAw1zHY0R34sNsPT+QlqCVrbPI=; b=WQyOw5UpOrJRZx
	Be2gnHkk/H/JbyTewabl9QpE2G8iraaPoKYlABS1YxGAe14ACpGAeWwtWy0Yh6nCE4xkGNRNSavZk
	DbveS31JX3gj2ht+MgloY1KjPBm87vSsiHOnXmDf80ornhiupgAq0lgdy4kr8GHECkkywP/zczNdD
	5mdKo0O/xtyrnq4NBjuq32jMR7EYBWxoyXxZ5RLVow+UhbOyYRRqDWl4aAfyR+sWG5QWAoJ6fwB6V
	39v6KS6FULxgouOnugTfkicyU47BcFBO2nzcdsjkuo4N4XW93mWX6X7XOYNPXFRWUTv+4r3Dp9pH/
	3cmzdGnX9qby5O56vIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzHm-007guf-4R; Wed, 04 Jan 2023 08:38:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzEn-007frs-QG
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:35:09 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Nn2q45Xy6zqTLw;
	Wed,  4 Jan 2023 16:30:24 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:35:03 +0800
Message-ID: <ab66152d-0ae1-3edb-4f1d-01ab49edc25d@huawei.com>
Date: Wed, 4 Jan 2023 16:35:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 4/9] riscv/kprobe: Add common RVI and RVC instruction
 decoder code
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-5-chenguokai17@mails.ucas.ac.cn>
 <87tu18vmnx.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87tu18vmnx.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003507_591705_53203860 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
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

CgrlnKggMjAyMy8xLzMgMjowMywgQmrDtnJuIFTDtnBlbCDlhpnpgZM6Cj4gQ2hlbiBHdW9rYWkg
PGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cj4gCj4+IEZyb206IExpYW8g
Q2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmggYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMvc2ltdWxhdGUtaW5zbi5oCj4+IGluZGV4IGNiNmZmN2RjY2I5Mi4uNzRkOGMxYmE5MDY0IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oCj4+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmgKPj4gQEAgLTM3
LDYgKzM3LDQwIEBAIF9fUklTQ1ZfSU5TTl9GVU5DUyhjX2phbHIsCTB4ZjAwNywgMHg5MDAyKTsK
Pj4gIF9fUklTQ1ZfSU5TTl9GVU5DUyhjX2JlcXosCTB4ZTAwMywgMHhjMDAxKTsKPj4gIF9fUklT
Q1ZfSU5TTl9GVU5DUyhjX2JuZXosCTB4ZTAwMywgMHhlMDAxKTsKPj4gIF9fUklTQ1ZfSU5TTl9G
VU5DUyhjX2VicmVhaywJMHhmZmZmLCAweDkwMDIpOwo+PiArLyogUlZDKFMpIGluc3RydWN0aW9u
cyBjb250YWluIHJzMSBhbmQgcnMyICovCj4+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19zcSwJMHhl
MDAzLCAweGEwMDApOwo+PiArX19SSVNDVl9JTlNOX0ZVTkNTKGNfc3csCTB4ZTAwMywgMHhjMDAw
KTsKPj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX3NkLAkweGUwMDMsIDB4ZTAwMCk7Cj4+ICsvKiBS
VkMoQSkgaW5zdHJ1Y3Rpb25zIGNvbnRhaW4gcnMxIGFuZCByczIgKi8KPj4gK19fUklTQ1ZfSU5T
Tl9GVU5DUyhjX3N1YiwJMHhmYzAzLCAweDhjMDEpOwo+IAo+IEluY29ycmVjdCBtYXNrLgoKVGhh
bmtzIGZvciBjaGVja2luZywgaSBzdHVkeSB0aGUgb3Bjb2RlIG9mIENfU1VCIFsxXSwgdGhlIGNv
cnJlY3QgbWFzayBzaG91bGQgYmUgMHhGQzYzLgoKICAgICAgMTUgMTQgMTMgMTIgfCAxMSAxMCAg
OSAgOCB8IDcgNiA1IDQgfCAzIDIgIDEgMApjLnN1YjogICAgICAgMSAgMCAgMCAgMCB8ICAxICAx
ICByczEnL3JkJyAwIDAgICByczInICAgMCAxCm1hc2s6ICAgICAgICAgICBGIHwgICAgICAgICAg
IEMgfCAgICAgICA2IHwgICAgICAgIDMKdmFsdWU6ICAgICAgICAgIDggfCAgICAgICAgICAgQyB8
ICAgICAgIDAgfCAgICAgICAgMQoKPiAKPj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX3N1YncsCTB4
ZmM0MywgMHg5YzAxKTsKPj4gKy8qIFJWQyhMKSBpbnN0cnVjdGlvbnMgY29udGFpbiByczEgKi8K
Pj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX2xxLAkweGUwMDMsIDB4MjAwMCk7Cj4+ICtfX1JJU0NW
X0lOU05fRlVOQ1MoY19sdywJMHhlMDAzLCAweDQwMDApOwo+PiArX19SSVNDVl9JTlNOX0ZVTkNT
KGNfbGQsCTB4ZTAwMywgMHg2MDAwKTsKPj4gKy8qIFJWQyhJKSBpbnN0cnVjdGlvbnMgY29udGFp
biByczEgKi8KPj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX2FkZGksCTB4ZTAwMywgMHgwMDAxKTsK
Pj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX2FkZGl3LAkweGUwMDMsIDB4MjAwMSk7Cj4+ICtfX1JJ
U0NWX0lOU05fRlVOQ1MoY19hZGRpMTZzcCwJMHhlMTgzLCAweDYxMDEpOwo+PiArX19SSVNDVl9J
TlNOX0ZVTkNTKGNfc2xsaSwJMHhlMDAzLCAweDAwMDIpOwo+PiArLyogUlZDKEIpIGluc3RydWN0
aW9ucyBjb250YWluIHJzMSAqLwo+PiArX19SSVNDVl9JTlNOX0ZVTkNTKGNfc3JpLAkweGU4MDMs
IDB4ODAwMSk7Cj4+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19hbmRpLAkweGVjMDMsIDB4ODgwMSk7
Cj4+ICsvKiBSVkMoU1MpIGluc3RydWN0aW9ucyBjb250YWluIHJzMiAqLwo+PiArX19SSVNDVl9J
TlNOX0ZVTkNTKGNfc3FzcCwJMHhlMDAzLCAweGEwMDIpOwo+PiArX19SSVNDVl9JTlNOX0ZVTkNT
KGNfc3dzcCwJMHhlMDAzLCAweGMwMDIpOwo+PiArX19SSVNDVl9JTlNOX0ZVTkNTKGNfc2RzcCwJ
MHhlMDAzLCAweGUwMDIpOwo+PiArLyogUlZDKFIpIGluc3RydWN0aW9ucyBjb250YWluIHJzMiBh
bmQgcmQgKi8KPj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX212LAkweGUwMDMsIDB4ODAwMik7Cj4g
Cj4gU2hvdWxkbid0IHRoZSBtYXNrIGJlIDB4ZjAwMz8KCkFjdHVhbGx5LCB0aGUgbWFzayBzaG91
bGQgYmUgMHhmMDAzIGluZGVlZGx5LCBidXQgaXQgYWxzbyBicmluZyBhbm90aGVyIHByb2JsZW0g
dGhhdAppdCBjYW4ndCB0ZWxsIEMuTVYgYW5kIEMuSlIgdmlhIHRoZSBtYXNrIGFuZCB2YWx1ZSBw
YXJ0cy4gTG9vayBvcGNvZGVzIGJlbG93OgoKICAgICAgMTUgMTQgMTMgMTIgfCAxMSAxMCAgOSAg
OCB8IDcgNiA1IDQgfCAzIDIgIDEgMApDLkpSOiAgMSAgMCAgMCAgMCB8ICAgICAgICAgICAgIHJz
MSAgICAgICAgICAgMCAgMSAwCkMuTVY6ICAxICAwICAwICAwIHwgICAgICAgICAgICAgIHJkICAg
ICAgICAgcnMyICAxIDAKClRoZSBvbmx5IGRpZmZlcmVjZSBiZXR3ZWVuIEMuTVYgYW5kIEMuSlIg
aXMgdGhlIGJpdHNbMn42XSwgdGhlc2UgYml0ZmllbGQgb2YgQy5KUiBpcyB6ZXJvLAp0aGUgb25l
cyBvZiBDLk1WIGlzIHJzMiB3aGljaCBuZXZlciBiZSB6ZXJvLiBJbiBvcmRlciB0byB0ZWxsIEMu
TVYgYW5kIEMuSlIgY29ycmVjbHR5LCBpdAppcyBiZXR0ZXIgdG8gYWRqdXN0IHRoZSBtYXNrIG9m
IEMuSlIgdG8gYmUgMHhmMDdmIGFzIHlvdXIgcGF0Y2gocmlzY3YsIGtwcm9iZTogU3RyaWN0ZXIg
Yy5qci9jLmphbHIgZGVjb2RpbmcpCgpMb29raW5nIGZvcndhcmQgdG8geW91ciBmZWVkYmFjay4K
Cj4gCj4gCj4gQmrDtnJuCgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2Et
bWFudWFsL3JlbGVhc2VzCgotLSAKQlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
