Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4F4C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 05:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnMLqPD4OD74V4MrkMb8ddFHmOJefVNTpbJDBohvApM=; b=gWHpki4LquTI4o
	DX3K6FJp4UmqBtqH8Ff11Zf+ygVWlSmSWynRZK9yhVFwfZ1oXX4Fi2VVnsa2067F82fPUsQoGWHR5
	PVvAH0kNeZd+r/aWqHePW2/KeI8tGmeWWSCOn141DSSfops/KIwJ+GvdNBhHzgfuP6seXLh4whFkn
	bDj3jF8ovDBmVGZbq2a5L2N2a4MbQ5+KrGD/My/hjvzfhyqQFJMD4dMHgASerRT+NBeblHJFjcPtE
	u4qBw7RFm+CuP5jE5rBTnhSxnNCvqTahWTjSh7ekJ6ggKYovwhByPpAy6sIlaa6b0tdYJcZMf4Z1e
	wYIFjkrUV35gEKqDC+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjCKM-00EA62-3A;
	Mon, 03 Apr 2023 05:01:58 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjCKI-00EA4c-0n;
	Mon, 03 Apr 2023 05:01:56 +0000
Received: from [10.128.10.193] (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 16233580203;
	Mon,  3 Apr 2023 13:01:31 +0800 (CST)
Message-ID: <7088643e-400b-4cd4-edd3-63b3baa36a7c@sangfor.com.cn>
Date: Mon, 3 Apr 2023 13:01:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 8/8] selftests/ftrace: Add funcgraph-retval test case
Content-Language: en-US
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, rmk+kernel@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 bp@alien8.de, hpa@zytor.com, chenhuacai@kernel.org, zhangqing@loongson.cn,
 kernel@xen0n.name, mingo@redhat.com, peterz@infradead.org,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
 <ba23c2429f1ef798946ce65e21c7a7a2bff0019e.1680265828.git.pengdonglin@sangfor.com.cn>
 <20230402070406.177f09cc34f9860baf3e6ec2@kernel.org>
 <f4eabd56-2f91-05fc-b882-9dd8328f87ae@sangfor.com.cn>
In-Reply-To: <f4eabd56-2f91-05fc-b882-9dd8328f87ae@sangfor.com.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEseVhlMHUwdGEoaTEtDTlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Sww6FT0VKDoNFkIeLitR
	SDkKCRFVSlVKTUNLT0JDS0JJTUpCVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFMS0pKNwY+
X-HM-Tid: 0a87457de8552eb7kusn16233580203
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_220154_574663_23E49010 
X-CRM114-Status: GOOD (  19.23  )
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

