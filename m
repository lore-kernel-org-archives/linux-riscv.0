Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7DC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5cbFnrilNZolnYNiM/bwMbrTFYTUrcxYF2eu3t27dM=; b=0qL7/SYClNexMY
	oZMhqDzXK6ISvARRAfVjuSTNnr1v/MNwOsT/ogafJVb4Hr8zoLD7iRxxllKtxyS3VKVH0jl8wIbtD
	lfnjDKNFRtqmF1Yiwzv3w8M/Hd6aiGnLeAM8SED6wXcsaorbsT6Pa8DUVSiU84a1UEiuWhJR51XfU
	5zFWHexWPMSHnWN2TknGNNhiH2Rk8M0yqIf56lrcx4r9CuTDgobWpJkNFUxdnA77YNKXGPt373UJ0
	DV6wZ54nKsGvLD/xqBD6DscaYmkRXWKQnk3hGeafzG7GyDdbdJBtvTp0oxrU/Qg6vp2YZBmMXnU+Z
	ZcRejhDDBtg0ydWGaAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvBQ-00DtV3-2a;
	Thu, 26 Oct 2023 07:53:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvBO-00DtUI-0J
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 07:53:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32d89600755so149084f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698306811; x=1698911611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7x9v8GLS8Ef4TSWddzkM6oKYRbalxE6ofrX2SJE4Hhk=;
        b=dfsm/UQox6649ah5+amb24eW2dWSUTyWYdXBFyIlLPnKxFP2UqGHW9Y77XT3886x/e
         YfwM4ooUwRqbl6IsZFiom0onO+Y1EIsqB2AUj9SRiMIdbecOYaQwP9vs0WeI0UeWNDHG
         8si/4UdrkUCHAOJ9732UHq4nNIRzVJEGCfzFpsLCQ+vCZo5s1GmH2L+oSfCeGcYf1ITe
         MVkQuT0If+/1nIgMojUTkOh/piqvNCQjlaDdN5IvT7KhMowAQLM7RYvd4rrWYx716Ala
         7d8ymy9igLS6Q3Hbm+t/WhVJM0phOp02y/hhVkIEPoI/BasNS82AH1dP+vDCE679zndq
         NXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698306811; x=1698911611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7x9v8GLS8Ef4TSWddzkM6oKYRbalxE6ofrX2SJE4Hhk=;
        b=c40VjiydN7eq3u7b9bhKiw+LvwyxYtSyWjoxdsdHbTWGKwwvBxeDBc3i8k2LYcpZTj
         KjPKD76xdEBc1yLsx8Tvay0ypzLOEckiRTaDiU1EJjv53HdvP/kyGvuJFWyYCGGNKE1z
         lHTR131wAgPANgCIzyu5HwfygOscWiq0V8mF+OgILikNL4KOUKV04Ne6ekLm2bmjmYEz
         o/t3uD2GIc/pn/chA2mhFX5eg497FJIbZP2H2qtkXrjMQF+XRu4bhI9Rro54ynoLqKXw
         jp4yVqs/9YNbNdYeJA9FZxErxIYat/qmNNR3hSySS099vvjIigxkuQqifwq2MqCzFIbc
         8p1g==
X-Gm-Message-State: AOJu0YwcYwYymE2jZGhZrOEI9/jDkVheq42nXvhBkBx2SPSTuHLKGY/J
	DgghT5FWvkXU+BxgCO/J7+yfyA==
X-Google-Smtp-Source: AGHT+IG8Fy+FLDWt7XCFmuIyub2r57w0404DNmOT+0P54B+ng8YYa8QMTcKkAo6XgLR/tBBzmEzROQ==
X-Received: by 2002:adf:b1d1:0:b0:32d:8be3:f3fe with SMTP id r17-20020adfb1d1000000b0032d8be3f3femr10181449wra.7.1698306811079;
        Thu, 26 Oct 2023 00:53:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:b380:32be:257:5381? ([2a01:e0a:999:a3a0:b380:32be:257:5381])
        by smtp.gmail.com with ESMTPSA id l21-20020a056000023500b003198a9d758dsm13780134wrz.78.2023.10.26.00.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 00:53:30 -0700 (PDT)
Message-ID: <db7ca9ba-27aa-482e-9986-67622b4cedb2@rivosinc.com>
Date: Thu, 26 Oct 2023 09:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20231024132655.730417-1-cleger@rivosinc.com>
 <20231024132655.730417-3-cleger@rivosinc.com>
 <20231024-e122c317599cd4c6db53c015@orel>
 <da308888-0e47-4ca4-b318-8f089421dc0b@rivosinc.com>
 <20231025-d21b7077ff99828bef7cfaa8@orel>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231025-d21b7077ff99828bef7cfaa8@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_005334_157694_4C25317F 
X-CRM114-Status: GOOD (  15.72  )
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

