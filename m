Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GZkL3zhfAr/+J2xx2L0orFx2jwNqH1i/gr02c9I8j0=; b=BHLWcBTPJR1Pe+
	GvVKnxAgjLCuJ42PEZj5NIk+HVjY6hPScRxlBkgyeCM5SbDE9rTjhGWvTYHW/KM1MQqRTnxBg2TIj
	xtGbqy1mR1WzY7fzAqSPQjbXGIPMWv7luZahIuaF4uWvc3GK/EsMlN4cqH/z+NDz2lp8NT6RhnRDU
	zgVOi5LKylfaTDzFyvdQ+1jItrRF67fiZKy/2jTlImeMgivoxb5RtqA9pVXp9DVo8n2+Wynn62NfA
	TCmfJA0QECmX7oF1SUuw0wq+ghwdAI8aq5xkyhCTJclT8yf7aDB0ZBQMckACp8aQso3ml6ybktUIz
	quNMrwAqq4uB5QZAqysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqNc-001Esp-1g; Fri, 18 Nov 2022 01:41:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqNZ-001Ei9-2i
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:41:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NCztn5Y6gzJnfJ;
	Fri, 18 Nov 2022 09:37:53 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 09:41:03 +0800
Message-ID: <dadac419-acda-7ba5-b7bb-4bc5b6fee92d@huawei.com>
Date: Fri, 18 Nov 2022 09:41:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/8] riscv/kprobe: Allocate detour buffer from module
 area
To: Steven Rostedt <rostedt@goodmis.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Linus Torvalds
	<torvalds@linux-foundation.org>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
 <20221106100316.2803176-3-chenguokai17@mails.ucas.ac.cn>
 <20221116202521.6c528955@gandalf.local.home>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20221116202521.6c528955@gandalf.local.home>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_174117_292988_6C031078 
X-CRM114-Status: UNSURE (   7.25  )
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

CgrlnKggMjAyMi8xMS8xNyA5OjI1LCBTdGV2ZW4gUm9zdGVkdCDlhpnpgZM6Cj4gT24gU3VuLCAg
NiBOb3YgMjAyMiAxODowMzoxMCArMDgwMAo+IENoZW4gR3Vva2FpIDxjaGVuZ3Vva2FpMTdAbWFp
bHMudWNhcy5hYy5jbj4gd3JvdGU6Cj4gCj4+IEBAIC04NCw2ICs4NSwzMCBAQCBpbnQgX19rcHJv
YmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPj4gIH0KPj4gIAo+PiAg
I2lmZGVmIENPTkZJR19NTVUKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19PUFRQUk9CRVMpICYmIGRl
ZmluZWQoQ09ORklHXzY0QklUKQo+PiArdm9pZCAqYWxsb2Nfb3B0aW5zbl9wYWdlKHZvaWQpCj4+
ICt7Cj4+ICsJdm9pZCAqcGFnZTsKPj4gKwo+PiArCXBhZ2UgPSBfX3ZtYWxsb2Nfbm9kZV9yYW5n
ZShQQUdFX1NJWkUsIDEsIE1PRFVMRVNfVkFERFIsCj4+ICsJCQkJICAgIE1PRFVMRVNfRU5ELCBH
RlBfS0VSTkVMLAo+PiArCQkJCSAgICBQQUdFX0tFUk5FTCwgMCwgTlVNQV9OT19OT0RFLAo+PiAr
CQkJCSAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwo+PiArCWlmICghcGFnZSkKPj4g
KwkJcmV0dXJuIE5VTEw7Cj4+ICsKPj4gKwlzZXRfdm1fZmx1c2hfcmVzZXRfcGVybXMocGFnZSk7
Cj4+ICsJLyoKPj4gKwkgKiBGaXJzdCBtYWtlIHRoZSBwYWdlIHJlYWQtb25seSwgYW5kIG9ubHkg
dGhlbiBtYWtlIGl0IGV4ZWN1dGFibGUgdG8KPj4gKwkgKiBwcmV2ZW50IGl0IGZyb20gYmVpbmcg
VytYIGluIGJldHdlZW4uCj4+ICsJICovCj4+ICsJc2V0X21lbW9yeV9ybygodW5zaWduZWQgbG9u
ZylwYWdlLCAxKTsKPj4gKwlzZXRfbWVtb3J5X3goKHVuc2lnbmVkIGxvbmcpcGFnZSwgMSk7Cj4g
Cj4gRllJLCB0aGUgYWJvdmUgY29tYmluYXRpb24gaXMgZ29pbmcgdG8gYmUgZ29pbmcgYXdheToK
PiAKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ZMTBPeUxDTEFBUzZyc1p2QGhpcmV6
LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvCgpUaGFua3MgZm9yIHJlbWluZGluZywgaSB3aWxs
IHVzZSB0aGlzIEFQSSBpbiBuZXh0IHJldmlzaW9uLgo+IC0tIFN0ZXZlCj4gCj4gCj4+ICsKPj4g
KwlyZXR1cm4gcGFnZTsKPj4gK30KPj4gKyNlbmRpZgo+PiArCj4gCgotLSAKQlIsCkxpYW8sIENo
YW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
