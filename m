Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82D4C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNhpCZm1nHz7NQuqZnqDxAA7HG4B3Ew64bWAhl3+OEQ=; b=pOYn0gNT/U+Zn+
	O/gkrjFkQd7Vk4aGeg7I4e7ih473Ui0SXNj+s3LtVEJ43zg7F9Bk7ebIezoHi45MBYsWXnLfDOo5A
	CtGRJKPuU38+cTLje0GI7B6JPv9XyoSiz0cIaqWoc6f1YxdhWU1dF6ohi3nCAiheRTAHLFDW58afI
	sGudN8s8niAVrmdcbjnnmVJcDnbLgu0+DbNWR0Y6Nkykl8HX486f/jQDz+eZ6ztyX+6PKovYYWSVP
	HrTUfAl4ZTlH9C2PELpZ/ZHXJNpxHUmvz0U9Yfk9beaNd4VukMSPP5MuS5geirc1O/mk2wf19Z7Jw
	hoGatx4ilYVxBaOXiBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshUc-00000009QX9-338M;
	Sat, 08 Aug 2026 13:53:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshUZ-00000009QW7-43DZ
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:53:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-472326ca506so226542f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786197218; cv=none;
        d=google.com; s=arc-20260327;
        b=RMk/Qw3AkGeSIq0Rid/VIsKdBkcPp/M9Gx69P2NY1IFoAg9V4frzlFmp5aEzj+46Q9
         uZA9ne59SuXDomb4HiWZcAjzQNRUUG+avFGIsyS4WfsJ7n/lqgN2M/HDSrFgAVu1WrYw
         nBKO8hpGyJ6GY7fIt5/jrCPD4cdwnrimbrpOlTQplxY2IVnwZ16GLKJlX5RRaD8iqniY
         zwclS+ORlctRBeKcN5zEjiCl1iL3Ie7CyoIEn3OKs2vyaMmXAtHp1sDcn6rTtscVygll
         tkXrlH4GBnaSVTVCidq6FnXtLL5jvdMnTfUR6gEWsJukgyB9gDeqJG/bS17SpuI8EwsH
         HrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74xYgEIE8mnG78Ys3tNqrS7etwpa5hK5YHhCulGv8uw=;
        fh=TO+cAK2DcCDvFOLDQLxQ/V4aQhftbtlWElBlHLCOnJY=;
        b=R05jWUm9Pp2pMtqlCxcruCeqObI5vNwqt1g2vxxpbGlUreTOQEMexLx/nB5pQt4r48
         LFI1wNsS94X5KFyU7dc174uxUEKx0yfXJCkWrq8kOyuV0hnS0T0AQeAok6X0KNZsBkEj
         /dBMuC8BICrFtyHLrXqM0vAmzAz2HXN/JenUWd+suzYsKHvACSEBtMH3W6dH+UB3+D7O
         H6lAPW+mR6xaK+7ow5IVkNYWEHkPTfV5/NsXZDMyOpGiooF8W9MqZtazFJbHKQRupc2s
         Z6ZJKRL46bGB9Wx12Ezyv10yVM3rUQnLXk7IugnyHm8ctNyaf459cJHkoCmcKLQFegBy
         Baow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786197218; x=1786802018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74xYgEIE8mnG78Ys3tNqrS7etwpa5hK5YHhCulGv8uw=;
        b=i5z9m8dkdBWWugqOIWsnQkXtIPqJMqBA2oSbF43wi1dr5DmdJuiz3X9984LqO4Vj2+
         nwY2frPQlunlh+CNYHt8hmV9NhzZiK280GCRWC9HbihbEXW7rKvh4Q5gdrgpc8YZN5lt
         F3jkDUmBJ6S15ROLKLgCJog5KmOFebcsRj1THnbFBTrehoBg90EoP7Yv9VhXHN+QgTrm
         cZaQ5xP6xCqhYUFF3G09T1GDbpK2WwGMIjARs1iIg6RB9lfqxM9krvN/+SMXMh7dJCm2
         RS20GQjAM0XpV2/EEFfZxzvBjoy+6dW2/sCYK43j9TW59RRQQnHR5X6T0uVwQZUHBWhf
         DLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786197218; x=1786802018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74xYgEIE8mnG78Ys3tNqrS7etwpa5hK5YHhCulGv8uw=;
        b=M124kqqrWfRmJfW8S/JqFE12I+THvT1mdSY8HtSrHkjsJh2zt7k1nwIV25MzO+ul5s
         /AR9942KbRAX7UicVdpbuUc3KDNkMxVBx6Q9GMzAFzGalBYLqjrTwg5k+fF2HFE8FmhR
         oB0e/N9oQO9rNXvSnyNQ3ZvbRhB+7AbMWlGpziVUtD85Xfx4Odqgo8EUHKLeFjCq10Sx
         kX/qKYdzEjc8g68sU1EgpCvs5jX4i4T6SuA31Orea+YwBi31YtRLcXv4d5KDwgOVkTQ4
         PpFDpJQISGJviIgNaDGrxFPI/wMz9x3/RBA7PD9zOPSlE5ATljdXN8SI753t+K6JZOTB
         0xhg==
