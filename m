Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2051ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 05:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCMLp8GL4RiMhWPMrDKD3goc/LLsaR4tlwNkeFTueB8=; b=Y//v97dapwqKDM
	KbM43oKyZH8Wc4Og8AL04tPbR4JFaT8EuuwCJFovbrKgzOXXnq+xbH8ffmmMeFJ3O0Zem45ShW261
	IuPQRVti23WQGPUV/rtD2CkVnFCj1d7BUe+h3fxu+Kqwp/Uxduv98cAt6UVGa3CFKmxZdvWQQKkvT
	1Wmbn6/hUvlG2YCbDOSjL74/qqDlF1vcgY2nnLoxuJWre9vCQUkU8NlreDpBeQtEbsqKHNvnqajdH
	r2hTKWjLC1B7vUhSgWKK6+yT2YaWZT2WQqp3PzMzz3P13nmnr/j3iU8bNfYVVg3pJkPy8zwccZjbd
	HxiWCmcCQf406C0UK+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGBn-003y0F-2G; Wed, 31 Aug 2022 05:22:59 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGBj-003xwa-K5
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 05:22:57 +0000
Received: by mail-io1-xd35.google.com with SMTP id p187so11049483iod.8
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 22:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=rW4IQ+xjfRGsn6d/leXF4ApTBgqpSiBCGDBfRzUGS+g=;
        b=mTdRK943io74C39RB7AOeX0pTzIzNk9KHFsdhRSS7UXdjybw6YeSMrgbAsnwXzTAoY
         jXMBHrsV4W77kuZQOdG0ykGmPJqVtNbbBUQvfesR55OLJFUT5VZbtMDKtH94fJ1RI539
         8Rt2h0ugwl8qfT8p+C6C4rnXkyx2WhokXuAewpEVxy62Ia5FBqBQBL2GVQFmrtYXxCe/
         WB9N+Q4OPOjCU7BR3JSSIfSRSBI/0iKI+fTqtILHhJTPCtN7lD6wzhtbtVM4+37UiX/M
         DsH3PJdFkBVSozZ/72e7v8aiiX3lNZSMWMmdg9OBRlZdMb2LZ39NffLpGosqhT/dxgEU
         Tb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=rW4IQ+xjfRGsn6d/leXF4ApTBgqpSiBCGDBfRzUGS+g=;
        b=RhMtb++q8SgvoD22Ep77255Xfze7c6ZgBG+KNQzf1iW5pQ56YeVAZb2z5houqEC/n3
         O6EBG4v9Tk0aRH1DsrU5gv03CNjJLoZbF29AzIntXyw8DqsJgOuY1QKaUODOjEmIjnlJ
         JITz/xGg37qzSR6oyS2rcLjLor9h2brhdWpiTQAwVHFvaOFCX9f7yHMvjoe72emgyRDc
         XH8NmjTWFFmBMbBY9m/t6ljEk7kRCAPyq81GKAhMDsrdsPFj78fYqyUpiHs11aEmKRDg
         kemK0giKWA4n8jA/ZgCOa+vHR8i1cKhTTbMUbZIoogTYtMgg/YBzTVuv2lGVDg3Van4B
         IGhQ==
X-Gm-Message-State: ACgBeo1M0u/5oX1g8SGY7r6kNDfCfRkiY3mXrS9ti7bYB7t/CHRXCxPP
	YIb8GvqUN7MluEXtwReHx/AqN6kGslPEZlb54Lo=
X-Google-Smtp-Source: AA6agR6axZJPbqDTTuhQksx5GAmJ4iOhDb5mUHuLTv855yduTm19vd2Lu6I5XKDIbABtpxfR7TDmDu++/lxyPo+qKh0=
X-Received: by 2002:a02:294a:0:b0:349:fb9e:b5e0 with SMTP id
 p71-20020a02294a000000b00349fb9eb5e0mr14284324jap.115.1661923373032; Tue, 30
 Aug 2022 22:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220830082620.1680602-1-ben.dooks@sifive.com>
 <fdec1b72-27f3-96e6-5e19-d54ded4aea68@microchip.com> <cefcf96f-5bcc-d134-fbe5-d1169313b6f3@codethink.co.uk>
