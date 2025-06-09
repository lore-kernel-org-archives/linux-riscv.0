Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1833C61DB2
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpAq62jmptTZbqO2AcIJAIeghe51ZULfw/r20ApPOBk=; b=0NUI9QTMZkQBk6
	5D+8gOLUjAPPt1eWlOIgtLiSBPlHOmaVn1dl6mfU5T3lGeNA0No2rn0LY0vnO7xFVM4WWMgogLLvl
	C32acGlanQiIrlS/ZzZWblP5+g0by7QIwo7l/oyAUiQ8LkjJEAyrvUeucHMyQ24X9Xju3eFSiRv5x
	fVh+ofCZhJiZsZxHlCRFllE3NiqbM82kbfmNCKx4rKpX6bOAUB4yGI5t+N8ssQZFM7Jlf9IgiDP1f
	jKuZvcPeSYpdMQov4Ty8/Cs/szVMmrtO/l4BkB4X+WWnJGItYDcykfqMPIgqCjUmovkj2qT63qx7u
	RacL/ME1Y9PmA6BL7JSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOVWY-00000003ULF-4847;
	Mon, 09 Jun 2025 05:58:22 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOVWW-00000003UKV-2Bfr
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 05:58:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5536b9be5f6so1748491e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 22:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749448699; x=1750053499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79dQYfKRjz/YesTMH1J35SSA7TkpXL6oM6f8PWhNqGs=;
        b=fFIB0rTLdDj6nM0nNt1W60fzas1kucyPZ0G5b1apLIY2aKyDRkLtvu7rT/pgLQOaoc
         +HfxCgksFJZk4VwxLRgWL5lSK36AksTyEueIA2SatFzKkhlJ1bF1ziP5488SGPsEowsT
         YDb2YLbvoA7omJlagd25ebXmhv3rKgx4PFCBuSL1rBMn8EcUJ8R7CRAbCoa1QEMGvYQE
         zQNpNA1yH+QqZ/IhRZdhhgZ3Tm1Z9VECYDzMO+o1uVjYEwtVHgTlBay7TbD5F9zspXJl
         de/nFZf5jy57NmQiTGZkzZdHGE0HL6pWGfV2XQyqLzdkLl5Vcn6vvzMyG77beMqAlh12
         qQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749448699; x=1750053499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79dQYfKRjz/YesTMH1J35SSA7TkpXL6oM6f8PWhNqGs=;
        b=KeZqLfaAs2W8kEGeHLDpXs6MRwJaQ+rrRh8ykYmlkTqkaSlspyvH2il/X41g9V90Sy
         IZqN01RyYRzLzx4mgwefuvksYChwqA+U5IT4ZW9TKFYbu48uMT0rm1tSLiC+Sdm9Gab0
         PR6wcni526xKEHv2Vtmogh0ISG3nB25ZfRw85BakkZwaS2HSpuouKKOKwfBqhdMawIJW
         bnMiTnKLACz1/Pxw7zyyh+Y9wUNVc24Cle19/3OMI+4pNJzguNhHcP3D1daEq4nnSPlZ
         99/DoEBAO67n+9FBSxeyd3Jjd6CHE307xucryGUDecti5JhmHTBHSIA25+s9q9CFWNVN
         HhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeZKl5OA2BNS5kxU7Eq6dl908fh1abVs1YouojpeqkYyEQBzaI8rQxFmmHED8KiEVAmpr79VnLCiMVsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj8ex01Ab1MoSwrnNbYSiVIycrApR10Rf9WUyg/IYCdTZbTlGJ
	J5AceyLVoar+NXDmii6BjgPDr6fgFQ/GRNdNUcZip+oEoCT1vUzrwIwnR3Xgqc10x0tS4S7LLOn
	26QAM/6O0jSuTsBnPOEsyz5Qang3COafcJZD34T8R7A==
X-Gm-Gg: ASbGncsSCQnhjNpDGmMuLq8l/N3HX2g4GaE8ynZOMmdf2Wvm/KSriB6y1+Bu07cikzh
	IevkD5zTpw0WUeLJPxa0FNxqJiX9mVqY73qIoQ/tXUP4u6iSqzqGKuk/1+EXLtgYsNJRumrlNzu
	nk9PzCuwhLGkkhgvUsMBEM+VRi8ETT8bwRXvGR7QA5fhOj
X-Google-Smtp-Source: AGHT+IEEAjCAU74AdDgZhPUpik9rwnZXkawnnn1BuceWjTl98W9A7+CL2sv8mgaup8C6oH709Ul1OgTzgtqBWZpTOi4=
X-Received: by 2002:a05:6512:39c3:b0:553:2486:e0fd with SMTP id
 2adb3069b0e04-55366bfa7a2mr2653560e87.23.1749448698667; Sun, 08 Jun 2025
 22:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-2-apatel@ventanamicro.com> <53abb1fc-6236-4266-a6e7-25023e27e160@linux.dev>
