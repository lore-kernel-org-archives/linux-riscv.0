Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0755C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+0XDoeRsr6ndNU6/+JM+CYtsu8/qoCzhsR8yTxwCQ4=; b=lvrgU7aCzb0Mfu
	lh5mnSs64OgSXprmPloWgIckbr0Xp6YhoPV6bEdqZ9OsQQPTQ9wlWCQmU51eezJWzfM7srL/ieBp3
	rv32rNOtJYSJOo2ZMDhaKRbJJ4o+WVy+pv0d30UCkSG6qaif6MFqM5uU7tgETV8jS6u3iBM+s5B7S
	QwcyohG0qwuulvntZrS2gMHOb0qNNvFPv63P4orV5BsKNrAq5kDyF3nMeNy1Z9wpLjeKpTZmAzLSE
	XD9IF+FysNCn1vxgPBsjVE5XJ9brK8PCYNpb+1Xe30DOF0QQo16ukCiwwLiFclNlifsAbVFjln3dn
	i3T8mJcrBzUdJxu8RJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbmuK-0024z3-Mm; Tue, 05 Apr 2022 17:23:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbmuI-0024yE-2w
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 17:23:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id r7so8442291wmq.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=khw56BcVfUfsYn9wIG9PZAUGugIcHpBdbCz+0QyhwfY=;
 b=SPQ4pnAB0M9i7EFSJbLACLDrZy5/KtFV0EoGdqKSiqKwZWlKRm1Bqc0d1MsDqDSkmK
 uOs7Ti3L9bUEHEUKNIzWShnr5jaFcDW1zyDR73cyK9FEHHDsmxAohvfIA0scW96G80w7
 63utohEYTSrU9ZrkkVs8yCRWJiOf3ACjZz6GKw3DJZIku7EeG2ROSX+lBfL674jZ36vQ
 +gr2aUYiPsp8pNOdRcV8+FBC299GuhOAtAc9wux+X9diHfsMhFwLgWuQQHQp+h9mrod1
 VjgVGtMbCdY1mCLOtLhm47YuCzNVhgO4FuTvjHpkboACH5f15c3iHPwK9s/02D0/e4LD
 BhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=khw56BcVfUfsYn9wIG9PZAUGugIcHpBdbCz+0QyhwfY=;
 b=wCODV7bCgdJza4LMzaV9HzByEKAbj+AxMyCbza2ddJ7gtTDwDgOZ7fKZ8peKzNOrM2
 ZSnhaSu9hkN0UVpuCBl0ELisMzKgL5NfKXgQ7c2O7IQvYBmHvfZiulJlUwxpB+sbUnep
 s1Wg9vx+ZX23uoOO2vqeKk1rH9z+ChpIPJZRHOCjpNCI8KqI1P+yx6QNAUMaVI72fJLL
 AL/IbCdT7snqVxATr9RFoTufhJaBmqagor+aA2JZRoDBVmS0Gi0Bm4RZ1nxLkBLr2+cF
 xupvzN0sTzAmqE/LvS0rvVkEbOJSvOMdMDQwaDOPNDFI/8VsrrBBJfPRF8XRhzx4hB0w
 w2Kw==
X-Gm-Message-State: AOAM5332GvWvlvt5ACEjdFhJTasGQGgV3U/TCDgnnzpRzW/jG326rHwn
 yaFsyrJS02AWghRrxWZ2u7OSbQ==
X-Google-Smtp-Source: ABdhPJyrY01oduAm4v4Hx0vaQGsRms0tKfOeXo366Rj2gd70qEB7nUGBCKvgXzpWamV2lA/U/1wh5Q==
X-Received: by 2002:a05:600c:4e11:b0:38c:bd19:e72c with SMTP id
 b17-20020a05600c4e1100b0038cbd19e72cmr4068671wmq.174.1649179431399; 
 Tue, 05 Apr 2022 10:23:51 -0700 (PDT)
Received: from [192.168.2.116] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c400100b0038cf3371208sm2710883wmm.22.2022.04.05.10.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 10:23:50 -0700 (PDT)
Message-ID: <25acda81-4c5c-f8ba-0220-5ffe90bb197e@conchuod.ie>
Date: Tue, 5 Apr 2022 18:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux@armlinux.org.uk
Cc: Conor.Dooley@microchip.com, apatel@ventanamicro.com,
 netdev@vger.kernel.org, Nicolas.Ferre@microchip.com,
 Claudiu.Beznea@microchip.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux-riscv@lists.infradead.org
