Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E53EC001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwAIY89OvPoKSAR884zMmaYGW7iLBib8Yq6GyN13s8w=; b=sxw2NjCxZnTXKE
	iacPK5/xmU1THdIuw7sOtPeukjDsFT4rhAAApkLeKXvJlpvBtWzJxLiZFof6WCK6qcZyfidRXXKc+
	lWmUoaVLP7Ls1fCgX/RXY1Q6qlCGtzEJIUGJv0gMfyyMA2mXieX7N5Y8OAl8zSGwwCZbYLJ3g+FxZ
	xU+q5DcItuAAv7WlTEHbii3YNXjLB0FRsdJHoQeGes4WBUEA9DX6SE+rwxwaAQGi7/GtCLO9Zu5z5
	ym3xttgzlVQ9JvjhjUWK0K6Pnx71DhkrIpStqiJIA9SOhgnpyfUe81oe1yYrjbt0zmhlKpKE23E0A
	WpNaiVg//XsrQjseLeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurrN-006zux-21;
	Mon, 23 Oct 2023 10:08:33 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurrJ-006zu3-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 10:08:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9bf941607d4so93415166b.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698055707; x=1698660507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aEOfuIyiwkOnqlQnKYH2Ng5EBPcZk7vfkvoKG6EFyM=;
        b=g51oH45HH8UES1oixrtFyEObgYre0eXFAEeu13OfXYSmkY88knR6iL6T4b+TvvaYhx
         qbEwzMWQMC8M/piIFhlhjCTvLHwt0/WsqEpmwsBVkXBX1vMqleWp+RkCrEtJaiAPbQKN
         AvBqUk3sMZX/GBgEwW5HIcOjcnR5CULyTq6p/hqyDn7aDfEDlwMc2OGfy4jLEtRQ+41g
         GgrNTtX5fUSzg9tff0ssBvvY9cRkb2f27rXjwnLnmVPzdVZz0vlQAcs3/SRimsXo0mQP
         /MRAuKKcG3mTMp1Wf94aVOrE8WejvTtX5I9+JctxeEf4gid6CjghxXvizme9eN7267fW
         JABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055707; x=1698660507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1aEOfuIyiwkOnqlQnKYH2Ng5EBPcZk7vfkvoKG6EFyM=;
        b=p9oyzK6kdAHQlVal/00BAPfoPM2lojdb6GKThcZS8GNOE3f0nGqBZr+nQ5xBSAQJ4Q
         zpwMpzpavdQEPipGyJG64WmsvZ0Xt+KV2Vmst2qP7Tw6NPgWErtk25Wo+4eTWYq8hngy
         S13dFUOQhefJDz8dPDgOQCx1GNjAj46tuHbpxo5Jg4+PkRAGGVb2V1MZepzqiJauqPC2
         lhTUmVrb8yo6saAWyyRDc9laE0E9jl3+iRZqcHrqiWGywtxNqh0tolriqco1e/lkK2Wn
         oEwKj/ByEtUBLnn71+HGeoP5Eiq+AqYgowQI2MFRxXfrhwjQKCixuCZ9YLHL627SH5xO
         62HA==
X-Gm-Message-State: AOJu0YxyNEMEisah4EQnhzZ5NMVyA7qjWrzo/7t6VAcOVd4IktInhljK
	7oWaNKqJZaJg5JydwJKy9g1iBw3VuED7GwxffCJVIg==
