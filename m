Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD64C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 23:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkuAaGlpn26rckrQp6m1Xt9r1y1n6SVL6VH1ZkWzdDA=; b=r461ru1u84w5pm
	9v8nMshSBA4iqjX2jZUHPopnybbuvSez0Ec6P7dewcVbKul81EmU3q7s8nH4AvX1gmarn/UnSCmY0
	e+afoTSyGL8/6wT9GF9kuV/j4ZdvnlM7guA/yg3flDhPhQeHvCDgoK4xZXJYPadWlsltyYjhyV19q
	YOYsWjFJtx0dsNId2nNpomO/t5InrsMbbKUpDjKyD7shyzIHqub7Nb4zY6A4Q4ZCbiP6kJe1LVkhc
	1+AKHwJF2fVUEok6hrrxpLw8JZsycWQzLkKkhz37sruUX+dgZMIETFoDUDGkENzD9ulhQXz1ABkrL
	4wXCzaZ/Njp10XyjPRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXTQ1-00000006tSf-2vtV;
	Mon, 13 Jan 2025 23:00:25 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXTP4-00000006tMY-1na0
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 22:59:27 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-84ceaf2667aso257545039f.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 14:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736809165; x=1737413965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQ2gkNd4r9DMxTqkbVKwWo3rDcj05xjd+dF6fL8Gq6E=;
        b=cEUU6uG+O31mCaHu3cHE6bMOZ9swRSvRprQfweFJugZ3ToaWrCP02vUFxOf64PEwlX
         ReYlm4XunRlyrRivKxvuKqzTxmgEaKLVpolx2algLkwleLftn/d8dDqi5IHPG2rvwrf1
         jYKT1fQArNGNJFr7lEwbJ57hVvWb00qwok0Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809165; x=1737413965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ2gkNd4r9DMxTqkbVKwWo3rDcj05xjd+dF6fL8Gq6E=;
        b=iYeptUsJpo/ge4EhLjWk+OKso4Z3Qjh/ITukxt7wSHzAor4FEQv0eekTtyDEkGcUES
         LpCCAMw5ugw6zjnyVtEkcq5UBUze214q3UrNNv2yRSN6ojGRrYdIns++UYnt29dst7Gq
         TdU21kOFviexxCzwqaDK5rKfUif2Y0joafARiwLIUYKnfPCXmGSlUoonnSeM+PWa5yLI
         vkFYJYLIe51X9k9p/35M19Moh3rD6rLL4Iv9DGWXxnLjxkNykmFYw5MOy3aTVY5Cp3T5
         rVi/+dMI9V6ZBeP2qPYZOXHinccAwEPprX5MUM2HK32EzBHGrY5WAeqqULnFzKnvVdXW
         /I+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBh/DJ5xI3hZBde7MFvvXLwCbbGtxPkgAyFdbvdYzU+gS+TubMO4EDvMP0VB6ohehL2FpVC5fVw2x8jg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0PSSfEEHofOgidugFtpfHdkdRDysX0PMBmCZaZ2S6NQl5d4ob
	Snls2+H1mIGun4M5vcSjV16KOgH9+6QQ0OaCbgUKaDhvEKsSKB1VLAn5kNLY+yk=
X-Gm-Gg: ASbGnct7pwNCWb1PJwWGRjs/QZbtOqZxq0sv4ztSL3U+kIocqNKrwZbxvy19wkwMgz6
	24PTHaTUl51JE4eKZrT72Eqz1MZTRIIMds+n9G+2QiO53YFdZf/6ZY3MYA4THypeopCx4Kzsp+4
	ptkNn/XRV7yqDN11bFjzqPyffEtuDRjK3J9PgDojnkdclen5IE2YNL0Bq1UtjUJ+g5xZNzMapQl
	dCtZtlEeKd4OYB+egdO773LsYB1MOgUyuVmAgzkIbaC7XhsnDfz+FPaet0f4HsCnTo=
