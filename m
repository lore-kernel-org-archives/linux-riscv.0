Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF0C7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZS3IVdnfAqYt1E2sxXEweHGocUHN4g/hY4ZKYQwkO4=; b=lla6DH0Dl3jzKu
	ffE6RBvhWqEehCOUxqQ3PUrVsUG0ccOrGFVNwLqMDJ+D1qNi1/cDNlMI4X7TVmChnCINcCVlu3fmc
	9kg+N5pN04kOaRW5y7rNSfr0dpiDkyjK9JS2cAUYPF1rBz5oftiWkc6Sx8Hz+AbozcPS4PXGYaHJ4
	ra6N9UHt6jcEZtYTt0JYmIoMl9lEWSwqG5x/XlZk2rZ6CbIkmmUFDPEVvdga4BBxwpSX8e6Mr1ij3
	3Pr7HMSVSSzpetxbqvfZGtGnNUmyfw4o9m9Jw78Sp+HZzKXm/9TOKD6MGZuoi5JYWIokskRMlyBY/
	UkTP5Gi8vBqaeS9gyhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11ql-005sOo-1v;
	Mon, 22 May 2023 09:29:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11qh-005sNN-1w
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 09:29:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso9215265e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684747740; x=1687339740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbRctGRE7eKmFRGiu9scZucTz/1JLIZAWb6EIwSTZ8A=;
        b=NBvRp1VnygTGXUies8xebuLa/wxt3t2h4MpeIrZq+v37W7THUyPWgPtvMtmDvtJiyu
         tZPYipkeHi7U434tvDA/rN5srDlpqGVWNVvu9exTf1K69xmKEbqk8Guru5U89p53Gpdi
         UCx2Wc3AgBc4ZPzWMmD9VDxT6lzO0ULuGFw7i2r/StGvSmtIwiTsCKQKtnGCcowUfjZh
         VqyCuA7+GJwDP5D1twnzdWnKvy+CUv98fILtDzmF6MtY0ThmdOtTdVcDzxwYZGyJmslw
         6jHI9tDzbMOpnpShlHT/dP8cnUqtSOtRwiDvicdM/001MZVmnJbGPFsPf0iPUeB5UkSf
         Q/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684747740; x=1687339740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbRctGRE7eKmFRGiu9scZucTz/1JLIZAWb6EIwSTZ8A=;
        b=eMSHpI+YZLnSIbOvVr9d1MGhhtKxJ9TEthKvegc+70qlPVu+arZ26oxB6SbkmNczEl
         7gbTfh9SjKXMcaVqiRTMEwJ68RCWfzeFDrh3BL0pJBcYoJ9KSZHFaCvNddYCgXwAdBRO
         3kZv9NFyENtKUkd9WcseVJGQdCSzi6wgnUsq/zQ/rVL4+lcQl17eF82azdQ2FlCYpxhK
         ppfB9oZSC/4p6zcjlETVX09TnfntDcx9GZ53Zc7Uxl4Rk6jhAH0XpaE97JwrdBpfnQmu
         ng9rlyP2ppgCjA3C7Ci3O5FoCeYICR2Npvj7PRDRZk4HvVO6KauOcKw6a4AsZlINEvpQ
         yDUA==
X-Gm-Message-State: AC+VfDyCaxdNDW5GT4hpyUjkiGed7lWhO/cp7LvpVJNwrRFbSQtgAA60
	5jNreZH4Cdnl97tamXOIN0HpdQ==
X-Google-Smtp-Source: ACHHUZ6TMM4RzSvuTO0NgypHBAhZkY2wxHmScckXl0b8Yv/2nwgNbzU017m8GZr90tUfxsx6jwmjog==
X-Received: by 2002:a05:600c:3549:b0:3f5:a54:9f97 with SMTP id i9-20020a05600c354900b003f50a549f97mr7426605wmq.0.1684747740627;
        Mon, 22 May 2023 02:29:00 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s4-20020a5d4244000000b00307bc4e39e5sm6984359wrr.117.2023.05.22.02.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 02:29:00 -0700 (PDT)
Date: Mon, 22 May 2023 11:28:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/3] RISC-V: KVM: Introduce extension_enabled
Message-ID: <20230522-4612f847d03e6e281e7ef84f@orel>
References: <20230426171328.69663-1-ajones@ventanamicro.com>
 <20230426171328.69663-4-ajones@ventanamicro.com>
 <CAAhSdy0e5Uc0LP3YOy5Lz7hh4G7pSn70pLXSicy7aj6v90C00Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0e5Uc0LP3YOy5Lz7hh4G7pSn70pLXSicy7aj6v90C00Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_022905_452736_5C11444B 
X-CRM114-Status: GOOD (  31.83  )
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

