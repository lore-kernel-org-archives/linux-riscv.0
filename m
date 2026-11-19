Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CF606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QdjVofDj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oLVRzpyt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k0QaS1uBWU6IpldGcJ3hIz0vJeXvhW2H/xJNA8+u7Mk=; b=QdjVofDj2HbDPor3n/FfmaMXy+
	iXP0OUzR1z8ZimUepxM+k5Swn+pkSKrwt5sO++ad7OYFpLA4NfNd7GhrVvQHfekkGBCNzco/kWcFp
	97eQhOFQjqe4Wg6MoD/iVn4IY2+PWJwQsePcidaP5HglVolB6hRDGiM1zr2ps+2BbPhbElffvGuLv
	vV7S41eAta/UzBFFdqt3XBdFG6KnnAKfDtPQ7AijemM2tXe9hx/kRQK/s2xRItyK4r0ZIFvvQgfRU
	ygDYBt82l1xdLaVXF10g+don0UZpR3xBYj7kixEUcmDahtYLn3Aa83jsM5IzHAD8nV8doEgnJT/gI
	EeZdpwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0kW-0000000Bl7l-1z1w;
	Thu, 19 Nov 2026 11:56:20 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0kT-0000000Bl7G-0Bmz
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 11:56:18 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso2303251fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 03:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089374; cv=none;
        d=google.com; s=arc-20260327;
        b=YUPzCqUEmG0PBpf66V3jIiD/AvXi70pKx0j3moOhVwKpPo4XjBvB5KiaLoUGjvtE1W
         5m5BQiX0POo8YiqgBJlQ8MekN3W7KiaqSe9Vto9nGGkIfa3bCBJW0h88fSgP+ST599Fw
         dyWfcfhIyZeMzmrJIwkVLGEf+fhP49sIs+X4RI7F/LGgC51jN65oAFwYTU+Q92mNwjiA
         vVAQsrgyGkPy7/brknvQhV8+PxfbMaLkj/+D/tbALqomLpbEDTB1f1DsHASS9xKsJ7nd
         jLGqQTK8oWPq2EZyLukHbdGA3dVczkWv9su6OnDrDKrup90f7sXp+IbRhq3N3w7eT90w
         3myA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        fh=FDTN1H+kaLLRkfmp9RxfZXVSsEkIsWAdwVBaYi+2vj0=;
        b=IqVNkgwyXNabsfrAu/DpNvsBV+09d+n2oh9sp2GycIlvNCXzamY/KBt5q4LDUGmc64
         CDMglq4MpfYXd0FYRryXuv0HX5xkJz9nsxEP3c0gxiKNQ3FUq7cUfA6cKMrqVaKLfLqy
         f6gFxsw55v2VaDXg4lD2qdz6VMDlyUpdMgb+2RxCrwZuhBWebYSupJtKFLgH9NVCSUgI
         ZZNAy8HKa9Ar2yTn9xL6gBKV+OHBmlEXznGcMh/vb+njsvfDNbhNy5MKTv4Ddb5F4UsK
         EfRKQkXArHPh4oY+5/TIPQKnz3Ft//lTnH8YqUw75m5r8KLu7LvvLRjbwME7lNhiwSYW
         8Rug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089374; x=1795694174; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=oLVRzpyt6yC5fT2IIJXVbAf+gOGbodYssp/TWSmAn/+MgZmV1gNf6tqJvTZC8VghT6
         25vtdbsNoWIMc3VhxmWCjXqEwQONn51ZWoaLDwALrtYqEBzoqdM5Fx/rYJ36wo5viRi6
         Dueg39SHg/gDcITF5kH3PiBOjCQdDV3mcyAwNQbMLp0kwbEjvkEInMu9fin24dIel6Z6
         FiTVjQc7YxhzSkY+neXPV64OPSq9/nLIFJSaBMACO40+ElIzPygop5cqlbCWHEq0GNZx
         qihSgoBUxLQbJGBOMwCoii1IDF543WNlRy9z/MrPPOHeSNyQWeyGnPv5Taxcto/cYn8R
         N88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089374; x=1795694174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=lplugkI/ecPl3pIemqBdyZiLPuEPByOqlZ3mMA4flghtDBa/0d/UY9io1mFfszUaME
         vIWSzsOB/iDjomHUlhFYFqsX+Y0LeAF3F0o1/IdAhJr31LMC1WcumoF7n6whE//3Q3af
         ASjtE0QEAJIsSW1UDT0pFpV42a5baxbCkaT47l38mDTAn1V+Q5i/1x0Pw72EaQfryxgh
         9t8HaxpJtcZZbO0F8K3jbDSzDJaQCY3hJgmuewitRhl5r9fi8Wlitj+zjY0YkkJ8GhoT
         yGfaVJH0OwPd7z3Vv+FwShxacVwQetBFjFObL5CcskNvIfpnVGDymlOl+v9LujBVb626
         EmOw==
X-Forwarded-Encrypted: i=1; AL+hErFYEsnFQhv/BqjwNNhVffw+Vq/Lbn/iwgrDluyMxeqvKxPMoEhqbh75UblI9Shk2xZX4HF2ltV1UL8wgg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+mC5srTrG1HYLbbvBIMMvH1vQutCIIn4LMa7GQYUj9msQPtcf8
	i5fqMxjT5HqjIkxBWMf079/CERkDGWQCeOec0xNqcKF3Eogennl9gsygj3iIdEGQ9cBX9j//V6n
	zPuKDbiRIxxfFh5xQaybQaqwE+XEYObI=
