Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB7C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyGqwL1SC0WHYOwBI7NN6dS3HVeEBXFKCvpbw0vqcC0=; b=gAp8QWYmEC8skk
	yXQwrH0s7aaaLXUjXaRg9HckVsnDBaZf0NG8We35S0iWjrnD1Sbeg40JlccGExqa2z2p1luXjgz62
	/U1z4qL4MfRIDH8dW4MbzlOLN+Aoj3CjjbBDgIYtbohJWbcZLmh9ubsL2FyrTL+q2vEiE6UyWZMgr
	23eyapjE8bilM5jSt3EqKfLQ2SrCADam8l6xyVyFyk3xxAr6sEO57i8jckWYCySZiOLulYYSjfu+L
	SUBAlH6t6eLMciULJl2JGyy0IvrZK7KnadVHCsps1QT7FZV7xc3P8fRUbycFboUBQF01Tdu3IjeeZ
	9j7EHOjoTG9jWoBLTrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJDK-00FFzp-1a;
	Mon, 03 Apr 2023 12:23:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJDG-00FFxz-0s
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:23:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e18so29131882wra.9
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680524582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrBrOilikEyXuAaAszQyqb1SxcC+8RUdzbuNXh0/KE8=;
        b=RfTogZ7Y6xOi5ujkHNr//ymCYW3SqcxpJZEFacwGPGcTxe7lGrhbQpazMQ9bU/f4LA
         t8NyF1Wq2b+rS/cNRCKgWIs3eLPd6o9qSCn92qKrGKHl3WWwd9hIemIWnJh0SySs8bgO
         qOrlTVmaHFYdqGril+mt71YPdzqNfPMgTR+X/vI1e8eYAVEMjAN6JVSEp/MPRS60lJ4l
         tU8nM4zhBp+Zmbw7vAfRwikbrs8dDqijRrsINt8+UQRa4z2h2Eww2J9+qgHuUJXjXXI5
         AksJEIDKdJkqK/XJW99bHdSB6GRypGTyjCdcAjLgWrbIr6fQPKrZCJsxCuXtccUjN+q5
         vgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrBrOilikEyXuAaAszQyqb1SxcC+8RUdzbuNXh0/KE8=;
        b=KLBp8Tt3Ce8snq4odqdfyJ4D6RXMN1IJhd2mWmgl1RDSLPDUnSCYCFzoYAbXX6+BUQ
         qlksJeYQh46kxir4VhssJ766NuzE4JFHH/z4VeEtA/3Bfm1nCrEvmXvq4H3Q72Z0GeyL
         6sh7SlqjwBYNZYCxAMDa1Ac1GJmEfNeRbS907uh3IDPIr+WypOc2MgMBj6S71xQsfYS7
         Wv1bwaVgvb/nGxWGzyHnD5y34aJELVf5KXw2AaIbi69HM9/Shxg1l9EplBFcX9dWgw/6
         /ORQbYIPakZ+vNfy4e0JZ7/hjtWKiC5BEeIDB3AqPWgCVUM/3V6Xz8dJuNdvnEUDMfXy
         tUHQ==
X-Gm-Message-State: AAQBX9cjaic/DwJpKIlpJp+NCQGDKTsWhDkg1cetBulG3yagsPiiwHtO
	NzasLPCyV0ynPHi72KFZvMHT3g==
X-Google-Smtp-Source: AKy350aJnE9hGqG/GQp+ahW3juensBB2QAN/lIZSr5g1oWyEjJFGC6dwqBgxYd5i7A73nQ3iqq3cAg==
X-Received: by 2002:a5d:4092:0:b0:2dc:c0da:405 with SMTP id o18-20020a5d4092000000b002dcc0da0405mr28089467wrp.34.1680524582474;
        Mon, 03 Apr 2023 05:23:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k12-20020adfe8cc000000b002c7b229b1basm9617245wrn.15.2023.04.03.05.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:23:02 -0700 (PDT)
