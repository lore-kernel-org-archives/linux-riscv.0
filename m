Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EDDE77190
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6/VkMuBnNAkek+UNcuB8O8k5xrP/AjP2xiW/jTjroA=; b=NM7v9Pu0JcFdRw
	79cxVPqDY0oRRjM7xebaDaGcbOaARgjmjdN0HIHZ1ILF5UiAcTQerkKL/0fJMuacCPhhVNwjJb1LO
	shno0W001P2LZfGfuye4wXeUsb2iaCTECqNeUrW716Alu6YbIszFw+LZ5EJ9Hkub/O3vwkGTmY8Nj
	wWF3m2lE4xQcwUTSACLIOp9LBuB1dCGr9PK4XTWCWhVlc5shu53mdf6yZ6WXxU82ju4glK2Lb0ieF
	J01zGCwwQbzoiH5RHztbd2UsNXvi4P8E5OOZuZlt0JiK/K96bp+XjhgDykZ0I5vQj5p30m2y5VNJV
	SmMzQLz5cT2U3PaWLfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBPJ-00000001BNy-3XCZ;
	Thu, 19 Dec 2024 07:57:17 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBBf-000000018Fs-24tS
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 07:43:12 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-8442ec2adc7so15887539f.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 23:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734594190; x=1735198990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OBSLf6ezAUOBKlVMuu5hWXIY5CF9SG01M/FkrWs7IM=;
        b=Kfe5Ej4Qp6ssepuq6WLfl+eD5C4N4m4p8uZGSuWtmWEwMsQtoQL0+78FgUgotGZEJC
         Z+xRGGanjfNGw/jhPmiA5xo16iNhTa7Qc0Qfn8NKojd+5pdNWrhOgI+Qbx/+DlOjKT8X
         WwlwJTsVlD3WDy/C9+6XjKtoiB9k/8iLbAvF/KdEgRkJyUHSvnPRdlOlzj60btwJbPx/
         CL1rFTXmq35YGUR0/9baGs21qawqOfpZJoQVFTsQIsniV0auebNHO8XyKp4sK7/UkrtV
         tR+gYxY+186DQv80bkJvwLuer37Nwgg5zQOe5ekjcfurTJ854Afaa5ycpEwejTjVr0Ox
         gd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594190; x=1735198990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OBSLf6ezAUOBKlVMuu5hWXIY5CF9SG01M/FkrWs7IM=;
        b=sA1sG/sHRkbZaaZjzh6TjyE0/FkVX2hjZp7wDqf48QhGNj3KqmUke/eoo+NU2MLHoZ
         gwwwdGs8VsAm0L0TD980sJtOHZ71qX3awxQ3UTzrGIUbsteE0h3D2HiMXgHI/ARxOSY3
         0LkxfUB81Q46MCgBNBfUWzf0Q5OMW3eGOq7nQjcPokhem6R8DXIK08bi9Ka05lLRtTco
         r8fbbtgInm3sFLllusFaxqtA2EBPduwK0jFQ74ynz+E0+J3ctX06R+dT5/LS3ia/xevL
         ZTWU4Bke4n9kivUTC7xpq9HRmjnA2f4NFz7UBp3KUkTVUFXIPT9rTaAGZyooKwoxV6p6
         zgOg==
X-Forwarded-Encrypted: i=1; AJvYcCVN3dq8UqHm0OlRtXrocmUvuthllWy1IbC7Hwdj88yGsRpSqKK6oN0wcad3Tae1bP6eFiealY4MjFX5Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy63vbFmz8Cb4yZyMGupoxAzpnZkn+d5EaTqrxuETNOuhQHCGdr
	k38p2oT+YuWe82mSUAzNMMuRwdluHHdI1rZdkn2ec1mdw/DBJxGCii1OaTBcW4wqnDTUv3pIY1j
	JyIwW7bxGVmulX2eV7lEZ1PNUzbHwFcWB1zzVhw==
X-Gm-Gg: ASbGncvKTiYVshU30nJfoyCyQSe61wyg31DfYIBZ69rMswQbxxNLkH5Ff5iSVW2NRPq
	+DiOEul+lv3YYtoaSNpkXzFADqBQvaHQKsu1fn7v2
