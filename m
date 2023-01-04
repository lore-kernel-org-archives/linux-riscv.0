Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C73C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvWtaSkVGhLOFS7sCISIm9XiT3UuHRF3X5I88YmAKd0=; b=k3JxNouET/uL/k
	wKXJ7XYrJq17DasmDIZUMBik9oHXP/U2SEYJFc/apyeHvUamZuAq7dYA64fLvdwE1rVJsXAjkN7xK
	YQQ2PzVcfXYjAfyy2q0XHUtJBjAVZwo9VPsGgt3eYeEkFgjBsnlfuvi1ECKy+S2Nb5VFC+2ZGME4P
	UAdePJ/9HaKN+p8gNxpkDiEKzT2SJJ4QB7T7FzUgamh8o1BRIPTJKDRjhv/BnQ30reqe1wDWmsr3N
	+o7bs4TNQGwOkpQwZk/q8VGWARXPlfx6Daj7K/IdhRqhaUtmK5frxFXRmhjPA/9jqY9DHxpMkV4HQ
	s4DYgCl/UhwFAYucMnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzJ1-007hbA-OY; Wed, 04 Jan 2023 08:39:27 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzEM-007fhs-DU
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:34:40 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Nn2tH1RsPz16MML;
	Wed,  4 Jan 2023 16:33:11 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:34:36 +0800
Message-ID: <9dacbd7a-6dc5-099c-d427-b20bfa22aabd@huawei.com>
Date: Wed, 4 Jan 2023 16:34:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 3/9] riscv/kprobe: Prepare the skeleton to prepare
 optimized kprobe
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
 <87v8lovmoa.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87v8lovmoa.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003438_751396_618AFA91 
X-CRM114-Status: GOOD (  10.16  )
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
Q2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPiAKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9vcHQuYyB8IDEwNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy9vcHQuYwo+PiBpbmRleCA1NmM4YTIyN2M4NTcuLmE0MjcxZTYwMzNiYSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jCj4+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+IAo+PiBAQCAtMjQsNyArNzIsNjQgQEAgaW50
IGFyY2hfY2hlY2tfb3B0aW1pemVkX2twcm9iZShzdHJ1Y3Qgb3B0aW1pemVkX2twcm9iZSAqb3Ap
Cj4+ICBpbnQgYXJjaF9wcmVwYXJlX29wdGltaXplZF9rcHJvYmUoc3RydWN0IG9wdGltaXplZF9r
cHJvYmUgKm9wLAo+PiAgCQkJCSAgc3RydWN0IGtwcm9iZSAqb3JpZykKPj4gIHsKPj4gLQlyZXR1
cm4gMDsKPj4gKwlsb25nIHJlbDsKPj4gKwlpbnQgcmQsIHJhLCByZXQ7Cj4+ICsJa3Byb2JlX29w
Y29kZV90ICpjb2RlID0gTlVMTCwgKnNsb3QgPSBOVUxMOwo+PiArCj4+ICsJaWYgKCFjYW5fb3B0
aW1pemUoKHVuc2lnbmVkIGxvbmcpb3JpZy0+YWRkciwgb3ApKQo+PiArCQlyZXR1cm4gLUVJTFNF
UTsKPj4gKwo+PiArCWNvZGUgPSBremFsbG9jKE1BWF9PUFRJTlNOX1NJWkUsIEdGUF9LRVJORUwp
Owo+PiArCXNsb3QgPSBnZXRfb3B0aW5zbl9zbG90KCk7Cj4+ICsJaWYgKCFjb2RlIHx8ICFzbG90
KSB7Cj4+ICsJCXJldCA9IC1FTk9NRU07Cj4+ICsJCWdvdG8gb25fZXJyb3I7Cj4+ICsJfQo+PiAr
Cj4+ICsJLyoKPj4gKwkgKiBWZXJpZnkgaWYgdGhlIGFkZHJlc3MgZ2FwIGlzIHdpdGhpbiA0R0Ig
cmFuZ2UsIGJlY2F1c2UgdGhpcyB1c2VzCj4+ICsJICogYSBhdWlwYytqYWxyIHBhaXIuCj4gCj4g
VHJ5IHRvIGJlIGNvbnNpc3RlbnQuIFlvdSdyZSBtaXhpbmcgIkFVSVBDL0pBTFIiIHdpdGggImF1
aXBjK2phbHIiLgoKT0vvvIxpIHdpbGwgdXNlIEFVSVBDL0pBTFIgaW4gYWxsIGNvbW1pdCBtZXNz
YWdlcyBhbmQgY29tbWVudHMgb2YgdGhpcyBzZXJpZXMuCgo+IAo+PiArCSAqLwo+PiArCXJlbCA9
ICh1bnNpZ25lZCBsb25nKXNsb3QgLSAodW5zaWduZWQgbG9uZylvcmlnLT5hZGRyOwo+PiArCWlm
ICghaW5fYXVpcGNfamFscl9yYW5nZShyZWwpKSB7Cj4+ICsJCS8qCj4+ICsJCSAqIERpZmZlcmVu
dCBmcm9tIHg4Niwgd2UgZnJlZSBjb2RlIGJ1ZiBkaXJlY3RseSBpbnN0ZWFkCj4+IG9mCj4gCj4g
UmV3b3JkIGZvciByZWFkZXJzIHRoYXQgYXJlIG5vdCBmYW1pbGlhciB3aXRoIHg4Ni4KCk9LLCBC
VFcsIGkgdGhpbmsgdGhlIGNvZGUgZm9sbG93aW5nIHRhZyBvbl9lcnJvciBpcyBmYWlybHkgc2Vs
Zi1leHBsYW5hdG90eSwKcGVyaGFwcyB0aGlzIGNvbW1lbnQgaXMgbm8gbmVlZCBhbnltb3JlLgoK
PiAKPiAKPiBCasO2cm4KCi0tIApCUiwKTGlhbywgQ2hhbmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
