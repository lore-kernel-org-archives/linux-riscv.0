Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB09FCCFA04
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlHu0khMR/lKqwjXAXcWbAYXvGbuD+uWiJTHkQoBQN8=; b=wjgAGX4FZanbPI
	4p6pUSuAcGmP1C2U9Km5ohuuqGwnnRvLoKxYRFMojE6qUGe4iBjU1Uksc+vSFXS+sZK0sbsJJdh83
	75Bnz2Mk3FWuuwsXnGJYj3dmE+0XdlfA+30R4YKshT1qPCiwkN8tp6UAypeGR755n2QtcEo+YXWoI
	g6twVqhwNw4xYEYQ9v/xJ9YKluYpCYc/83fKwu4LesVJmhckFsv3QjYX+kdFTMHzcTwYmBAXS5Nm6
	+6aL3ITVH+vfBYi7o7Am4Pn1vmN5RnmZk8/g+uUFBHwtl3W0YHJWK5NMiU/z0KrLwAmjPPK3XxLNa
	T810/mn4z1WB1jtQR19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZ5d-0000000DJEh-48hL;
	Wed, 05 Nov 2025 08:42:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZ5b-0000000DJEM-0G8o
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 08:42:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2957850c63bso6993625ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762332118; x=1762936918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUkopRdeDHdh9AWy0RMXnD+iemi5ZwANhUDqA8Z7pVY=;
        b=G8kHJU3G3q9K72g3I26cMMpOC+RDpmyQN3qkt1cNPw2H9xgZFYtDaB+3Xab5fGIVu5
         4HBtNWtO1qslpIo+Spl6qvdXYQ5mUeo0aFBIZjodYq+GTPrgswTuUV5Knj/2XGUZUDjT
         kBeYNFFrlmbLY2hiM4O+BUGgF2lOVZVxl3FbME5BXy6jA7jpLKTBnafAbJtslqZvWCAs
         a+4tYNyqzCqKvvIMnkcLlODDQtHXTYyZIWXJL4RYIxcSTYxGW96ZxVCH3pKb7oF7Yyln
         1UE0O4fEl3K39IOvwuynyDiNggXj+FXx2C3SB7I6YJHura4MJIWI+QQVAERdBlhnCRN2
         EHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332118; x=1762936918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUkopRdeDHdh9AWy0RMXnD+iemi5ZwANhUDqA8Z7pVY=;
        b=mq3xqN0KDIzS0U0HBYxrB+zOsihTATT6q1vNF/4ifEML2LKy7zKIV/tUpKGx0+VzWU
         mWtGJ3nVwqox/qJ6FdEB8ZyoGMivippJu+OTyI/wThdJSSXDnXOPcSUNA0JGt4jSDPo/
         CAIJD5PDIOTVkW9KBa6B8lsWfp6aOoH+6qY6T093XujGEZnhIfK+JUcpSL8uC2Yowso9
         RgYkk5zpYp9+Du+YgBMpRBSjO7oLwtPfG/saT2i4owWBx5USe5xHU2S7Vt/kTOa3rZRv
         5mVXyBQ5YptWkSEa2yoZ1dfydwvB8W6KUpZw7AZ6cFprXnC6MPWHCDeF6EitF006Yvrb
         jLdw==
X-Forwarded-Encrypted: i=1; AJvYcCXVBcJgntYckXF/HOewaHYoCCBS2ljFw/+rGTg8ZM4gHePZyDjsMfEitfftZOxrd3adsoAS8mdrBQnSZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwosYvXkHbmWOtJ4xQo08HzOozM7fpwAgL+5e0LoVAIhm9l33x/
	9BsC6qkqrsyUNDL2so7oPuA4BJJCDL3Jq3flNPnBTGsLRoz+04ktPni0Yhy9JeVMfXo=
