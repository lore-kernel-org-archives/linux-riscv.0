Return-Path: <SRS0=Picb=HU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFBAC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Feb 2021 09:28:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F0B64D79
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Feb 2021 09:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F0B64D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/k+y9n7+mbC78+eqUplXjub6s9aQAVx5JV9o5hPZC6A=; b=3cg0034k9aseG7AXM2i6e/VOj
	LnRADN2CmDHLy2rPvOa1dyjrj0qXD+hohlpldA+Z0ut3YxqHs3VoreMMzMj7ToctFrJaSV18yuyWJ
	q9TX7VcG04F9wQl7jpcd1MozRQJwVOiGU2Y2Lmj4Ytb4h3BDdKJlGry4q5KLcaWucjMh+nRN8LmOx
	NHgXqhuQ1d+Ncm2gutqFzkHzPVJEmD/u+ZCh6grtZRqCCw1CuIUo41n0CWkFaj8HMyB8kbK0RbDdF
	MyEc7VmtHp6xjq42y8UNAzZ3TGjqQiMSUDZgMEtwh7PyiBYbEqRV9ee/WY+P9pkPLGnTczP8qxKwn
	QLC5PjJyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCfbZ-0004at-Ox; Thu, 18 Feb 2021 09:28:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCfbU-0004ZB-Mv; Thu, 18 Feb 2021 09:28:09 +0000
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Dh8Md3t2Sz67q3h;
 Thu, 18 Feb 2021 17:21:01 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 10:28:01 +0100
Received: from [10.210.168.96] (10.210.168.96) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 09:27:59 +0000
Subject: Re: [PATCH v5] perf tools: Fix arm64 build error with gcc-11
To: Jianlin Lv <Jianlin.Lv@arm.com>, <will@kernel.org>,
 <mathieu.poirier@linaro.org>, <leo.yan@linaro.org>, <peterz@infradead.org>,
 <mingo@redhat.com>, <acme@kernel.org>, <mark.rutland@arm.com>,
 <alexander.shishkin@linux.intel.com>, <jolsa@redhat.com>,
 <namhyung@kernel.org>, <guoren@kernel.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <kjain@linux.ibm.com>,
 <atrajeev@linux.vnet.ibm.com>, <ravi.bangoria@linux.ibm.com>,
 <anju@linux.vnet.ibm.com>
References: <20210218031245.2078492-1-Jianlin.Lv@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <bd474bfa-2bdb-53ea-5142-3a6570d63b7f@huawei.com>
Date: Thu, 18 Feb 2021 09:26:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20210218031245.2078492-1-Jianlin.Lv@arm.com>
Content-Language: en-US
X-Originating-IP: [10.210.168.96]
X-ClientProxiedBy: lhreml720-chm.china.huawei.com (10.201.108.71) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_042808_896975_1CBD772C 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: iecedge@gmail.com, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTgvMDIvMjAyMSAwMzoxMiwgSmlhbmxpbiBMdiB3cm90ZToKPiBnY2MgdmVyc2lvbjogMTEu
MC4wIDIwMjEwMjA4IChleHBlcmltZW50YWwpIChHQ0MpCj4gCj4gRm9sbG93aW5nIGJ1aWxkIGVy
cm9yIG9uIGFybTY0Ogo+IAo+IC4uLi4uLi4KPiBJbiBmdW5jdGlvbiDigJhwcmludGbigJksCj4g
ICAgICBpbmxpbmVkIGZyb20g4oCYcmVnc19kdW1wX19wcmludGbigJkgYXQgdXRpbC9zZXNzaW9u
LmM6MTE0MTozLAo+ICAgICAgaW5saW5lZCBmcm9tIOKAmHJlZ3NfX3ByaW50ZuKAmSBhdCB1dGls
L3Nlc3Npb24uYzoxMTY5OjI6Cj4gL3Vzci9pbmNsdWRlL2FhcmNoNjQtbGludXgtZ251L2JpdHMv
c3RkaW8yLmg6MTA3OjEwOiBcCj4gICAgZXJyb3I6IOKAmCUtNXPigJkgZGlyZWN0aXZlIGFyZ3Vt
ZW50IGlzIG51bGwgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KPiAKPiAxMDcgfCAgIHJldHVy
biBfX3ByaW50Zl9jaGsgKF9fVVNFX0ZPUlRJRllfTEVWRUwgLSAxLCBfX2ZtdCwgXAo+ICAgICAg
ICAgICAgICAgICAgX192YV9hcmdfcGFjayAoKSk7Cj4gCj4gLi4uLi4uCj4gSW4gZnVuY3Rpb24g
4oCYZnByaW50ZuKAmSwKPiAgICBpbmxpbmVkIGZyb20g4oCYcGVyZl9zYW1wbGVfX2ZwcmludGZf
cmVncy5pc3Jh4oCZIGF0IFwKPiAgICAgIGJ1aWx0aW4tc2NyaXB0LmM6NjIyOjE0Ogo+IC91c3Iv
aW5jbHVkZS9hYXJjaDY0LWxpbnV4LWdudS9iaXRzL3N0ZGlvMi5oOjEwMDoxMDogXAo+ICAgICAg
ZXJyb3I6IOKAmCU1c+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3Jt
YXQtb3ZlcmZsb3c9XQo+ICAgIDEwMCB8ICAgcmV0dXJuIF9fZnByaW50Zl9jaGsgKF9fc3RyZWFt
LCBfX1VTRV9GT1JUSUZZX0xFVkVMIC0gMSwgX19mbXQsCj4gICAgMTAxIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgX192YV9hcmdfcGFjayAoKSk7Cj4gCj4gY2MxOiBhbGwgd2FybmluZ3MgYmVp
bmcgdHJlYXRlZCBhcyBlcnJvcnMKPiAuLi4uLi4uCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyBXZm9y
bWF0LW92ZXJmbG93IHdhcm5pbmdzLiBBZGQgaGVscGVyIGZ1bmN0aW9uIHRvCj4gY29udmVydCBO
VUxMIHRvICJ1bmtub3duIi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaWFubGluIEx2PEppYW5saW4u
THZAYXJtLmNvbT4KCnRoYW5rcwpSZXZpZXdlZC1ieTogSm9obiBHYXJyeSA8am9obi5nYXJyeUBo
dWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
