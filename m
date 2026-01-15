Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF372D3CC88
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wjVSEL9WZS55nv2Ph/g2o0H0h571clW4iVPPuDM0Kk=; b=Wipb1n0KMcGemL
	L1NibcB28yx7+KVO+yXGx7fNaj9V0Pni7xtlbIf5sQuuxo2ZDWlCsOH6HVtpfafbRUAD1hkLIU+za
	XSYS305mTQl48guLqGdaL057sA/0nc59GpGjMWEghvilZ5OoJdDyxnMnBkvJEK/bowIAzQ0LKCN9Q
	NH9O8YFXlCAJtn/xt4sjD/5+/cJH6xE3YMf/t4evtXOvxrdkr+vXBarMF03Kg85VdQKBApb8g9R0C
	UHSBMyLMdwa1Mzvh7XJFX3Uk3DbKMlaXSAehT/H0zBXF9k4odMn1MKW8GtjS8rYeb1ufLbr8hOlV4
	OhR/jdD7/Mt9dL7eNm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBuB-0000000BLXj-3S4Q;
	Thu, 15 Jan 2026 01:12:07 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBu6-0000000BLVQ-2J34
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 01:12:04 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5eea3fe88bdso143880137.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 17:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768439521; x=1769044321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUr1YpmXUWWfc7TvOLgzjWtFpZs3Z7OTVcw608ZR5w0=;
        b=dg6govHebG1gCneDY1saigj5q3yryOUN/4ixTY/fB+40S85e21IVN3B9+hVC4oLza0
         Po/U79l7qcHFozvL50CWdh7dRhM1oP1zudZEclGM+2dpqYGiLhrwwIb3W0N/0N/QVbGC
         Fvol/Qe1ZY9kMC2wjZdcf+6ruEyUQNQ6FD8fH2GHdc41BShbxyY0RFGIVYa+INFmsEC2
         hcKxR1NXTMvDn9AlxE99FFaKatoJhqdXvdNLlA7nAMqQaXqr/dAgtR1jhSc9dS7/v9N5
         OKFAPKFChodMW2CGnQCIL+Pim8Gr1pE0faCmiR3Bh62g63oQzYOIVng7qpqzpZ0zZ4Xy
         KueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768439521; x=1769044321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUr1YpmXUWWfc7TvOLgzjWtFpZs3Z7OTVcw608ZR5w0=;
        b=Y93pMVJjImnBa16f6+QYU5T8TrxtyQE9ODlsuvT6G20xXyLFVKVS4ltCQik/ZlVNXq
         HsSz0duVlcnyTri85yr87EliaL5/YFOGJWW7i2NWXp6ryOtWs5Mesf7YcOoNGL7UX3pO
         3DQrHGyTZqxo17HqzxvWVaP4QFFqK9az9ugwH6azHp7cRECkzH5Ffycx91MytN8tBaMa
         EzhXEFewoTQDyFENMvF8DPUz/2s5MGG0Wm+URJNMQ9MwMhmGINBjsbW0sCXX100ZyxXF
         uXJVfFJpL4FExrQEHVuqC0wylKV6lzzT3yDxMGWEkScU4fzTtWOOASRL+gKE06NI5TUh
         A0OA==
X-Forwarded-Encrypted: i=1; AJvYcCUVwejZCAMiHQxnIPuJyn4mtedCgpJaCry7nxaDQmUvcUEatltEtvRwrxNaCNygIpNYe7seDkGxF/LpOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqrwH0Ov2VTupGA7SVG+wnYqBcgjbBs6OYwvZSxZ8DyVSzEBcv
	2oCBeYhPILVmMJvdlkPTz9RGLO2ptEroONE44fFiuTqH0EDeLTWB6AD+qwogdvwW9JRlV82n4Mz
	dDtvFuSIoLeLxipNmkM9Uo7oyvw8uWLI=
