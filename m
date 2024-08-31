Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35570C5474C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wxe5ovkiFxSxt6DiRt+DiV9nyF4SrS/dCelXJgaN48Q=; b=tpSRT0HDwFb5tc
	3+trO1R9lHxNaHmUJP3jKKZ7wvzkX08sps5dKq7MpI2+h/AxVUYdavntAg524CoHTuCtRuEiOHZsO
	bl+fMz3/WwvlHHZ2QLP6H3NN0+Ls9CHi1brlcXtY7U0UE/uycPjxOY/rgfK7MWbT3tkXGKjKjOEba
	u/ypnt13lzh5li0RIbtDTWXKSueSNR+WE8OhyNAaS8ZJxOxlXyOXnIK2EVyK+cLI6W1jdsX2ZJlFu
	Oe1zBvK7nWIoZNblR4P/EKprg5lhAjOIr1P3ALVkGRg2MYjxNxKb+xlQbSrETleqdyIvquHZxvl62
	zdtEXSm9/47c80ZfQ8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skHQO-00000008hBf-3PnJ;
	Sat, 31 Aug 2024 06:17:28 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skHPe-00000008h5s-2AJD
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 06:16:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WwlC54rkqz4f3jkP
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 14:16:17 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C173B1A1127
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 14:16:27 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgD3aYA3tdJmKF_YDA--.28873S2;
	Sat, 31 Aug 2024 14:16:25 +0800 (CST)
Message-ID: <f14d0337-0743-4490-88ba-f6e24f0e547e@huaweicloud.com>
Date: Sat, 31 Aug 2024 14:16:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/2] libbpf: Fix accessing first syscall argument
 on RV64
Content-Language: en-US
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
References: <20240829133453.882259-1-pulehui@huaweicloud.com>
 <20240829133453.882259-2-pulehui@huaweicloud.com>
 <CAEf4BzbvUQ1HA6GPSF23piqbEBNVDZKZC0rB-X4LgeMpp9svYA@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAEf4BzbvUQ1HA6GPSF23piqbEBNVDZKZC0rB-X4LgeMpp9svYA@mail.gmail.com>
X-CM-TRANSID: gCh0CgD3aYA3tdJmKF_YDA--.28873S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1UGFWfXF1xXr1rGr15urg_yoW8urWkpr
	W5ta4UKr18Wr42g347Ka12qF13Kr45trsrWF9xWaySkr4Ut3s3G3WaqrWYkF4qqr4kWw4q
	vr9ruw18GF1ayrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jIksgUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_231643_216785_8A305A84 
X-CRM114-Status: GOOD (  17.11  )
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

