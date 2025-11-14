Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C46CE8D76
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Umgt0JVOOsGHpLMuDyovjUJtVYNgrs7eHPwtRzc8GxE=; b=0JjajDZpAFpMmb
	kZ7FJVcUEIDX/sL8gyc3p57JaUelYVXPxW8O8zq9bcNUus/X+wjurZbp4i4DQrqEi/Ae29ansvT+F
	yf8H/NwzMm1mrbH2g2F5yLdHKeoPI7kXQ/Nin9+2YWxjUCnRzZ1AeU7lB1QzY2BqzyrMhlgCbQmCY
	L5OGtqzi3kUIxw7z0DsvKkZNkJEL/KpSUBIFXU12b0JIf9OVO97/2+U7jCnu3N7NFK+sdKI7llliV
	HyQ5hoiegM8SdDQEneiaTADLQZIkIegbxyNRWAMTm3z4LofnuDI17J3xHT4YY6cQ/L9c0k5Ajluek
	AjHY/yn5OfrjkEip9XdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzFT-0000000D0hU-3ztz;
	Fri, 14 Nov 2025 19:14:19 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzFQ-0000000D0gV-36Gj
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 19:14:19 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so4111713a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763147651; x=1763752451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqFSHDCPRksQdHdUyv1FMM63cJMW5yRb5MbRUz9Ot64=;
        b=QgVtxLslBGZ6zRce4hhI2tMMzNUQFfWBhd9lXn+9U9OZflk0Bi3RNI6h9TmLBESVz3
         Xlj2kpmn5raowZ8YLKHF82R2xwBuFC9YFpjWxLLL2it08RrZmTUpCUJLsY6WWvXTx0TG
         wTi8yucbdV+g4WKSOvkPf9fRZMTl6K89hU2Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147651; x=1763752451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqFSHDCPRksQdHdUyv1FMM63cJMW5yRb5MbRUz9Ot64=;
        b=c1XSbE8cCaMhAc5+DtLhV3IDYF1Rhzfps1NurAk+PfCT8ygVvRA9zelxmnRvf5tA/+
         I+MLvy5Dxloge8N5TrV30fQGBiZzBdoPlpXzhhiE1GnL6Q9BEZn82qlklkumaJUtyi0+
         uLq1FW9qT406kdzLNdFjurU0HRoCa9BweiS5yV6S1SaiBrz4KuPTZ986it0+iHDj3mDl
         sDvHOHW3MA/7MbncQA8pydkghYRuTh94+iMy9nOK6hZLCRajRDiBCgUR6w4DPS+R+ocy
         KYd1GvJDi8l3Km91RjQyDaw20BJBRITTw1CWiWfcyxlXl209SWgMs1XjDuSl57R/1C+I
         XnqA==
X-Forwarded-Encrypted: i=1; AJvYcCXbGhX0VCWkq3f4oruGuTwl8D/t/iKgChyvvbygBbo6KcX+eygw3CfLYc6FFO+thi7QDHCOWZXBc6UQDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTgDMEebf0GPDEjiYfCVZaVWJ9XdlbHkZofcS46Cxmf3ov6trp
	trqhsfKOMWUl9lK8/s7JIoMQHkdSpnnY1rjjbQ27YdjYxhPXjP0K+lExEIUh0TIvJa+YIJarMob
	+haSbFaJM
X-Gm-Gg: ASbGnctM8vzof/WrXYJGiO1oCOnECNQdoDAwqQc4RZu96FYdCneUqA31JEMpvKoy5Yv
	Y69TxkmNlLa90JV/6YVUjjRVcuRPjyDVJg0N+ylanwjifAeEaaCauGu1iifqoWnMYuItFRoMvT1
	NRvLp5uJLMfdWqHMLkfI9oCUR73DSX9JmyhFfPLoRliq0hDKCDPuOAtpH7ZPFXAiqk7Z4hPyoEC
	vJE4sNZloniZckMg1GZ/TbqHCQ240FT1iyzQwJEHtR+59wHbIy4lcLh7dmc0vSS2MxwXhRS6Q24
	NxJHXWIQDkmzGW4e3KHV4H0vUkloKSExICrp3viO0hTPWsy/Pal/jckdtpVQLVLMFYt/I3y1ZZZ
	SerAEy/JcWBxYDEqohZN5BqkqZblyoeHnKtd+CK61V7/Ardw371W5LCQ2gUtyPxiqqNKQSgfvmp
	fwPyXBy2Lks303L3h0j0zlgs8U+sB0xLLsR35FJYgQbuADh0tlDPcF1MeeqJ9UElRyg+xmaW0=
