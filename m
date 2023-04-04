Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A78C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQhjQnueZDVD+6e9jq9Ff7R+a4/yYOCr0YEJNAL1j3U=; b=E7V6+lbO8W5yjq
	PHK00qtQZv3O5+a+F/1zzC4HbD4rAaMt8xo0dJa8liRV10dDGHfr9Ufx6qqkKwOPQVgdBME5EHQBa
	TkuAhGChEV1nynUC8/lMHNQ557sqR0kr8EYksfo6dXEtXckV3CnPUFjZPTifF2+lKrzDoCePykul8
	kWjSu30LklhndABGF0+gEms8BhEnhzd0jDVf+cfKGXJd3H8iPHatZRMBCb6R4AycQSMQ8VcChV4Il
	zBl62YUShKK50lSKafsvE3J5MfKD4E6KJmMCX4QzegYefmaqLgCfYHWW2xniWO0Xc6eypzinjtYDU
	luJI7Tnqr44C7zKat4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfOO-001CLX-24;
	Tue, 04 Apr 2023 12:04:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfOK-001CJ7-2n
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 12:04:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id t4so27297114wra.7
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680609837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2I56WrDZlwIyTwZv99JWrXVc0DEeAqRMvCpScLvpPM=;
        b=F3sVftBT1QGr7zDiPp6MLlWECDJLKeCxMjdAHa9LvbwfH23ZJoySJejSFzYUWQSWkM
         1KNuZ3Gn38+p9Fn9lpr0ce0HGXzeOLeb63rUS9Ashpg2I0fMLVuC6BMXWSvcuyAlIFzV
         EvohsGoRHux8Jl5droMXr+TmE+upVwgkZh3o3I4kP8eLsF1Y8kPHjzNvyQf6T+XHi9+x
         0dTNfHj/0etbmjOcrU6wbnd3OZiAaQcy6sKnaaHqRK1MC3ISEJ4a28TZCA0puV7Fxwxd
         twdvHBFDirCURjGXnAKlCqa54/hJA2B94Sy9NhUxN3O36U+R2J+5xjpu4dTtb5hjF2km
         V8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680609837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2I56WrDZlwIyTwZv99JWrXVc0DEeAqRMvCpScLvpPM=;
        b=zIPjjpnkivC9prJPY6ruGnTGDBJkw5SNZvEN9fqaa+C1KATOaO0frghVo/OsKj5dTO
         N5IOVriYC2L23glSaih65VFugfSX/ljrx57WZ/wNDt6JBSKJnewT49rTeUY3o+xV7u8t
         N+nWuD52eYd/efBfv8XPuG139bBjtJtP6V4P+6XYcAjG2q3x1G584XESzAGBgNY0ihzK
         tdDXCl3VzW+Owo8wU+XpL9DKkewHZOV5qJrkKce0CbNMr99qNKV3ZXhuWhKXpM7wZsp8
         L3lW0F0FLW0kzt2JRpZ6jZnZHru7/cOujIZCjdUFX2U547hE2evSXBbpiA2b1dHjFv3I
         FMjA==
X-Gm-Message-State: AAQBX9cot1DbLmR9OkC+G2VOnM2QMxLmUWkzn8LsA22GCoErL2r1kAbU
	YUITHGaLHSTl86y1Y635ja1KjA==
X-Google-Smtp-Source: AKy350b7Ly63qP2Zz28vd6eldPQmdJJlgZViuOREMlTV8zIkN2q/Jzc2kuKF2MYFmZ5YqYfvGOfhDQ==
X-Received: by 2002:a05:6000:51:b0:2dc:2431:67d0 with SMTP id k17-20020a056000005100b002dc243167d0mr1383808wrx.19.1680609836931;
        Tue, 04 Apr 2023 05:03:56 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e38-20020a5d5966000000b002d78a96cf5fsm12259781wri.70.2023.04.04.05.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:03:56 -0700 (PDT)
Date: Tue, 4 Apr 2023 14:03:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <p3ifmb3r7g3soolhapkzlqyt5nq7ivb53w5fb5pp3274dd4ohp@whtjluacebeo>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
 <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
 <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_050400_909243_29B3BE15 
X-CRM114-Status: GOOD (  27.39  )
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

