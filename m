Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A37C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt7R7XSQLg9sSIE/McBW+0GnQjMvaY5pC+IPTYg0y3Q=; b=hGv0Fzb5y84Dr/
	MUqyNzywL8tnmYAjbn2C6y/tDsPsV/xpYRN+Dlf0wMeCiK7FWbX4u93KzuAemwfobRphSV03bGpWk
	U8uc1acJEw2BCQuLecRYlYwOaPCTPOuMacTahL5R0pesjQoLOGKfzYy47Dr/Fg8S9Nz9mWNAUIxL3
	cOb+tAE/jIhiRFsb8LwR4wDSWn4uTtRmwlLum+t2ynSZz8svF3zVidYexeF6sLeTeKhsRQUWo77yK
	MYZt0gkphWJAn3l3dEdw8fwDYDzVwFiJeLliQoQzK41NnOCZgbJ/vLk+XlQY0zx85Grm1fHpqLUZX
	JEKHdKRjeVn7eN0q60wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aZa-00000004swA-0U8Q;
	Thu, 16 May 2024 12:51:02 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aZW-00000004suk-1yIz
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 12:51:00 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-61bed5ce32fso86132037b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715863856; x=1716468656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Od+pJB6mZAnjsfvS954bc7TMJjR9/PUts1oYAKpTsg=;
        b=TvTZkFxDLctObyrlY+x+OKnQQ/Zu88saFn4obyKrwsd1F7X4JU18qPob+6IDJERP1/
         79tcr/crS5Wg2VzsIOYAhzljqhld9BkzbMlcEeismm8eiVZ4/lphlK1e+04e+lOgjoiu
         Qa8Bd1wRwLJvan/TVLCed/WRVEWL6Q0YqX1ilj+ZfZU9w8KqBWV6fS+VLRBpZ4qvbwh+
         gOqkMOpSSA2B4UN0fhWyMp7Bf+Id8u7HOeveGvqRr355iaTINb+asil7vKPneq7QJb14
         pkFq6xMOahXI+fKNMcGRRM0N0Gery0F7A/4GS/9XB5zqw7TigZpZ78ucjJQedgHUJGSh
         ecMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863856; x=1716468656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Od+pJB6mZAnjsfvS954bc7TMJjR9/PUts1oYAKpTsg=;
        b=dqTbDN8gpwSQsEGyuTPnkevnnwzBUJxHsn/12WViAozH3XljFiaztofa8aPoqp0a8K
         cL/lmN+JVXoqynu9ddFz7ihkons57sYoUJp3Np2QJeZi5yrNyKpwyuguIB9hD7zX2Uhf
         wMm094RSm1fviHrRHWDzpnXoTpWOKNBusb2Mq1EXu76qUPx9MuPz8Lr17KtN/wj8RYao
         BZi9Z1Bey4mp4JEG2QFHsOqUT1X1BM1eRuUh1PhAqbG2eu9NEcjwUqRB0JX+fzkKyp7J
         MCzWWCm3S5nEKIZwPLEtitUjSF85Zo3bsBRhQpiW8xGW/u1NQftzUKqad+017H7O5CFY
         sVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3l+WF8WE4hUolb1olecNW+25a6B6ELVL3a1MqEnfee6KSVCruRZulyjuHPbQZd1RhP3P1mW71riDuiR12zluu11i4Dr2U+7sdfWLtRb1i
X-Gm-Message-State: AOJu0YztjYPRkyf77pkhfK5kMmxIrHQKLIbdYpydb/BJIO4kr05FWakw
	suF1kL2wYGkRxMlkzgg1ZUmNIKUqNQfTjBGbZiZJ9IIuMJ3+/NFMyXfpRGnFD4fO4M+OG8a29n4
	ytIAiTFWAcIDapF8doc3uTkASmhXxbC+tp2AkcA==
