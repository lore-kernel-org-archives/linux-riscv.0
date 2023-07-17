Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE53EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4UZD4RdtKmrwWP1QEEyCVbASurMGN+O4Ax5BMN4dao=; b=YCLoaHXMQIxeJM
	nQ86VPFlfXuZjZypQ1taSEmuLpTock+2+iFXiIg2hRGmD27njGNKNcQAer2G65VDF8tMLJCZHk1YQ
	JidwwhLgkjiatphdqbcA9Mj29Rxb8Qwb/apfL/VwIgzjftlxpoZ4wWIVDIAQyitSebYPwTKww+Bm0
	dvVnbz3ZQDIJC7nWv7oCUTZLd/fgjTnoyUOZ03/jhpGwEWovIwaUC169d4+eOc4h6wTOvXCA4YWps
	V0c8m2+4A5rf2gpk38hgd1PD8EHhmUhgTxlPNMIQHbk5H7Awh7Xh11hwD2pGpMHDM3WcoMruYNq0Y
	Qji/OaSTUG+FmO0Mahvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRDt-004Z1c-2R;
	Mon, 17 Jul 2023 16:37:21 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRDq-004YzF-1V
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 16:37:19 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-346258cf060so2275ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689611836; x=1690216636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uIEdBE5/V8mtrIJ86bMEt1YlGPQReRHT+9wS4K4FB4=;
        b=OWHrFN2QTW3UJN0pNRFGTth7sEd5Dw7sjggstuUU7FV9QMT2n63OgPRS5VJJVeGyDl
         Z1aCxXXSSL7lbOeKaqH9uzgIZoOd3a4cSFlQWY8DAAVk2hVhBktYxB3Cjl0Qr6hg0f2N
         cbxxuZL/fYo6GBCiyMmZc7+utv9P9s70Y7FI287tO+3wr0A+ZGEOlF49j/9FY9aMyq98
         SQmF6dsU04+/lJBQcBsO5YwCCOp43Pw83PRsVPqbFJUbzaSBmheT5yPv+dkXMPda7xZ+
         8g2BcY5k4LYQ+33V19zi2oOHswaaMCCFMEfRQKmssQNIZE4Z/gLXt9l18MBgmieiGH90
         hTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611836; x=1690216636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uIEdBE5/V8mtrIJ86bMEt1YlGPQReRHT+9wS4K4FB4=;
        b=c++9soYwuPWPEAkTfSBzUJqHElqBhVn8ruG3rQMN5HOHH3ISLeFUa0Vy9zEDnX9PAr
         LiFenOM9Zov1/8M8xjs2ytDsBQX40Z+3/B9bTbPAOX03bU4T8lPOGe3Ys9mJDUNJgVJ0
         Db6lzfeXYwOQibRh5T1d7Pu7hOHtpyfDdVm1HZPEvjG4wmHa5Cg+hEnTVNOvW3fFZ5V7
         4Y60SMav4FNjyqB//AUzAGCvqcoaiil0L3rJLFVA8QsXY4Q6Int8sGfTekufpaPbgOP8
         YEyKx3l1f8OsJAabBwa1frz55vYazO5Fp84jhhHbRaR5uYFY+oqggsja8x4I3vuvhKEW
         JSEA==
X-Gm-Message-State: ABy/qLbo8pa0wn5sF0bUdo3FdXyPZ+V8jtgSjq5KjyqqXEpunzta5kQC
	Zdv5kDZGl7PTLs66NPC0BM6zz3czl4Tbfv30YSzjRQ==
X-Google-Smtp-Source: APBJJlGMfnLl/VH8ZDf7IouzF+AemA7yqLQkI7oavRJWnulUuwCOZ3ikGsNQPfEomUZ5dTddNqkXnqp2ix1LaTkk0TQ=
X-Received: by 2002:a05:6e02:1c2e:b0:348:72eb:150d with SMTP id
 m14-20020a056e021c2e00b0034872eb150dmr599165ilh.21.1689611836063; Mon, 17 Jul
 2023 09:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com> <20230715005405.3689586-4-rananta@google.com>
 <199d18de-1214-7683-b87a-03cc7e49719a@redhat.com>
