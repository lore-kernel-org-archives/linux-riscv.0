Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDD5C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWy+U6JaqutQhC8CozsUjLw2ajyB3CBqGUGy5f5sJ4s=; b=hrYztxbsHyRNkv
	MMh77jYCaI/2oK7q9QQf43pY/ayKvJOGzcL7Cos0Gu3w8gt4GKWpfutlR3uuAVV3AjC2MUl1ElDKx
	QPszdJXrvB5x3dEqZeCCYuOuaDxucs/Edm+wvtXJ7qfLuKkA2esexfWxmE26Dbtz4+lPJbYuuAX7Q
	cz2gnH6y+YcLzprVlDxPfauusN1Tug64kyr1tl7tvpXSCBjPakqXKnmneRW1Ttyv+RzDCp4Sd3Hze
	uiJZV+0mnXTDLyZJYjv+rz8zxkaDnrm/mwIR3msZOeZFXIoj6X7AMsZwPnAEf2SA6psoTyjaxMEvw
	ZcT4f9CtK/CZAV6hrqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvgVj-00GJmg-1z;
	Sun, 07 May 2023 15:41:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvgVg-00GJjs-2O
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 15:41:17 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96598a7c5e0so572888366b.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1683474066; x=1686066066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmK4ZniIrv5NS2FCqVeO/kd1xlzXIt8FyXsfoSYtXMw=;
        b=fYjW3S6vBFo99DDejJ6dR3DOce/OvLlfqo/HdJ4jcvOr8u+y5mXdVuavzATqKorwsa
         Bgq9gfHaOfH3tKznswFAkGDv9e0tMFFrjrMDp7Hve7O8AeYO0ODHqC34PjYAotzscRam
         xIAiPV7psVblPakLMz75r1Qbr39aeiK4bDdoDMQFPgjPsmGKvDBksxSpedFueKgJYPdh
         GrwbmT7RbXER7GdRD9DJBMjawnobXY8E1kYF1qhud6Kl9KsOdu6uG+dARF3LjGR1rwbn
         mA6JqNfIgDbq+Y13VWHBDCfq+fTdFwhVDkOIPf0FTO//CNnrk+b0KbQzoV/+0yTzPKWf
         2Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474066; x=1686066066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmK4ZniIrv5NS2FCqVeO/kd1xlzXIt8FyXsfoSYtXMw=;
        b=PnJCPGgMD8tOsZ9x+0FfFyxrJt+8AKBhpmgoGlfKkDe7Hk90M7j/MbanwzHQbkmmaI
         h9SBAeowIlLDBxzjI3AbchdcI2s1Ms/OFmLMfcMFCZOnqXQAZRCwzvWNCTjBV9VNTwcB
         9aX+Ah6rgLOi1sFSzurrvYMbcLo5ryxeNYezvwhGG2vFFT1VIqsaqBcQr+pSRKLAkHMK
         43jv+mricoVcJvRxKFmqB8Y7nrnsX08mJmQ3kqgMLde0abFR+jbY8bFRNI1MiL935+QO
         ANMS82XRm/BfR69fNXy4ohfPWeBUcBM+Q+E67UdsJ5kLZ5RKi6iIZmt+8v6roHlYxxuJ
         ieUQ==
X-Gm-Message-State: AC+VfDxawjGY+wONbU0nKkYiLDmsS/BZ8d3cE0zcncjhHNfyZ5i9PMf1
	A1Z1ATvu7nqqRByKfctIDxbAdN6hO+PN+dAnw80S+A==
X-Google-Smtp-Source: ACHHUZ7LUfU0XgBCGz0+Z2idQCcP3BYRP2y6TVXSPJEs3131X/HL0Il9vnwl4JmH7cB3Dq9LYkObnyKL9fSVjvPtZNg=
X-Received: by 2002:a17:906:d554:b0:94f:e98:4e94 with SMTP id
 cr20-20020a170906d55400b0094f0e984e94mr6621340ejc.47.1683474066326; Sun, 07
 May 2023 08:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <202305061710302032748@zte.com.cn>
In-Reply-To: <202305061710302032748@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 May 2023 21:10:54 +0530
Message-ID: <CAAhSdy0fzEi7iOTk3+xS2TaryxXB5=Fy4Qp0k++U_Qq+wJktig@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: use bitmap_zero() API
To: ye.xingchen@zte.com.cn
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_084116_779606_DC1A2A76 
X-CRM114-Status: GOOD (  13.68  )
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

T24gU2F0LCBNYXkgNiwgMjAyMyBhdCAyOjQw4oCvUE0gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+
IHdyb3RlOgo+Cj4gRnJvbTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+Cj4K
PiBiaXRtYXBfemVybygpIGlzIGZhc3RlciB0aGFuIGJpdG1hcF9jbGVhcigpLCBzbyB1c2UgYml0
bWFwX3plcm8oKQo+IGluc3RlYWQgb2YgYml0bWFwX2NsZWFyKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBZZSBYaW5nY2hlbiA8eWUueGluZ2NoZW5AenRlLmNvbS5jbj4KCkxvb2tzIGdvb2QgdG8gbWUu
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS90bGIuYyBiL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gaW5kZXggMGU1NDc5NjAw
Njk1Li40NGJjMzI0YWVlYjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS90bGIuYwo+IEBAIC0yOTYsNyArMjk2LDcgQEAgc3RhdGljIHZv
aWQgbWFrZV94ZmVuY2VfcmVxdWVzdChzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICB1bnNpZ25l
ZCBpbnQgYWN0dWFsX3JlcSA9IHJlcTsKPiAgICAgICAgIERFQ0xBUkVfQklUTUFQKHZjcHVfbWFz
aywgS1ZNX01BWF9WQ1BVUyk7Cj4KPiAtICAgICAgIGJpdG1hcF9jbGVhcih2Y3B1X21hc2ssIDAs
IEtWTV9NQVhfVkNQVVMpOwo+ICsgICAgICAgYml0bWFwX3plcm8odmNwdV9tYXNrLCBLVk1fTUFY
X1ZDUFVTKTsKPiAgICAgICAgIGt2bV9mb3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2bSkgewo+ICAg
ICAgICAgICAgICAgICBpZiAoaGJhc2UgIT0gLTFVTCkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmICh2Y3B1LT52Y3B1X2lkIDwgaGJhc2UpCj4gLS0KPiAyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
