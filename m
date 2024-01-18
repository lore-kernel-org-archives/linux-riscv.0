Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E43CC4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0NubJueVS9ZU9Mve7+mE7KZhAja2QDl0FNGDM7zoJc=; b=PPO3wwDnerFox+
	9QNmT6wQ073m5bJKSZJUviBfH1orclbCVvQJKPg5oylDhJKmw8EugPRZGYPI+sRrBb8eMOsvQkaak
	mCBg0yOoZz4dPkHkf76vnrFL3Ma5UFaUkjwKhCKGzVqXtgtvqa2F1bVINFSs52G6yrLRaQpTOgwJg
	trlUgStZjtwIvuDJYKISqHYDu4Pt+RWP8H1agXQimyzwnZ3Y2uz905leOYNbBT6swobAJBRBlP6eq
	l6DlsgXk+K6Ded4T/YS3yoZRX7yyJ2WARw8y6dXJgkHGmX1cZIS5KpMeV0EKKSiHVhpKCVvhJrC7C
	uAmvTJeHObL+kyz9AEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQRzY-002n0r-2i;
	Thu, 18 Jan 2024 12:59:32 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQRzV-002mze-0n
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 12:59:30 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-36082f3cb06so64475295ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705582767; x=1706187567; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWADTwPjX+2jaYXFvN/zsXEQ2ZmoOpg5k/PCeUcdjSk=;
        b=eiq1tg8m4J7zu+VOzaBsBXtV5V/x+kL5/2BcHHoOHthGWtfJEu1RSVB6QC48ONwvii
         Zs2e0wNfEMCigQ0z68Hl74oCNURmElxsdFNeOg7d5/YIAy4uQjb/NMCV2uBA3ydJLPgN
         OZ3Lhz8vouE5lSM+NWbpEsliAGz6M68YXcBx+7QRyNgaN98atBENH3hq8nOli+o2/M+A
         pv1kOokYBrTe4R8OoXjnwUHJE0cMcHWdn5ZzU4W+eg6dJc3dCEbtflRYDBGnbdHCVuC/
         et0vx6W3MzssIo/jExQvRxi8yKuSu7v9Rj/x7YIlvAZOfaa1g0KHuWOOWw+LGGM4FyfU
         +sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705582767; x=1706187567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWADTwPjX+2jaYXFvN/zsXEQ2ZmoOpg5k/PCeUcdjSk=;
        b=n5XB6nX5EDvFrWQvoFX8rffRUOJCngcsCG3+PtSomQ31FvCbIFU7mvvyLSir2RlNMg
         1LmENphdorgOTc+SI748ny1bsknB3mdnu/6Xl7ULMAI3BcSj/nMR+UuaaHHCUMgBpM/F
         tYisi4sHz1WJsQX0BWbeOyKTV99riQ6B2l3q7XkmzEean/mlJJJkbXILQZw5XqhSwyfv
         8jMErDgxhr5DyYHsNKykKLvtmCDH0md3RgHIILC6n+8L+S9d7SWSmTXBzzwQmGdK1vKM
         0l6wptaVTXI98Z0P0ZJfOJb9SfyufXcEHP8UAhOx7bQuCGwU72ptOW5+LSWmlTX5OwDQ
         gN3w==
X-Gm-Message-State: AOJu0YydrUCJBKTQjxl2loLQ9Sl0CE++7AyTC2T/3ezTtepU1UTW2z7v
	IdNlUEw0R4GxFniowRZO8tJwubIrbUpWbsTT2mqGutRiuYTIfUBoVY/ArAmqclI8HVWunikvad/
	+nLABJLlPjGu2iGbQ2hPtqC4jaRLPl/6VQa/L6qrPc/DKNijR
X-Google-Smtp-Source: AGHT+IEULXICvafspeHkLMkr6soWFzV0SUySB8GzLHkUsKVp+V05biZlODsydI6eC8onv1WinflroTNSid+Lah/ulTM=
X-Received: by 2002:a05:6e02:5ac:b0:361:98a3:a7ac with SMTP id
 k12-20020a056e0205ac00b0036198a3a7acmr879075ils.58.1705582767073; Thu, 18 Jan
 2024 04:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com>