X-Google-Smtp-Source: AGHT+IHOuxI2cX2rWco2UdItAy0w43rmA9Z7pNHw9QLL1Jzj184Hh3jFHAinlOQ+DJl0iE7GLseE7w==
X-Received: by 2002:a05:6602:3e8f:b0:83a:a746:68a6 with SMTP id ca18e2360f4ac-84ce0095b54mr2190395039f.5.1736809165348;
        Mon, 13 Jan 2025 14:59:25 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d4fb403b7sm291636339f.24.2025.01.13.14.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 14:59:24 -0800 (PST)
Message-ID: <3bcdf139-81e2-4ef3-8e86-1e22b4df6d49@linuxfoundation.org>
Date: Mon, 13 Jan 2025 15:59:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rseq/selftests: Fix riscv rseq_offset_deref_addv inline
 asm
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250103040326.2603734-1-shorne@gmail.com>
 <44f202e8-dc35-40aa-8dc3-2f2e4c28feda@efficios.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <44f202e8-dc35-40aa-8dc3-2f2e4c28feda@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_145926_467155_8967074F 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8xMC8yNSAwOToyMiwgTWF0aGlldSBEZXNub3llcnMgd3JvdGU6Cj4gT24gMjAyNS0wMS0w
MiAyMzowMywgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4+IFdoZW4gd29ya2luZyBvbiBPcGVuUklT
QyBzdXBwb3J0IGZvciByZXN0YXJ0YWJsZSBzZXF1ZW5jZXMgSSBub3RpY2VkCj4+IGFuZCBmaXhl
ZCB0aGVzZSB0d28gaXNzdWVzIHdpdGggdGhlIHJpc2N2IHN1cHBvcnQgYml0cy4KPj4KPj4gwqAg
MSBUaGUgJ2luYycgYXJndW1lbnQgdG8gUlNFUV9BU01fT1BfUl9ERVJFRl9BRERWIHdhcyBiZWlu
ZyBpbXBsaWNpdGx5Cj4+IMKgwqDCoCBwYXNzZWQgdG8gdGhlIG1hY3JvLsKgIEZpeCB0aGlzIGJ5
IGFkZGluZyAnaW5jJyB0byB0aGUgbGlzdCBvZiBtYWNybwo+PiDCoMKgwqAgYXJndW1lbnRzLgo+
PiDCoCAyIFRoZSBpbmxpbmUgYXNtIGlucHV0IGNvbnN0cmFpbnRzIGZvciAnaW5jJyBhbmQgJ29m
ZicgdXNlICJlciIswqAgVGhlCj4+IMKgwqDCoCByaXNjdiBnY2MgcG9ydCBkb2VzIG5vdCBoYXZl
IGFuICJlIiBjb25zdHJhaW50LCB0aGlzIGxvb2tzIHRvIGJlCj4+IMKgwqDCoCBjb3BpZWQgZnJv
bSB0aGUgeDg2IHBvcnQuwqAgRml4IHRoaXMgYnkganVzdCB1c2luZyBhbiAiciIgY29uc3RyYWlu
dC4KPj4KPj4gSSBoYXZlIGNvbXBpbGUgdGVzdGVkIHRoaXMgb25seSBmb3IgcmlzY3YuwqAgSG93
ZXZlciwgdGhlIHNhbWUgZml4ZXMgSQo+PiB1c2UgaW4gdGhlIE9wZW5SSVNDIHJzZXEgc2VsZnRl
c3RzIGFuZCBldmVyeXRoaW5nIHBhc3NlcyB3aXRoIG5vIGlzc3Vlcy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6
IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Cj4gCgpJ
ZiB0aGVzZSBhcmUgZ29pbmcgdGhyb3VnaCByaXNjIHJlcG8KCkFja2VkLWJ5OiBTaHVhaCBLaGFu
IDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPgoKSWYgeW91IHdvdWxkIGxpa2UgbWUgdG8gdGFr
ZSB0aGlzLCBsZXQgbWUga25vdy4KCnRoYW5rcywKLS0gU2h1YWgKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