T24gVHVlLCBBcHIgMDQsIDIwMjMgYXQgMDE6NTI6NDNQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIE1vbiwgQXByIDAzLCAyMDIzIGF0IDAyOjIzOjAxUE0gKzAyMDAsIEFuZHJldyBK
b25lcyB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDAzLCAyMDIzIGF0IDA1OjM0OjU3UE0gKzA1MzAs
IEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXByIDMsIDIwMjMgYXQgNTowMeKAr1BN
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gT24gTW9uLCBBcHIgMDMsIDIwMjMgYXQgMDM6MDM6MDhQTSArMDUzMCwgQW51cCBQYXRl
bCB3cm90ZToKPiA+ID4gPiA+IFdlIGltcGxlbWVudCBPTkVfUkVHIGludGVyZmFjZSBmb3IgQUlB
IENTUnMgYXMgYSBzZXBhcmF0ZSBzdWJ0eXBlCj4gPiA+ID4gPiB1bmRlciB0aGUgQ1NSIE9ORV9S
RUcgaW50ZXJmYWNlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgOCArKysrKysrKwo+ID4gPiA+ID4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDggKysrKysrKysKPiA+ID4gPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiA+ID4gPiBpbmRleCAxODIwMjNkYzlhNTEuLmNiYzNl
NzRmYTY3MCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaAo+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
Cj4gPiA+ID4gPiBAQCAtNzksNiArNzksMTAgQEAgc3RydWN0IGt2bV9yaXNjdl9jc3Igewo+ID4g
PiA+ID4gICAgICAgdW5zaWduZWQgbG9uZyBzY291bnRlcmVuOwo+ID4gPiA+ID4gIH07Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gKy8qIEFJQSBDU1IgcmVnaXN0ZXJzIGZvciBLVk1fR0VUX09ORV9SRUcg
YW5kIEtWTV9TRVRfT05FX1JFRyAqLwo+ID4gPiA+ID4gK3N0cnVjdCBrdm1fcmlzY3ZfYWlhX2Nz
ciB7Cj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAvKiBUSU1FUiByZWdpc3Rl
cnMgZm9yIEtWTV9HRVRfT05FX1JFRyBhbmQgS1ZNX1NFVF9PTkVfUkVHICovCj4gPiA+ID4gPiAg
c3RydWN0IGt2bV9yaXNjdl90aW1lciB7Cj4gPiA+ID4gPiAgICAgICBfX3U2NCBmcmVxdWVuY3k7
Cj4gPiA+ID4gPiBAQCAtMTA3LDYgKzExMSw3IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQg
ewo+ID4gPiA+ID4gICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UsCj4gPiA+ID4g
PiAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUNCT00sCj4gPiA+ID4gPiAgICAgICBLVk1fUklT
Q1ZfSVNBX0VYVF9aQkIsCj4gPiA+ID4KPiA+ID4gPiBMb29rcyBsaWtlIHRoaXMgcGF0Y2ggaXMg
YWxzbyBiYXNlZCBvbiAiW1BBVENIXSBSSVNDLVY6IEtWTTogQWxsb3cgWmJiCj4gPiA+ID4gZXh0
ZW5zaW9uIGZvciBHdWVzdC9WTSIKPiA+ID4gCj4gPiA+IFllcywgZG8geW91IHdhbnQgbWUgdG8g
Y2hhbmdlIHRoZSBvcmRlciBvZiBkZXBlbmRlbmN5Pwo+ID4gCj4gPiBJdCdzIHByb2JhYmx5IGJl
c3QgaWYgbmVpdGhlciBkZXBlbmQgb24gZWFjaCBvdGhlciwgc2luY2UgdGhleSdyZQo+ID4gaW5k
ZXBlbmRlbnQsIGJ1dCBvdGhlcndpc2UgdGhlIG9yZGVyIGRvZXNuJ3QgbWF0dGVyLiBJdCdkIGJl
IG5pY2UgdG8gY2FsbAo+ID4gdGhlIG9yZGVyIG91dCBpbiB0aGUgY292ZXIgbGV0dGVyIHRvIGdp
dmUgcGF0Y2h3b3JrIGEgY2hhbmNlIGF0IGF1dG9tYXRpYwo+ID4gYnVpbGQgdGVzdGluZywgdGhv
dWdoLiBUbyBjYWxsIGl0IG91dCwgSSBiZWxpZXZlIGFkZGluZwo+ID4gCj4gPiBCYXNlZC1vbjog
MjAyMzA0MDExMTI3MzAuMjEwNTI0MC0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tCj4gPiAKPiA+
IHRvIHRoZSBjb3ZlciBsZXR0ZXIgc2hvdWxkIHdvcmsuCj4gCj4gSSBhbHNvIGp1c3Qgbm90aWNl
ZCB0aGF0IHRoaXMgYmFzZWQgb24gIlJJU0MtVjogS1ZNOiBBZGQgT05FX1JFRwo+IGludGVyZmFj
ZSB0byBlbmFibGUvZGlzYWJsZSBTQkkgZXh0ZW5zaW9ucyJbMV0gYW5kIGl0IG5lZWRzIHRvIGJl
Cj4gaW4gb3JkZXIgdG8gcGljayB1cCB0aGUgS1ZNX1JFR19SSVNDVl9TVUJUWVBFX01BU0sgYW5k
Cj4gS1ZNX1JFR19SSVNDVl9TVUJUWVBFX1NISUZUIGRlZmluZXMuIEl0J2QgYmUgZ29vZCB0byBj
YWxsIHRoYXQKPiBwYXRjaCBvdXQgd2l0aCBCYXNlZC1vbi4KPiAKPiBbMV06IDIwMjMwMzMxMTc0
NTQyLjIwNjc1NjAtMi1hcGF0ZWxAdmVudGFuYW1pY3JvLmNvbQoKQW5kICJSSVNDLVYgSVBJIElt
cHJvdmVtZW50cyIsCjIwMjMwMzI4MDM1MjIzLjE0ODA5MzktMS1hcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbSwgd2hpY2ggaXMgcmVxdWlyZWQKZm9yIHJpc2N2X2dldF9pbnRjX2h3bm9kZSgpCgpUaGFu
a3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
