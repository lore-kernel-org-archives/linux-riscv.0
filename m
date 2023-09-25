Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2875BCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmxf3XGQOEPpw1+KQVytED2/UoeQbAuWhLZCjbcCgyA=; b=oranjPqxbGAJgA
	AiMWt+l5wlQKWWuvu0KIbtgj+wh0FX+vKJM7Gc8b6NjDsQTIrtL4Axnsb2PHDQXfPp67i+cJ0e5mZ
	8FANIlTP4yceAPLK2JCMP9w8fhsS4FnoGmfEYz6K6iNH+S4s+sHCsqA26pXY0Y2eTQzyAs//mPge2
	e6D3RZ2K9Qka7ThzUhDywW0BTuEI50kiIIQE3j40MO9+98J/qsLXw+QvU3pthsOh3FfJmgQOLGfRX
	w7los6s7TqxYvy43qYPXvecE0XUX8HK8pB2HHkQNP2NWdRItCuyGJwhm3v3xBYEKQHODQgeawXa/a
	hAHAjYs+Oe0xMc/B1e8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkisr-00Dyk6-0m;
	Mon, 25 Sep 2023 10:32:09 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkisp-00Dyj0-0y
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 10:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695637927; x=1727173927;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G7gQNM2ETXkwxgbdw0M0S6loHs2HYqulZXnsb3ikQcU=;
  b=g/pAytomZu80nOadV3UW0TUhikPhzOJbdZDdnwXhuLDwYlQFdKw5yrrO
   LnGZ+1WWxN8nJDIFx8+7Tnqx+8+o/IfunA32KuR3856Lg61zZLl+YpKrj
   GWvskyc1/iq1bVYDRdPOouoZxcKkq6MIPIPnisL1CCo/w7pXYHp0nJt9j
   yiDw1tE+kRr47aQa1GazaOR7FhEa/u16CbHHgoalCtDMSOiYp+HhMHv5w
   poPK4NW8Hj302XpSMtZaIDF4zTEgk9Uh03qWvNr+5uwmXNAQYdzOCpeR8
   /L0BQAp6SyGuHDYdchy1GRkfJ5Lg6ofBh5sNBAK/+/8dRS1Z7rsIl90WJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361473798"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="361473798"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 03:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="818562298"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="818562298"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.50.180])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 03:31:59 -0700
Message-ID: <30f4276b-5e29-4a7a-9b4c-6bab505984ab@intel.com>
Date: Mon, 25 Sep 2023 13:31:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mmc: sdhci: add __sdhci_execute_tuning() to header
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, Drew Fustini <dfustini@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-2-49f76c274fb3@baylibre.com>
 <4ef60ffd-3661-4bca-91a3-b49d6189c71b@intel.com>
 <aeb2cc43ea4e5281195c8bccd1f033ed73e6a7ef.camel@xry111.site>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <aeb2cc43ea4e5281195c8bccd1f033ed73e6a7ef.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_033207_351544_82AA47B2 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjUvMDkvMjMgMTM6MjMsIFhpIFJ1b3lhbyB3cm90ZToKPiBPbiBNb24sIDIwMjMtMDktMjUg
YXQgMTM6MjEgKzAzMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+IE9uIDIyLzA5LzIzIDA0OjQ5
LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4+PiBFeHBvc2UgX19zZGhjaV9leGVjdXRlX3R1bmluZygp
IHNvIHRoYXQgaXQgY2FuIGJlIGNhbGxlZCBmcm9tIHRoZQo+Pj4gbW1jIGhvc3QgY29udHJvbGxl
ciBkcml2ZXJzLgo+Pj4KPj4+IEluIHRoZSBzZGhjaS1vZi1kd2Ntc2hjIGRyaXZlciwgc2RoY2lf
ZHdjbXNoY190aDE1MjBfb3BzIHNldHMKPj4+IHBsYXRmb3JtX2V4ZWN1dGVfdHVuaW5nIHRvIHRo
MTUyMF9leGVjdXRlX3R1bmluZygpLiBUaGF0IGZ1bmN0aW9uIGhhcwo+Pj4gdG8gbWFuaXB1bGF0
ZSBwaHkgcmVnaXN0ZXJzIGJlZm9yZSB0dW5pbmcgY2FuIGJlIHBlcmZvcm1lZC4gVG8gYXZvaWQK
Pj4+IGNvcHlpbmcgdGhlIGNvZGUgdmVyYmF0aW0gZnJvbSBfX3NkaGNpX2V4ZWN1dGVfdHVuaW5n
KCkgaW50bwo+Pj4gdGgxNTIwX2V4ZWN1dGVfdHVuaW5nKCksIG1ha2UgaXQgcG9zc2libGUgZm9y
IF9fc2RoY2lfZXhlY3V0ZV90dW5pbmcoKQo+Pj4gdG8gYmUgY2FsbGVkIGZyb20gc2RoY2ktb2Yt
ZHdjbXNoYy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQGJh
eWxpYnJlLmNvbT4KPj4+IC0tLQo+Pj4gwqBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLmMgfCAyICst
Cj4+PiDCoGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2kuaCB8IDEgKwo+Pj4gwqAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21tYy9ob3N0L3NkaGNpLmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLmMKPj4+IGlu
ZGV4IGZmNDFhYTU2NTY0ZS4uZmQ2MDcwNThkMTc2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9t
bWMvaG9zdC9zZGhjaS5jCj4+PiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLmMKPj4+IEBA
IC0yODQxLDcgKzI4NDEsNyBAQCB2b2lkIHNkaGNpX3NlbmRfdHVuaW5nKHN0cnVjdCBzZGhjaV9o
b3N0ICpob3N0LCB1MzIgb3Bjb2RlKQo+Pj4gwqB9Cj4+PiDCoEVYUE9SVF9TWU1CT0xfR1BMKHNk
aGNpX3NlbmRfdHVuaW5nKTsKPj4+IMKgCj4+PiAtc3RhdGljIGludCBfX3NkaGNpX2V4ZWN1dGVf
dHVuaW5nKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgb3Bjb2RlKQo+Pj4gK2ludCBfX3Nk
aGNpX2V4ZWN1dGVfdHVuaW5nKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgb3Bjb2RlKQo+
Pgo+PiBBbHNvIG5lZWQKPj4gCUVYUE9SVF9TWU1CT0xfR1BMKF9fc2RoY2lfZXhlY3V0ZV90dW5p
bmcpOwo+Pgo+Pj4gwqB7Cj4+PiDCoAlpbnQgaTsKPiAKPiBCeSB0aGUgd2F5IHNob3VsZCB3ZSBy
ZW5hbWUgdGhpcyBmdW5jdGlvbj8gIEkgdGhpbmsKPiAiX19zZGhjaV9leGVjdXRlX3R1bmluZyIg
dnMgInNkaGNpX2V4ZWN1dGVfdHVuaW5nIiBtaWdodCBiZSBjb25mdXNpbmcKPiB3aGVuIHdlIGV4
cG9ydCBib3RoLgo+IAoKJ25hbWUoKScgYW5kICdfX25hbWUoKScgaXMgbm90IGEgcGFydGljdWxh
cmx5IHJhcmUgcGFyYWRpZ20gaW4gdGhlIGtlcm5lbCwKc28gaXQgc2VlbXMgb2suCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
