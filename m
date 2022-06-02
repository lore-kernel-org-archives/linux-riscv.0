Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3071C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 05:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SybgHKTd5MYxEVBavKSdfbqCOJMclj8aJFfLNyQ02vU=; b=AD6tdxoj4K1OAm4p+/RP6guWQa
	E7BmjINlUtFZmpvR695TuELw+C98KXt3Sb6iFSVE9pPAF6U/ryKysqrJpdsygnSkQpnVgaX6KC5dh
	xSNK7+XBp/V8snBxvhGoEgiXIkWb7RzTg6VaJ1ve9w57GVi+ZNt0bqEnff9wQg/s9mbB+xpjaXhwI
	gkRENOPadvJabxAIMmeVdAhKlBiVFxRHZklUfqnw7j3R+dm0dPd1h4ig13tVPjvsZNq9BTn1lo2b+
	88rAAxP1+rKHB7K5mKhf3leFlRvHdExzA3xoR+Ycbevx9X1uDej7HiOqO68wE7OEzBQiiTx8sk6B0
	2WfVK/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdKm-001RGj-QZ; Thu, 02 Jun 2022 05:25:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdKj-001RDl-Cz
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 05:25:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so3939472pjq.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 22:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=nelGoRK+fUlDKeet8T6l+sbmUXeRjWjPVssTQWUr0Ig=;
        b=vy3yfyw9SSoKqKUSG57P5OxTHOUY0U58Reiri26Ry2fbin3EOFn9+OMZRlJPFsxqdS
         YR7e4cJWsWrfEYJk0S28SJdXVJWDQ7D0rSroeuZf8t5mc8lR1vmpReLG4xpqV9GOzxRt
         wuvlSQlvWOimcQL03fXEcHpkFkR995r446bETmFN47vO6yPUXm2bALrmR0JrNLafZghM
         uM7meFZsKE13WCTsTDPB/nRSUJP244sgpBfuXabsLjbEm6bKapJt32prrTCM9sOObgCL
         NHaSBr38dhMAXqsqY85ED+a9L+UfsJgVbCpkErO7DgXoBjKxliNsA8J7F1zUfyxPezBb
         4cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=nelGoRK+fUlDKeet8T6l+sbmUXeRjWjPVssTQWUr0Ig=;
        b=oeo8FBByXsct1I0DC3drh6u2byoK28sf4JeCkYqzmV3YaGfwfEFmJ7lFInG4D19m1b
         lSOJGieRZWatsijP1GxJUqs7g88AzzeRMz4upO8BZqfnV8rIdf0FgpXip/iezW6BXeot
         cZUjMXp/8ALWS1SplCMRyytCr7zS5FhSeAiA3JRetJPkBK3ZacT9PlFiG2d/U8tSu2UM
         CG1bN8guXZVYzyguVCEi5eXfIwMs5hI7X7rfJ4DAKwYQCb3esLE5dYBtRWjkOh6h4Rjx
         JcbCvQNZlz9A4O5y6Qxx9rXM4kgK7YexzhLPCvkaMMAav4mdmkjT9Ppz+fCisR7dkPiP
         qJ9g==
X-Gm-Message-State: AOAM530YL5LPsBD9EbL9mgohNUoJ4l48r4jPxrgUVPtZfz+5rQcU/fUL
	Afte/BmDeBOJJoorQ1XXvcZYZg==
X-Google-Smtp-Source: ABdhPJzMXV9QJAtuK5pym+rv06ZhuwstBd4WZB8JJPd7lfWyo0CdXpHHu3SEHpum9mdsVWX+p+JXbg==
X-Received: by 2002:a17:902:ea0b:b0:164:81f:682f with SMTP id s11-20020a170902ea0b00b00164081f682fmr3115061plg.39.1654147516250;
        Wed, 01 Jun 2022 22:25:16 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b00163b66d90b2sm2518364plg.126.2022.06.01.22.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 22:25:15 -0700 (PDT)
Date: Wed, 01 Jun 2022 22:25:15 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 22:25:06 PDT (-0700)
Subject: Re: [PATCH v2] arch/riscv: add Zihintpause support
In-Reply-To: <20220524211954.1936117-1-daolu@rivosinc.com>
CC: linux-kernel@vger.kernel.org, daolu@rivosinc.com, heiko@sntech.de,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
  rdunlap@infradead.org, robh@kernel.org, alexandre.ghiti@canonical.com, panqinglin2020@iscas.ac.cn,
  research_trasio@irq.a4lg.com, jszhang@kernel.org,
  linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: daolu@rivosinc.com
