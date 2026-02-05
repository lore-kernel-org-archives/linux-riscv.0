Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75541E91266
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 06:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2249XOe9j9/UWwhN8Zoy6R2Gt19a7a/uKcp+HCAQdY=; b=NnbfhbGDD/yyob
	IrBBAixWukU6g3XQF9uGjomm/51csrXRB3bjT9HontiskMHFhx8mIgzwfFJrnGa1fKzdLihmegdk2
	VzVviTVUnUbKUUqTKQcadbMBIXmEo6Vp1NE8WJrc0D5k2jKPsJPRZtcp0AvSXFKixKrvcDuO6MwAO
	1Z/YcRpmQD8u0+t6YTu1MjyDdLwg5OdjwALXRPHu3dfbK3fGhj4YTsH4l10ISk/Vm76x3ZLMHqJRZ
	MPRIJc466PLoPlt6dfXSMvqdi1pGKhZlL+Utm/ZDeljeU4l4v72q6OG1Ep18sgREjxZldjDOArd2Y
	Ziox35qcE0j/qMCnIlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsbG-00000009VA5-0NZN;
	Thu, 05 Feb 2026 06:12:22 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsbC-00000009V8r-0rZW
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 06:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770271914;
	bh=tDgt6vZpYx+8Gxn4WiLvnLAeS2beozPCKmdyy780RYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=xUGscN53mHEDl3yC3r+TmbaLbq0Wz/U52w7ruz0VsD5ArhG8XFRk88CWhXKbsabsr
	 qKkAQAJXr7YqIJJvw/IB1VCV08hat8gvsJZGvnXFSccsnPiwV/C7z8ZOTmtuO/Vbr3
	 WkFY8vsjCoD4JTfg06xuJocwhNGpE/DMOTrss7t0=
X-QQ-mid: zesmtpsz3t1770271912t7844f74a
X-QQ-Originating-IP: sH+CVXzMSrAXjiTiHvm7S7Z4jmFxT90oqobPcqXkkTs=
Received: from [10.3.91.191] ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Feb 2026 14:11:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6470129798004699414
Message-ID: <6C65A3873186B07C+29da5dbd-ed27-4ace-a5ca-355b3983d60c@linux.spacemit.com>
Date: Thu, 5 Feb 2026 14:11:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance
 monitoring
To: Zong Li <zong.li@sifive.com>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
 <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
 <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MTI/6z+04aqCmKtOooE8Ec8p6bzHjOcrb9ijGprdxfZjLV+1DnWF1w6F
	KgSdvHq29w6GBLYtahni+uA0YOQl1KnLM5xYcU7YPiUANN782jlv+Fawbw/Y/eV1lq20GHH
	paJ/jE2nX/3tfa1R6XUTleXCK1sF8LERhvx0B+lTrEjzHhBF9kQoRxfgcL8+etiP0UcOYSX
	l8N0s9qU/WI5vQb5PlWc4nFT8wht06g9hvYN2C3QivJSBTRdj7ouISlvnvRI9rYmjvl7lX1
	FwfoxUeNSKouIHNvjexGVQJO+jmOXgTCU5MVD5G17AbbB3/9tFS1LP6WiXhsz4XuDWoz9cI
	/pk0m4ivI2UkcbMRX7o6rxgUeG5Vh/vc4TsygpKU/Ypw2R/ufu5CXwvLrJtb/RatOxDeEzN
	CSFHbauT/5tU0JI0NpdFDixI/+dqZCUhVfCnRVSypgksvICptFbWp7j0WrRBdAYr3GfrH7r
	8/SbLin974hlZGtQH1rvh/hOQEsyi93hkO8fR9tHWplLzx7RLWmkkWuiTZcSK1tQXyOw7ay
	S+M9AFp7+Go49KU0/pwWOHGjhaiSp85lE5YKhbkQa5kHfigzFPC7Q6xut1lyTcF37eUQVk5
	oYKDs8vtB8qBcfL6Yti05CE4CTizojkWIYNNIsG5BV8ArDnqXO2p63RIQ6LEAuD1Cjcv7Uc
	bvedWzwtLodcxAS2Bt0e46pTZxWfYvZL8T0EicIKP4MTimCUGjJkGZ3ELZU/yFLl1nGvptE
	3lT8t2qAZGkWrFM2nGh6eeSgESZfx6CGveKJSggD5nuBBW/6RBWH/OSW6w78D2zSZsgoay4
	WC0JiAujUnGV/LksKQ+Ce7aQM9225H4KBE8Po+vrnXPOKNjHKbexFM6qKe+ONblLTgqhVqZ
	atZ0vUCljpERjslYGBHHAwfCbKTFWKzkGHHRQ83wOtzDB4Hj3E3MqXX/QLdn1vn4YylYQKP
	8FGHIK+CwnKgO5abEm68MdxIafphY2UGxGLv1B4TuHSM0of+7I3tMKJGVeMZK6VW2abGq/D
	teQc+xKj+ED3h2RyZ1P2DigPuqNZbXAa2COUuBg7v7UyzS98ZD
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_221219_026020_75892242 
X-CRM114-Status: GOOD (  23.62  )
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