X-Google-Smtp-Source: AGHT+IEYkbHFgP7rWEbUL4gJw6AmdAq+2B/xjkc5BL4zM4osboITpF6FofLzy/cYgFT9HyU3ZxpxXw1GxTtEEJ9scZ0=
X-Received: by 2002:a05:6e02:160a:b0:3a7:e86a:e80f with SMTP id
 e9e14a558f8ab-3bdc003ea26mr62053815ab.3.1734594190381; Wed, 18 Dec 2024
 23:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20240619153913.867263-1-cleger@rivosinc.com> <20240619153913.867263-6-cleger@rivosinc.com>
In-Reply-To: <20240619153913.867263-6-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2024 13:12:58 +0530
X-Gm-Features: AbW1kvZ_WXwEDbsqmAKgoCiT1ZSWNjyowoJciFKcgfWXJoYFYtMyuYjF6-4g-mE
Message-ID: <CAAhSdy3gYPa82zj+fAXtkDvJuKXoWBNj5Mx+XjHXkn=a2c__ig@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to
 get-reg-list test
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_234311_528563_2B9FB2AB 
X-CRM114-Status: GOOD (  12.86  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOToxMeKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIFJJU0MtViBhbGxvd3MgWmFhbW8vWmFs
cnNjIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNIHNvIGFkZCB0aGVzZQo+IGV4dGVuc2lvbnMgdG8g
Z2V0LXJlZy1saXN0IHRlc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiBpbmRleCAxYTU2MzdhNmVhMWUuLjcwMjE2YTE3
NjBjMyAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0
LXJlZy1saXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0
LXJlZy1saXN0LmMKPiBAQCAtNDgsNyArNDgsOSBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVn
KQo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lT
QV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9TVklOVkFMOgo+ICAgICAgICAgY2FzZSBLVk1f
UkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9TVk5BUE9UOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9TVlBCTVQ6Cj4gKyAg
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdM
RSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1POgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NW
X0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9a
QUNBUzoKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVND
Vl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkFMUlNDOgo+ICAgICAgICAgY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aQkE6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCQjoKPiAgICAgICAg
IGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfWkJDOgo+IEBAIC00MjAsNyArNDIyLDkgQEAgc3RhdGljIGNvbnN0
IGNoYXIgKmlzYV9leHRfc2luZ2xlX2lkX3RvX3N0cihfX3U2NCByZWdfb2ZmKQo+ICAgICAgICAg
ICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4gICAgICAgICAgICAgICAgIEtWTV9J
U0FfRVhUX0FSUihTVk5BUE9UKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNW
UEJNVCksCj4gKyAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQUFNTyksCj4gICAgICAg
ICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQUNBUyksCj4gKyAgICAgICAgICAgICAgIEtWTV9J
U0FfRVhUX0FSUihaQUxSU0MpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkJB
KSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCQiksCj4gICAgICAgICAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihaQkMpLAo+IEBAIC05NTAsNyArOTU0LDkgQEAgS1ZNX0lTQV9F
WFRfU0lNUExFX0NPTkZJRyhzc3RjLCBTU1RDKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJ
RyhzdmludmFsLCBTVklOVkFMKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyhzdm5hcG90
LCBTVk5BUE9UKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyhzdnBibXQsIFNWUEJNVCk7
Cj4gK0tWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemFhbW8sIFpBQU1PKTsKPiAgS1ZNX0lTQV9F
WFRfU0lNUExFX0NPTkZJRyh6YWNhcywgWkFDQVMpOwo+ICtLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHphbHJzYywgWkFMUlNDKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmEsIFpC
QSk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJiLCBaQkIpOwo+ICBLVk1fSVNBX0VY
VF9TSU1QTEVfQ09ORklHKHpiYywgWkJDKTsKPiBAQCAtMTAxMiw3ICsxMDE4LDkgQEAgc3RydWN0
IHZjcHVfcmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ICAgICAgICAgJmNvbmZpZ19zdmlu
dmFsLAo+ICAgICAgICAgJmNvbmZpZ19zdm5hcG90LAo+ICAgICAgICAgJmNvbmZpZ19zdnBibXQs
Cj4gKyAgICAgICAmY29uZmlnX3phYW1vLAo+ICAgICAgICAgJmNvbmZpZ196YWNhcywKPiArICAg
ICAgICZjb25maWdfemFscnNjLAo+ICAgICAgICAgJmNvbmZpZ196YmEsCj4gICAgICAgICAmY29u
ZmlnX3piYiwKPiAgICAgICAgICZjb25maWdfemJjLAo+IC0tCj4gMi40NS4yCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
