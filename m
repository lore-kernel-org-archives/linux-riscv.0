Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAC0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 05:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMxbO45TU5kA6Nkc7GSxDE6+MnA4KqThHIy9vPeQJxY=; b=hFIj0u4xBVyNRf
	6/tNHtEvNzzWEs3u57dQ2K40gxoZYkbujSKl27y8wSNeHLZ5QoOyRpBocZvPRaIkmDVv0O49souFK
	9rhF/SzTyhmAIYSSxxvBBX9QLwOyA9bP9LWFz58m5sJDptFAcB64ZvJMt+eSlMuNlC9TJpbcMshek
	Icq1+s62FIhMn7mBmLy7+n/CHSloY0g7V7auvHTXFMw5PlhuJWGdWaNbZuYfSYb0rsgd8q4i1Qnla
	c0It+wtZUhWgKGdhNH3NFO5fM1Aa7fB88Q4yR4Xk+N7+1O50NzZwi+brq1d/BImFi8gsy+sNEPa25
	GrGHZsSz6WPmFB8NVqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE19Y-0027WD-1k;
	Fri, 15 Dec 2023 05:54:28 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE19V-0027UL-2N
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 05:54:27 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-425a116f1cdso2999411cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 21:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702619659; x=1703224459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIlGBUI7+xyayXLeWefjq6qjRUJDvM6KcbCYeer1jRk=;
        b=qbVtpYP8GnIw9FpYS/0k5QcBlio8q49juP4hdPAgi+Innhs1HEQRXdQBxWK23ohug3
         HCVJdvFtukDcjpoZv4WHTYbqP2Vru3olYqg0LRncBMSv4avX2BAaSlwFnwQQ+cTY0xIk
         phUYwMusPDHjfc+quXn2wqNMOTDpGBLNfemo639E5W6lGJ82yfXiHsMJsqUmlFLknA6B
         nGT/KVuxb/E82eZSxJmSq9nY3BSXJ2dkT5WMJiyq897et71jFa5u98Ud80n2IN3uFEjd
         8Zhc4l/9hQg0nNqUgjyxp9Xowu1+qPPnwD16DT1uxr4SSa5c4TVp847TYOwdDajET4Kf
         GjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702619659; x=1703224459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIlGBUI7+xyayXLeWefjq6qjRUJDvM6KcbCYeer1jRk=;
        b=o1XwHqViwZzdWEIySFqgwnRTFzFqVgHHMH6OwOSHRhGu/c1A0aCGKLDD+NlHemTZbl
         pw+qo3E5XE8ypYYj6wrYOWbfSS1xcU9jQ761rhdXMiBtJ4xqbjwZK1UCc82XP+pranqh
         ThTlUIdh01hikDxNi0UhM8rvhJj9ywAcajThnNcZpRNuX1+I1ovLngY8fJFHnS4RuLo2
         lL9M2V3K3rhYvlcKorbFkZIwM+L7VrqpZbojlCNqA+a/wpIFYCwJvKXb7ll9MBMRt9A+
         ZDCque+ZGANJIt2ubevskO1j2YeYZSDKY8yY0IBMzwWJeFsSzy6L3upapCN9hJ60mysy
         Za3Q==
X-Gm-Message-State: AOJu0YxtoS90SZeYM85F4dQK+8wClI79Nyb74K4X+4M884Yokat5W3C+
	SAhReb0C04m+rZUkhCEcAiHHPtmKYS5BLrfcA6b1oA==
X-Google-Smtp-Source: AGHT+IHOyrKLgnQy+W8sgXbtsBZvEa32nid80KmWXfHMez/R3halXXDJw+VufpLEgn2w4DBWuWK08pywPMQMUQMgxdk=
X-Received: by 2002:a05:622a:100f:b0:425:4043:18ce with SMTP id
 d15-20020a05622a100f00b00425404318cemr14467505qte.129.1702619658984; Thu, 14
 Dec 2023 21:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-18-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-18-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 11:24:06 +0530