X-Google-Smtp-Source: AGHT+IHjW+r+7T29pOUFmzmKMBSZo2BcGLzwqaEUAqAIRFYLLLG/LVhAPNSqAabNMUQF/5WeMQlnFA==
X-Received: by 2002:a05:6402:2808:b0:643:d1b:41d9 with SMTP id 4fb4d7f45d1cf-64350e8a2f6mr4122831a12.17.1763147651155;
        Fri, 14 Nov 2025 11:14:11 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a498102sm4261815a12.24.2025.11.14.11.14.09
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 11:14:10 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b427cda88so1708030f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 11:14:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCbUnvXhseV4v89d9Ylj7naOZPCbrQNuGlWJVZEECGmkwQ/ndmnIsni6NDqYBn/FukhdkJxpTrQEYmJQ==@lists.infradead.org
X-Received: by 2002:a05:6000:178c:b0:429:c14f:5f7d with SMTP id
 ffacd0b85a97d-42b59367935mr4118712f8f.29.1763147649019; Fri, 14 Nov 2025
 11:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
In-Reply-To: <20251114033243.76509-1-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Nov 2025 11:13:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
X-Gm-Features: AWmQ_bljLqXqDOKTQP59kORhab2-SwO6F5Qm44XiGdi2quOMGlF7tExq5Grrg24
Message-ID: <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_111418_046881_E945270C 
X-CRM114-Status: GOOD (  12.85  )
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

SGksCgpPbiBUaHUsIE5vdiAxMywgMjAyNSBhdCA3OjMz4oCvUE0gWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgZGlzY3Vzc2lvbiBbMV0sWzJdLCBo
YXJkbG9ja3VwX3BlcmYgY2Fubm90IGJlIGNvbXBsZXRlbHkgcmVwbGFjZWQgYnkKPiB0aGUgaGFy
ZGxvY2t1cF9idWRkeSBhcHByb2FjaCwgc28gdGhpcyBwYXRjaCBpcyBzdGlsbCBiZWluZyBzdWJt
aXR0ZWQuCj4KPiB2MS0+djI6Cj4gVGhlIGNvbnRlbnRzIG9mIGFyY2gvYXJtNjQvd2F0Y2hkb2df
aGxkLmMgYXJlIGRpcmVjdGx5IGNvbnNvbGlkYXRlZCBpbnRvCj4ga2VybmVsL3dhdGNoZG9nX3Bl
cmYuYy4KPgo+Cj4gdjItPnYzOgo+IEFkZCBDT05GSUdfV0FUQ0hET0dfUEVSRl9BREpVU1RfUEVS
SU9EIHRvIGVuY2xvc2UgdGhlIHBlcmlvZCB1cGRhdGUgbG9naWMsCj4gc2VsZWN0IGl0IGJ5IGRl
ZmF1bHQgb24gYXJtNjQgYW5kIHJpc2N2LCB3aXRob3V0IGFmZmVjdGluZyBvdGhlciBhcmNoZXMK
PiBsaWtlIHg4NiBhbmQgUFBDLgo+Cj4gdjMtPnY0Ogo+IFBsYWNlIHRoZSBsaW5lICJzZWxlY3Qg
V0FUQ0hET0dfUEVSRl9BREpVU1RfUEVSSU9EIGlmIEhBUkRMT0NLVVBfREVURUNUT1JfUEVSRiAm
JiBDUFVfRlJFUSIKPiBpbiB0aGUgS2NvbmZpZyBmaWxlcyBmb3IgYXJtNjQgYW5kIHJpc2N2IGlu
IG9uZSBsaW5lLCB3aXRoIG5vIGxpbmUgYnJlYWtzLgo+Cj4gdjQtPnY1Ogo+IFJlbW92ZSBfX3dl
YWsgZnJvbSBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKQo+Cj4gdjUtPnY2Ogo+IFJlbW92ZWQg
dGhlIGRlcGVuZGVuY3kgb24gQ1BVX0ZSRVEgZm9yIFdBVENIRE9HX1BFUkZfQURKVVNUX1BFUklP
RCBpbiBLY29uZmlnLCB3aGljaCBmaXhlcyB0aGUKPiBpc3N1ZSByZXBvcnRlZCBhdDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MTAyNDA3MDEuZUI2cjk3VjMtbGtw
QGludGVsLmNvbS8KCkkgaGF2ZW4ndCB0cmllZCBjb21waWxpbmcgdGhpcyBteXNlbGYsIGJ1dCBp
dCBzZWVtcyBsaWtlIGFuIE9LCnNvbHV0aW9uIGZvciB0aGUgY29tcGlsZS10aW1lIGVycm9yIHRv
IG1lLgoKLURvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
