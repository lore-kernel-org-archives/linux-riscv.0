Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB3C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOSkNjcGgxY3/n2xF3ybaN2M4lL34LWzlqLgieEz39E=; b=uMI46kgWue4WjE
	mXq+XFh2331bSdpiRm111+Omej+Rc1EkodaA/PsDcQ7/fnu2JNE+cVoW+IobmGwaXPszVXQj8EQiR
	ogImXr9rJhBLFfSEFMfSlyhK+QxEW1wXJEvnrzZBo6XnxB5/XVDDRMpPr2N0Q5zlb8KjEty735xeb
	KZNdk5voWB6kbgRK9+2skRb3V+3prlGPHMnk0iPCqGLgeONuI5O0Fqq+8czrJzwVDmRcYN3428nah
	xNS1/xMotLuX/rWi3ctDYhTbKEnFCF5rrw6LIMuDBGByPq1qGeJtg2FPtP3nbuQExbWqJFMc2Bhue
	fIIJ0LFbO5TXIwGV2+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLNI-00000004jOR-3elL;
	Wed, 29 May 2024 15:38:00 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLNG-00000004jNL-1vTk
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 15:38:00 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5b3241373adso1489897eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716997075; x=1717601875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov2D+2oeWLpaCt/DoBPVldLq4Kd7iArWem0f5cVDUbY=;
        b=jUfutEMluomXGG6Y+nax+2F+QBxh34afuMJRKSQXBImxur4Vhj+XM0HWmsUxG7fbpW
         g3O9GIFpHpaNXofuUUDL4REEr+KsJCH7zjStLbSlcEPUKREbZqxEF712rJnai/En/6c0
         bHasSCb0sSLxnLF5g12TyR4DC3mJUx1IIqBgHEgmBIj02mGRCYUC7f49npm5lvdEQ8mL
         +4gOBq1fYyq3JECEzHyicg+Uy6BXSZLlMdHg9Tgg3WyYwl66dLQ7OBecVuSxpsX3bDzu
         soJW6oOq98cWCXsronlt0jvdq2E0rZ0i3fftqL6rbP/D09UOfnP6dIcFsmSPzYrThkHQ
         HWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716997075; x=1717601875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov2D+2oeWLpaCt/DoBPVldLq4Kd7iArWem0f5cVDUbY=;
        b=SOCGN7WQkoDHekhDTpx4tylEQukKtLyBSTcs2ueB/UUxN2XWcAa57IRUbMJmkrcl1J
         3+cIhQzkCWSyNwgOA9O2EdaOLurX15JWEmarORqjhOR1wujnf9QCmPAbk9Y9i5E/WAgF
         j1FNbv8rW4f8/vmi1taCYy6+7YAl3uJVnQ0sjvjexYoW0UmN2+TzrTo/VzytGwJn4DiE
         Dtmy9tt2MkrvVpXss8bdeiZXa6zNFAfTYCYAyZE/nMjmMdHvMFtyVYHhF0uHyko+hmUA
         eVvC1mS/nK6/BUGTahgq2t/xVrKf1UV9vSs9XWmbYlIpCNvkcmSTThmiSnm4/lQ3VHOG
         ovYA==
X-Gm-Message-State: AOJu0Yz0ICK2HCqo0/pMej6+OBw8Zk0vooohDF7w03ryVViDdwThu3C3
	i58HlM/4UXFi/lBUpTuKZhjdM2lJOnzgu66SGJT8GJ/F8+VNHazPjik/FfI04T9DwI+U/E0u9Q4
	flIKYbeAbNFi7f5naIAH4UiBzOustDk9xuOOhNQ==
X-Google-Smtp-Source: AGHT+IGS7W148PMF8J8TUAXvOdM8fKSQLm9b76VbH7+E9Q81U1pf2I4K4Hql5K8R89EuENV+uk3qfP8BUCLdH0RZV7k=
X-Received: by 2002:a05:6820:d89:b0:5b9:89d9:c5ee with SMTP id
 006d021491bc7-5b989d9c7a9mr9559064eaf.1.1716997075096; Wed, 29 May 2024
 08:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com> <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
In-Reply-To: <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 29 May 2024 23:37:43 +0800
Message-ID: <CAMWQL2iwH_hiwXD7QtzvioQsjfrU=o7jd0hWF6K-Kd=XM3w7Ng@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension Support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_083758_721803_4BB70FE0 
X-CRM114-Status: GOOD (  28.74  )
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

