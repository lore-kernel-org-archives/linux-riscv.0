Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA6EC27C78
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 02:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDq+DgeaUwXZ9yP9aNlez1RkME2eiLXMfITtUZ6rMvs=; b=0a0k0YQZUTBq8Q
	D6iDLesPAvFclfa0jH4yRAPrd7ND6oUxDABM+7SUxCJ/fjP6NGPHEjQAO9CXRg4IlI7kpYkXbIEso
	AVG7TQHZPQ/7OSgLClWMC2QJJPEqAOiXKCetuCbgClKmefALSd5YU8XZLv64tGtME7q83CYJvH2/Y
	z4eKGr0keGhDp8GHZH+gW5Akn3XQkkPNNCX5a5ZVzmpCn+mszN6I297k9zDCCMCsoPVcQeVl4KKcM
	AKEQ5BCv4tU4hpOvcge1vM/1YkscsbRk3H95ZZtznOWQ4jG//UdPcX1h+AyyPnxynj/mbFI48j5Om
	TLewBNfihANuFa/3YyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqiD-0000000BDOB-3PcF;
	Sat, 22 Jun 2024 02:42:45 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqi9-0000000BDNO-3LfY
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 02:42:43 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6f855b2499cso1447811a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 19:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719024157; x=1719628957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTwieLueSKpyVDRXh253M5R7l7vUHpUoE8U7jFyR2qY=;
        b=deoijLJ/eQ/2Aq+oknYWgGo3+Z0oBXWh0QXkwdMX2qcVel/ca91GoCSiyIwVWuqB/Z
         j3rsGv8JsOke6elppGOGpn8lU2cSn1U9LxjVmGx/v1RiBYW30y5ftEQCrWDx24ILAYPB
         GP5dlCxWruUZUOP7tOVeOZKESkEbTI0J8a5DN7TWCpTE5V2oehsuvFoD/TwwoCmzFkVY
         MvmHQh2oV6UPWXbsJJgmWNFHY5lz04ELkQ/Kslaq2pNZQW/31zzqzke4ikUh89sILrzF
         +aEPchaijb1dfkabaSlBGlLodKTVp+8kVldVsjXV1uABF+PaHzp2vLzvomZKFoGcNySV
         uiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024157; x=1719628957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTwieLueSKpyVDRXh253M5R7l7vUHpUoE8U7jFyR2qY=;
        b=WfS0SRfDPRtMJuHR08CjII3wpKtryaaogSaIxnLCW0s+DjP0veZy2mKKFCyThMZflv
         94UDkWUOqD9U15ErMwnihzQV09wXhD6CPoG6f6bCH61V0kj2/SpeDF0Ca1lamebaXpvy
         Y5uY15pswmB1+/czrj7DnEYcJ7m7D5ZRtI4kWTQL9oqQNKHB6qRxZ5lILY05GRW1w9we
         1shBQVXNW9eMhLlTMiq5ggh6dcr09r87y+mIEvJ22hAYDXEL1+Hkj96KOnkywN5mTRRt
         Iq+SzNozi6QYlX+yPa/nTQOJM+Qic+iuGdh6vFZFW449B6i3DFsO4oxDu0fDJ+tuHuF9
         8qqA==
X-Forwarded-Encrypted: i=1; AJvYcCUmP5daFiY2jDHaNDrI7OAKeHOt9AnV/qq3Pe6BN2BYvcU6TMis+qyNvtfx2H2zqvT0w6l2zzG0Y1pNLmilcPvgX+OXOKtpTkRbIOG2tI1+
X-Gm-Message-State: AOJu0Yy7kL8TCty5pIBTBZqMk5yjBjt9JCJLZL83kVQBhGCN9dYWijfq
	PUhb43nyM/yANYJvs26zbafHaBfYZyvEbhlhFVbidpliuUep4mF4ESWZFIB7axPjpa2UfIqjPOp
	pT3v5uoebFHQS5SF/2lfrBuE57Rzi0ajSuFA+EA==
X-Google-Smtp-Source: AGHT+IFHivR0NYkwKhZaqhM/IuRaVop8lkRBRo+/Zee5iD0izgB12QHg5jo+MOuyyOxhBQ6DOobL7PQhZa4C8dkv1Ik=
X-Received: by 2002:a05:6871:b08:b0:254:ac99:1152 with SMTP id
 586e51a60fabf-25c94d72a5dmr10814668fac.58.1719024157068; Fri, 21 Jun 2024
 19:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240621113143.35827-1-cuiyunhui@bytedance.com> <705FA6B0-53E6-4CF0-B840-D51EC871B596@jrtc27.com>
In-Reply-To: <705FA6B0-53E6-4CF0-B840-D51EC871B596@jrtc27.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 22 Jun 2024 10:42:25 +0800
Message-ID: <CAEEQ3wktjBkZ9x1V+YHxCom9o9e8OFk3rwVyX8DTet7TUAKxdg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: Provide the frequency of time
 CSR via hwprobe
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, costa.shul@redhat.com, 
	Andy Chiu <andy.chiu@sifive.com>, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_194241_869472_CEFEC7AF 
