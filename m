Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CEC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDBSRYlyOQTWxhtMcrIF/KAz4ZLs23Kh1/DvVZa8lgc=; b=dwtDENyqJntUR6
	P9d1imTK7yQlqq6gL8qSv0jmgghtUtBZwbgSWwKo2A+6Dic/TCEGUEOYe/sZcYEc2ncRwH9nBcvdl
	hvLjYbRuh+BVHbR2e2BRTcWZaiSD41S25GEfOzZzs2sQVMJYm7RREj/Vs4yEsyW+R2Aw6jVixkvtn
	ZIuxoApaGYVnCYdtgsMxCfcOUJTy0Pkh2YP4vJHNrX7kEHmB/mpVGeeIvAu05pbftu9Z9COfZI+T8
	K2cbW8OoTm6lrbOF2jVp+JtXbSJigga6RQePzx0HPLeZSedtp9TlIjquk6fDNSRQl214R2AF5NnJy
	48Koo4KIaTdp07wROScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrXw-00000007UIG-2Owb;
	Mon, 20 Jul 2026 17:12:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrXu-00000007UHi-1aIk
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 17:12:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8082942DAE;
	Mon, 20 Jul 2026 17:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B3C1F000E9;
	Mon, 20 Jul 2026 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784567569;
	bh=oJNfS8d+wz6ZwMhpRurQqnssE2zcvL/b/o4Ai+J3GrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c6PUV/3umndlldj6PU8H8U5Pza3QJ5cYCHJM/EgPWEFN+hY3MzkCJG0m92X2uL/Hu
	 z1r1I52zaz0lkYC+mmODg2tmSMUibs9RnxMnf+ggetKU6Eo8Yv2wFBgo7Xm0IDNgbt
	 RD7m7b4VWlIrKHJuaaT9GBOK5PJaPzpOT8Qxf4r4ZhDI/cLDwKT1USJRgOOdYDvQyD
	 x2re0svsspMf7/NKhB/nnf/ECutHRzKTkaagawaYiup7BsYda0WFYRbtnUs3ME4pap
	 n4d6Z614BaWJ17i5IQHyrjY22NW1Rta7BNWj2FjESYc2vkU8frzDpo9VOU29IhNnMv
	 2/B0cifWy2tgQ==
Date: Mon, 20 Jul 2026 10:12:47 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v5 4/8] riscv_cbqri: Add capacity controller
 probe and allocation device ops
