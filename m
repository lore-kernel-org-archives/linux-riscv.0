Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6664DC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oy4/NQIT51711OirEor11+2oJmaLJQwr3u1vGiex5c0=; b=TtCDjVlne5kL5E
	u0wNLv83T0sJObbFFDl/NZ3Ooo2YZ/ncOQLSM/PnIn4AOv5EiXiumX1TB/Cx1o6WoAPPu9fRyaAsI
	xbpBafSAm+XoV5Ux8nhhlCMh5i5tqm+sibXd/T3xcFfJY3kI2x6UJgQTXK1M1FXAJeDsCHIUCPAlx
	TFyYTtT8lpOULomxwed/bVoRIwHivsFOhj9/3tYFGT/P9yBYllIOfTEoFvibxvayVyYhln/yuRLbU
	zPJExy62rFheRlSr5rMGh4LWuHYbYNTeQera1V7nrz1aHAtfIGS89bYxpItWA8MioHyee5S14q/mS
	Fkp/La7AoqCx0f8QniZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uUG-00EVv3-00;
	Wed, 24 May 2023 19:49:32 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uUC-00EVt5-2B
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 19:49:30 +0000
Date: Wed, 24 May 2023 21:49:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684957756; bh=ZaelfMuK9nEHZvEYR6H9kLGszov8JzRnhm0N2fM3xgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5YQaFPevn8tMPELIZ3rL/vARmEGIWBtjWcHmaPhYF+yDj//no8UtMhib8t1RCkgD
	 2Qx7BcHZAYGtIOSIglBrEkhtnKk7vUQ+wwzP5FZ4tpjHk02fB++Qe+2p0hXbCVEoF0
	 7NG4Qy6bNq2lDmpXMc3SwckumYi786BO2HxEJScI=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 04/13] selftests/nolibc: syscall_args: use __NR_statx for
 rv32
Message-ID: <09d60dc2-e298-4c22-8e2f-8375861bd9be@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <b306ae7b53d67acad6d1e2f63d43505d79f81241.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b306ae7b53d67acad6d1e2f63d43505d79f81241.1684949267.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_124928_885253_7F7E84E5 
X-CRM114-Status: GOOD (  10.67  )
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

