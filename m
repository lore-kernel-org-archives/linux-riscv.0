Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D21FC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 17:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yis7ObNHpSJXocIhRKXYpig/MwVOyiLw/eNTCophXcE=; b=krwys3TrRK7BaH
	tskg/xtgIE0jx39KYZUz4Cl1nx1TTYxIrbH3TztefbsyGpS/PdliAHGOriw3pQ4x1tHor6IQ8iz33
	fk2pLoiiTQ1S4Gg4N8mUM21TthHXECKw6YblOO/NoPaZuDauOucayORdbvxEkR8hkMc7qyHwstEZx
	M3PjbL06CsgmAxBbLBm8teKKoaIeMsc+b25zvBWMwB/suXyFImedsfn+d7m2QCpZmE2CQ/NGl8+DS
	PzI0JHIBEbEx3dj2ZeL4hDpUGXDJqpXarqFSjpyVCRApVTfKf3LPRbKCuyoa/dEO+FkaYs7k8YP37
	HKRTc58hZ6TC4AcfbNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2zC3-00EraL-OK; Sun, 19 Jun 2022 17:58:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2zC0-00ErZk-9n
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 17:58:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g27so5134571wrb.10
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6x9BP2AjM4r3FFQZwLJDm0CAIjFvtNEQQOy44AFf4Gg=;
        b=RebioXFeA/NM3UxANrbTJdIe2uGqe6uSHkN4e9iyWT1uKHjvZs6fLamqA/3BqahfjY
         zD9omRA2AynPRPLFKMsYbNSx3DZF6iZvSjwcTf8fPa6CfjXPqrktpY+i0dWrn+DNumFU
         9dS8FKbt6C/0ZN+rNjxkDuX4sUk8SP9xic2UqR8nt2VyXPXtN+y2qwrUhcsdOyznkjXm
         RU6RGA+wtR540cCG4tG5dSIboEji05TUel5oHs3CR3KdjljU96eXJA8Pe3uPCHJBueDz
         7E7AvyyZgHHgkmd8KSn81Xefi6m7yEcMVS3pykgCjqwDBM8VOWxhxTcLtcLPAZUohFeo
         Lx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6x9BP2AjM4r3FFQZwLJDm0CAIjFvtNEQQOy44AFf4Gg=;
        b=49A4p+SM219zDW/URnEEUPsOk05LCgQud9gsXHC/GRVJr0D/ZbFloe8ULM9R3j12FN
         jGt71Htw457oW4kBXdVKS176rfi6l5Lb5hy/t1C+/SgackGJD/acddqLpL58FEK5EEd3
         oXlp+4oFXoWHWebTDMMn6zbGrF+EL0vGz5YkyOyd02aAPmkyj/v+RgDCk9o097vjE2Zv
         +JBD2nWGAPwOL6rb3ulaGJzKccbH03mcQ7jlSTEL/L6/6txfaB3BlUiUQW/N4FQ9oeZ3
         cYLHjHpbvnjdjkM97yw6pfrA+UwPMaPM3ke8IbEhfwJjoEiJl+McwsR8s6IxCQX+jxdy
         uq7A==
X-Gm-Message-State: AJIora9zYIUkXzC8bnO2v1U19mRmzhRo3CgsETzr5JVXK0U4qXQNKkJG
	BYmY4DWYt2xVKi8xO0cdCaFejw==
X-Google-Smtp-Source: AGRyM1tc6FUksXdJCEszTOAw5xP946fFO3z0jjcCqbCloKRvvfio+83CGjaG/vyVsK7WFpyjylZ3Uw==
X-Received: by 2002:a05:6000:1689:b0:218:3fb1:fd30 with SMTP id y9-20020a056000168900b002183fb1fd30mr19227123wrd.302.1655661514581;
        Sun, 19 Jun 2022 10:58:34 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id l1-20020a1c2501000000b0039747cf8354sm12102073wml.39.2022.06.19.10.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 10:58:33 -0700 (PDT)
Message-ID: <a45b0d2f-6550-3352-68c7-450dc7be8cd2@conchuod.ie>
Date: Sun, 19 Jun 2022 18:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 3/6] clk: microchip: mpfs: add reset controller
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220619164935.1492823-1-mail@conchuod.ie>
 <20220619164935.1492823-4-mail@conchuod.ie>
 <19bcf5cb-e291-2c18-b006-f4e9e7adac92@wanadoo.fr>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <19bcf5cb-e291-2c18-b006-f4e9e7adac92@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_105836_403625_3C81ACC2 
