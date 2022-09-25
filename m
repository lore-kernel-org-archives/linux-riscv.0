Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720A7C07E9D
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 01:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1XzD0pwm0Lq1D02pK4QhQrg97GcqB0dGJQ0IvtZ/i8=; b=lqqlDQ7W0M1v8r
	9uQOa7TDv0zwxJnySU4J7cDF978Gqtri7viB/62omLUhWAPB433QTwUvXn4Gm4gFvv/BmTv8ctvwm
	/fDD3mzP6R6IZF62K/TYO/0t+HBYy+Gd9TwMQo9+qYQH6mt/PoD1FbKgKqi5BZg9UbTCEksJFBsPq
	ehhQQiGN6AxbC7pHdaBqaMnBpACiyt2CPzSI2pDft+hHa6h3hU3I/BLV7NVug5AYhah+rT8Eb4L4k
	8qN+cS+XJtrPfqMLuQojQH8hczfC/hCBaFK509Gv8m4BbLtlBACImJBOmSrWJ6OP2B4mC8bVqOull
	kC8G82sJRJUbyMzma7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocGLc-00A8yH-R7; Sun, 25 Sep 2022 01:22:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocGLR-00A8vg-IU; Sun, 25 Sep 2022 01:22:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 421A5B80E09;
	Sun, 25 Sep 2022 01:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41599C433C1;
	Sun, 25 Sep 2022 01:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664068925;
	bh=qhboV+u/W6osVsaLDhVKyfWJzh4Q5MlXbTHoaPiEXHU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JVGVoFhvnFL9oOZRfQ05ElBS3fBaQ2nhBIKBONEoM15IDTA8RW3y42BnaM+OiEaMo
	 MPgHf33j3jLlQoNDmpls+XrIQ+vEjvVISRTsf7xhGkt6daz6q7nN+OhcK6x/xh+W0z
	 t5D2q9z9IZdllrISTU4IKPFELox9OpkznNG8/fPFLYIK+QiKefHYr0I6nHxD77Jc0P
	 3UHIJ86nacQueMkKos2aymrHwQu/M3gjinO0J/gsEqW61VGR05DY02kOX5zKEDHojT
	 03MvoA1eIiDzEjDG2VKxhDlU417y7KGeDg525kghdPbfgPKur1GoaNDJMlzhXs+nlB
	 bsq+AIXw384Ow==
Date: Sun, 25 Sep 2022 10:21:59 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <guoren@kernel.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mhiramat@kernel.org>,
 <rostedt@goodmis.org>, <maz@kernel.org>, <alexandru.elisei@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
Message-Id: <20220925102159.639f39818672ef60a4ddc7f1@kernel.org>
In-Reply-To: <19ffdae6-8484-08e5-f408-ab39a97ce5c0@huawei.com>
References: <20220923084658.99304-1-liaochang1@huawei.com>
	<20220923084658.99304-4-liaochang1@huawei.com>
	<Yy2pAEvWKVloVr3U@FVFF77S0Q05N>
	<19ffdae6-8484-08e5-f408-ab39a97ce5c0@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_182209_934359_0BFD7E1C 
X-CRM114-Status: GOOD (  33.09  )
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

