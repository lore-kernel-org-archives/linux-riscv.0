Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C11C07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mM6UV3gSDmZ3I+rZC1VU0FkhVsORLUwdWhYpZuPLUg=; b=4tkFqpnKIUwdge
	8ezsPxJGvhMEgciVdpQ9FrGFiDGkPxHOnvGLSQjMW6Qj3heFRSzFLpp/b0wt8PKgoWmRyAalp3EvG
	cl704CDKqCgZVjcYgmR/8ECKg4zYCg4Qvz8J2YKzKWfb5rbjxqc33jT19P1o0XwXmH+lhQxzNglUi
	a6z04WzoaLFzB4Cufcjm1/BrK09GCkQHoog5KGlaKARlQN7gG3R3zPkwGkslgA79vsTq/o+Yydn31
	j+zyJvCWV6yB5lQ08IyBf8KjN0rvcV1A+XcEaLJfWYF9HKEoofN1Hci72e02mM8zP6RS7oRpqK4yp
	sy8Vtu75A/HL3h0uJsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8Ts-00A686-OK; Tue, 27 Sep 2022 11:10:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8Tn-00A637-P2
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:10:27 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McGzt4SFnzpV40;
	Tue, 27 Sep 2022 19:07:22 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 19:10:17 +0800
Message-ID: <fd5a713e-39ea-4f59-7a89-178ccb79f0dc@huawei.com>
Date: Tue, 27 Sep 2022 19:10:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] kprobes: Mark ftrace mcount handler functions nokprobe
To: Steven Rostedt <rostedt@goodmis.org>
CC: <mingo@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>
References: <20220919084533.42318-1-liaochang1@huawei.com>
 <20220926143723.73032f8c@gandalf.local.home>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20220926143723.73032f8c@gandalf.local.home>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_041024_187564_9E0B108E 
X-CRM114-Status: GOOD (  10.50  )
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

