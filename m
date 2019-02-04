Return-Path: <SRS0=qOfL=QL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58757C282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Feb 2019 20:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256FB20821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Feb 2019 20:06:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r2dZH9OX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256FB20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2Dl6HvcM2xESIdhFsFIZW7fK/dk2WE9yjvlUcTzKYo=; b=r2dZH9OXgwVtxx
	x7ttjzoyeV9yf3QnDcXBVTSq1UcQCQ8UH4p0V3onR2xRR/ut/rZPA/3OsNHSAkPWbKv6ucP1/ATKu
	VlZQbeuHJd4Hqbo36OGf4fYN88jvIBd9AM4k3AYFLMoDgmdXbvnnWOunSTNKt1unOuomGAqAAXR/Z
	d/mqD+wbV4j/yKBllPQNF30SJicAalMdicrBVktij8Rpb1lUXQhSjS9HfHyJ9zwvtQjLQOW2+kZsG
	ubA5hU31fBctDgAI2/n8XC/aPZUwlN7ZJ+uKpEE7g1u2f45epmmiserbzs0qtVQtrjWr8lWH0bTA1
	uLmKqw80I6oftIbvhr1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqkW3-0004Vr-RG; Mon, 04 Feb 2019 20:06:51 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqkW1-0004V1-7A
 for linux-riscv@lists.infradead.org; Mon, 04 Feb 2019 20:06:51 +0000