T24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMDg6MzU6MzFQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIEFwciAyNiwgMjAyMyBhdCAxMDo0M+KAr1BNIEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IFdlIG5lZWQgdGhyZWUgU0JJIGV4
dGVuc2lvbiBzdGF0dXMgdmFsdWVzICh1bmluaXRpYWxpemVkLCBlbmFibGVkLAo+ID4gYW5kIGRp
c2FibGVkKS4gUGFpcmluZyBhbm90aGVyIGJvb2xlYW4gYXJyYXksIGV4dGVuc2lvbl9lbmFibGVk
W10sCj4gPiB3aXRoIHRoZSBib29sZWFuIGFycmF5IGV4dGVuc2lvbl9kaXNhYmxlZFtdIHByb3Zp
ZGVzIGZvdXIgc3RhdGVzLgo+ID4gVXNpbmcgYSBwYWlyIG9mIGJvb2xlYW4gYXJyYXlzLCB3aGlj
aCBtYXkgZXZlbnR1YWxseSBiZSBjaGFuZ2VkIHRvCj4gPiBhIHBhaXIgb2YgYml0bWFwcywgaXMg
bW9yZSBzcGFjZSBlZmZpY2llbnQgdGhhbiB1c2luZyBvbmUgZW51bQo+ID4gc3RhdHVzIGZpZWxk
LiBBcHBseSB0aGUgbmV3IChlbmFibGVkPTEsZGlzYWJsZWQ9MCkgc3RhdGUsIHdoaWNoCj4gPiBt
ZWFucyBlaXRoZXIgdGhlIGV4dGVuc2lvbiBkb2Vzbid0IGhhdmUgYSBwcm9iZSBmdW5jdGlvbiBv
ciB0aGF0Cj4gPiBpdHMgcHJvYmUgd2FzIHN1Y2Nlc3NmdWwsIHRvIGF2b2lkIG1vcmUgdGhhbiBv
bmUgcHJvYmUgb2YgdGhlCj4gPiBleHRlbnNpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgOSArKysrKysrKysKPiA+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMTEgKysrKysrKysrKy0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiA+IGluZGV4IDQyNzgxMjVhMzhhNS4uZTNj
NWUxZDE1ZTkzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNw
dV9zYmkuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+
ID4gQEAgLTE2LDYgKzE2LDE1IEBACj4gPgo+ID4gIHN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4
dCB7Cj4gPiAgICAgICAgIGludCByZXR1cm5faGFuZGxlZDsKPiA+ICsgICAgICAgLyoKPiA+ICsg
ICAgICAgICogZXh0ZW5zaW9uX2VuYWJsZWRbXSBhbmQgZXh0ZW5zaW9uX2Rpc2FibGVkW10gcHJv
dmlkZSBTQkkKPiA+ICsgICAgICAgICogZXh0ZW5zaW9ucyBmb3VyIHN0YXR1cyB2YWx1ZXMsIG9m
IHdoaWNoIHdlIG5lZWQgdGhyZWU6Cj4gPiArICAgICAgICAqICgwLDApIHVuaW5pdGlhbGl6ZWQs
ICgxLDApIGVuYWJsZWQsICgwLDEpIGRpc2FibGVkLiBVc2luZwo+ID4gKyAgICAgICAgKiBhIHBh
aXIgb2YgYm9vbGVhbiBhcnJheXMsIHdoaWNoIG1heSBldmVudHVhbGx5IGJlIGNoYW5nZWQKPiA+
ICsgICAgICAgICogdG8gYSBwYWlyIG9mIGJpdG1hcHMsIGlzIG1vcmUgc3BhY2UgZWZmaWNpZW50
IHRoYW4gdXNpbmcKPiA+ICsgICAgICAgICogb25lIGVudW0gc3RhdHVzIGZpZWxkLgo+ID4gKyAg
ICAgICAgKi8KPiA+ICsgICAgICAgYm9vbCBleHRlbnNpb25fZW5hYmxlZFtLVk1fUklTQ1ZfU0JJ
X0VYVF9NQVhdOwo+IAo+IFRoZSBleHRlbnNpb25fZW5hYmxlZFtdIGlzIG5vdCBhbiBhcHByb3By
aWF0ZSBuYW1lLgo+IAo+IEhvdyBhYm91dCBleHRlbnNpb25fcHJvYmVfYWxsb3dlZFtdID8KCiJw
cm9iZSBhbGxvd2VkIiBzb3VuZHMgdG8gbWUgbGlrZSAid2UgbWF5IGNhbGwgcHJvYmUiLCBidXQg
dGhlIG1lYW5pbmcgd2UKd2FudCBpcyAid2UndmUgYWxyZWFkeSBjYWxsZWQgcHJvYmUgYW5kIGl0
IHN1Y2NlZWRlZCwgc28gdGhlIGV4dGVuc2lvbgppcyBhdmFpbGFibGUiIChvciB0aGF0IHdlIGRv
bid0IGhhdmUgcHJvYmUsIG1lYW5pbmcgdGhlIGV4dGVuc2lvbiBpcwphc3N1bWVkIGF2YWlsYWJs
ZSkuIEkgcHJlZmVyICdhdmFpbGFibGUnIGZvciBleHRlbnNpb25zIG92ZXIgJ2VuYWJsZWQnLApi
dXQgd2UgYWxyZWFkeSBoYXZlICdkaXNhYmxlZCcsIHNvICdlbmFibGVkJyBhcHBlYXJlZCB0byBm
aXQgYmV0dGVyLgpBY3R1YWxseSwgaXQncyBwcm9iYWJseSBiZXN0IHRvIGltcHJvdmUgdGhlIHJl
YWRhYmlsaXR5IGFuZCBzaW1wbGljaXR5LAphdCB0aGUgZXhwZW5zZSBvZiBzaXplLCBieSBkcm9w
cGluZyBib3RoIHRoZSBleHRlbnNpb25fZW5hYmxlZCBhbmQKZXh0ZW5zaW9uX2Rpc2FibGVkIGJv
b2xlYW4gYXJyYXlzIGFuZCBzd2l0Y2hpbmcgdG8gYW4gJ2V4dGVuc2lvbl9zdGF0dXMnCmVudW0s
IHdoZXJlIHdlIGhhdmUgU0JJX0VYVF9VTklOSVRJQUxJWkVELCBTQklfRVhUX0FWQUlMQUJMRSwg
YW5kClNCSV9FWFRfVU5BVkFJTEFCTEUuCgpUaGFua3MsCmRyZXcKCgo+IAo+IEFueSBiZXR0ZXIg
bmFtZSA/Cj4gCj4gUmVnYXJkcywKPiBBbnVwCj4gCj4gPiAgICAgICAgIGJvb2wgZXh0ZW5zaW9u
X2Rpc2FibGVkW0tWTV9SSVNDVl9TQklfRVhUX01BWF07Cj4gPiAgfTsKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
LmMKPiA+IGluZGV4IGExYTgyZjBmYmFkMi4uMzQ0ZDM4YmJlMDZhIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmkuYwo+ID4gQEAgLTE1NSw2ICsxNTUsMTIgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9z
YmlfZXh0X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiAgICAgICAgIGlmICghc2V4
dCkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiA+Cj4gPiArICAgICAgIC8q
Cj4gPiArICAgICAgICAqIFdlIGNhbid0IHNldCBzY29udGV4dC0+ZXh0ZW5zaW9uX2VuYWJsZWRb
XSB0byByZWdfdmFsIHNpbmNlIHRoZQo+ID4gKyAgICAgICAgKiBleHRlbnNpb24gbWF5IGhhdmUg
YSBwcm9iZSgpIGZ1bmN0aW9uIHdoaWNoIG5lZWRzIHRvIGNvbmZpcm0KPiA+ICsgICAgICAgICog
ZW5hYmxlbWVudCBmaXJzdC4gT25seSBzZXQgZXh0ZW5zaW9uX2Rpc2FibGVkW10gaGVyZSBhbmQg
bGVhdmUKPiA+ICsgICAgICAgICogdGhlIGV4dGVuc2lvbl9lbmFibGVkW10gc2V0dGluZyB0byBr
dm1fdmNwdV9zYmlfZmluZF9leHQoKS4KPiA+ICsgICAgICAgICovCj4gPiAgICAgICAgIHNjb250
ZXh0LT5leHRlbnNpb25fZGlzYWJsZWRbc2V4dC0+ZXh0X2lkeF0gPSAhcmVnX3ZhbDsKPiA+Cj4g
PiAgICAgICAgIHJldHVybiAwOwo+ID4gQEAgLTMxNyw3ICszMjMsOCBAQCBjb25zdCBzdHJ1Y3Qg
a3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAo+ID4gICAgICAg
ICAgICAgICAgIGV4dCA9IGVudHJ5LT5leHRfcHRyOwo+ID4KPiA+ICAgICAgICAgICAgICAgICBp
ZiAoZXh0LT5leHRpZF9zdGFydCA8PSBleHRpZCAmJiBleHQtPmV4dGlkX2VuZCA+PSBleHRpZCkg
ewo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVudHJ5LT5leHRfaWR4ID49IEtWTV9S
SVNDVl9TQklfRVhUX01BWCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChlbnRyeS0+
ZXh0X2lkeCA+PSBLVk1fUklTQ1ZfU0JJX0VYVF9NQVggfHwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzY29udGV4dC0+ZXh0ZW5zaW9uX2VuYWJsZWRbZW50cnktPmV4dF9pZHhdKQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXh0Owo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHNjb250ZXh0LT5leHRlbnNpb25fZGlzYWJsZWRbZW50cnkt
PmV4dF9pZHhdKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVM
TDsKPiA+IEBAIC0zMjUsNiArMzMyLDggQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRl
bnNpb24gKmt2bV92Y3B1X3NiaV9maW5kX2V4dCgKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2NvbnRleHQtPmV4dGVuc2lvbl9kaXNhYmxlZFtlbnRyeS0+ZXh0X2lkeF0gPSB0
cnVlOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNjb250ZXh0LT5leHRlbnNpb25fZW5hYmxlZFtlbnRyeS0+ZXh0X2lkeF0gPSB0cnVlOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGV4dDsKPiA+ICAgICAgICAgICAgICAg
ICB9Cj4gPiAgICAgICAgIH0KPiA+IC0tCj4gPiAyLjM5LjIKPiA+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
