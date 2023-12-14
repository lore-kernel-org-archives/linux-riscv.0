Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D1CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkMqZwc+TDAnuv/e9qsAqLRoZz55YVAOc4OmhXSsn+c=; b=Jy8rHyzpSL307K
	JZpzJgpT8iy6tLJGrry1NbqXzqJdHlrxcmTD36S/FEEIBbRODmnSBdxKooATerUlM//g8M8xsvxJL
	3E8rDElsxGuA4ShivZFWFSwl1xHlQ6aFR/lLBAkze49dn8WZSOVqWoJl8V0+iWOWv7N9A8TeX1wKd
	tRyj1UrUXwsh5Uw01vy7C4ACvWMQdiJqI9QJcW0IUBqG6B5XvAGRoltcXGKH7b9SOvHxud5Wzm/i8
	hNgGVdBTTSE9xVUEpYL4zppfAvHYpZFZeOjNg+MB68DkKV7Ysf3Irc3k0dZHq5ghEC3k+q50w1N3D
	CllTTe1iXc2myuosjEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkdl-000Fit-0l;
	Thu, 14 Dec 2023 12:16:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkdi-000Fi4-1T
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 12:16:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d098b87eeeso72346895ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 04:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702556189; x=1703160989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tiT7wfNqaw2vJLSE5DYIhR3c6v+dX+na4nc8HEVIgQ=;
        b=CLPocDMtOnY0c+oHm1jv0uQa8KlGZNZuTYAQEEboSkE06b/tg7CEk5j9hAyDbbM6MF
         pDHQAqmYhTY37rZbaUhyHMH2oLMEU1bktK1y1MVCQfMxpXLtH89qsQKZFH/ojgBj22eR
         MOkySMSsQdPaLnnDdaZTMk0UREcbTIdwMpocGZqIiRqxcl8Amw8jykP37rBD/NGmCC8f
         kjQ7OHTzrA8TCtMvTVGxxHbgEf8NlZVRAAx5eJiNDktH0J17I5XvaJfSJWZkepK6hIFL
         lpyhr6enSqX53itym5A9YHxXiK7IfwfkjYyCb4rAOsE30XdyK2XgUXrzOZzWX9yv7uKY
         cqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556189; x=1703160989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tiT7wfNqaw2vJLSE5DYIhR3c6v+dX+na4nc8HEVIgQ=;
        b=ZMIj+c/sWpB9Lg9UA/jVVNOgCRBcdY1SdNQyFfyi5AcxI+GVo4yy//MGblTgvN1fAP
         jlKZUIIZDW/I02mcLT8/nnLRIZCDVxqil7priDDZdBhNB4NLKLvwMdoPmcyKcmnNqP3B
         P0MWaC+XrQL+4/NRBX2HOsi8t0nkezo57r59TMVh1LIrmUFunD33rAqVBXca6fPlLHOt
         lJ4zKwghRVnpmCgk2jmjiYYsPxSgHtT9IZkn7N63tTYysTjBCERzPQyuBeWh+xcbAeGY
         9OACNmUrvODdaeJQOOl97hwrZi1k0EhN4BVbjMHhi+XwmMamofqiGPr2Worj9V4rsNvT
         lZqA==
X-Gm-Message-State: AOJu0YxB3IOuFdSyr/8STtQboef2W0Hcd3xXg6X7Bi7nP2sB3VXIdUJs
	d0FoIyVwpJoWRnrEpCxAQfIG+rrOm8wQPktxaNFnvQ==
X-Google-Smtp-Source: AGHT+IEthyLwcbpFlS0nGuCTagq11nyWQP0JyD3gThdiIWZOLD3HKt6owX5IozE98AMNclf4HsOdhasFFYWjQPb1jH0=
X-Received: by 2002:a17:903:2351:b0:1d3:60f7:4620 with SMTP id
 c17-20020a170903235100b001d360f74620mr1427318plh.128.1702556188931; Thu, 14
 Dec 2023 04:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-4-atishp@rivosinc.com>
In-Reply-To: <20231205024310.1593100-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 17:46:17 +0530
Message-ID: <CAAhSdy0_DdCeFdzzJgoWhnrMz1-UqQXKLWNBAAXB6SQ_eJ2gyg@mail.gmail.com>
Subject: Re: [RFC 3/9] RISC-V: Add FIRMWARE_READ_HI definition
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_041630_494490_76FA1D6F 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA4OjEz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gU0JJIHYyLjAgYWRkZWQgYW5vdGhlciBmdW5jdGlvbiB0byBT
QkkgUE1VIGV4dGVuc2lvbiB0byByZWFkCj4gdGhlIHVwcGVyIGJpdHMgb2YgYSBjb3VudGVyIHdp
dGggd2lkdGggbGFyZ2VyIHRoYW4gWExFTi4KPgo+IEFkZCB0aGUgZGVmaW5pdGlvbiBmb3IgdGhh
dCBmdW5jdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaAo+IGluZGV4IDA4OTJmNDQyMWJjNC4uZjNlZWNhNzlhMDJkIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCj4gQEAgLTEyMSw2ICsxMjEsNyBAQCBlbnVtIHNiaV9leHRfcG11X2ZpZCB7Cj4gICAg
ICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX1NUQVJULAo+ICAgICAgICAgU0JJX0VYVF9QTVVfQ09V
TlRFUl9TVE9QLAo+ICAgICAgICAgU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFELAo+ICsgICAg
ICAgU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFEX0hJLAo+ICB9Owo+Cj4gIHVuaW9uIHNiaV9w
bXVfY3RyX2luZm8gewo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