In-Reply-To: <53abb1fc-6236-4266-a6e7-25023e27e160@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 11:28:06 +0530
X-Gm-Features: AX0GCFsmWbRIoUi6nNFKjR9qXpFfrpwbKCN1t236wpZV7bl1kup6dBRNjwof4ew
Message-ID: <CAK9=C2VhmU1a9TN4+oLMNRfweHY8jw=W71k+HpqnUxxve6hNfQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/23] riscv: Add new error codes defined by SBI v3.0
To: Atish Patra <atish.patra@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_225820_558756_B2742CF3 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdW4gNywgMjAyNSBhdCA1OjIx4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPgo+IE9uIDUvMjUvMjUgMTo0NiBBTSwgQW51cCBQYXRlbCB3
cm90ZToKPiA+IFRoZSBTQkkgdjMuMCBkZWZpbmVzIG5ldyBlcnJvciBjb2RlcyBzbyBhZGQgdGhl
c2UgbmV3IGVycm9yIGNvZGVzCj4gPiB0byB0aGUgYXNtL3NiaS5oIGZvciB1c2UgYnkgbmV3ZXIg
U0JJIGV4dGVuc2lvbnMuCj4KPiBUaGlzIHBhdGNoIGNhbiBiZSBkcm9wcGVkIGFzIGl0IGlzIHBh
cnQgb2YgdGhlIEZXRlQgc2VyaWVzIHdpdGggbWlub3IKPiBtb2RpZmljYXRpb25zIGluIGVycm9y
IG1hcHBpbmdzLgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA1
MjMxMDE5MzIuMTU5NDA3Ny00LWNsZWdlckByaXZvc2luYy5jb20vCgpZZXMsIEkgYW0gYXdhcmUg
b2YgQ2xlbWVudCdzIHBhdGNoLiBJIHdhcyB0ZW1wb3JhcmlseSBjYXJyeWluZwp0aGlzIHBhdGNo
IG92ZXIgaGVyZS4KClJlZ2FyZHMsCkFudXAKCj4KPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaCB8IDEyICsrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gaW5kZXggM2QyNTA4
MjQxNzhiLi40ZGQ2YWFmYjg0NjggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiBAQCAt
NDE5LDYgKzQxOSwxMSBAQCBlbnVtIHNiaV9leHRfbmFjbF9mZWF0dXJlIHsKPiA+ICAgI2RlZmlu
ZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCAtNwo+ID4gICAjZGVmaW5lIFNCSV9FUlJfQUxSRUFE
WV9TVE9QUEVEIC04Cj4gPiAgICNkZWZpbmUgU0JJX0VSUl9OT19TSE1FTSAgICAtOQo+ID4gKyNk
ZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFICAgICAgICAtMTAKPiA+ICsjZGVmaW5lIFNCSV9F
UlJfQkFEX1JBTkdFICAgIC0xMQo+ID4gKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUICAgICAgICAg
ICAgICAtMTIKPiA+ICsjZGVmaW5lIFNCSV9FUlJfSU8gICAgICAgICAgIC0xMwo+ID4gKyNkZWZp
bmUgU0JJX0VSUl9ERU5JRURfTE9DS0VEICAgICAgICAtMTQKPiA+Cj4gPiAgIGV4dGVybiB1bnNp
Z25lZCBsb25nIHNiaV9zcGVjX3ZlcnNpb247Cj4gPiAgIHN0cnVjdCBzYmlyZXQgewo+ID4gQEAg
LTUwMywxMSArNTA4LDE4IEBAIHN0YXRpYyBpbmxpbmUgaW50IHNiaV9lcnJfbWFwX2xpbnV4X2Vy
cm5vKGludCBlcnIpCj4gPiAgICAgICBjYXNlIFNCSV9TVUNDRVNTOgo+ID4gICAgICAgICAgICAg
ICByZXR1cm4gMDsKPiA+ICAgICAgIGNhc2UgU0JJX0VSUl9ERU5JRUQ6Cj4gPiArICAgICBjYXNl
IFNCSV9FUlJfREVOSUVEX0xPQ0tFRDoKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsK
PiA+ICAgICAgIGNhc2UgU0JJX0VSUl9JTlZBTElEX1BBUkFNOgo+ID4gKyAgICAgY2FzZSBTQklf
RVJSX0lOVkFMSURfU1RBVEU6Cj4gPiArICAgICBjYXNlIFNCSV9FUlJfQkFEX1JBTkdFOgo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICAgICAgIGNhc2UgU0JJX0VSUl9JTlZB
TElEX0FERFJFU1M6Cj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ID4gKyAgICAg
Y2FzZSBTQklfRVJSX1RJTUVPVVQ6Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRVRJTUVET1VU
Owo+ID4gKyAgICAgY2FzZSBTQklfRVJSX0lPOgo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJ
TzsKPiA+ICAgICAgIGNhc2UgU0JJX0VSUl9OT1RfU1VQUE9SVEVEOgo+ID4gICAgICAgY2FzZSBT
QklfRVJSX0ZBSUxVUkU6Cj4gPiAgICAgICBkZWZhdWx0OgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