Date: Mon, 3 Apr 2023 14:23:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_052306_307809_E00B4227 
X-CRM114-Status: GOOD (  18.87  )
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

T24gTW9uLCBBcHIgMDMsIDIwMjMgYXQgMDU6MzQ6NTdQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIEFwciAzLCAyMDIzIGF0IDU6MDHigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEFwciAwMywgMjAyMyBh
dCAwMzowMzowOFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiBXZSBpbXBsZW1lbnQg
T05FX1JFRyBpbnRlcmZhY2UgZm9yIEFJQSBDU1JzIGFzIGEgc2VwYXJhdGUgc3VidHlwZQo+ID4g
PiB1bmRlciB0aGUgQ1NSIE9ORV9SRUcgaW50ZXJmYWNlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCA4ICsrKysrKysrCj4gPiA+ICBh
cmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCA4ICsrKysrKysrCj4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9rdm0uaAo+ID4gPiBpbmRleCAxODIwMjNkYzlhNTEuLmNiYzNlNzRmYTY3MCAxMDA2NDQK
PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gPiBAQCAtNzksNiArNzksMTAg
QEAgc3RydWN0IGt2bV9yaXNjdl9jc3Igewo+ID4gPiAgICAgICB1bnNpZ25lZCBsb25nIHNjb3Vu
dGVyZW47Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiArLyogQUlBIENTUiByZWdpc3RlcnMgZm9yIEtW
TV9HRVRfT05FX1JFRyBhbmQgS1ZNX1NFVF9PTkVfUkVHICovCj4gPiA+ICtzdHJ1Y3Qga3ZtX3Jp
c2N2X2FpYV9jc3Igewo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiAgLyogVElNRVIgcmVnaXN0ZXJz
IGZvciBLVk1fR0VUX09ORV9SRUcgYW5kIEtWTV9TRVRfT05FX1JFRyAqLwo+ID4gPiAgc3RydWN0
IGt2bV9yaXNjdl90aW1lciB7Cj4gPiA+ICAgICAgIF9fdTY0IGZyZXF1ZW5jeTsKPiA+ID4gQEAg
LTEwNyw2ICsxMTEsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiA+ID4gICAgICAg
S1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UsCj4gPiA+ICAgICAgIEtWTV9SSVNDVl9JU0Ff
RVhUX1pJQ0JPTSwKPiA+ID4gICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkJCLAo+ID4KPiA+IExv
b2tzIGxpa2UgdGhpcyBwYXRjaCBpcyBhbHNvIGJhc2VkIG9uICJbUEFUQ0hdIFJJU0MtVjogS1ZN
OiBBbGxvdyBaYmIKPiA+IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0iCj4gCj4gWWVzLCBkbyB5b3Ug
d2FudCBtZSB0byBjaGFuZ2UgdGhlIG9yZGVyIG9mIGRlcGVuZGVuY3k/CgpJdCdzIHByb2JhYmx5
IGJlc3QgaWYgbmVpdGhlciBkZXBlbmQgb24gZWFjaCBvdGhlciwgc2luY2UgdGhleSdyZQppbmRl
cGVuZGVudCwgYnV0IG90aGVyd2lzZSB0aGUgb3JkZXIgZG9lc24ndCBtYXR0ZXIuIEl0J2QgYmUg
bmljZSB0byBjYWxsCnRoZSBvcmRlciBvdXQgaW4gdGhlIGNvdmVyIGxldHRlciB0byBnaXZlIHBh
dGNod29yayBhIGNoYW5jZSBhdCBhdXRvbWF0aWMKYnVpbGQgdGVzdGluZywgdGhvdWdoLiBUbyBj
YWxsIGl0IG91dCwgSSBiZWxpZXZlIGFkZGluZwoKQmFzZWQtb246IDIwMjMwNDAxMTEyNzMwLjIx
MDUyNDAtMS1hcGF0ZWxAdmVudGFuYW1pY3JvLmNvbQoKdG8gdGhlIGNvdmVyIGxldHRlciBzaG91
bGQgd29yay4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
