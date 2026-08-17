Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC750C5DF66
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV+2nLGnC79Z4A3cK99DsLncsJuOYkvBuHVnkIWVSTM=; b=wwDVyi3soY/L9I
	0UHAdcAeyy+KoOhEUqtuC/vxW7JZNix9+Zs0EQZ96chsOKdnYfcDO4ZrrT/w8wurRNaHX0Oo07Hcy
	ViuFY9aQWoff9ICFDT6x6Wy/OEnb9UiaI3NDDqxFP0Er9FLZqJCuF08J8ffwLfWNm4ekxwhwAacfx
	XfMOpCA2JZEAvVsI2EwwHpJJnQzRbtW9zCiWdikVVSs2YI1mMXstAhDPu1k42ECSlBQm49UGq2wHf
	wNGj+RXMQubyVLcTzF+fsZ5ObYjjiod8rYNcA076n1kmiHn59cE1m0QmY/Afm55O1+It9uA1pVkuj
	nhKPeqwn1FnCs90Fdfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyEZ-00000006HyK-1oKC;
	Mon, 17 Aug 2026 14:22:39 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyEX-00000006Hx9-0qqW
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:22:38 +0000
Received: from bat.kanata.rendec.net (unknown [72.143.213.121])
	by mail.mindbit.ro (Postfix) with ESMTPSA id A6D7DC2DC3;
	Mon, 17 Aug 2026 17:22:26 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro A6D7DC2DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786976552;
	bh=x870GT5Ttl54hOQSXtF0U2TrjP06S5Unm7xPT+iv8sY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NHP3Hkzv3KLtoD51h0fVopqZjUy59iLvZIfmxkLYllog3zGe5FM5xP4nTkwMCWEAt
	 D38MpEPfKKMY/ButVIL6fjF2wT4ywuwjicSebga6jWW6rr89mXxk6lYsINCLGMHEcR
	 ZSmrNRJAiBGrd+G8ytcerFwKiZQk5bv8KVQn7W1AKcHCE4b1iGtOnTLxeOpufifV/b
	 w5AFd5RSQ4FTZp0bZeh1exz3sd/RCDg1sP0PmjOTkoGebzhJ0ZgtNhyMWf+zx5v+1d
	 c/Vlw8l5/Gl0kKP1bUEKL2VhI7kz3xi/pN4iBVMKJmy9E1nZEiN4Sie4Kswh9tvBkw
	 GfQkWOg+NV6JQ==
Message-ID: <e93252804d854c1fd8bf5ef616fb06110da94e34.camel@rendec.net>
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 	tglx@kernel.org, daniel.lezcano@kernel.org,
 anup@brainfault.org, 	hui.wang@canonical.com, samuel.holland@sifive.com
Date: Mon, 17 Aug 2026 10:22:20 -0400
In-Reply-To: <20260816070049.2097442-2-guoren@kernel.org>
References: <20260816070049.2097442-1-guoren@kernel.org>
	 <20260816070049.2097442-2-guoren@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_072237_413011_8B8BE0FD 
X-CRM114-Status: GOOD (  11.15  )
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

T24gU3VuLCAyMDI2LTA4LTE2IGF0IDA3OjAwICswMDAwLCBHdW8gUmVuIHdyb3RlOgo+IEZyb206
ICJHVU8gUmVuIChYdWFuVGllKSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+IAo+IFRoZSBJUEkgbWVz
c2FnZSB0eXBlIGVudW1lcmF0aW9uIChhbmQgdGhlcmVmb3JlIElQSV9NQVgpIGlzIGN1cnJlbnRs
eQo+IHByaXZhdGUgdG8gYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMuwqAgU2V2ZXJhbCBJUEkgcHJv
dmlkZXJzIG5lZWQgdG8ga25vdwo+IHRoZSBleGFjdCBudW1iZXIgb2YgSVBJcyB0aGF0IHRoZSBh
cmNoaXRlY3R1cmUgcmVxdWlyZXMsIHNvIG1vdmUgdGhlCj4gZW51bSBpbnRvIHRoZSBwdWJsaWMg
aGVhZGVyLgo+IAo+IFRoaXMgaXMgYSBwdXJlIGNvZGUgbW92ZW1lbnQgd2l0aCBubyBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oIHwgMTIg
KysrKysrKysrKysrCj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9zbXAuY8KgwqDCoMKgwqAgfCAxMiAt
LS0tLS0tLS0tLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc21wLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oCj4gaW5kZXggMGVjYzY3NjQxYjA5Li5iZWQz
OWZmZjFmOGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zbXAuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc21wLmgKPiBAQCAtMTUsNiArMTUsMTggQEAKPiDC
oHN0cnVjdCBzZXFfZmlsZTsKPiDCoGV4dGVybiB1bnNpZ25lZCBsb25nIGJvb3RfY3B1X2hhcnRp
ZDsKPiDCoAo+ICtlbnVtIGlwaV9tZXNzYWdlX3R5cGUgewo+ICsJSVBJX1JFU0NIRURVTEUsCj4g
KwlJUElfQ0FMTF9GVU5DLAo+ICsJSVBJX0NQVV9TVE9QLAo+ICsJSVBJX0NQVV9DUkFTSF9TVE9Q
LAo+ICsJSVBJX0lSUV9XT1JLLAo+ICsJSVBJX1RJTUVSLAo+ICsJSVBJX0NQVV9CQUNLVFJBQ0Us
Cj4gKwlJUElfS0dEQl9ST1VORFVQLAo+ICsJSVBJX01BWAo+ICt9Owo+ICsKPiDCoCNpZmRlZiBD
T05GSUdfU01QCj4gwqAKPiDCoCNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMK
PiBpbmRleCBmYTY2ZjljOTdkNzQuLjg5MzBiNjJiMTVlNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXAuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gQEAgLTI4
LDE4ICsyOCw2IEBACj4gwqAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiDCoCNpbmNsdWRl
IDxhc20vY3B1X29wcy5oPgo+IMKgCj4gLWVudW0gaXBpX21lc3NhZ2VfdHlwZSB7Cj4gLQlJUElf
UkVTQ0hFRFVMRSwKPiAtCUlQSV9DQUxMX0ZVTkMsCj4gLQlJUElfQ1BVX1NUT1AsCj4gLQlJUElf
Q1BVX0NSQVNIX1NUT1AsCj4gLQlJUElfSVJRX1dPUkssCj4gLQlJUElfVElNRVIsCj4gLQlJUElf
Q1BVX0JBQ0tUUkFDRSwKPiAtCUlQSV9LR0RCX1JPVU5EVVAsCj4gLQlJUElfTUFYCj4gLX07Cj4g
LQo+IMKgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBpcGlfbmFtZXNbXSA9IHsKPiDCoAlbSVBJ
X1JFU0NIRURVTEVdCT0gIlJlc2NoZWR1bGluZyBpbnRlcnJ1cHRzIiwKPiDCoAlbSVBJX0NBTExf
RlVOQ10JCT0gIkZ1bmN0aW9uIGNhbGwgaW50ZXJydXB0cyIsCgpSZXZpZXdlZC1ieTogUmFkdSBS
ZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
