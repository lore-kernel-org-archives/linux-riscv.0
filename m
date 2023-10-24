Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BF9C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8J/mFlJi9p0F3zpDmYgjnU9fE/WgRqwN57rkMiNz1E=; b=bTtSIAkkwpllhz
	RJPam17iRkkQ0fKjHLIwc4syYYYAzDVZrcn8Ajp9kVIPExhwYxwZYIgO9HsvxlubFdIiVFWctVs2J
	MOlXBl0dEKBcaaIpEsrw8qIeu8cJPLf6n2hrlmxzBmmxhKvTY8WUoYk6EAn0VgDiCxX5WBfa2Jb4H
	l6f7fxRlC4yTxwQjaGuilCGQ/5sebBHrkAQHz7VLHEH77QzoOTDTgErrjD6QPtBgvAvPrXqJknVRZ
	IfRyZS2troFT124zPwLAk3cfJOeDbIogJhsaNZvIQQa/kRr+lm0OgUvYuxZUnYazlnH/zJ0kTrRuQ
	Ptkk50iXAkX44O48Lagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLl1-00AdGG-1B;
	Tue, 24 Oct 2023 18:03:59 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLky-00AdFD-0P
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 18:03:58 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bbbe81185dso11679571fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 11:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698170633; x=1698775433; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eEONOSfW6QqBefI1upMEyQojVOQZ6IVElQgRfFuaf7Y=;
        b=0B7l9HKLrpv/Cke5qdBZ3FMWEMe8u9+zKewNXUO+WOFFC8Zswss1fYfKtOUOI8E07t
         mkdqiIQ4hX+us1TjalOTI+aHp2TDlFBEwv4hs6FaX1h1ClB/7NKgbzJx7Oknvt4VqAF4
         f9rzK49Ggd+Dhi93Bb3lu6Y3N2srae1YjyQUKCSFr80pPNNqtgH8B3cK5NeR3QPAm1me
         TteGqiCTBLGAr+VQZtUqk2FgZu4S12bSrT0wo2JzVsQiUL0AMN4KeGLMkV7sHTK3peIQ
         wH20MC+7UYqWrz9QZaxMIP1fSjUM8bwa0w9Vga6J1WuDyva7Qais4P8tT/SQ59hJKDxb
         F3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698170633; x=1698775433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEONOSfW6QqBefI1upMEyQojVOQZ6IVElQgRfFuaf7Y=;
        b=UNShX8VKZqFnFLpQC8Qnrx8HiY/Ov3CwZcwalMOqJqUqzqUDolA6rCRVXgI5p0ibbs
         BMC0cx2HLqMEFol0ISACcbl0DgBWuVmNQ70RAfC60l9SCdh/5q9jQA2SYpPWoyDGEa9u
         Q1UOnLkDkdqcccGRZPTR/4jk70Ztfdy3AtWbjwXArNM9JEc96NO8DZKz1cfRgQTf2TLW
         rx0ZX68yGSnK4wDiDBgStAmSkgaWEVNRbajSQa1K3uQvJv2qHDDqk1QYGnnWPkj9C+3H
         1HBMlJopF/LBoJuMsVfDaOXxY24IO8QAuptHWfSXxfMGSfpRmR6kfaj+9m64XptHhT+f
         USZg==
X-Gm-Message-State: AOJu0Yz3YbLV72qPl0+z29TzgTIK7dTj2/srOCP5Pd98FS1/MMd4eGZg
	hAdFY9L3Vh4GnYaWNJJAz+H6RQ==
X-Google-Smtp-Source: AGHT+IHG9OjT799vBD3twtVwoDjSUtel3HWPnH4sumZmGMlI+6kjh9AOjNTruwRaRqCbCawkAtVdGA==
X-Received: by 2002:a2e:a179:0:b0:2bc:d505:2bf3 with SMTP id u25-20020a2ea179000000b002bcd5052bf3mr8734627ljl.1.1698170633475;
        Tue, 24 Oct 2023 11:03:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d4001000000b0032dc1fc84f2sm10498034wrp.46.2023.10.24.11.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 11:03:52 -0700 (PDT)
