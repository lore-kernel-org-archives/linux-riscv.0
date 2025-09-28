Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65959CAC5B0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 01:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUq19C5uCmibErgbQFmk5wBk4G1sC6mQfucpoDoP8+I=; b=OJGb9XHg4/8rES
	qJAVU6XDjrJuzu6P86RPIRo7t2Y9wICrHU3bM6hK2YFYv+qBOCnEW+N2WNoDXTI1QC8gFwdV+KL5c
	uOM60U0XRZzMFaHtlQRRpmbam6nKJw+biv9d0JdR2bZo0SfYLvcaAqSQwQNjUJ7yHo2CiYzRQqjZb
	qBmroOz4Ms4xvnfp9Ws/nHavsC7RXiJUqUY3JjNgZDhCXFTHKtqbEr+n6B1tWGI8GibAoDgwxPUc/
	H1HPT8tReHo3iI1twTt7uUxBrVEvcknhohzEDes18DCQsAklViCRcmsTkVuYALjUNXI3PHLMhUgiw
	65FQMkjVt9CEQlzP9AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2g3S-0000000DEQn-2o58;
	Sun, 28 Sep 2025 01:18:22 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2g3P-0000000DEOS-0p12
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 01:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759022239;
	bh=B6/8CMm+MJcvdAtTm6O0/Hl6/1zKACnAs1iFhf8nxzo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Y81h5qTLmiyHctY+kJ2pKGp07MpNZCxikItBr1V+YbcgaMqJIWjItTfRqVYuHexVh
	 5cfkMf3x6aw7Okv8y3mxA4LtNqUvaAAfCgqg3zTum9GDr/9fR8Ls/YFlE4iV8tRFEa
	 BIdlgDWqa89wmwIiDvi46qBSz2NsFVcjrwUdBVAI=
