Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3DBE7717F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17Z6jV0G2w5aAnbt6uQ7UumNRX4jI7Wffo0HNZf/I8c=; b=UmIkO0l5W0uTSU
	BGyTU47Po1PaINrbUdesNq4T5GD2OMlsZKgxGK5iKzbuQVrw9m6N5hdgvnm4GBJltdxFjpcqd3c6u
	YJNmYQpMrYUz0TOXZ7hlXFSaZJCCwNV0jXpyxHW4b557IFT+5Z5oEpG1EVlmqDdrdQxHtWG5OUuGT
	VFYvKi/5GsI2Lx8xVDqgRXUUTEvW3vxfv8x3RKNd0AViJrGSyu/n31YKB0D8rM9xJhA3zLRRUtMG5
	Qlt+XqB5BVDdYN4k9TxPUn5qRGq0+Mz2n81QPSerLD/wGZumQBfhYd6CUeU0S30l+Vy+pwbA8kfC+
	l6ZHPB6jAJPH4fz4An+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKMy-00000005ZtV-2Oir;
	Sun, 08 Dec 2024 16:42:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKMv-00000005ZsA-2Dfn
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 16:42:55 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9084A24B90;
	Sun,  8 Dec 2024 17:42:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_A0Z38Wpm-G; Sun,  8 Dec 2024 17:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1733676164; bh=P4ozc77c4tIjKBTJbMRD5xDYcS7YYE6EbYtEGAMUjWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DZG9SHMuEgfaPucBTkdFKWVBDU1iF8scdFoz0jWMfYDDY6WMXLAE6B5FaaBRjEvyu
	 12k90oVrUlWE+SqOcKIleEeZJuC0aQy4zYyjDDuE8f1hDGjGFdmQ0UQIKRBLSjDO4o
	 rmhkNn2njWJQjSIdRdXGpbw+s89NOBJSRvh70crHE7R97Eq3AZvx1yAS/uDEJRG4Zl
	 EMTtZHV6CdAg6mVd5porTrFpHTsi8K2L/4o3i30hYYqjlI09aEE4JkBykJLEoud0VP
	 OnwRvs+xG6nlhZ9rb8OEHLsOoycVnKCJf3NUiZcwzIOYt5WS/7tdt5nun9nuly0MMt
	 g9u6i20LcvDeQ==
Date: Sun, 8 Dec 2024 16:42:30 +0000
From: Yao Zi <ziyao@disroot.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH] RISC-V: Remove unnecessary include from compat.h
Message-ID: <Z1XJryCquhxVIIrj@pie>
References: <20241126143250.29708-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126143250.29708-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_084253_986868_486D2EC9 
X-CRM114-Status: GOOD (  15.18  )
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

