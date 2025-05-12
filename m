Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691AEC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 05:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztXejFdyouGukvz6wsQ/36AZ9DnisEEKt+lZTEzZZ4E=; b=yi3GyAy18ny6fA
	3Zh7VzpqsvvkhKe0nGLEcy1/YvU7n4xPfyhN2MnNm0pZmpTWK/QBtwhbx0wkhpYK7kPQIFe64XqF/
	Hwm7ZsMZlJsM3e8FrtCN8MuIB3mWwPmfbAUhEHfsKGL4KPmRAPmJAq1HzyXiYk8S9Kvu3C+ndQGWA
	jxVVVSoceJ8UeR4jlp/oR6aqzN0Dga604Ip33dDxP0J4YuMrSf0FiaNbHOtK6mOKRjn6EJuM++EI4
	K+SR1p1QDq7s+DYwGgKuxk9uVBMC0Yf4CpSI1gS3Bg6+8jLUqW+d8FDLrDmrOJgtclcqJT2JannfA
	HttOLvaGkr4tZOnuhFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELWK-00000008OT4-2gyp;
	Mon, 12 May 2025 05:16:08 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELWG-00000008OSZ-41O4
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 05:16:06 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-47688ae873fso45486301cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 22:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747026960; x=1747631760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB5Kuig9Ct+DdoXuLwf5DLRPBtpEPgDetACmtfHem3U=;
        b=ExhuO8RN9Po3Py2HlGSgFr7Z0MSfozuUF6c7GmPE4A1IcF0F+KikANcwd6HO0PjeuE
         /OO9M6QA+8SM9nRKogqgo83DuQGaQGBUHN4B8ykzkRifUeeTdryQbfrxM8hLxj6EBcRR
         YmNhObACPxBVrYw0t3G1tGH5E4yFYI2tMDfD10FfC5/bl2rn9ouQfkIk/ZCfeOfn6KCD
         GMs2WFSwyouHOnmJ12LOVdtEJOnLp0sHAt3BEh8cEvlQeetfLths+Fc0SBCualUAV4nE
         qLTr7Ajl9iN5puPQ2DKXWMmxN9ZgUpR0AjnvOSCYEUnNddaCjAJ05boNbMjxFJ53yF4q
         9rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747026960; x=1747631760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB5Kuig9Ct+DdoXuLwf5DLRPBtpEPgDetACmtfHem3U=;
        b=v9Qh85DZMPQ3pR+5/LWpHF8WWWwc7dv5oek/1WeeCQ/DQgA7I/afr8PdqFlXbf7Rqu
         Szu6T9y2LEI1vnPTTgF5q91sIz3tC3/iSfa5/o9XEVOFtHWQnppOMeEsXkELgC+9izra
         Kqd8G7bhtRWeV358ivPbGV2HvKZZcn4baJwgWYmsrx52/W9h95LgcI1EpmqDm+CxLbZq
         AFlSuHJgCGHuIvx/VOpv8LN3OTbSVL9FNIkidpAr0KNFXZjRk+ZRBV0gp71Xg2xJKWg5
         UYQLIR+d+p7kXu8ju1shiaZSSXpzKpA5FjA1IPEClk9TG7LqgprZqD4AtbWXToPXtpvd
         Ufvw==
X-Gm-Message-State: AOJu0YxcW2wB32SE5Kgq3LVX9GEAUmVjVTaST6hge72HEMJLrQ1ZnNqD
	cuGMkiTh30IM2q6ADlziGjSeonWMJ7/+eralO/74EvYPX6HOFSdhjRaZk64Vk24+aAIwu+1VENk
	7AQknVzt1p3TKY5vICQ6KQsTUNabfpJPn7eomww==
X-Gm-Gg: ASbGncuBSq/D9XJnC9F1MPa4UM0+rtsqug/Dlgm2PsvXj61/Ki4O/16Q3BTRgkOMrl7
	sAJ1xMuQsPsVTJEwmNc3AbMmCfIxq486C3oVohLAgPOj6GxpKTn8gzXDdC2VWZXNWaPM+D5Q2O1
	IBrIza/i+lh/vPycGmZlV0Iw75LGCBf12l2SsUZgfNrYRqmRCwOTj4LNLS0BO9H+bABg==
X-Google-Smtp-Source: AGHT+IHw9OYmUFFaVOjKTmrAU8Lic8B4Zm4GrzDVHIbfeJPeFTDZ1sW5Du4kJ5q/UG3UgPC6JAvrwG/k/V+7WBd9EPg=
X-Received: by 2002:a05:622a:2cf:b0:477:6ee2:18cd with SMTP id
 d75a77b69052e-49452714aa7mr173626351cf.5.1747026960004; Sun, 11 May 2025
 22:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240222125059.13331-3-hchauhan@ventanamicro.com> <20250512033118.1071577-1-dqfext@gmail.com>
In-Reply-To: <20250512033118.1071577-1-dqfext@gmail.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon, 12 May 2025 10:45:49 +0530
X-Gm-Features: AX0GCFuxSrzsFyhJa4BfWv6ZpNuyEseIibTzFbBBdKXCjiAlaHx5IZ2hKcU0NFw
Message-ID: <CAPd4WewhGXdE0KUzrnLGgK9cDjz35TFvr_fqYHc5yVzKTFCdHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware break/watchpoints
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Charlie Jenkins <charlie@rivosinc.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_221605_028584_5080E965 
X-CRM114-Status: GOOD (  13.72  )
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