X-Gm-Gg: ASbGnct4p6GUVmaureEC2Oqd1G1akhF+RJ0+PUAIJ5JM1UedKIQa9enqBtEB+HayWBr
	OfKqq1UcWHd/96kd2J7x6O6pX4uTtIPrA3TKKnNlA47CjnF7v3vKumltL9o7zeK0Tg58mMFGU1h
	zlB/ltlPiES3JsALi2m13GVnd4ITNJciyuzNhJ1Xzs0NIPjFHvU5jyGIttVlL9LMybv5bcxSWwp
	uloMELjm/lVgdt4CSJn0sQGHxc0bu+sRCeK3L7EoU8F/YULv2BWQzM7lUcyoS5Uh+l8eygoRFIx
	N36daUiXgjElRohp5eGQS62vw+zs9TaOCsUtMaWoYHW8nckJG8WQfnqEsQgT2JGUUUF/16X0aci
	Cm/uXBK5+j3ayr6Tr7bNWK7QjW1fHW6kZA3LRnvvtp8rwL6HI0pphVlINgb/9WJx3lKcMhovaAn
	gHvrWzzvvcQswfP6TbMyGn2E2SzYQFRqM0o5rky80yCE/Uqg==
X-Google-Smtp-Source: AGHT+IH5fMD1INFs9eEGKYVtBDuuIJ1FKf0Z38BpsziCkXGqBqC8vDLl4i3lj3Io8I0ea2eccHNQTg==
X-Received: by 2002:a17:902:d48c:b0:24b:270e:56d4 with SMTP id d9443c01a7336-2962ad0fba0mr32538305ad.4.1762332118155;
        Wed, 05 Nov 2025 00:41:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601972a9fsm52542895ad.20.2025.11.05.00.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:41:57 -0800 (PST)
Message-ID: <913ad5f8-89cf-475f-8ab4-3fa5e21d2941@rivosinc.com>
Date: Wed, 5 Nov 2025 09:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/10] riscv: Add fixmap indices for GHES IRQ and
 SSE contexts
To: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
 acpica-devel@lists.linux.dev
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
 <20251029112649.3811657-5-hchauhan@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20251029112649.3811657-5-hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_004159_130400_DAC9DCB1 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: apatel@ventanamicro.com, tony.luck@intel.com, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8yOS8yNSAxMjoyNiwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiBHSEVTIGVycm9y
IGhhbmRsaW5nIHJlcXVpcmVzIGZpeG1hcCBlbnRyaWVzIGZvciBJUlEgbm90aWZpY2F0aW9ucy4K
PiBBZGQgZml4bWFwIGluZGljZXMgZm9yIElSUSwgU1NFIExvdyBhbmQgSGlnaCBwcmlvcml0eSBu
b3RpZmljYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhjaGF1
aGFuQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZml4
bWFwLmggfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZml4bWFwLmgKPiBpbmRleCAwYTU1MDk5YmI3MzQuLmU4NzRmZDk1MjI4
NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZpeG1hcC5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaAo+IEBAIC0zOCw2ICszOCwxNCBAQCBlbnVt
IGZpeGVkX2FkZHJlc3NlcyB7Cj4gIAlGSVhfVEVYVF9QT0tFMCwKPiAgCUZJWF9FQVJMWUNPTl9N
RU1fQkFTRSwKPiAgCj4gKyNpZmRlZiBDT05GSUdfQUNQSV9BUEVJX0dIRVMKPiArCS8qIFVzZWQg
Zm9yIEdIRVMgbWFwcGluZyBmcm9tIGFzc29ydGVkIGNvbnRleHRzICovCj4gKwlGSVhfQVBFSV9H
SEVTX0lSUSwKPiArI2lmZGVmIENPTkZJR19SSVNDVl9TQklfU1NFCj4gKwlGSVhfQVBFSV9HSEVT
X1NTRV9MT1dfUFJJT1JJVFksCj4gKwlGSVhfQVBFSV9HSEVTX1NTRV9ISUdIX1BSSU9SSVRZLAo+
ICsjZW5kaWYgLyogQ09ORklHX1JJU0NWX1NCSV9TU0UgKi8KPiArI2VuZGlmIC8qIENPTkZJR19B
Q1BJX0FQRUlfR0hFUyAqLwo+ICAJX19lbmRfb2ZfcGVybWFuZW50X2ZpeGVkX2FkZHJlc3NlcywK
PiAgCS8qCj4gIAkgKiBUZW1wb3JhcnkgYm9vdC10aW1lIG1hcHBpbmdzLCB1c2VkIGJ5IGVhcmx5
X2lvcmVtYXAoKSwKCkhpIEhpbWFuc2h1LAoKUmV2aWV3ZWQtQnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