T24gU2F0LCAyNCBTZXAgMjAyMiAwOTo1MjoyOCArMDgwMAoibGlhb2NoYW5nIChBKSIgPGxpYW9j
aGFuZzFAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IAo+IAo+IOWcqCAyMDIyLzkvMjMgMjA6MzksIE1h
cmsgUnV0bGFuZCDlhpnpgZM6Cj4gPiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAwNDo0Njo1OFBN
ICswODAwLCBMaWFvIENoYW5nIHdyb3RlOgo+ID4+IFNpbmdsZS1zdGVwIHNsb3Qgd291bGQgbm90
IGJlIHVzZWQgdW50aWwga3Byb2JlIGlzIGVuYWJsZWQsIHRoYXQgbWVhbnMKPiA+PiBubyByYWNl
IGNvbmRpdGlvbiBvY2N1cnMgb24gaXQgdW5kZXIgU01QLCBoZW5jZSBpdCBpcyBzYWZlIHRvIHBh
Y3RoIHNzCj4gPj4gc2xvdCB3aXRob3V0IHN0b3BwaW5nIG1hY2hpbmUuCj4gPiAKPiA+IEkgdGhp
bmsgdGhpcyBpcyBjb3JyZWN0LCBidXQgdGhpcyBkZXBlbmRzIG9uIGEgY291cGxlIG9mIHN1YnRs
ZXRpZXMsCj4gPiBpbXBvcnRhbnRseToKPiA+IAo+ID4gKiBUaGF0IHRoZSBJLWNhY2hlIG1haW50
ZW5hbmNlIGZvciB0aGVzZSBpbnN0cnVjdGlvbnMgaXMgY29tcGxldGUgKmJlZm9yZSogdGhlCj4g
PiAgIGtwcm9iZSBCUksgaXMgd3JpdHRlbiAoYW5kIGFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0X25v
c3luYygpIGVuc3VyZXMgdGhpcywgYnV0Cj4gPiAgIGp1c3Qgb21pdHMgY2F1c2luZyBhIENvbnRl
eHQtU3luY2hyb25pemF0aW9uLUV2ZW50IG9uIGFsbCBDUFVTKS4KPiAKPiBTbyBpbiBvcmRlciB0
byBndWFyYW50ZWUgdGhlIEktY2FjaGUgbWFpbnRlbmFuY2UgaXMgb2JzZXJ2ZWQgb24gYWxsIENQ
VVMsCj4gaXQgbmVlZHMgdG8gYmUgZm9sbG93ZWQgYnkgYSBleHBsaWNpdCBDb250ZXh0LVN5bmNo
cm9uaXphdGlvbi1FdmVudCwgcGVyaGFwcwo+IGl0IGlzIGJldHRlciB0byBwbGFjZSBJU0IgYmVm
b3JlIGtwcm9iZSBCUksgaXMgd3JpdHRlbi4KPiAKPiA+IAo+ID4gKiBUaGF0IHRoZSBrcHJvYmUg
QlJLIHJlc3VsdHMgaW4gYW4gZXhjZXB0aW9uIChhbmQgY29uc2VxdWVudGx5IGEKPiA+ICAgQ29u
dGV4dC1TeW5jaHJvbm9pemF0aW9uLUV2ZW50KSwgd2hpY2ggZW5zdXJlcyB0aGF0IHRoZSBDUFUg
d2lsbCBmZXRjaCB0aGUKPiA+ICAgc2luZ2xlLXN0ZXAgc2xvdCBpbnN0cnVjdGlvbnMgKmFmdGVy
KiB0aGlzLCBlbnN1cmluZyB0aGF0IHRoZSBuZXcKPiA+ICAgaW5zdHJ1Y3Rpb25zIGFyZSB1c2Vk
Lgo+IAo+IFllcywgYmVjYXVzZSBvZiBzaW5nbGUtc3RlcCBzbG90IGlzIGluc3RhbGxlZCBpbnQg
dGhlIEJSSyBleGVjcHRpb24gaGFuZGxlciwKPiBzbyBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGdl
bmVyYXRlIENvbnRleHQtU3luY2hyb25pemF0aW9uLUV2ZW50IHZpYSBJU0IgbWVudGlvbmVkIGFi
b3ZlLi4uCgpDYW4geW91IHVwZGF0ZSB0aGUgcGF0Y2ggaW5jbHVkaW5nIGFib3ZlIGFzIGNvbW1l
bnRzIGluIHRoZSBjb2RlPwpNYXliZSB5b3UgYWxzbyBoYXZlIHRvIGVuc3VyZSBpdCBvbiBvdGhl
ciBwYXRjaGVzIHRvby4KClRoYW5rIHlvdSwKCj4gCj4gVGhhbmtzLgo+IAo+ID4gCj4gPiBJdCB3
b3VsZCBiZSBnb29kIGlmIHdlIGNvdWxkIGNhbGwgdGhhdCBvdXQgZXhwbGljaXRseS4KPiA+IAo+
ID4gVGhhbmtzLAo+ID4gTWFyay4KPiA+IAo+ID4+IFNpbmNlIEkgYW5kIEQgY2FjaGVzIGFyZSBj
b2hlcmVudCB3aXRoaW4gc2luZ2xlLXN0ZXAgc2xvdCBmcm9tCj4gPj4gYWFyY2g2NF9pbnNuX3Bh
dGNoX3RleHRfbm9zeW5jKCksIGhlbmNlIG5vIG5lZWQgdG8gZG8gaXQgYWdhaW4gdmlhCj4gPj4g
Zmx1c2hfaWNhY2hlX3JhbmdlKCkuCj4gPj4KPiA+PiBBY2tlZC1ieTogTWFzYW1pIEhpcmFtYXRz
dSAoR29vZ2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBMaWFv
IENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvYXJtNjQv
a2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCA3ICsrLS0tLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJv
YmVzL2twcm9iZXMuYwo+ID4+IGluZGV4IGQxZDE4MjMyMDI0NS4uMjliOThiYzEyODMzIDEwMDY0
NAo+ID4+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiA+PiArKysg
Yi9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gPj4gQEAgLTQ0LDEzICs0NCwx
MCBAQCBwb3N0X2twcm9iZV9oYW5kbGVyKHN0cnVjdCBrcHJvYmUgKiwgc3RydWN0IGtwcm9iZV9j
dGxibGsgKiwgc3RydWN0IHB0X3JlZ3MgKik7Cj4gPj4gIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBh
cmNoX3ByZXBhcmVfc3Nfc2xvdChzdHJ1Y3Qga3Byb2JlICpwKQo+ID4+ICB7Cj4gPj4gIAlrcHJv
YmVfb3Bjb2RlX3QgKmFkZHIgPSBwLT5haW5zbi5hcGkuaW5zbjsKPiA+PiAtCXZvaWQgKmFkZHJz
W10gPSB7YWRkciwgYWRkciArIDF9Owo+ID4+IC0JdTMyIGluc25zW10gPSB7cC0+b3Bjb2RlLCBC
Uks2NF9PUENPREVfS1BST0JFU19TU307Cj4gPj4gIAo+ID4+ICAJLyogcHJlcGFyZSBpbnNuIHNs
b3QgKi8KPiA+PiAtCWFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0KGFkZHJzLCBpbnNucywgMik7Cj4g
Pj4gLQo+ID4+IC0JZmx1c2hfaWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpYWRkciwgKHVpbnRwdHJf
dCkoYWRkciArIE1BWF9JTlNOX1NJWkUpKTsKPiA+PiArCWFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0
X25vc3luYyhhZGRyLCBwLT5vcGNvZGUpOwo+ID4+ICsJYWFyY2g2NF9pbnNuX3BhdGNoX3RleHRf
bm9zeW5jKGFkZHIgKyAxLCBCUks2NF9PUENPREVfS1BST0JFU19TUyk7Cj4gPj4gIAo+ID4+ICAJ
LyoKPiA+PiAgCSAqIE5lZWRzIHJlc3RvcmluZyBvZiByZXR1cm4gYWRkcmVzcyBhZnRlciBzdGVw
cGluZyB4b2wuCj4gPj4gLS0gCj4gPj4gMi4xNy4xCj4gPj4KPiA+IAo+ID4gLgo+IAo+IC0tIAo+
IEJSLAo+IExpYW8sIENoYW5nCgoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