X-Gm-Gg: AY/fxX7hC7Sg/AkL4cmFGDZsVHvdmzBykWKFP23n32faHFiOem6vbu/eTmpGkItTTL+
	1u4eMWdf+EuTLJPK+tiZHVPi8kMCmk8bKaFlk0CwkIf0tiLzgHV/CJeTVIFgeX+B4hWnhso/uU6
	8MvaduZwI5dTUKcxBrlvAqN6YaGY93WoFy0WPXFq/qjheUhj29BJkupKZyuIq8sJlTjUSzZAgZN
	j1NDex5hg8TlsStb6KCgYoxfVqemwTN2WH0SHKFwMLiPGKvc+/VrDkvpRStmLtzqfA0fPpeUA==
X-Received: by 2002:a05:6102:1611:b0:5ee:a55c:882 with SMTP id
 ada2fe7eead31-5f17f43d3bcmr2256437137.12.1768439521237; Wed, 14 Jan 2026
 17:12:01 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
 <20260104135938.524-3-naohiko.shimizu@gmail.com> <CAAhSdy2rH5Jt5t7zCRfFd5d1X7qG41QoUuWvKgwuKX=X3Wk6cA@mail.gmail.com>
In-Reply-To: <CAAhSdy2rH5Jt5t7zCRfFd5d1X7qG41QoUuWvKgwuKX=X3Wk6cA@mail.gmail.com>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Thu, 15 Jan 2026 10:11:52 +0900
X-Gm-Features: AZwV_Qh3_8WiK11p2oDu-jwTcTccWhocAbVxHWGZR4SGJ8O3cJg7N4AR5bNOlrk
Message-ID: <CAA7_YY_ej7+mSi+i0NpHNeHv=a5n5_eGkjBi8pu2u=8h0Opsbg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
To: Anup Patel <anup@brainfault.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_171202_597873_E56E0214 
X-CRM114-Status: GOOD (  20.58  )
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

