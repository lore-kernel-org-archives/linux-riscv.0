Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC26F94CB7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 00:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhhK3mqa/FXDkahes8yGoP3MBjxcLiqX+BP4TNNLI0I=; b=OY8xMznHmr158r
	Weh6G8q8ECnFJUOhgKmKRAWr5DbMNMuUGL7s0mkkqKwRRViRvtD4xJkaxv+AKP+UaRg4ecLBhLcYR
	x7ADh/uQq9dWx2V40mQVZyDLP8dCnPfG7kRTfAH1UgBf4gPT9YyAC52ut8i5m9e7u1UdeyA527LDj
	FvIpolVTY/2EiR2qB7mW4jclYL+UrKD1ncsqKek/5LIDHjxSdLkyn5QecjEmwvwK2VIBLoNh10gdZ
	PVwAoJHju/vqFcVYjM6JtxMr7G1tqS/Fg4uPdWoPS9bobNDzEqf1uFCz/aO1882XNJ6YblA0RMJ/5
	OEtAbt5Y+clBo09wvwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFLuw-00000009SB1-1Wsk;
	Wed, 22 Apr 2026 00:58:14 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFLut-00000009SAg-2UHw
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 00:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=S4U/6B0kXWG1i5F0LEcN7JR2dSSEwKbXX
	HV9ZsqsWio=; b=m7/EuJU+M3sCokRyqMFpfs8gX2fMrP/qy6d+2k+veFeoLrcfV
	e1YsMO+ELUP7gArg/GzCDkZPmgwlBEW/rAcmTL6CJGlQaKq7MEMR3hq5BWjgrDIQ
	+5OXD/SglW8u/o7T88gPc+3JuQhtrgzRqmRzDqDaggE5OPnCf+Q44x5IUE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkNBHehpN54CAA--.1540S2;
	Wed, 22 Apr 2026 08:58:41 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
From: Jia Wang <wangjia@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-serial <linux-serial@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
Date: Wed, 22 Apr 2026 08:57:56 +0800
Message-Id: <177681947637.2697678.10937675549830278979.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776819476; l=2777;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=1aoGw4hRSopLZOnb3TSXhniy1nlSol3La00ikxVVXvA=;
 b=0cTTzyq/y4od7hWsMQVcQTU/3Tri1Z7RnNNQbAlPwNv9mR1XzrHQgebDKhBqufMjzMv0DZLNw
 1wiDq1NAnvpCN1O3lbJBsLIiasxuFi8EWuTsBjqhLD2T+hhovdiLuxF
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnEkNBHehpN54CAA--.1540S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4Utw4UGr43tFW8WrykXwb_yoW5XryDpF
	1xGFZ0yF9Yqa13u3Z2va1qvFZYva1293y7AwsrK347trn0yr98AFn7Kr4Yy3ZxurWYqr12
	yF1j9rW7Za17Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQADEWnlor4ACwAQsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_175812_030166_3ACBA271 
X-CRM114-Status: GOOD (  25.83  )
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