In-Reply-To: <cefcf96f-5bcc-d134-fbe5-d1169313b6f3@codethink.co.uk>
From: Zong Li <zongbox@gmail.com>
Date: Wed, 31 Aug 2022 13:22:41 +0800
Message-ID: <CA+ZOyajWRUFppg26O1XHfRuJHWB3jk-=-i=FBV9XYgHgshuwQA@mail.gmail.com>
Subject: Re: [PATCH] soc: sifive: ccache: reduce printing on init
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Conor.Dooley@microchip.com, ben.dooks@sifive.com, zong.li@sifive.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_222255_685680_85BD5EC3 
X-CRM114-Status: GOOD (  25.87  )
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

QmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiDmlrwgMjAyMuW5tDjmnIgzMeaX
pSDpgLHkuIkg5YeM5pmoMTowNOWvq+mBk++8mgo+Cj4gT24gMzAvMDgvMjAyMiAxNzozMCwgQ29u
b3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPiBPbiAzMC8wOC8yMDIyIDA5OjI2LCBC
ZW4gRG9va3Mgd3JvdGU6Cj4gPj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4g
Pj4KPiA+PiBUaGUgZHJpdmVyIHByaW50cyBvdXQgNiBsaW5lcyBvbiBzdGFydHVwLCB3aGljaCBj
YW4gZWFzaWx5IGJlIHJlZGN1ZWQKPiA+PiB0byB0d28gbGluZXMgd2l0aG91dCBsb3NpbmcgYW55
IGluZm9ybWF0aW9uLgo+ID4+Cj4gPj4gTm90ZSwgdG8gbWFrZSB0aGUgdHlwZXMgd29yayBiZXR0
ZXIsIHVpbnQ2NF90IGhhcyBiZWVuIHJlcGxhY2VkIHdpdGgKPiA+PiBVTEwgdG8gbWFrZSB0aGUg
dW5zaWduZWQgbG9uZyBsb25nIG1hdGNoIHRoZSBmb3JtYXQgaW4gdGhlIHByaW50Cj4gPj4gc3Rh
dGVtZW50Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAc2lm
aXZlLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hl
LmMgfCAyNSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYyBiL2RyaXZlcnMvc29jL3NpZml2ZS9z
aWZpdmVfY2NhY2hlLmMKPiA+PiBpbmRleCA0NmNlMzNkYjdkMzAuLjY1YTEwYTZlZTIxMSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNoZS5jCj4gPj4gKysr
IGIvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYwo+ID4+IEBAIC03NiwyMCArNzYs
MTcgQEAgc3RhdGljIHZvaWQgc2V0dXBfc2lmaXZlX2RlYnVnKHZvaWQpCj4gPj4KPiA+PiAgIHN0
YXRpYyB2b2lkIGNjYWNoZV9jb25maWdfcmVhZCh2b2lkKQo+ID4+ICAgewo+ID4+IC0gICAgICAg
dTMyIHJlZ3ZhbCwgdmFsOwo+ID4+IC0KPiA+PiAtICAgICAgIHJlZ3ZhbCA9IHJlYWRsKGNjYWNo
ZV9iYXNlICsgU0lGSVZFX0NDQUNIRV9DT05GSUcpOwo+ID4+IC0gICAgICAgdmFsID0gcmVndmFs
ICYgMHhGRjsKPiA+PiAtICAgICAgIHByX2luZm8oIkNDQUNIRTogTm8uIG9mIEJhbmtzIGluIHRo
ZSBjYWNoZTogJWRcbiIsIHZhbCk7Cj4gPj4gLSAgICAgICB2YWwgPSAocmVndmFsICYgMHhGRjAw
KSA+PiA4Owo+ID4+IC0gICAgICAgcHJfaW5mbygiQ0NBQ0hFOiBOby4gb2Ygd2F5cyBwZXIgYmFu
azogJWRcbiIsIHZhbCk7Cj4gPj4gLSAgICAgICB2YWwgPSAocmVndmFsICYgMHhGRjAwMDApID4+
IDE2Owo+ID4+IC0gICAgICAgcHJfaW5mbygiQ0NBQ0hFOiBTZXRzIHBlciBiYW5rOiAlbGx1XG4i
LCAodWludDY0X3QpMSA8PCB2YWwpOwo+ID4+IC0gICAgICAgdmFsID0gKHJlZ3ZhbCAmIDB4RkYw
MDAwMDApID4+IDI0Owo+ID4+IC0gICAgICAgcHJfaW5mbygiQ0NBQ0hFOiBCeXRlcyBwZXIgY2Fj
aGUgYmxvY2s6ICVsbHVcbiIsICh1aW50NjRfdCkxIDw8IHZhbCk7Cj4gPj4gLQo+ID4+IC0gICAg
ICAgcmVndmFsID0gcmVhZGwoY2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX1dBWUVOQUJMRSk7
Cj4gPj4gLSAgICAgICBwcl9pbmZvKCJDQ0FDSEU6IEluZGV4IG9mIHRoZSBsYXJnZXN0IHdheSBl
bmFibGVkOiAlZFxuIiwgcmVndmFsKTsKPiA+PiArICAgICAgIHUzMiBjZmc7Cj4gPj4gKwo+ID4+
ICsgICAgICAgY2ZnID0gcmVhZGwoY2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX0NPTkZJRyk7
Cj4gPj4gKwo+ID4+ICsgICAgICAgcHJfaW5mbygiQ0NBQ0hFOiAldSBiYW5rcywgJXUgd2F5cywg
c2V0cy9iYW5rPSVsbHUsIGJ5dGVzL2Jsb2NrPSVsbHVcbiIsCj4gPj4gKyAgICAgICAgICAgICAg
IChjZmcgJiAweGZmKSwgKGNmZyA+PiA4KSAmIDB4ZmYsCj4gPj4gKyAgICAgICAgICAgICAgIDFV
TEwgPDwgKChjZmcgPj4gMTYpICYgMHhmZiksCj4gPgo+ID4gVGhpcyBpcyBqdXN0IEJJVF9VTEwo
KGNmZyA+PiAxNikgJiAweGZmKSwgbm8/Cj4gPiBXb3VsZCBiZSBuaWNlIHRvbyBpZiB0aGVzZSB3
ZXJlIGRlZmluZWQsIHNvIHlvdSdkIGhhdmUgc29tZXRoaW5nCj4gPiBsaWtlIEJJVF9VTEwoKGNm
ZyA+PiBTRVRTX1BFUl9CQU5LX1NISUZUKSAmIDB4ZmYpCj4gPgo+ID4gSSBkbyBsaWtlIHRoZSBj
bGVhbnVwIG9mIHRoZSB1aW50NjRfdCAmIGN1dHRpbmcgZG93biBvbiB0aGUgcHJpbnRzCj4gPiB0
aG91Z2ggOikgQWdhaW4sIGl0J2QgYmUgbmljZSBpZiB5b3UgYW5kIFpvbmcgY291bGQgY29sbGFi
b3JhdGUgb24KPiA+IGEgY29tYmluZWQgdjIuCj4KPiBJIHRoaW5rIGV2ZW4gQklUX1VMKCkgd291
bGQgZG8gaGVyZSwgaWYgc29tZW9uZSBpcyBnb2luZyB0byBtYWtlIGEKPiBjYWNoZSBiaWdnZXIg
dGhhbiAyR2lCIHdlJ2xsIHByb2JhYmx5IGJlIHF1aXRlIG9sZCBieSB0aGVuLCBzbyB2Mgo+IG1p
Z2h0IGhhdmUgdGhlIGxhc3QgdHdvIHZhbHVlcyBkb3duIGFzICVsdS4KPgoKSGkgQmVuLApUaGFu
a3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiwgSWYgeW91IGRvbid0IG1pbmQsIEkgd2lsbCB0YWtlIHRo
aXMgaW50bwpteSBWMiBwYXRjaHNldC4KCj4gPiBUaGFua3MsCj4gPiBDb25vci4KPiA+Cj4gPj4g
KyAgICAgICAgICAgICAgIDFVTEwgPDwgKChjZmcgPj4gMjQpICYgMHhmZikpOwo+ID4+ICsKPiA+
PiArICAgICAgIGNmZyA9IHJlYWRsKGNjYWNoZV9iYXNlICsgU0lGSVZFX0NDQUNIRV9XQVlFTkFC
TEUpOwo+ID4+ICsgICAgICAgcHJfaW5mbygiQ0NBQ0hFOiBJbmRleCBvZiB0aGUgbGFyZ2VzdCB3
YXkgZW5hYmxlZDogJWRcbiIsIGNmZyk7Cj4gPj4gICB9Cj4gPj4KPiA+PiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNpZml2ZV9jY2FjaGVfaWRzW10gPSB7Cj4gPj4gLS0KPiA+
PiAyLjM1LjEKPiA+Pgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+Cj4KPiAtLQo+IEJlbiBEb29rcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KPiBTZW5pb3Ig
RW5naW5lZXIgICAgICAgICAgICAgICAgICAgICAgICAgQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdl
bml1cwo+Cj4gaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