Message-ID: <CAAhSdy0zYkQLTuERqV4rePC8akQa90bvMNmG_QHm_5kHn1DVnw@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] RISC-V: paravirt: Implement steal-time support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_215425_772502_E0210ACC 
X-CRM114-Status: GOOD (  30.30  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiB0aGUgU0JJIFNUQSBleHRlbnNpb24gZXhp
c3RzIHdlIGNhbiB1c2UgaXQgdG8gaW1wbGVtZW50Cj4gcGFyYXZpcnQgc3RlYWwtdGltZSBzdXBw
b3J0LiBGaWxsIGluIHRoZSBlbXB0eSBwdi10aW1lIGZ1bmN0aW9ucwo+IHdpdGggYW4gU0JJIFNU
QSBpbXBsZW1lbnRhdGlvbiBhbmQgYWRkIHRoZSBLY29uZmlnIGtub2JzIGFsbG93aW5nCj4gaXQg
dG8gYmUgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgfCAx
OSArKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgfCA2NyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2Nv
bmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDk1YTJhMDZhY2M2YS4uYjk5ZmQ4MTI5
ZWRmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+IEBAIC03MjQsNiArNzI0LDI1IEBAIGNvbmZpZyBDT01QQVQKPgo+ICAgICAgICAg
ICBJZiB5b3Ugd2FudCB0byBleGVjdXRlIDMyLWJpdCB1c2Vyc3BhY2UgYXBwbGljYXRpb25zLCBz
YXkgWS4KPgo+ICtjb25maWcgUEFSQVZJUlQKPiArICAgICAgIGJvb2wgIkVuYWJsZSBwYXJhdmly
dHVhbGl6YXRpb24gY29kZSIKPiArICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJCj4gKyAgICAg
ICBoZWxwCj4gKyAgICAgICAgIFRoaXMgY2hhbmdlcyB0aGUga2VybmVsIHNvIGl0IGNhbiBtb2Rp
ZnkgaXRzZWxmIHdoZW4gaXQgaXMgcnVuCj4gKyAgICAgICAgIHVuZGVyIGEgaHlwZXJ2aXNvciwg
cG90ZW50aWFsbHkgaW1wcm92aW5nIHBlcmZvcm1hbmNlIHNpZ25pZmljYW50bHkKPiArICAgICAg
ICAgb3ZlciBmdWxsIHZpcnR1YWxpemF0aW9uLgo+ICsKPiArY29uZmlnIFBBUkFWSVJUX1RJTUVf
QUNDT1VOVElORwo+ICsgICAgICAgYm9vbCAiUGFyYXZpcnR1YWwgc3RlYWwgdGltZSBhY2NvdW50
aW5nIgo+ICsgICAgICAgZGVwZW5kcyBvbiBQQVJBVklSVAo+ICsgICAgICAgaGVscAo+ICsgICAg
ICAgICBTZWxlY3QgdGhpcyBvcHRpb24gdG8gZW5hYmxlIGZpbmUgZ3JhbnVsYXJpdHkgdGFzayBz
dGVhbCB0aW1lCj4gKyAgICAgICAgIGFjY291bnRpbmcuIFRpbWUgc3BlbnQgZXhlY3V0aW5nIG90
aGVyIHRhc2tzIGluIHBhcmFsbGVsIHdpdGgKPiArICAgICAgICAgdGhlIGN1cnJlbnQgdkNQVSBp
cyBkaXNjb3VudGVkIGZyb20gdGhlIHZDUFUgcG93ZXIuIFRvIGFjY291bnQgZm9yCj4gKyAgICAg
ICAgIHRoYXQsIHRoZXJlIGNhbiBiZSBhIHNtYWxsIHBlcmZvcm1hbmNlIGltcGFjdC4KPiArCj4g
KyAgICAgICAgIElmIGluIGRvdWJ0LCBzYXkgTiBoZXJlLgo+ICsKPiAgY29uZmlnIFJFTE9DQVRB
QkxFCj4gICAgICAgICBib29sICJCdWlsZCBhIHJlbG9jYXRhYmxlIGtlcm5lbCIKPiAgICAgICAg
IGRlcGVuZHMgb24gTU1VICYmIDY0QklUICYmICFYSVBfS0VSTkVMCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmlydC5j
Cj4gaW5kZXggMTQxZGJjYzM2ZmEyLi5iMDlkZmQ4MWJjZDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvcGFyYXZpcnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0
LmMKPiBAQCAtNiwxMiArNiwyMSBAQAo+ICAjZGVmaW5lIHByX2ZtdChmbXQpICJyaXNjdi1wdjog
IiBmbXQKPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1aG90cGx1Zy5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvY29tcGlsZXIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9rY29uZmlnLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3BlcmNwdS1kZWZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wcmludGsuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3N0YXRpY19jYWxsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pgo+Cj4gKyNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ICsjaW5jbHVkZSA8YXNtL3BhZ2UuaD4K
PiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiArCj4gIHN0cnVjdCBzdGF0aWNfa2V5IHBhcmF2aXJ0
X3N0ZWFsX2VuYWJsZWQ7Cj4gIHN0cnVjdCBzdGF0aWNfa2V5IHBhcmF2aXJ0X3N0ZWFsX3JxX2Vu
YWJsZWQ7Cj4KPiBAQCAtMzEsMjQgKzQwLDc2IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX25v
X3N0ZWFsYWNjKGNoYXIgKmFyZykKPgo+ICBlYXJseV9wYXJhbSgibm8tc3RlYWwtYWNjIiwgcGFy
c2Vfbm9fc3RlYWxhY2MpOwo+Cj4gK0RFRklORV9QRVJfQ1BVKHN0cnVjdCBzYmlfc3RhX3N0cnVj
dCwgc3RlYWxfdGltZSkgX19hbGlnbmVkKDY0KTsKPiArCj4gIHN0YXRpYyBib29sIF9faW5pdCBo
YXNfcHZfc3RlYWxfY2xvY2sodm9pZCkKPiAgewo+ICsgICAgICAgaWYgKHNiaV9zcGVjX3ZlcnNp
b24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKPiArICAgICAgICAgICBzYmlfcHJvYmVfZXh0
ZW5zaW9uKFNCSV9FWFRfU1RBKSA+IDApIHsKPiArICAgICAgICAgICAgICAgcHJfaW5mbygiU0JJ
IFNUQSBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPiArICAgICAgIH0KPiArCj4gICAgICAgICByZXR1cm4gZmFsc2U7Cj4gIH0KPgo+IC1zdGF0
aWMgaW50IHB2X3RpbWVfY3B1X29ubGluZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICtzdGF0aWMgaW50
IHNiaV9zdGFfc3RlYWxfdGltZV9zZXRfc2htZW0odW5zaWduZWQgbG9uZyBsbywgdW5zaWduZWQg
bG9uZyBoaSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFncykKPiAgewo+ICsgICAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gKwo+ICsg
ICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfU1RBLCBTQklfRVhUX1NUQV9TVEVBTF9USU1F
X1NFVF9TSE1FTSwKPiArICAgICAgICAgICAgICAgICAgICAgICBsbywgaGksIGZsYWdzLCAwLCAw
LCAwKTsKPiArICAgICAgIGlmIChyZXQuZXJyb3IpIHsKPiArICAgICAgICAgICAgICAgaWYgKGxv
ID09IFNCSV9TVEFfU0hNRU1fRElTQUJMRSAmJiBoaSA9PSBTQklfU1RBX1NITUVNX0RJU0FCTEUp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiRmFpbGVkIHRvIGRpc2FibGUgc3Rl
YWwtdGltZSBzaG1lbSIpOwo+ICsgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcHJfd2FybigiRmFpbGVkIHRvIHNldCBzdGVhbC10aW1lIHNobWVtIik7Cj4gKyAg
ICAgICAgICAgICAgIHJldHVybiBzYmlfZXJyX21hcF9saW51eF9lcnJubyhyZXQuZXJyb3IpOwo+
ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBw
dl90aW1lX2NwdV9vbmxpbmUodW5zaWduZWQgaW50IGNwdSkKPiArewo+ICsgICAgICAgc3RydWN0
IHNiaV9zdGFfc3RydWN0ICpzdCA9IHRoaXNfY3B1X3B0cigmc3RlYWxfdGltZSk7Cj4gKyAgICAg
ICBwaHlzX2FkZHJfdCBwYSA9IF9fcGEoc3QpOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBsbyA9
ICh1bnNpZ25lZCBsb25nKXBhOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBoaSA9IElTX0VOQUJM
RUQoQ09ORklHXzMyQklUKSA/IHVwcGVyXzMyX2JpdHMoKHU2NClwYSkgOiAwOwo+ICsKPiArICAg
ICAgIHJldHVybiBzYmlfc3RhX3N0ZWFsX3RpbWVfc2V0X3NobWVtKGxvLCBoaSwgMCk7Cj4gK30K
PiArCj4gIHN0YXRpYyBpbnQgcHZfdGltZV9jcHVfZG93bl9wcmVwYXJlKHVuc2lnbmVkIGludCBj
cHUpCj4gIHsKPiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgcmV0dXJuIHNiaV9zdGFfc3Rl
YWxfdGltZV9zZXRfc2htZW0oU0JJX1NUQV9TSE1FTV9ESVNBQkxFLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX1NUQV9TSE1FTV9ESVNBQkxFLCAwKTsK
PiAgfQo+Cj4gIHN0YXRpYyB1NjQgcHZfdGltZV9zdGVhbF9jbG9jayhpbnQgY3B1KQo+ICB7Cj4g
LSAgICAgICByZXR1cm4gMDsKPiArICAgICAgIHN0cnVjdCBzYmlfc3RhX3N0cnVjdCAqc3QgPSBw
ZXJfY3B1X3B0cigmc3RlYWxfdGltZSwgY3B1KTsKPiArICAgICAgIHUzMiBzZXF1ZW5jZTsKPiAr
ICAgICAgIHU2NCBzdGVhbDsKPiArCj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJC
SVQpKSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIENoZWNrIHRo
ZSBzZXF1ZW5jZSBmaWVsZCBiZWZvcmUgYW5kIGFmdGVyIHJlYWRpbmcgdGhlIHN0ZWFsCj4gKyAg
ICAgICAgICAgICAgICAqIGZpZWxkLiBSZXBlYXQgdGhlIHJlYWQgaWYgaXQgaXMgZGlmZmVyZW50
IG9yIG9kZC4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGRvIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzZXF1ZW5jZSA9IFJFQURfT05DRShzdC0+c2VxdWVuY2Up
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHZpcnRfcm1iKCk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc3RlYWwgPSBSRUFEX09OQ0Uoc3QtPnN0ZWFsKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICB2aXJ0X3JtYigpOwo+ICsgICAgICAgICAgICAgICB9IHdoaWxlICgobGUzMl90b19j
cHUoc2VxdWVuY2UpICYgMSkgfHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgc2VxdWVuY2Ug
IT0gUkVBRF9PTkNFKHN0LT5zZXF1ZW5jZSkpOwoKQWN0dWFsbHksIHdlIHNob3VsZCBiZSBkb2lu
ZyB0aGlzIHNlcXVlbmNlIGZvciBib3RoIFJWNjQgYW5kIFJWMzIKYmVjYXVzZSBmb3IgUlY2NCB0
aGUgc3RlYWwgdGltZSB2YWx1ZSBpcyB2YWxpZCBvbmx5IHdoZW4gc2VxdWVuY2UgaXMKYW4gZXZl
biBudW1iZXIuCgo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgc3RlYWwgPSBS
RUFEX09OQ0Uoc3QtPnN0ZWFsKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gbGU2
NF90b19jcHUoc3RlYWwpOwo+ICB9Cj4KPiAgaW50IF9faW5pdCBwdl90aW1lX2luaXQodm9pZCkK
PiAtLQo+IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
