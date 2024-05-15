Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA9DC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 06:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJ5roMIUPp3mWX2CiKb9w6+RsfDJsmYauNVO5YNig2U=; b=GUJlIMHCyq6CtE
	vycdA4Sa1I5jzWfCoq+X1/OVY97fqzbsqapHNapsVynA2ajg1/ujNe9E6mvHcOR6sqbqBji9Cw66Q
	oHiBrlKH0s/kuX2+WfPhj7mAORr1L+I1bTxx5SwlU3aItNhOo+VO2fivg+/m1VkNKUTLXYLGpWbHO
	6kVfLbY3OTVKCX+J7jSvkWpZ0r/rCCBmp37iwu10xSsCUtb32aIhzxrFkeAPMofrxYC8/RrxdYrZK
	f3gGR2hb7CU4eSbjnPPVPJqkRFS6BZKIUlnt+bK+sYSQuWDalBwRRhDtv9IR+uF9tlU46oiDsYiSl
	fm6sihs+0xv9RdPcGtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7813-00000000dM2-1MtS;
	Wed, 15 May 2024 06:21:29 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7810-00000000dLI-27Pz
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 06:21:28 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36c90b7f4a5so22489375ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 23:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715754084; x=1716358884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pewL15YSqYyntUzZ2YESL84hcx8HG85YGqfAIHHWdj8=;
        b=avAEYy+fcs+uc92hOeo1YQTVos+Le2vCbKK+KYDxB79NhxC291hAGJepPar0JssUCj
         Ak2CVb3cu8d/F5MVYQ2gf1kIvw/ftOaRd7uWG7dwZPCiG1FNdVdUTkK1e4ZfKB12Q4VF
         sEiyZdZaf7NVUg0Od5zS5QKHkTY5Z0BFZKd1d4uUwePCs2mfPaD6Hv169twyarCwaSIF
         yEoXUQvlqwjLc/6MCQc4f4X6vGBs8CixHvgorn1Hu00UC7kysMjFk1jiH0oJl+6+YTmU
         4OL5Uu85ncy00ZLB42uQhJYl2t5c2v71tKDUngj2Mczp9VW/0PjixHNtiJJTDTNUx9da
         QE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715754084; x=1716358884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pewL15YSqYyntUzZ2YESL84hcx8HG85YGqfAIHHWdj8=;
        b=CZjER1yQYt4x8XjUxER3YfHMTWBiUavKZmzDuJsbjX4dQ/YTY0yVboP6WZ6brs3enn
         pqu1F0/wdy5BZoiZ4W97FoJrxpNa4loylbNGNBHaiO7Qr4keHapYlkPVSkx2kXCPK5Qv
         QqLbIli46RLE4XxLCmmdO8+QxkQcywtAHHpntL4zCIOx2KKlqagrfKLzAkgpXImW23xC
         NSraLo4Z7kWGpRnl5W05Pwl+FSpGkCxrJNQsoyX0MhyhXtZlHmmeOQKknZ357IFRlFCD
         6IsMMwRg2mRky2f4cfbg7ddblk94TPpoq+Qa2yV+tQC5ZceHmaC5yjeN2HWTF+ml9muY
         Hclw==
X-Forwarded-Encrypted: i=1; AJvYcCV8rWwuT7Nxcy8nTD+QK+uhw6UkDw7XtO7/ujkigfd7/rIcdc0Tqxh9mRlgznrYwp5352yVv9k64qboEkjLVIL3MlqTO6Y8MNi8UukvRMrU
X-Gm-Message-State: AOJu0YyErBN4W0SehluovR6EQQqVsBHBtLJc/+jRTI94q+Urncx0YNaR
	PCFcKdx9ID0g4lauihTw0QwQNhQNv7snRL1+wNrJT4HFWBItbPh82KFiQYON3TADhi2pIlKFzlq
	Hx6kC8CvaEMD1dPISkLgi3ajgYMqyIj+NIyGH2Q==