Message-ID: <da308888-0e47-4ca4-b318-8f089421dc0b@rivosinc.com>
Date: Tue, 24 Oct 2023 20:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20231024132655.730417-1-cleger@rivosinc.com>
 <20231024132655.730417-3-cleger@rivosinc.com>
 <20231024-e122c317599cd4c6db53c015@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231024-e122c317599cd4c6db53c015@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_110356_730190_21D94BD4 
X-CRM114-Status: GOOD (  11.24  )
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

CgpPbiAyNC8xMC8yMDIzIDE3OjIzLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MjQsIDIwMjMgYXQgMDM6MjY6NTJQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IC4u
Lgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TIGIvYXJjaC9yaXNjdi9s
aWIvdWFjY2Vzcy5TCj4+IGluZGV4IDA5YjQ3ZWJhY2YyZS4uM2FiNDM4ZjMwZDEzIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMKPj4gKysrIGIvYXJjaC9yaXNjdi9saWIv
dWFjY2Vzcy5TCj4+IEBAIC0xMCw4ICsxMCw3IEBACj4+ICAJX2FzbV9leHRhYmxlCTEwMGIsIFxs
YmwKPj4gIAkuZW5kbQo+PiAgCj4+IC1FTlRSWShfX2FzbV9jb3B5X3RvX3VzZXIpCj4+IC1FTlRS
WShfX2FzbV9jb3B5X2Zyb21fdXNlcikKPj4gK1NZTV9GVU5DX1NUQVJUKF9fYXNtX2NvcHlfdG9f
dXNlcikKPj4gIAo+PiAgCS8qIEVuYWJsZSBhY2Nlc3MgdG8gdXNlciBtZW1vcnkgKi8KPj4gIAls
aSB0NiwgU1JfU1VNCj4+IEBAIC0xODEsMTMgKzE4MCwxMyBAQCBFTlRSWShfX2FzbV9jb3B5X2Zy
b21fdXNlcikKPj4gIAljc3JjIENTUl9TVEFUVVMsIHQ2Cj4+ICAJc3ViIGEwLCB0NSwgYTAKPj4g
IAlyZXQKPj4gLUVORFBST0MoX19hc21fY29weV90b191c2VyKQo+PiAtRU5EUFJPQyhfX2FzbV9j
b3B5X2Zyb21fdXNlcikKPj4gK1NZTV9GVU5DX0VORChfX2FzbV9jb3B5X3RvX3VzZXIpCj4+ICBF
WFBPUlRfU1lNQk9MKF9fYXNtX2NvcHlfdG9fdXNlcikKPj4gK1NZTV9GVU5DX0FMSUFTKF9fYXNt
X2NvcHlfZnJvbV91c2VyLCBfX2FzbV9jb3B5X3RvX3VzZXIpCj4+ICBFWFBPUlRfU1lNQk9MKF9f
YXNtX2NvcHlfZnJvbV91c2VyKQo+IAo+IEkgZGlkbid0IHNlZSBhbnkgY29tbWVudCBhYm91dCB0
aGUgc2hhcmluZyBvZiBkZWJ1ZyBpbmZvIGFtb25nIGJvdGggdGhlCj4gZnJvbSBhbmQgdG8gZnVu
Y3Rpb25zLiBBc3N1bWluZyBpdCBpc24ndCBjb25mdXNpbmcgaW4gc29tZSB3YXksIHRoZW4KCkhp
IEFuZHJldywKCkkgZGlkIHNvbWUgdGVzdGluZyB3aXRoIGdkYiBhbmQgaXQgc2VlbXMgdG8gY29y
cmVjdGx5IGFzc3VtZSB0aGF0Cl9fYXNtX2NvcHlfdG9fdXNlciBtYXBzIHRvIF9fYXNtX2NvcHlf
ZnJvbV91c2VyIGZvciBkZWJ1Z2dpbmcuIFRoZSBiYXNpYwp0ZXN0cyB0aGF0IEkgZGlkIChicmVh
a3BvaW50cywgZGlzYXNtLCBldGMpIHNlZW1zIHRvIHNob3cgbm8gc2lnbiBvZgpwcm9ibGVtcyBm
b3IgZGVidWdnaW5nLiBXZXJlIHlvdSB0aGlua2luZyBhYm91dCBvdGhlciB0aGluZ3Mgc3BlY2lm
aWNhbGx5ID8KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IAo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
