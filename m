Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CE8F45A18
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 02:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FEcoRACrAenEgu06vVJGrGLnlEiN3ol8KQNjgLoqXw=; b=yOmUN08KmLePB2
	crM2az868tYehLOx36oiXTyOwVxvu4xH4Vgyoz0bo7Jh6QTANzuoPUPc74UyrIBSG3lrxpAbOx6GD
	HY5REJrr1DP02dniD+qxwsjTaymgwc06hgvzhMFZgxFx4f7UFYmHxrV+UjmhiSx+doWe6MyEtHqE5
	7eaPY45ZkkCOF1eqlbyriKPU0g0Skr/7XckAWwt2AJ0RYAoCuRc7xuCnZ7qWRB050D+kMqkJnKPoi
	//qOEXLtjCNdFrPJwMgGEjN+OFZMVKP8TxdAOoaPNYDY5uEucddacQ2A4FAIOC57FZH8upfI/SlnA
	RLu35C9tBGwTNfYndixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBOOh-0000000D4Nq-15Wn;
	Sat, 11 Apr 2026 02:48:35 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBOOe-0000000D4Kn-0tF2
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 02:48:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BuqkuhI7invXrca0LHnb6xj/OsMe2PYfRhrfO9jbiOE=;
	b=cIsx1vgIK1YFOSAUHvZ7V+SrcynrMmulInNp78TsSP05n1rGQM205Qv5h3aI+jE7A+iw7mp0D
	q2zpPVWa+p7Cp1SUQb7RNXESOMTlBMEw5KyLXgxV+giBKml/3lj4TozPxYgXQULvWN+kd1mnnO9
	GZ57lvk6eacHajU5EYUrwqs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fsycX2y76z1prL5;
	Sat, 11 Apr 2026 10:42:04 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F0AC8203BC;
	Sat, 11 Apr 2026 10:48:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 11 Apr 2026 10:48:22 +0800
Message-ID: <150bfb90-ec49-7209-b841-2e48ca12b370@huawei.com>
Date: Sat, 11 Apr 2026 10:48:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] arch/riscv: Add bitrev.h file to support rev8 and brev8
Content-Language: en-US
To: <cp0613@linux.alibaba.com>
CC: <akpm@linux-foundation.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <pjw@kernel.org>
References: <20260311071344.3305640-1-ruanjinjie@huawei.com>
 <20260410113640.106730-1-cp0613@linux.alibaba.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260410113640.106730-1-cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_194832_767672_54CF1851 
X-CRM114-Status: GOOD (  13.68  )
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