SGkgQW5kcmV3LAoKT24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgMTI6MjXigK9BTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDI0LCAy
MDI0IGF0IDA2OjMzOjAxUE0gR01ULCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IFN2YWR1IGlz
IGEgUklTQy1WIGV4dGVuc2lvbiBmb3IgaGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRz
Lgo+ID4KPiA+IEluIHRoaXMgcGF0Y2ggd2UgZGV0ZWN0IFN2YWR1IGV4dGVuc2lvbiBzdXBwb3J0
IGZyb20gRFRCIGFuZCBlbmFibGUgaXQKPiA+IHdpdGggU0JJIEZXRlQgZXh0ZW5zaW9uLiBBbHNv
IHdlIGFkZCBhcmNoX2hhc19od19wdGVfeW91bmcoKSB0byBlbmFibGUKPiA+IG9wdGltaXphdGlv
biBpbiBNR0xSVSBhbmQgX193cF9wYWdlX2NvcHlfdXNlcigpIGlmIFN2YWR1IGV4dGVuc2lvbiBp
cwo+ID4gYXZhaWxhYmxlLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogSmlueXUgVGFuZyA8dGp5
dGltaUAxNjMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlueXUgVGFuZyA8dGp5dGltaUAxNjMu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lm
aXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4KPiBJIHRoaW5rIHRoaXMgcGF0Y2ggY2hhbmdlZCB0b28gbXVjaCB0byBrZWVw
IHItYidzLiBXZSBkaWRuJ3QgaGF2ZSB0aGUKPiBGV0ZUIHBhcnQgYmVmb3JlLgo+CgpvaywgSSB3
aWxsIHJlbW92ZSB0aGVtLgoKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAg
ICAgICAgIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggICAgIHwgIDEg
Kwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgIHwgIDEgKwo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDggKysrKysrKy0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgICB8IDExICsrKysrKysrKysrCj4gPiAgNSBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gaW5kZXggYmUwOWM4
ODM2ZDU2Li4zMGZhNTU4ZWUyODQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gQEAgLTM0LDYgKzM0LDcgQEAgY29uZmln
IFJJU0NWCj4gPiAgICAgICBzZWxlY3QgQVJDSF9IQVNfUE1FTV9BUEkKPiA+ICAgICAgIHNlbGVj
dCBBUkNIX0hBU19QUkVQQVJFX1NZTkNfQ09SRV9DTUQKPiA+ICAgICAgIHNlbGVjdCBBUkNIX0hB
U19QVEVfU1BFQ0lBTAo+ID4gKyAgICAgc2VsZWN0IEFSQ0hfSEFTX0hXX1BURV9ZT1VORwo+ID4g
ICAgICAgc2VsZWN0IEFSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQIGlmIE1NVQo+ID4gICAgICAgc2Vs
ZWN0IEFSQ0hfSEFTX1NFVF9NRU1PUlkgaWYgTU1VCj4gPiAgICAgICBzZWxlY3QgQVJDSF9IQVNf
U1RSSUNUX0tFUk5FTF9SV1ggaWYgTU1VICYmICFYSVBfS0VSTkVMCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3Ny
LmgKPiA+IGluZGV4IDI0NjhjNTU5MzNjZC4uMmFjMjcwYWQ0YWNkIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaAo+ID4gQEAgLTE5NCw2ICsxOTQsNyBAQAo+ID4gIC8qIHhFTlZDRkcgZmxhZ3Mg
Ki8KPiA+ICAjZGVmaW5lIEVOVkNGR19TVENFICAgICAgICAgICAgICAgICAgKF9BQygxLCBVTEwp
IDw8IDYzKQo+ID4gICNkZWZpbmUgRU5WQ0ZHX1BCTVRFICAgICAgICAgICAgICAgICAoX0FDKDEs
IFVMTCkgPDwgNjIpCj4gPiArI2RlZmluZSBFTlZDRkdfQURVRSAgICAgICAgICAgICAgICAgIChf
QUMoMSwgVUxMKSA8PCA2MSkKPiA+ICAjZGVmaW5lIEVOVkNGR19DQlpFICAgICAgICAgICAgICAg
ICAgKF9BQygxLCBVTCkgPDwgNykKPiA+ICAjZGVmaW5lIEVOVkNGR19DQkNGRSAgICAgICAgICAg
ICAgICAgKF9BQygxLCBVTCkgPDwgNikKPiA+ICAjZGVmaW5lIEVOVkNGR19DQklFX1NISUZUICAg
ICAgICAgICAgNAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gaW5kZXggZTE3ZDAwNzhhNjUx
Li44ZDUzOWUzZjRlMTEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gQEAgLTgx
LDYgKzgxLDcgQEAKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTyAgICAgICAgICAgNzIK
PiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFDQVMgICAgICAgICAgNzMKPiA+ICAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWEFOREVTUE1VICAgICAgICAgICAgICA3NAo+ID4gKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9TVkFEVSAgICAgICAgICA3NQo+ID4KPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfWExJTlVYRU5WQ0ZHICAgMTI3Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+
IGluZGV4IDlmOGVhMGUzM2ViMS4uMWYxYjMyNmNjZjYzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4gPiBAQCAtMTE3LDYgKzExNyw3IEBACj4gPiAgI2luY2x1ZGUgPGFzbS90
bGJmbHVzaC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9tbV90eXBlcy5oPgo+ID4gICNpbmNsdWRl
IDxhc20vY29tcGF0Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gPgo+ID4g
ICNkZWZpbmUgX19wYWdlX3ZhbF90b19wZm4oX3ZhbCkgICgoKF92YWwpICYgX1BBR0VfUEZOX01B
U0spID4+IF9QQUdFX1BGTl9TSElGVCkKPiA+Cj4gPiBAQCAtMjg1LDcgKzI4Niw2IEBAIHN0YXRp
YyBpbmxpbmUgcHRlX3QgcHVkX3B0ZShwdWRfdCBwdWQpCj4gPiAgfQo+ID4KPiA+ICAjaWZkZWYg
Q09ORklHX1JJU0NWX0lTQV9TVk5BUE9UCj4gPiAtI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+
Cj4gPgo+ID4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfc3ZuYXBvdCh2b2lkKQo+
ID4gIHsKPiA+IEBAIC02MjEsNiArNjIxLDEyIEBAIHN0YXRpYyBpbmxpbmUgcGdwcm90X3QgcGdw
cm90X3dyaXRlY29tYmluZShwZ3Byb3RfdCBfcHJvdCkKPiA+ICAgICAgIHJldHVybiBfX3BncHJv
dChwcm90KTsKPiA+ICB9Cj4gPgo+ID4gKyNkZWZpbmUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nIGFy
Y2hfaGFzX2h3X3B0ZV95b3VuZwo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2hhc19od19w
dGVfeW91bmcodm9pZCkKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gcmlzY3ZfaGFzX2V4dGVuc2lv
bl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NWQURVKTsKPiA+ICt9Cj4gPiArCj4gPiAgLyoKPiA+
ICAgKiBUSFAgZnVuY3Rpb25zCj4gPiAgICovCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBp
bmRleCAzZWQyMzU5ZWFlMzUuLmIwMjM5MDhjNTkzMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gPiBAQCAtOTMsNiArOTMsMTYgQEAgc3RhdGljIGJvb2wgcmlzY3ZfaXNhX2V4dGVu
c2lvbl9jaGVjayhpbnQgaWQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ID4gICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4g
KyAgICAgY2FzZSBSSVNDVl9JU0FfRVhUX1NWQURVOgo+ID4gKyAgICAgICAgICAgICBpZiAoc2Jp
X3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpID4gMCkgewo+Cj4gSSB0aGluayB3ZSd2ZSBk
ZWNpZGVkIHRoZSBhcHByb3ByaWF0ZSB3YXkgdG8gcHJvdmUgZm9yIFNCSSBleHRlbnNpb25zIGlz
Cj4gdG8gZmlyc3QgZW5zdXJlIHRoZSBTQkkgdmVyc2lvbiBhbmQgdGhlbiBkbyB0aGUgcHJvYmUs
IGxpa2Ugd2UgZG8gZm9yIFNUQQo+IGluIGhhc19wdl9zdGVhbF9jbG9jaygpCj4KCm9rLCBJIHdp
bGwgYWRkIHRoZSBTQkkgdmVyc2lvbiBjaGVjay4KCj4gPiArICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHNiaXJldCByZXQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
c2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX1NFVCwgU0JJX0ZXRlRfUFRFX0FE
X0hXX1VQREFUSU5HLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAx
LCAwLCAwLCAwLCAwKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
LmVycm9yID09IFNCSV9TVUNDRVNTOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiA+ICAgICAgIGNhc2UgUklTQ1ZfSVNBX0VYVF9JTlZBTElEOgo+
ID4gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAgICAgICB9Cj4gPiBAQCAtMzAxLDYg
KzMxMSw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtd
ID0gewo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3NhaWEsIFJJU0NWX0lTQV9FWFRf
U1NBSUEpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lT
QV9FWFRfU1NDT0ZQTUYpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0YywgUklT
Q1ZfSVNBX0VYVF9TU1RDKSwKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzdmFk
dSwgUklTQ1ZfSVNBX0VYVF9TVkFEVSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAo+Cj4gV2Ug
ZG8gd2UgbmVlZCBYTElOVVhFTlZDRkc/Cj4KClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QgdGhlIGNv
bW1lbnRzIG9mIHJpc2N2X3hsaW51eGVudmNmZ19leHRzLCBJIHdpbGwKcmVtb3ZlIGl0IGluIHRo
ZSBuZXh0IHZlcnNpb24uCgpSZWdhcmRzLApZb25nLVh1YW4KCgo+IFRoYW5rcywKPiBkcmV3Cj4K
PiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWwsIFJJU0NWX0lTQV9FWFRfU1ZJ
TlZBTCksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdm5hcG90LCBSSVNDVl9JU0Ff
RVhUX1NWTkFQT1QpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZwYm10LCBSSVND
Vl9JU0FfRVhUX1NWUEJNVCksCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