Message-ID: <al5XD5UbluV_NyE3@thelio>
References: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
 <20260714-dfustini-atl-sc-cbqri-dt-v5-4-b0ae7e9c932e@kernel.org>
 <CAEEQ3w=9JKswTz9BcxXRvLh-kyN_Rdu3=YUR5Rey2J9UNyd0AA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=9JKswTz9BcxXRvLh-kyN_Rdu3=YUR5Rey2J9UNyd0AA@mail.gmail.com>
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMDg6MTI6MjhQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFdlZCwgSnVsIDE1LCAyMDI2IGF0IDg6MjTigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBSSVNDLVYgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlci4gQSBwbGF0Zm9ybSBkcml2
ZXIKPiA+IHBhc3NlcyBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBkZXNjcmlwdG9yIHRvZ2V0aGVy
IHdpdGggdGhlIGNhY2hlIGxldmVsCj4gPiB0byByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgp
LCB3aGljaCBwcm9iZXMgdGhlIGNvbnRyb2xsZXIgYW5kIGFkZHMgaXQKPiA+IHRvIHRoZSBjb250
cm9sbGVyIGxpc3QuCj4gPgo+ID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTgK
PiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJy
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJh
eWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwo+ID4gIGRyaXZlcnMvcmVzY3RybC9LY29uZmlnICAgICAgICAgIHwgIDEzICsKPiA+ICBk
cml2ZXJzL3Jlc2N0cmwvTWFrZWZpbGUgICAgICAgICB8ICAgMyArCj4gPiAgZHJpdmVycy9yZXNj
dHJsL2NicXJpX2RldmljZXMuYyAgfCA1NjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgZHJpdmVycy9yZXNjdHJsL2NicXJpX2ludGVybmFsLmggfCAxMjIgKysr
KysrKysrCj4gPiAgaW5jbHVkZS9saW51eC9yaXNjdl9jYnFyaS5oICAgICAgfCAgNDUgKysrKwo+
ID4gIDYgZmlsZXMgY2hhbmdlZCwgNzQ5IGluc2VydGlvbnMoKykKWy4uXQo+ID4gK3N0YXRpYyBp
bnQgY2JxcmlfcHJvYmVfY2Moc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmN0cmwpCj4gPiArewo+
ID4gKyAgICAgICBpbnQgZXJyLCBzdGF0dXM7Cj4gPiArICAgICAgIGludCB2ZXJfbWFqb3IsIHZl
cl9taW5vcjsKPiA+ICsgICAgICAgdTY0IHJlZzsKPiA+ICsKPiA+ICsgICAgICAgcmVnID0gY2Jx
cmlfcmVhZHEoY3RybC0+YmFzZSArIENCUVJJX0NDX0NBUEFCSUxJVElFU19PRkYpOwo+ID4gKyAg
ICAgICBpZiAocmVnID09IDApCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4g
PiArCj4gPiArICAgICAgIHZlcl9taW5vciA9IEZJRUxEX0dFVChDQlFSSV9DQ19DQVBBQklMSVRJ
RVNfVkVSX01JTk9SX01BU0ssIHJlZyk7Cj4gPiArICAgICAgIHZlcl9tYWpvciA9IEZJRUxEX0dF
VChDQlFSSV9DQ19DQVBBQklMSVRJRVNfVkVSX01BSk9SX01BU0ssIHJlZyk7Cj4gPiArICAgICAg
IGN0cmwtPmNjLm5jYmxrcyA9IEZJRUxEX0dFVChDQlFSSV9DQ19DQVBBQklMSVRJRVNfTkNCTEtT
X01BU0ssIHJlZyk7Cj4gPiArCj4gPiArICAgICAgIHByX2RlYnVnKCJ2ZXJzaW9uPSVkLiVkIG5j
Ymxrcz0lZCBjYWNoZV9sZXZlbD0lZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgdmVyX21ham9y
LCB2ZXJfbWlub3IsCj4gPiArICAgICAgICAgICAgICAgIGN0cmwtPmNjLm5jYmxrcywgY3RybC0+
Y2FjaGUuY2FjaGVfbGV2ZWwpOwo+ID4gKwo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBO
Q0JMS1MgPT0gMCB3b3VsZCBkaXZpZGUtYnktemVybyBpbiB0aGUgc2NoZW1hdGEgbWF0aCB3aGls
ZQo+ID4gKyAgICAgICAgKiBjdHJsLT5sb2NrIGlzIGhlbGQuCj4gPiArICAgICAgICAqLwo+ID4g
KyAgICAgICBpZiAoIWN0cmwtPmNjLm5jYmxrcykgewo+ID4gKyAgICAgICAgICAgICAgIHByX3dh
cm4oIkNDIGF0ICVwYSBoYXMgMCBjYXBhY2l0eSBibG9ja3MsIHNraXBwaW5nXG4iLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgJmN0cmwtPmFkZHIpOwo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PREVWOwo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIGlmIChjdHJsLT5j
Yy5uY2Jsa3MgPiAzMikgewo+ID4gKyAgICAgICAgICAgICAgIHByX3dhcm4oIkNDIGF0ICVwYSBo
YXMgbmNibGtzPSV1ID4gMzIgKHJlc2N0cmwgQ0JNIGlzIHUzMiksIHNraXBwaW5nXG4iLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgJmN0cmwtPmFkZHIsIGN0cmwtPmNjLm5jYmxrcyk7Cj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiArICAgICAgIH0KPiAKPiBDb3Vs
ZCB5b3UgYWRkIGEgc2hvcnQgY29tbWVudCBoZXJlLCBsaWtlIE1QQU0gZG9lcywgdG8gbm90ZSB0
aGF0IHRoZQo+IE5DQkxLUyA8PSAzMiBsaW1pdCBjb21lcyBmcm9tIHJlc2N0cmwgdXNpbmcgdTMy
IGJpdG1hcCBjb25maWdzPwoKU3VyZSwgSSB3aWxsIGFkZCBhIGNvbW1lbnQgdGhhdCB0aGUgbGlt
aXQgY29tZXMgZnJvbSByZXNjdHJsCnJlcHJlc2VudGluZyB0aGUgQ0JNIGFzIGEgdTMyLgoKVGhh
bmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
