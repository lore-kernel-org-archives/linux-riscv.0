Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B3DCD4F54
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ch+sumhpy4kqg9qeHxbpFfX2VQ5SqyjYY0U1eNrXEOg=; b=cgF/RQ1S1kVTT9
	DDu8ONqYeQkbMLZSyNLZ+ozRynBSe29NJiKxygaAZnDtKKL4ZJv0kxbt8BVsrnSp2LNHgojnSDUvo
	o6i1aLCB3AIUmwRGgaEAOCP8xsm0+TtaKsJu2cbmCyGWJaaDAhP3FJg9OAXhjhIq1DRqFWD+eSXgP
	KAzR/RjGmlxKmX6PDHXrrnFaA9YqXk/+fCvyKl17/SahhHDuyAFHb+6E++8yPzucQ/NMv6r8vw866
	lPplmlfoNRmzszlIfn0oCYvhVDexkQnowja93tbrOuypTufwTJIdJ2m8XfhqiL4rf1jUUIfkD6RjZ
	CIF7EF2nzegJ0zixApyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLVT-0000000G9TZ-3yQJ;
	Mon, 25 May 2026 02:57:31 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLVR-0000000G9Se-3dEK
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 02:57:31 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4855e69a5a4so1222609b6e.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 19:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779677845; cv=none;
        d=google.com; s=arc-20240605;
        b=ciVN4c+rC3h8xvpoebBXd+KzZXtJ7R2vkXJWj6ZWzXLKU/vQcaMQOvic0j29FU3Dyj
         uRW2V1Znxx1DnLbUnS+aBEiv3bFd1lYd7RwskYK7QieF6hXyk3z/doIYRrazMw2q84wq
         q85elpnS3g9zEO7x4nFqMi1F/E8tXfPUW73IPqfqf0qNNYtzDgg7ZHf7ukf7S4ETNZ5V
         c2KROpAw5jgY/e1rf3mvvaZwck0aPy3F9Z4fwAutx8VgiQsQjIhyh/ptTSYpdhVBH10+
         c9QIhIMqQRX5U3BB+2lFVBHS6EMn4k0BegU9c2gylmWyyNpEsvPhqojJ2klWGqH6AFNl
         gTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4p2Y4rpzA7t+3/Ew6HssSyKOaVu8TUHqBeBcAxIT1P8=;
        fh=9YtH+N/hech+ucMojaT+s86seMbFoFK8l1aK2Tly4pM=;
        b=NPTSFLrbcAFesK15NHvi8pDHQt5LrYT3Pg5Ng9qhZVQbyK33qSi1lAnqhNzzVnKJha
         6cI9dM5j3vb1LDbjlZ+0trbYtDxtUrJfKzYl3m2CGqRMiAVXLaprgbrZEl/sAQCBU9YC
         JELM0usM2K15QIaL41PJZFl8/ndckx73D+6srg60KVO2HoceXvV5O4myEitPdv/74FxH
         fosNqfDrf/YFwKU2He4hnlNtyQ6nFUD3qojENqII7tCWp37J78w3GCtucuW5stdafHAD
         3eoIPcekjMn1a8O9klq8MVTUyljh+mphUYpy8o/GRnKrurmt1KwHnBZ+9rCT6Sdwy6cm
         JCAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779677845; x=1780282645; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p2Y4rpzA7t+3/Ew6HssSyKOaVu8TUHqBeBcAxIT1P8=;
        b=IQOGoguSe2xUPiJeP8w/uaNh/i8sw31U8+HpWZtyzx4fdut+wEULB90ZXrIfhShfqZ
         C3Vhv1m7tZBYBStmBylyf5rB7lvrhmojUmvj2cZLsQlfGM04Ql7wQKHgd8+ny9yTHdq/
         VWD9AXlQm13PB32lP+DWCofCdsGaODrmw8kTwGeqh8XMlcfBG5J8xmcEglQQp8mR1jNn
         G66dF83slUrRD6YDdNbatUnTkG/iI38LDQ6Opf7dgYHAhyucVQzseBGQXLT8fTK/H+gB
         q5dcRNCoYkhPwu4n6XfDNFvb0wPw2K8PEzu1WkCmPzWVzpG8WN6BJJYgEE7+X7x/Ps1+
         e34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779677845; x=1780282645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4p2Y4rpzA7t+3/Ew6HssSyKOaVu8TUHqBeBcAxIT1P8=;
        b=fXOwdrn+KlxpGF5OaJpUdfq65+CCslmcwBTd4MYMYHqMLI6e3Y3LtqjOJ+7d96RcXD
         J7CiRKAOzWH6jT5FrHowFwnJ4JCr/Uhmne3Q18hwdjgMu/x64KH3lFeVZOWdWmIjco7w
         bfWBayNV/6wog7y70GdEX6Wjdyu6uNsYzgUqTQVVcXRozD97FH/GL/oKCg/b9Hr5QtYW
         QQWp2lzcrTuENlriMu7kz1UNR0t6hwbY7UErqES1WAH+otmPbwhZSwx/y19e+SfFinkj
         BR6goPYNkswIxyOq1tpm1xffEEWUOl70HKgMuduqSlVsz1Zu7oj80uMxLkI2yiA9J7Jm
         jokw==
