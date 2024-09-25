Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C33ECF9C7A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KVeQ/9D0yQSsAgWHJYOmxZeUGrBG6fTmP6jA7aVrB4=; b=nNRtDZ3HNo6ux5
	23u1jrvNhfeujidKIEZ2LbGCPsIvyIN5MyzDv05CmOCVetqnjMOCbewsFGqOO4a4aahbJ4tMdFkDJ
	qy/ocjlbNn6uwFXpYWaNvKS0SiWu4jFBJ7CCQ58fFmTQqcwYC1F9ukYAg5QPqy7tQTXkaBcvAiTOR
	eaJX4vU5jatxjbS2pFfvaNyRWoqOENzautrhFf7kyAJ0dEPsbU3joN56bK9p1AmOr4w0VFEgY4zyb
	6UDd/jACT3AFFr1BwBj4e7s2VA3TbIfFu0Z+8JTCYtEVUOtglJUAiz+Kn4OOLq809euE7sOTqderZ
	z4HOl0PDKurD667uwwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stTZN-00000005mLp-2FEW;
	Wed, 25 Sep 2024 15:04:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTZ2-00000005mAB-3WhO
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 15:04:26 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a8d64b27c45so1226312266b.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727276663; x=1727881463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fcm1dYWoLf3Wc6bRnTyM3HuYA6slsWvg941YHjTJgDI=;
        b=imBZ8WZGP4BkupP18HmiJYtY599KmTAefHX8Qw74JupYoUnL21pvr1hHfFBT4FhFkN
         XCRfzucQUeXOaHZXKfGzaoUtt7B/aXihnvNz1RviVgvfWrQ1M855ikqX9vDtlIIgpoaa
         r6ExsVM9NSSIOf+F0T6vTlns5pVc8NV37dnE7oihp6xCAnkxKf1RH/iF/wQr7O/c6sMh
         qA8+2M98jw2R1GRYQjppx4BvcpokccAJN3V8fclb2B81Nss+qNGPwoXBMZZoT51CVqCZ
         mAI50QMbpJh5nZaC9n8KT5axH+VU2RemFt7X7AWRl+Ng1DqYMwW+/CGDcQ4OvsHq2Lk4
         fLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276663; x=1727881463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fcm1dYWoLf3Wc6bRnTyM3HuYA6slsWvg941YHjTJgDI=;
        b=jaznD42LGPyFYqb7Tg3j+bJgl4oL8ap2kM36BfZi/WaThnNeCdnqnSl0Es6fMtiFj7
         NKWMS21KfnPp7dyYlNiQPKhOMxtFVK3ZCvewI/mggm0P5ELeFlQblszmTTGy7OOTFNMT
         u1/p3/uRFyIo+ZVUX238hv4QEQi4RnsI+IRkX8Ggy6jR+XlKECYaNW9KUL8r79aRHaaM
         8hhZIvKzZft9CMoL85YCzFMhXLGDdnd7DyIcQmw17F2FcOnWIMoy+buUBTWSB1xLJzJL
         CzJboe/CSCZMv2t4cNlwj/VLhooiaq+pLROq8LHBamxbOwnAjl1UQqgEoiosBH68wc+g
         +EOw==
X-Forwarded-Encrypted: i=1; AJvYcCU2UoI0caTLqAfD2bKu5xiYjnu4L9L7IseUz3L7l0FsVBnQ6QzK18zM9UZdjVxaROljOGuOAFBt5o9SmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpngKF8eRatC55ncB1dpYa1To/XiBLssyTx38mW6v3anbpZ1Sv
	5WnVjICZwe6kjszWJ4YkvTHiRggSVlVwnsYqV++BQCeKWpIORLzQ8uETrOAF1CF8Ly3g4KuyeIU
	kOk58QcFuccuck4f6wzXrgB+dYOKRYmvnd8EBDw==
