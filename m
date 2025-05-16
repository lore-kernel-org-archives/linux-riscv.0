Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55262C54754
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfnwWt8vrfJFfvRxnuzgwfYTX+3Fd1xcT8vhaSAdbW4=; b=MiXTyNHHxw3aWp
	JNnaIcN2e0EuDLlt9LnN8o/KMqmiSHZZurRs50h2KNOEXy0YBNmYueED87uM022C4p/UCgDyYe9xE
	jkyaQ+7BfrTOOGIFmov9LOdRSx8i+OugwyVxghPO86plODBnuft/rOSo3CO8QlwrHAlgiMIOrPBxI
	DVGN1pbvROYSpNjSxL0NDbMLVt0bW7hz4dbaBsqOAplyeAa9VZH3XQc1mbycm0NI19kH0hFJYorBa
	kU/aEyH/uuEt//8e5UU20oI7wfgdVNV0YbH8JeudBRYUh0fjMLiTlzV5kab/It6B4r5h4i384Dk64
	sAlXMATSY1B7HRfVPaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyhu-000000049Mb-01vH;
	Fri, 16 May 2025 17:18:50 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFybH-000000048PQ-3ldy
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 17:12:01 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5241abb9761so809409e0c.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747415518; x=1748020318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhDH5x31OY0sDQlP+75NDdLaYCVS3MYscT17OHcsFQo=;
        b=JMlv8xChwYyFzCBmeZDT3pogqgrPbYCJss4Yp0kuCsxe4+UwtpG+OuG+YztE3vmpLm
         4KqQ26wqaXbWOWxPYhy1czFwfnKbXlM14K9d/VPzOW9EPbTF/JWv7BXhC/KXurovaF23
         KtoKuk5f3pQB5W2pjUVZN3DjIn31lgFzOPwehKgg6TU/Tgp8gJdgkRU9fubhlIvRVHbp
         qTHGrEFFn4TF87d+ICW0a+wNjYpeQGmo5ykCi1avH/cvNMzQF5SnH/EJIkftvudLW+Q8
         AH3/pD9BYnQ5JiUoafitsq1LG+e8uzbxpNLNPtXTGPrJtYTmFdxSqPZutlbO/N8rah2q
         9ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747415518; x=1748020318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhDH5x31OY0sDQlP+75NDdLaYCVS3MYscT17OHcsFQo=;
        b=Jj9+CzHyHg8+10B1nqUL4WCDMnj6C+LQPJeZ5f+O7HvwEsSvC+X7ambf2YwMrexB+2
         hDRulsMxD3hXnbpmjp9pXAxJXcKMf70tyjvPKc1j/dxdVagvAaZXvr5egOc876T4P7hS
         hlX64LQIE+zN3cpEwBNZluOQ1UeTTnCIYqwZilRM4EilmlZ7jRoL0GXcE9bSrhttfsoG
         81xQbY6Cyul4kKR2/Nk8XWzVGX9bimbccgWHesxdhhBvUbitHgNx4d6/1XWok+6ddGXJ
         LMxFDMi5Yn5Nx1Ep6wLJVLRuNAyuf1Rx0HV9IULJDQQgz/tjpbZrC7amGhc67oUbYy4/
         SREg==
X-Forwarded-Encrypted: i=1; AJvYcCWhV+VRuSpncUI4cHwI+QQaOuGcu7V13WtlGVMyKZvcGI9MYUM8d4t35XIkg8a5WVFeZ3IHdR7cgoC/lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhTJcLmELH6Q9SBg6SEtT7PSwko587YKuNTbQDl8BhCKz3R7AC
	S2JD3uLl6I59RvccsxQGBq8KncIFlgG7PishCovHk+yJDcjh5jPHUz5yveIK/g/TS8MiqncwkCy
	K0y03C6sUMMu1quT0tyaEeGVTD9rMKTo=
