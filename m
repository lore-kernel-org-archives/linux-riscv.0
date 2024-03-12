Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8F3C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukGI+FtjQDnuvOqi0pyYGFBB+EFB2qTntIjfCYPCDpI=; b=W3SDRivOODlf2k
	tNVic7wCKIIen8lJmwHNeCb+4+T5iADe71FHOu4DqPY6HOJJTFRGoU0IA3mthE6VPkG0WhUWZ8rGn
	J8c1dLl664VUW+ABL1GgWLaJ4isZByHiDRsHf4kyu3JP1bh89Ftd+EhvMwk6VxHDQlamFjPuu0e2j
	Z2OwcMuDFkmYhcBi1YSz6i4CjyqCN4WQV8zJYKTV0Kx5CBV+0KoLO/BcI7wiq6Ks+UXMymlucbyP0
	SmzSrmZvww+0uwrupvaw1Z9e6AY4LKy6XueggRvcX77XmPoRU5P/+IPsDZnEV5pzHdZ0W9Ko3xtLC
	r8K+vkU7WL++881eR1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7Yk-00000007Fff-1U79;
	Tue, 12 Mar 2024 19:13:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7Yg-00000007FeU-49Qv
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:13:08 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-513b39eea3dso240334e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1710270782; x=1710875582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jG8wbZD5AfK31iZyN31p0fO15RUS8zjleaircOhECw=;
        b=g2ipN9mnCQDrO/hr2YHWS8j3svwpq243dbpnTfEQYNys9wPssVjlheqIt8WlIFQzSm
         aTwzzfDBfhMVkeNqHjurNxrry89hSpsEMVGH2PMxqSB7mQAfg3pEc8McCYE5fivEY49t
         ah44+coE/G1GaxPc9ng8JO/lfBp3m5P2llHuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710270782; x=1710875582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jG8wbZD5AfK31iZyN31p0fO15RUS8zjleaircOhECw=;
        b=A7UEwcnulXu/8bviHqMLkeoLmQ/+icBVrAvOimqaExErMD/EDkmCnc0WN9pLJ2pwnY
         MWu5I1XAoLrm2CLMSnPsMXMcUYBks8e+2YnbCga8VaqRw5W04jdPQeldB04qXFWRrUo9
         gt2iomRBynlvxTJJ334sBYkY8nmQEOV0eIa+nusPnmVxIqdi8boToArrWv//goa5zwG4
         kRwbOr/6DpL4VV/zHYg7muErDxzm+kcJKXtOCpbSQycDLhJD098nYhOn4DppVF1qOfE4
         HO1Odx8HJw2bdRgr6q22hYuNg37ge4uUvK9n0gf1D/rp3/iesHGOrPag5Xrhexn3m/76
         Zk6g==
X-Gm-Message-State: AOJu0YznQuu0iQGnM5QwDpL5Ippu2/UwYnZ1HgQQQEvDnwtiyw/MEN1q
	N7Q+JNF66hhTmnP1vEOo78MOM0OhDXUDR/xojy6rDd6beNoc63IxynBbIbYXop+USoBNdfY3zJE
	x7YDFatbr93sESSN8PQT2e4rXo9Ny/jBGSak/
X-Google-Smtp-Source: AGHT+IGPN7MP8pGrBw+bqrQS1y4hzsPicRpPqb0kh9lC4781+mVZ8XqAvBGV25wdDyJyi7TeYTLFfsuHZmR1lT5iWJ8=
X-Received: by 2002:a05:6512:5c8:b0:513:c7eb:edf1 with SMTP id
 o8-20020a05651205c800b00513c7ebedf1mr32508lfo.59.1710270782277; Tue, 12 Mar
 2024 12:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240312012053.1178140-1-pulehui@huaweicloud.com>
In-Reply-To: <20240312012053.1178140-1-pulehui@huaweicloud.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Mar 2024 12:12:50 -0700
Message-ID: <CAOnJCUKF4BWfX+Z6cQLjfFKc5+REsSXWiVvcHadrs-=z1b6+5g@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_*
 while not supported
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_121307_177879_A8193C34 
X-CRM114-Status: GOOD (  16.58  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNjoxOeKAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gUklTQy1WIHBlcmYgZHJpdmVyIGRvZXMgbm90IHlldCBzdXBwb3J0IGJyYW5jaCBzYW1w
bGluZy4gQWx0aG91Z2ggdGhlCj4gc3BlY2lmaWNhdGlvbiBpcyBpbiB0aGUgd29ya3MgWzBdLCBp
dCBpcyBiZXN0IHRvIGRpc2FibGUgc3VjaCBldmVudHMKPiB1bnRpbCBzdXBwb3J0IGlzIGF2YWls
YWJsZSwgb3RoZXJ3aXNlIHdlIHdpbGwgZ2V0IHVuZXhwZWN0ZWQgcmVzdWx0cy4KPiBEdWUgdG8g
dGhpcyByZWFzb24sIHR3byByaXNjdiBicGYgdGVzdGNhc2VzIGdldF9icmFuY2hfc25hcHNob3Qg
YW5kCj4gcGVyZl9icmFuY2hlcy9wZXJmX2JyYW5jaGVzX2h3IGZhaWwuCj4KPiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtY29udHJvbC10cmFuc2Zlci1yZWNvcmRzIFswXQo+
IEZpeGVzOiBmNWJmYTIzZjU3NmYgKCJSSVNDLVY6IEFkZCBhIHBlcmYgY29yZSBsaWJyYXJ5IGZv
ciBwbXUgZHJpdmVycyIpCj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jIHwgNCArKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYv
cmlzY3ZfcG11LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiBpbmRleCBjNzhhNmZkNmM1
N2YuLmI0ZWZkZGRiMmFkOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMK
PiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiBAQCAtMzEzLDYgKzMxMywxMCBAQCBz
dGF0aWMgaW50IHJpc2N2X3BtdV9ldmVudF9pbml0KHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCkK
PiAgICAgICAgIHU2NCBldmVudF9jb25maWcgPSAwOwo+ICAgICAgICAgdWludDY0X3QgY21hc2s7
Cj4KPiArICAgICAgIC8qIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IGJyYW5jaCBzdGFjayBzYW1w
bGluZyAqLwo+ICsgICAgICAgaWYgKGhhc19icmFuY2hfc3RhY2soZXZlbnQpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICAgICAgICAgaHdjLT5mbGFncyA9IDA7
Cj4gICAgICAgICBtYXBwZWRfZXZlbnQgPSBydnBtdS0+ZXZlbnRfbWFwKGV2ZW50LCAmZXZlbnRf
Y29uZmlnKTsKPiAgICAgICAgIGlmIChtYXBwZWRfZXZlbnQgPCAwKSB7Cj4gLS0KPiAyLjM0LjEK
PgoKClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KLS0gClJl
Z2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
