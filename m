Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD18C6FD1C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 03:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJ2cmre8ffPLX5cvBkbNcPqUWUpWettdTW+n8oaewcI=; b=tJ19QVy+hdPMVu
	P23Low59PbwnaXIsAkXQJ6t6Kr6d7PbdaluXV7hrHbgHWXrQ8ai38Xrr6pceZR+ogZ9V//YRyZSiw
	+l1RLEiPleba8UnGPrWR6dZVNcL20rxhSjFHhRfzWlMYE8Ql3C+5qY1Kj8BKSdM6UYA4DtzfFKCOX
	gH2UherLcAuwSs0SA10EQfLU+LDS3+wAtcWtAHPp4458Wg7DG3PTw46BhOjSQusfllDN0PNffzeKO
	1nRlyHkAJhaCKahe7nTfIAR9BIKQTxsalQOChCht9tAM61XW5JJbKOI5N+8NpmF4VirR7irleP2XA
	LwXBLRtRBY0K1hAH3BnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peScO-00B5du-1P;
	Tue, 21 Mar 2023 03:25:00 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peScK-00B5ca-1C;
	Tue, 21 Mar 2023 03:24:58 +0000
Received: from [10.128.10.193] (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 30C125801B8;
	Tue, 21 Mar 2023 11:24:45 +0800 (CST)
Message-ID: <1446d966-1b7d-322e-bdd9-d0cb4506c080@sangfor.com.cn>
Date: Tue, 21 Mar 2023 11:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] tracing: Add documentation for funcgraph-retval
 and graph_retval_hex
To: Ding Hui <dinghui@sangfor.com.cn>, mhiramat@kernel.org,
 rostedt@goodmis.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, dave.hansen@linux.intel.com,
 x86@kernel.org, mingo@redhat.com, xiehuan09@gmail.com,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com
Cc: linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-3-pengdonglin@sangfor.com.cn>
 <4a88721a-ac78-bcad-1b33-f9027baab5ab@sangfor.com.cn>
Content-Language: en-US
From: Donglin Peng <pengdonglin@sangfor.com.cn>
In-Reply-To: <4a88721a-ac78-bcad-1b33-f9027baab5ab@sangfor.com.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQh5OVkhDGUlOSxgZTUoaT1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS09ISFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDI6Vio*Kz0XVhAWQzQXL04v
	SgMaCzFVSlVKTUxCSE1CS0NNT0pNVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFIQ0hKNwY+
X-HM-Tid: 0a870232a40f2eb7kusn30c125801b8
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_202456_538848_F94975DC 
X-CRM114-Status: GOOD (  14.09  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMy8zLzIxIDEwOjMxLCBEaW5nIEh1aSB3cm90ZToKPiBPbiAyMDIzLzMvMjAgMjE6MTYs
IERvbmdsaW4gUGVuZyB3cm90ZToKPiAKPj4gK1RoZXJlIGFyZSBzb21lIGxpbWl0YXRpb25zIHdo
ZW4gdXNpbmcgdGhlIGZ1bmNncmFwaC1yZXR2YWwgY3VycmVudGx5Ogo+PiArCj4+ICstIEV2ZW4g
aWYgdGhlIGZ1bmN0aW9uIHJldHVybiB0eXBlIGlzIHZvaWQsIGEgcmV0dXJuIHZhbHVlIHdpbGwg
c3RpbGwKPj4gK8KgIGJlIHByaW50ZWQsIGFuZCB5b3UgY2FuIGp1c3QgaWdub3JlIGl0Lgo+PiAr
Cj4+ICstIEV2ZW4gaWYgdGhlIHJldHVybiB2YWx1ZSBpcyBub3QgYW4gZXJyb3IgY29kZSBhY3R1
YWxseSwgaXQgbWF5IGJlCj4+ICvCoCBkaXNwbGF5ZWQgYXMgYW4gZXJyb3IgY29kZS4gWW91IHNo
b3VsZCByZWFkIHRoZSBjb2RlIHRvIGNoZWNrLgo+PiArwqAgRm9yIGV4YW1wbGUsIGJvdGggMHhm
ZSBhbmQgMHhmZmZlIGFyZSBiZSBpbnRlcnByZXRlZCBhcyAtMi4KPiAKPiBGb3IgY2hhciBhbmQg
c2hvcnQgdHlwZXMsIGRpc3BsYXlpbmcgYXMgc2lnbmVkIGRlY2ltYWwgbWF5IGJlIG5vdCAKPiBh
cHByb3ByaWF0ZSwgYmVjYXVzZSB0aGV5IGFyZSByYXJlbHkgdXNlZCB0byBzdG9yZSBlcnJvciBj
b2RlLgo+IAo+IFNvIGluICJzbWFydCIgbW9kZSAoZ3JhcGhfcmV0dmFsX2hleD0wKSwgSSBzdWdn
ZXN0IGp1c3Qgc21hcnQgY29udmVydCAKPiBlcnJvciB2YWx1ZSBzdG9yZWQgaW4gaW50IG9yIHBv
aW50ZXIgdG8gc2lnbmVkIGRlY2ltYWwuCgpZZWFoLCBJIHdpbGwgcmVtb3ZlIHRoZSByZXR1cm4g
dmFsdWUgY29udmVyc2lvbiBmb3IgY2hhciBhbmQgc2hvcnQKdHlwZXMgaW4gdGhlICJzbWFydCIg
bW9kZS4KCj4gCj4+ICstIE9ubHkgdGhlIHZhbHVlIG9mIHRoZSBmaXJzdCByZXR1cm4gcmVnaXN0
ZXIgd2lsbCBiZSByZWNvcmRlZCBhbmQKPj4gK8KgIHByaW50ZWQgZXZlbiBpZiB0aGUgcmV0dXJu
IHZhbHVlcyBtYXkgYmUgc3RvcmVkIGluIHR3byByZWdpc3RlcnMKPj4gK8KgIGFjdHVhbGx5LiBG
b3IgZXhhbXBsZSwgYm90aCB0aGUgZWF4IGFuZCBlZHggYXJlIHVzZWQgdG8gc3RvcmUgYQo+PiAr
wqAgNjQgYml0IHJldHVybiB2YWx1ZSBpbiB0aGUgeDg2IGFyY2hpdGVjdHVyZSwgYW5kIHRoZSBl
YXggc3RvcmVzCj4+ICvCoCB0aGUgbG93IDMyIGJpdCwgdGhlIGVkeCBzdG9yZXMgdGhlIGhpZ2gg
MzIgYml0LCBob3dldmVyIG9ubHkgdGhlCj4+ICvCoCB2YWx1ZSBzdG9yZWQgaW4gZWF4IHdpbGwg
YmUgcmVjb3JkZWQgYW5kIHByaW50ZWQuCj4+ICsKPj4gwqAgWW91IGNhbiBwdXQgc29tZSBjb21t
ZW50cyBvbiBzcGVjaWZpYyBmdW5jdGlvbnMgYnkgdXNpbmcKPj4gwqAgdHJhY2VfcHJpbnRrKCkg
Rm9yIGV4YW1wbGUsIGlmIHlvdSB3YW50IHRvIHB1dCBhIGNvbW1lbnQgaW5zaWRlCj4+IMKgIHRo
ZSBfX21pZ2h0X3NsZWVwKCkgZnVuY3Rpb24sIHlvdSBqdXN0IGhhdmUgdG8gaW5jbHVkZQo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