X-Gm-Gg: AYBFou321+FVtUb3mqhvq4DARmfCy8XMY0XLe6Y98UtALfe9WlBPufrKraIjECxkOxb
	5rSXbouKfsXTbVqIF6qHDD0/6QSAhw2xsuy8IG7ti0sjRjiNh5+ZapUTN0uXh+bNb+1GXCWrSie
	h9izLFm4HKHwJzvSxHR9X6XclJpy5y42kiwo8u/IgJxzK7U26hcg4RuvyvcXozFqSVyHUG53Dcm
	EbehJa/+gU+PvHZPup6djFRMf22DU9OBqf9m26m4oVni2s2BBvD8eyQNrpnL8b2bi79HTUsJvX9
	5mjWcgQmljvLQOGG0oGTIT0HD8l2Ncra5iz/5kGHtm692pVwh0BiCc4uEl+vKec09tG6AINKzx4
	d509gaKLClWrItn8YwL2CeJDc+vKFpR56jWqy5q2UCj7YHqBnIyEtDw8tNtKkY0dTj9Kcjpm/28
	E9Vmn94By2fSM80YEdZw==
X-Received: by 2002:a05:6512:ba9:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1a9bbdf96mr2564765e87.2.1795089373747; Thu, 19 Nov 2026
 03:56:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110070627.217946-1-inochiama@gmail.com> <20261113072305.220610-1-chenyou910331@gmail.com>
 <av2M-6w1u5mOyqDM@inochi.infowork>
In-Reply-To: <av2M-6w1u5mOyqDM@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:01 +0800
X-Gm-Features: Aa3M54riNxFLUFg84fAOhmY6bjWZvKgiNBwAs9BSg1G7sMgZ9DPXd0hZVBFcQ9M
Message-ID: <CAKspUh+LLonm90ywMGrRUcsLDE+Axw64qjs0OtDB_ySUsrPPQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hminas@synopsys.com, 
	gregkh@linuxfoundation.org, looong.bin@gmail.com, 
	dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_035617_148160_F8DECD4D 
X-CRM114-Status: GOOD (  15.49  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMDc6MzY6MDRQTSArMDgwMCwgSW5vY2hpIEFtYW90byB3
cm90ZToKPiBJZiB0aGVyZSBhcmUgbm8gb3RoZXIgYnVnIGluIHRoaXMgcGF0Y2guIFRoZXJlIHNo
b3VsZCBiZSBubyBuZXcKPiB2ZXJzaW9uLiBUaGUgZGV2aWNlIHByb2JlIHByb2JsZW0gaXMgbm90
IGEgdmVyeSBiaWcgb25lLiBBbmQgSSBoYXZlCj4gbm8gaWRlYSBhYm91dCB0aGVzZSB0aGluZy4g
U2luY2UgbXkgdGltZSBpcyB0aWdodCwgeW91IGFyZSBmcmVlIHRvCj4gc2VuZCB0aGUgZml4IGZv
ciB0aGUgZGV2aWNlIG1vZGUuCgpUaGFua3MsIEkgd2lsbCB3b3JrIG9uIGl0LgoKPiBJdCBkZXBl
bmRzLCBpZiB5b3UgYWNjZXB0IHNldHRpbmcgdGhpcyB0byBob3N0LCBJIGNhbiBhZGQgdGhlbQo+
IGF0IG9uY2UuIChOb3RlOiBvbmNlIHNldCwgbm8gY2hhbmdlIHdpbGwgYmUgYWNjZXB0ZWQpLgoK
SSB3b3VsZCBwcmVmZXIgcGVyaXBoZXJhbCBhcyB0aGUgZGVmYXVsdC4gVGhlIHZlbmRvciBrZXJu
ZWwgdXNlcwpkZXZpY2UgbW9kZSBieSBkZWZhdWx0LCBhbmQgdGhlIGJhcmUgRHVvIDI1Nk0gaXMg
dXN1YWxseSBjb25uZWN0ZWQgdG8KYSBQQyBvdmVyIFVTQi1DIChSTkRJUyk7IGhvc3QgbW9kZSBu
ZWVkcyB0aGUgSU8gYm9hcmQgb3IgYW4gT1RHCmFkYXB0ZXIuCklmIHRoZSAiaG9zdCIgbW9kZSBp
cyB1c2VkLCBpdCBtZWFucyB0aGF0IGFueW9uZSB3YW50aW5nIHRvIHVzZSB0aGUKcHJvZHVjdCB3
b3VsZCBoYXZlIHRvIHB1cmNoYXNlIGFuIGFkZGl0aW9uYWwgSS9PIGJvYXJk4oCUdGhhdCBkb2Vz
bid0CnNlZW0gbGlrZSBhIHZlcnkgZ29vZCBvcHRpb24sIGRvZXMgaXQ/CgpTaW5jZSB0aGUgcGVy
aXBoZXJhbCBkZWZhdWx0IG9ubHkgd29ya3Mgb25jZSB0aGUgYm9vdCByb2xlIGlzIGZpeGVkLApJ
IHdpbGwgc2VuZCB0aGUgZml4IHRvZ2V0aGVyIHdpdGggdGhlIER1byAyNTZNIERUUyBjaGFuZ2Ug
KGRyX21vZGUgPQoib3RnIiwgdXNiLXJvbGUtc3dpdGNoLCByb2xlLXN3aXRjaC1kZWZhdWx0LW1v
ZGUgPSAicGVyaXBoZXJhbCIpIGFzCm9uZSBzZXJpZXMgb24gdG9wIG9mIHlvdXJzLiBJcyB0aGF0
IGZpbmUgd2l0aCB5b3U/CgpSZWdhcmRzLApDaGVuLVl1CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