T24gVHVlLCBOb3YgMjYsIDIwMjQgYXQgMDY6MzI6NTBBTSAtMDgwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gV2l0aG91dCB0aGlzIEkgZ2V0IGEgYnVuY2ggb2YgYnVpbGQgZXJyb3JzIGxpa2UK
PiAKPiAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9zY2hlZC90YXNr
X3N0YWNrLmg6MTIsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY29tcGF0Lmg6MTIsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oOjExNSwKPiAgICAgICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS9saW51eC9wZ3RhYmxlLmg6NiwKPiAgICAgICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS9saW51eC9tbS5oOjMwLAo+ICAgICAgICAgICAgICAgICAgICAgIGZyb20g
YXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYzo4Ogo+ICAgICAuL2luY2x1ZGUvbGludXgv
a2FzYW4uaDo1MDozNzogZXJyb3I6IOKAmE1BWF9QVFJTX1BFUl9QVEXigJkgdW5kZWNsYXJlZCBo
ZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhQVFJTX1BFUl9QVEXigJk/
Cj4gICAgICAgIDUwIHwgZXh0ZXJuIHB0ZV90IGthc2FuX2Vhcmx5X3NoYWRvd19wdGVbTUFYX1BU
UlNfUEVSX1BURSArIFBURV9IV1RBQkxFX1BUUlNdOwo+ICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQVFJTX1BFUl9QVEUKPiAgICAgLi9p
bmNsdWRlL2xpbnV4L2thc2FuLmg6NTE6ODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHBt
ZF904oCZOyBkaWQgeW91IG1lYW4g4oCYcGdkX3TigJk/Cj4gICAgICAgIDUxIHwgZXh0ZXJuIHBt
ZF90IGthc2FuX2Vhcmx5X3NoYWRvd19wbWRbTUFYX1BUUlNfUEVSX1BNRF07Cj4gICAgICAgICAg
IHwgICAgICAgIF5+fn5+Cj4gICAgICAgICAgIHwgICAgICAgIHBnZF90Cj4gICAgIC4vaW5jbHVk
ZS9saW51eC9rYXNhbi5oOjUxOjM3OiBlcnJvcjog4oCYTUFYX1BUUlNfUEVSX1BNROKAmSB1bmRl
Y2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmFBUUlNfUEVS
X1BHROKAmT8KPiAgICAgICAgNTEgfCBleHRlcm4gcG1kX3Qga2FzYW5fZWFybHlfc2hhZG93X3Bt
ZFtNQVhfUFRSU19QRVJfUE1EXTsKPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUFRSU19QRVJfUEdECj4gICAgIC4vaW5jbHVkZS9saW51
eC9rYXNhbi5oOjUyOjg6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhwdWRfdOKAmTsgZGlk
IHlvdSBtZWFuIOKAmHBnZF904oCZPwo+ICAgICAgICA1MiB8IGV4dGVybiBwdWRfdCBrYXNhbl9l
YXJseV9zaGFkb3dfcHVkW01BWF9QVFJTX1BFUl9QVURdOwo+ICAgICAgICAgICB8ICAgICAgICBe
fn5+fgo+ICAgICAgICAgICB8ICAgICAgICBwZ2RfdAo+ICAgICAuL2luY2x1ZGUvbGludXgva2Fz
YW4uaDo1MjozNzogZXJyb3I6IOKAmE1BWF9QVFJTX1BFUl9QVUTigJkgdW5kZWNsYXJlZCBoZXJl
IChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhQVFJTX1BFUl9QR0TigJk/Cj4g
ICAgICAgIDUyIHwgZXh0ZXJuIHB1ZF90IGthc2FuX2Vhcmx5X3NoYWRvd19wdWRbTUFYX1BUUlNf
UEVSX1BVRF07Cj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFBUUlNfUEVSX1BHRAo+ICAgICAuL2luY2x1ZGUvbGludXgva2FzYW4uaDo1
Mzo4OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYcDRkX3TigJk7IGRpZCB5b3UgbWVhbiDi
gJhwZ2RfdOKAmT8KPiAgICAgICAgNTMgfCBleHRlcm4gcDRkX3Qga2FzYW5fZWFybHlfc2hhZG93
X3A0ZFtNQVhfUFRSU19QRVJfUDREXTsKPiAgICAgICAgICAgfCAgICAgICAgXn5+fn4KPiAgICAg
ICAgICAgfCAgICAgICAgcGdkX3QKPiAgICAgLi9pbmNsdWRlL2xpbnV4L2thc2FuLmg6NTM6Mzc6
IGVycm9yOiDigJhNQVhfUFRSU19QRVJfUDRE4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEg
ZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYUFRSU19QRVJfUEdE4oCZPwo+ICAgICAgICA1MyB8
IGV4dGVybiBwNGRfdCBrYXNhbl9lYXJseV9zaGFkb3dfcDRkW01BWF9QVFJTX1BFUl9QNERdOwo+
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn4KPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQVFJTX1BFUl9QR0QKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCB8
IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
b21wYXQuaAo+IGluZGV4IGFhMTAzNTMwYTVjOC4uNjA4MTMyN2U1NWY1IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NvbXBhdC5oCj4gQEAgLTksNyArOSw2IEBACj4gICAqLwo+ICAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gLSNpbmNsdWRlIDxsaW51
eC9zY2hlZC90YXNrX3N0YWNrLmg+Cj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9jb21wYXQuaD4K
PiAgCj4gIHN0YXRpYyBpbmxpbmUgaW50IGlzX2NvbXBhdF90YXNrKHZvaWQpCj4gLS0gCj4gMi40
NS4yCgpIaSBQYWxtZXIsIGRvIHlvdSB0aGluayB3ZSBzaG91bGQgYmFja3BvcnQgdGhpcyB0byA2
LjEyPwoKQ29tbWl0IGZkN2I0ZjlmNDZkNAooInNjaGVkL3Rhc2tfc3RhY2s6IGZpeCBvYmplY3Rf
aXNfb25fc3RhY2soKSBmb3IgS0FTQU4gdGFnZ2VkIHBvaW50ZXJzIiksCmludHJvZHVjZXMgZXh0
cmEgaGVhZGVyIGRlcGVuZGVuY3kgaW4gbGludXgvc2NoZWQvdGFza19zdGFjay5oLiBXaXRob3V0
CnRoaXMgcGF0Y2gsIGJ1aWxkIG1heSBmYWlsIGJlY2F1c2Ugb2YgdGhlIGluY2x1ZGUgc2VxdWVu
Y2UgaWYgS0FTQU4gaXMKZW5hYmxlZC4KClNpbmNlIGNvbW1pdCBmZDdiNGY5ZjQ2ZDQgaGFzIGxh
bmRlZCBpbiA2LjEyIGJlZm9yZSB0aGlzIHBhdGNoIHdhcwptZXJnZWQsIEtBU0FOIGlzIGNvbXBs
ZXRlbHkgYnJva2VuIG9uIFJJU0MtViBpbiBjdXJyZW50IExUUyByZWxlYXNlLgoKVGhhbmtzLApZ
YW8gWmkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