X-Gm-Gg: ASbGncumrPhzvObhYuzhkQo0iX1+WQMiOjI8p5r6CLt5MGo4n6QUYiutp5O4jt6N4x4
	EyV9Z+qOxz28kYGfXwb757rrj9c37PncQiCf2vyS8T7QEelyG+yRgARcTBQHgZawIgBYI2myAF9
	y5HMzY8jB2F9nTUhkbtWEPfAGokgOShJM=
X-Google-Smtp-Source: AGHT+IGCHH91w5aLLk2zhH1OD0M76Qr/hbRf+ItmTxpc3fxs9gNjUQOKE6DSW7gfQpTUGMqdAkdbaP7RWiKhTiRaV/Y=
X-Received: by 2002:a05:6122:221d:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-52dba7fe312mr4755074e0c.1.1747415517612; Fri, 16 May 2025
 10:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747231254.git.rabenda.cn@gmail.com> <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
 <20250514-showplace-yahoo-e3c306355288@spud>
In-Reply-To: <20250514-showplace-yahoo-e3c306355288@spud>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 17 May 2025 01:11:46 +0800
X-Gm-Features: AX0GCFvBGlC7lcpTFlf3PZ0KsWEj3nP-8_pPYriZOyvUH2LtrlBI49XleAD1C_M
Message-ID: <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_101159_932171_2617A98B 
X-CRM114-Status: GOOD (  17.51  )
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

T24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgMTI6MjLigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTA6MDg6NTlQTSAr
MDgwMCwgSGFuIEdhbyB3cm90ZToKPiA+IEFkZCBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9y
IHRoZSBTb3BoZ28gU0cyMDQyX0VWQl9WMS5YIGJvYXJkIFsxXS4KPgo+IDEueD8gSXMgdGhlIHYx
LjAgc29tZXRoaW5nIHBlb3BsZSBjYW4gZ2V0IHRoZWlyIGhhbmRzIG9uLCBvciBqdXN0IHRoZQo+
IHYxLjE/Cj4gV2hhdCBkaWZmZXJlbmNlcyBkbyB0aGUgYm9hcmRzIGhhdmUgdGhhdCBhcmUgbWlu
aW1hbCBlbm91Z2ggdGhhdAo+IHNwZWNpZmljIGNvbXBhdGlibGVzIHdvdWxkIG5vdCBiZSByZXF1
aXJlZD8KPgoKRmlyc3Qgb2YgYWxsLCB2MS4xIGFuZCB2MS4wIGFyZSBjb21wYXRpYmxlIGJvYXJk
cy4KVGhlcmUgaXMgbm8gZGlmZmVyZW5jZSBiZXR3ZWVuIHYxLjEgYW5kIHYxLjAgZnJvbSBkdHMu
CgpCb3RoIHYxLjEgYW5kIHYxLjAgaGF2ZSBiZWVuIGRpc2NvbnRpbnVlZC4KQWJvdXQgODAgcGll
Y2VzIG9mIHYxLjEgYXJlIGluIHRoZSBoYW5kcyBvZiBjb21tdW5pdHkgZGV2ZWxvcGVycy4KCj4g
Pgo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9zb3BoZ28taGFyZHdhcmUvdHJl
ZS9tYXN0ZXIvU0cyMDQyL1NHMjA0Mi14OC1FVkIgWzFdCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
SGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwgfCAxICsKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sCj4gPiBpbmRleCBhMTRjYjEwZmYz
ZjAuLjZjODJmODliNTZjYSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9zb3BoZ28ueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sCj4gPiBAQCAtMzQsNiArMzQsNyBAQCBw
cm9wZXJ0aWVzOgo+ID4gICAgICAgIC0gaXRlbXM6Cj4gPiAgICAgICAgICAgIC0gZW51bToKPiA+
ICAgICAgICAgICAgICAgIC0gbWlsa3YscGlvbmVlcgo+ID4gKyAgICAgICAgICAgICAgLSBzb3Bo
Z28sc2cyMDQyLWV2Yi12MQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBzb3BoZ28sc2cyMDQyCj4g
Pgo+ID4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gPiAtLQo+ID4gMi40Ny4yCj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
