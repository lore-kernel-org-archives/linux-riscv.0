Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DEEC88CB2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QS9WGWlTGClHYfKdpyvuBUZq0zoAf65/iQaI7jTQeWY=; b=ZWQclhUSsjEGA3
	INEZmfX0slKAvvAFzjrMWohLv0lE7Q3dl6k1BF2ktHjZNHSR/7gu9KgYf/Qa0vEH0v9kSOz5sKjy/
	NlGHJjwCz13p5mkmrupb2aD3E7Uvtsz188Dpo2rwuFWISJdoJpESITzJGi0CSwGON97jC37BR71gE
	plGCedJMd5yvp6+QMQN8B8He8DIbX2Ms4mwyjJKKmd4xNvzRCUIt7eAL7HqOZOqq5omsZeN20eUg1
	X86bxcz+KjdLk6bELveF9MAjaSbFpYfzzX0GW9kSXWIBH8ddbY2H7kfj+8d77Cfp3h9M6KhJ7lgcr
	ParMPTBVbJTNy7WwhpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8z2X-007K87-2r;
	Tue, 13 Jun 2023 08:06:09 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8z2U-007K6i-2x
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 08:06:08 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so4451403276.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686643565; x=1689235565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k/4HquP2HeWTu3gqyEqAfIouxpypkLo7uElSrv6hWc=;
        b=awkBk+howhXC9J91GGN+gEhLJqzy4lI2+Nm2ME0HsBbRSUGNzB9llZL0mmuInqWVYv
         goSHwsqToUzZst/eUhuADOvGa79vijbWRbT4TcdQ2JmJleqsoTRcCvxuusNEuv6phnbg
         RcFVy5pFpePMCFA0meViSbb2mb42Bx5rqvMemzvomS6qHphXqCA6RmLGATsD2HzrkCA1
         BkLuRJCoQE77Ziur1z4yQgYkJD1IJuA9j7kkcYm63Qc/WQZ672nsx8jaG3lyN5ld0Qc/
         D3GNmDLwiLZE+jQJmHUTQzfaOhAFnuIcRdTgLn9/Ia/jM4+weREaTvv8hYftc1NWFSLr
         EJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686643565; x=1689235565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k/4HquP2HeWTu3gqyEqAfIouxpypkLo7uElSrv6hWc=;
        b=do5U0I8549ScBl3AiHkOgln31Djd+11yE5+ArGiDKRF2pQ8yIkzvd7Wfn8MyCjmDc/
         pA1DyO67BhsS/S8QWX83P/22Nt7HiT++LPdGwd971rkNM5Npvg/rWmU85MgH707qbbkU
         LcASKluVljpDf7hiCEcQ5xhfQBnAkQvGZQhs3I/GmBdMhLHH83eC2nviLTx94WwdYvK+
         m84FdajKQTUzjeIGIlmj6fUJuWYcTSL2OlTdZdLKSHmj8K/naGfAn44LmlrMAX+olF0F
         b26hsaAg+TB8909iOeH6udYEI8/ADPQ1UcdYxLPXxr8205SLCT0pc3pvmHhSfaSI171/
         fOcQ==
X-Gm-Message-State: AC+VfDwtQPqdGF/MrvuhgOo5TsKe6lC+8r3l13jMe+SgtWuWWPzhfRkF
	JwJ2tUcLCeOo3EFZaLvSdIQKptLQgwTDt0jOOIXn1Q==
X-Google-Smtp-Source: ACHHUZ6duDMZEOxgSlCrtpBwenRyzgNSxW6ESMhkrTlkPUSo6LUwj8CSY7DYsQmwkus4eMXqhFWEsLczZTipIuenZig=
X-Received: by 2002:a25:a423:0:b0:bc4:77a:22a0 with SMTP id
 f32-20020a25a423000000b00bc4077a22a0mr878350ybi.15.1686643565505; Tue, 13 Jun
 2023 01:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-2-apatel@ventanamicro.com> <20230510-squealing-pruning-2c94b85785b0@wendy>
