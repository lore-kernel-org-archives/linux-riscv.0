Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714B3C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nWLHXeWgUR06mYlS/Ua5K8t7JSiFRqafRkE+xWbwLE=; b=4WCZV/NCO5oUC1
	nRsKffQzGFhTZeZ2k98gpB5WicyUPdDA1WyiSYjonCNPh+/xCVY0FiNhILPfpOeMtkvI+x0sLqG1P
	YAv8iWzh7vm5lfFWaWm1iVjZWdH8qZbX6iMPXNxJ7vqz1ZxpWMnBm7CORxn3FLy77Q2RmhLOV7zoy
	zLLYl3ZRvWQslc55N+29gtHP/UL1Dgq8goolEYFqSlL1JqOPKgoNvf4bJcV3N4uNYfvrlJsVMWA3C
	4vh25uh36UlK4mCT4/GTccvi5nEuvcehvFlPsT8zdcahn53a7xJHhgMbGQdp1nDSP1PEY3xGT73+y
	xnPEWFPO85tb/mG9RMkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcFi-00000001yCj-06Ql;
	Mon, 23 Jun 2025 08:10:06 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcDh-00000001xrj-2Jmf
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:08:02 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so2977686b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750666081; x=1751270881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxpsxBnAztApt9xBJdH0Ct2uH1bvpAVjnJKcApgLnKg=;
        b=dlBPArimuNUZGcmuE7g3NDr/Uyvk+QFHYsIA8aJwnl//FVXhHjtduTD+a1N9vinn+a
         r8HbbExnpcKAKofMnYIFAMbDGUk8pFA2nq6Ye9rln9SQLs4NNw3GfluK+Lrv9Ie1lZ0v
         u5ojEZI9KfzyPhmGKjaMh66BxycwW3qC2iWw0qukp0qaukAe2h4yCzBX/VlRCCiydh8b
         tRauEOdXdOj0cufJkcQE3azDVM6os9W0YE0jZCP/VTtPQKnbdi8Dp5WAuiXLg5rUSzkf
         0d6BQ4W7YTfhBHKfpin3rswGKp+gztu6AbNZA85zog+OllA43wyA3pOVHlduV7+pcTQZ
         b01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666081; x=1751270881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxpsxBnAztApt9xBJdH0Ct2uH1bvpAVjnJKcApgLnKg=;
        b=tvuXNXxGpOTupIesPd27cdHBK0w9wGhJQcPtWhRNrxNsV+3QO2khIEDNLsokWimZVr
         v7Hz4gscYDyWGJYnFAMURtQtIdvMjx8XU2g7cZuhAZ6OheJ/bAabSKdjxsbHejy7fwyI
         hZd6OE2+XB8KMCQ5QYssoq3uFAS5t7/qvdjsdbox13MgRcKL3tKYNzI7l0gG684REDcx
         8no4JqrV8UVAQ/93APwXOeQ3nioMJTI9cm8uaNw7O9Qe6Xvw6EhnMVr2k8EILIbjci80
         863eK8nbjw3ETijQdHVFFrm8m3P6HgQzDPDrOqazBVDDTe9Uh13FngXxqp5VtSRnWNvz
         U6ig==
X-Gm-Message-State: AOJu0YxAp1kYteWeEiXRQ5kPtPKqbi1DU+SfSlwJ1QumRMjKTtgP9QB2
	GrHf3tZS0hPX5uZf/A3+HOaYvqy5aZNviCbh/RON05ORO/f8aDfu4CtIkEbwQzO6UfE=
X-Gm-Gg: ASbGncv3bP7tBfqItummPLkrHojNyjPJl8upJEJpfXks5pL/pWTG3UQQ5DnGBr71jFy
	MsuxeU7Viei3Kg4Np0anjfHUi7zAq87BJmJyA9VTf42MYDlyAoGJsqKQ4A0tctWPd8phD1hGY6i
	rTK53mbPIYMZIy1L8UMSyU0mvg9NexGDsu0acy9MiA+yg21xhuiq/i2OtYj6AnKovZ/jCEIDEK1
	oG9MbssRmjgSa12ZhKOg+wQArr0EOzqQzHZaIA+UYs5fjVf9B5B2o6INQ/Zn6Cn9zx/d7zu/O5N
	72vjZnprJiqPxChz7OdneqKWRR/UU+PA0RUA8ra9kewAu5qyQO54rYhr8nVvr4pfk9s1ZN6lgSx
	4/BGiYeuwosZs51PdhmVBe+F6pFCjnrARgYyJdeaAAw==