X-CRM114-Status: GOOD (  23.40  )
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

SGkgSmVzc2ljYSwKCk9uIFNhdCwgSnVuIDIyLCAyMDI0IGF0IDI6MDTigK9BTSBKZXNzaWNhIENs
YXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMjEgSnVuIDIwMjQsIGF0IDEy
OjMxLCBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPgo+ID4gQSBoYW5k
ZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhhdmlvciBpcyBiYXNlZCBvbiB0aGUgZnJlcXVlbmN5IG9m
IHRoZQo+ID4gdGltZSBDU1IuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2
L2h3cHJvYmUucnN0ICB8IDIgKysKPiA+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5o
ICAgICAgfCAyICstCj4gPiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwg
MSArCj4gPiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgNSArKysrKwo+
ID4gNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiBpbmRleCBmYzAxNWI0NTJlYmYu
LmMwN2YxNTlkODkwNiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
Cj4gPiBAQCAtMjI5LDMgKzIyOSw1IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoK
PiA+Cj4gPiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRWA6
IEFuIHVuc2lnbmVkIGludCB3aGljaAo+ID4gICByZXByZXNlbnRzIHRoZSBzaXplIG9mIHRoZSBa
aWNib3ogYmxvY2sgaW4gYnl0ZXMuCj4gPiArCj4gPiArKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9LRVlfVElNRV9DU1JfRlJFUWA6IEZyZXF1ZW5jeSAoaW4gSHopIG9mIGBtdGltZWAuCj4KPiBU
aGlzIHN0aWxsIHNheXMgbXRpbWUuCk9rYXksIEkgd2lsbCB1cGRhdGUgaXQgb24gdjMsIHRoYW5r
cy4KCj4KPiBKZXNzCj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiBpbmRleCA2MzA1
MDdkZmY1ZWEuLjE1MGE5ODc3YjBhZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdwcm9iZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUu
aAo+ID4gQEAgLTgsNyArOCw3IEBACj4gPgo+ID4gI2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUu
aD4KPiA+Cj4gPiAtI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgNgo+ID4gKyNkZWZpbmUg
UklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDcKPiA+Cj4gPiBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zf
aHdwcm9iZV9rZXlfaXNfdmFsaWQoX19zNjQga2V5KQo+ID4gewo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oCj4gPiBpbmRleCA3Yjk1ZmFkYmVhMmEuLjE4NzU0MzQxZmYxNCAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+IEBAIC03Myw2
ICs3Myw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiA+ICNkZWZpbmUgUklTQ1ZfSFdQUk9C
RV9NSVNBTElHTkVEX1VOU1VQUE9SVEVEICg0IDw8IDApCj4gPiAjZGVmaW5lIFJJU0NWX0hXUFJP
QkVfTUlTQUxJR05FRF9NQVNLICg3IDw8IDApCj4gPiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZ
X1pJQ0JPWl9CTE9DS19TSVpFIDYKPiA+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1RJTUVf
Q1NSX0ZSRVEgNwo+ID4gLyogSW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRk
aW5nIGl0ZW1zLiAqLwo+ID4KPiA+IC8qIEZsYWdzICovCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMKPiA+IGluZGV4IDgzZmNjOTM5ZGY2Ny4uZmMzYjQwZmI5ZGVmIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX2h3cHJvYmUuYwo+ID4gQEAgLTgsNiArOCw3IEBACj4gPiAjaW5jbHVkZSA8YXNtL2Nh
Y2hlZmx1c2guaD4KPiA+ICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4gI2luY2x1ZGUg
PGFzbS9od3Byb2JlLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9kZWxheS5oPgo+ID4gI2luY2x1ZGUg
PGFzbS9zYmkuaD4KPiA+ICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gPiAjaW5jbHVkZSA8
YXNtL3VhY2Nlc3MuaD4KPiA+IEBAIC0yMjYsNiArMjI3LDEwIEBAIHN0YXRpYyB2b2lkIGh3cHJv
YmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gPiBwYWlyLT52YWx1ZSA9
IHJpc2N2X2Nib3pfYmxvY2tfc2l6ZTsKPiA+IGJyZWFrOwo+ID4KPiA+ICsgY2FzZSBSSVNDVl9I
V1BST0JFX0tFWV9USU1FX0NTUl9GUkVROgo+ID4gKyBwYWlyLT52YWx1ZSA9IHJpc2N2X3RpbWVi
YXNlOwo+ID4gKyBicmVhazsKPiA+ICsKPiA+IC8qCj4gPiAqIEZvciBmb3J3YXJkIGNvbXBhdGli
aWxpdHksIHVua25vd24ga2V5cyBkb24ndCBmYWlsIHRoZSB3aG9sZQo+ID4gKiBjYWxsLCBidXQg
Z2V0IHRoZWlyIGVsZW1lbnQga2V5IHNldCB0byAtMSBhbmQgdmFsdWUgc2V0IHRvIDAKPiA+IC0t
Cj4gPiAyLjIwLjEKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
