Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73E7C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAEjBjUkDWM6K70wf8UsJ19Cl+D6ZlkQe4Z6VLfQc/A=; b=D4bhYjzvmEayQe
	iW6hI5u31AJaGNDTy2AD/8EVD3Q8O6+7l12u91wf6v+x9SFLS8pIXi3dQTIDfud4kP61TmhJTBAwF
	cf9cB0hRKVF0K5WyEdjJNSdx58PkqfALvP3edmPQWedVjSbW9PiLkY9sNI1uBzUJOVJybGkvnRpct
	uyfhW6xNVJD17TQg/avRHHdkuKq7BljZkAukUingRKND6NttA/FY395HbOPKSeMW2V5aO5gwgzNVh
	HRaVAtLP5BWyblHWRWOuzMhzxTHrlyZJIdlfEii17vMEtjADV10F2afxZa9QSTKUakySJrUsMRasV
	ENr2slm95CiFZBICOcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUSsF-008LSY-8U; Tue, 21 Feb 2023 13:40:03 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUSsB-008LRY-Lj
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 13:40:02 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PLgM547Jhz16Nj4;
	Tue, 21 Feb 2023 21:37:21 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 21 Feb 2023 21:39:49 +0800
Message-ID: <1a02055f-deff-649f-9564-417ae916ddb3@huawei.com>
Date: Tue, 21 Feb 2023 21:39:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v2] riscv, bpf: Add kfunc support for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui
	<pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>
References: <87h6vffqlo.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87h6vffqlo.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_054000_501516_9FFB20FE 
X-CRM114-Status: UNSURE (   9.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzIvMjEgMTU6MDIsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDIwMjMvMi8yMCAyMjozNCwg
QmrDtnJuIFTDtnBlbCB3cm90ZToKPj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNv
bT4gd3JpdGVzOgo+Pj4KPj4+PiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+
Pj4+Cj4+Pj4gQXMgYW5vdGhlciBpbXBvcnRhbnQgbWlzc2luZyBwaWVjZSBvZiBSVjY0IEpJVCwg
a2Z1bmMgYWxsb3cgYnBmIHByb2dyYW1zCj4+Pj4gY2FsbCBrZXJuZWwgZnVuY3Rpb25zLiBGb3Ig
bm93LCBSVjY0IGlzIHN1ZmZpY2llbnQgdG8gZW5hYmxlIGl0Lgo+Pj4KPj4+IFRoYW5rcyBMZWh1
aSEKPj4+Cj4+PiBNYXliZSB3ZSBjYW4gcmV3b3JkL21hc3NhZ2UgdGhlIGNvbW1pdCBtZXNzYWdl
IGEgYml0PyBXaGF0IGRvIHlvdSB0aGluawo+Pj4gYWJvdXQgc29tZXRoaW5nIGxpa2U6Cj4+Pgo+
Pj4gIk5vdyB0aGF0IHRoZSBCUEYgdHJhbXBvbGluZSBpcyBzdXBwb3J0ZWQgYnkgUklTQy1WLCBp
dCBpcyBwb3NzaWJsZSB0bwo+Pj4gdXNlIEJQRiBwcm9ncmFtcyB3aXRoIGtmdW5jIGNhbGxzLgo+
Pj4KPj4KPj4ga2Z1bmMgYW5kIGJwZiB0cmFtcG9saW5lIGFyZSBmdW5jdGlvbmFsbHkgaW5kZXBl
bmRlbnQuIGtmdW5jIFsxXSwgbGlrZQo+PiBicGYgaGVscGVyIGZ1bmN0aW9ucywgYWxsb3dzIGJw
ZiBwcm9ncmFtcyB0byBjYWxsIGV4cG9ydGVkIGtlcm5lbAo+PiBmdW5jdGlvbnMsIHdoaWxlIGJw
ZiB0cmFtcG9saW5lIHByb3ZpZGVzIGEgbW9yZSBlZmZpY2llbnQgd2F5IHRoYW4KPj4ga3Byb2Jl
IHRvIGFjdCBhcyBhIG1lZGlhdG9yIGJldHdlZW4ga2VybmVsIGZ1bmN0aW9ucyBhbmQgYnBmIHBy
b2dyYW1zLAo+PiBhbmQgYmV0d2VlbiBicGYgcHJvZ3JhbXMuCj4+Cj4+IEluIGZhY3QsIGl0IHdh
cyBhbHJlYWR5IHN1cHBvcnRlZCBiZWZvcmUgdGhlIGJwZiB0cmFtcG9saW5lCj4+IGltcGxlbWVu
dGF0aW9uLCBJIGp1c3QgdHVybmVkIGl0IG9uLgo+IAo+IEdvb2QgcG9pbnQuIEkgZ3Vlc3MgbXkg
KGluY29ycmVjdCkga2Z1bmMgbWVudGFsIG1vZGVsIHdhcyB0aGF0Cj4gc3RydWN0X29wcyBhbmQg
a2Z1bmMgd2VyZSB0aWdodGx5IGNvdXBsZWQuIChUaGVuIGFnYWluLCB3L28gc3RydWN0X29wcwo+
IHdvcmtpbmcga2Z1bmMgaXMgYSBiaXQgaGFsZi13b3JraW5nIGluIG15IHZpZXcuKQo+IAo+IEZh
aXIgZW5vdWdoLiBJJ20gc3RpbGwgYSBiaXQgY29uZnVzZWQgYWJvdXQgdGhlIGNvbW1pdCBtZXNz
YWdlLCBidXQKPiBoYXBweSB3aXRoIHRoZSBwYXRjaC4KPiAgPiBBY2tlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhhbmtzIEJqb3JuLCB3aWxsIHJld3JpdGUgY29t
bWl0IG1lc3NhZ2UgdG8gbWFrZSBtb3JlIHNlbnNlLCBhbmQgc2VuZCAKbmV3IHNvb24uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