X-Google-Smtp-Source: AGHT+IHuhK51wxxmabIbzoHHlgBq8UYX82HbhRz2QXhvMRsa67AChvnWz1JFNbTr22S/kvZSFTb/jQ==
X-Received: by 2002:a05:6a00:cd4:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-7490f287c44mr14337992b3a.0.1750666080714;
        Mon, 23 Jun 2025 01:08:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64b2aasm7719241b3a.116.2025.06.23.01.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:08:00 -0700 (PDT)
Message-ID: <c12729a1-5046-4821-b5fe-5fea72af76c8@rivosinc.com>
Date: Mon, 23 Jun 2025 10:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Move duplicated instructions macros into
 asm/insn.h
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_010801_618143_AE624E11 
X-CRM114-Status: GOOD (  11.99  )
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

CgpPbiAyMC8wNi8yMDI1IDIyOjIxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gVGhlIGluc3Ry
dWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBvZiB0aGVtIGhh
ZCBkaWZmZXJlbnQKPiBpbXBsZW1lbnRhdGlvbnMsIHdoaWNoIGlzIGVycm9yIHByb25lLgo+IAo+
IFNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgo+IAo+IHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQyMjA4MjU0NS40NTA0
NTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwo+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5j
b20vCj4gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNTA4MTI1
MjAyLjEwODYxMy0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCj4gdjQ6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNTE2MTQwODA1LjI4Mjc3MC0xLWFsZXhnaGl0aUBy
aXZvc2luYy5jb20vCj4gCj4gQ2hhbmdlcyBpbiB2NToKPiAtIFJlYmFzZSBvbiB0b3Agb2YgNi4x
Ni1yYzEKPiAKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gUmViYXNlIG9uIHRvcCBvZiBmb3ItbmV4dCAo
b24gdG9wIG9mIDYuMTUtcmM2KQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBGaXggcGF0Y2ggMiB3
aGljaCBjYXVzZWQgYnVpbGQgZmFpbHVyZXMgKGxpbnV4IHJpc2N2IGJvdCksIGJ1dCB0aGUKPiAg
IHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNhbWUgYXMgdjIKPiAKPiBDaGFuZ2VzIGluIHYyOgo+
IC0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQo+IC0gQWRkIFJCIHRhZ3MKPiAtIERlZmluZSBS
Vl9YKCkgdXNpbmcgUlZfWF9tYXNrKCkgKENsw6ltZW50KQo+IC0gUmVtb3ZlIHVudXNlZCBkZWZp
bmVzIChDbMOpbWVudCkKPiAtIEZpeCB0YWJ1bGF0aW9ucyAoRHJldykKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gQWxl
eGFuZHJlIEdoaXRpICgzKToKPiAgICAgICByaXNjdjogRml4IHR5cG8gRVhSQUNUIC0+IEVYVFJB
Q1QKPiAgICAgICByaXNjdjogU3RyZW5ndGhlbiBkdXBsaWNhdGUgYW5kIGluY29uc2lzdGVudCBk
ZWZpbml0aW9uIG9mIFJWX1goKQo+ICAgICAgIHJpc2N2OiBNb3ZlIGFsbCBkdXBsaWNhdGUgaW5z
biBwYXJzaW5nIG1hY3JvcyBpbnRvIGFzbS9pbnNuLmgKPiAKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pbnNuLmggICAgICAgICAgfCAyMDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgICAyICstCj4g
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgIHwgMTQ0ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgICAgICAgIHwg
ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jICAgICAgICAgICAgIHwgMTI4ICst
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTg4IGluc2VydGlvbnMoKyks
IDI5NCBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogNzMxZTk5OGM0Mjk5NzRjYjE0
MWEwNDljMTM0N2E5Y2FiNDQ0ZTQ0Ywo+IGNoYW5nZS1pZDogMjAyNTA2MjAtZGV2LWFsZXgtaW5z
bl9kdXBsaWNhdGVfdjVfbWFudWFsLTJjMjMxOTFjMzBmYgo+IAo+IEJlc3QgcmVnYXJkcywKCkhp
IEFsZXgsCgpJIGFscmVhZHkgZ2F2ZSBteSBSZXZpZXdlZC1ieSBmb3IgdGhlIGxhc3QgdHdvIGNv
bW1pdHMgb2YgdGhpcyBzZXJpZXMgaW4gVjQuCgpUaGFua3MsCgpDbMOpbWVudAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