In-Reply-To: <20230510-squealing-pruning-2c94b85785b0@wendy>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 13 Jun 2023 13:35:54 +0530
Message-ID: <CAK9=C2VqAX+xGH0oPhda1ygMu4umhNAXbPAQ+Z4q+fGR0R54ug@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] RISC-V: Add riscv_fw_parent_hartid() function
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_010606_958516_DD48FA97 
X-CRM114-Status: GOOD (  26.55  )
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgNjoxNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDc6
NTg6MzJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFdlIGFkZCBjb21tb24gcmlzY3Zf
ZndfcGFyZW50X2hhcnRpZCgpIHdoaWNoIGhlbHAgZGV2aWNlIGRyaXZlcnMKPiA+IHRvIGdldCBw
YXJlbnQgaGFydGlkIG9mIHRoZSBJTlRDIChpLmUuIGxvY2FsIGludGVycnVwdCBjb250cm9sbGVy
KQo+ID4gZndub2RlLiBDdXJyZW50bHksIHRoaXMgbmV3IGZ1bmN0aW9uIG9ubHkgc3VwcG9ydHMg
ZGV2aWNlIHRyZWUKPiA+IGJ1dCBpdCBjYW4gYmUgZXh0ZW5kZWQgdG8gc3VwcG9ydCBBQ1BJIGFz
IHdlbGwuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFt
aWNyby5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
IHwgIDMgKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAgICB8IDEyICsr
KysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gaW5kZXggOTRhMDU5MGM2OTcxLi42ZmI4
YmJlYzg0NTkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nv
ci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiBAQCAt
NzcsNiArNzcsOSBAQCBzdHJ1Y3QgZGV2aWNlX25vZGU7Cj4gPiAgaW50IHJpc2N2X29mX3Byb2Nl
c3Nvcl9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0
aWQpOwo+ID4gIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKPiA+Cj4gPiArc3RydWN0IGZ3bm9kZV9oYW5k
bGU7Cj4gPiAraW50IHJpc2N2X2Z3X3BhcmVudF9oYXJ0aWQoc3RydWN0IGZ3bm9kZV9oYW5kbGUg
Km5vZGUsIHVuc2lnbmVkIGxvbmcgKmhhcnRpZCk7Cj4gPiArCj4gPiAgZXh0ZXJuIHZvaWQgcmlz
Y3ZfZmlsbF9od2NhcCh2b2lkKTsKPiA+ICBleHRlcm4gaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0
KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7Cj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1LmMKPiA+IGluZGV4IDVkZTZmYjcwM2NjMi4uMWFkYmU0OGIyYjU4IDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NwdS5jCj4gPiBAQCAtNzMsNiArNzMsMTggQEAgaW50IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQo
c3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpCj4gPiAgICAg
ICByZXR1cm4gLTE7Cj4gPiAgfQo+ID4KPiA+ICsvKiBGaW5kIGhhcnQgSUQgb2YgdGhlIENQVSBm
d25vZGUgdW5kZXIgd2hpY2ggZ2l2ZW4gZndub2RlIGZhbGxzLiAqLwo+ID4gK2ludCByaXNjdl9m
d19wYXJlbnRfaGFydGlkKHN0cnVjdCBmd25vZGVfaGFuZGxlICpub2RlLCB1bnNpZ25lZCBsb25n
ICpoYXJ0aWQpCj4gPiArewo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIEN1cnJlbnRseSwgdGhp
cyBmdW5jdGlvbiBvbmx5IHN1cHBvcnRzIERUIGJ1dCBpdCBjYW4gYmUKPiA+ICsgICAgICAqIGV4
dGVuZGVkIHRvIHN1cHBvcnQgQUNQSSBhcyB3ZWxsLgo+ID4gKyAgICAgICovCj4KPiBTdGF0ZW1l
bnQgb2YgdGhlIG9idmlvdXMgaGVyZSwgbm8/Cj4gQWx0aG91Z2gsIGl0IHNlZW1zIGEgbGl0dGxl
IG9kZCB0byByZWFkIHRoaXMgY29tbWVudCAmIHRoZSBjb3JyZXNwb25kaW5nCj4gc3RhdGVtZW50
IGluIHRoZSBjb21taXQgbWVzc2FnZSwgd2hlbiB0aGUgc2VyaWVzIGFwcGVhcnMgdG8gaGF2ZSBi
ZWVuCj4gYmFzZWQgb24gdGhlIEFDUEk/Cj4KPiBQZXJoYXBzIGJ5IHRoZSB0aW1lIHY0IGNvbWVz
IGFyb3VuZCwgQUNQSSBzdXBwb3J0IHdpbGwgaGF2ZSBiZWVuIG1lcmdlZAo+ICYgdGhhdCdsbCBi
ZSBtb290LgoKWWVzLCBJIHdhcyBhbnl3YXkgZ29pbmcgdG8gdXBkYXRlIHRoaXMgaW4gdjQgdG8g
c3VwcG9ydCBib3RoIERUIGFuZCBBQ1BJLgoKPgo+ID4gKyAgICAgaWYgKCFpc19vZl9ub2RlKG5v
ZGUpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgIHJldHVybiBy
aXNjdl9vZl9wYXJlbnRfaGFydGlkKHRvX29mX25vZGUobm9kZSksIGhhcnRpZCk7Cj4KPiBuaXQ6
IGJsYW5rIGxpbmUgYmVmb3JlIHRoZSByZXR1cm4gaGVyZSBwbGVhc2UuCgpPa2F5LCBJIHdpbGwg
dXBkYXRlLgoKPgo+IFRoYW5rcywKPiBDb25vci4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