References: <mhng-524fe1b1-ca51-43a6-ac0f-7ea325da8b6a@palmer-ri-x1c9>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mhng-524fe1b1-ca51-43a6-ac0f-7ea325da8b6a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_102354_167910_F3B62D9B 
X-CRM114-Status: GOOD (  20.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAwNS8wNC8yMDIyIDE3OjU2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBUdWUsIDA1
IEFwciAyMDIyIDA4OjUzOjA2IFBEVCAoLTA3MDApLCBsaW51eEBhcm1saW51eC5vcmcudWsgd3Jv
dGU6Cj4+IE9uIFR1ZSwgQXByIDA1LCAyMDIyIGF0IDAxOjA1OjEyUE0gKzAwMDAsIENvbm9yLkRv
b2xleUBtaWNyb2NoaXAuY29tIAo+PiB3cm90ZToKPj4+IEhleSwKPj4+IEkgc2VlbSB0byBoYXZl
IGNvbWUgYWNyb3NzIGEgcmVncmVzc2lvbiBpbiB0aGUgZGVmYXVsdCByaXNjdiBkZWZjb25maWcK
Pj4+IGJldHdlZW4gcmlzY3YtZm9yLWxpbnVzLTUuMTgtbXcwIChiYmRlMDE1MjI3ZTgpICYgdjUu
MTgtcmMxLCBleHBvc2VkIGJ5Cj4+PiBjNTE3OWVmMWNhMGMgKCJSSVNDLVY6IEVuYWJsZSBSSVND
LVYgU0JJIENQVSBJZGxlIGRyaXZlciBmb3IgUUVNVSB2aXJ0Cj4+PiBtYWNoaW5lIikgd2hpY2gg
Y2F1c2VzIHRoZSBldGhlcm5ldCBwaHkgdG8gbm90IGNvbWUgdXAgb24gbXkgSWNpY2xlIGtpdDoK
Pj4+IFsgMy4xNzk4NjRdIG1hY2IgMjAxMTIwMDAuZXRoZXJuZXQgZXRoMDogdmFsaWRhdGlvbiBv
ZiBzZ21paSB3aXRoIAo+Pj4gc3VwcG9ydCAwMDAwMDAwLDAwMDAwMDAwLDAwMDA2MjgwIGFuZCBh
ZHZlcnRpc2VtZW50IAo+Pj4gMDAwMDAwMCwwMDAwMDAwMCwwMDAwNDI4MCBmYWlsZWQ6IC1FSU5W
QUwKPj4+IFsgMy4xOTQ0OTBdIG1hY2IgMjAxMTIwMDAuZXRoZXJuZXQgZXRoMDogQ291bGQgbm90
IGF0dGFjaCBQSFkgKC0yMikKPj4KPj4gSSBkb24ndCB0aGluayB0aGF0IHdvdWxkIGJlIHJlbGF0
ZWQgdG8gdGhlIGlkbGUgZHJpdmVyLiBUaGlzIGxvb2tzIGxpa2UKPj4gdGhlIFBIWSBoYXNuJ3Qg
ZmlsbGVkIGluIHRoZSBzdXBwb3J0ZWQgbWFzayBhdCBwcm9iZSB0aW1lIC0gZG8geW91IGhhdmUK
Pj4gdGhlIGRyaXZlciBmb3IgdGhlIFBIWSBidWlsdC1pbiBvciB0aGUgUEhZIGRyaXZlciBtb2R1
bGUgbG9hZGVkPwo+IAo+IElJUkMgd2UgaGFkIGEgYnVuY2ggb2YgaXNzdWVzIHdpdGggdGhlIFBI
WSBvbiB0aGUgSGlGaXZlIFVubGVhc2hlZCwgCj4gdGhlcmUgd2FzIGEgcXVpcmt5IHJlc2V0IHNl
cXVlbmNlIHRoYXQgaXQgd291bGRuJ3QgZXZlbiBwcm9iZSBjb3JyZWN0bHkgCj4gd2l0aG91dC7C
oCBXZSBoYXZlIGEKPiAgwqDCoCAmZXRoMCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1
cyA9ICJva2F5IjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGh5LW1vZGUgPSAiZ21paSI7Cj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBoeS1oYW5kbGUgPSA8JnBoeTA+Owo+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwaHkwOiBldGhlcm5ldC1waHlAMCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAwMDcuMDc3MSI7
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gIMKgwqAgfTsKPiAKPiBpbiB0aGUgVW5sZWFzaGVkIERU
LCBidXQgSSBjYW4ndCBmaW5kIGFueXRoaW5nIHNpbWlsYXIgaW4gdGhlIEljaWNsZSBEVAo+IAo+
ICDCoMKgICZtYWMxIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaHktbW9kZSA9ICJzZ21paSI7Cj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBoeS1oYW5kbGUgPSA8JnBoeTE+Owo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
aHkxOiBldGhlcm5ldC1waHlAOSB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8OT47Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
aSxmaWZvLWRlcHRoID0gPDB4MT47Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBoeTA6IGV0aGVybmV0LXBoeUA4IHsKPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDw4PjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRpLGZpZm8tZGVwdGggPSA8MHgxPjsKPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTsKPiAgwqDCoCB9Owo+IAo+IEkgc2VlbSB0byByZW1lbWJlciBwaWNraW5nIHRoYXQg
c3BlY2lmaWMgcGh5IGJlY2F1c2UgaXQgd2FzIHNpbWlsYXIgdG8gCj4gdGhlIG9uZSB0aGF0IHdh
cyBQT1IgZm9yIHRoZSBJY2ljbGUgYXQgdGhlIHRpbWUgd2UgZGVjaWRlZCwgbWF5YmUgeW91IAo+
IGhhdmUgYSBzaW1pbGFyIHBoeSB3aXRoIGEgc2ltaWxhciBxdWlyayBhbmQgbmVlZCBhIHNpbWls
YXIgd29ya2Fyb3VuZD8KCkkgdHJpZWQgdXNpbmcgdGhlIG9uZSBmb3IgdGhlIFZTQzg2NjIgKDAw
MDcuMDY2MCkgc2luY2UgdGhhdCdzIHdoYXRzIG9uLAp0aGUgYm9hcmQgYnV0IHRoYXQgZGlkbid0
IGhlbHAuCldpdGhvdXQgdGhlIHJldmVydDoKClsgICAgMS41MjE3NjhdIG1hY2IgMjAxMTIwMDAu
ZXRoZXJuZXQgZXRoMDogQ2FkZW5jZSBHRU0gcmV2IDB4MDEwNzAxMGMgCmF0IDB4MjAxMTIwMDAg
aXJxIDE3ICgwMDowNDphMzo0ZDo0YzpkYykKWyAgICAzLjIwNjI3NF0gbWFjYiAyMDExMjAwMC5l
dGhlcm5ldCBldGgwOiBQSFkgClsyMDExMjAwMC5ldGhlcm5ldC1mZmZmZmZmZjowOV0gZHJpdmVy
IFtWaXRlc3NlIFZTQzg2NjJdIChpcnE9UE9MTCkKWyAgICAzLjIxNjY0MV0gbWFjYiAyMDExMjAw
MC5ldGhlcm5ldCBldGgwOiBjb25maWd1cmluZyBmb3IgcGh5L3NnbWlpIApsaW5rIG1vZGUKKGFu
ZCB0aGVuIG5vdGhpbmcpCgpJZiBJIHJldmVydCB0aGUgQ09ORklHX1BNIGFkZGl0aW9uOgoKWyAg
ICAxLjUwODg4Ml0gbWFjYiAyMDExMjAwMC5ldGhlcm5ldCBldGgwOiBDYWRlbmNlIEdFTSByZXYg
MHgwMTA3MDEwYyAKYXQgMHgyMDExMjAwMCBpcnEgMTcgKDAwOjA0OmEzOjRkOjRjOmRjKQpbICAg
IDIuODc5NjE3XSBtYWNiIDIwMTEyMDAwLmV0aGVybmV0IGV0aDA6IFBIWSAKWzIwMTEyMDAwLmV0
aGVybmV0LWZmZmZmZmZmOjA5XSBkcml2ZXIgW1ZpdGVzc2UgVlNDODY2Ml0gKGlycT1QT0xMKQpb
ICAgIDIuODkwMDEwXSBtYWNiIDIwMTEyMDAwLmV0aGVybmV0IGV0aDA6IGNvbmZpZ3VyaW5nIGZv
ciBwaHkvc2dtaWkgCmxpbmsgbW9kZQpbICAgIDYuOTgxODIzXSBtYWNiIDIwMTEyMDAwLmV0aGVy
bmV0IGV0aDA6IExpbmsgaXMgVXAgLSAxR2Jwcy9GdWxsIC0gCmZsb3cgY29udHJvbCBvZmYKWyAg
ICA2Ljk4OTY1N10gSVB2NjogQUREUkNPTkYoTkVUREVWX0NIQU5HRSk6IGV0aDA6IGxpbmsgYmVj
b21lcyByZWFkeQoKSSB3aWxsIHRyeSBhZ2FpbiB0b21vcnJvdyB3aXRoICJldGhlcm5ldC1waHkt
aWQwMDA3LjA3NzEiIHRvIHNlZSBpZgphbnl0aGluZyBjaGFuZ2VzLCBzaW5jZSB0aGF0IHdvdWxk
IHVzZSB0aGUgTWljcm9zZW1pIGRyaXZlciByYXRoZXIKdGhhbiB0aGUgVml0ZXNzZSBkcml2ZXIg
dGhhdCBWU0M4NjYyLzAwMDcuMDY2MCB1c2VzLgoKVGhhbmtzLApDb25vci4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