X-Forwarded-Encrypted: i=1; AHgh+RobW4qJbofBQuX4V/mqZGJ9Iqf1cC0hN8d9LLmA9uCPbqz0BLrs3xbtcBhJvq0D8CEMbCfpTbTGCniD/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMDm+zSp3J+QQhPcbx2sr92Xtv7pEb8tc4KDZKpWnGXsaWm2CR
	c/szNJdv8Z4+w4cgf48kqCCs9LiaqV4NTxvHLxYhOV4oBpca123hoZqRYu6YFU43dVCyML3m+Ar
	ZE/6GlOjNP0dxUW3joCYlgLeOA2NO7ccrWyt2n4M59g==
X-Gm-Gg: AR+sD11SllIqtnRQKfFXhyPOt6BqEfTTaT/I+Zv34cFt0SA1k9MSwr6jMTpcw5tI2V8
	nPWLbZFH3hDTUTTNo3CllnFhA+fcB3JXJt7rysw24V3rdWBSz2fuisykx99fDf5dvec7Snth17K
	F5ZCeLy82qRY+kTamY8TQdjXdjR6J/3FTCnnZq4A6y6giLRVbSJO28R+oPPYl08kf49L+ygaTzK
	KMfu2LXl/hSR4WDljNvVMsQI5LHI6hZN4jYQQZdPDp4+rwa4ow9LaIPuLRdANLbKRt1SZvsJWka
	ePltZ059MSLN8qsQY9Ng6w+U061IwilwEtpsDvZqYlJjrGHinEQ/F3wST9xFiK7Fn68OZQa0Lj6
	7eUo5oemNC2tVHiz/Q7oksk5qnuFleEp8qC3IfdwLUWGP6lgo4vVP4g+XZ+8NmYI=
X-Received: by 2002:a05:600c:35c8:b0:499:593b:a15b with SMTP id
 5b1f17b1804b1-499593ba192mr238069085e9.1.1786197218018; Sat, 08 Aug 2026
 06:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-kvm-cpu-pm-v4-0-146bf942547d@sifive.com> <20260721-kvm-cpu-pm-v4-1-146bf942547d@sifive.com>
