Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AB1C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Y7idYIy4yJc//AFmFMeNpYctjvwoEEcdrXcDP1JYfxc=; b=liLHNIFz4k2rR0SnGIwAqhJb9u
	gBmwHKfkPDqZhCaxD0mQokmqiDIltSqFf6vlOd44WUWl2NPebX0Tv9TdV/W2e03z3uhjBEdJM/p/E
	5hy1lxBaxLACHAhxfpEBSw/xbILsiXW/ue+fg/yPKcHZtI1/pTpBngx7nYI3C9TrU/gD86E8f+/Uc
	eQ0amWv6FDx4BSb//02x03uTgB3JLAzO63Y6EBWm/nhoQ4elVtv92YHVR3t50ZqD3ua7N23WYayWQ
	m8XCRRx6DwZsZgfakC+s9QQ1kvUvmK+6+NPO8C3oSFvdWXwypEawtUeX7RB75QnvcojdBmNbQ945C
	9ghGrw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM9wK-00DnOA-As; Thu, 11 Aug 2022 15:17:40 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM9wH-00DnJH-1V
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 15:17:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso5388822pjl.4
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=p+0Ss2uNSq7fjLq1VET4nazGOVqQ83BUqbunc7XQPBI=;
        b=Pz8T+gq1EEvdr/AXym9QKtEPRsBzJ7wamCO9/rxJ9T58QnrbvEhJqL47pyjPp5+pOP
         HZKV75NLQZxP83HqO8/BDSJrC3hBgHbtfLB/Yc/kl22yAvtsjU/E1YsYnCJdav/tyTGq
         17QhpzUMgrRn64ec576mjL4z+ocLIjtsGkNjbhPtSVQ2ki3Rw6qsslte2wqN5KZI+3YN
         Ekp+WLdXcfSjhn50Px73/RDsWgsW/whsB716cmJuKoWrLjBJmE7Y2/lC3ykag9+cA/kr
         oRFFdyF9oDwL0+HqKOOeTYvVz98M/N1u+M9cMupuCJ40QIAQKiVUnjCbsQggWqDP5QIL
         ElVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=p+0Ss2uNSq7fjLq1VET4nazGOVqQ83BUqbunc7XQPBI=;
        b=bl7SLGpyPsiS83HFjjkfy7YOo0u42Dwu3++Q8OgsHBYT45OczcYPAXXuEvoGroTqPH
         zIDVhGNnM5rW/02cOfpKc/4b9mfael9+w2fCPuLqv3mEwCDxSr0ZtU/vBBefMdcD6Uiu
         iDqlaBINOIgCjHEuAXyPSiqbxdh5/h08g6Af5OXjf9gJ1YeCEW4HW/tBh3Ah46kCMB8n
         AowJbg573SNTf2IL/xJTidQRl82O2BO8GIr+5lCQbYl5LfC+QxyK/syp53HXDWYw7428
         CLaUMt1uq8Drq9vqXhVAYtnfM7PNXmnu5m5QaGrYrJymbyeeRHJW0R3hixU1FBDTAcip
         HhMQ==
X-Gm-Message-State: ACgBeo1JGhc39I+FvUq//QT+YF2Lz1hPvGPRWtZYKkjreKSYLVI344Pm
	rM+y7BEu1IR4wVPz8lGgw9c9jg==
X-Google-Smtp-Source: AA6agR7mrmvdJicd/jfZ7zcQH1uf7vuoabl74bIZiNFfsk6sDeWlUQ/ihhQlxFbhCJHeq1ZfPWT7GQ==
X-Received: by 2002:a17:902:6509:b0:170:960d:ca5e with SMTP id b9-20020a170902650900b00170960dca5emr22529848plk.118.1660231053193;
        Thu, 11 Aug 2022 08:17:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s5-20020a625e05000000b0052e6d5ee183sm4141099pfb.129.2022.08.11.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:17:32 -0700 (PDT)