T24gMjAyMy0wNS0yNSAwMTo0ODoxMSswODAwLCBaaGFuZ2ppbiBXdSB3cm90ZToKPiBXaGVuIGNv
bXBpbGUgbm9saWJjLXRlc3QuYyBmb3IgcnYzMiwgd2UgZ290IHN1Y2ggZXJyb3I6Cj4gCj4gICAg
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jOjU5OTo1NzogZXJy
b3I6IOKAmF9fTlJfZnN0YXTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pCj4gICAgICAgNTk5IHwgICBDQVNFX1RFU1Qoc3lzY2FsbF9hcmdzKTsgICAgICBFWFBFQ1Rf
U1lTRVIoMSwgc3lzY2FsbChfX05SX2ZzdGF0LCAwLCBOVUxMKSwgLTEsIEVGQVVMVCk7IGJyZWFr
Owo+IAo+IFRoZSBnZW5lcmljIGluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy91bmlzdGQuaCB1c2Vk
IGJ5IHJ2MzIgZG9lc24ndAo+IHN1cHBvcnQgX19OUl9mc3RhdCwgdXNlIF9fTlJfc3RhdHggaW5z
dGVhZDoKPiAKPiAgICAgUnVubmluZyB0ZXN0ICdzeXNjYWxsJwo+ICAgICA2OSBzeXNjYWxsX25v
YXJncyA9IDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtPS10K
PiAgICAgNzAgc3lzY2FsbF9hcmdzID0gLTEgRUZBVUxUICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBbT0tdCj4gCj4gQXMgdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggc2hv
d3MsIF9fTlJfc3RhdHggaXMgZWl0aGVyIG5vdCBzdXBwb3J0ZWQKPiBieSBhbGwgcGxhdGZvcm1z
LCBzbywgYm90aCBfX05SX2ZzdGF0IGFuZCBfX05SX3N0YXR4IGFyZSByZXF1aXJlZC4KPiAKPiBC
dHcsIHRoZSBsYXRlc3QgcmlzY3YgbGliYzYtZGV2IHBhY2thZ2UgaXMgcmVxdWlyZWQsIG90aGVy
d2lzZSwgd2Ugd291bGQKPiBhbHNvIGdldCBzdWNoIGVycm9yOgo+IAo+ICAgICBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gL3Vzci9yaXNjdjY0LWxpbnV4LWdudS9pbmNsdWRlL3N5cy9jZGVmcy5oOjQ1
MiwKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5j
bHVkZS9mZWF0dXJlcy5oOjQ2MSwKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3Ivcmlz
Y3Y2NC1saW51eC1nbnUvaW5jbHVkZS9iaXRzL2xpYmMtaGVhZGVyLXN0YXJ0Lmg6MzMsCj4gICAg
ICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL3Jpc2N2NjQtbGludXgtZ251L2luY2x1ZGUvbGlt
aXRzLmg6MjYsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL2xpYi9nY2MtY3Jvc3Mv
cmlzY3Y2NC1saW51eC1nbnUvOS9pbmNsdWRlL2xpbWl0cy5oOjE5NCwKPiAgICAgICAgICAgICAg
ICAgICAgICBmcm9tIC91c3IvbGliL2djYy1jcm9zcy9yaXNjdjY0LWxpbnV4LWdudS85L2luY2x1
ZGUvc3lzbGltaXRzLmg6NywKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3IvbGliL2dj
Yy1jcm9zcy9yaXNjdjY0LWxpbnV4LWdudS85L2luY2x1ZGUvbGltaXRzLmg6MzQsCj4gICAgICAg
ICAgICAgICAgICAgICAgZnJvbSAvbGFicy9saW51eC1sYWIvc3JjL2xpbnV4LXN0YWJsZS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYzo2Ogo+ICAgICAvdXNyL3Jp
c2N2NjQtbGludXgtZ251L2luY2x1ZGUvYml0cy93b3Jkc2l6ZS5oOjI4OjM6IGVycm9yOiAjZXJy
b3IgInJ2MzJpLWJhc2VkIHRhcmdldHMgYXJlIG5vdCBzdXBwb3J0ZWQiCj4gICAgICAgIDI4IHwg
IyBlcnJvciAicnYzMmktYmFzZWQgdGFyZ2V0cyBhcmUgbm90IHN1cHBvcnRlZCIKPiAKPiBUaGUg
Z2xpYmMgY29tbWl0IDViNjExM2Q2MmVmYSAoIlJJU0MtVjogU3VwcG9ydCB0aGUgMzItYml0IEFC
SQo+IGltcGxlbWVudGF0aW9uIikgZml4ZWQgdXAgYWJvdmUgZXJyb3IsIHNvLCBnbGliYyA+PSAy
LjMzICh3aG8gaW5jbHVkZXMKPiB0aGlzIGNvbW1pdCkgaXMgcmVxdWlyZWQuCgpJdCBzZWVtcyB3
ZWlyZCB0byByZXF1aXJlIGxpbWl0cy5oIGZyb20gdGhlIHN5c3RlbSBsaWJjIGF0IGFsbC4KClRo
ZSBvbmx5IHRoaW5nIHVzZWQgZnJvbSB0aGVyZSBhcmUgSU5UX01BWCBhbmQgSU5UX01JTi4KSW5z
dGVhZCB3ZSBjb3VsZCBkZWZpbmUgb3VyIG93biB2ZXJzaW9ucyBvZiBJTlRfTUFYIGFuZCBJTlRf
TUlOIGluCnN0ZGludC5oLgoKI2lmbmRlZiBJTlRfTUFYCiNkZWZpbmUgSU5UX01BWCBfX0lOVF9N
QVhfXwojZW5kaWYKCiNpZm5kZWYgSU5UX01JTgojZGVmaW5lIElOVF9NSU4gKC0gX19JTlRfTUFY
X18gLSAxKQojZW5kaWYKClRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
