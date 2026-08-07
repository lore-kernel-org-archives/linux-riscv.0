Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E683C5AC82
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmcyrKG19+UFv1sshic9Qouhi6tykLCCCYy8LGLaKf0=; b=kWUDTolOuhFo7j
	FVLdAVIZq2JIk4d7nRlrUpzYsy4GimNvzp8n/k34MQYAugA7WaRDe0F1w64/CB+j6mgaY7c+Xc4rw
	M0Gtuzp88IvBZRNBeesIZrW6UFD/BBJhjAy2NSNApRIN15faefzKHoA5Z1q3zgCOP94/0Kmn3pIOp
	Mq9dalNtIB8lNzWZBum+qPMemIdOY+pVFg/RnelrRUAYTzlmMNzi/2kvk1kC9W/1CGDkqrwsEMI9J
	scJ1FvsQ10HcyqL7veIIP7M02rUigHz79iXDRCkzs6QTt2OF+ncvO4EsWln1baN0nhapozT5mUx4u
	H0ye13WhTr/E19r7SfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCJ-00000007Fuf-43JE;
	Fri, 07 Aug 2026 07:40:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCG-00000007FrI-1WLI
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:40:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47fd66a094eso1206471f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088450; x=1786693250; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=vFknm8WSEZif9w1Dm3VYIlZT6zCxy4fFft47/M1DtclyYCIF9Dp0PIhyU23LjKWu3T
         hVcjWGuNoofx9A1Oze8nipha5cPir0VoZmnIf+XM8J1GF3Ztfbb4/+poli0K+ZOtfSw4
         q4EcVYn+VgupLac+k5tkId+qGTysJWrGSMzAdyUQthYRxmBtva8t3BxtLftvSAECfHY1
         sMqNKp5yvVebxk4sMqVr+W5jFTFoh1MqcV8vX0rd015qYQwvqI+l1SG4zcmH/sO+84Gj
         BifrdT08DiFGeilh2dF9jbRxARa+BImRpMG+9eUR35syxr+ur7fKMdBIF5m/RxnCKF3a
         al6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088450; x=1786693250;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=ZD5SPYErMxjNZ1mbcE98E3TFUULRNElwLHkolibkxGItKiM7CNU6aVrNz7z9xHIXhr
         TAqAiIXCCowJscMqsLMg3fFewVfEYVm9n07db3dn/3m1F0S+0IhbpexaJv6HzBevx+JE
         YGSA3RTFaTKqFvZ0SGXJwZBGFrk2D1QKncb91hQVPPFxw9nqfi2yxApvAMKnd8udHnMX
         QT2XJuoBhQBqtTSw+Tb2bUx8CZPn2L0dS76KGRUsPw2wWaTiLP5lrmtm1B+RKsQPAIqn
         J26MSluEse80sMYWzfQt+gtfds1oii5MS+nSOqAId2sElFrLzo1auwyBevaIC3rFzuyi
         z7oA==
X-Forwarded-Encrypted: i=1; AHgh+RoB1SnQ+zI3fIzkJmt3VuIdYp2uUTXS/xmMdpLuT7jy5u3O0lpb1LsVCJ7n0L3nkTOdElSpKk7nHpBemQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdubu5GckT3eDG3l61ucz7N06afc797RU3q2CSnKKB4zpHGEfH
	ehIc5SbFopXRQA0aFn2bzFt+cpNGjE51sKot0nyUXT2qAVxA/t/+NqgLi9CxVZ4tHhvT
X-Gm-Gg: AR+sD13dkLMgY92RkvLhyFeg6fS1E9iS1fVF6SmZLZTXt4gIa8UGlg+UoIfcqjyMweC
	PUx4VgNlzko5gzpbYm62fDyZN6U7ujUTvIbCbF/m3cdHo+44e9fVV+49q7CKv/CkjjHjLN8+JCK
	fact9+gAf8q9upHYSWy+ngd5/F012hNuIMCB6yxn7EpgxegJI1nachRGUkB8n6mQbcqGk/1OBaQ
	WQaoo1gr9fYb3fjPIh99me0GgTb8M9ZJ304cfCeTtBMrRz+2oVtWhWcPzxUIMI//mT79lv+c/fT
	+ryUt1E4kzAycFAxtmt3i2XmfvJlH7T5fFVCjmbXrGp/e/Pi3GOOTtpVpgjQpUyrKEU5hLurkte
	h79d5a5bFX/EKhHogSIVt//O4PZpBaUi8tDJO6pgETL7OY4V9z+hkLiKZCN+H+tFUYVatdc0rDX
	unYfKkkvNcrbE78muMizLYzZi8VLSPBI4EcdkyrBegxVToB1ruOfK05oMSPMIkIIc=
