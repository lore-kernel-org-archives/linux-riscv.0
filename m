Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA8DC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 23:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XD54prb1uxOb31egbg4qvqnLrZvjzp9ubm7KrZwZ9SQ=; b=j/dnrq/NGMUqCv
	2CLWFrHcdn0ZFvgcrxrFie9qxyulSplEqWIic5FJfIdIcdqV1RUo2Vyrcezsyc1RPnZZBwMrYrxmP
	tcZJqKXze5TGfV5/uSMrCpWuRKY5/IyyBHNQlJtc6DfMA9dx0729usdGaOnWnkn6CeyKFolQBy8Aq
	ZGYSGYfy72+jO0ThYN8lH9lbWvb8gd649jN2eERcsrJ/wSSK6zIUQydxZ12U+Vmp7hZHtTJmOQBdV
	n4hwyuuvy0+Ds0yf4tadiKTIqmlwNV+wE6f7sxx1/M+dyHm/hJ/h0vINQErTl0YfcmoL5dES+y8Z0
	J6zJm340fe584EbAAd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznZi-004mSF-0W; Mon, 28 Nov 2022 23:30:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznZg-004mRE-4J
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 23:30:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EB0D614E7;
	Mon, 28 Nov 2022 23:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA60C433C1;
	Mon, 28 Nov 2022 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669678203;
	bh=oQ1NXyRzlFb173JCqIW8f1hvYKMUAyVNiwLTT7sk8vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4aplWhPIs7iqJ6AIaWGsS/0dP/m7uG+YwVnF6ol5zTqZJGcZ61WOk4Lbhse0+rUJ
	 Gcs7nZFG2URkBSY7k4TT0AiQCdsKU9Q+PIQSUvBLVNnw9RCJlg6tXpSPctOSf3qqN4
	 LDuASRQC7uXiqM6eRsR3yw6eFizPwXCl2GAYZT/SkRYAya3BKcnCV7co0wljbK+r1I
	 s6rzLM6xdc6wB/JllmnInmwYBJz5kVfzB2DYK5zqKRReTfy0g3k3t75UmDZjJZupxf
	 +NuTw3SKSvHwghFW8SyjnGlnFPAb6GzK+Dgp8h4qcj3zDULS1uCqNUaYVXucpNY++/
	 Pvz2hWUzApaQQ==
Date: Tue, 29 Nov 2022 07:20:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] serial: bflb_uart: add Bouffalolab UART Driver
Message-ID: <Y4VCKeeTS2zV1xcZ@xhacker>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-3-jszhang@kernel.org>
 <c0406076-04e1-6b81-1bba-ac684516d898@kernel.org>
 <Y4TD48v84CJcMS+S@xhacker>
 <e1f689d2-d337-5a42-e4c9-91c1d338b42b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1f689d2-d337-5a42-e4c9-91c1d338b42b@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_153008_237043_C1E5392E 
X-CRM114-Status: GOOD (  18.09  )
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

T24gTW9uLCBOb3YgMjgsIDIwMjIgYXQgMDY6MDE6MjhQTSArMDIwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gT24gTW9uLCAyOCBOb3YgMjAyMiwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiAKPiA+
IE9uIE1vbiwgTm92IDI4LCAyMDIyIGF0IDA3OjEwOjQxQU0gKzAxMDAsIEppcmkgU2xhYnkgd3Jv
dGU6Cj4gPiA+IE9uIDI3LiAxMS4gMjIsIDE0OjI0LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4g
PiA+ICtzdGF0aWMgdm9pZCBiZmxiX3VhcnRfdHhfY2hhcnMoc3RydWN0IHVhcnRfcG9ydCAqcG9y
dCkKPiA+ID4gCj4gPiA+IEFnYWluOgo+ID4gPiAKPiA+ID4gQXJlIHlvdSB1bmFibGUgdG8gdXNl
IHRoZSBUWCBoZWxwZXI/IElmIHNvOgo+ID4gCj4gPiBZb3Uga25vdyBzZXJpYWwgc3Vic3lzdGVt
IGJldHRlciB0aGFuIG1lLCBtYXkgSSBhc2sgZm9yIG1vcmUKPiA+IGRldGFpbHM/IEZvciBleGFt
cGxlLAo+ID4gQmVzaWRlcyB1YXJ0X3htaXRfYWR2YW5jZSgpLCBkbyB5b3UgZXhwZWN0IG90aGVy
IFRYIGhlbHBlcnM/IElmIHllcywKPiA+IGNhbiB5b3UgcGxlYXNlIGxpc3QgdGhlbT8KPiAKPiBQ
bGVhc2UgdGFrZSBvbiBsb29rIG9uIGNvbW1pdCA4Mjc1YjQ4YjI3ODA5NmVkYzFlM2VhNWFhOWNm
OTQ2YTEwMDIyZjc5Lgo+IFRoZSBjaGFuZ2VzIGZvbGxvd2luZyB0aGF0IGNvbW1pdCBjb252ZXJ0
IHNvbWUgZHJpdmVycyB0byB1c2UgdGhlIHR4IAo+IGhlbHBlciBzbyB5b3UgY2FuIGxvb2sgaW50
byB0aGVtIHRvIHNlZSBleGFtcGxlcy4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIGhpbnQuIFdpbGwg
dGhvc2UgdHggaGVscGVycyh1YXJ0X3BvcnRfdHgsCnVhcnRfcG9ydF90eF9saW1pdGVkIGV0Yy4p
IGJlIGluIHY2LjItcmMxPyBPciBJIG5lZWQgdG8gcGF0Y2gKYmFzZWQgb24gSmlyaSdzIGRldmVs
IGJyYW5jaD8gQWhhLCBKaXJpIHNheXMgImF0IGxlYXN0IHVhcnRfeG1pdF9hZHZhbmNlCgo+IAo+
ID4gPiAqIHdoeT8KPiA+ID4gKiB1c2UgdWFydF9hZHZhbmNlX3htaXQoKSBhdCBsZWFzdC4KPiA+
IAo+ID4gRG8geW91IG1lYW4gdWFydF94bWl0X2FkdmFuY2UoKT8gaW4gdGhlIGRvIHdoaWxlIGxv
b3AgYmVsb3c/Cj4gCj4gWWVzLCBKaXJpIGhhZCB0aGUgbmFtZSB3cm9uZy4gQnV0IHlvdXIgY29k
ZSBsb29rZWQgbGlrZSBpdCBjb3VsZCB1c2UgCj4gdGhlIHR4IGhlbHBlciBpbnN0ZWFkLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
