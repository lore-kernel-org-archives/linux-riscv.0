Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460E2C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 06:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r5Gokg+VA1CmZXiSc70lVX+3sRSwHWTYP6HoPynBxY=; b=gLv1li/L50f6Q4
	MW2fWXLUv/6tqNnN5WIV/pbGqx8EkQLLF9G95DsHWTMGT1x/JWRMEfVhHaJp4NxFH6f05I18aOhwQ
	l3BEbdpW7T/TfaM59aQAtCLu/npYAPMTGQlgtAhtSHeoKguMMWWtV3ZDFlTWFS5a0O2iNyey7ZF0F
	zuNoTDS4cN0gLamBCwlotezzNVHVk/QevA4YRvDQqXQfBfnBpKI8Y1P6MowpXvIfaVrn1qOZ6mzv+
	14YPJSopte2/bZZ/rZAR+pkVZ7wt8OtyMQaAjqKxDKCOFA09Ux4Vy/R8iBFgkGU18SLmX3WcCmL7u
	CE7icDmfMLBBawCtWuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQjwK-00AwWe-0u; Wed, 24 Aug 2022 06:32:36 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQjwG-00AwHS-9l
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 06:32:34 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MCGSL05SyzGpmK;
	Wed, 24 Aug 2022 14:30:42 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 14:31:50 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 14:31:49 +0800
Message-ID: <4063da85-b110-4afd-2023-59d4da41c27f@huawei.com>
Date: Wed, 24 Aug 2022 14:31:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 0/2]riscv: some refactorings realted to uaccess
 and extable
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20220815032025.2685516-1-tongtiangen@huawei.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_233232_582530_FF3DCA35 
X-CRM114-Status: UNSURE (   4.51  )
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

SGkgcmlzY3YgbWFpbnRhaW5lcnMsIGtpbmRseSBwaW5nLi4uCgpUaGFua3MsClRvbmcuCgrlnKgg
MjAyMi84LzE1IDExOjIwLCBUb25nIFRpYW5nZW4g5YaZ6YGTOgo+IFRoaXMgcGF0Y2hzZXQgZG8g
c29tZSByZWZhY3RvcmluZ3MgcmVsYXRlZCB0byByaXNjdidzIHVhY2Nlc3MgYW5kIGV4dGFibGUs
Cj4gbWFpbmx5IGZvciB0aGUgdXNhZ2Ugb2YgX19nZXQvcHV0X3VzZXJfbm9jaGVjaygpIHdoaWNo
IG5vdCBkaXN0aW5ndWlzaCB1c2VyCj4gYWNjZXNzIGFuZCBrZXJuZWwgYWNjZXNzLgo+IAo+IHYx
IC0+IHYyOgo+ICAgIEFjY29yZGluZyB0byBDb25vcidzIHN1Z2dlc3Rpb24sIHNwbGl0IGludG8g
dHdvIGxvZ2ljYWxseSBpbmRlcGVuZGVudAo+ICAgIHBhdGNoZXMuCj4gCj4gVG9uZyBUaWFuZ2Vu
ICgyKToKPiAgICByaXNjdjogdWFjY2VzczogcmVuYW1lIF9fZ2V0L3B1dF91c2VyX25vY2hlY2sg
dG8gX19nZXQvcHV0X21lbV9ub2NoZWNrCj4gICAgcmlzY3Y6IGV4dGFibGU6IGFkZCBuZXcgZXh0
YWJsZSB0eXBlIEVYX1RZUEVfS0FDQ0VTU19FUlJfWkVSTyBzdXBwb3J0Cj4gCj4gICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS1leHRhYmxlLmggfCAgMTIgKysKPiAgIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oICAgICB8IDE2MiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0K
PiAgIGFyY2gvcmlzY3YvbW0vZXh0YWJsZS5jICAgICAgICAgICAgICB8ICAgMSArCj4gICAzIGZp
bGVzIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKyksIDgxIGRlbGV0aW9ucygtKQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
