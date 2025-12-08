Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229E1D3B7E8
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ldr+faLfOQpJUbn7xAFomo/J0/vEDbl/cPqkelJVmno=; b=zkgH87kobLh2KR
	rJ58ynprm/DFyOvD1aGHkQQI9pe/6gXzfLAeWsv1jaILg/eGF4xeux/HQvNNPe1JZXOQNqpRhTDCz
	6HSjM4ynIJnvvISGpT7nPsIC32i7IHI9t3tzLEU722oAH+snK04tIYUUtUyhB7XDLX/qfPOHNILT0
	TUXvvLahTAAJKu0eCvSrv9I1BO52zi8ggOaxMAZ2RyeTD7YkndEbSUPxJYxejdLMm7wurKUq0Ws+j
	srJzAqQ7W6kJfKp1JapZH3ao5pr+LDl7gMIYO6EhOOnfP6VxDNZ7Gx00TEulr2F/NntrSl3mz4qVR
	SoWjQ0bCNZI0ZHb03t4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSaEo-0000000D3ts-0Li7;
	Mon, 08 Dec 2025 12:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSaEl-0000000D3tS-11LD
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 12:21:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E7F941927;
	Mon,  8 Dec 2025 12:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A17C4CEF1;
	Mon,  8 Dec 2025 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196465;
	bh=MusA/V6Dt1xIa+tAeGx/rsU9JoqhBv1Pt0IFS+iUlt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I73R2iUTYqY+LLPDBJPugFCa+aeAt8i26sfs20t1x+Xv8tnpUQiGCiQ3Zf63BPR/b
	 dHoei1+iKxNo21SQAIGYg8cBzf9y7yC7XLSZo6v9CQYwvvlKyCko32nRs/bkmnK5fd
	 GdYGW+vpgnG3mIOV/VIHzJzk1BVO4QCKaCQ1u7Iw41nJZfFDI6R/Wwj3fw2rHPos4y
	 YD861NKUk6eU0wuuUjbVoa3YQX2U/ORUXDWPbVKqWRdPu5gOHP3lqzjX1iafWM5lrx
	 ulO+BFok/jYE7zvrQXAD7nQlotgjPfQLXMgpYgVohjs9GFM+WVgA7/o3kgwzvCevRZ
	 Up1IopKmhFzcA==
Date: Mon, 8 Dec 2025 17:50:59 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
Message-ID: <aTbCqyOuprPOyU4X@sumit-X1>
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_042107_325281_4706E2DA 
X-CRM114-Status: GOOD (  25.67  )
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

