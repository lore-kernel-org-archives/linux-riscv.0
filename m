Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D394FE92703
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5h9ZSOsPjRFfb8bQD/t2/EM0IYUqWl576m+PgoTAdHM=; b=ooM7fS3nVghy9z
	q5/tmIEoj32Lm4X4budM5nhCk5kq+ZzpUbxvxxBq2eqj+c19QHyGR/oh5c9Zo/BPNUB4/w9YbsZ1Q
	ToUxWxeNGhof0iWYD5VKqk1VHdJri0ru+1G3KbrX9T3bnQ71kphKGzedqK/lt6Wnuyc/EQTmI+ahT
	2S6rVfSKJtGQOoh2tI8M3TYPSG+lvvVWr0XXOyLCD5kKZtmPPkVRmYCOdepPxZ0B52VgvyVKsF1//
	hHcKrX+asM6MmivF0eK3bw2ZKVYW2Q/XyPdSRfZTjz5d9Xi+gIx56HvPNNe9nzYX/R2DYmkt1ctmL
	FRJTxNngoPC3ya1J6lxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoPBx-003h4l-2K;
	Thu, 05 Oct 2023 14:19:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoPBs-003h3i-2I
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 14:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3BB4619D0;
	Thu,  5 Oct 2023 14:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E33CC43395;
	Thu,  5 Oct 2023 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696515539;
	bh=+5giS8dCDEB9SSIrIST7R8CXKZKXlmVab1T0e3RZ980=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZq+rtBHFgu7hUs9WU6oYZctlBrd8N8B6gpDD6vXr/eRZuuDq5yhSI/zvykHn5bDG
	 FxdBPitqVLrJMSY2mQ5UEB8SQR+q42ZA328/UwbpxuQg8xFE4s8cHoyPLZyCFlaJm2
	 T8oZPiVBbWLi7I528nPlTqYqOiYM4XSlFSJe6B5tMJpFlK9QpdxD+TldHQwf7bibC2
	 sU0eKnKWL9hjEdZ4CKwA+7bpCQwxA/GxAj6ro2nfoSowaAJb9MLyufNioMejjt0SV6
	 GvMsnjHqOYXyPXDbzQ4TO6ni2SPaiSB2w3FFb523TufPFH1DyA58ff5TAH+ONFDlVh
	 j/hSOIbqc4dUg==
Date: Thu, 5 Oct 2023 22:06:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] pwm: add T-HEAD PWM driver
Message-ID: <ZR7C+hrisF0lsAg1@xhacker>
References: <20231004092731.1362-1-jszhang@kernel.org>
 <20231004092731.1362-3-jszhang@kernel.org>
 <20231004140130.ljsfpn4axmsmszwm@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004140130.ljsfpn4axmsmszwm@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_071900_836987_AD4CB037 
X-CRM114-Status: GOOD (  25.60  )
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

