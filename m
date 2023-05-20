Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2279C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPjUu+dNZCySv0WiwfjebUjsbmPtdUr6gqLeib1TbMw=; b=u3ScTh/18LYDip
	tHLxApvt+u2rSI23Zr51Y1P77REH+DsZYrPpplzajhdHC2VD6ovMKkKVe8Y8+/ru0hyzlMA6eWSEX
	P8lLh/R20TOwnALv6UYbCm5tUi95Oe9B4/pRV80R7u66Kq0FzRzCPUwhtg0hjMkOap6FenX4GgRp7
	KNeI5qjS7f5gf22isMmFzC8KjjXp/t45pLtneMYE1U00htDWe7Bi0PdMs3ymLQHPxI1K/uVqN5O87
	DCJnaa7QxIrSmK7e/6liRhTP+3gnAR3qTtOzgdhZ4+UheCR6DdYt+13ZmpalbaaesW+l1wkCGEK9b
	0Qc4m5s1Grs2YLh65jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0N8s-001dO3-3B;
	Sat, 20 May 2023 14:01:06 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0N8q-001dLw-0D
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 14:01:05 +0000
Date: Sat, 20 May 2023 16:00:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684591255; bh=bXMjVqB9nRoE86p70C9dZpjseXjyz/ZkIjJNB6mOM3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVHP5QlU260QyhP5WjPUg167LeHeLM82v7lHbbCybhve/DfIjWmq274mDzJS7U5Wd
	 mumW1PUfTVx7Ab7Y+sC5dmpusqhKoQgDajIy/eKip6KBqcWLduQN7MvBb+9gaulNU3
	 qy9lAKk7rx/NQAKxY8v1hjqOsOPG/F9ptBJ0DBrw=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, shuah@kernel.org, w@1wt.eu
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Message-ID: <958f09b4-8cd7-46b3-aa54-4d981fd8f1bc@t-8ch.de>
References: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
 <20230520120254.66315-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520120254.66315-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_070104_282271_8D1A2FFF 
X-CRM114-Status: GOOD (  21.45  )
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