X-CRM114-Status: GOOD (  12.53  )
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

Ck9uIDE5LzA2LzIwMjIgMTg6MTksIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToKPiBMZSAxOS8w
Ni8yMDIyIMOgIDE4OjQ5LCBDb25vciBEb29sZXkgYSDDqWNyaXTCoDoKPj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4KPj4gQWRkIGEgcmVzZXQgY29u
dHJvbGxlciB0byBQb2xhckZpcmUgU29DJ3MgY2xvY2sgZHJpdmVyLiBUaGlzIHJlc2V0Cj4+IGNv
bnRyb2xsZXIgaXMgcmVnaXN0ZXJlZCBhcyBhbiBhdXggZGV2aWNlIGFuZCByZWFkL3dyaXRlIGZ1
bmN0aW9ucwo+PiBleHBvcnRlZCB0byB0aGUgZHJpdmVycyBuYW1lc3BhY2Ugc28gdGhhdCB0aGUg
cmVzZXQgY29udHJvbGxlciBjYW4KPj4gYWNjZXNzIHRoZSBwZXJpcGhlcmFsIGRldmljZSByZXNl
dCByZWdpc3Rlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBbLi4uXQo+IAo+PiArc3RhdGljIHZvaWQgbXBmc19yZXNl
dF9hZGV2X3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+PiArwqDCoMKgIHN0cnVj
dCBhdXhpbGlhcnlfZGV2aWNlICphZGV2ID0gdG9fYXV4aWxpYXJ5X2RldihkZXYpOwo+PiArCj4+
ICvCoMKgwqAgYXV4aWxpYXJ5X2RldmljZV91bmluaXQoYWRldik7Cj4+ICsKPj4gK8KgwqDCoCBr
ZnJlZShhZGV2LT5uYW1lKTsKPiAKPiA/Cj4gCj4gQmVsb3cgd2UgaGF2ZToKPiDCoMKgwqDCoGFk
ZXYtPm5hbWUgPSAicmVzZXQtbXBmcyI7CgpBeWUsIGdvb2Qgc3BvdCB0aGFua3MuCldhcyBhIGhh
bmdvdmVyIGZyb20gbWUgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhlIGF1eGlsaWFyeSBkZXZpY2UK
bmFtaW5nIHNjaGVtZS4KQ29ub3IuCgo+IAo+IAo+PiArwqDCoMKgIGtmcmVlKGFkZXYpOwo+PiAr
fQo+PiArCj4+ICtzdGF0aWMgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKm1wZnNfcmVzZXRfYWRl
dl9hbGxvYyhzdHJ1Y3QgbXBmc19jbG9ja19kYXRhICpjbGtfZGF0YSkKPj4gK3sKPj4gK8KgwqDC
oCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldjsKPj4gK8KgwqDCoCBpbnQgcmV0Owo+PiAr
Cj4+ICvCoMKgwqAgYWRldiA9IGt6YWxsb2Moc2l6ZW9mKCphZGV2KSwgR0ZQX0tFUk5FTCk7Cj4+
ICvCoMKgwqAgaWYgKCFhZGV2KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVO
T01FTSk7Cj4+ICsKPj4gK8KgwqDCoCBhZGV2LT5uYW1lID0gInJlc2V0LW1wZnMiOwo+PiArwqDC
oMKgIGFkZXYtPmRldi5wYXJlbnQgPSBjbGtfZGF0YS0+ZGV2Owo+PiArwqDCoMKgIGFkZXYtPmRl
di5yZWxlYXNlID0gbXBmc19yZXNldF9hZGV2X3JlbGVhc2U7Cj4+ICvCoMKgwqAgYWRldi0+aWQg
PSA2NjZ1Owo+PiArCj4+ICvCoMKgwqAgcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9pbml0KGFkZXYp
Owo+PiArwqDCoMKgIGlmIChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGtmcmVlKGFkZXYpOwo+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIocmV0KTsKPj4gK8KgwqDCoCB9Cj4+ICsK
Pj4gK8KgwqDCoCByZXR1cm4gYWRldjsKPj4gK30KPiAKPiBbLi4uXQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