CgpPbiAyMDI2LzQvMTAgMTk6MzYsIGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbSB3cm90ZToKPiBP
biBXZWQsIDExIE1hciAyMDI2IDE1OjEzOjQ0ICswODAwLCBydWFuamluamllQGh1YXdlaS5jb20g
d3JvdGU6Cj4gCj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4gKyNpbmNsdWRlIDxhc20v
Y3B1ZmVhdHVyZS1tYWNyb3MuaD4KPj4gKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPj4gKwo+PiAr
ZXh0ZXJuIHU4IGNvbnN0IGJ5dGVfcmV2X3RhYmxlWzI1Nl07Cj4+ICtzdGF0aWMgX19hbHdheXNf
aW5saW5lIF9fYXR0cmlidXRlX2NvbnN0X18gdTMyIF9fYXJjaF9iaXRyZXYzMih1MzIgeCkKPj4g
K3sKPj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCS0IpICYmCj4+ICsJICAg
IHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJLQikpIHsKPj4gKwkJ
dW5zaWduZWQgbG9uZyByZXN1bHQgPSB4Owo+PiArCj4+ICsJCWFzbSB2b2xhdGlsZSgKPj4gKwkJ
CSIub3B0aW9uIHB1c2hcbiIKPj4gKwkJCSIub3B0aW9uIGFyY2gsK3pia2JcbiIKPj4gKwkJCSJy
ZXY4ICUwLCAlMFxuIgo+PiArCQkJImJyZXY4ICUwLCAlMFxuIgo+PiArCQkJIi5vcHRpb24gcG9w
Igo+PiArCQkJOiAiK3IiIChyZXN1bHQpCj4+ICsJCSk7Cj4+ICsKPj4gKwkJaWYgKF9fcmlzY3Zf
eGxlbiA9PSA2NCkKPj4gKwkJCXJldHVybiAodTMyKShyZXN1bHQgPj4gMzIpOwo+PiArCj4+ICsJ
CXJldHVybiAodTMyKXJlc3VsdDsKPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gKHUzMilieXRlX3Jl
dl90YWJsZVt4ICYgMHhmZl0gPDwgMjQgfAo+PiArCSAgICAgICAodTMyKWJ5dGVfcmV2X3RhYmxl
Wyh4ID4+IDgpICYgMHhmZl0gPDwgMTYgfAo+PiArCSAgICAgICAodTMyKWJ5dGVfcmV2X3RhYmxl
Wyh4ID4+IDE2KSAmIDB4ZmZdIDw8IDggfAo+PiArCSAgICAgICAodTMyKWJ5dGVfcmV2X3RhYmxl
W3ggPj4gMjRdOwo+PiArfQo+IAo+IEhpIEppbmppZSwKPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2guIEkgaGF2ZSB0d28gc3VnZ2VzdGlvbnMuCj4gMS4gV2hlbiBaQktCIGlzIG5vdCBzdXBwb3J0
ZWQsIGlzIGl0IHNpbXBsZXIgdG8gZGlyZWN0bHkgdXNlIHRoZSBnZW5lcmljCj4gaW1wbGVtZW50
YXRpb24gX19iaXRyZXYzMiBpbiA8bGludXgvYml0cmV2Lmg+LgoKQWN0dWFsbHksIHlvdSBjYW4n
dCBzaW1wbHkgdXNlIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIGZyb20KbGludXgvYml0cmV2
LmguIEl0IGluY2x1ZGVzIGFzbS9iaXRyZXYuaCAodGhlIGFyY2hpdGVjdHVyZS1zcGVjaWZpYwpp
bXBsZW1lbnRhdGlvbiksIHdoaWNoIHdvdWxkIGxlYWQgdG8gY29tcGlsYXRpb24gaXNzdWVzLiBG
dXJ0aGVybW9yZSwKd2hlbiBaQktCIGlzIG5vdCBzdXBwb3J0ZWQsIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gaXMgaWRlbnRpY2FsIHRvIHRoZQpkZWZhdWx0IG9uZS4KCgo+IDIuIENvdWxkIHlvdSBw
bGVhc2UgcHJvdmlkZSBhIGJlbmNobWFyayB0ZXN0IGNhc2UgdG8gaWxsdXN0cmF0ZSB0aGUKPiBw
ZXJmb3JtYW5jZSBjb21wYXJpc29uIHdpdGggYW5kIHdpdGhvdXQgdGhpcyBleHRlbnNpb24gKHJl
ZmVyIHRvCj4gdGVzdF9iaXRvcHMuYykgYW5kIGFsc28gcHJvdmlkZSB0aGUgcmVzdWx0cyBieSBi
bG9hdC1vLW1ldGVyLgoKSSBkb24ndCBoYXZlIGFjY2VzcyB0byBSSVNDLVYgaGFyZHdhcmUgYXQg
dGhlIG1vbWVudCwgc28gSSd2ZSBvbmx5CnBlcmZvcm1lZCBiYXNpYyBmdW5jdGlvbmFsIHRlc3Rp
bmcgb24gUUVNVSwgd2hpY2ggY29tcGxldGVkIHdpdGhvdXQKaXNzdWVz77yMY291bGQgeW91IHBs
ZWFzZSBoZWxwIHJ1biBzb21lIGJlbmNobWFya3MgdG8gdmVyaWZ5IHRoZSBwZXJmb3JtYW5jZT8K
ClRoYW5rcywKSmluamllCgo+IAo+IFRoYW5rcywKPiBQZWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
