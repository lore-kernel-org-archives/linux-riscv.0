Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPR+4VyZwjMIXuGQ/t4S9zeqalOKGx4WOuGHehfRXmI=; b=X6rwuAYGVbo049
	Q5e7JO+pu2Ry0+4BqSv34CswGdErSvKUFbY4oOCOaRxPmqxKpgOCYDZ10/iIJi4/ZobI89cTWr2N8
	pO5VnkGCTyGxAjDANMYJ6ZRVo0wFS35WGGAx0yt8lnPyfmu7JvrPUKx/hW9xFvb33Bbr2GCEWAews
	lh9s9rMCjtWjN6KlDzu6Sa3SlOmaaTaz/3BOx0HAz8NafLf9IyXgITpSRDpmjik3ZJ8heTAXJ2maq
	eFMi/Yiqtu385gh3Wr4QDvWkHOQiCqUDaPwTBLWevOQ6RlseW9rugypsk2q234v1mD+jRRdTzC89n
	2dWXKPe/x4diqOEobSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4QM-006VPN-PG; Fri, 30 Sep 2022 01:02:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4QA-006VLC-UV; Fri, 30 Sep 2022 01:02:32 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MdsKd5c8hzWh8H;
	Fri, 30 Sep 2022 08:58:13 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:02:21 +0800
Message-ID: <c301bfbe-afa8-ab1a-9062-56e4612fdf2c@huawei.com>
Date: Fri, 30 Sep 2022 09:02:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <guoren@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mhiramat@kernel.org>,
	<rostedt@goodmis.org>, <maz@kernel.org>, <alexandru.elisei@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20220927022435.129965-1-liaochang1@huawei.com>
 <20220927022435.129965-4-liaochang1@huawei.com> <YzXM4qMZlNWh/JJy@arm.com>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <YzXM4qMZlNWh/JJy@arm.com>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_180231_197130_2EE2B565 
X-CRM114-Status: UNSURE (   8.25  )
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

CgrlnKggMjAyMi85LzMwIDA6NTAsIENhdGFsaW4gTWFyaW5hcyDlhpnpgZM6Cj4gT24gVHVlLCBT
ZXAgMjcsIDIwMjIgYXQgMTA6MjQ6MzVBTSArMDgwMCwgTGlhbyBDaGFuZyB3cm90ZToKPj4gU2lu
Z2xlLXN0ZXAgc2xvdCB3b3VsZCBub3QgYmUgdXNlZCB1bnRpbCBrcHJvYmUgaXMgZW5hYmxlZCwg
dGhhdCBtZWFucwo+PiBubyByYWNlIGNvbmRpdGlvbiBvY2N1cnMgb24gaXQgdW5kZXIgU01QLCBo
ZW5jZSBpdCBpcyBzYWZlIHRvIHBhY3RoIHNzCj4+IHNsb3Qgd2l0aG91dCBzdG9wcGluZyBtYWNo
aW5lLgo+Pgo+PiBTaW5jZSBJIGFuZCBEIGNhY2hlcyBhcmUgY29oZXJlbnQgd2l0aGluIHNpbmds
ZS1zdGVwIHNsb3QgZnJvbQo+PiBhYXJjaDY0X2luc25fcGF0Y2hfdGV4dF9ub3N5bmMoKSwgaGVu
Y2Ugbm8gbmVlZCB0byBkbyBpdCBhZ2FpbiB2aWEKPj4gZmx1c2hfaWNhY2hlX3JhbmdlKCkuCj4+
Cj4+IEFja2VkLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+PiBBY2tlZC1ieTog
TWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KPj4gU2lnbmVk
LW9mZi1ieTogTGlhbyBDaGFuZyA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGFy
Y2gvYXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCAyNyArKysrKysrKysrKysrKysrKysr
KystLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+IAo+IFdoYXQncyB5b3VyIGV4cGVjdGF0aW9uIHdpdGggdGhpcyBzZXJpZXMsIHNob3Vs
ZCB0aGUgYXJjaCBtYWludGFpbmVycwo+IGp1c3QgcGljayB0aGUgaW5kaXZpZHVhbCBwYXRjaGVz
PwoKWWVzLCBvciBzaG91bGQgaSBzcGxpdCB0aGlzIHNlcmllcyBpbnRvIGluZGl2aWR1YWwgcGF0
Y2g/CgpUaGFua3MuCgo+IAoKLS0gCkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