In-Reply-To: <199d18de-1214-7683-b87a-03cc7e49719a@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 17 Jul 2023 09:37:04 -0700
Message-ID: <CAJHc60zhVco3uTq97vDHMk8cgg1psPtwHT6MN1eKP1Yr18d9cw@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] KVM: Allow range-based TLB invalidation from
 common code
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_093718_506125_A49493FB 
X-CRM114-Status: GOOD (  24.25  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNDo0MOKAr0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5n
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDcvMTUvMjMgMDg6NTMsIFJhZ2hhdmVuZHJh
IFJhbyBBbmFudGEgd3JvdGU6Cj4gPiBGcm9tOiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29n
bGUuY29tPgo+ID4KPiA+IE1ha2Uga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkgdmlzaWJs
ZSBpbiBjb21tb24gY29kZSBhbmQgY3JlYXRlIGEKPiA+IGRlZmF1bHQgaW1wbGVtZW50YXRpb24g
dGhhdCBqdXN0IGludmFsaWRhdGVzIHRoZSB3aG9sZSBUTEIuCj4gPgo+ID4gVGhpcyBwYXZlcyB0
aGUgd2F5IGZvciBzZXZlcmFsIGZ1dHVyZSBmZWF0dXJlcy9jbGVhbnVwczoKPiA+Cj4gPiAgIC0g
SW50cm9kdWN0aW9uIG9mIHJhbmdlLWJhc2VkIFRMQkkgb24gQVJNLgo+ID4gICAtIEVsaW1pbmF0
aW5nIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX21lbXNsb3QoKQo+ID4gICAtIE1vdmluZyB0
aGUgS1ZNL3g4NiBURFAgTU1VIHRvIGNvbW1vbiBjb2RlLgo+ID4KPiA+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE1hdGxhY2sgPGRt
YXRsYWNrQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5h
bnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3No
YW5AcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oIHwgIDMgKysrCj4gPiAgIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICAgICAgICAgfCAgOSAr
KysrLS0tLS0KPiA+ICAgYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaCB8ICAzIC0tLQo+
ID4gICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgIHwgIDkgKysrKysrKysrCj4gPiAg
IHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCj4gPiAg
IDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+IGluZGV4IGEyZDNjZmMyZWI3NS4uMDg5MDBhZmJm
MmFkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4g
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gQEAgLTE4MDQsNiArMTgw
NCw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVj
dCBrdm0gKmt2bSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9UU1VQUDsKPiA+ICAgfQo+
ID4KPiA+ICsjZGVmaW5lIF9fS1ZNX0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCU19SQU5HRQo+
ID4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0s
IGdmbl90IHN0YXJ0X2dmbiwgdTY0IHBhZ2VzKTsKPiA+ICsKPiA+ICAgI2RlZmluZSBrdm1fYXJj
aF9wbWlfaW5fZ3Vlc3QodmNwdSkgXAo+ID4gICAgICAgKCh2Y3B1KSAmJiAodmNwdSktPmFyY2gu
aGFuZGxpbmdfaW50cl9mcm9tX2d1ZXN0KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
dm0vbW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwo+ID4gaW5kZXggZWMxNjlmNWM3
ZGNlLi5hYWE1ZTMzNjcwM2EgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5j
Cj4gPiArKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCj4gPiBAQCAtMjc4LDE2ICsyNzgsMTUg
QEAgc3RhdGljIGlubGluZSBib29sIGt2bV9hdmFpbGFibGVfZmx1c2hfcmVtb3RlX3RsYnNfcmFu
Z2Uodm9pZCkKPiA+ICAgICAgIHJldHVybiBrdm1feDg2X29wcy5mbHVzaF9yZW1vdGVfdGxic19y
YW5nZTsKPiA+ICAgfQo+ID4KPiA+IC12b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShz
dHJ1Y3Qga3ZtICprdm0sIGdmbl90IHN0YXJ0X2dmbiwKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnZm5fdCBucl9wYWdlcykKPiA+ICtpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3Rl
X3RsYnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sIHU2NCBwYWdlcykK
PiA+ICAgewo+ID4gICAgICAgaW50IHJldCA9IC1FT1BOT1RTVVBQOwo+ID4KPiA+ICAgICAgIGlm
IChrdm1feDg2X29wcy5mbHVzaF9yZW1vdGVfdGxic19yYW5nZSkKPiA+ICAgICAgICAgICAgICAg
cmV0ID0gc3RhdGljX2NhbGwoa3ZtX3g4Nl9mbHVzaF9yZW1vdGVfdGxic19yYW5nZSkoa3ZtLCBz
dGFydF9nZm4sCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG5yX3BhZ2VzKTsKPiA+IC0gICAgIGlmIChyZXQpCj4gPiAt
ICAgICAgICAgICAgIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhrdm0pOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhZ2VzKTsKPiBUaGlzIHdpbGwgYmUgZ29vZCBpZiBwYXJhbWV0ZXIgcGFnZXMgYWxpZ25lZCB3
aXRoIHBhcmFtZXRlciBrdm0uCj4KQWdyZWVkLCBidXQgcHVsbGluZyAncGFnZXMnIGFib3ZlIGJy
aW5ncyB0aGUgY2hhciBjb3VudCB0byA4My4gSWYKdGhhdCdzIGFjY2VwdGFibGUsIEknbSBoYXBw
eSB0byBkbyBpdCBpbiB2Ny4KClRoYW5rIHlvdS4KUmFnaGF2ZW5kcmEKPiBSZXZpZXdlZC1ieTog
U2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4KPiA+ICsKPiA+ICsgICAgIHJldHVy
biByZXQ7Cj4gPiAgIH0KPiA+Cj4gPiAgIHN0YXRpYyBnZm5fdCBrdm1fbW11X3BhZ2VfZ2V0X2dm
bihzdHJ1Y3Qga3ZtX21tdV9wYWdlICpzcCwgaW50IGluZGV4KTsKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oIGIvYXJjaC94ODYva3ZtL21tdS9tbXVfaW50
ZXJuYWwuaAo+ID4gaW5kZXggZDM5YWY1NjM5Y2U5Li44NmNiODNiYjM0ODAgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCj4gPiArKysgYi9hcmNoL3g4Ni9r
dm0vbW11L21tdV9pbnRlcm5hbC5oCj4gPiBAQCAtMTcwLDkgKzE3MCw2IEBAIGJvb2wga3ZtX21t
dV9zbG90X2dmbl93cml0ZV9wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCB1NjQg
Z2ZuLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBtaW5fbGV2ZWwp
Owo+ID4KPiA+IC12b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICpr
dm0sIGdmbl90IHN0YXJ0X2dmbiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
Zm5fdCBucl9wYWdlcyk7Cj4gPiAtCj4gPiAgIC8qIEZsdXNoIHRoZSBnaXZlbiBwYWdlIChodWdl
IG9yIG5vdCkgb2YgZ3Vlc3QgbWVtb3J5LiAqLwo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQga3Zt
X2ZsdXNoX3JlbW90ZV90bGJzX2dmbihzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgaW50IGxl
dmVsKQo+ID4gICB7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiBpbmRleCBlM2Y5NjhiMzhhZTkuLmE3MzE5Njdi
MjRmZiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gKysrIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiBAQCAtMTM1OSw2ICsxMzU5LDcgQEAgaW50IGt2
bV92Y3B1X3lpZWxkX3RvKHN0cnVjdCBrdm1fdmNwdSAqdGFyZ2V0KTsKPiA+ICAgdm9pZCBrdm1f
dmNwdV9vbl9zcGluKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCB5aWVsZF90b19rZXJuZWxf
bW9kZSk7Cj4gPgo+ID4gICB2b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICpr
dm0pOwo+ID4gK3ZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2
bSwgZ2ZuX3QgZ2ZuLCB1NjQgcGFnZXMpOwo+ID4KPiA+ICAgI2lmZGVmIEtWTV9BUkNIX05SX09C
SlNfUEVSX01FTU9SWV9DQUNIRQo+ID4gICBpbnQga3ZtX21tdV90b3B1cF9tZW1vcnlfY2FjaGUo
c3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICptYywgaW50IG1pbik7Cj4gPiBAQCAtMTQ4Niw2
ICsxNDg3LDE0IEBAIHN0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJz
KHN0cnVjdCBrdm0gKmt2bSkKPiA+ICAgfQo+ID4gICAjZW5kaWYKPiA+Cj4gPiArI2lmbmRlZiBf
X0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlNfUkFOR0UKPiA+ICtzdGF0aWMgaW5saW5l
IGludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3Qg
Z2ZuLCB1NjQgcGFnZXMpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4g
K30KPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICAgI2lmZGVmIF9fS1ZNX0hBVkVfQVJDSF9OT05DT0hF
UkVOVF9ETUEKPiA+ICAgdm9pZCBrdm1fYXJjaF9yZWdpc3Rlcl9ub25jb2hlcmVudF9kbWEoc3Ry
dWN0IGt2bSAqa3ZtKTsKPiA+ICAgdm9pZCBrdm1fYXJjaF91bnJlZ2lzdGVyX25vbmNvaGVyZW50
X2RtYShzdHJ1Y3Qga3ZtICprdm0pOwo+ID4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWlu
LmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gPiBpbmRleCBkNmIwNTA3ODYxNTUuLjgwNDQ3MGZj
Y2FjNyAxMDA2NDQKPiA+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiA+ICsrKyBiL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKPiA+IEBAIC0zNjYsNiArMzY2LDE5IEBAIHZvaWQga3ZtX2ZsdXNoX3Jl
bW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSkKPiA+ICAgfQo+ID4gICBFWFBPUlRfU1lNQk9MX0dQ
TChrdm1fZmx1c2hfcmVtb3RlX3RsYnMpOwo+ID4KPiA+ICt2b2lkIGt2bV9mbHVzaF9yZW1vdGVf
dGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgdTY0IHBhZ2VzKQo+ID4gK3sK
PiA+ICsgICAgIGlmICgha3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoa3ZtLCBnZm4s
IHBhZ2VzKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgLyoKPiA+
ICsgICAgICAqIEZhbGwgYmFjayB0byBhIGZsdXNoaW5nIGVudGlyZSBUTEJzIGlmIHRoZSBhcmNo
aXRlY3R1cmUgcmFuZ2UtYmFzZWQKPiA+ICsgICAgICAqIFRMQiBpbnZhbGlkYXRpb24gaXMgdW5z
dXBwb3J0ZWQgb3IgY2FuJ3QgYmUgcGVyZm9ybWVkIGZvciB3aGF0ZXZlcgo+ID4gKyAgICAgICog
cmVhc29uLgo+ID4gKyAgICAgICovCj4gPiArICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoa3Zt
KTsKPiA+ICt9Cj4gPiArCj4gPiAgIHN0YXRpYyB2b2lkIGt2bV9mbHVzaF9zaGFkb3dfYWxsKHN0
cnVjdCBrdm0gKmt2bSkKPiA+ICAgewo+ID4gICAgICAga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2Fs
bChrdm0pOwo+Cj4gLS0KPiBTaGFvcWluCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