X-Google-Smtp-Source: AGHT+IF0AGitdQJUS/4bR8okkah9gJ8ur6YNsJ9+3rz+vlExwWE6UKBsdxQZQMbHsSgKlRITPAhqDQ==
X-Received: by 2002:adf:a30e:0:b0:32d:c312:49af with SMTP id c14-20020adfa30e000000b0032dc31249afmr5895229wrb.6.1698055686818;
        Mon, 23 Oct 2023 03:08:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc? ([2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d628d000000b0032daf848f68sm7437719wru.59.2023.10.23.03.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 03:08:06 -0700 (PDT)
Message-ID: <435519d9-e569-4714-b50b-f46ac281478e@rivosinc.com>
Date: Mon, 23 Oct 2023 12:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-3-cleger@rivosinc.com>
 <20231023-136cad6e15a2c5c27b6176af@orel>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231023-136cad6e15a2c5c27b6176af@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_030829_479451_A59AD134 
X-CRM114-Status: GOOD (  14.70  )
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

CgpPbiAyMy8xMC8yMDIzIDExOjU5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gV2VkLCBPY3Qg
MDQsIDIwMjMgYXQgMDQ6MzA6NTFQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IC4u
Lgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvbWVtbW92ZS5TIGIvYXJjaC9yaXNjdi9s
aWIvbWVtbW92ZS5TCj4+IGluZGV4IDE5MzBiMzg4YzNhMC4uNTEzMDAzM2UzZTAyIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlLlMKPj4gKysrIGIvYXJjaC9yaXNjdi9saWIv
bWVtbW92ZS5TCj4+IEBAIC03LDcgKzcsNiBAQAo+PiAgI2luY2x1ZGUgPGFzbS9hc20uaD4KPj4g
IAo+PiAgU1lNX0ZVTkNfU1RBUlQoX19tZW1tb3ZlKQo+PiAtU1lNX0ZVTkNfU1RBUlRfV0VBSyht
ZW1tb3ZlKQo+PiAgCS8qCj4+ICAJICogUmV0dXJucwo+PiAgCSAqICAgYTAgLSBkZXN0Cj4+IEBA
IC0zMTQsNSArMzEzLDYgQEAgU1lNX0ZVTkNfU1RBUlRfV0VBSyhtZW1tb3ZlKQo+PiAgCj4+ICBT
WU1fRlVOQ19FTkQobWVtbW92ZSkKPiAKPiBTaG91bGQgdGhpcyBvbmUgYWJvdmUgYmUgcmVtb3Zl
ZD8KCkh1Z2ggOi8geWVhaCwgdGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLgoKPiAKPj4gIFNZTV9G
VU5DX0VORChfX21lbW1vdmUpCj4+ICtTWU1fRlVOQ19BTElBU19XRUFLKG1lbW1vdmUsIF9fbWVt
bW92ZSkKPj4gIFNZTV9GVU5DX0FMSUFTKF9fcGlfbWVtbW92ZSwgX19tZW1tb3ZlKQo+PiAgU1lN
X0ZVTkNfQUxJQVMoX19waV9fX21lbW1vdmUsIF9fbWVtbW92ZSkKPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbGliL21lbXNldC5TIGIvYXJjaC9yaXNjdi9saWIvbWVtc2V0LlMKPj4gaW5kZXgg
MzRjNTM2MGM2NzA1Li4zNWYzNThlNzBiZGIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbGli
L21lbXNldC5TCj4+ICsrKyBiL2FyY2gvcmlzY3YvbGliL21lbXNldC5TCj4+IEBAIC04LDggKzgs
NyBAQAo+PiAgI2luY2x1ZGUgPGFzbS9hc20uaD4KPj4gIAo+PiAgLyogdm9pZCAqbWVtc2V0KHZv
aWQgKiwgaW50LCBzaXplX3QpICovCj4+IC1FTlRSWShfX21lbXNldCkKPj4gLVdFQUsobWVtc2V0
KQo+PiArU1lNX0ZVTkNfU1RBUlQoX19tZW1zZXQpCj4+ICAJbW92ZSB0MCwgYTAgIC8qIFByZXNl
cnZlIHJldHVybiB2YWx1ZSAqLwo+PiAgCj4+ICAJLyogRGVmZXIgdG8gYnl0ZS1vcmllbnRlZCBm
aWxsIGZvciBzbWFsbCBzaXplcyAqLwo+PiBAQCAtMTEwLDQgKzEwOSw1IEBAIFdFQUsobWVtc2V0
KQo+PiAgCWJsdHUgdDAsIGEzLCA1Ygo+PiAgNjoKPj4gIAlyZXQKPj4gLUVORChfX21lbXNldCkK
Pj4gK1NZTV9GVU5DX0VORChfX21lbXNldCkKPj4gK1NZTV9GVU5DX0FMSUFTX1dFQUsobWVtc2V0
LCBfX21lbXNldCkKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyBiL2Fy
Y2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+PiBpbmRleCAwOWI0N2ViYWNmMmUuLjNhYjQzOGYzMGQx
MyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+ICsrKyBiL2FyY2gv
cmlzY3YvbGliL3VhY2Nlc3MuUwo+PiBAQCAtMTAsOCArMTAsNyBAQAo+PiAgCV9hc21fZXh0YWJs
ZQkxMDBiLCBcbGJsCj4+ICAJLmVuZG0KPj4gIAo+PiAtRU5UUlkoX19hc21fY29weV90b191c2Vy
KQo+PiAtRU5UUlkoX19hc21fY29weV9mcm9tX3VzZXIpCj4+ICtTWU1fRlVOQ19TVEFSVChfX2Fz
bV9jb3B5X3RvX3VzZXIpCj4+ICAKPj4gIAkvKiBFbmFibGUgYWNjZXNzIHRvIHVzZXIgbWVtb3J5
ICovCj4+ICAJbGkgdDYsIFNSX1NVTQo+PiBAQCAtMTgxLDEzICsxODAsMTMgQEAgRU5UUlkoX19h
c21fY29weV9mcm9tX3VzZXIpCj4+ICAJY3NyYyBDU1JfU1RBVFVTLCB0Ngo+PiAgCXN1YiBhMCwg
dDUsIGEwCj4+ICAJcmV0Cj4+IC1FTkRQUk9DKF9fYXNtX2NvcHlfdG9fdXNlcikKPj4gLUVORFBS
T0MoX19hc21fY29weV9mcm9tX3VzZXIpCj4+ICtTWU1fRlVOQ19FTkQoX19hc21fY29weV90b191
c2VyKQo+PiAgRVhQT1JUX1NZTUJPTChfX2FzbV9jb3B5X3RvX3VzZXIpCj4+ICtTWU1fRlVOQ19B
TElBUyhfX2FzbV9jb3B5X2Zyb21fdXNlciwgX19hc21fY29weV90b191c2VyKQo+IAo+IElJVUMs
IHdlJ2xsIG9ubHkgaGF2ZSBkZWJ1ZyBpbmZvcm1hdGlvbiBmb3IgX19hc21fY29weV90b191c2Vy
LiBJJ20gbm90Cj4gc3VyZSB3aGF0IHRoYXQgbWVhbnMgZm9yIGRlYnVnZ2luZy4gSXMgaXQgcG9z
c2libGUgdG8gZ2VuZXJhdGUgc29tZXRoaW5nCj4gY29uZnVzaW5nPwoKSSdsbCBjaGVjayB0aGF0
IHdpdGggR0RCIHRvIGJlIHN1cmUgd2UgZG9uJ3QgaGF2ZSBhbnl0aGluZyBmYW5jeSBoZXJlLgoK
PiAKPj4gIEVYUE9SVF9TWU1CT0woX19hc21fY29weV9mcm9tX3VzZXIpCj4+ICAKPj4gIAo+PiAt
RU5UUlkoX19jbGVhcl91c2VyKQo+PiArU1lNX0ZVTkNfU1RBUlQoX19jbGVhcl91c2VyKQo+PiAg
Cj4+ICAJLyogRW5hYmxlIGFjY2VzcyB0byB1c2VyIG1lbW9yeSAqLwo+PiAgCWxpIHQ2LCBTUl9T
VU0KPj4gQEAgLTIzMyw1ICsyMzIsNSBAQCBFTlRSWShfX2NsZWFyX3VzZXIpCj4+ICAJY3NyYyBD
U1JfU1RBVFVTLCB0Ngo+PiAgCXN1YiBhMCwgYTMsIGEwCj4+ICAJcmV0Cj4+IC1FTkRQUk9DKF9f
Y2xlYXJfdXNlcikKPj4gK1NZTV9GVU5DX0VORChfX2NsZWFyX3VzZXIpCj4+ICBFWFBPUlRfU1lN
Qk9MKF9fY2xlYXJfdXNlcikKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L2Vu
dHJ5LlMgYi9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRyeS5TCj4+IGluZGV4IDAxOTRmNDU1NDEz
MC4uN2JlZmEyNzZmYjAxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRy
eS5TCj4+ICsrKyBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L2VudHJ5LlMKPj4gQEAgLTcsMTUgKzcs
MTEgQEAKPj4gICAqIEF1dGhvcjogTGkgWmhlbmd5dSAobGl6aGVuZ3l1M0BodWF3ZWkuY29tKQo+
PiAgICoKPj4gICAqLwo+PiAtCj4+IC0ubWFjcm8Jc2l6ZSwgc3ltOnJlcQo+PiAtCS5zaXplIFxz
eW0sIC4gLSBcc3ltCj4+IC0uZW5kbQo+PiArI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2UuaD4KPj4g
IAo+PiAgLnRleHQKPj4gIAo+PiAtLmdsb2JsIHB1cmdhdG9yeV9zdGFydAo+PiAtcHVyZ2F0b3J5
X3N0YXJ0Ogo+PiArU1lNX0NPREVfU1RBUlQocHVyZ2F0b3J5X3N0YXJ0KQo+PiAgCj4+ICAJbGxh
CXNwLCAuTHN0YWNrCj4+ICAJbXYJczAsIGEwCS8qIFRoZSBoYXJ0aWQgb2YgdGhlIGN1cnJlbnQg
aGFydCAqLwo+PiBAQCAtMjgsOCArMjQsNyBAQCBwdXJnYXRvcnlfc3RhcnQ6Cj4+ICAJbXYJYTEs
IHMxCj4+ICAJbGQJYTIsIHJpc2N2X2tlcm5lbF9lbnRyeQo+PiAgCWpyCWEyCj4+IC0KPj4gLXNp
emUgcHVyZ2F0b3J5X3N0YXJ0Cj4+ICtTWU1fQ09ERV9FTkQocHVyZ2F0b3J5X3N0YXJ0KQo+PiAg
Cj4+ICAuYWxpZ24gNAo+PiAgCS5yZXB0CTI1Ngo+PiBAQCAtMzksOSArMzQsOCBAQCBzaXplIHB1
cmdhdG9yeV9zdGFydAo+PiAgCj4+ICAuZGF0YQo+PiAgCj4+IC0uZ2xvYmwgcmlzY3Zfa2VybmVs
X2VudHJ5Cj4+IC1yaXNjdl9rZXJuZWxfZW50cnk6Cj4+ICtTWU1fREFUQV9TVEFSVChyaXNjdl9r
ZXJuZWxfZW50cnkpCj4+ICAJLnF1YWQJMAo+PiAtc2l6ZSByaXNjdl9rZXJuZWxfZW50cnkKPj4g
K1NZTV9EQVRBX0VORChyaXNjdl9rZXJuZWxfZW50cnkpCj4gCj4gSSB0aGluayB3ZSBjb3VsZCBh
bHNvIHVzZSB0aGUgc2hvcnRoYW5kIHZlcnNpb24gZm9yIHRoaXMgb25lLWxpbmVyLgo+IAo+IFNZ
TV9EQVRBKHJpc2N2X2tlcm5lbF9lbnRyeSwgcXVhZCAwKQoKT2ggeWVzLCBuaWNlIGNhdGNoLgoK
VGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