T24gMjAyNi0wNC0yMSAxNToxOCArMDMwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gT24gVHVl
LCAyMSBBcHIgMjAyNiwgSmlhIFdhbmcgd3JvdGU6Cj4gCj4gPiBUaGUgVWx0cmFSSVNDIERQMTAw
MCBVQVJUIGRvZXMgbm90IHByb3ZpZGUgdGhlIHN0YW5kYXJkIENQUiByZWdpc3RlciB1c2VkCj4g
PiBieSA4MjUwX2R3IHRvIGRpc2NvdmVyIHBvcnQgY2FwYWJpbGl0aWVzLgo+ID4gCj4gPiBQcm92
aWRlIGEgZml4ZWQgQ1BSIHZhbHVlIGZvciB0aGUgRFAxMDAwLXNwZWNpZmljIGNvbXBhdGlibGUg
c28gdGhlCj4gPiBkcml2ZXIgY2FuIGNvbmZpZ3VyZSB0aGUgcG9ydCBjb3JyZWN0bHkuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEppYSBXYW5nIDx3YW5namlhQHVsdHJhcmlzYy5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMgfCA3ICsrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2R3LmMKPiA+IGluZGV4IDk0YmVhZGI0MDI0ZC4uY2E2ZGJkZjc1OTE4IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jCj4gPiArKysgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMKPiA+IEBAIC05NjIsNiArOTYyLDEyIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEgZHc4MjUwX2ludGMxMGVlID0g
ewo+ID4gIAkucXVpcmtzID0gRFdfVUFSVF9RVUlSS19JRVJfS0lDSywKPiA+ICB9Owo+ID4gIAo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEgZHc4MjUwX3VsdHJh
cmlzY19kcDEwMDBfZGF0YSA9IHsKPiA+ICsJLnVzcl9yZWcgPSBEV19VQVJUX1VTUiwKPiA+ICsJ
LmNwcl92YWx1ZSA9IDB4MDAwMjIwMjIsCj4gCj4gSGksCj4gCj4gUGxlYXNlIGNvbnN0cnVjdCB0
aGUgY3ByX3ZhbHVlIGJ5IE9SaW5nIERXX1VBUlRfQ1BSXyogZGVmaW5lcyB0b2dldGhlci4KPiBG
b3IgZmllbGRzLCBGSUVMRF9QUkVQX0NPTlNUKCkgbWF5IGJlIHVzZWZ1bC4KPiAKPiBJbiBvcmRl
ciB0byBiZSBhYmxlIHRvIHVzZSB0aGUgRFdfVUFSVF9DUFJfKiBkZWZpbmVzLCB0aGV5IG5lZWQg
dG8gYmUgCj4gbW92ZWQgaW50byA4MjUwX2R3bGliLmggKEknZCBtb3ZlIGFsbCBEV19VQVJUIHJl
Z2lzdGVyIGRlZmluZXMgaW4gYSAKPiBwcmVwYXJhdG9yeSBwYXRjaCkuCj4gCj4gSSBrbm93IHRo
ZSBleGlzdGluZyBSZW5lc2FzJyAuY3ByX3ZhbHVlIGRvZXNuJ3QgZm9sbG93IHRoaXMgY29udmVu
dGlvbiBidXQgCj4gdGhhdCBjb3VsZCBiZSBjb252ZXJ0ZWQgYXMgd2VsbCAoaW4gYW5vdGhlciBw
YXRjaCwgb3IgbGVhdmUgdGhlIFJlbmVzYXMgCj4gZW50cnkgY29udmVyc2lvbiB0byBtZSBpZiB5
b3UgZG9uJ3Qgd2FudCB0byBkbyB0aGF0KS4KPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKSnVz
dCB0byBjb25maXJtOiBzaW5jZSB5b3UgbWVudGlvbmVkIHRoYXQgdGhlIHByZXBhcmF0b3J5IHBh
dGNoIG1vdmluZwp0aGUgRFdfVUFSVCByZWdpc3RlciBkZWZpbmVzIGlzIGFscmVhZHkgaW4gcGxh
Y2UsIEkgZG9uJ3QgbmVlZCB0byBtb3ZlCnRoZW0gYWdhaW4sIGNvcnJlY3Q/CgpJIHdpbGwgdXBk
YXRlIG15IHBhdGNoIHRvIHVzZSB0aGUgRFdfVUFSVF9DUFJfKiBtYWNyb3MgYW5kCkZJRUxEX1BS
RVBfQ09OU1QoKSBhY2NvcmRpbmdseSwgYW5kIEnigJltIGhhcHB5IHRvIGFkZCBhIHNlcGFyYXRl
IHBhdGNoIGluCnRoZSBuZXh0IHJldmlzaW9uIHRvIGNvbnZlcnQgdGhlIFJlbmVzYXMgLmNwcl92
YWx1ZSBhcyB3ZWxsLgogCj4gPiArCS5xdWlya3MgPSBEV19VQVJUX1FVSVJLX0NQUl9WQUxVRSwK
PiA+ICt9Owo+ID4gKwo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3ODI1
MF9vZl9tYXRjaFtdID0gewo+ID4gIAl7IC5jb21wYXRpYmxlID0gInNucHMsZHctYXBiLXVhcnQi
LCAuZGF0YSA9ICZkdzgyNTBfZHdfYXBiIH0sCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAiY2F2aXVt
LG9jdGVvbi0zODYwLXVhcnQiLCAuZGF0YSA9ICZkdzgyNTBfb2N0ZW9uXzM4NjBfZGF0YSB9LAo+
ID4gQEAgLTk2OSw2ICs5NzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBk
dzgyNTBfb2ZfbWF0Y2hbXSA9IHsKPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6bjEt
dWFydCIsIC5kYXRhID0gJmR3ODI1MF9yZW5lc2FzX3J6bjFfZGF0YSB9LAo+ID4gIAl7IC5jb21w
YXRpYmxlID0gInNvcGhnbyxzZzIwNDQtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9za2lwX3NldF9y
YXRlX2RhdGEgfSwKPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMDAtdWFydCIs
IC5kYXRhID0gJmR3ODI1MF9za2lwX3NldF9yYXRlX2RhdGEgfSwKPiA+ICsJeyAuY29tcGF0aWJs
ZSA9ICJ1bHRyYXJpc2MsZHAxMDAwLXVhcnQiLCAuZGF0YSA9ICZkdzgyNTBfdWx0cmFyaXNjX2Rw
MTAwMF9kYXRhIH0sCj4gPiAgCXsgLyogU2VudGluZWwgKi8gfQo+ID4gIH07Cj4gPiAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgZHc4MjUwX29mX21hdGNoKTsKPiA+IAo+ID4gCj4gCj4gLS0gCj4g
IGkuCj4gCj4gCgpSZWdhcmRzLApKaWEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