X-QQ-mid: esmtpsz10t1759022232t18daf930
X-QQ-Originating-IP: 7mCsBPPhT/6CNqfzBJZ8k8NdCodLpvNQOBzcWQpT0/I=
Received: from = ( [14.123.252.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 09:17:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9224920852930177741
EX-QQ-RecipientCnt: 9
Date: Sun, 28 Sep 2025 09:17:10 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927105616-GYB1338789@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NaHbrSwv39g0eI/CANYtFpTvZcQ7R/6wnm18H5lcZOz4THf1K5Yvz6P3
	0X9iEwbjcXAy1wjfL4upkWqAgDjsOBqiO947oSC2mvTF6/YnAaCfSAbXCBYFreyeSotP3a9
	g+4QH0WT7nXHpgbcyhtuNgKpdU8FdLv4zoJP5kjTXrKZG3TjqFcwuv/xTAUJCfHhMld4iq2
	odOvVYCPTnkiTIFLVi6CbqGnRX49BJx70HxFQrbNcAHn8rLvoDcB8i2tvaSH+l90IDBaIKt
	djcZ4VCbwvafQxnohh/diU7Hs7NUZW7RFWZsI02tu1NXNMVIPW+V/gqdQ0THRg7PRHSwtnZ
	297O4k0JTxJWFHFkzS/KDDDDy7FuMq/k/AGYElR62TAkrXXRRZb9fjvHcI9eAnYWY5YnaUt
	LdpgzL3x3qAbq6z5l79ft201HoM4WN2/Fj+VAtLyKIjFUlpjRdklCbjn12ps8cFh2oNEN88
	ePrQeyNXgiD77OonaIsM7ayoj6DeV1C6ePea9KZb2gfV8Cb//pDwJn3E9YIHTKN5gXqVrsF
	waHLOewN5D+4fbEs2FIadG8GJwiCw+1vB/aHS1q8/TZUf7kpZw5LVXhLZOGTzIJg1sVSrWM
	FDFVAigwnBvxdNXCIVyEYs53dxPTE9WK0keCCxSeaWChT4wwKQjhJ/VcMIpfi8kci7rV89c
	RJbevWa8GpIsWDvCgBCX+bM72H0koLL9AkbrG7TGvvPvxKzwDZIf8jdezr3KPStw5oj9mp7
	C1QkUeRQn7YkdrlqA61ggJ/HmY4CqUYJOzr7/F9PZ6EcIoVUk/2fUiLO+4GC8OS8dA6w4cY
	P9mPhsL/dLiAGsaZsdKCVzzH6o8Bj/YNRwO8lpjuV8yKnQPKzO+sgByDl+NbitLv2Euo14x
	LTm7UmaOqjW7+MoJ65+qTxsaPT8wbYH9dmvnAPJMiVijKhWpv6pD6gt7LWwAdb47t2EtBCT
	Cb6lkJxSq7VQR6NbcjbhNFxTEHKYswCNQWZJ1BjqR78P/1xaebgLwa0AAoiulV3miVQX9Vz
	O77V8gXkf4Y64/WUwzDgnNA4345AX/nwrXiMs6Tg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_181819_834033_97104BF8 
X-CRM114-Status: GOOD (  26.14  )
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

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMDY6NTY6MTZQTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IE9uIDEwOjAyIFRodSAyNSBTZXAgICAgICwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+IFRo
aXMgcGF0Y2ggaW50cm9kdWNlcyBJMkMgUElPIGZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBTcGFjZW1p
dCBLMSBTb0MsCj4gPiBlbmFibGluZyB0aGUgdXNlIG9mIEkyQyB3aXRoIGludGVycnVwdHMgZGlz
YWJsZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hl
bGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1rMS5jIHwgMTY0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtazEuYwo+ID4gaW5kZXggNmI5MTg3NzBlNjEyZTA5OGI4YWQxNzQx
OGY0MjBkODdjOTRkZjE2Ni4uZTQwM2ViN2Q2ZjMyOWY0ZmU1YzUyNDJmOTRjYzIxMDk0ZGZmMTA1
YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYwo+ID4gKysrIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1rMS5jCj4gPiBAQCAtOTcsNiArOTcsOSBAQAo+ID4gIAo+
IC4uCj4gPiAgc3RhdGljIGludCBzcGFjZW1pdF9pMmNfeGZlcl9tc2coc3RydWN0IHNwYWNlbWl0
X2kyY19kZXYgKmkyYykKPiA+ICB7Cj4gPiAgCXVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Owo+ID4g
QEAgLTMxMCwxMCArMzY4LDI4IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfaTJjX3hmZXJfbXNnKHN0
cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMpCj4gPiAgCj4gPiAgCQlyZWluaXRfY29tcGxldGlv
bigmaTJjLT5jb21wbGV0ZSk7Cj4gPiAgCj4gPiAtCQlzcGFjZW1pdF9pMmNfc3RhcnQoaTJjKTsK
PiA+ICsJCWlmIChpMmMtPmlzX3Bpbykgewo+ID4gKwkJCS8qIFdlIGRpc2FibGUgdGhlIGludGVy
cnVwdCB0byBhdm9pZCB1bmludGVuZGVkIHNwdXJpb3VzIHRyaWdnZXJzLiAqLwo+IHRoZSBjb21t
ZW50IGlzIHN1c3BpY2lvdXMsIGFuZCBzZWVtcyB3cm9uZy4uCj4gPiArCQkJZGlzYWJsZV9pcnEo
aTJjLT5pcnEpOwo+ID4gKwo+IEkgZ3Vlc3MgdGhpcyBkb2Vzbid0IGRpc2FibGUgaW50ZXJydXB0
IGluIHRoZSBoYXJkd2FyZSBsYXllciwgaXQgd2lsbCBzdGlsbAo+IGZpcmUgaW50ZXJydXB0IG9u
Y2UgZW5hYmxlZCwgc28gaW5zdGVhZCBvZiBjYWxsaW5nIGRpc2FibGVfaXJxKCksIHdoeSBub3QK
PiBkZWFsaW5nIHdpdGggSVNSIHNldHRpbmcgb2YgdGhlIGNvbnRyb2xsZXI/IEkgbWVhbiB0aG9z
ZSAiSUUgYml0cyIoaW50ZXJydXB0Cj4gZW5hYmxlaW5nKSBvZiBJQ1IgUkVHSVNURVIsIGRpc2Fi
bGluZyB0aGVtIHNob3VsZCBwcmV2ZW50IHRoZSBpbnRlcnJ1cHQKPiB0cmlnZ2VyZWQ/CkZvciBl
eGFtcGxlLCB0YWtlIE1TRCAobWFzdGVyIHN0b3AgZGV0ZWN0KS4KSWYgd2UgZGlzYWJsZSB0aGlz
IGludGVycnVwdCwgZXZlbiB0aGUgaW50ZXJydXB0IHN0YXR1cyBiaXQgd2lsbCBuZXZlciBiZSB0
cmlnZ2VyZWQuClRoZW4gaG93IGFyZSB3ZSBzdXBwb3NlZCB0byBrbm93IHdoZW4gdGhlIHRyYW5z
ZmVyIGhhcyBjb21wbGV0ZWQ/ClRoYXTigJlzIHdoeSB3ZSBkaXNhYmxlIHRoZSBnbG9iYWwgaW50
ZXJydXB0IGhlcmUsIGJ1dCBzdGlsbCBrZWVwIHRoZSBwZW5kaW5nIGJpdC4KCj4gCj4gPiArCQkJ
LyoKPiA+ICsJCQkgKiBUaGUgSzEgSTJDIGNvbnRyb2xsZXIgaGFzIGEgcXVpcms6Cj4gPiArCQkJ
ICogd2hlbiBkb2luZyBQSU8gdHJhbnNmZXJzLCB0aGUgc3RhdHVzIHJlZ2lzdGVyIG11c3QgYmUg
Y2xlYXJlZAo+ID4gKwkJCSAqIG9mIGFsbCBvdGhlciBiaXRzIGJlZm9yZSBpc3N1aW5nIGEgU1RB
UlQuCj4gPiArCQkJICogRmFpbGluZyB0byBkbyBzbyB3aWxsIHByZXZlbnQgdGhlIHRyYW5zZmVy
IGZyb20gd29ya2luZyBwcm9wZXJseS4KPiA+ICsJCQkgKi8KPiA+ICsJCQlzcGFjZW1pdF9pMmNf
Y2xlYXJfaW50X3N0YXR1cyhpMmMsIFNQQUNFTUlUX0kyQ19JTlRfU1RBVFVTX01BU0spOwo+IHRo
aXMgYWxzbyBkb2Vzbid0IHNlZW0gY29ycmVjdCB0byBtZSwgdGhlIGlycSBzdGF0dXMgYml0IHNo
b3VsZCBiZSBjbGVhcmVkIG9uY2UKPiBpbnRlcnJ1cHQgb2NjdXIsCj4gbm90IGRlYWxpbmcgaXQg
aGVyZSBiZWZvcmUgc2VuZGluZyBtc2csIHRoaXMgc2VlbXMgYQo+IHdyb25nIHByb2NlZHVyZQpJ
J2xsIGRvdWJsZSBjaGVjayBpdCwgYXMgSSByZWNhbGwgdGhhdCBpZiBpdOKAmXMgbm90IGNsZWFy
ZWQgaGVyZSwKdGhlIHNlY29uZCBtZXNzYWdlIHdpbGwgaW5ldml0YWJseSBmYWlsLgoKICAgICAg
ICAgICAgICAgIC0gVHJveQo+IAo+ID4gKwo+ID4gKwkJCXNwYWNlbWl0X2kyY19zdGFydChpMmMp
Owo+ID4gKwkJCXRpbWVfbGVmdCA9IHNwYWNlbWl0X2kyY193YWl0X3Bpb194ZmVyKGkyYyk7Cj4g
PiArCj4gPiArCQkJZW5hYmxlX2lycShpMmMtPmlycSk7Cj4gPiArCQl9IGVsc2Ugewo+ID4gKwkJ
CXNwYWNlbWl0X2kyY19zdGFydChpMmMpOwo+ID4gKwkJCXRpbWVfbGVmdCA9IHdhaXRfZm9yX2Nv
bXBsZXRpb25fdGltZW91dCgmaTJjLT5jb21wbGV0ZSwKPiA+ICsJCQkJCQkJCWkyYy0+YWRhcHQu
dGltZW91dCk7Cj4gPiArCQl9Cj4gPiAgCj4gPiAtCQl0aW1lX2xlZnQgPSB3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXQoJmkyYy0+Y29tcGxldGUsCj4gPiAtCQkJCQkJCWkyYy0+YWRhcHQudGlt
ZW91dCk7Cj4gPiAgCQlpZiAoIXRpbWVfbGVmdCkgewo+ID4gIAkJCWRldl9lcnIoaTJjLT5kZXYs
ICJtc2cgY29tcGxldGlvbiB0aW1lb3V0XG4iKTsKPiA+ICAJCQlzcGFjZW1pdF9pMmNfY29uZGl0
aW9uYWxseV9yZXNldF9idXMoaTJjKTsKPiA+IEBAIC0zNDEsNiArNDE3LDkgQEAgc3RhdGljIGJv
b2wgc3BhY2VtaXRfaTJjX2lzX2xhc3RfbXNnKHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMp
Cj4gCj4gLS0gCj4gWWl4dW4gTGFuIChkbGFuKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
