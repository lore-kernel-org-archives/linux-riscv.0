Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641F1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7jmkzvWqk9xmdVkmFfB/GRAGdMtfE9bYL7drIKextA=; b=OBnNWDPuO0KIHj
	fVeIq4Y1+d92ZknSSaM/K+EbMxEMDyu5tAYNFmRM8Tz3jL3Eq94m1UbUw8xG73SGBohzLXw7Xv2BD
	M++uv1yPAMqG/OC1+xvq9XUlxb2ZWEM6gMCBCjhSU6PxiGIzlahXMD8UoYtw7wEcdJMGvmUVjIhxG
	VLWyMMfDWvSDIeLUOBgWo0wcKvRcYJRRMm784e4mFYp2QMidgWasVkRrw7sH8450aZgKIibMaomPn
	zvbN2lCblrwrWbgxUpTAfNGqYwSiqOkbKVZPssEiz1oW6ryPUorqpo13m0nZNqtcEbDwb/b1+D1dU
	6viyCbRrPSEX1fWnHcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntlvR-00AFsO-QQ; Wed, 25 May 2022 07:59:25 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntlvP-00AFqr-0z
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 07:59:25 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L7NkR2m1jzDqS5;
 Wed, 25 May 2022 15:59:11 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 15:59:14 +0800
Message-ID: <cd9a856b-ed8a-88f1-da69-4fb628c28f34@huawei.com>
Date: Wed, 25 May 2022 15:59:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] riscv/kprobe: reclaim insn_slot on kprobe
 unregistration
To: Guo Ren <guoren@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu
 <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Naveen Rao <naveen.n.rao@linux.vnet.ibm.com>,
 <jszhang@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220525014424.20717-1-liaochang1@huawei.com>
 <CAJF2gTS9_1D+K-ok2vxQpbq6B7zxv1K-t8cfcu1hFjF=7a5yxQ@mail.gmail.com>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <CAJF2gTS9_1D+K-ok2vxQpbq6B7zxv1K-t8cfcu1hFjF=7a5yxQ@mail.gmail.com>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_005923_287338_98B85F1A 
X-CRM114-Status: GOOD (  14.33  )
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

CgrlnKggMjAyMi81LzI1IDE0OjIzLCBHdW8gUmVuIOWGmemBkzoKPiBPbiBXZWQsIE1heSAyNSwg
MjAyMiBhdCA5OjQ2IEFNIExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIGtwcm9iZSByZWdpc3RyYXRpb24ga2VybmVsIGFsbG9jYXRlIG9uZSBpbnNuX3Ns
b3QgZm9yIG5ldyBrcHJvYmUsCj4+IGJ1dCBpdCBmb3JnZXQgdG8gcmVjbGFpbSB0aGUgaW5zbl9z
bG90IG9uIHVucmVnaXN0cmF0aW9uLCBsZWFkaW5nIHRvIGEKPj4gcG90ZW50aWFsIGxlYWthZ2Uu
Cj4+Cj4+IFJlcG9ydGVkLWJ5OiBDaGVuIEd1b2thaSA8Y2hlbmd1b2thaTE3QG1haWxzLnVjYXMu
YWMuY24+Cj4+IFNpZ25lZC1vZmYtYnk6IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNv
bT4KPj4gLS0tCj4+IHYyOgo+PiAgIEFkZCBSZXBvcnRlZC1ieSB0YWcKPj4KPj4gIGFyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCA0ICsrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jl
cy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+IGluZGV4
IGU2ZTk1MGI3Y2YzMi4uZjEyZWIxZmJiNTJjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9r
cHJvYmVzLmMKPj4gQEAgLTExMCw2ICsxMTAsMTAgQEAgdm9pZCBfX2twcm9iZXMgYXJjaF9kaXNh
cm1fa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4+Cj4+ICB2b2lkIF9fa3Byb2JlcyBhcmNoX3Jl
bW92ZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPj4gIHsKPj4gKyAgICAgICBpZiAocC0+YWlu
c24uYXBpLmluc24pIHsKPj4gKyAgICAgICAgICAgICAgIGZyZWVfaW5zbl9zbG90KHAtPmFpbnNu
LmFwaS5pbnNuLCAwKTsKPj4gKyAgICAgICAgICAgICAgIHAtPmFpbnNuLmFwaS5pbnNuID0gTlVM
TDsKPj4gKyAgICAgICB9Cj4gVGh4IHJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPiAKPiBZb3UgYWxzbyBjb3VsZCBnaXZlIGEgZml4dXAgcGF0Y2ggdG8gY3NreSwgdGh4
Ogo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBi
L2FyY2gvY3NreS9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+IGluZGV4IDQyOTIwZjI1ZTczYy4u
NjYxZGE1NGI0MThmIDEwMDY0NAo+IC0tLSBhL2FyY2gvY3NreS9rZXJuZWwvcHJvYmVzL2twcm9i
ZXMuYwo+ICsrKyBiL2FyY2gvY3NreS9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+IEBAIC0xMjQs
NiArMTI0LDEwIEBAIHZvaWQgX19rcHJvYmVzIGFyY2hfZGlzYXJtX2twcm9iZShzdHJ1Y3Qga3By
b2JlICpwKQo+IAo+ICB2b2lkIF9fa3Byb2JlcyBhcmNoX3JlbW92ZV9rcHJvYmUoc3RydWN0IGtw
cm9iZSAqcCkKPiAgewo+ICsgICAgICAgaWYgKHAtPmFpbnNuLmFwaS5pbnNuKSB7Cj4gKyAgICAg
ICAgICAgICAgIGZyZWVfaW5zbl9zbG90KHAtPmFpbnNuLmFwaS5pbnNuLCAwKTsKPiArICAgICAg
ICAgICAgICAgcC0+YWluc24uYXBpLmluc24gPSBOVUxMOwo+ICsgICAgICAgfQo+ICB9CgpTdXJl
LCBJIHdpbGwsIHRoYW5rcy4KPiAKPiAgc3RhdGljIHZvaWQgX19rcHJvYmVzIHNhdmVfcHJldmlv
dXNfa3Byb2JlKHN0cnVjdCBrcHJvYmVfY3RsYmxrICprY2IpCj4gCj4+ICB9Cj4+Cj4+ICBzdGF0
aWMgdm9pZCBfX2twcm9iZXMgc2F2ZV9wcmV2aW91c19rcHJvYmUoc3RydWN0IGtwcm9iZV9jdGxi
bGsgKmtjYikKPj4gLS0KPj4gMi4xNy4xCj4+Cj4gCj4gCgotLSAKQlIsCkxpYW8sIENoYW5nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
