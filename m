Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE71C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppp5GzgEl2kbFfDOSDmcDedEV6+1QVn5CEJINZ4NwfI=; b=wPj6zInJ4PBETI
	kDNRFMHAOYEPMkujUCrFELoUz4+/JQmFr/VkBYPvAWxf3eoIg8ehw6O6u6i5J5+BMo+vdWAdaNwuv
	0tef0IeK3iFg7RP2AnjFndUopr60RpHKCIgbFDQZk9L+gq6+sJmkqMIUtiOYNophjDIuGuM6GkCYE
	5oVfb2S/YzN14lhYU8lNYC6/nYkUJBIiDESa86UdyqG+eER93XYwlFtwtzVbQuKFV7QMCfeRD5kXc
	zl6JbQTkEBHdu3nTQTVRlSu2dkZupmPqrmyagl4/3vb6PLVLaOEG7J5Rs1oY1fkH4TlDskWwkwohA
	QlQcCvnT8EZTrvJaCXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWqK-00APkL-Mz; Wed, 11 Jan 2023 08:52:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWqH-00APij-C3
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 08:52:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id p3-20020a05600c1d8300b003d9ee5f125bso7316401wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCFnWr4CgOYUtIiKJ6uTgRvXueUInizb1SI04oif0dQ=;
        b=TJeApJbP11LQO6hKrAr7L5zn6F04m3waax2rzSwkq1phN8ml8SkLwe6SUCI1jrfrlO
         bBaxn55eau57nLhGYaA+kNdNCj0/MzaMKPIwPLYxDuzukNGixzjzoBVI2t69Rk3iF64z
         xePohUl1e82O4j7bMBkBrZN1sbGkn3UhTi3MtKoXVW9g1Vx2FVYTu/V4y0H9xBd/F7iq
         2PSUJEMsyk7Ch9Bce/qGv1qZkmLLJVmdP2mgekMg9BMbpxslTarUynKsm85y0UFT/1YC
         ORs3ak7zyIggaJWbq5O+7r6hwDER1S4NEbb7rlsHyBOLlI8V26U0LdnlCshRZd8umNjx
         4YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCFnWr4CgOYUtIiKJ6uTgRvXueUInizb1SI04oif0dQ=;
        b=yle1SdrrgyCryaqzUrm3L5mYqXFdNQyk5/IQGlQa9uJfNyR6N8Majge3OJoUPOW74T
         WI5es+aYu+WsRWGl1O8Lkoif/ofrSuNnSXriKTThCvAj8IlhsJp0BoBTNxG1s910jCUl
         h/K0quWE7bJjdYK2+SBrsGtftAWM0T1gZJA2jCS0kbohf0WOhuVYA69K99OP9lfPuVi/
         Is9fu2+dGVLXD3Uv6DM5uIkzCYDH/8sJL8tMvyCIHJGD8BdOY1jdzcZbrRbOC6ePIbuY
         lCZW+NUGxMggxqnK0gMGJMCejBBAsoN+0axj8nsf5RLpFFQu8qMpGZRfGT0PrmEOUqJG
         /hMg==
X-Gm-Message-State: AFqh2krE+ogqzIlw+sZPjcib5js/gglwV7kW8ImZAMYCp9f6sYIdn/ai
	DD48Kf1XXZggbXTLMJmNoMQp7/pTOmR0niMM
X-Google-Smtp-Source: AMrXdXscrlkWXhPj+7QrU2B82mc+exmJxpSe3EBPXWNedcNJve2PtYUUUlZefkk5F5pMnkjeHALbNw==
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id o6-20020a05600c4fc600b003d34a4752e9mr51020809wmq.15.1673427133087;
        Wed, 11 Jan 2023 00:52:13 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w6-20020adfd4c6000000b0027cb20605e3sm13021162wrk.105.2023.01.11.00.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 00:52:12 -0800 (PST)
Date: Wed, 11 Jan 2023 09:52:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20230111085211.wdsn4tnpsaxblxhm@orel>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <20230106113216.443057-2-ajones@ventanamicro.com>
 <Y73lRNHDstKHL3vn@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y73lRNHDstKHL3vn@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_005217_452797_20662771 
X-CRM114-Status: GOOD (  31.15  )
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