X-Forwarded-Encrypted: i=1; AFNElJ9zuuRa0zIg8n8nn0qxUoz9iyeukx5Mp66+Q/z6gXaEQc3bWFuxqkBBOPbD4O/GpWlZlm0piaZVuLEZxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkMnWUKlXM+7PF/QlgGcCwwqZeOUCcu2m7R80ogEBJH4Uh4FDl
	W71017hVPb34f6LuoLk+e+buvLp3ZFsGaldgTK/WRe3E1eJJVQn+4NbW8ua2FgnpLSWEhrl7as3
	ciqUrc/ekTfZSWTSOM5cHufEZhquY2v0cuiRB9yDpbA==
X-Gm-Gg: Acq92OFOhd/8RprVLKO9M041KvZoNhEF6Z8vlJwl57HDIDUCDe+gYosNk01tJgQeD+f
	uuU6xdLtfHEiO3eELDE9rmL1qy9WserbIicT4l9kyMvM5ykPP/G+Jd9aS0YkMT9cSHPk+gO1/dT
	ltstlIgSwbinDjV27qBxfgpPmaGfXOoWw8dd/4ewU+LeQkxALnmZPfCr0DjrdpqBg2KzbUofqkK
	Ahkj9Wru8NdcWoCBHvDaED22/I3iq7JkW5e/yQjiAei/uF5vjXpBiz7BNE7npAw7KBfYUM/ZMF9
	AcGEq6Ybu965q4GU+Mtg
X-Received: by 2002:a05:6808:238c:b0:474:28c1:4877 with SMTP id
 5614622812f47-4854a243accmr7054750b6e.39.1779677844723; Sun, 24 May 2026
 19:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260522142358.87589-1-cuiyunhui@bytedance.com>
 <20260522142358.87589-2-cuiyunhui@bytedance.com> <ybjx52k3y55vnlzrhlsnhgazx5izuefhuhdbz56j7dm3yoqrty@nukezvjcvk2s>
In-Reply-To: <ybjx52k3y55vnlzrhlsnhgazx5izuefhuhdbz56j7dm3yoqrty@nukezvjcvk2s>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 25 May 2026 10:57:12 +0800
X-Gm-Features: AVHnY4JbbsmUt-LeL6zR3FeqkXlrTn0UGIu4bABd6o8lqI6ylZ8Tiw1cm5mKJNw
Message-ID: <CAEEQ3wkFza8Dwf4GKJo3xFGP6yYpjXZHvsu+_4X+_Jxwu_nEdQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 2/2] riscv: preserve hardware-updated
 A/D bits in PTE accessors
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	akpm@linux-foundation.org, pasha.tatashin@soleen.com, 
	andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com, debug@rivosinc.com, 
	baolin.wang@linux.alibaba.com, zhangchunyan@iscas.ac.cn, apopple@nvidia.com, 
	namcao@linutronix.de, wangruikang@iscas.ac.cn, apatel@ventanamicro.com, 
	liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com, 
	pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_195729_918709_60D50961 
X-CRM114-Status: GOOD (  22.75  )
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

