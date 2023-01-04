Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299FCC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVHGzMDVEHu9ciqKag8BWQhz9rmILoxS7Fd7VurGPGQ=; b=bm20Ic8ADSkxII
	vOoBoEn7buuVwQRFS45YLwsefzMIWW2lyjnGxUlhMLzETu/6FpiO/+pqrWd+GVLeHQUWc7sbYdrWQ
	bFF7DsqGtLLi5Nt2jD8aV4Zz14G+NkUF829+UrMLeoCJKyYISfHUjErRxLau3+2MB0tgdPjdPB4fp
	03T6+Zikb3C4xmwaO9cjpnsIIgta/CzuxerrmuSjsdfbGwTPjwFtY1/2N44E53J1WlNIfYeMzMNXY
	R6xJRNozwg0e9PFXV9g6kfpv1Bw8IpfWB1Ac/O5fwQGbHjCIElKfQpUL3utM6wbGK7O5AK7f5Hd9A
	S01S/RgiRiQTgG+X4rcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzHw-007h1b-B9; Wed, 04 Jan 2023 08:38:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzFH-007g18-Gp
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:35:37 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Nn2vd09rRzHw5F;
	Wed,  4 Jan 2023 16:34:21 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:35:32 +0800
Message-ID: <c6a02499-457d-6616-9ede-4f2d89bfce3f@huawei.com>
Date: Wed, 4 Jan 2023 16:35:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 9/9] riscv/kprobe: Search free registers from unused
 caller-saved ones
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-10-chenguokai17@mails.ucas.ac.cn>
 <87pmbwvmmr.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87pmbwvmmr.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003535_778369_A1088125 
X-CRM114-Status: UNSURE (   4.11  )
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

CgrlnKggMjAyMy8xLzMgMjowNCwgQmrDtnJuIFTDtnBlbCDlhpnpgZM6Cj4gQ2hlbiBHdW9rYWkg
PGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cj4gCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMvb3B0LmMKPj4gaW5kZXggMWMwZTlkMjE4ZjZmLi44ODRlNzdkMmRmNGMgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMvb3B0LmMKPj4gQEAgLTEyLDYgKzEyLDcgQEAKPj4gICNpbmNsdWRlIDxhc20v
a3Byb2Jlcy5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgo+PiAgI2luY2x1ZGUgPGFzbS9h
c20tb2Zmc2V0cy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2V4dGFibGUuaD4KPj4gIAo+PiAgI2lu
Y2x1ZGUgInNpbXVsYXRlLWluc24uaCIKPj4gICNpbmNsdWRlICJkZWNvZGUtaW5zbi5oIgo+PiBA
QCAtMTMwLDcgKzEzMSw3IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfZGV0b3VyX2J1ZmZlcihrcHJv
YmVfb3Bjb2RlX3QgKmNvZGUsIGtwcm9iZV9vcGNvZGVfdCAqc2xvdCwKPj4gICAqIGFzIGEgZGVz
dGluYXRpb24gcmVnaXN0ZXIgYmVmb3JlIGFueSBicmFuY2ggb3IganVtcCBpbnN0cnVjdGlvbi4K
Pj4gICAqLwo+PiAgc3RhdGljIHZvaWQgZmluZF9yZWdpc3Rlcih1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGVuZCwKPj4gLQkJCSAgICAgICB1bnNpZ25lZCBsb25nICp3cml0ZSwg
dW5zaWduZWQgbG9uZyAqcmVhZCkKPj4gKwkJCSAgdW5zaWduZWQgbG9uZyAqd3JpdGUsIHVuc2ln
bmVkIGxvbmcgKnJlYWQpCj4gCj4gUHJvYmFibHkgYSBwYXRjaCBtZXNzdXA7IFRoaXMgbWFrZXMg
dGhlIHNlcmllcyBubyBhcHBseSBmdWxseS4KCk5vdCBzdXJlLCBpIHdpbGwgYXBwbHkgdGhpcyBw
YXRjaCB0byBsYXRlc3Qga2VybmVsKExpbnV4IDYuMi1yYzIpCgo+IAo+IAo+IEJqw7ZybgoKLS0g
CkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