X-Received: by 2002:a5d:6f0c:0:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-47fec63e205mr36677851f8f.30.1786088450464;
        Fri, 07 Aug 2026 00:40:50 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:49 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 1/6] dt-bindings: bao: add IPC shared-memory device
Date: Fri,  7 Aug 2026 08:39:28 +0100
Message-ID: <7fe7fbabed8d932a9d8d82e64c9c4d76100964c6.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004052_455327_74F730E1 
X-CRM114-Status: GOOD (  15.78  )
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

QWRkIHRoZSBkZXZpY2UtdHJlZSBiaW5kaW5nIGZvciB0aGUgQmFvIGh5cGVydmlzb3IgSVBDIHNo
YXJlZC1tZW1vcnkKZGV2aWNlLCB1c2VkIGJ5IGEgQmFvIGd1ZXN0IHRvIGV4Y2hhbmdlIGRhdGEg
d2l0aCBhIHBlZXIgZ3Vlc3Qgb3ZlciBhCnNoYXJlZC1tZW1vcnkgcmVnaW9uLgoKQ28tZGV2ZWxv
cGVkLWJ5OiBKb3PDqSBNYXJ0aW5zIDxqb3NlQG9zeXgudGVjaD4KU2lnbmVkLW9mZi1ieTogSm9z
w6kgTWFydGlucyA8am9zZUBvc3l4LnRlY2g+CkNvLWRldmVsb3BlZC1ieTogRGF2aWQgQ2VyZGVp
cmEgPGRhdmlkbWNlcmRlaXJhQG9zeXgudGVjaD4KU2lnbmVkLW9mZi1ieTogRGF2aWQgQ2VyZGVp
cmEgPGRhdmlkbWNlcmRlaXJhQG9zeXgudGVjaD4KU2lnbmVkLW9mZi1ieTogSm/Do28gUGVpeG90
byA8anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0KdjM6Ci0gRGVzY3JpYmUgdGhlIHJlYWQgYW5kIHdy
aXRlIGNoYW5uZWxzIHRocm91Z2ggcmVnL3JlZy1uYW1lcyBpbnN0ZWFkIG9mIHRoZQogIGN1c3Rv
bSByZWFkLWNoYW5uZWwvd3JpdGUtY2hhbm5lbCBwcm9wZXJ0aWVzOyBkcm9wIHRob3NlIHByb3Bl
cnRpZXMgYW5kIHRoZQogICJpZCIgcHJvcGVydHk7IGFkZCBhIHZlbmRvciAiYmFvLGlkIiBmb3Ig
dGhlIGh5cGVyY2FsbCBjaGFubmVsIGlkOyB1c2UgYQogIGdlbmVyaWMgbm9kZSBuYW1lIChzaG1l
bUAuLi4pIChLcnp5c3p0b2YgS296bG93c2tpKS4KLSBDbGFyaWZ5IHRoZSAiYmFvIiB2ZW5kb3It
cHJlZml4IGRlc2NyaXB0aW9uLgotIFN1YmplY3Q6IGRyb3AgdGhlIHJlZHVuZGFudCB0cmFpbGlu
ZyAiYmluZGluZyIgKEtyenlzenRvZiBLb3psb3dza2kpLgotIEFkZCBKb3PDqSdzIGFuZCBEYXZp
ZCdzIENvLWRldmVsb3BlZC1ieS9TaWduZWQtb2ZmLWJ5LgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Jhby9iYW8saXBjc2htZW0ueWFtbCB8IDU5ICsrKysrKysrKysrKysrKysrKysKIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAyICsKIDIgZmlsZXMg
Y2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vYmFvLGlwY3NobWVtLnlhbWwKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2JhbyxpcGNzaG1lbS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8saXBjc2htZW0ueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjYwOTQ3MTUwZDU3Ngot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8v
YmFvLGlwY3NobWVtLnlhbWwKQEAgLTAsMCArMSw1OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYmFvL2JhbyxpcGNzaG1lbS55YW1sIworJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3Rp
dGxlOiBCYW8gSHlwZXJ2aXNvciBJUEMgU2hhcmVkIE1lbW9yeSBEZXZpY2UKKworbWFpbnRhaW5l
cnM6CisgIC0gSm/Do28gUGVpeG90byA8anBlaXhvdG9Ab3N5eC50ZWNoPgorICAtIEpvc8OpIE1h
cnRpbnMgPGpvc2VAb3N5eC50ZWNoPgorICAtIERhdmlkIENlcmRlaXJhIDxkYXZpZG1jZXJkZWly
YUBvc3l4LnRlY2g+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFNoYXJlZC1tZW1vcnkgZGV2aWNlIGV4
cG9zZWQgYnkgdGhlIEJhbyBoeXBlcnZpc29yIHRvIGEgZ3Vlc3Qgc28gdGhhdCBpdAorICBjYW4g
ZXhjaGFuZ2UgZGF0YSB3aXRoIGEgcGVlciBndWVzdC4gVGhlIGh5cGVydmlzb3IgcHJvdmlkZXMg
dHdvCisgIGNvbnRpZ3VvdXMgbWVtb3J5IHJlZ2lvbnMsIG9uZSB0aGUgZ3Vlc3QgcmVhZHMgZnJv
bSAod3JpdHRlbiBieSB0aGUgcGVlcikKKyAgYW5kIG9uZSB0aGUgZ3Vlc3Qgd3JpdGVzIHRvIChy
ZWFkIGJ5IHRoZSBwZWVyKS4gQSB3cml0ZSBpcyBzaWduYWxsZWQgdG8KKyAgdGhlIHBlZXIgdGhy
b3VnaCBhIGh5cGVyY2FsbCBpZGVudGlmaWVkIGJ5IGJhbyxpZC4KKworcHJvcGVydGllczoKKyAg
Y29tcGF0aWJsZToKKyAgICBjb25zdDogYmFvLGlwY3NobWVtCisKKyAgcmVnOgorICAgIGl0ZW1z
OgorICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaW9uIHJlYWQgYnkgdGhpcyBndWVzdCBhbmQgd3Jp
dHRlbiBieSB0aGUgcGVlcgorICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaW9uIHdyaXR0ZW4gYnkg
dGhpcyBndWVzdCBhbmQgcmVhZCBieSB0aGUgcGVlcgorCisgIHJlZy1uYW1lczoKKyAgICBpdGVt
czoKKyAgICAgIC0gY29uc3Q6IHJlYWQKKyAgICAgIC0gY29uc3Q6IHdyaXRlCisKKyAgYmFvLGlk
OgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAg
IGRlc2NyaXB0aW9uOgorICAgICAgSHlwZXJ2aXNvci1hc3NpZ25lZCBpZGVudGlmaWVyIG9mIHRo
aXMgc2hhcmVkLW1lbW9yeSBjaGFubmVsLiBUaGUKKyAgICAgIGd1ZXN0IHBhc3NlcyBpdCB0byB0
aGUgQmFvIGh5cGVyY2FsbCB0aGF0IG5vdGlmaWVzIHRoZSBwZWVyIG9mIGEKKyAgICAgIHdyaXRl
LCBzbyBpdCBtdXN0IG1hdGNoIHRoZSBpZGVudGlmaWVyIGNvbmZpZ3VyZWQgZm9yIHRoZSBjaGFu
bmVsIGluCisgICAgICB0aGUgaHlwZXJ2aXNvci4KKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJs
ZQorICAtIHJlZworICAtIHJlZy1uYW1lcworICAtIGJhbyxpZAorCithZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIHNobWVtQGYwMDAwMDAwIHsKKyAg
ICAgICAgY29tcGF0aWJsZSA9ICJiYW8saXBjc2htZW0iOworICAgICAgICByZWcgPSA8MHhmMDAw
MDAwMCAweDIwMDA+LAorICAgICAgICAgICAgICA8MHhmMDAwMjAwMCAweDIwMDA+OworICAgICAg
ICByZWctbmFtZXMgPSAicmVhZCIsICJ3cml0ZSI7CisgICAgICAgIGJhbyxpZCA9IDwwPjsKKyAg
ICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRv
ci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRv
ci1wcmVmaXhlcy55YW1sCmluZGV4IDM5NjA0NGYzNjhlNy4uYjExYjNkZDk5NWE1IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sCkBAIC0yMzEsNiArMjMxLDggQEAgcGF0dGVyblByb3BlcnRpZXM6CiAgICAgZGVzY3Jp
cHRpb246IFNoZW56aGVuIEFaVyBUZWNobm9sb2d5IENvLiwgTHRkLgogICAiXmJhaWthbCwuKiI6
CiAgICAgZGVzY3JpcHRpb246IEJBSUtBTCBFTEVDVFJPTklDUywgSlNDCisgICJeYmFvLC4qIjoK
KyAgICBkZXNjcmlwdGlvbjogQmFvIFByb2plY3QgKGh0dHBzOi8vZ2l0aHViLmNvbS9iYW8tcHJv
amVjdCkKICAgIl5iYW5hbmFwaSwuKiI6CiAgICAgZGVzY3JpcHRpb246IEJJUEFJIEtFSkkgTElN
SVRFRAogICAiXmJlYWNvbiwuKiI6Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
