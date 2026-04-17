Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F47EA71AA
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MS897JD70l8RrRJWsvMGyrdYxeXpkU73iEWZODxD4qU=; b=tQC59vtObAAIIG
	BJ10O5nsw38yYhKedFQTVjAPYWnr/FC1/PO9WdbEVZYsM9XWAhn+aNnI6uVKIfK1JHtsAFvkYux+8
	kRJwJ3OlW3tl7DXgH1MTimlOho3jNBm2gPhSjko0OdmeFOhpMomo696luC0fZ5G8+gBYabfroc9vi
	WgFkMdAT5RQMT3mKrKC36gg2OPlZlAswbwvCL5kcocUij7UKXK3GXlIrA2nUgXFuAnbZt9Ky++CHH
	0cvRVgZyK49ZI0cR34pwpp1avaZEvdgQEoIi4/+sUkypll6OkuRIstlZiwnQi+Vq0MmvDCyTsFE6g
	Ah2Z4xR7mXFdDpGxgXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEb95-0000000699f-1C0Q;
	Sun, 19 Apr 2026 23:01:43 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtYY-00000004cgq-2XnB
	for linux-riscv@lists.infradead.org;
	Sat, 18 Apr 2026 00:29:08 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fyCKk72ghz8Xs6Q;
	Sat, 18 Apr 2026 08:28:58 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 63I0Svo8029922;
	Sat, 18 Apr 2026 08:28:57 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Message-Id: <202604180028.63I0Svo8029922@mse-fl1.zte.com.cn>
Received: from njb2app05.zte.com.cn ([10.55.22.121])
	by mse-fl1.zte.com.cn with SMTP id 63HAqPVX032987;
	Fri, 17 Apr 2026 18:52:25 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Received: from mapi (njy2app02[null])
	by mapi (Zmail) with MAPI id mid202;
	Fri, 17 Apr 2026 18:52:27 +0800 (CST)