SGkgQW5kcmV3LAoKT24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgNDowMuKAr0FNIEFuZHJldyBKb25l
cwo8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkg
MjIsIDIwMjYgYXQgMTA6MjM6NThQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFVzZSBj
bXB4Y2hnLWJhc2VkIG1lcmdlcyBmb3IgbGl2ZSBSSVNDLVYgUFRFIHBlcm1pc3Npb24gdXBkYXRl
cyBzbwo+ID4gc29mdHdhcmUgY2hhbmdlcyBkbyBub3QgbG9zZSBjb25jdXJyZW50bHkgaGFyZHdh
cmUtdXBkYXRlZCBhY2Nlc3NlZCBhbmQKPiA+IGRpcnR5IHN0YXRlLiBDb3ZlciBwdGVwX3NldF9h
Y2Nlc3NfZmxhZ3MoKSwKPiA+IHB0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcoKSwgYW5kIHB0ZXBf
c2V0X3dycHJvdGVjdCgpLCBhbmQgZXh0ZW5kIHRoZQo+ID4gc2FtZSB3cnByb3RlY3QgaGFuZGxp
bmcgdG8gdGhlIFBVRCBsZWFmIGhlbHBlciB1c2VkIGJ5IGh1Z2UgbWFwcGluZ3MuCj4gPgo+ID4g
S2VlcCB0aGUgZXhpc3RpbmcgU3Z2cHRjIGZsdXNoIGJlaGF2aW91ciwgYnV0IG9ubHkgZmx1c2gg
d2hlbiB0aGUKPiA+IG1lcmdlZCBQVEUgdmFsdWUgYWN0dWFsbHkgY2hhbmdlZC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBRaW5nd2VpIEh1IDxxaW5nd2VpLmh1QGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDE5ICsrKysrKystLQo+ID4g
IGFyY2gvcmlzY3YvbW0vcGd0YWJsZS5jICAgICAgICAgIHwgNjggKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBpbmRleCAy
MDY2M2E0NjZjZjZjLi45ODRjMzdjYThhZWY3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gPiBAQCAtNjY4LDE1ICs2NjgsMjEgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVw
X2dldF9hbmRfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gPiAgc3RhdGljIGlubGluZSB2
b2lkIHB0ZXBfc2V0X3dycHJvdGVjdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3Qg
KnB0ZXApCj4gPiAgewo+ID4gLSAgICAgcHRlX3QgcmVhZF9wdGUgPSBSRUFEX09OQ0UoKnB0ZXAp
Owo+ID4gKyAgICAgcHRlX3Qgb2xkX3B0ZTsKPiA+ICsgICAgIHB0ZV90IHB0ZTsKPiA+ICAgICAg
IC8qCj4gPiAgICAgICAgKiBwdGVwX3NldF93cnByb3RlY3QgY2FuIGJlIGNhbGxlZCBmb3Igc2hh
ZG93IHN0YWNrIHJhbmdlcyB0b28uCj4gPiAgICAgICAgKiBzaGFkb3cgc3RhY2sgbWVtb3J5IGlz
IFhXUiA9IDAxMCBhbmQgdGh1cyBjbGVhcmluZyBfUEFHRV9XUklURSB3aWxsIGxlYWQgdG8KPiA+
ICAgICAgICAqIGVuY29kaW5nIDAwMGIgd2hpY2ggaXMgd3JvbmcgZW5jb2Rpbmcgd2l0aCBWID0g
MS4gVGhpcyBzaG91bGQgbGVhZCB0byBwYWdlIGZhdWx0Cj4gPiAgICAgICAgKiBidXQgd2UgZG9u
dCB3YW50IHRoaXMgd3JvbmcgY29uZmlndXJhdGlvbiB0byBiZSBzZXQgaW4gcGFnZSB0YWJsZXMu
Cj4gPiAgICAgICAgKi8KPiA+IC0gICAgIGF0b21pY19sb25nX3NldCgoYXRvbWljX2xvbmdfdCAq
KXB0ZXAsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgKChwdGVfdmFsKHJlYWRfcHRlKSAmIH4o
dW5zaWduZWQgbG9uZylfUEFHRV9XUklURSkgfCBfUEFHRV9SRUFEKSk7Cj4gPiArICAgICBwdGUg
PSBSRUFEX09OQ0UoKnB0ZXApOwo+ID4gKyAgICAgZG8gewo+ID4gKyAgICAgICAgICAgICBvbGRf
cHRlID0gcHRlOwo+ID4gKyAgICAgICAgICAgICBwdGUgPSBwdGVfd3Jwcm90ZWN0KHB0ZSk7Cj4g
PiArICAgICAgICAgICAgIHB0ZV92YWwocHRlKSA9IGNtcHhjaGdfcmVsYXhlZCgmcHRlX3ZhbCgq
cHRlcCksIHB0ZV92YWwob2xkX3B0ZSksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwdGVfdmFsKHB0ZSkpOwo+ID4gKyAgICAgfSB3aGlsZSAocHRlX3Zh
bChwdGUpICE9IHB0ZV92YWwob2xkX3B0ZSkpOwo+ID4gIH0KPiA+Cj4gPiAgI2RlZmluZSBfX0hB
VkVfQVJDSF9QVEVQX0NMRUFSX1lPVU5HX0ZMVVNICj4gPiBAQCAtMTAzMCw2ICsxMDM2LDEzIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBwbWRwX3NldF93cnByb3RlY3Qoc3RydWN0IG1tX3N0cnVjdCAq
bW0sCj4gPiAgICAgICBwdGVwX3NldF93cnByb3RlY3QobW0sIGFkZHJlc3MsIChwdGVfdCAqKXBt
ZHApOwo+ID4gIH0KPiA+Cj4gPiArI2RlZmluZSBfX0hBVkVfQVJDSF9QVURQX1NFVF9XUlBST1RF
Q1QKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHVkcF9zZXRfd3Jwcm90ZWN0KHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBhZGRyZXNzLCBwdWRfdCAqcHVkcCkKPiA+ICt7Cj4gPiArICAgICBwdGVwX3NldF93
cnByb3RlY3QobW0sIGFkZHJlc3MsIChwdGVfdCAqKXB1ZHApOwo+ID4gK30KPiA+ICsKPiA+ICAj
ZGVmaW5lIHBtZHBfZXN0YWJsaXNoIHBtZHBfZXN0YWJsaXNoCj4gPiAgc3RhdGljIGlubGluZSBw
bWRfdCBwbWRwX2VzdGFibGlzaChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcG1kX3QgKnBt
ZHAsIHBtZF90IHBtZCkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3BndGFibGUuYyBi
L2FyY2gvcmlzY3YvbW0vcGd0YWJsZS5jCj4gPiBpbmRleCA5YzQ0MjdkMGIxODc0Li5iNzdlODIz
NjI0NDJlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9wZ3RhYmxlLmMKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvbW0vcGd0YWJsZS5jCj4gPiBAQCAtNSwyMyArNSw1NSBAQAo+ID4gICNpbmNs
dWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGd0YWJsZS5oPgo+ID4K
PiA+ICsjZGVmaW5lIFJJU0NWX1BURV9BQ0NFU1NfRkxBR19NQVNLICAgKF9QQUdFX1JFQUQgfCBf
UEFHRV9XUklURSB8IF9QQUdFX0VYRUMgfCBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfUEFHRV9BQ0NFU1NFRCB8IF9QQUdFX0RJUlRZIHwgXAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX1BBR0VfU09GVF9ESVJUWSkKPiA+ICsK
PiA+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcmlzY3ZfcHRlX2FjY2Vzc19mbGFncyh1
bnNpZ25lZCBsb25nIGN1ciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVudHJ5KQo+ID4gK3sKPiA+ICsgICAgIHVuc2ln
bmVkIGxvbmcgcHRldmFsOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBod19mbGFnczsKPiA+ICsK
PiA+ICsgICAgIGh3X2ZsYWdzID0gX1BBR0VfQUNDRVNTRUQgfCBfUEFHRV9ESVJUWSB8IF9QQUdF
X1NPRlRfRElSVFk7Cj4KPiBXaHkgYXJlIHdlIHNldHRpbmcgX1BBR0VfU09GVF9ESVJUWSBpbiBz
b21ldGhpbmcgY2FsbGVkIGh3X2ZsYWdzPyBEbyB3ZQo+IGV2ZW4gbmVlZCB0byBjb25zaWRlciBf
UEFHRV9TT0ZUX0RJUlRZIGhlcmU/CgpfUEFHRV9TT0ZUX0RJUlRZIGlzIG5vdCBoYXJkd2FyZS11
cGRhdGVkLCBzbyBod19mbGFncyB3YXMgYSBtaXNsZWFkaW5nCm5hbWUuIEknbGwgcmVuYW1lIGl0
IGluIHRoZSBuZXh0IHZlcnNpb24uCkl0IHN0aWxsIG5lZWRzIHRvIGJlIHByZXNlcnZlZCBoZXJl
LCBiZWNhdXNlIFJJU0MtViBwdGVfbWtkaXJ0eSgpCmFscmVhZHkgc2V0cyBpdCB0b2dldGhlciB3
aXRoIF9QQUdFX0RJUlRZLCBhbmQgdGhlIGNtcHhjaGcgcmV0cnkgY291bGQKb3RoZXJ3aXNlIGxv
c2UgdGhhdCBzb2Z0LWRpcnR5IHN0YXRlLgoKPgo+IFRoYW5rcywKPiBkcmV3CgpUaGFua3MsCll1
bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