CgpPbiAyMDI0LzgvMzEgMzozNCwgQW5kcmlpIE5ha3J5aWtvIHdyb3RlOgo+IE9uIFRodSwgQXVn
IDI5LCAyMDI0IGF0IDY6MzLigK9BTSBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+
IHdyb3RlOgo+PgpbU05JUF0KPj4KPj4gLSNkZWZpbmUgX19QVF9QQVJNMV9TWVNDQUxMX1JFRyBf
X1BUX1BBUk0xX1JFRwo+PiArI2RlZmluZSBfX1BUX1BBUk0xX1NZU0NBTExfUkVHIG9yaWdfYTAK
Pj4gICAjZGVmaW5lIF9fUFRfUEFSTTJfU1lTQ0FMTF9SRUcgX19QVF9QQVJNMl9SRUcKPj4gICAj
ZGVmaW5lIF9fUFRfUEFSTTNfU1lTQ0FMTF9SRUcgX19QVF9QQVJNM19SRUcKPj4gICAjZGVmaW5l
IF9fUFRfUEFSTTRfU1lTQ0FMTF9SRUcgX19QVF9QQVJNNF9SRUcKPj4gICAjZGVmaW5lIF9fUFRf
UEFSTTVfU1lTQ0FMTF9SRUcgX19QVF9QQVJNNV9SRUcKPj4gICAjZGVmaW5lIF9fUFRfUEFSTTZf
U1lTQ0FMTF9SRUcgX19QVF9QQVJNNl9SRUcKPj4gKyNkZWZpbmUgUFRfUkVHU19QQVJNMV9TWVND
QUxMKHgpIFBUX1JFR1NfUEFSTTFfQ09SRV9TWVNDQUxMKHgpCj4+ICsjZGVmaW5lIFBUX1JFR1Nf
UEFSTTFfQ09SRV9TWVNDQUxMKHgpIFwKPj4gKyAgICAgICBCUEZfQ09SRV9SRUFEKChjb25zdCBz
dHJ1Y3QgcHRfcmVnc19fX3Jpc2N2ICopKHgpLCBfX1BUX1BBUk0xX1NZU0NBTExfUkVHKQo+IAo+
IEkgZmVlbCBsaWtlIHdoYXQgd2UgZGlkIGZvciBzMzkweCBpcyBhIGJpdCBzdWJvcHRpbWFsLCBz
byBsZXQncyAodHJ5Cj4gdG8pIGltcHJvdmUgdGhhdCBhbmQgdGhlbiBkbyB0aGUgc2FtZSBmb3Ig
UlY2NC4KPiAKPiBXaGF0IEkgbWVhbiBpcyB0aGF0IFBUX1JFR1NfUEFSTW5fU1lTQ0FMTCBtYWNy
b3MgYXJlIHVzZWQgdG8gcmVhZAo+IHB0X3JlZ3MgY29taW5nIGRpcmVjdGx5IGZyb20gY29udGV4
dCwgcmlnaHQ/IEluIHRoYXQgY2FzZSB3ZSBkb24ndAo+IG5lZWQgdG8gcGF5IHRoZSBwcmljZSBv
ZiBCUEZfQ09SRV9SRUFEKCksIHdlIGNhbiBqdXN0IGFjY2VzcyBtZW1vcnkKPiBkaXJlY3RseSAo
YnV0IHdlIHN0aWxsIG5lZWQgQ08tUkUgcmVsb2NhdGlvbiEpLgo+IAo+IFNvIEkgdGhpbmsgd2hh
dCB3ZSBzaG91bGQgZG8gaXMKPiAKPiAxKSBtYXJrIHB0X3JlZ3NfX19yaXNjdiB7fSB3aXRoIF9f
YXR0cmlidXRlX18oKHByZXNlcnZlX2FjY2Vzc19pbmRleCkpCj4gc28gdGhhdCBub3JtYWwgZmll
bGQgYWNjZXNzZXMgYXJlIENPLVJFLXJlbG9jYXRlZAo+IDIpIGNoYW5nZSBQVF9SRUdTX1BBUk0x
X1NZU0NBTEwoeCkgdG8gYmUgYCgoY29uc3QKPiBzdHJ1Y3RfcHRfcmVnc19fX3Jpc2N2ICopKHgp
KS0+b3JpZ19hMGAsIHdoaWNoIHdpbGwgZGlyZWN0bHkgcmVhZAo+IG1lbW9yeQo+IDMpIGtlZXAg
UFRfUkVHU19QQVJNMV9DT1JFX1NZU0NBTEwoKSBhcyBpcwo+IAo+IAo+IEJ1dCBoYXZpbmcgd3Jp
dHRlbiBhbGwgdGhlIGFib3ZlLCBJJ20gbm90IHN1cmUgd2hldGhlciB3ZSBhbGxvdyBDTy1SRQo+
IHJlbG9jYXRlZCBkaXJlY3QgY29udGV4dCBhY2Nlc3NlcyAodmVyaWZpZXIgbWlnaHQgY29tcGxh
aW4gYWJvdXQKPiBtb2RpZnlpbmcgY3R4IHJlZ2lzdGVyIG9mZnNldCBvciBzb21ldGhpbmcpLiBT
byBjYW4geW91IHBsZWFzZSBjaGVjawo+IGl0IGVpdGhlciBvbiBzMzkwIG9yIFJWNjQgYW5kIGxl
dCBtZSBrbm93PyBJJ20gbm90IG1hcmtpbmcgaXQgYXMKPiAiQ2hhbmdlcyBSZXF1ZXN0ZWQiIGZv
ciB0aGF0IHJlYXNvbiwgYmVjYXVzZSB0aGF0IG1pZ2h0IG5vdCB3b3JrIGFuZAo+IHdlJ2xsIGhh
dmUgdG8gZG8gQlBGX0NPUkVfUkVBRCgpLgoKSGkgQW5kcmlpLCB0aGFua3MgZm9yIHlvdXIgc3Vn
Z2VzdGlvbiwgaXQncyByZWFsbHkgY29vbC4gSSBjaGVjayB0aGF0IAp3b3JrIGZvciBSVjY0LCBh
bmQgc2VuZCBhIG5ldyB2ZXJzaW9uOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjQw
ODMxMDQxOTM0LjE2MjkyMTYtMS1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbQoKPiAKPj4KPj4gICAj
ZGVmaW5lIF9fUFRfUkVUX1JFRyByYQo+PiAgICNkZWZpbmUgX19QVF9GUF9SRUcgczAKPj4gLS0K
Pj4gMi4zNC4xCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