X-Google-Smtp-Source: AGHT+IEKBETEBbA8oFDZdNCsj+RIgKMhlQG/S1lkwH92vhMzI5tt0OxPYPqW1BlbMTlymXavydaePF4Y5PU6xJJfy1c=
X-Received: by 2002:a17:907:e213:b0:a86:7b71:7b77 with SMTP id
 a640c23a62f3a-a93a05de319mr274196366b.44.1727276661650; Wed, 25 Sep 2024
 08:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240925131547.42396-1-luxu.kernel@bytedance.com>
 <20240925131547.42396-2-luxu.kernel@bytedance.com> <20240925-2acd8d9743cf40b999172b40@orel>
 <mvmbk0b7rjz.fsf@suse.de>
In-Reply-To: <mvmbk0b7rjz.fsf@suse.de>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 25 Sep 2024 23:04:09 +0800
Message-ID: <CAPYmKFs7s4fHBEZCuE92hwVPCTwvUX3864tR5OmgBKkMY57BKg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 1/2] riscv: process: Introduce idle
 thread using Zawrs extension
To: Andreas Schwab <schwab@suse.de>
Cc: Andrew Jones <ajones@ventanamicro.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, andy.chiu@sifive.com, guoren@kernel.org, 
	christoph.muellner@vrull.eu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	chaiwen.cc@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_080425_273275_8609E266 
X-CRM114-Status: GOOD (  13.03  )
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

SGkgQW5kcmVhcywKClRoYW5rcyBhIGxvdCBmb3IgeW91ciByZXBseS4KCk9uIFdlZCwgU2VwIDI1
LCAyMDI0IGF0IDEwOjEw4oCvUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cm90
ZToKPgo+IE9uIFNlcCAyNSAyMDI0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4KPiA+IE9uIFdlZCwg
U2VwIDI1LCAyMDI0IGF0IDA5OjE1OjQ2UE0gR01ULCBYdSBMdSB3cm90ZToKPiA+PiBAQCAtMTQ4
LDYgKzE0OSwyMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd2FpdF9mb3JfaW50ZXJydXB0KHZvaWQp
Cj4gPj4gICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoIndmaSIpOwo+ID4+ICB9Cj4gPj4KPiA+
PiArc3RhdGljIGlubGluZSB2b2lkIHdyc19udG8odW5zaWduZWQgbG9uZyAqYWRkcikKPiA+PiAr
ewo+ID4+ICsgICAgaW50IHZhbDsKPiA+PiArCj4gPj4gKyAgICBfX2FzbV9fIF9fdm9sYXRpbGVf
XygKPiA+PiArI2lmZGVmIENPTkZJR182NEJJVAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICJs
ci5kICVbcF0sICVbdl1cblx0Igo+ID4+ICsjZWxzZQo+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICJsci53ICVbcF0sICVbdl1cblx0Igo+ID4+ICsjZW5kaWYKPiA+Cj4gPiB2YWwgaXMgYWx3YXlz
IDMyLWJpdCBzaW5jZSBpdCdzIGFuIGludC4gV2Ugc2hvdWxkIGFsd2F5cyB1c2UgbHIudy4KPgo+
IFNob3VsZG4ndCB2YWwgYmUgdW5zaWduZWQgbG9uZyBsaWtlIHRoZSBwb2ludGVyIHRoYXQgaXMg
YmVpbmcgcmVhZD8KClllcy4gQXMgSSByZXBsaWVkIEFuZHJldywgdGhlICdpbnQgdmFsJyBpcyBh
IG1pc3Rha2UgaGVyZS4gVGhlIHZhbCBjYW4KYmUgYW4gdW5zaWduZWQgbG9uZyAodGhyZWFkX2lu
Zm8tPmZsYWdzKSB3aGVuIENPTkZJR19TTVAgaXMgZGlzYWJsZWQuCkkgd2lsbCB1cGRhdGUgdGhl
IGRlY2xhcmF0aW9uIG9mIHZhbCBmcm9tICdpbnQnIHRvICd1bnNpZ25lZCBsb25nJy4KCj4KPiAt
LQo+IEFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMsIHNjaHdhYkBzdXNlLmRlCj4gR1BHIEtleSBm
aW5nZXJwcmludCA9IDAxOTYgQkFEOCAxQ0U5IDE5NzAgRjRCRSAgMTc0OCBFNEQ0IDg4RTMgMEVF
QSBCOUQ3Cj4gIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpU
aGFua3MsCgpYdSBMdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
