Return-Path: <SRS0=dKKk=FS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF6AC4361B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:31:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B26122A99
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B26122A99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W2OeIPO7N9GnLxAAvc1bZfvUEfeLOK7Jr+5LVbAUhMo=; b=bIKk2pFx//5bP35FKTPQTrdl9
	5WvEeF5bM/6+36iCnDYrm3dO4rYUDTNyl6/x7zVO3/mwYrrogQ3IXlMKzM60n1bAtZnyRgXaRUYZK
	tgX3r/C/FcjiCKZ1YABrO6GHsPzqduLiCDxkxW6NLCORD30tuf8stnSaHjuvAoVNwUmXY1iAa70bb
	dDKNGvYYY4QjpTO4sSLAIpoUR0GuKHxaZqPoL6rxJCC9AEAq2p2ZSvkKtI6VHi9CL7sCPtizIqQNc
	kRpSNt0Yz85xkn+KS+F+BBlvxGzdm+opTrTbF062xuy2ycEhVXS9F3LPzfyOhz4CQpK+oxGOTK+Rl
	6McrjZ9yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kom4R-0002Rq-0t; Mon, 14 Dec 2020 11:31:15 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kom4O-0002Qz-F8
 for linux-riscv@lists.infradead.org; Mon, 14 Dec 2020 11:31:13 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvfMS6YdpzhtC2;
 Mon, 14 Dec 2020 19:30:28 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 19:31:03 +0800
Subject: Re: [PATCH] riscv: Add machine name to kernel boot log and stack dump
 output
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20201125114415.94912-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <b0cc0186-b14f-7ce4-e429-1a09442c4953@huawei.com>
Date: Mon, 14 Dec 2020 19:31:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201125114415.94912-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_063112_762380_784B8443 
X-CRM114-Status: GOOD (  17.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLMKgIGtpbmRseSBwaW5nLi4KCk9uIDIwMjAvMTEvMjUgMTk6NDQsIEtlZmVuZyBX
YW5nIHdyb3RlOgo+IEFkZCB0aGUgbWFjaGluZSBuYW1lIHRvIGtlcm5lbCBib290LXVwIGxvZywg
YW5kIGluc3RhbGwKPiB0aGUgbWFjaGluZSBuYW1lIHRvIHN0YWNrIGR1bXAgZm9yIERUIGJvb3Qg
bW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KPiAtLS0KPgo+IEhlcmUgaXMgdGhlIG1lc3NhZ2UgYWZ0ZXIgcGF0Y2hlZCwKPgo+
IHJvb3RAKG5vbmUpOn4jIGRtZXNnIHxncmVwICJNYWNoaW5lIG1vZGVsIgo+IFsgICAgMC4wMDAw
MDBdIE1hY2hpbmUgbW9kZWw6IHJpc2N2LXZpcnRpbyxxZW11Cj4KPiByb290QChub25lKTp+IyBl
Y2hvIGMgPiAvcHJvYy9zeXNycS10cmlnZ2VyCj4gWyAxNTE5LjQ3NTM0Nl0gc3lzcnE6IFRyaWdn
ZXIgYSBjcmFzaAo+IFsgMTUxOS40NzYwMDRdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBz
eXNycSB0cmlnZ2VyZWQgY3Jhc2gKPiBbIDE1MTkuNDc2NDgwXSBDUFU6IDAgUElEOiA2NCBDb21t
OiBzaCBOb3QgdGFpbnRlZCA1LjEwLjAtcmM1ICMyNDYKPiBbIDE1MTkuNDc2ODc3XSBIYXJkd2Fy
ZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4gWyAxNTE5LjQ3NzE2OV0gQ2FsbCBUcmFj
ZToKPiAuLi4KPgo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDkgKysrKysrKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMKPiBpbmRleCBjNDI0Y2M2ZGQ4MzMuLjkwMWFjMGM2ODBkZCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAu
Ywo+IEBAIC01NCw4ICs1NCwxNSBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGNwdSwg
Y3B1X2RldmljZXMpOwo+ICAgc3RhdGljIHZvaWQgX19pbml0IHBhcnNlX2R0Yih2b2lkKQo+ICAg
ewo+ICAgCS8qIEVhcmx5IHNjYW4gb2YgZGV2aWNlIHRyZWUgZnJvbSBpbml0IG1lbW9yeSAqLwo+
IC0JaWYgKGVhcmx5X2luaXRfZHRfc2NhbihkdGJfZWFybHlfdmEpKQo+ICsJaWYgKGVhcmx5X2lu
aXRfZHRfc2NhbihkdGJfZWFybHlfdmEpKSB7Cj4gKwkJY29uc3QgY2hhciAqbmFtZSA9IG9mX2Zs
YXRfZHRfZ2V0X21hY2hpbmVfbmFtZSgpOwo+ICsKPiArCQlpZiAobmFtZSkgewo+ICsJCQlwcl9p
bmZvKCJNYWNoaW5lIG1vZGVsOiAlc1xuIiwgbmFtZSk7Cj4gKwkJCWR1bXBfc3RhY2tfc2V0X2Fy
Y2hfZGVzYygiJXMgKERUKSIsIG5hbWUpOwo+ICsJCX0KPiAgIAkJcmV0dXJuOwo+ICsJfQo+ICAg
Cj4gICAJcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxcbiIpOwo+ICAgI2lmZGVm
IENPTkZJR19DTURMSU5FX0ZPUkNFCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