T24gVHVlLCBKYW4gMTAsIDIwMjMgYXQgMTA6MjM6MDBQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IEhleSBEcmV3IQo+IAo+IE9uIEZyaSwgSmFuIDA2LCAyMDIzIGF0IDEyOjMyOjE2UE0g
KzAxMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+IFdoZW4gdGhlIFNVU1AgU0JJIGV4dGVuc2lv
biBpcyBwcmVzZW50IGl0IGltcGxpZXMgdGhhdCB0aGUgc3RhbmRhcmQKPiA+ICJzdXNwZW5kIHRv
IFJBTSIgdHlwZSBpcyBhdmFpbGFibGUuIFdpcmUgaXQgdXAgdG8gdGhlIGdlbmVyaWMKPiA+IHBs
YXRmb3JtIHN1c3BlbmQgc3VwcG9ydCwgYWxzbyBhcHBseWluZyB0aGUgYWxyZWFkeSBwcmVzZW50
IHN1cHBvcnQKPiA+IGZvciBub24tcmV0ZW50aXZlIENQVSBzdXNwZW5kLiBXaGVuIHRoZSBrZXJu
ZWwgaXMgYnVpbHQgd2l0aAo+ID4gQ09ORklHX1NVU1BFTkQsIG9uZSBjYW4gZG8gJ2VjaG8gbWVt
ID4gL3N5cy9wb3dlci9zdGF0ZScgdG8gc3VzcGVuZC4KPiA+IFJlc3VtcHRpb24gd2lsbCBvY2N1
ciB3aGVuIGEgcGxhdGZvcm0tc3BlY2lmaWMgd2FrZS11cCBldmVudCBhcnJpdmVzLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+
IAo+IEZpcnN0IHRoaW5ncyBmaXJzdCwgYW55dGhpbmcgU0JJIGRlcGVuZHMgb24gIW0tbW9kZSwg
c28geW91J3ZlIGdvdHRhIGFkZAo+IHNvbWUgc29ydCBvZiBnYXRpbmcgdW5mb3J0dW5hdGVseSBh
cm91bmQgdGhvc2UgRUNBTExzLiBCdXQgSSBmaWd1cmUgeW91Cj4gbWF5IGhhdmUgYWxyZWFkeSBz
ZWVuIHRoZSBidWlsZCBmYWlsdXJlcyBvbiBwYXRjaHdvcmsgZm9yIG5vbW11PwoKQWN0dWFsbHks
IG5vLCBhbmQgSSB0aGluayBJIG1pc3NlZCBvdGhlciBlbWFpbHMgbGlrZSB0aGF0IGluIHRoZSBw
YXN0LiBJCmFzc3VtZSBJJ20gb24gdGhlIFRvOiBvZiB0aGVzZSBtZXNzYWdlcywgc28gaXQncyBv
ZGQgdGhleSdyZSBub3Qgc2hvd2luZwp1cC4gQ2FuIHlvdSBmb3J3YXJkIG1lIHRoaXMgbWVzc2Fn
ZT8gSSdsbCBpbnNwZWN0IHRoZSBoZWFkZXJzIGFuZCB0cnkgdG8KZmlndXJlIHdoYXQncyBnb2lu
ZyBvbi4KCj4gCj4gQWxzbywgd2hlbiB0aGVyZSdzIGFuIGFjdHVhbCBzcGVjIHdvdWxkIHlvdSBt
aW5kIGRvaW5nIGEgTGluazogc3BlYy5wZGY/CgpXaWxsIGRvCgo+IAo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9LY29uZmlnICAgICAgICAgICB8ICA1ICsrKystCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCB8ICA5ICsrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVu
ZC5jICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRl
eCBlMmI2NTYwNDNhYmYuLmE1M2Q5NGMxOTUzZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtNTIsNyArNTIsNyBA
QCBjb25maWcgUklTQ1YKPiA+ICAJc2VsZWN0IENMT05FX0JBQ0tXQVJEUwo+ID4gIAlzZWxlY3Qg
Q0xJTlRfVElNRVIgaWYgIU1NVQo+ID4gIAlzZWxlY3QgQ09NTU9OX0NMSwo+ID4gLQlzZWxlY3Qg
Q1BVX1BNIGlmIENQVV9JRExFCj4gPiArCXNlbGVjdCBDUFVfUE0gaWYgKFNVU1BFTkQgfHwgQ1BV
X0lETEUpCj4gPiAgCXNlbGVjdCBFREFDX1NVUFBPUlQKPiA+ICAJc2VsZWN0IEdFTkVSSUNfQVJD
SF9UT1BPTE9HWQo+ID4gIAlzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiAhNjRCSVQKPiA+IEBA
IC02ODYsNiArNjg2LDkgQEAgY29uZmlnIFBPUlRBQkxFCj4gPiAgCXNlbGVjdCBPRgo+ID4gIAlz
ZWxlY3QgTU1VCj4gPiAgCj4gPiArY29uZmlnIEFSQ0hfU1VTUEVORF9QT1NTSUJMRQo+ID4gKwlk
ZWZfYm9vbCB5Cj4gCj4gU2luY2UgdGhlIGNvbnRlbnQgeW91J3JlIGFkZGluZyBkZXBlbmRzIG9u
IGhhdmluZyBhbiBTQkkgZXh0ZW50aW9uLAo+IGRvZXMgdGhpcyBuZWVkIHRvIGJlIHMveS9SSVND
Vl9TQkkvPwoKSW5kZWVkLiBXaWxsIGRvLgoKPiAKPiA+ICBtZW51ICJQb3dlciBtYW5hZ2VtZW50
IG9wdGlvbnMiCj4gPiAgCj4gPiAgc291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaAo+ID4gaW5kZXggNGNhN2ZiYWNmZjQyLi45ODM0YmE0Y2UzZTQgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIHNiaV9leHRf
aWQgewo+ID4gIAlTQklfRVhUX1JGRU5DRSA9IDB4NTI0NjRFNDMsCj4gPiAgCVNCSV9FWFRfSFNN
ID0gMHg0ODUzNEQsCj4gPiAgCVNCSV9FWFRfU1JTVCA9IDB4NTM1MjUzNTQsCj4gPiArCVNCSV9F
WFRfU1VTUCA9IDB4NTM1NTUzNTAsCj4gPiAgCVNCSV9FWFRfUE1VID0gMHg1MDRENTUsCj4gPiAg
Cj4gPiAgCS8qIEV4cGVyaW1lbnRhbHMgZXh0ZW5zaW9ucyBtdXN0IGxpZSB3aXRoaW4gdGhpcyBy
YW5nZSAqLwo+ID4gQEAgLTExMyw2ICsxMTQsMTQgQEAgZW51bSBzYmlfc3JzdF9yZXNldF9yZWFz
b24gewo+ID4gIAlTQklfU1JTVF9SRVNFVF9SRUFTT05fU1lTX0ZBSUxVUkUsCj4gPiAgfTsKPiA+
ICAKPiA+ICtlbnVtIHNiaV9leHRfc3VzcF9maWQgewo+ID4gKwlTQklfRVhUX1NVU1BfU1VTUEVO
RCA9IDAsCj4gPiArfTsKPiA+ICsKPiA+ICtlbnVtIHNiaV9leHRfc3VzcF9zbGVlcF90eXBlIHsK
PiA+ICsJU0JJX1NVU1BfU0xFRVBfVFlQRV9TVVNQRU5EID0gMCwKPiA+ICt9Owo+ID4gKwo+ID4g
IGVudW0gc2JpX2V4dF9wbXVfZmlkIHsKPiA+ICAJU0JJX0VYVF9QTVVfTlVNX0NPVU5URVJTID0g
MCwKPiA+ICAJU0JJX0VYVF9QTVVfQ09VTlRFUl9HRVRfSU5GTywKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMK
PiA+IGluZGV4IDliYTI0ZmI4Y2M5My4uYmMyNmU5YWU0NzgyIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNw
ZW5kLmMKPiA+IEBAIC00LDggKzQsMTIgQEAKPiA+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMjIgVmVu
dGFuYSBNaWNybyBTeXN0ZW1zIEluYy4KPiA+ICAgKi8KPiA+ICAKPiA+ICsjZGVmaW5lIHByX2Zt
dChmbXQpICJzdXNwZW5kOiAiIGZtdAo+ID4gKwo+ID4gICNpbmNsdWRlIDxsaW51eC9mdHJhY2Uu
aD4KPiA+ICsjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPgo+ID4gICNpbmNsdWRlIDxhc20vY3Ny
Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3N1c3BlbmQu
aD4KPiA+ICAKPiA+ICBzdGF0aWMgdm9pZCBzdXNwZW5kX3NhdmVfY3NycyhzdHJ1Y3Qgc3VzcGVu
ZF9jb250ZXh0ICpjb250ZXh0KQo+ID4gQEAgLTg1LDMgKzg5LDQwIEBAIGludCBjcHVfc3VzcGVu
ZCh1bnNpZ25lZCBsb25nIGFyZywKPiA+ICAKPiA+ICAJcmV0dXJuIHJjOwo+ID4gIH0KPiAKPiBB
bmQgdGhlbiBmcm9tIGhlcmUgZG93biBuZWVkcyB0byBiZSAjaWZkZWYgUklTQ1ZfU0JJPwo+IAo+
IEFueXdheXMsIHByb2JhYmx5IHN0YXRpbmcgdGhlIG9idmlvdXMgb24gYW4gUkZDLCBidXQgwq9c
Xyjjg4QpXy/CrwoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSSBtYWRlIGEgbGFzdCBt
aW51dGUgY2hhbmdlIHRvIG1vdmUKdGhlIGNvbnRlbnQgZnJvbSBhcmNoL3Jpc2N2L2tlcm5lbC9z
YmkuYyB0byBhcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKYW5kIGZvcmdvdCBJIG5lZWRlZCB0
byB3b3JyeSBhYm91dCBSSVNDVl9TQkkuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