T24gV2VkLCBPY3QgMDQsIDIwMjMgYXQgMDQ6MDE6MzBQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gT24gV2VkLCBPY3QgMDQsIDIwMjMgYXQgMDU6Mjc6MzFQTSArMDgwMCwgSmlz
aGVuZyBaaGFuZyB3cm90ZToKPiA+IFQtSEVBRCBTb0NzIHN1Y2ggYXMgdGhlIFRIMTUyMCBjb250
YWluIGEgUFdNIGNvbnRyb2xsZXIgdXNlZAo+ID4gdG8gY29udHJvbCB0aGUgTENEIGJhY2tsaWdo
dCwgZmFuIGFuZCBzbyBvbi4gQWRkIGRyaXZlciBmb3IgaXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+IC0tLQoKLi4uCgpIaSBV
d2UsCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3IGFuZCBuaWNlIHN1Z2dlc3Rpb25zLiB2
MyBoYXMgYmVlbiBzZW50IG91dC4KQW5kIEkgd2FudCB0byBhZGQgbW9yZSBjb21tZW50cyB0byB5
b3VyIHF1ZXN0aW9ucyBoZXJlLgoKPiA+ICsKPiA+ICtzdGF0aWMgaW50IHRoZWFkX3B3bV9hcHBs
eShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gPiArCQkJ
ICAgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCj4gPiArewo+ID4gKwlzdHJ1Y3QgdGhl
YWRfcHdtX2NoaXAgKnByaXYgPSB0aGVhZF9wd21fZnJvbV9jaGlwKGNoaXApOwo+ID4gKwl1NjQg
cGVyaW9kX2N5Y2xlLCBkdXR5X2N5Y2xlLCByYXRlOwo+ID4gKwl1MzIgdmFsOwo+ID4gKwo+ID4g
KwkvKiBpZiBldmVyIHN0YXJ0ZWQsIGNhbid0IGNoYW5nZSB0aGUgcG9sYXJpdHkgKi8KPiA+ICsJ
aWYgKHByaXYtPmV2ZXJfc3RhcnRlZCAmJiBzdGF0ZS0+cG9sYXJpdHkgIT0gcHdtLT5zdGF0ZS5w
b2xhcml0eSkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwoKVGhpcyBpcyB0aGUgcG9sb3JpdHkgY2hl
Y2tbMV0gZm9yIGV2ZXIgc3RhcnRlZCBjaGFubmVsLgoKPiA+ICsKPiA+ICsJaWYgKCFzdGF0ZS0+
ZW5hYmxlZCkgewo+ID4gKwkJaWYgKHB3bS0+c3RhdGUuZW5hYmxlZCkgewo+ID4gKwkJCXZhbCA9
IHJlYWRsKHByaXYtPm1taW9fYmFzZSArIFRIRUFEX1BXTV9DVFJMKHB3bS0+aHdwd20pKTsKPiA+
ICsJCQl2YWwgJj0gflRIRUFEX1BXTV9DRkdfVVBEQVRFOwo+ID4gKwkJCXdyaXRlbCh2YWwsIHBy
aXYtPm1taW9fYmFzZSArIFRIRUFEX1BXTV9DVFJMKHB3bS0+aHdwd20pKTsKPiA+ICsKPiA+ICsJ
CQl3cml0ZWwoMCwgcHJpdi0+bW1pb19iYXNlICsgVEhFQURfUFdNX0ZQKHB3bS0+aHdwd20pKTsK
PiA+ICsKPiA+ICsJCQl2YWwgfD0gVEhFQURfUFdNX0NGR19VUERBVEU7Cj4gPiArCQkJd3JpdGVs
KHZhbCwgcHJpdi0+bW1pb19iYXNlICsgVEhFQURfUFdNX0NUUkwocHdtLT5od3B3bSkpOwo+ID4g
KwkJfQo+ID4gKwkJcmV0dXJuIDA7Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYgKCFwd20tPnN0YXRl
LmVuYWJsZWQpCj4gPiArCQlwbV9ydW50aW1lX2dldF9zeW5jKGNoaXAtPmRldik7Cgo+IAo+IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoKSByZXR1cm5zIGFuIGludCB0aGF0IHlvdSBzaG91bGRuJ3QgaWdu
b3JlLgoKSW4gdjMgSSBzd2l0Y2ggdG8gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGJlY2F1
c2UgaXQgY2FuIHNpbXBsaWZ5CnRoZSBlcnJvciBoYW5kbGluZyBjb2RlLgoKPiAKPiA+ICsJdmFs
ID0gcmVhZGwocHJpdi0+bW1pb19iYXNlICsgVEhFQURfUFdNX0NUUkwocHdtLT5od3B3bSkpOwo+
ID4gKwl2YWwgJj0gflRIRUFEX1BXTV9DRkdfVVBEQVRFOwo+ID4gKwo+ID4gKwlpZiAoc3RhdGUt
PnBvbGFyaXR5ID09IFBXTV9QT0xBUklUWV9JTlZFUlNFRCkKPiA+ICsJCXZhbCAmPSB+VEhFQURf
UFdNX0ZQT1VUOwo+ID4gKwllbHNlCj4gPiArCQl2YWwgfD0gVEhFQURfUFdNX0ZQT1VUOwo+IAo+
IFdoYXQgaGFwcGVucyBoZXJlIGlmIHRoZSBib290bG9hZGVyIGFscmVhZHkgdG91Y2hlZCB0aGF0
IGZsYWc/IE9yIHRoZQo+IGRyaXZlciBpcyByZWxvYWRlZC9yZWJvdW5kPwoKT25seSBwb2xhcml0
eSBjYW4ndCBiZSBjaGFuZ2VkIG9uY2Ugc3RhcnRlZCwgc28gaWYgYm9vdGxvYWRlciBhbHJlYWR5
CmNvbmZpZ3VyZWQgcG9sYXJpdHkgYW5kIHN0YXJ0ZWQgdGhlIHB3bSBjaGFubmVsLCBhbmQgd2Ug
d2FudCB0byBjaGFuZ2UKdG8gYSBkaWZmZXJlbnQgcG9sYXJpdHksIHRoZSBjaGVja1sxXSBpbiB0
aGUgYmVnaW5uaW5nIG9mIHRoaXMgZnVuY3Rpb24Kd2lsbCBmYWlsIHNvIHJldHVybiAtRUlOVkFM
LgoKPiAKPiA+ICsJd3JpdGVsKHZhbCwgcHJpdi0+bW1pb19iYXNlICsgVEhFQURfUFdNX0NUUkwo
cHdtLT5od3B3bSkpOwo+ID4gKwo+ID4gKwlyYXRlID0gY2xrX2dldF9yYXRlKHByaXYtPmNsayk7
Cj4gPiArCS8qCj4gPiArCSAqIFRoZSBmb2xsb3dpbmcgY2FsY3VsYXRpb25zIG1pZ2h0IG92ZXJm
bG93IGlmIGNsayBpcyBiaWdnZXIKPiA+ICsJICogdGhhbiAxIEdIei4gSW4gcHJhY3Rpc2UgaXQn
cyAyNE1Ieiwgc28gdGhpcyBsaW1pdGF0aW9uCj4gPiArCSAqIGlzIG9ubHkgdGhlb3JldGljLgo+
ID4gKwkgKi8KPiA+ICsJaWYgKHJhdGUgPiAodTY0KU5TRUNfUEVSX1NFQykKPiAKPiB0aGlzIGNh
c3QgaXNuJ3QgbmVlZGVkLgo+IAo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiArCXBl
cmlvZF9jeWNsZSA9IG11bF91NjRfdTY0X2Rpdl91NjQocmF0ZSwgc3RhdGUtPnBlcmlvZCwgTlNF
Q19QRVJfU0VDKTsKPiA+ICsJaWYgKHBlcmlvZF9jeWNsZSA+IFRIRUFEX1BXTV9NQVhfUEVSSU9E
KQo+ID4gKwkJcGVyaW9kX2N5Y2xlID0gVEhFQURfUFdNX01BWF9QRVJJT0Q7Cj4gPiArCS8qCj4g
PiArCSAqIFdpdGggbGltaXRhdGlvbiBhYm92ZSB3ZSBoYXZlIHBlcmlvZF9jeWNsZSA8PSBUSEVB
RF9QV01fTUFYX1BFUklPRCwKPiA+ICsJICogc28gdGhpcyBjYW5ub3Qgb3ZlcmZsb3cuCj4gPiAr
CSAqLwo+ID4gKwl3cml0ZWwoKHUzMilwZXJpb2RfY3ljbGUsIHByaXYtPm1taW9fYmFzZSArIFRI
RUFEX1BXTV9QRVIocHdtLT5od3B3bSkpOwo+IAo+IFRoaXMgY2FzdCBjYW4gYWxzbyBiZSBkcm9w
cGVkLgo+IAo+ID4gKwo+ID4gKwlkdXR5X2N5Y2xlID0gbXVsX3U2NF91NjRfZGl2X3U2NChyYXRl
LCBzdGF0ZS0+ZHV0eV9jeWNsZSwgTlNFQ19QRVJfU0VDKTsKPiA+ICsJaWYgKGR1dHlfY3ljbGUg
PiBUSEVBRF9QV01fTUFYX0RVVFkpCj4gPiArCQlkdXR5X2N5Y2xlID0gVEhFQURfUFdNX01BWF9E
VVRZOwo+ID4gKwkvKgo+ID4gKwkgKiBXaXRoIGxpbWl0YXRpb24gYWJvdmUgd2UgaGF2ZSBkdXR5
X2N5Y2xlIDw9IFRIRUFEX1BXTV9NQVhfUEVSSU9ELAo+ID4gKwkgKiBzbyB0aGlzIGNhbm5vdCBv
dmVyZmxvdy4KPiA+ICsJICovCj4gPiArCXdyaXRlbCgodTMyKWR1dHlfY3ljbGUsIHByaXYtPm1t
aW9fYmFzZSArIFRIRUFEX1BXTV9GUChwd20tPmh3cHdtKSk7Cj4gCj4gLi4uCj4gCj4gPiArCj4g
PiArCXZhbCB8PSBUSEVBRF9QV01fQ0ZHX1VQREFURTsKPiA+ICsJd3JpdGVsKHZhbCwgcHJpdi0+
bW1pb19iYXNlICsgVEhFQURfUFdNX0NUUkwocHdtLT5od3B3bSkpOwo+ID4gKwo+ID4gKwlpZiAo
IXB3bS0+c3RhdGUuZW5hYmxlZCkgewo+ID4gKwkJdmFsIHw9IFRIRUFEX1BXTV9TVEFSVDsKPiA+
ICsJCXdyaXRlbCh2YWwsIHByaXYtPm1taW9fYmFzZSArIFRIRUFEX1BXTV9DVFJMKHB3bS0+aHdw
d20pKTsKPiA+ICsJCXByaXYtPmV2ZXJfc3RhcnRlZCA9IHRydWU7Cj4gPiArCX0KPiAKPiBGdXJ0
aGVyIGFib3ZlIHlvdSBjb25kaXRpb25hbGx5IGNhbGwgcG1fcnVudGltZV9nZXRfc3luYygpLCB0
aGVyZSBzaG91bGQKPiBiZSBhIG1hdGNoaW5nIHBtX3J1bnRpbWVfcHV0KCkuCgpJbiB2MywgSSBj
YWxsIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSB3aGVuIHB3bSBjaGFubmVsIGlzIGRpc2FibGVkLgoK
ClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