SGkgUWluZ2ZhbmcsCgpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dCEgVGhhdCBleHBsYWlucyB0
aGUgZGlmZmVyZW5jZSBpbiBiZWhhdmlvdXIuCkkgd2lsbCBmaXggaXQuCgpSZWdhcmRzCkhpbWFu
c2h1CgpPbiBNb24sIE1heSAxMiwgMjAyNSBhdCA5OjAx4oCvQU0gUWluZ2ZhbmcgRGVuZyA8ZHFm
ZXh0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwgSGltYW5zaHUgYW5kIENoYXJsaWUsCj4KPiA+
ICtzdGF0aWMgaW50IGFyY2hfc21wX3NldHVwX3NiaV9zaG1lbSh1bnNpZ25lZCBpbnQgY3B1KQo+
ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBzYmlfZGJ0cl9zaG1lbV9lbnRyeSAqZGJ0cl9zaG1lbTsK
PiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgc2htZW1fcGE7Cj4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0
IHJldDsKPiA+ICsgICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgIGRidHJfc2htZW0gPSBwZXJf
Y3B1X3B0cihzYmlfZGJ0cl9zaG1lbSwgY3B1KTsKPiA+ICsgICAgIGlmICghZGJ0cl9zaG1lbSkg
ewo+ID4gKyAgICAgICAgICAgICBwcl9lcnIoIkludmFsaWQgcGVyLWNwdSBzaGFyZWQgbWVtb3J5
IGZvciBkZWJ1ZyB0cmlnZ2Vyc1xuIik7Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PREVW
Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgc2htZW1fcGEgPSBfX3BhKGRidHJfc2htZW0p
Owo+ID4gKwo+ID4gKyAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9E
QlRSX1NFVFVQX1NITUVNLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICghTUVNX0xPKHNobWVt
X3BhKSA/IDB4RkZGRkZGRkZVTCA6IE1FTV9MTyhzaG1lbV9wYSkpLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICghTUVNX0hJKHNobWVtX3BhKSA/IDB4RkZGRkZGRkZVTCA6IE1FTV9ISShzaG1l
bV9wYSkpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAwLCAwLCAwLCAwKTsKPiA+ICsKPiA+
ICsgICAgIGlmIChyZXQuZXJyb3IpIHsKPiA+ICsgICAgICAgICAgICAgc3dpdGNoKHJldC5lcnJv
cikgewo+ID4gKyAgICAgICAgICAgICBjYXNlIFNCSV9FUlJfREVOSUVEOgo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBBY2Nlc3MgZGVuaWVkIGZvciBzaGFyZWQgbWVtb3J5
IGF0ICVseFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBz
aG1lbV9wYSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRVBFUk07Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGNhc2UgU0JJ
X0VSUl9JTlZBTElEX1BBUkFNOgo+ID4gKyAgICAgICAgICAgICBjYXNlIFNCSV9FUlJfSU5WQUxJ
RF9BRERSRVNTOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBJbnZhbGlk
IGFkZHJlc3MgcGFyYW1ldGVyICglbHUpXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgX19mdW5jX18sIHJldC5lcnJvcik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmMg
PSAtRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICBjYXNlIFNCSV9FUlJfQUxSRUFEWV9BVkFJTEFCTEU6Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgcHJfd2FybigiJXM6IFNoYXJlZCBtZW1vcnkgaXMgYWxyZWFkeSBzZXRcbiIs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXyk7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgcmMgPSAtRUFERFJJTlVTRTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgY2FzZSBTQklfRVJSX0ZBSUxVUkU6Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCIlczogSW50ZXJuYWwgc2R0cmlnIHN0YXRl
IGVycm9yXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXyk7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRU5YSU87Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgcHJfd2FybigiJXM6IFVua25vd24gZXJyb3IgJWx1XG4iLCBfX2Z1bmNf
XywgcmV0LmVycm9yKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByYyA9IC1FTlhJTzsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAg
ICAgfQo+ID4gKwo+ID4gKyAgICAgcHJfd2FybigiQ1BVICVkOiBIVyBCcmVha3BvaW50IHNoYXJl
ZCBtZW1vcnkgcmVnaXN0ZXJlZC5cbiIsIGNwdSk7Cj4KPiBUaGlzIGlzIHByaW50ZWQgdW5jb25k
aXRpb25hbGx5LCBldmVuIGlmIHRoZXJlIGlzIGFuIGVycm9yIGFib3ZlLgo+Cj4gPiArCj4gPiAr
ICAgICByZXR1cm4gcmM7Cj4KPiBJZiByZXQuZXJyb3IgaXMgMCwgcmMgaXMgdW5pbml0aWFsaXpl
ZCBoZXJlLCB3aGljaCBtYXkgZXhwbGFpbiB0aGUgZXJyb3IKPiB0aGF0IENoYXJsaWUgY2FtZSBh
Y3Jvc3MuCj4KPiBSZWdhcmRzLAo+Cj4gLS0gUWluZ2ZhbmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