X-Google-Smtp-Source: AGHT+IGs7lVMK92YN+1HJCcotmujY/ztr2anQuNr3U+Iebkb2i92DLwZmM+D3pTVHWKs6H4058jiuMgZuuev28xE+eY=
X-Received: by 2002:a0d:cb52:0:b0:615:46dc:44db with SMTP id
 00721157ae682-622b013ca1bmr180898027b3.35.1715863856375; Thu, 16 May 2024
 05:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-2-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-2-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 20:50:45 +0800
Message-ID: <CABgGipXNoiQ-+R3CzFS_hGT+d9L9vhqyB1famkDmm=v8XcYavg@mail.gmail.com>
Subject: Re: [PATCH v6 02/17] dt-bindings: riscv: cpus: add a vlen register
 length property
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_055058_558393_0DBABCBA 
X-CRM114-Status: GOOD (  18.58  )
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

T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjMz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+Cj4gQWRkIGEgcHJvcGVydHkgYW5hbG9nb3VzIHRvIHRoZSB2bGVu
YiBDU1Igc28gdGhhdCBzb2Z0d2FyZSBjYW4gZGV0ZWN0Cj4gdGhlIHZlY3RvciBsZW5ndGggb2Yg
ZWFjaCBDUFUgcHJpb3IgdG8gaXQgYmVpbmcgYnJvdWdodCBvbmxpbmUuCj4gQ3VycmVudGx5IHNv
ZnR3YXJlIGhhcyB0byBhc3N1bWUgdGhhdCB0aGUgdmVjdG9yIGxlbmd0aCByZWFkIGZyb20gdGhl
Cj4gYm9vdCBDUFUgYXBwbGllcyB0byBhbGwgcG9zc2libGUgQ1BVcy4gT24gVC1IZWFkIENQVXMg
aW1wbGVtZW50aW5nCj4gcHJlLXJhdGlmaWNhdGlvbiB2ZWN0b3IsIHJlYWRpbmcgdGhlIHRoLnZs
ZW5iIENTUiBtYXkgcHJvZHVjZSBhbiBpbGxlZ2FsCj4gaW5zdHJ1Y3Rpb24gdHJhcCwgc28gdGhp
cyBwcm9wZXJ0eSBpcyByZXF1aXJlZCBvbiBzdWNoIHN5c3RlbXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTog
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCj4gLS0tCj4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCA2ICsrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBpbmRleCBkODdkZDUwZjFhNGIuLmVkY2I2
YTdkOTMxOSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvY3B1cy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2NwdXMueWFtbAo+IEBAIC05NCw2ICs5NCwxMiBAQCBwcm9wZXJ0aWVzOgo+ICAgICAg
ZGVzY3JpcHRpb246Cj4gICAgICAgIFRoZSBibG9ja3NpemUgaW4gYnl0ZXMgZm9yIHRoZSBaaWNi
b3ogY2FjaGUgb3BlcmF0aW9ucy4KPgo+ICsgIHJpc2N2LHZsZW5iOgo+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAgICBkZXNjcmlwdGlvbjoK
PiArICAgICAgVkxFTi84LCB0aGUgdmVjdG9yIHJlZ2lzdGVyIGxlbmd0aCBpbiBieXRlcy4gVGhp
cyBwcm9wZXJ0eSBpcyByZXF1aXJlZCBpbgo+ICsgICAgICBzeXN0ZW1zIHdoZXJlIHRoZSB2ZWN0
b3IgcmVnaXN0ZXIgbGVuZ3RoIGlzIG5vdCBpZGVudGljYWwgb24gYWxsIGhhcnRzLgo+ICsKPiAg
ICAjIFJJU0MtViBoYXMgbXVsdGlwbGUgcHJvcGVydGllcyBmb3IgY2FjaGUgb3AgYmxvY2sgc2l6
ZXMgYXMgdGhlIHNpemVzCj4gICAgIyBkaWZmZXIgYmV0d2VlbiBpbmRpdmlkdWFsIENCTyBleHRl
bnNpb25zCj4gICAgY2FjaGUtb3AtYmxvY2stc2l6ZTogZmFsc2UKPgo+IC0tCj4gMi40NC4wCj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
