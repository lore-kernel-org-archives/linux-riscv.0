Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C248C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 01:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ff1GTAG3fIbhzU/FdBmQ6WDu122cGWlu7Ey+jlgkn9E=; b=Ld/O51PfRX95r8
	JYjgsAH7zv6klCbZShThOAhwvTHcUEebo89LfjLP5mvCuhS4KZhEFLiUK16fXbroOTfcTH6TBMbK1
	H6Qokx7bRRFwpRg1pKX3wjshZ8qXuf+NLC98ec4Vr8NL2NhlR3YhFJs1IeqC0Xj0dtS5hMGhx7I7g
	o8+UvK1KgK7GfpnWzKeIOU/NDCwAxNNpvmVd6AHJ3pXig0DhtGvuTqg0IzpdFWkCSGVQ5GKG1SvSU
	bc1J70l1oW1bQ21iLhtkMP+Fw1V5RpYYU2PEh9ywJ1ViV+ig53hQjwHeNbKcwkp08DXlxVjvSM3he
	EuRUVg73wfLRlh1P3Pyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvURf-0055Iy-Iz; Mon, 30 May 2022 01:43:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvURa-0055GU-7O; Mon, 30 May 2022 01:43:44 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LBJ7K4K7JzjX0y;
	Mon, 30 May 2022 09:42:21 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 09:43:27 +0800
Message-ID: <59e8faec-05fd-805d-7de0-4b0508f8467f@huawei.com>
Date: Mon, 30 May 2022 09:43:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
CC: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Li Zhengyu
	<lizhengyu3@huawei.com>, Palmer Dabbelt <palmer@rivosinc.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220529065637.xgapqjp2342flbuj@pengutronix.de>
 <264786d9-7756-19e0-2742-8b8d17f5ace5@csgroup.eu>
 <20220529140655.bnd4fgggccrorj4t@pengutronix.de>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20220529140655.bnd4fgggccrorj4t@pengutronix.de>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_184342_653573_2599A9CF 
X-CRM114-Status: GOOD (  19.43  )
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