T24gMi81LzIwMjYgMTE6NDcgQU0sIFpvbmcgTGkgd3JvdGU6Cj4gT24gVGh1LCBGZWIgNSwgMjAy
NiBhdCAxMTozNeKAr0FNIEx2IFpoZW5nIDxsdi56aGVuZ0BsaW51eC5zcGFjZW1pdC5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyLzUvMjAyNiAyOjM5IEFNLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBI
b3cgZG9lcyB0aGlzIHJlbGF0ZSB0bwo+Pj4KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDExNTAzMDMwNi4yOTczNS0xLXpvbmcubGlAc2lmaXZlLmNvbS8KPj4+Cj4+PiAgIEZy
b20gYSBxdWljayBza2ltIGl0IGxvb2tzIGxpa2UgdGhlcmUncyBwbGVudHkgb2Ygb3ZlcmxhcC4K
Pj4KPj4gV2UgZGV2ZWxvcGVkIHRoZSBkcml2ZXIgaW4gMjAyNCBhbmQgZGVtb25zdHJhdGVkIGl0
IGluIENoaW5hIHN1bW1pdC4gV2UKPj4gZGlkbid0IG5vdGljZSB0aGF0IGEgcGF0Y2ggaXMgb24t
Z29pbmcgbm93IGluIHRoZSBjb21tdW5pdHkuCj4+Cj4+IE5vdyBpdCBsb29rcyBvdXIgYXBwcm9h
Y2ggc29sdmVkIG1vcmUgaXNzdWVzLCBhbmQgd2UnbGwgY2hlY2sgYW5kIHVwZGF0ZQo+PiBpZiB0
aGVyZSBhcmUgYW55IGNvbW11bml0eSBjb25jZXJucyBzdGlsbCBub3QgYWRkcmVzc2VkIGluIHRo
aXMgcGF0Y2hzZXQuCj4+Cj4+IFdlIGNhbiBhZGQgUmV2aWV3ZWQtYnkvVGVzdGVkLWJ5IGFuZCBT
aWduZWQtb2ZmLWJ5IG9mIFpvbmcgTGkgdG8gdGhpcwo+PiBwYXRjaCBpZiBoZSB3aXNoZXMuCj4+
Cj4+IFRoYW5rcywKPj4gTHYKPj4KPiAKPiBQZXJoYXBzIEkgY2FuIGZpcnN0IHBvc3QgbXkgbmV4
dCByZXZpc2lvbiB0byB0aGUgbWFpbGluZyBsaXN0IChob3BlIGl0Cj4gd29uJ3Qgd2FzdGUgdGhl
IGNvbW11bml0eSByZXNvdXJjZSksIHNvIHRoYXQgeW91IGNvdWxkIGhhdmUgYSBjaGFuY2UKPiB0
byByZXZpZXcgaXQgYW5kIHNlZSB3aGV0aGVyIHRoYXQgdmVyc2lvbiBpcyBhcmNoaXRlY3R1cmFs
bHkgY2xvc2VyIHRvCj4gd2hhdCB0aGUgY29tbXVuaXR5IGlzIGxvb2tpbmcgZm9yLCB3aGlsZSBh
bHNvIGFkZHJlc3NpbmcgeW91ciBpc3N1ZS4KPiBJZiB5b3UgYWxzbyBmZWVsIHRoYXQgbXkgbmV4
dCByZXZpc2lvbiBtZWV0cyB5b3VyIG5lZWRzLCBwZXJoYXBzIHlvdQo+IGNvdWxkIGFwcGVuZCB5
b3VyIGFkZGl0aW9uYWwgaW1wbGVtZW50YXRpb25zIG9uIHRvcCBvZiBpdC4KPgoKSXQgc2VlbXMg
d2UgYWxsIGNvbXBvc2VkIHRoZSBSSVNDLVYgaW9tbXUgSFBNIHN1cHBvcnQgYnkgcmVmZXJlbmNp
bmcgCmRyaXZlcnMvcGVyZi9hcm1fc21tdXYzX3BtdS4KClJvYmluJ3MgY29tbWVudHMgc2hvdWxk
IGFsbCBiZSBhZGRyZXNzZWQgSU1ITy4KCj4gT2YgY291cnNlLCBpZiB0aGUgY29tbXVuaXR5IHdv
dWxkIHByZWZlciB0byBnbyB5b3VyIHZlcnNpb24sIEnigJltCj4gcGVyZmVjdGx5IGZpbmUgd2l0
aCB0aGF0IGFzIHdlbGwuCgpPSy4gSWYgd2Ugc2VuZCBhIG5leHQgdmVyc2lvbiwgd2Ugd2lsbCBh
ZGQgeW91ciBTT0IgYW5kIHBsZWFzZSBoZWxwIHRvIApyZXZpZXcgYW5kIHRlc3QuCgpUaGFua3Mg
aW4gYWR2YW5jZSwKTHYKCj4gCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gZHJldwo+Pj4KPj4+Cj4+PiBP
biBXZWQsIEZlYiAwNCwgMjAyNiBhdCAwNTowOTowMVBNICswODAwLCBMdiBaaGVuZyB3cm90ZToK
Pj4+PiBGcm9tOiBKaW5neXUgTGkgPGpvZXkubGlAc3BhY2VtaXQuY29tPgo+Pj4+Cj4+Pj4gSW50
cm9kdWNlcyBwZXJmLWJhc2VkIEhQTSBkcml2ZXIgZm9yIFJJU0MtViBJT01NVSwgZW5hYmxpbmcg
cGVyZm9ybWFuY2UKPj4+PiBtb25pdG9yaW5nIGNhcGFiaWxpdGllcy4KPj4+Pgo+Pj4+IE5vdGUg
dGhhdCB0aGUgUklTQy1WIElPTU1VIEhQTSBtb2R1bGUgdXNlcyBDT1VOVEVSX01BWC0xIGFzIGEg
c3RhdGljCj4+Pj4gY291bnRlciBpbmRleCBvZiBIUE1DWUNMRVMsIGFuZCAwfkNPVU5URVJfTUFY
LTIgYXMgdGhlIGR5bmFtaWMgY291bnRlcgo+Pj4+IGluZGV4ZXMgb2Ygb3RoZXIgSFBNRVZFTlRT
IGluIG9yZGVyIHRvIGNvcnJlY3RseSBpbmRleCBpbnRvIElPSFBNRVZUIGFuZAo+Pj4+IElPSFBN
Q1RSIHJlZ2lzdGVycyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIGRlZmluZWQgaW4gdGhlIGlvbW11
LWJpdHMuaC4KPj4+PiBIb3dldmVyIHRoZSB1c2VycyB0cmVhdCAwIGFzIHRoZSBpbmRleCBvZiBI
UE1DWUNMRVMgYW5kIDF+Q09VTlRFUl9NQVgtMSBhcwo+Pj4+IHRoZSBpbmRleGVzIG9mIG90aGVy
IEhQTUVWRU5UUywgdGh1cyBjYXJlIHNob3VsZCBiZSB0YWtlbiBpbiBkZWFsaW5nIHdpdGgKPj4+
PiBjb3VudGVyIGluZGV4ZXMgYmV0d2VlbiB1c2Vyc3BhY2UgYW5kIGtlcm5lbCBzcGFjZS4KPj4+
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEppbmd5dSBMaSA8am9leS5saUBzcGFjZW1pdC5jb20+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogTHYgWmhlbmcgPGx2LnpoZW5nQGxpbnV4LnNwYWNlbWl0LmNvbT4K
Pj4+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1pb21tdQo+
Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZyAgICAgICAgICB8ICAg
OSArCj4+Pj4gICAgZHJpdmVycy9pb21tdS9yaXNjdi9NYWtlZmlsZSAgICAgICAgIHwgICAxICsK
Pj4+PiAgICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaCAgICAgfCAgIDYgKwo+Pj4+
ICAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtaHBtLmMgICAgICB8IDg0MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+PiAgICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5j
ICAgICAgfCAgMTMgKy0KPj4+PiAgICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3Jt
LmMgfCAgIDggKy0KPj4+PiAgICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmggICAgICAgICAg
fCAgNDIgKysKPj4+PiAgICA3IGZpbGVzIGNoYW5nZWQsIDkxOSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LWhwbS5jCj4+Pj4KPj4+Cj4+Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