Received: from [88.198.220.130] (helo=sslproxy01.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1gqkVt-0004LA-RG; Mon, 04 Feb 2019 21:06:41 +0100
Received: from [178.197.249.40] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1gqkVt-0005as-HA; Mon, 04 Feb 2019 21:06:41 +0100
Subject: Re: [PATCH bpf-next 1/3] bpf, riscv: add BPF JIT for RV64G
To: bjorn.topel@gmail.com, linux-riscv@lists.infradead.org, ast@kernel.org,
 netdev@vger.kernel.org
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
 <20190203115132.8766-2-bjorn.topel@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <88cdae60-494e-6294-b2c1-10b9cbeb95ac@iogearbox.net>
Date: Mon, 4 Feb 2019 21:06:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190203115132.8766-2-bjorn.topel@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.2/25350/Mon Feb  4 11:34:43 2019)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_120649_255403_946F5271 
X-CRM114-Status: GOOD (  16.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDIvMDMvMjAxOSAxMjo1MSBQTSwgYmpvcm4udG9wZWxAZ21haWwuY29tIHdyb3RlOgo+IEZy
b206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KPiAKPiBUaGlzIGNvbW1p
dCBhZGRzIEJQRiBKSVQgZm9yIFJWNjRHLgo+IAo+IFRoZSBKSVQgaXMgYSB0d28tcGFzcyBKSVQs
IGFuZCBoYXMgYSBkeW5hbWljIHByb2xvZy9lcGlsb2d1ZSAoc2ltaWxhcgo+IHRvIHRoZSBNSVBT
NjQgQlBGIEpJVCkgaW5zdGVhZCBvZiBzdGF0aWMgb25lcyAoZS5nLiB4ODZfNjQpLgo+IAo+IEF0
IHRoZSBtb21lbnQgdGhlIFJJU0MtViBMaW51eCBwb3J0IGRvZXMgbm90IHN1cHBvcnQgSEFWRV9L
UFJPQkVTLAo+IHdoaWNoIG1lYW5zIHRoYXQgQ09ORklHX0JQRl9FVkVOVFMgaXMgbm90IHN1cHBv
cnRlZC4gVGh1cywgbm8gdGVzdHMKPiBpbnZvbHZpbmcgQlBGX1BST0dfVFlQRV9UUkFDRVBPSU5U
IHBhc3Nlcy4KPiAKPiBGdXJ0aGVyLCB0aGUgaW1wbGVtZW50YXRpb24gZG9lcyBub3Qgc3VwcG9y
dCAiZmFyIGJyYW5jaGluZyIgKD40S2lCKS4KPiAKPiBUaGUgaW1wbGVtZW50YXRpb24gcGFzc2Vz
IGFsbCB0aGUgdGVzdF9icGYua28gdGVzdHM6Cj4gICB0ZXN0X2JwZjogU3VtbWFyeTogMzc4IFBB
U1NFRCwgMCBGQUlMRUQsIFszNjYvMzY2IEpJVCdlZF0KPiAKPiBBbGwgdGhlIHRhaWxfY2FsbCB0
ZXN0cyBpbiB0aGUgc2VsZnRlc3QvYnBmL3Rlc3RfdmVyaWZpZXIgcHJvZ3JhbQo+IHBhc3Nlcy4K
PiAKPiBBbGwgdGVzdHMgd2hlcmUgZG9uZSBvbiBRRU1VIChRRU1VIGVtdWxhdG9yIHZlcnNpb24g
My4xLjUwCj4gKHYzLjEuMC02ODgtZzhhZTk1MWZiYzEwNikpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KClNvbWUgbWlub3IgY29tbWVu
dHM6CgpMb29rcyBsaWtlIGFsbCB0aGUgQlBGX0pNUDMyIGluc3RydWN0aW9ucyBhcmUgbWlzc2lu
Zy4gV291bGQgcHJvYmFibHkKbWFrZSBzZW5zZSB0byBpbmNsdWRlIHRoZXNlIGludG8gdGhlIGlu
aXRpYWwgbWVyZ2UgYXMgd2VsbCB1bmxlc3MgdGhlcmUKaXMgc29tZSBnb29kIHJlYXNvbiBub3Qg
dG87IHByZXN1bWFibHkgdGhlIHRlc3RfdmVyaWZpZXIgcGFydHMgd2l0aApCUEZfSk1QMzIgaGF2
ZW4ndCBiZWVuIHRyaWVkIG91dD8KClsuLi5dCj4gKwo+ICtlbnVtIHsKPiArCVJWX0NUWF9GX1NF
RU5fVEFJTF9DQUxMID0JMCwKPiArCVJWX0NUWF9GX1NFRU5fQ0FMTCA9CQlSVl9SRUdfUkEsCj4g
KwlSVl9DVFhfRl9TRUVOX1MxID0JCVJWX1JFR19TMSwKPiArCVJWX0NUWF9GX1NFRU5fUzIgPQkJ
UlZfUkVHX1MyLAo+ICsJUlZfQ1RYX0ZfU0VFTl9TMyA9CQlSVl9SRUdfUzMsCj4gKwlSVl9DVFhf
Rl9TRUVOX1M0ID0JCVJWX1JFR19TNCwKPiArCVJWX0NUWF9GX1NFRU5fUzUgPQkJUlZfUkVHX1M1
LAo+ICsJUlZfQ1RYX0ZfU0VFTl9TNiA9CQlSVl9SRUdfUzYsCj4gK307Cj4gKwo+ICtzdHJ1Y3Qg
cnZfaml0X2NvbnRleHQgewo+ICsJc3RydWN0IGJwZl9wcm9nICpwcm9nOwo+ICsJdTMyICppbnNu
czsgLyogUlYgaW5zbnMgKi8KPiArCWludCBuaW5zbnM7Cj4gKwlpbnQgZXBpbG9ndWVfb2Zmc2V0
Owo+ICsJaW50ICpvZmZzZXQ7IC8qIEJQRiB0byBSViAqLwo+ICsJdW5zaWduZWQgbG9uZyBmbGFn
czsKPiArCWludCBzdGFja19zaXplOwo+ICt9Owo+ICsKPiArc3RydWN0IHJ2X2ppdF9kYXRhIHsK
PiArCXN0cnVjdCBicGZfYmluYXJ5X2hlYWRlciAqaGVhZGVyOwo+ICsJdTggKmltYWdlOwo+ICsJ
c3RydWN0IHJ2X2ppdF9jb250ZXh0IGN0eDsKPiArfTsKPiArCj4gK3N0YXRpYyB1OCBicGZfdG9f
cnZfcmVnKGludCBicGZfcmVnLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiArewo+ICsJ
dTggcmVnID0gcmVnbWFwW2JwZl9yZWddOwo+ICsKPiArCXN3aXRjaCAocmVnKSB7Cj4gKwljYXNl
IFJWX0NUWF9GX1NFRU5fUzE6Cj4gKwljYXNlIFJWX0NUWF9GX1NFRU5fUzI6Cj4gKwljYXNlIFJW
X0NUWF9GX1NFRU5fUzM6Cj4gKwljYXNlIFJWX0NUWF9GX1NFRU5fUzQ6Cj4gKwljYXNlIFJWX0NU
WF9GX1NFRU5fUzU6Cj4gKwljYXNlIFJWX0NUWF9GX1NFRU5fUzY6Cj4gKwkJX19zZXRfYml0KHJl
ZywgJmN0eC0+ZmxhZ3MpOwo+ICsJfQo+ICsJcmV0dXJuIHJlZzsKPiArfTsKPiArCj4gK3N0YXRp
YyBib29sIHNlZW5fcmVnKGludCByZWcsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+ICt7
Cj4gKwlzd2l0Y2ggKHJlZykgewo+ICsJY2FzZSBSVl9DVFhfRl9TRUVOX0NBTEw6Cj4gKwljYXNl
IFJWX0NUWF9GX1NFRU5fUzE6Cj4gKwljYXNlIFJWX0NUWF9GX1NFRU5fUzI6Cj4gKwljYXNlIFJW
X0NUWF9GX1NFRU5fUzM6Cj4gKwljYXNlIFJWX0NUWF9GX1NFRU5fUzQ6Cj4gKwljYXNlIFJWX0NU
WF9GX1NFRU5fUzU6Cj4gKwljYXNlIFJWX0NUWF9GX1NFRU5fUzY6Cj4gKwkJcmV0dXJuIHRlc3Rf
Yml0KHJlZywgJmN0eC0+ZmxhZ3MpOwo+ICsJfQo+ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgdm9pZCBtYXJrX2NhbGwoc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCj4gK3sK
PiArCV9fc2V0X2JpdChSVl9DVFhfRl9TRUVOX0NBTEwsICZjdHgtPmZsYWdzKTsKPiArfQo+ICsK
PiArc3RhdGljIGJvb2wgc2Vlbl9jYWxsKHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+ICt7
Cj4gKwlyZXR1cm4gc2Vlbl9yZWcoUlZfUkVHX1JBLCBjdHgpOwo+ICt9CgpKdXN0IG5pdDogcHJv
YmFibHkgbWlnaHQgYmUgbW9yZSBvYnZpb3VzIHRvIHJlbW92ZSB0aGlzIGFzeW1tZXRyeSBpbgpz
ZWVuX3JlZygpIGFuZCBkbyBfX3NldF9iaXQoKS90ZXN0X2JpdCgpIGZvciBSVl9DVFhfRl9TRUVO
X0NBTEwgc2ltaWxhcgpsaWtlIGJlbG93LgoKPiArc3RhdGljIHZvaWQgbWFya190YWlsX2NhbGwo
c3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCj4gK3sKPiArCV9fc2V0X2JpdChSVl9DVFhfRl9T
RUVOX1RBSUxfQ0FMTCwgJmN0eC0+ZmxhZ3MpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBzZWVu
X3RhaWxfY2FsbChzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiArewo+ICsJcmV0dXJuIHRl
c3RfYml0KFJWX0NUWF9GX1NFRU5fVEFJTF9DQUxMLCAmY3R4LT5mbGFncyk7Cj4gK30KPiArCj4g
K3N0YXRpYyB1OCBydl90YWlsX2NhbGxfcmVnKHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+
ICt7Cj4gKwltYXJrX3RhaWxfY2FsbChjdHgpOwo+ICsKPiArCWlmIChzZWVuX2NhbGwoY3R4KSkg
ewo+ICsJCV9fc2V0X2JpdChSVl9DVFhfRl9TRUVOX1M2LCAmY3R4LT5mbGFncyk7Cj4gKwkJcmV0
dXJuIFJWX1JFR19TNjsKPiArCX0KPiArCXJldHVybiBSVl9SRUdfQTY7Cj4gK30KPiArCj4gK3N0
YXRpYyB2b2lkIGVtaXQoY29uc3QgdTMyIGluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4
KQo+ICt7Cj4gKwlpZiAoY3R4LT5pbnNucykKPiArCQljdHgtPmluc25zW2N0eC0+bmluc25zXSA9
IGluc247Cj4gKwo+ICsJY3R4LT5uaW5zbnMrKzsKPiArfQo+ICsKPiArc3RhdGljIHUzMiBydl9y
X2luc24odTggZnVuY3Q3LCB1OCByczIsIHU4IHJzMSwgdTggZnVuY3QzLCB1OCByZCwgdTggb3Bj
b2RlKQo+ICt7ClsuLi5dCj4gKwkvKiBBbGxvY2F0ZSBpbWFnZSwgbm93IHRoYXQgd2Uga25vdyB0
aGUgc2l6ZS4gKi8KPiArCWltYWdlX3NpemUgPSBzaXplb2YodTMyKSAqIGN0eC0+bmluc25zOwo+
ICsJaml0X2RhdGEtPmhlYWRlciA9IGJwZl9qaXRfYmluYXJ5X2FsbG9jKGltYWdlX3NpemUsICZq
aXRfZGF0YS0+aW1hZ2UsCj4gKwkJCQkJCXNpemVvZih1MzIpLAo+ICsJCQkJCQlicGZfZmlsbF9p
bGxfaW5zbnMpOwo+ICsJaWYgKCFqaXRfZGF0YS0+aGVhZGVyKSB7Cj4gKwkJcHJvZyA9IG9yaWdf
cHJvZzsKPiArCQlnb3RvIG91dF9vZmZzZXQ7Cj4gKwl9Cj4gKwo+ICsJLyogU2Vjb25kLCByZWFs
IHBhc3MsIHRoYXQgYWN1dGFsbHkgZW1pdHMgdGhlIGltYWdlLiAqLwo+ICsJY3R4LT5pbnNucyA9
ICh1MzIgKilqaXRfZGF0YS0+aW1hZ2U7Cj4gK3NraXBfaW5pdF9jdHg6Cj4gKwljdHgtPm5pbnNu
cyA9IDA7Cj4gKwo+ICsJYnVpbGRfcHJvbG9ndWUoY3R4KTsKPiArCWlmIChidWlsZF9ib2R5KGN0
eCwgZXh0cmFfcGFzcykpIHsKPiArCQlicGZfaml0X2JpbmFyeV9mcmVlKGppdF9kYXRhLT5oZWFk
ZXIpOwo+ICsJCXByb2cgPSBvcmlnX3Byb2c7Cj4gKwkJZ290byBvdXRfb2Zmc2V0Owo+ICsJfQo+
ICsJYnVpbGRfZXBpbG9ndWUoY3R4KTsKPiArCj4gKwlpZiAoYnBmX2ppdF9lbmFibGUgPiAxKQo+
ICsJCWJwZl9qaXRfZHVtcChwcm9nLT5sZW4sIGltYWdlX3NpemUsIDIsIGN0eC0+aW5zbnMpOwo+
ICsKPiArCXByb2ctPmJwZl9mdW5jID0gKHZvaWQgKiljdHgtPmluc25zOwo+ICsJcHJvZy0+aml0
ZWQgPSAxOwo+ICsJcHJvZy0+aml0ZWRfbGVuID0gaW1hZ2Vfc2l6ZTsKPiArCj4gKwlicGZfZmx1
c2hfaWNhY2hlKGppdF9kYXRhLT5oZWFkZXIsICh1OCAqKWN0eC0+aW5zbnMgKyBjdHgtPm5pbnNu
cyk7CgpTaG91bGRuJ3QgdGhpcyBiZSAnKHUzMiAqKWN0eC0+aW5zbnMgKyBjdHgtPm5pbnNucycg
dG8gY292ZXIgdGhlIHJhbmdlPwoKPiArCj4gKwlpZiAoIXByb2ctPmlzX2Z1bmMgfHwgZXh0cmFf
cGFzcykgewo+ICtvdXRfb2Zmc2V0Ogo+ICsJCWtmcmVlKGN0eC0+b2Zmc2V0KTsKPiArCQlrZnJl
ZShqaXRfZGF0YSk7Cj4gKwkJcHJvZy0+YXV4LT5qaXRfZGF0YSA9IE5VTEw7Cj4gKwl9Cj4gK291
dDoKPiArCWlmICh0bXBfYmxpbmRlZCkKPiArCQlicGZfaml0X3Byb2dfcmVsZWFzZV9vdGhlcihw
cm9nLCBwcm9nID09IG9yaWdfcHJvZyA/Cj4gKwkJCQkJICAgdG1wIDogb3JpZ19wcm9nKTsKPiAr
CXJldHVybiBwcm9nOwo+ICt9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