In-Reply-To: <20240104123727.76987-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Jan 2024 18:29:16 +0530
Message-ID: <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, alex@ghiti.fr, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_045929_281272_3F4DD09C 
X-CRM114-Status: GOOD (  14.71  )
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

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCA2OjA34oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBLVk0gcmVxdWlyZXMgRVZFTlRGRCwgd2hpY2ggaXMg
c2VsZWN0ZWQgYnkgSEFWRV9LVk0uIE90aGVyIEtWTQo+IHN1cHBvcnRpbmcgYXJjaGl0ZWN0dXJl
cyBzZWxlY3QgSEFWRV9LVk0gYW5kIHRoZW4gdGhlaXIgS1ZNCj4gS2NvbmZpZ3MgZW5zdXJlIGl0
cyB0aGVyZSB3aXRoIGEgZGVwZW5kcyBvbiBIQVZFX0tWTS4gTWFrZSBSSVNDVgo+IGNvbnNpc3Rl
bnQgd2l0aCB0aGF0IGFwcHJvYWNoIHdoaWNoIGZpeGVzIGNvbmZpZ3Mgd2hpY2ggaGF2ZSBLVk0K
PiBidXQgbm90IEVWRU5URkQsIGFzIHdhcyBkaXNjb3ZlcmVkIHdpdGggYSByYW5kY29uZmlnIHRl
c3QuCj4KPiBGaXhlczogOTljZGM2YzE4YzJkICgiUklTQy1WOiBBZGQgaW5pdGlhbCBza2VsZXRh
bCBLVk0gc3VwcG9ydCIpCj4gUmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzQ0OTA3YzZi
LWM1YmQtNGU0YS1hOTIxLWU0ZDM4MjU1MzlkOEBpbmZyYWRlYWQub3JnLwo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBw
YXRjaCBmb3IgTGludXgtNi44CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+Cj4gdjI6Cj4gIC0gQWRk
ZWQgRml4ZXMgdGFnIGFuZCAtZml4ZXMgcHJlZml4IFtBbGV4YW5kcmUvQW51cF0KPgo+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgIHwgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL0tjb25maWcgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5k
ZXggYTkzNWE1ZjczNmI5Li5kYWJhMDZhM2I3NmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTEyOCw2ICsxMjgsNyBAQCBj
b25maWcgUklTQ1YKPiAgICAgICAgIHNlbGVjdCBIQVZFX0tQUk9CRVMgaWYgIVhJUF9LRVJORUwK
PiAgICAgICAgIHNlbGVjdCBIQVZFX0tQUk9CRVNfT05fRlRSQUNFIGlmICFYSVBfS0VSTkVMCj4g
ICAgICAgICBzZWxlY3QgSEFWRV9LUkVUUFJPQkVTIGlmICFYSVBfS0VSTkVMCj4gKyAgICAgICBz
ZWxlY3QgSEFWRV9LVk0KPiAgICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRM
aW51eC9saW51eC9pc3N1ZXMvMTg4MQo+ICAgICAgICAgc2VsZWN0IEhBVkVfTERfREVBRF9DT0RF
X0RBVEFfRUxJTUlOQVRJT04gaWYgIUxEX0lTX0xMRAo+ICAgICAgICAgc2VsZWN0IEhBVkVfTU9W
RV9QTUQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vS2NvbmZpZyBiL2FyY2gvcmlzY3Yv
a3ZtL0tjb25maWcKPiBpbmRleCAxZmQ3NmFlZTNiNzEuLjM2ZmE4ZWM5ZTViYSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vS2NvbmZp
Zwo+IEBAIC0xOSw3ICsxOSw3IEBAIGlmIFZJUlRVQUxJWkFUSU9OCj4KPiAgY29uZmlnIEtWTQo+
ICAgICAgICAgdHJpc3RhdGUgIktlcm5lbC1iYXNlZCBWaXJ0dWFsIE1hY2hpbmUgKEtWTSkgc3Vw
cG9ydCAoRVhQRVJJTUVOVEFMKSIKPiAtICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJICYmIE1N
VQo+ICsgICAgICAgZGVwZW5kcyBvbiBIQVZFX0tWTSAmJiBSSVNDVl9TQkkgJiYgTU1VCj4gICAg
ICAgICBzZWxlY3QgSEFWRV9LVk1fSVJRQ0hJUAo+ICAgICAgICAgc2VsZWN0IEhBVkVfS1ZNX0lS
UV9ST1VUSU5HCj4gICAgICAgICBzZWxlY3QgSEFWRV9LVk1fTVNJCj4gLS0KPiAyLjQzLjAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