T24gMjAyMy80LzMgMTA6MzMsIERvbmdsaW4gUGVuZyB3cm90ZToKPiBPbiAyMDIzLzQvMiA2OjA0
LCBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIHdyb3RlOgo+PiBPbiBGcmksIDMxIE1hciAyMDIz
IDA1OjQ3OjQ0IC0wNzAwCj4+IERvbmdsaW4gUGVuZyA8cGVuZ2RvbmdsaW5Ac2FuZ2Zvci5jb20u
Y24+IHdyb3RlOgo+Pgo+Pj4gQWRkIGEgdGVzdCBjYXNlIGZvciB0aGUgZnVuY2dyYXBoLXJldHZh
bCBhbmQgZnVuY2dyYXBoLXJldHZhbC1oZXgKPj4+IHRyYWNlIG9wdGlvbnMuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogRG9uZ2xpbiBQZW5nIDxwZW5nZG9uZ2xpbkBzYW5nZm9yLmNvbS5jbj4KPj4+
IC0tLQo+Pj4gdjEwOgo+Pj4gwqAgLSBGaXggaXNzdWVzIGluIHNlbGZ0ZXN0Cj4+Pgo+Pj4gdjg6
Cj4+PiDCoCAtIEZpeCBpc3N1ZXMgaW4gc2VsZnRlc3QKPj4+IC0tLQo+Pj4gwqAgLi4uL2Z0cmFj
ZS90ZXN0LmQvZnRyYWNlL2ZncmFwaC1yZXR2YWwudGPCoMKgwqDCoCB8IDQzICsrKysrKysrKysr
KysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgCj4+PiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVz
dC5kL2Z0cmFjZS9mZ3JhcGgtcmV0dmFsLnRjCj4+Pgo+Pj4gZGlmZiAtLWdpdCAKPj4+IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC9mdHJhY2UvZmdyYXBoLXJldHZhbC50
YyAKPj4+IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC9mdHJhY2UvZmdy
YXBoLXJldHZhbC50Ywo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAw
MDAwMC4uNTgxOWFhMmRkNmFkCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVzdC5kL2Z0cmFjZS9mZ3JhcGgtcmV0dmFsLnRjCj4+PiBA
QCAtMCwwICsxLDQzIEBACj4+PiArIyEvYmluL3NoCj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMAo+Pj4gKyMgZGVzY3JpcHRpb246IGZ0cmFjZSAtIGZ1bmN0aW9uIGdyYXBo
IHByaW50IGZ1bmN0aW9uIHJldHVybiB2YWx1ZQo+Pj4gKyMgcmVxdWlyZXM6IG9wdGlvbnMvZnVu
Y2dyYXBoLXJldHZhbCBvcHRpb25zL2Z1bmNncmFwaC1yZXR2YWwtaGV4IAo+Pj4gZnVuY3Rpb25f
Z3JhcGg6dHJhY2VyCj4+PiArCj4+PiArIyBNYWtlIHN1cmUgdGhhdCBmdW5jZ3JhcGgtcmV0dmFs
IHdvcmtzCj4+PiArCj4+PiArZmFpbCgpIHsgIyBtc2cKPj4+ICvCoMKgwqAgZWNobyAkMQo+Pj4g
K8KgwqDCoCBleGl0X2ZhaWwKPj4+ICt9Cj4+PiArCj4+PiArZGlzYWJsZV90cmFjaW5nCj4+PiAr
Y2xlYXJfdHJhY2UKPj4+ICsKPj4+ICtyZWFkIFBJRCBfIDwgL3Byb2Mvc2VsZi9zdGF0Cj4+Cj4+
IFlvdSBjYW4gdXNlICIkJCIgZm9yIHNlbGYgcGlkLgo+IAo+IFllYWgsIEkgd2lsbCBmaXggaXQu
CgpJIGZvdW5kIHRoYXQgZnRyYWNldGVzdCB1c2VkICgpIHRvIGxhdW5jaCBhIG5ldyBjaGlsZCBw
cm9jZXNzIGZvcgpleGVjdXRpbmcgYSAudGMgc2NyaXB0IGZpbGUsIGhvd2V2ZXIgdGhlICQkIHZh
bHVlIHJlbWFpbnMgdW5jaGFuZ2VkLApzbyB3ZSBjYW4gbm90IHVzZSAkJCBoZXJlLCBiZWNhdXNl
IGl0IGlzIFBQSUQuIFRoZXJlZm9yZSBJIHRoaW5rIHdlCmhhdmUgdG8gZ2V0IFBJRCBmcm9tIC9w
cm9jL3NlbGYvc3RhdC4KCkhlcmUgaXMgdGhlIGNvZGUgZnJvbSBmdHJhY2V0ZXN0IHRoYXQgbGF1
bmNoZXMgYSBjaGlsZCBzaGVsbCBmb3IgCmV4ZWN1dGluZyB0aGUgLnRjIGZpbGUuCgpfX3J1bl90
ZXN0KCkgeyAjIHRlc3RmaWxlCiAgICMgc2V0dXAgUElEIGFuZCBQUElELCAkJCBpcyAqbm90KiB1
cGRhdGVkLgogICAoY2QgJFRSQUNJTkdfRElSOyByZWFkIFBJRCBfIDwgL3Byb2Mvc2VsZi9zdGF0
OyBzZXQgLWU7IHNldCAteDsKICAgIGNoZWNrcmVxICQxOyBpbml0aWFsaXplX2Z0cmFjZTsgLiAk
MSkKICAgWyAkPyAtbmUgMCBdICYmIGtpbGwgLXMgJFNJR19GQUlMICRTSUdfUElECn0KCj4gCj4+
Cj4+PiArWyAtZiBzZXRfZnRyYWNlX3BpZCBdICYmIGVjaG8gJHtQSUR9ID4gc2V0X2Z0cmFjZV9w
aWQKPj4+ICtbIC1mIHNldF9mdHJhY2VfZmlsdGVyIF0gJiYgZWNobyBwcm9jX3JlZ193cml0ZSA+
IHNldF9mdHJhY2VfZmlsdGVyCj4+PiArWyAtZiBzZXRfZ3JhcGhfZnVuY3Rpb24gXSAmJiBlY2hv
IHByb2NfcmVnX3dyaXRlID4gc2V0X2dyYXBoX2Z1bmN0aW9uCj4+Cj4+IFlvdSBzaG91bGQgc2V0
IHRoZSByZXF1aXJlZCBmaWxlcyBmb3IgdGhpcyB0ZXN0LCBzbyB0aGF0IHRoZSB0ZXN0IHJlc3Vs
dAo+PiBpcyBhbHdheXMgc2FtZS4gQlRXLCB5b3UgbmVlZCB0byBzZXQgZWl0aGVyICdzZXRfZnRy
YWNlX2ZpbHRlcicgb3IKPj4gJ3NldF9ncmFwaF9mdW5jdGlvbicuCj4gCj4gWWVzLCBidXQgSSBk
aXNjb3ZlcmVkIHRoYXQgc2V0X2Z0cmFjZV9maWx0ZXIgYW5kIHNldF9ncmFwaF9mdW5jdGlvbiBy
ZWx5IAo+IG9uIHRoZSBDT05GSUdfRFlOQU1JQ19GVFJBQ0UgY29uZmlndXJhdGlvbiwgd2hpY2gg
bWVhbnMgdGhhdCB0aGVzZSB0d28gCj4gZmlsZXMgYXJlIG5vdCBwcmVzZW50IHdoZW4gQ09ORklH
X0RZTkFNSUNfRlRSQUNFIGlzIGRpc2FibGVkLCBldmVuIGlmIAo+IENPTkZJR19GVU5DVElPTl9H
UkFQSF9SRVRWQUwgaXMgZW5hYmxlZC4gVGhlcmVmb3JlLCBJIHRoaW5rIHRoYXQgdGhlc2UgCj4g
dHdvIHRyYWNlIGZpbGVzIGFyZSBub3QgbmVjZXNzYXJ5IGZvciB0aGlzIHRlc3QuCj4gCj4gSSB3
aWxsIG1vZGlmeSB0aGUgYWJvdmUgbGlrZSB0aGlzOgo+IAo+IFsgLWYgc2V0X2Z0cmFjZV9waWQg
XSAmJiBlY2hvICQkID4gc2V0X2Z0cmFjZV9waWQKPiBbIC1mIHNldF9mdHJhY2VfZmlsdGVyIF0g
JiYgZWNobyBwcm9jX3JlZ193cml0ZSA+IHNldF9mdHJhY2VfZmlsdGVyCj4gCj4+Cj4+PiArZWNo
byBmdW5jdGlvbl9ncmFwaCA+IGN1cnJlbnRfdHJhY2VyCj4+PiArZWNobyBmdW5jZ3JhcGgtcmV0
dmFsID4gdHJhY2Vfb3B0aW9ucwo+Pj4gKwo+Pj4gK3NldCArZQo+Pj4gK2VuYWJsZV90cmFjaW5n
Cj4+PiArZWNobyA+IC9wcm9jL2ludGVycnVwdHMKPj4+ICtkaXNhYmxlX3RyYWNpbmcKPj4+ICtz
ZXQgLWUKPj4+ICsKPj4+ICs6ICJUZXN0IHByaW50aW5nIHRoZSBlcnJvciBjb2RlIGluIHNpZ25l
ZCBkZWNpbWFsIGZvcm1hdCIKPj4+ICtlY2hvIG5vZnVuY2dyYXBoLXJldHZhbC1oZXggPiB0cmFj
ZV9vcHRpb25zCj4+Cj4+IGVjaG8gMCA+IG9wdGlvbnMvZnVuY2dyYXBoLXJldHZhbC1oZXgKPj4K
Pj4gSWYgeW91IHJlcXVpcmUgJ29wdGlvbnMvZnVuY2dyYXBoLXJldHZhbC1oZXgnIGZpbGUsIHlv
dSBjYW4gdXNlIHRoZQo+PiBmaWxlIHRvIHNldCBpdCBvciBjbGVhciBpdC4KPiAKPiBZZWFoLgo+
IAo+Pgo+Pj4gK2NvdW50PWBjYXQgdHJhY2UgfCBncmVwICdwcm9jX3JlZ193cml0ZScgfCBncmVw
ICc9IC01JyB8IHdjIC1sYAo+Pj4gK2lmIFsgJGNvdW50IC1lcSAwIF07IHRoZW4KPj4+ICvCoMKg
wqAgZmFpbCAiUmV0dXJuIHZhbHVlIGNhbiBub3QgYmUgcHJpbnRlZCBpbiBzaWduZWQgZGVjaW1h
bCBmb3JtYXQiCj4+PiArZmkKPj4+ICsKPj4+ICs6ICJUZXN0IHByaW50aW5nIHRoZSBlcnJvciBj
b2RlIGluIGhleGFkZWNpbWFsIGZvcm1hdCIKPj4+ICtlY2hvIGZ1bmNncmFwaC1yZXR2YWwtaGV4
ID4gdHJhY2Vfb3B0aW9ucwo+Pgo+PiBEaXR0by4KPiAKPiBUaGFua3MuCj4gCj4+Cj4+IFRoYW5r
cywKPj4KPj4+ICtjb3VudD1gY2F0IHRyYWNlIHwgZ3JlcCAncHJvY19yZWdfd3JpdGUnIHwgZ3Jl
cCAnZmZmZmZmZmInIHwgd2MgLWxgCj4+PiAraWYgWyAkY291bnQgLWVxIDAgXTsgdGhlbgo+Pj4g
K8KgwqDCoCBmYWlsICJSZXR1cm4gdmFsdWUgY2FuIG5vdCBiZSBwcmludGVkIGluIGhleGFkZWNp
bWFsIGZvcm1hdCIKPj4+ICtmaQo+Pj4gKwo+Pj4gK2V4aXQgMAo+Pj4gLS0gCj4+PiAyLjI1LjEK
Pj4+Cj4+Cj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