CgrlnKggMjAyMi85LzI3IDI6MzcsIFN0ZXZlbiBSb3N0ZWR0IOWGmemBkzoKPiBPbiBNb24sIDE5
IFNlcCAyMDIyIDE2OjQ1OjMzICswODAwCj4gTGlhbyBDaGFuZyA8bGlhb2NoYW5nMUBodWF3ZWku
Y29tPiB3cm90ZToKPiAKPj4gTWFyayBmdHJhY2UgbWNvdW50IGhhbmRsZXIgZnVuY3Rpb25zIG5v
a3Byb2JlIHNpbmNlIHByb2Jpbmcgb24gdGhlc2UKPj4gZnVuY3Rpb25zIHByb2JhYmx5IHJlYWNo
ZXMgbWNvdW50IHJlY3Vyc2l2bHkgZHVyaW5nIGtwcm9iZSBicmVha3BvaW50Cj4+IGhhbmRsZXIg
Zm9yIHNvbWUgYXJjaGl0ZWN0dXJlKHRlc3RlZCBmb3IgcmlzY3YsIGFybTY0KSwgYW5kIHJlZW50
ZXIKPj4ga3Byb2JlIGlzIHRyZWF0ZWQgYXMgYSBmYXRhbCBlcnJvciwgY2F1c2VzIGtlcm5lbCBw
YW5pYy4KPiAKPiBUaGlzIGxvb2tzIHRvIG1lIHRoYXQgdGhlIGFmZmVjdGVkIGFyY2hzIHNob3Vs
ZCBiZSBtYWRlIG1vcmUgcm9idXN0IGZvciB0aGlzCj4gY2FzZSB0aGFuIHRvIGFkZCB0aGlzIHRv
IHRoZSBnZW5lcmljIGNvZGUuCgpPSywgaSB3aWxsIGZpeCB0aGlzIHByb2JsZW0gaW4gYXJjaCBy
ZWxhdGVkIGNvZGUsIHRoYW5rcyBmb3IgZmVlZGJhY2suCgo+IAo+IC0tIFN0ZXZlCj4gCj4gCj4+
Cj4+IFBlc3VkbyBjb2RlIGJlbG93IGRlbW9uc3RyYXRlIHRoaXMgcHJvYmxlbToKPj4KPj4gICBt
Y291bnQKPj4gICAgIGZ1bmN0aW9uX3RyYWNlX2NhbGwgKHByb2JlZCkKPj4gICAgICAgYXJjaF9i
cmVha3BvaW50X2hhbmRsZXIKPj4gICAgICAgICBhcmNoX3NldHVwX3NpbmdsZXN0ZXAgW21jb3Vu
dF0KPj4gICAgICAgICAgIGZ1bmN0aW9uX3RyYWNlX2NhbGwgKHByb2JlZCkKPj4gICAgICAgICAg
ICAgYXJjaF9icmVha3BvaW50X2hhbmRsZXIKPj4gICAgICAgICAgICAgICByZWVudGVyX2twcm9i
ZQo+PiAgICAgICAgICAgICAgICAgQlVHCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpYW8gQ2hhbmcg
PGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICBrZXJuZWwvdHJhY2UvdHJhY2VfZnVu
Y3Rpb25zLmMgfCA1ICsrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvdHJhY2UvdHJhY2VfZnVuY3Rpb25zLmMgYi9rZXJuZWwv
dHJhY2UvdHJhY2VfZnVuY3Rpb25zLmMKPj4gaW5kZXggOWYxYmZiZTEwNWU4Li40NDBhNjc4YThj
N2MgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC90cmFjZS90cmFjZV9mdW5jdGlvbnMuYwo+PiArKysg
Yi9rZXJuZWwvdHJhY2UvdHJhY2VfZnVuY3Rpb25zLmMKPj4gQEAgLTE2LDYgKzE2LDcgQEAKPj4g
ICNpbmNsdWRlIDxsaW51eC9mdHJhY2UuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4+
ICAjaW5jbHVkZSA8bGludXgvZnMuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9rcHJvYmVzLmg+Cj4+
ICAKPj4gICNpbmNsdWRlICJ0cmFjZS5oIgo+PiAgCj4+IEBAIC0xOTQsNiArMTk1LDcgQEAgZnVu
Y3Rpb25fdHJhY2VfY2FsbCh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9p
cCwKPj4gIAo+PiAgCWZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2soYml0KTsKPj4gIH0KPj4g
K05PS1BST0JFX1NZTUJPTChmdW5jdGlvbl90cmFjZV9jYWxsKTsKPj4gIAo+PiAgI2lmZGVmIENP
TkZJR19VTldJTkRFUl9PUkMKPj4gIC8qCj4+IEBAIC0yNDUsNiArMjQ3LDcgQEAgZnVuY3Rpb25f
c3RhY2tfdHJhY2VfY2FsbCh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9p
cCwKPj4gIAlhdG9taWNfZGVjKCZkYXRhLT5kaXNhYmxlZCk7Cj4+ICAJbG9jYWxfaXJxX3Jlc3Rv
cmUoZmxhZ3MpOwo+PiAgfQo+PiArTk9LUFJPQkVfU1lNQk9MKGZ1bmN0aW9uX3N0YWNrX3RyYWNl
X2NhbGwpOwo+PiAgCj4+ICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcmVwZWF0X2NoZWNrKHN0cnVj
dCB0cmFjZV9hcnJheSAqdHIsCj4+ICAJCQkJICAgc3RydWN0IHRyYWNlX2Z1bmNfcmVwZWF0cyAq
bGFzdF9pbmZvLAo+PiBAQCAtMzIxLDYgKzMyNCw3IEBAIGZ1bmN0aW9uX25vX3JlcGVhdHNfdHJh
Y2VfY2FsbCh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPj4gIG91
dDoKPj4gIAlmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGJpdCk7Cj4+ICB9Cj4+ICtOT0tQ
Uk9CRV9TWU1CT0woZnVuY3Rpb25fbm9fcmVwZWF0c190cmFjZV9jYWxsKTsKPj4gIAo+PiAgc3Rh
dGljIHZvaWQKPj4gIGZ1bmN0aW9uX3N0YWNrX25vX3JlcGVhdHNfdHJhY2VfY2FsbCh1bnNpZ25l
ZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPj4gQEAgLTM2Myw2ICszNjcsNyBA
QCBmdW5jdGlvbl9zdGFja19ub19yZXBlYXRzX3RyYWNlX2NhbGwodW5zaWduZWQgbG9uZyBpcCwg
dW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4+ICAJYXRvbWljX2RlYygmZGF0YS0+ZGlzYWJsZWQp
Owo+PiAgCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKPj4gIH0KPj4gK05PS1BST0JFX1NZTUJP
TChmdW5jdGlvbl9zdGFja19ub19yZXBlYXRzX3RyYWNlX2NhbGwpOwo+PiAgCj4+ICBzdGF0aWMg
c3RydWN0IHRyYWNlcl9vcHQgZnVuY19vcHRzW10gPSB7Cj4+ICAjaWZkZWYgQ09ORklHX1NUQUNL
VFJBQ0UKPiAKPiAKPiAuCgotLSAKQlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
