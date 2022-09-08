Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C14ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 01:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62yVcFGul8G8Hh0FIwgkr+hXwtJ9ZQuh+iqet3+Z0Bg=; b=QtXAfrrUeCLDcL
	eMzez1YgapAKC8GNu0H9et0Yw4SxCDMYjRmuqYVY2qvim0QaCw1Pe0CzSEaj/SoGWqPeZu4n4CQF9
	01q0qgMEz7YhiKUoevVmj+8RwendVOr/6LIToU78fyd6hla0CwRgcUoOdZ/8xi2/jn6FsfwGRIhyl
	9Bbu4/eMJ8zNybzC+WxN2JcgI1nPiiPMcAFtiQfeh+J+PXcATd58YgXRm/8TO2ohklkJNt0FEMmi3
	fZFtXkSgmE2klH8IZglJ435y5wWTc+t8XxcKOSA4hOZHmgNF2u0LITVGLHjN0ZmUye4MEmlLcX7Fu
	WIUIEO6wTlMwRSN/Gnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6kV-00ESSd-5q; Thu, 08 Sep 2022 01:54:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6kS-00ESRw-5n
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 01:54:33 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MNMXJ5fkWzkWv0;
	Thu,  8 Sep 2022 09:50:40 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 8 Sep 2022 09:54:30 +0800
Message-ID: <819b4964-0f81-74d4-1dd5-e836326447ec@huawei.com>
Date: Thu, 8 Sep 2022 09:54:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] riscv: kprobes: Free instruction in arch_remove_kprobe()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1662601156-25802-1-git-send-email-yangtiezhu@loongson.cn>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <1662601156-25802-1-git-send-email-yangtiezhu@loongson.cn>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_185432_408990_3929A93E 
X-CRM114-Status: UNSURE (   8.61  )
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

SGksIFRpZXpodSwKClRoaXMgYnVnIGlzIGZpeGVkIGFscmVhZHksIHNlZSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvY2Q5YTg1NmItZWQ4YS04OGYxLWRhNjktNGZiNjI4YzI4ZjM0QGh1YXdl
aS5jb20vVC8KCuWcqCAyMDIyLzkvOCA5OjM5LCBUaWV6aHUgWWFuZyDlhpnpgZM6Cj4gQ2FsbCBm
cmVlX2luc25fc2xvdCgpIHRvIGZyZWUgaW5zdHJ1Y3Rpb24gaW4gYXJjaF9yZW1vdmVfa3Byb2Jl
KCkKPiBhcyBvdGhlciBhcmNoZXMgZG8uCj4gCj4gU2lnbmVkLW9mZi1ieTogVGllemh1IFlhbmcg
PHlhbmd0aWV6aHVAbG9vbmdzb24uY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jl
cy9rcHJvYmVzLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+IGluZGV4IGU2ZTk1MGIuLmYxMmViMWYg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBAQCAtMTEwLDYgKzExMCwxMCBA
QCB2b2lkIF9fa3Byb2JlcyBhcmNoX2Rpc2FybV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiAg
Cj4gIHZvaWQgX19rcHJvYmVzIGFyY2hfcmVtb3ZlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+
ICB7Cj4gKwlpZiAocC0+YWluc24uYXBpLmluc24pIHsKPiArCQlmcmVlX2luc25fc2xvdChwLT5h
aW5zbi5hcGkuaW5zbiwgMCk7Cj4gKwkJcC0+YWluc24uYXBpLmluc24gPSBOVUxMOwo+ICsJfQo+
ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBfX2twcm9iZXMgc2F2ZV9wcmV2aW91c19rcHJvYmUoc3Ry
dWN0IGtwcm9iZV9jdGxibGsgKmtjYikKCi0tIApCUiwKTGlhbywgQ2hhbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