CgrlnKggMjAyMi81LzI5IDIyOjA2LCBVd2UgS2xlaW5lLUvDtm5pZyDlhpnpgZM6Cj4gSGVsbG8s
Cj4gCj4gT24gU3VuLCBNYXkgMjksIDIwMjIgYXQgMDk6NDY6NDdBTSArMDAwMCwgQ2hyaXN0b3Bo
ZSBMZXJveSB3cm90ZToKPj4gTGUgMjkvMDUvMjAyMiDDoCAwODo1NiwgVXdlIEtsZWluZS1Lw7Zu
aWcgYSDDqWNyaXTCoDoKPj4+IEhlbGxvLAo+Pj4KPj4+IG9uIGN1cnJlbnQgbGludXgtbmV4dCBB
UkNIPXJpc2N2IGFsbG1vZGNvbmZpZyBicmVha3Mgd2l0aDoKPj4+Cj4+PiAgICBDQyAgICAgIGFy
Y2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5vCj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4
ZWMuYzozNDU6NTogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiDigJhhcmNoX2tleGVjX2FwcGx5X3Jl
bG9jYXRpb25zX2FkZOKAmQo+Pj4gICAgMzQ1IHwgaW50IGFyY2hfa2V4ZWNfYXBwbHlfcmVsb2Nh
dGlvbnNfYWRkKHN0cnVjdCBwdXJnYXRvcnlfaW5mbyAqcGksCj4+PiAgICAgICAgfCAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBh
cmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4ZWMuYzoxNjoKPj4+IGluY2x1ZGUvbGludXgva2V4ZWMu
aDoyMzY6MTogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiDigJhhcmNoX2tleGVjX2FwcGx5
X3JlbG9jYXRpb25zX2FkZOKAmSB3aXRoIHR5cGUg4oCYaW50KHN0cnVjdCBwdXJnYXRvcnlfaW5m
byAqLCBFbGY2NF9TaGRyICosIGNvbnN0IEVsZjY0X1NoZHIgKiwgY29uc3QgRWxmNjRfU2hkciAq
KeKAmSB7YWthIOKAmGludChzdHJ1Y3QgcHVyZ2F0b3J5X2luZm8gKiwgc3RydWN0IGVsZjY0X3No
ZHIgKiwgY29uc3Qgc3RydWN0IGVsZjY0X3NoZHIgKiwgY29uc3Qgc3RydWN0IGVsZjY0X3NoZHIg
KinigJl9Cj4+PiAgICAyMzYgfCBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZChzdHJ1
Y3QgcHVyZ2F0b3J5X2luZm8gKnBpLCBFbGZfU2hkciAqc2VjdGlvbiwKPj4+ICAgICAgICB8IF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+Pgo+Pj4gKEkgdGhpbmspIGJlY2F1c2Ug
dGhlcmUgaXMgYSBjb25mbGljdCBiZXR3ZWVuIHRoZSB0d28gY29tbWl0czoKPj4+Cj4+PiAyMzNj
MWU2YzMxOWMga2V4ZWNfZmlsZTogZHJvcCB3ZWFrIGF0dHJpYnV0ZSBmcm9tIGFyY2hfa2V4ZWNf
YXBwbHlfcmVsb2NhdGlvbnNbX2FkZF0KPj4+IDgzOGIzZTI4NDg4ZiBSSVNDLVY6IExvYWQgcHVy
Z2F0b3J5IGluIGtleGVjX2ZpbGUKPj4+Cj4+PiBBbmQgc28gbmV4dCBpcyBicm9rZW4gc3RhcnRp
bmcgZnJvbQo+Pj4gMTY0YTkwMzdiMWQzM2YyOGJhMjc2NzFjMTZlYzFjMjNkNGExMWFjZiB3aGlj
aCBtZXJnZXMgdGhlIHJpc2N2IHRyZWUuCj4+Pgo+Pgo+PiBJbiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2tleGVjLmgsIGRvIHRoZSBzYW1lIGFzIHMzOTAgZGlkIGluIGNvbW1pdCAKPj4gMjMzYzFl
NmMzMTljOgo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2tleGVjLmgg
Yi9hcmNoL3MzOTAvaW5jbHVkZS9hc20va2V4ZWMuaAo+PiBpbmRleCA3ZjNjOWFjMzRiZDguLjU0
MGRkNDY5YjA4OCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2tleGVjLmgK
Pj4gKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2tleGVjLmgKPj4gQEAgLTgzLDQgKzgzLDEy
IEBAIHN0cnVjdCBraW1hZ2VfYXJjaCB7Cj4+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZXhlY19m
aWxlX29wcyBzMzkwX2tleGVjX2ltYWdlX29wczsKPj4gICBleHRlcm4gY29uc3Qgc3RydWN0IGtl
eGVjX2ZpbGVfb3BzIHMzOTBfa2V4ZWNfZWxmX29wczsKPj4KPj4gKyNpZmRlZiBDT05GSUdfS0VY
RUNfRklMRQo+PiArc3RydWN0IHB1cmdhdG9yeV9pbmZvOwo+PiAraW50IGFyY2hfa2V4ZWNfYXBw
bHlfcmVsb2NhdGlvbnNfYWRkKHN0cnVjdCBwdXJnYXRvcnlfaW5mbyAqcGksCj4+ICsJCQkJICAg
ICBFbGZfU2hkciAqc2VjdGlvbiwKPj4gKwkJCQkgICAgIGNvbnN0IEVsZl9TaGRyICpyZWxzZWMs
Cj4+ICsJCQkJICAgICBjb25zdCBFbGZfU2hkciAqc3ltdGFiKTsKPj4gKyNkZWZpbmUgYXJjaF9r
ZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQgYXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19h
ZGQKPj4gKyNlbmRpZgo+PiAgICNlbmRpZiAvKl9TMzkwX0tFWEVDX0ggKi8KPiAKPiBJIGNhbiBj
b25maXJtIHRoYXQgZG9pbmcKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rZXhlYy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oCj4gaW5kZXggMjA2MjE3
YjIzMzAxLi5lZWUyNjBlOGFiMzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rZXhlYy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oCj4gQEAgLTU1
LDYgKzU1LDEzIEBAIGV4dGVybiByaXNjdl9rZXhlY19tZXRob2QgcmlzY3Zfa2V4ZWNfbm9yZWxv
Y2F0ZTsKPiAgCj4gICNpZmRlZiBDT05GSUdfS0VYRUNfRklMRQo+ICBleHRlcm4gY29uc3Qgc3Ry
dWN0IGtleGVjX2ZpbGVfb3BzIGVsZl9rZXhlY19vcHM7Cj4gKwo+ICtzdHJ1Y3QgcHVyZ2F0b3J5
X2luZm87Cj4gK2ludCBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZChzdHJ1Y3QgcHVy
Z2F0b3J5X2luZm8gKnBpLAo+ICsJCQkJICAgICBFbGZfU2hkciAqc2VjdGlvbiwKPiArCQkJCSAg
ICAgY29uc3QgRWxmX1NoZHIgKnJlbHNlYywKPiArCQkJCSAgICAgY29uc3QgRWxmX1NoZHIgKnN5
bXRhYik7Cj4gKyNkZWZpbmUgYXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQgYXJjaF9r
ZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQKPiAgI2VuZGlmCj4gIAo+ICAjZW5kaWYKCkxHVE0s
IHlvdSBjb3VsZCBzZW5kIGEgZml4dXAgcGF0Y2ggdG8gcmlzY3YsIHRoYW5rcy4KCj4gCj4gb24g
dG9wIG9mIDgzOGIzZTI4NDg4ZiByZXN1bHRzIGluIGEgY29tcGlsYWJsZSB0cmVlLiBBbmQgd2hl
biBtZXJnaW5nCj4gMjMzYzFlNmMzMTljIGludG8gdGhpcywgaXQgaXMgc3RpbGwgYnVpbGRpbmcu
Cj4gCj4gSSdtIG5vdCBlbm91Z2ggaW50byBrZXhlYyAoYW5kIHJpc2N2KSB0byBqdWRnZSBpZiB0
aGlzIGlzIHNlbnNpYmxlLCBvcgo+IGNyZWF0ZSBhIHVzZWZ1bCBjb21taXQgbG9nIGJ1dCB0aGUg
b2J2aW91cyB3YXkgZm9yd2FyZCBpcyB0byBhcHBseSB0aGUKPiBhYm92ZSBwYXRjaCB0byB0aGUg
cmlzY3YgdHJlZSBiZWZvcmUgaXQgaGl0cyBMaW51cycgdHJlZS4KPiAKPiBCZXN0IHJlZ2FyZHMK
PiBVd2UKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgotLSAKQlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