T24gTW9uLCBEZWMgMDgsIDIwMjUgYXQgMDQ6MjQ6MTdQTSArMTEwMCwgQW1pcnJlemEgWmFycmFi
aSB3cm90ZToKPiBIaSwKPiAKPiBPbiAxMi81LzIwMjUgMTI6MjcgQU0sIEplbnMgV2lrbGFuZGVy
IHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIFRodSwgRGVjIDQsIDIwMjUgYXQgMTE6MTfigK9B
TSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gRnJvbTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+Pgo+ID4+IFRoZSB0ZWVfaW9jdGxfb2Jq
ZWN0X2ludm9rZV9hcmcgc3RydWN0dXJlIGhhcyBwYWRkaW5nIG9uIHNvbWUKPiA+PiBhcmNoaXRl
Y3R1cmVzIGJ1dCBub3Qgb24geDg2LTMyIGFuZCBhIGZldyBvdGhlcnM6Cj4gPj4KPiA+PiBpbmNs
dWRlL2xpbnV4L3RlZS5oOjQ3NDozMjogZXJyb3I6IHBhZGRpbmcgc3RydWN0IHRvIGFsaWduICdw
YXJhbXMnIFstV2Vycm9yPXBhZGRlZF0KPiA+Pgo+ID4+IEkgZXhwZWN0IHRoYXQgYWxsIGN1cnJl
bnQgdXNlcnMgb2YgdGhpcyBhcmUgb24gYXJjaGl0ZWN0dXJlcyB0aGF0IGRvCj4gPj4gaGF2ZSBp
bXBsaWNpdCBwYWRkaW5nIGhlcmUgKGFybTY0LCBhcm0sIHg4NiwgcmlzY3YpLCBzbyBtYWtlIHRo
ZSBwYWRkaW5nCj4gPj4gZXhwbGljaXQgaW4gb3JkZXIgdG8gYXZvaWQgc3VycHJpc2VzIGlmIHRo
aXMgbGF0ZXIgZ2V0cyB1c2VkIGVsc2V3aGVyZS4KPiA+Pgo+ID4+IEZpeGVzOiBkNWI4YjBmYTE3
NzUgKCJ0ZWU6IGFkZCBURUVfSU9DVExfUEFSQU1fQVRUUl9UWVBFX09CSlJFRiIpCj4gPj4gU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+PiAtLS0KPiA+PiBU
aGUgbmV3IGludGVyZmFjZSBzaG93ZWQgdXAgaW4gNi4xOCwgYnV0IEkgb25seSBjYW1lIGFjcm9z
cyB0aGlzIGFmdGVyCj4gPj4gdGhhdCB3YXMgcmVsZWFzZWQuIENoYW5naW5nIGl0IG5vdyBpcyB0
ZWNobmljYWxseSBhbiBBQkkgY2hhbmdlIG9uCj4gPj4gYXJjaGl0ZWN0dXJlcyB3aXRoIHVudXN1
YWwgcGFkZGluZyBydWxlcywgc28gcGxlYXNlIGNvbnNpZGVyIGNhcmVmdWxseQo+ID4+IHdoZXRo
ZXIgd2Ugd2FudCB0byBkbyBpdCB0aGlzIHdheSBvciBub3QuCj4gPj4KPiA+PiBXb3JraW5nIGFy
b3VuZCB0aGUgQUJJIGRpZmZlcmVuY2VzIHdpdGhvdXQgYW4gQUJJIGNoYW5nZSBpcyBwb3NzaWJs
ZSwKPiA+PiBidXQgYWRkcyBhIGxvdCBvZiBjb21wbGV4aXR5IGZvciBjb21wYXQgaGFuZGxpbmcu
Cj4gPiAKPiA+IFRoaXMgaXMgY3VycmVudGx5IG9ubHkgdXNlZCBieSB0aGUgcmVjZW50bHkgaW50
cm9kdWNlZCBxY29tdGVlIGJhY2tlbmQKPiA+IGRyaXZlci4gU28gaXQncyBvbmx5IHVzZWQgb24g
YSBmZXcgYXJtNjQgUXVhbGNvbW0gcGxhdGZvcm1zIHJpZ2h0IG5vdy4KPiA+IAo+ID4gSSB0aGlu
ayB3ZSBzaG91bGQgdGFrZSB0aGlzIHBhdGNoLCBidXQgbGV0J3MgaGVhciB3aGF0IG90aGVycyB0
aGluay4KClllYWggc2luY2UgaXQncyBub3QgYW4gQUJJIGlzc3VlIG9uIGFybTY0IHBsYXRmb3Jt
cyB3aGVyZSBRVEVFIHJ1bnMsIHNvOgoKUmV2aWV3ZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0Lmdh
cmdAb3NzLnF1YWxjb21tLmNvbT4KCj4gPiAKPiA+IFRoYW5rcywKPiA+IEplbnMKPiA+IAo+IAo+
IEkgYWdyZWUuIFdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2guIEFzIG5vdGVkLCB0aGVyZSBhcmUg
bm90IG1hbnkKPiBjbGllbnRzIHJlbHlpbmcgb24gaXQgeWV0LCBzbyB1cGRhdGluZyB0aGUgdXNl
cnNwYWNlIHNob3VsZAo+IGJlIHN0cmFpZ2h0Zm9yd2FyZC4KCllvdSBzaG91bGQgcmF0aGVyIHRl
c3Qgd2l0aG91dCBhbnkgdXNlcnNwYWNlIGxpYnJhcnkgdXBkYXRlIHRvIHRlc3QgaXQncwpub3Qg
YW4gQUJJIGlzc3VlLiBKdXN0IGZvciBjb3JyZWN0bmVzcyBzYWtlLCB5b3UgY2FuIHVwZGF0ZSB0
aGUgbGlicmFyeQp0b28uCgotU3VtaXQKClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