CgpPbiAyNS8xMC8yMDIzIDA4OjUwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MjQsIDIwMjMgYXQgMDg6MDM6NTJQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAyNC8xMC8yMDIzIDE3OjIzLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBUdWUs
IE9jdCAyNCwgMjAyMyBhdCAwMzoyNjo1MlBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+PiAuLi4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TIGIvYXJj
aC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+Pj4gaW5kZXggMDliNDdlYmFjZjJlLi4zYWI0MzhmMzBk
MTMgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+Pj4gKysrIGIv
YXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+Pj4gQEAgLTEwLDggKzEwLDcgQEAKPj4+PiAgCV9h
c21fZXh0YWJsZQkxMDBiLCBcbGJsCj4+Pj4gIAkuZW5kbQo+Pj4+ICAKPj4+PiAtRU5UUlkoX19h
c21fY29weV90b191c2VyKQo+Pj4+IC1FTlRSWShfX2FzbV9jb3B5X2Zyb21fdXNlcikKPj4+PiAr
U1lNX0ZVTkNfU1RBUlQoX19hc21fY29weV90b191c2VyKQo+Pj4+ICAKPj4+PiAgCS8qIEVuYWJs
ZSBhY2Nlc3MgdG8gdXNlciBtZW1vcnkgKi8KPj4+PiAgCWxpIHQ2LCBTUl9TVU0KPj4+PiBAQCAt
MTgxLDEzICsxODAsMTMgQEAgRU5UUlkoX19hc21fY29weV9mcm9tX3VzZXIpCj4+Pj4gIAljc3Jj
IENTUl9TVEFUVVMsIHQ2Cj4+Pj4gIAlzdWIgYTAsIHQ1LCBhMAo+Pj4+ICAJcmV0Cj4+Pj4gLUVO
RFBST0MoX19hc21fY29weV90b191c2VyKQo+Pj4+IC1FTkRQUk9DKF9fYXNtX2NvcHlfZnJvbV91
c2VyKQo+Pj4+ICtTWU1fRlVOQ19FTkQoX19hc21fY29weV90b191c2VyKQo+Pj4+ICBFWFBPUlRf
U1lNQk9MKF9fYXNtX2NvcHlfdG9fdXNlcikKPj4+PiArU1lNX0ZVTkNfQUxJQVMoX19hc21fY29w
eV9mcm9tX3VzZXIsIF9fYXNtX2NvcHlfdG9fdXNlcikKPj4+PiAgRVhQT1JUX1NZTUJPTChfX2Fz
bV9jb3B5X2Zyb21fdXNlcikKPj4+Cj4+PiBJIGRpZG4ndCBzZWUgYW55IGNvbW1lbnQgYWJvdXQg
dGhlIHNoYXJpbmcgb2YgZGVidWcgaW5mbyBhbW9uZyBib3RoIHRoZQo+Pj4gZnJvbSBhbmQgdG8g
ZnVuY3Rpb25zLiBBc3N1bWluZyBpdCBpc24ndCBjb25mdXNpbmcgaW4gc29tZSB3YXksIHRoZW4K
Pj4KPj4gSGkgQW5kcmV3LAo+Pgo+PiBJIGRpZCBzb21lIHRlc3Rpbmcgd2l0aCBnZGIgYW5kIGl0
IHNlZW1zIHRvIGNvcnJlY3RseSBhc3N1bWUgdGhhdAo+PiBfX2FzbV9jb3B5X3RvX3VzZXIgbWFw
cyB0byBfX2FzbV9jb3B5X2Zyb21fdXNlciBmb3IgZGVidWdnaW5nLiBUaGUgYmFzaWMKPj4gdGVz
dHMgdGhhdCBJIGRpZCAoYnJlYWtwb2ludHMsIGRpc2FzbSwgZXRjKSBzZWVtcyB0byBzaG93IG5v
IHNpZ24gb2YKPj4gcHJvYmxlbXMgZm9yIGRlYnVnZ2luZy4gV2VyZSB5b3UgdGhpbmtpbmcgYWJv
dXQgb3RoZXIgdGhpbmdzIHNwZWNpZmljYWxseSA/Cj4gCj4gTW9zdGx5IGp1c3QgYmFja3RyYWNl
IHN5bWJvbHMsIGJ1dCBJIHN1cHBvc2Ugd2UgY2FuIGxpdmUgd2l0aCBpdCwgc2luY2UKPiBpdCB3
b3VsZG4ndCBiZSB0aGUgb25seSB3ZWlyZCB0aGluZyBpbiBhIGJhY2t0cmFjZS4KCk9oIHllcywg
SW4gdGhhdCBjYXNlLCBjbGVhcmx5LCBpZiBiYWNrdHJhY2VkIHRocm91Z2ggX19hc21fY29weV90
b191c2VyLAppdCB3aWxsIGRpc3BsYXkgX19hc21fY29weV9mcm9tX3VzZXIuIFRoaXMgaXMgdGhl
IGNhc2UgaW4gZ2RiIGlmIHlvdQpkaXNhc3NlbWJsZSBfX2FzbV9jb3B5X3RvX3VzZXIsIGl0IGRp
c3BsYXkgX19hc21fY29weV9mcm9tX3VzZXIgKHdoaWNoCmlzICJxdWl0ZSIgZXhwZWN0ZWQgdG8g
c2F5IHRoZSBsZWFzdCkuIEJ1dCBJJ20gbm90IHN1cmUgb2Ygd2hhdCB3b3VsZApoYXBwZW4gd2l0
aCB0aGUgZXhpc3RpbmcgY29kZSBzaW5jZSB0aGVyZSBhcmUgdHdvIHN5bWJvbHMgbWFwcGluZyB0
bwpzYW1lIGFyZWEgb2YgY29kZS4gSSdkIGV4cGVjdCB0aGUgc2FtZSBJIGd1ZXNzLgoKQ2zDqW1l
bnQKCj4gCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