VGhhbmsgeW91IHZlcnkgbXVjaCwgQW51cC4KSSBhcHByZWNpYXRlIHlvdXIgcmV2aWV3IGFuZCBx
dWV1aW5nIHRoaXMgYXMgZml4ZXMgZm9yIHY2LjE5LgoKTmFvaGlrbwoKCk9uIE1vbiwgSmFuIDUs
IDIwMjYgYXQgMTozMeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3Rl
Ogo+Cj4gT24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjMw4oCvUE0gTmFvaGlrbyBTaGltaXp1Cj4g
PG5hb2hpa28uc2hpbWl6dUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFJWMzIsIHVwZGF0
aW5nIHRoZSA2NC1iaXQgc3RpbWVjbXAgKG9yIHZzdGltZWNtcCkgQ1NSIHJlcXVpcmVzIHR3bwo+
ID4gc2VwYXJhdGUgMzItYml0IHdyaXRlcy4gQSByYWNlIGNvbmRpdGlvbiBleGlzdHMgaWYgdGhl
IHRpbWVyIHRyaWdnZXJzCj4gPiBkdXJpbmcgdGhlc2UgdHdvIHdyaXRlcy4KPiA+Cj4gPiBUaGUg
UklTQy1WIFByaXZpbGVnZWQgU3BlY2lmaWNhdGlvbiAoZS5nLiwgU2VjdGlvbiAzLjIuMSBmb3Ig
bXRpbWVjbXApCj4gPiByZWNvbW1lbmRzIGEgc3BlY2lmaWMgMy1zdGVwIHNlcXVlbmNlIHRvIGF2
b2lkIHNwdXJpb3VzIGludGVycnVwdHMKPiA+IHdoZW4gdXBkYXRpbmcgNjQtYml0IGNvbXBhcmlz
b24gcmVnaXN0ZXJzIG9uIDMyLWJpdCBzeXN0ZW1zOgo+ID4KPiA+IDEuIFNldCB0aGUgbG93LW9y
ZGVyIGJpdHMgKHN0aW1lY21wKSB0byBhbGwgb25lcyAoVUxPTkdfTUFYKS4KPiA+IDIuIFNldCB0
aGUgaGlnaC1vcmRlciBiaXRzIChzdGltZWNtcGgpIHRvIHRoZSBkZXNpcmVkIHZhbHVlLgo+ID4g
My4gU2V0IHRoZSBsb3ctb3JkZXIgYml0cyAoc3RpbWVjbXApIHRvIHRoZSBkZXNpcmVkIHZhbHVl
Lgo+ID4KPiA+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gd3JpdGVzIHRoZSBMU0IgZmlyc3Qgd2l0
aG91dCBlbnN1cmluZyBhIGZ1dHVyZQo+ID4gdmFsdWUsIHdoaWNoIG1heSBsZWFkIHRvIGEgdHJh
bnNpZW50IHN0YXRlIHdoZXJlIHRoZSA2NC1iaXQgY29tcGFyaXNvbgo+ID4gaXMgaW5jb3JyZWN0
bHkgZXZhbHVhdGVkIGFzICJleHBpcmVkIiBieSB0aGUgaGFyZHdhcmUuIFRoaXMgcmVzdWx0cyBp
bgo+ID4gc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkb3B0
cyB0aGUgc3BlYy1yZWNvbW1lbmRlZCAzLXN0ZXAgc2VxdWVuY2UgdG8gZW5zdXJlIHRoZQo+ID4g
aW50ZXJtZWRpYXRlIDY0LWJpdCBzdGF0ZSBpcyBuZXZlciBzbWFsbGVyIHRoYW4gdGhlIGN1cnJl
bnQgdGltZS4KPiA+Cj4gPiBGaXhlczogOGY1Y2I0NGIxYmFlICgiUklTQy1WOiBLVk06IFN1cHBv
cnQgc3N0YyBleHRlbnNpb24iKQo+ID4gU2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1IDxu
YW9oaWtvLnNoaW1penVAZ21haWwuY29tPgo+Cj4gTEdUTS4KPgo+IFJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+Cj4gUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9y
IExpbnV4LTYuMTkuCj4KPiBUaGFua3MsCj4gQW51cAo+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3RpbWVyLmMgfCA2ICsrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfdGltZXIuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ID4gaW5kZXgg
ODVhNzI2MjExNWUxLi5mMzYyNDdlNGM3ODMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3RpbWVyLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ID4g
QEAgLTcyLDggKzcyLDkgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV90aW1lcl9jYW5jZWwo
c3RydWN0IGt2bV92Y3B1X3RpbWVyICp0KQo+ID4gIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVf
dXBkYXRlX3ZzdGltZWNtcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBuY3ljbGVzKQo+ID4g
IHsKPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfMzJCSVQpCj4gPiAtICAgICAgIG5jc3Jfd3JpdGUo
Q1NSX1ZTVElNRUNNUCwgbmN5Y2xlcyAmIDB4RkZGRkZGRkYpOwo+ID4gKyAgICAgICBuY3NyX3dy
aXRlKENTUl9WU1RJTUVDTVAsICBVTE9OR19NQVgpOwo+ID4gICAgICAgICBuY3NyX3dyaXRlKENT
Ul9WU1RJTUVDTVBILCBuY3ljbGVzID4+IDMyKTsKPiA+ICsgICAgICAgbmNzcl93cml0ZShDU1Jf
VlNUSU1FQ01QLCAodTMyKW5jeWNsZXMpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgIG5jc3Jfd3Jp
dGUoQ1NSX1ZTVElNRUNNUCwgbmN5Y2xlcyk7Cj4gPiAgI2VuZGlmCj4gPiBAQCAtMzA3LDggKzMw
OCw5IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfdGltZXJfcmVzdG9yZShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4KPiA+ICAjaWYgZGVmaW5lZChD
T05GSUdfMzJCSVQpCj4gPiAtICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMil0
LT5uZXh0X2N5Y2xlcyk7Cj4gPiArICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgVUxP
TkdfTUFYKTsKPiA+ICAgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01QSCwgKHUzMikodC0+
bmV4dF9jeWNsZXMgPj4gMzIpKTsKPiA+ICsgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01Q
LCAodTMyKSh0LT5uZXh0X2N5Y2xlcykpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgIG5jc3Jfd3Jp
dGUoQ1NSX1ZTVElNRUNNUCwgdC0+bmV4dF9jeWNsZXMpOwo+ID4gICNlbmRpZgo+ID4gLS0KPiA+
IDIuMzkuNQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