X-Google-Smtp-Source: AGHT+IHj1X7ctGdv9YJkalDZLMbFRUyxyYp6gndkUfhYp5Mhxyh+tcKm4XPw8K1pSADIXlV0LoBEwCYK5xLJibmm7LI=
X-Received: by 2002:a05:6e02:b49:b0:36b:aae:613 with SMTP id
 e9e14a558f8ab-36cc1319624mr127252835ab.10.1715754084373; Tue, 14 May 2024
 23:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAAhSdy2uSAA4TLmCvjuLsZT26wJyCQ0L61m5vg3BbBCSvHxVqg@mail.gmail.com>
In-Reply-To: <CAAhSdy2uSAA4TLmCvjuLsZT26wJyCQ0L61m5vg3BbBCSvHxVqg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 May 2024 11:51:12 +0530
Message-ID: <CAAhSdy2Fsu8PJH_+cPsFWQ8HmuPr_Ym-_YjnLKWtCqBLWTZ5kA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_232126_577334_AE07618D 
X-CRM114-Status: GOOD (  18.03  )
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

T24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgMTE6NDnigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDUsIDIwMjQgYXQgNjo0OOKAr0FNIElu
b2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRHVlIHRv
IHRoZSBkZXNpZ24sIFNvcGhnbyBTRzIwNDIgdXNlIGFuIGV4dGVybmFsIE1DVSB0byBwcm92aWRl
Cj4gPiBoYXJkd2FyZSBpbmZvcm1hdGlvbiwgdGhlcm1hbCBpbmZvcm1hdGlvbiBhbmQgcmVzZXQg
Y29udHJvbC4KPiA+Cj4gPiBBZGQgYmluZGluZ3MgZm9yIHRoaXMgbW9uaXRvciBkZXZpY2UuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxvb2suY29t
Pgo+Cj4gTEdUTS4KPgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgo+Cj4gQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpT
b3JyeSwgZm9yIHRoZSBub2lzZS4gUGxlYXNlIGlnbm9yZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBU
aGFua3MsCj4gQW51cAo+Cj4gPiAtLS0KPiA+ICAuLi4vaHdtb24vc29waGdvLHNnMjA0Mi1od21v
bi1tY3UueWFtbCAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3NvcGhnbyxzZzIwNDItaHdtb24tbWN1Lnlh
bWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2h3bW9uL3NvcGhnbyxzZzIwNDItaHdtb24tbWN1LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaHdtb24vc29waGdvLHNnMjA0Mi1od21vbi1tY3UueWFtbAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjA2NjdhYzQxZDc1Cj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaHdtb24vc29waGdvLHNnMjA0Mi1od21vbi1tY3UueWFtbAo+ID4gQEAgLTAsMCArMSw0MyBA
QAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2h3bW9uL3NvcGhnbyxzZzIwNDItaHdtb24tbWN1LnlhbWwjCj4gPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiAr
Cj4gPiArdGl0bGU6IFNvcGhnbyBTRzIwNDIgb25ib2FyZCBNQ1Ugc3VwcG9ydAo+ID4gKwo+ID4g
K21haW50YWluZXJzOgo+ID4gKyAgLSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5j
b20+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGNv
bnN0OiBzb3BoZ28sc2cyMDQyLWh3bW9uLW1jdQo+ID4gKwo+ID4gKyAgcmVnOgo+ID4gKyAgICBt
YXhJdGVtczogMQo+ID4gKwo+ID4gKyAgIiN0aGVybWFsLXNlbnNvci1jZWxscyI6Cj4gPiArICAg
IGNvbnN0OiAxCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsg
IC0gcmVnCj4gPiArICAtICIjdGhlcm1hbC1zZW5zb3ItY2VsbHMiCj4gPiArCj4gPiArYWxsT2Y6
Cj4gPiArICAtICRyZWY6IC9zY2hlbWFzL3RoZXJtYWwvdGhlcm1hbC1zZW5zb3IueWFtbCMKPiA+
ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6
Cj4gPiArICAtIHwKPiA+ICsgICAgaTJjIHsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArCj4gPiArICAgICAgICBo
d21vbkAxNyB7Cj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLWh3
bW9uLW1jdSI7Cj4gPiArICAgICAgICAgICAgcmVnID0gPDB4MTc+Owo+ID4gKyAgICAgICAgICAg
ICN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgIH07
Cj4gPiAtLQo+ID4gMi40NS4wCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