X-Zmail-TransId: 2afa69e210ebfc0-fc690
X-Mailer: Zmail v1.0
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-6-b3b2e7e9847a@kernel.org>
References: 20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org,20260414-ssqosid-cbqri-rqsc-v7-0-v3-6-b3b2e7e9847a@kernel.org
Date: Fri, 17 Apr 2026 18:52:27 +0800 (CST)
Mime-Version: 1.0
From: <guo.wenjia23@zte.com.cn>
To: <fustini@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBSRkMgdjMgMDYvMTFdIFJJU0MtVjogUW9TOiBhZGQgcmVzY3RybCBzZXR1cCBhbmQgZG9tYWluIG1hbmFnZW1lbnQ=?=
X-MAIL: mse-fl1.zte.com.cn 63I0Svo8029922
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: guo.wenjia23@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Sat, 18 Apr 2026 08:28:59 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69E2D04A.002/4fyCKk72ghz8Xs6Q
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172906_965330_B10BE098 
X-CRM114-Status: GOOD (  20.12  )
X-Mailman-Approved-At: Sun, 19 Apr 2026 16:01:32 -0700
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
Cc: fustini@kernel.org, x86@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, conor+dt@kernel.org, npitre@baylibre.com, linux-kernel@vger.kernel.org, gong.shuai@sanechips.com.cn, zhiwei_liu@linux.alibaba.com, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, robh@kernel.org, alex@ghiti.fr, rafael@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, james.morse@arm.com, rkrcmar@ventanamicro.com, Dave.Martin@arm.com, lenb@kernel.org, gsh517@gmail.com, fenghua.yu@intel.com, cp0613@linux.alibaba.com, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, cuiyunhui@bytedance.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, vasu@rivosinc.com, tony.luck@intel.com, peternewman@google.com, conor.dooley@microchip.com, samuel.holland@sifive.com, palmer@dabbelt.com, pjw@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFdlZCwgQXByIDE1LCAyMDI2IGF0IDk6NTfigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEFkZCB0aGUgc2V0dXAgYW5kIGRvbWFpbiBt
YW5hZ2VtZW50IGxheWVyOiBkb21haW4gYWxsb2NhdGlvbgo+IChxb3NfbmV3X2RvbWFpbiksIGNv
bnRyb2xsZXIgdmFsdWUgaW5pdGlhbGl6YXRpb24KPiAocW9zX2luaXRfZG9tYWluX2N0cmx2YWwp
LCByZXNvdXJjZSBzdHJ1Y3QgaW5pdGlhbGl6YXRpb24gZm9yIGNhY2hlIGFuZAo+IGJhbmR3aWR0
aCByZXNvdXJjZXMsIGRvbWFpbiByZWdpc3RyYXRpb24gd2l0aCB0aGUgcmVzY3RybCBmaWxlc3lz
dGVtCj4gKHFvc19yZXNjdHJsX2FkZF9jb250cm9sbGVyX2RvbWFpbiksIGFuZCB0aGUgdG9wLWxl
dmVsIHNldHVwIGZ1bmN0aW9uCj4gKHFvc19yZXNjdHJsX3NldHVwKSB0aGF0IHByb2JlcyBhbGwg
Y29udHJvbGxlcnMgYW5kIGNhbGxzIHJlc2N0cmxfaW5pdCgpLgo+Cj4gQWxzbyBhZGQgcW9zX3Jl
c2N0cmxfb25saW5lX2NwdSgpIGFuZCBxb3NfcmVzY3RybF9vZmZsaW5lX2NwdSgpIGZvciBDUFUK
PiBob3RwbHVnIGludGVncmF0aW9uLgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBBZHJpZW4gUmljY2lh
cmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmlj
Y2lhcmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1
c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcW9z
L3Fvc19yZXNjdHJsLmMgfCAyOTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyOTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcW9zL3Fvc19yZXNjdHJsLmMKPiBpbmRleCBhNGExMjBmODk4NDAuLjhkN2Uz
YjBhYmI3NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jCj4gQEAgLTY3NSw3
ICs2NzUsMjMgQEAgdm9pZCByZXNjdHJsX2FyY2hfcmVzZXRfcm1pZF9hbGwoc3RydWN0IHJkdF9y
ZXNvdXJjZSAqciwgc3RydWN0IHJkdF9sM19tb25fZG9tYWkKPiAgCj4gIHZvaWQgcmVzY3RybF9h
cmNoX3Jlc2V0X2FsbF9jdHJscyhzdHJ1Y3QgcmR0X3Jlc291cmNlICpyKQo+ICB7Cj4gLSAgICAv
KiBub3QgaW1wbGVtZW50ZWQgZm9yIHRoZSBSSVNDLVYgcmVzY3RybCBpbXBsZW1lbnRhdGlvbiAq
Lwo+ICsgICAgc3RydWN0IGNicXJpX3Jlc2N0cmxfcmVzICpod19yZXM7Cj4gKyAgICBzdHJ1Y3Qg
cmR0X2N0cmxfZG9tYWluICpkOwo+ICsgICAgZW51bSByZXNjdHJsX2NvbmZfdHlwZSB0Owo+ICsg
ICAgdTMyIGRlZmF1bHRfY3RybDsKPiArICAgIGludCBpOwo+ICsKPiArICAgIGxvY2tkZXBfYXNz
ZXJ0X2NwdXNfaGVsZCgpOwo+ICsKPiArICAgIGh3X3JlcyA9IGNvbnRhaW5lcl9vZihyLCBzdHJ1
Y3QgY2JxcmlfcmVzY3RybF9yZXMsIHJlc2N0cmxfcmVzKTsKPiArICAgIGRlZmF1bHRfY3RybCA9
IHJlc2N0cmxfZ2V0X2RlZmF1bHRfY3RybChyKTsKPiArCj4gKyAgICBsaXN0X2Zvcl9lYWNoX2Vu
dHJ5KGQsICZyLT5jdHJsX2RvbWFpbnMsIGhkci5saXN0KSB7Cj4gKyAgICAgICAgZm9yIChpID0g
MDsgaSA8IGh3X3Jlcy0+bWF4X3JjaWQ7IGkrKykgewo+ICsgICAgICAgICAgICBmb3IgKHQgPSAw
OyB0IDwgQ0RQX05VTV9UWVBFUzsgdCsrKQo+ICsgICAgICAgICAgICAgICAgcmVzY3RybF9hcmNo
X3VwZGF0ZV9vbmUociwgZCwgaSwgdCwgZGVmYXVsdF9jdHJsKTsKCkZvciB0aGUgYncgY29udHJv
bGxlciwgZGVmYXVsdF9jdHJsID0gbWF4X2J3LCBhbmQgcmVzY3RybF9hcmNoX3VwZGF0ZV9vbmUg
d2lsbCBzZXQgdGhlIHJid2Igb2YgYWxsIFJDSURzIHRvIG1heF9idy4gCkFjY29yZGluZyB0byB0
aGUgc3BlYzogVGhlIHN1bSBvZiBSYndiIGFsbG9jYXRlZCBhY3Jvc3MgYWxsIHJjaWRzIG11c3Qg
bm90IGV4Y2VlZCBNUkJXQiB2YWx1ZS4gCgpEb2VzIHRoaXMgY29uZmxpY3Qgd2l0aCB0aGUgc3Bl
Yz8KCj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICB9Cj4gIAo+ICB2b2lkIHJlc2N0cmxfYXJjaF9w
cmVfbW91bnQodm9pZCkKPiBAQCAtNzk3LDMgKzgxMywyODAgQEAgdTMyIHJlc2N0cmxfYXJjaF9n
ZXRfY29uZmlnKHN0cnVjdCByZHRfcmVzb3VyY2UgKnIsIHN0cnVjdCByZHRfY3RybF9kb21haW4g
KmQsCj4gICAgICBzcGluX3VubG9jaygmY3RybC0+bG9jayk7Cj4gICAgICByZXR1cm4gdmFsOwo+
ICB9Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHJkdF9jdHJsX2RvbWFpbiAqcW9zX25ld19kb21haW4o
c3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmN0cmwpCj4gK3sKPiArICAgIHN0cnVjdCBjYnFyaV9y
ZXNjdHJsX2RvbSAqaHdfZG9tOwo+ICsgICAgc3RydWN0IHJkdF9jdHJsX2RvbWFpbiAqZG9tYWlu
Owo+ICsKPiArICAgIGh3X2RvbSA9IGt6YWxsb2Nfb2JqKCpod19kb20sIEdGUF9LRVJORUwpOwo+
ICsgICAgaWYgKCFod19kb20pCj4gKyAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgLyog
YXNzb2NpYXRlIHRoaXMgY2JxcmlfY29udHJvbGxlciB3aXRoIHRoZSBkb21haW4gKi8KPiArICAg
IGh3X2RvbS0+aHdfY3RybCA9IGN0cmw7Cj4gKwo+ICsgICAgLyogdGhlIHJkdF9kb21haW4gc3Ry
dWN0IGZyb20gaW5zaWRlIHRoZSBjYnFyaV9yZXNjdHJsX2RvbSBzdHJ1Y3QgKi8KPiArICAgIGRv
bWFpbiA9ICZod19kb20tPnJlc2N0cmxfY3RybF9kb207Cj4gKwo+ICsgICAgSU5JVF9MSVNUX0hF
QUQoJmRvbWFpbi0+aGRyLmxpc3QpOwo+ICsKPiArICAgIHJldHVybiBkb21haW47Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbnQgcW9zX2luaXRfZG9tYWluX2N0cmx2YWwoc3RydWN0IHJkdF9yZXNvdXJj
ZSAqciwgc3RydWN0IHJkdF9jdHJsX2RvbWFpbiAqZCkKPiArewo+ICsgICAgc3RydWN0IGNicXJp
X3Jlc2N0cmxfcmVzICpod19yZXM7Cj4gKyAgICBpbnQgZXJyID0gMDsKPiArICAgIGludCBpOwo+
ICsKPiArICAgIGh3X3JlcyA9IGNvbnRhaW5lcl9vZihyLCBzdHJ1Y3QgY2JxcmlfcmVzY3RybF9y
ZXMsIHJlc2N0cmxfcmVzKTsKPiArCj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgaHdfcmVzLT5tYXhf
cmNpZDsgaSsrKSB7Cj4gKyAgICAgICAgZXJyID0gcmVzY3RybF9hcmNoX3VwZGF0ZV9vbmUociwg
ZCwgaSwgMCwgcmVzY3RybF9nZXRfZGVmYXVsdF9jdHJsKHIpKTsKCkFsc28gc2V0IHJid2Igb2Yg
YWxsIFJDSURzIHRvIG1heF9idy4gRG9lcyB0aGlzIGFsc28gY29uZmxpY3Qgd2l0aCB0aGUgc3Bl
Yz8KCj4gKyAgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgcmV0dXJuIGVycjsKPiArICAg
IH0KPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwoKClRoYW5rcywKV2VuamlhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