Message-ID: <mhng-62ce3647-fc60-42ce-bff0-9436c7e15028@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_222521_702959_2716B517 
X-CRM114-Status: GOOD (  25.32  )
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

T24gVHVlLCAyNCBNYXkgMjAyMiAxNDoxOTo1MCBQRFQgKC0wNzAwKSwgZGFvbHVAcml2b3NpbmMu
Y29tIHdyb3RlOgo+IEltcGxlbWVudCBzdXBwb3J0IGZvciB0aGUgWmlIaW50UGF1c2UgZXh0ZW5z
aW9uLgo+Cj4gVGhlIFBBVVNFIGluc3RydWN0aW9uIGlzIGEgSElOVCB0aGF0IGluZGljYXRlcyB0
aGUgY3VycmVudCBoYXJ04oCZcyByYXRlIG9mCj4gaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudCBzaG91
bGQgYmUgdGVtcG9yYXJpbHkgcmVkdWNlZCBvciBwYXVzZWQuCj4KPiBSZXZpZXdlZC1ieTogSGVp
a28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+Cj4gU2lnbmVkLW9mZi1ieTogRGFvIEx1IDxkYW9sdUByaXZvc2lu
Yy5jb20+Cj4gLS0tCj4KPiB2MSAtPiB2MjoKPiAgUmVtb3ZlIHRoZSB1c2FnZSBvZiBzdGF0aWMg
YnJhbmNoLCB1c2UgUEFVU0UgaWYgdG9vbGNoYWluIHN1cHBvcnRzIGl0CgpTb3JyeSBmb3IgdGhl
IGJhY2sgYW5kIGZvcnRoIGhlcmUsIGJ1dCBJTU8gd2UgZG8gd2FudCB0byBwcm9iZSBmb3IgdGhp
cyAKYXQgcnVudGltZTogc3VyZSB0aGVyZSdzIG5vIGlzc3VlIGV4ZWN1dGluZyB0aGUgcGF1c2Ug
KGFzaWRlIGZyb20gdGhhdCAKUEMgc2lsbGluZXNzLCBidXQgd2UndmUgYWxsIGFncmVlZCB0byBp
Z25vcmUgdGhhdCkgYnV0IHdlIHN0aWxsIG5lZWQgdG8gCmV4ZWN1dGUgdGhlIGRpdiBvbiBwbGF0
Zm9ybXMgdGhhdCBwcmVkYXRlIFppaGludHBhdXNlIG90aGVyd2lzZSB3ZSAKcmVncmVzcyBvbiBj
cHVfcmVsYXgoKSB0aGVyZS4gIElJVUMgdGhlcmUncyBzdGlsbCBubyBoYXJkd2FyZSB3aXRoIApa
aWhpbnRwYXVzZSwgc28gcmVncmVzc2luZyBvbiByZWFsIGhhcmR3YXJlIGluIGZhdm9yIG9mIGFu
IHVuaW1wbGVtZW50ZWQgCmV4dGVuc2lvbiBpcyB0aGUgd3Jvbmcgd2F5IHRvIGdvLgoKU2hvdWxk
IGJlIHByZXR0eSBlYXN5IHRvIGRvIHRoaXMgd2l0aCB0aGUgYWx0ZXJuYXRpdmVzIG1lY2hhbmlz
bS4KCj4KPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgNCArKysr
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICB8IDEgKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggfCA4ICsrKysrKystCj4gIGFyY2gv
cmlzY3Yva2VybmVsL2NwdS5jICAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgfCAyICsrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
TWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gaW5kZXggN2Q4MTEwMmNmZmQ0Li45MDBh
OGZkYTFhMmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ICsrKyBiL2FyY2gv
cmlzY3YvTWFrZWZpbGUKPiBAQCAtNTYsNiArNTYsMTAgQEAgcmlzY3YtbWFyY2gtJChDT05GSUdf
UklTQ1ZfSVNBX0MpCTo9ICQocmlzY3YtbWFyY2gteSljCj4gIHRvb2xjaGFpbi1uZWVkLXppY3Ny
LXppZmVuY2VpIDo9ICQoY2FsbCBjYy1vcHRpb24teW4sIC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkp
X3ppY3NyX3ppZmVuY2VpKQo+ICByaXNjdi1tYXJjaC0kKHRvb2xjaGFpbi1uZWVkLXppY3NyLXpp
ZmVuY2VpKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3ppY3NyX3ppZmVuY2VpCj4KPiArIyBDaGVjayBp
ZiB0aGUgdG9vbGNoYWluIHN1cHBvcnRzIFppaGludHBhdXNlIGV4dGVuc2lvbgo+ICt0b29sY2hh
aW4tc3VwcG9ydHMtemloaW50cGF1c2UgOj0gJChjYWxsIGNjLW9wdGlvbi15biwgLW1hcmNoPSQo
cmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UpCj4gK3Jpc2N2LW1hcmNoLSQodG9vbGNoYWluLXN1
cHBvcnRzLXppaGludHBhdXNlKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3ppaGludHBhdXNlCj4gKwo+
ICBLQlVJTERfQ0ZMQUdTICs9IC1tYXJjaD0kKHN1YnN0IGZkLCwkKHJpc2N2LW1hcmNoLXkpKQo+
ICBLQlVJTERfQUZMQUdTICs9IC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkpCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gaW5kZXggMDczNGU0MmY3NGYyLi5jYWE5ZWU1NDU5YjQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oCj4gQEAgLTUyLDYgKzUyLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcg
ZWxmX2h3Y2FwOwo+ICAgKi8KPiAgZW51bSByaXNjdl9pc2FfZXh0X2lkIHsKPiAgCVJJU0NWX0lT
QV9FWFRfU1NDT0ZQTUYgPSBSSVNDVl9JU0FfRVhUX0JBU0UsCj4gKwlSSVNDVl9JU0FfRVhUX1pJ
SElOVFBBVVNFLAo+ICAJUklTQ1ZfSVNBX0VYVF9JRF9NQVggPSBSSVNDVl9JU0FfRVhUX01BWCwK
PiAgfTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vz
c29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPiBpbmRleCAx
MzQzODhjYmFhYTEuLjRkZTkxMWEyNTA1MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zk
c28vcHJvY2Vzc29yLmgKPiBAQCAtOCw3ICs4LDEzIEBACj4KPiAgc3RhdGljIGlubGluZSB2b2lk
IGNwdV9yZWxheCh2b2lkKQo+ICB7Cj4gLSNpZmRlZiBfX3Jpc2N2X211bGRpdgo+ICsjaWZkZWYg
X19yaXNjdl96aWhpbnRwYXVzZQo+ICsJLyoKPiArCSAqIFJlZHVjZSBpbnN0cnVjdGlvbiByZXRp
cmVtZW50Lgo+ICsJICogVGhpcyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgo+ICsJICovCj4gKwlf
X2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7Cj4gKyNlbGlmIF9fcmlzY3ZfbXVsZGl2Cj4g
IAlpbnQgZHVtbXk7Cj4gIAkvKiBJbiBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlvbiwgaW5kdWNl
IGEgbG9uZy1sYXRlbmN5IHN0YWxsLiAqLwo+ICAJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJkaXYg
JTAsICUwLCB6ZXJvIiA6ICI9ciIgKGR1bW15KSk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBpbmRleCBjY2I2MTc3OTFl
NTYuLjg5ZTU2M2U5YzRjYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gQEAgLTg4LDYgKzg4LDcgQEAgaW50IHJp
c2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+ICAgKi8KPiAg
c3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNhX2V4dF9hcnJbXSA9IHsKPiAgCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKPiAr
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBB
VVNFKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKCIiLCBSSVNDVl9JU0FfRVhUX01BWCksCj4g
IH07Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggMWIyZDQyZDdmNTg5Li4zN2ZmMDY2
ODJhZTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTI1LDYgKzI1LDcgQEAgc3Rh
dGljIERFQ0xBUkVfQklUTUFQKHJpc2N2X2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpIF9fcmVhZF9t
b3N0bHk7Cj4gIF9fcm9fYWZ0ZXJfaW5pdCBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShjcHVfaHdj
YXBfZnB1KTsKPiAgI2VuZGlmCj4KPiArCj4gIC8qKgo+ICAgKiByaXNjdl9pc2FfZXh0ZW5zaW9u
X2Jhc2UoKSAtIEdldCBiYXNlIGV4dGVuc2lvbiB3b3JkCj4gICAqCj4gQEAgLTE5Miw2ICsxOTMs
NyBAQCB2b2lkIF9faW5pdCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpCj4gIAkJCQlzZXRfYml0KCpl
eHQgLSAnYScsIHRoaXNfaXNhKTsKPiAgCQkJfSBlbHNlIHsKPiAgCQkJCVNFVF9JU0FfRVhUX01B
UCgic3Njb2ZwbWYiLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKTsKPiArCQkJCVNFVF9JU0FfRVhU
X01BUCgiemloaW50cGF1c2UiLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKTsKPiAgCQkJfQo+
ICAjdW5kZWYgU0VUX0lTQV9FWFRfTUFQCj4gIAkJfQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