In-Reply-To: <20260721-kvm-cpu-pm-v4-1-146bf942547d@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 8 Aug 2026 19:23:26 +0530
X-Gm-Features: AUfX_myz_LWEpWkQBi4Qgji9kmSumRPQ2nVtYheU7XgWx1CkLYrVIiuTenhmXOE
Message-ID: <CAAhSdy2f79uavqQb0_VxC_xCxX_c5DcFbbH-CfTA8bUGp=JAqg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] KVM: RISC-V: Clear former VCPU cache on
 virtualization disable
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_065340_040609_E17F05AD 
X-CRM114-Status: GOOD (  21.54  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMTE6MjLigK9BTSBZb25nLVh1YW4gV2FuZwo8eW9uZ3h1
YW4ud2FuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdoZW4gYSBDUFUgaXMgdGFrZW4gb2ZmbGlu
ZSBvciBlbnRlcnMgZGVlcCBpZGxlIHN0YXRlcywgaHlwZXJ2aXNvciBDU1IKPiBzdGF0ZSBpcyBs
b3N0LiBUaGUga3ZtX2Zvcm1lcl92Y3B1IGZhc3QtcGF0aCBvcHRpbWl6YXRpb24gY2FjaGVzIHRo
ZQo+IGxhc3QgVkNQVSB0aGF0IHJhbiBvbiBlYWNoIENQVSB0byBhdm9pZCBleHBlbnNpdmUgQ1NS
IHJlc3RvcmF0aW9uIHdoZW4KPiB0aGUgc2FtZSBWQ1BVIGlzIHJlLXNjaGVkdWxlZCBvbiB0aGUg
c2FtZSBDUFUuIEhvd2V2ZXIsIGlmIHRoaXMgY2FjaGUKPiBpcyBub3QgY2xlYXJlZCB3aGVuIENT
UiBzdGF0ZSBpcyBsb3N0LCB0aGUgbmV4dCBWQ1BVIGVudHJ5IHdpbGwKPiBpbmNvcnJlY3RseSBz
a2lwIENTUiByZXN0b3JhdGlvbiwgbGVhZGluZyB0byBjb3JydXB0IGh5cGVydmlzb3Igc3RhdGUu
Cj4KPiBBZGQga3ZtX3Jpc2N2X2NsZWFyX2Zvcm1lcl92Y3B1KCkgdG8gaW52YWxpZGF0ZSB0aGUg
cGVyLUNQVSBjYWNoZSBhbmQKPiBjYWxsIGl0IGZyb20ga3ZtX2FyY2hfZGlzYWJsZV92aXJ0dWFs
aXphdGlvbl9jcHUoKSB0byBlbnN1cmUgcHJvcGVyIENTUgo+IHJlc3RvcmF0aW9uIGFmdGVyIENQ
VSBvZmZsaW5lIG9yIHN5c3RlbSBzdXNwZW5kIGV2ZW50cy4KPgo+IEZpeGVzOiAxMzIzYTVjZmU1
MmMgKCJLVk06IHJpc2N2OiBTa2lwIENTUiByZXN0b3JlIGlmIFZDUFUgaXMgcmVsb2FkZWQgb24g
dGhlIHNhbWUgY29yZSIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1
YW4ud2FuZ0BzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMwoKVGhhbmtz
LApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMiAr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBp
bmRleCA2MDAxN2NlZWM5ZDIuLjgwOGI0ZWUxYmQxMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKPiBAQCAtMzE5LDYgKzMxOSw4IEBAIGJvb2wga3ZtX3Jpc2N2X3ZjcHVfc3RvcHBl
ZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3Jk
X3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPgo+ICt2b2lkIGt2bV9yaXNjdl9j
bGVhcl9mb3JtZXJfdmNwdSh2b2lkKTsKPiArCj4gIC8qIEZsYWdzIHJlcHJlc2VudGluZyBpbXBs
ZW1lbnRhdGlvbiBzcGVjaWZpYyBkZXRhaWxzICovCj4gIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxT
RShrdm1fcmlzY3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBpbmRleCAwOTI0Yzc1MTAw
YTIuLjM1MGU0ZjA5N2Q2ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBAQCAtNjksNiArNjksOCBAQCB2b2lkIGt2bV9h
cmNoX2Rpc2FibGVfdmlydHVhbGl6YXRpb25fY3B1KHZvaWQpCj4gICAgICAgICBjc3Jfd3JpdGUo
Q1NSX0hFREVMRUcsIDApOwo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9ISURFTEVHLCAwKTsKPgo+
ICsgICAgICAga3ZtX3Jpc2N2X2NsZWFyX2Zvcm1lcl92Y3B1KCk7Cj4gKwo+ICAgICAgICAga3Zt
X3Jpc2N2X25hY2xfZGlzYWJsZSgpOwo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggY2Y2ZTIzMWU3NmUyLi5l
NDgzMzhmOTA3ZjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTI2LDYgKzI2LDE3IEBACj4KPiAgc3RhdGljIERF
RklORV9QRVJfQ1BVKHN0cnVjdCBrdm1fdmNwdSAqLCBrdm1fZm9ybWVyX3ZjcHUpOwo+Cj4gK3Zv
aWQga3ZtX3Jpc2N2X2NsZWFyX2Zvcm1lcl92Y3B1KHZvaWQpCj4gK3sKPiArICAgICAgIC8qCj4g
KyAgICAgICAgKiBDbGVhciB0aGUgcGVyLUNQVSBmb3JtZXIgVkNQVSBwb2ludGVyIGJlY2F1c2Ug
aHlwZXJ2aXNvciBDU1Igc3RhdGUKPiArICAgICAgICAqIHdpbGwgYmUgbG9zdC4gVGhpcyBlbnN1
cmVzIHRoYXQgdGhlIG5leHQgVkNQVSBlbnRyeSB3aWxsIHByb3Blcmx5Cj4gKyAgICAgICAgKiBy
ZXN0b3JlIGFsbCBDU1JzIGluc3RlYWQgb2YgaW5jb3JyZWN0bHkgc2tpcHBpbmcgQ1NSIHJlc3Rv
cmF0aW9uCj4gKyAgICAgICAgKiB2aWEgdGhlIGZhc3QtcGF0aCBvcHRpbWl6YXRpb24uCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIF9fdGhpc19jcHVfd3JpdGUoa3ZtX2Zvcm1lcl92Y3B1LCBOVUxM
KTsKPiArfQo+ICsKPiAgY29uc3Qgc3RydWN0IGt2bV9zdGF0c19kZXNjIGt2bV92Y3B1X3N0YXRz
X2Rlc2NbXSA9IHsKPiAgICAgICAgIEtWTV9HRU5FUklDX1ZDUFVfU1RBVFMoKSwKPiAgICAgICAg
IFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBlY2FsbF9leGl0X3N0YXQpLAo+Cj4gLS0KPiAyLjQz
LjcKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