SGkgV2lsbHksIFpoYW5namluLAoKT24gMjAyMy0wNS0yMCAyMDowMjo1MyswODAwLCBaaGFuZ2pp
biBXdSB3cm90ZToKPiBXaGVuIGNvbXBpbGUgbm9saWJjLXRlc3QuYyBmb3IgcnYzMiwgd2UgZ290
IHN1Y2ggZXJyb3I6Cj4gCj4gICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xp
YmMtdGVzdC5jOjU5OTo1NzogZXJyb3I6IOKAmF9fTlJfZnN0YXTigJkgdW5kZWNsYXJlZCAoZmly
c3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gICAgICAgNTk5IHwgICBDQVNFX1RFU1Qoc3lzY2Fs
bF9hcmdzKTsgICAgICBFWFBFQ1RfU1lTRVIoMSwgc3lzY2FsbChfX05SX2ZzdGF0LCAwLCBOVUxM
KSwgLTEsIEVGQVVMVCk7IGJyZWFrOwo+IAo+IFRoZSBnZW5lcmljIGluY2x1ZGUvdWFwaS9hc20t
Z2VuZXJpYy91bmlzdGQuaCB1c2VkIGJ5IHJ2MzIgZG9lc24ndAo+IHN1cHBvcnQgX19OUl9mc3Rh
dCwgdXNpbmcgdGhlIGNvbW1vbiBfX05SX3JlYWQgZnVuY3Rpb25zIGFzIGV4cGVjdGVkLgo+IAo+
ICAgICBSdW5uaW5nIHRlc3QgJ3N5c2NhbGwnCj4gICAgIDY5IHN5c2NhbGxfbm9hcmdzID0gMSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW09LXQo+ICAgICA3MCBz
eXNjYWxsX2FyZ3MgPSAtMSBFQkFERiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFtPS10KPiAKPiBCdHcsIHRoZSBsYXRlc3QgcmlzY3YgbGliYzYtZGV2IHBhY2thZ2UgaXMg
cmVxdWlyZWQsIG90aGVyd2lzZSwgd2Ugd291bGQKPiBhbHNvIGdldCBzdWNoIGVycm9yOgo+IAo+
ICAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9yaXNjdjY0LWxpbnV4LWdudS9pbmNsdWRl
L3N5cy9jZGVmcy5oOjQ1MiwKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3IvcmlzY3Y2
NC1saW51eC1nbnUvaW5jbHVkZS9mZWF0dXJlcy5oOjQ2MSwKPiAgICAgICAgICAgICAgICAgICAg
ICBmcm9tIC91c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5jbHVkZS9iaXRzL2xpYmMtaGVhZGVyLXN0
YXJ0Lmg6MzMsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL3Jpc2N2NjQtbGludXgt
Z251L2luY2x1ZGUvbGltaXRzLmg6MjYsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNy
L2xpYi9nY2MtY3Jvc3MvcmlzY3Y2NC1saW51eC1nbnUvOS9pbmNsdWRlL2xpbWl0cy5oOjE5NCwK
PiAgICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3IvbGliL2djYy1jcm9zcy9yaXNjdjY0LWxp
bnV4LWdudS85L2luY2x1ZGUvc3lzbGltaXRzLmg6NywKPiAgICAgICAgICAgICAgICAgICAgICBm
cm9tIC91c3IvbGliL2djYy1jcm9zcy9yaXNjdjY0LWxpbnV4LWdudS85L2luY2x1ZGUvbGltaXRz
Lmg6MzQsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvbGFicy9saW51eC1sYWIvc3JjL2xp
bnV4LXN0YWJsZS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYzo2
Ogo+ICAgICAvdXNyL3Jpc2N2NjQtbGludXgtZ251L2luY2x1ZGUvYml0cy93b3Jkc2l6ZS5oOjI4
OjM6IGVycm9yOiAjZXJyb3IgInJ2MzJpLWJhc2VkIHRhcmdldHMgYXJlIG5vdCBzdXBwb3J0ZWQi
Cj4gICAgICAgIDI4IHwgIyBlcnJvciAicnYzMmktYmFzZWQgdGFyZ2V0cyBhcmUgbm90IHN1cHBv
cnRlZCIKPiAKPiBUaGUgZ2xpYmMgY29tbWl0IDViNjExM2Q2MmVmYSAoIlJJU0MtVjogU3VwcG9y
dCB0aGUgMzItYml0IEFCSQo+IGltcGxlbWVudGF0aW9uIikgZml4ZWQgdXAgYWJvdmUgZXJyb3Is
IHNvLCBnbGliYyA+PSAyLjMzICh3aG8gaW5jbHVkZXMKPiB0aGlzIGNvbW1pdCkgaXMgcmVxdWly
ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4K
PiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3Qu
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCj4gaW5kZXgg
MDYzZjk5NTlhYzQ0Li5kOGI1OWM4ZjZjMDMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwo+IEBAIC01OTYsNyArNTk2LDcgQEAgaW50IHJ1bl9z
eXNjYWxsKGludCBtaW4sIGludCBtYXgpCj4gIAkJQ0FTRV9URVNUKHdyaXRlX2JhZGYpOyAgICAg
ICAgRVhQRUNUX1NZU0VSKDEsIHdyaXRlKC0xLCAmdG1wLCAxKSwgLTEsIEVCQURGKTsgYnJlYWs7
Cj4gIAkJQ0FTRV9URVNUKHdyaXRlX3plcm8pOyAgICAgICAgRVhQRUNUX1NZU1pSKDEsIHdyaXRl
KDEsICZ0bXAsIDApKTsgYnJlYWs7Cj4gIAkJQ0FTRV9URVNUKHN5c2NhbGxfbm9hcmdzKTsgICAg
RVhQRUNUX1NZU0VRKDEsIHN5c2NhbGwoX19OUl9nZXRwaWQpLCBnZXRwaWQoKSk7IGJyZWFrOwo+
IC0JCUNBU0VfVEVTVChzeXNjYWxsX2FyZ3MpOyAgICAgIEVYUEVDVF9TWVNFUigxLCBzeXNjYWxs
KF9fTlJfZnN0YXQsIDAsIE5VTEwpLCAtMSwgRUZBVUxUKTsgYnJlYWs7Cj4gKwkJQ0FTRV9URVNU
KHN5c2NhbGxfYXJncyk7ICAgICAgRVhQRUNUX1NZU0VSKDEsIHN5c2NhbGwoX19OUl9yZWFkLCAt
MSwgJnRtcCwgMSksIC0xLCBFQkFERik7IGJyZWFrOwoKVGhlIGdvYWwgb2YgdGhpcyBzZWNvbmQg
dGVzdCB3YXMgdG8gbWFrZSBzdXJlIHRoYXQgYXJndW1lbnRzIGFyZSBwYXNzZWQKaW4gdGhlIGNv
cnJlY3Qgb3JkZXIuIEZvciB0aGlzIEkgdHJpZWQgdG8gaGF2ZSBhIHN5c2NhbGwgd2VyZSB0aGUK
Y2hlY2tlZCBlcnJvciBpcyBnZW5lcmF0ZWQgZnJvbSBhIG5vbi1maXJzdCBhcmd1bWVudC4KKFRo
ZSBOVUxMIGdlbmVyYXRpbmcgdGhlIEVGQVVMVCkuCgpTbyB0aGUgbmV3IGNoZWNrIGRvZXMgbm90
IGZ1bGxmaWwgdGhpcyBnb2FsIGFueW1vcmUuCgpNYXliZSB3ZSBjYW4gZmluZCBhIG5ldyBzeXNj
YWxsIHRvIHRlc3Qgd2l0aD8KClRoZSBjb2RlIHNob3VsZCBoYXZlIGhhZCBhIGNvbW1lbnQgSSBn
dWVzcy4KCj4gIAkJY2FzZSBfX0xJTkVfXzoKPiAgCQkJcmV0dXJuIHJldDsgLyogbXVzdCBiZSBs
YXN0ICovCj4gIAkJLyogbm90ZTogZG8gbm90IHNldCBhbnkgZGVmYXVsdHMgc28gYXMgdG8gcGVy
bWl0IGhvbGVzIGFib3ZlICovCj4gLS0gCj4gMi4yNS4xCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