Date: Thu, 11 Aug 2022 08:17:32 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 08:12:34 PDT (-0700)
Subject: Re: [PATCH v4] arch/riscv: add Zihintpause support
In-Reply-To: <20220620201530.3929352-1-daolu@rivosinc.com>
CC: linux-kernel@vger.kernel.org, daolu@rivosinc.com, heiko@sntech.de,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
  guoren@kernel.org, jszhang@kernel.org, rdunlap@infradead.org, niklas.cassel@wdc.com,
  panqinglin2020@iscas.ac.cn, alexandre.ghiti@canonical.com, Rob Herring <robh@kernel.org>,
  research_trasio@irq.a4lg.com, yury.norov@gmail.com,
  linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: daolu@rivosinc.com
Message-ID: <mhng-381981dd-6fb1-48bc-bdd7-5b613160ef0f@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_081737_339493_F9CB7A6A 
X-CRM114-Status: GOOD (  27.40  )
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

T24gTW9uLCAyMCBKdW4gMjAyMiAxMzoxNToyNSBQRFQgKC0wNzAwKSwgZGFvbHVAcml2b3NpbmMu
Y29tIHdyb3RlOgo+IEltcGxlbWVudCBzdXBwb3J0IGZvciB0aGUgWmlIaW50UGF1c2UgZXh0ZW5z
aW9uLgo+Cj4gVGhlIFBBVVNFIGluc3RydWN0aW9uIGlzIGEgSElOVCB0aGF0IGluZGljYXRlcyB0
aGUgY3VycmVudCBoYXJ04oCZcyByYXRlCj4gb2YgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudCBzaG91
bGQgYmUgdGVtcG9yYXJpbHkgcmVkdWNlZCBvciBwYXVzZWQuCj4KPiBSZXZpZXdlZC1ieTogSGVp
a28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+Cj4gU2lnbmVkLW9mZi1ieTogRGFvIEx1IDxkYW9sdUByaXZvc2lu
Yy5jb20+Cj4gLS0tCj4KPiB2MSAtPiB2MjoKPiAgUmVtb3ZlIHRoZSB1c2FnZSBvZiBzdGF0aWMg
YnJhbmNoLCB1c2UgUEFVU0UgaWYgdG9vbGNoYWluIHN1cHBvcnRzIGl0Cj4gdjIgLT4gdjM6Cj4g
IEFkZGVkIHRoZSBzdGF0aWMgYnJhbmNoIGJhY2ssIGNwdV9yZWxheCgpIGJlaGF2aW9yIGlzIGtl
cHQgdGhlIHNhbWUgZm9yCj4gc3lzdGVtcyB0aGF0IGRvIG5vdCBzdXBwb3J0IFppSGludFBhdXNl
Cj4gdjMgLT4gdjQ6Cj4gIEFkb3B0ZWQgdGhlIG5ld2x5IGFkZGVkIHVuaWZpZWQgc3RhdGljIGtl
eXMgZm9yIGV4dGVuc2lvbnMKPiAtLS0KPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAg
ICAgICAgfCAgNSArKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29y
LmggfCAyMSArKysrKysrKysrKysrKysrKystLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
ICAgICAgICAgfCAgMSArCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9y
aXNjdi9NYWtlZmlsZQo+IGluZGV4IDM0Y2Y4YTU5ODYxNy4uNmRkYWNjNmY0NGI5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4g
QEAgLTU2LDYgKzU2LDEwIEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKQk6PSAk
KHJpc2N2LW1hcmNoLXkpYwo+ICB0b29sY2hhaW4tbmVlZC16aWNzci16aWZlbmNlaSA6PSAkKGNh
bGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNjdi1tYXJjaC15KV96aWNzcl96aWZlbmNlaSkK
PiAgcmlzY3YtbWFyY2gtJCh0b29sY2hhaW4tbmVlZC16aWNzci16aWZlbmNlaSkgOj0gJChyaXNj
di1tYXJjaC15KV96aWNzcl96aWZlbmNlaQo+Cj4gKyMgQ2hlY2sgaWYgdGhlIHRvb2xjaGFpbiBz
dXBwb3J0cyBaaWhpbnRwYXVzZSBleHRlbnNpb24KPiArdG9vbGNoYWluLXN1cHBvcnRzLXppaGlu
dHBhdXNlIDo9ICQoY2FsbCBjYy1vcHRpb24teW4sIC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkpX3pp
aGludHBhdXNlKQo+ICtyaXNjdi1tYXJjaC0kKHRvb2xjaGFpbi1zdXBwb3J0cy16aWhpbnRwYXVz
ZSkgOj0gJChyaXNjdi1tYXJjaC15KV96aWhpbnRwYXVzZQo+ICsKPiAgS0JVSUxEX0NGTEFHUyAr
PSAtbWFyY2g9JChzdWJzdCBmZCwsJChyaXNjdi1tYXJjaC15KSkKPiAgS0JVSUxEX0FGTEFHUyAr
PSAtbWFyY2g9JChyaXNjdi1tYXJjaC15KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IGluZGV4
IGU0OGVlYmRkMjYzMS4uZGM0NzAxOWEwYjM4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+
IEBAIC04LDYgKzgsNyBAQAo+ICAjaWZuZGVmIF9BU01fUklTQ1ZfSFdDQVBfSAo+ICAjZGVmaW5l
IF9BU01fUklTQ1ZfSFdDQVBfSAo+Cj4gKyNpbmNsdWRlIDxhc20vZXJybm8uaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2JpdHMuaD4KPiAgI2luY2x1ZGUgPHVhcGkvYXNtL2h3Y2FwLmg+Cj4KPiBAQCAt
NTQsNiArNTUsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBlbGZfaHdjYXA7Cj4gIGVudW0gcmlz
Y3ZfaXNhX2V4dF9pZCB7Cj4gIAlSSVNDVl9JU0FfRVhUX1NTQ09GUE1GID0gUklTQ1ZfSVNBX0VY
VF9CQVNFLAo+ICAJUklTQ1ZfSVNBX0VYVF9TVlBCTVQsCj4gKwlSSVNDVl9JU0FfRVhUX1pJSElO
VFBBVVNFLAo+ICAJUklTQ1ZfSVNBX0VYVF9JRF9NQVggPSBSSVNDVl9JU0FfRVhUX01BWCwKPiAg
fTsKPgo+IEBAIC02NCw2ICs2Niw3IEBAIGVudW0gcmlzY3ZfaXNhX2V4dF9pZCB7Cj4gICAqLwo+
ICBlbnVtIHJpc2N2X2lzYV9leHRfa2V5IHsKPiAgCVJJU0NWX0lTQV9FWFRfS0VZX0ZQVSwJCS8q
IEZvciAnRicgYW5kICdEJyAqLwo+ICsJUklTQ1ZfSVNBX0VYVF9LRVlfWklISU5UUEFVU0UsCj4g
IAlSSVNDVl9JU0FfRVhUX0tFWV9NQVgsCj4gIH07Cj4KPiBAQCAtODMsNiArODYsOCBAQCBzdGF0
aWMgX19hbHdheXNfaW5saW5lIGludCByaXNjdl9pc2FfZXh0MmtleShpbnQgbnVtKQo+ICAJCXJl
dHVybiBSSVNDVl9JU0FfRVhUX0tFWV9GUFU7Cj4gIAljYXNlIFJJU0NWX0lTQV9FWFRfZDoKPiAg
CQlyZXR1cm4gUklTQ1ZfSVNBX0VYVF9LRVlfRlBVOwo+ICsJY2FzZSBSSVNDVl9JU0FfRVhUX1pJ
SElOVFBBVVNFOgo+ICsJCXJldHVybiBSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRTsKPiAg
CWRlZmF1bHQ6Cj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmRzby9wcm9jZXNzb3IuaAo+IGluZGV4IDEzNDM4OGNiYWFhMS4uMWU0ZjhiNGFlZjc5IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaAo+IEBAIC00LDE1ICs0
LDMwIEBACj4KPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPgo+ICsjaW5jbHVkZSA8bGludXgvanVt
cF9sYWJlbC5oPgo+ICAjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KPiArI2luY2x1ZGUgPGFzbS9o
d2NhcC5oPgo+Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBjcHVfcmVsYXgodm9pZCkKPiAgewo+ICsJ
aWYgKCFzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3ZfaXNhX2V4dF9rZXlzW1JJU0NWX0lTQV9F
WFRfS0VZX1pJSElOVFBBVVNFXSkpIHsKPiAgI2lmZGVmIF9fcmlzY3ZfbXVsZGl2Cj4gLQlpbnQg
ZHVtbXk7Cj4gLQkvKiBJbiBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlvbiwgaW5kdWNlIGEgbG9u
Zy1sYXRlbmN5IHN0YWxsLiAqLwo+IC0JX19hc21fXyBfX3ZvbGF0aWxlX18gKCJkaXYgJTAsICUw
LCB6ZXJvIiA6ICI9ciIgKGR1bW15KSk7Cj4gKwkJaW50IGR1bW15Owo+ICsJCS8qIEluIGxpZXUg
b2YgYSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kgc3RhbGwuICovCj4g
KwkJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJkaXYgJTAsICUwLCB6ZXJvIiA6ICI9ciIgKGR1bW15
KSk7Cj4gICNlbmRpZgo+ICsJfSBlbHNlIHsKPiArCQkvKgo+ICsJCSAqIFJlZHVjZSBpbnN0cnVj
dGlvbiByZXRpcmVtZW50Lgo+ICsJCSAqIFRoaXMgYXNzdW1lcyB0aGUgUEMgY2hhbmdlcy4KPiAr
CQkgKi8KPiArI2lmZGVmIF9fcmlzY3ZfemloaW50cGF1c2UKPiArCQlfX2FzbV9fIF9fdm9sYXRp
bGVfXyAoInBhdXNlIik7Cj4gKyNlbHNlCj4gKwkJLyogRW5jb2Rpbmcgb2YgdGhlIHBhdXNlIGlu
c3RydWN0aW9uICovCj4gKwkJX19hc21fXyBfX3ZvbGF0aWxlX18gKCIuNGJ5dGUgMHgxMDAwMDBG
Iik7Cj4gKyNlbmRpZgo+ICsJfQo+ICAJYmFycmllcigpOwo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IGluZGV4
IGZiYTllOWY0NmE4Yy4uYTEyM2U5MmIxNGRkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBAQCAtODksNiArODks
NyBAQCBpbnQgcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUp
Cj4gIHN0YXRpYyBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIGlzYV9leHRfYXJyW10gPSB7Cj4g
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiks
Cj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzdnBibXQsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKSwK
PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElO
VFBBVVNFKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKCIiLCBSSVNDVl9JU0FfRVhUX01BWCks
Cj4gIH07Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggMWIzZWM0NGUyNWY1Li43MDhk
ZjJjMGJjMzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTE5OCw2ICsxOTgsNyBA
QCB2b2lkIF9faW5pdCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpCj4gIAkJCX0gZWxzZSB7Cj4gIAkJ
CQlTRVRfSVNBX0VYVF9NQVAoInNzY29mcG1mIiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRik7Cj4g
IAkJCQlTRVRfSVNBX0VYVF9NQVAoInN2cGJtdCIsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKTsKPiAr
CQkJCVNFVF9JU0FfRVhUX01BUCgiemloaW50cGF1c2UiLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBB
VVNFKTsKPiAgCQkJfQo+ICAjdW5kZWYgU0VUX0lTQV9FWFRfTUFQCj4gIAkJfQoKVGhhbmtzLCB0
aGlzIGlzIG9uIGZvci1uZXh0LiAgSXQgbmVlZHMgYSBzcGFyc2UgcGF0Y2gsIHdoaWNoIEkgcHV0
IGluIGFzIGEgbGluay4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
