Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EEFC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OO43sOiIMnYNT8cTbzm0HF3fpudgqO5+/7GjBBn0hVg=; b=l4+FoYfLtfTBu9
	ng6NhIqkcXFirRujEobcU1aepFw1x5gvIGmbNs5u84R6HHk/4xuddFFEPzi9OPcwSi5VDYYIX7has
	uGZtjkAIHera+vfwYwL47DNL/UR5o1SdLa7YlW9sQbhmerLxawbH/pH3s7sHSAM+ychQvrDnj2iP7
	EydklNdSnbUVYLR4AB2EwCWbFX1BRXzDtjJOZFuuOtyP91Qpay0bZopNkI6DG9r4/IA9D4laDghQW
	COCkeqBDPuxOsQiI+Z224OU79OpFhbWi7iJZe+cdSENSS6F+K6u214qZQlX35+gTc45Mn/fo6IiJs
	7jdE2Bed7CdluqZQcUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riG7m-00000005Nma-1nF9;
	Thu, 07 Mar 2024 15:57:38 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riG7j-00000005NkK-0Jl0
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 15:57:36 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5a197570d45so572641eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709827051; x=1710431851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlyFygOzPLZQtqLkcKQORhGXTkenxUtPW+pzdiM2lUk=;
        b=Qt41wJx7sGr1i0SFnMD1/xkQA6rVa7LPzW5AhN7sHdh47A5APZcU4RtR9KaGB6mPr3
         xhIbNlf6/c7GQ26j6cKfSjVe7wEkrz8WJBVpy31o4dicqbF2YmAx3mFdPkMHYZDEojxR
         /PUqqNKgrKTFWd3bd+0tODbMJIAJSWxaUfY4ty2LO3cMeAswG0ueLa2XqnaczcNMfXwb
         4s4Z8bd50s0G1EihmaxrKPdLTBJ9Xs+UEL8cgX3cXZxf3bXoMEpSxFk3yFhY5aA0F5JB
         AOrb6iIxYM9nBlraz+wln/eWW9DqZzalakZeaB4YhD+5Sd2OmBgzidF20PbQcLpUFH6F
         7pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709827051; x=1710431851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RlyFygOzPLZQtqLkcKQORhGXTkenxUtPW+pzdiM2lUk=;
        b=ci/CAvDzj6YWKesZ4I9i0ug5nkeO0E0YME/4SI3EXXie1IhFZGGc5s96AihRk5/kei
         WK7iJDk85ldAQ4CoNvnM+9MTGv9aZf405DZbwgd+XNBDgW46AL9h7nPd+F2nuuPFTjUT
         UKiLvh4GMszQBbBQ4Geq+42pTqfagtPBwazOfDIV9WbT6WYctDyO9pUN4ffaZKXzrxZx
         b1jvVOVo5yA/D+HL/bGo1vpwRHurFjYwObKbE0gpC6GzfvSMw2LUJ9Vtj1/NF4iF1uW1
         2p5dGuVY3+uu2TxRgi9CDVKngYaRzrhbGom/yDWuTSDSNoVH0Sz/WEPWkfbdX7jSRTv9
         2ogQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYq5qlUCBbUNIJNUmt67NmWXUmJIDiwLBYBrrt1FvtRTAp+ksHYWCo6z3y/hJmQbMClC0S6ZNT9DXTY97rxOuPzo5Qpwyk8iHpo9E8nZ4B
X-Gm-Message-State: AOJu0YzZ1+GXLE21XupokOwOcfhREe0z6EmRabmhKk/9eQKQPxf/aXxD
	b+VBh5K313plDj0r7A2JJiCOOGaIWK4QH6rkbg50fjcvYIoVp/x1k4jDtbocgx4=
X-Google-Smtp-Source: AGHT+IGLMaj0senpG2DVlOfCneZxi6Dvn6BxBym6/IZNsjEWdb4WjSiUo3kxyeUJ8BeQLziQRI7oSA==
X-Received: by 2002:a05:6358:789:b0:17b:759:65c2 with SMTP id n9-20020a056358078900b0017b075965c2mr10375934rwj.10.1709827051003;
        Thu, 07 Mar 2024 07:57:31 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id w11-20020a05620a094b00b0078821ef8162sm5151966qkw.9.2024.03.07.07.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:57:30 -0800 (PST)
Message-ID: <c1d994e2-8f0c-4039-b790-a426fc48055c@sifive.com>
Date: Thu, 7 Mar 2024 09:57:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel
 preemption for RISC-V
Content-Language: en-US
To: Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andy.chiu@sifive.com>
Cc: Evgenii Shatokhin <e.shatokhin@yadro.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, ardb@kernel.org, greentime.hu@sifive.com,
 zong.li@sifive.com, guoren@kernel.org, Jessica Clarke <jrtc27@jrtc27.com>,
 kernel@esmil.dk, linux-riscv@lists.infradead.org, linux@yadro.com
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <4fe4567b-96be-4102-952b-7d39109b2186@yadro.com>
 <CABgGipUGCVjy5wG1TMDpgf1Zn7Jcx5Lg1CUzQ0YLr5nOPf-TUg@mail.gmail.com>
 <51f21b87-ebed-4411-afbc-c00d3dea2bab@yadro.com>
 <bd7c2263-4e81-4be6-af4d-22a0842ba2e4@ghiti.fr>
 <CABgGipUtzLG2tffXOdV7-7ss+_doQvjxfwzVbfzyO56J3_3X0Q@mail.gmail.com>
 <f4506e4f-fca5-49ac-868e-f42f1f23ce9b@ghiti.fr>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <f4506e4f-fca5-49ac-868e-f42f1f23ce9b@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_075735_240250_29E3FD65 
X-CRM114-Status: GOOD (  18.39  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDMtMDcgNzoyMSBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IEJ1dCBUQkgsIEkgaGF2ZSBzdGFydGVkIHRoaW5raW5nIGFib3V0IHRoZSBpc3N1ZSB5b3VyIHBh
dGNoIGlzIHRyeWluZyB0byBkZWFsCj4gd2l0aC4gSUlVQyB5b3UncmUgdHJ5aW5nIHRvIGF2b2lk
IHRyYXBzIChvciBzaWxlbnQgZXJyb3JzKSB0aGF0IGNvdWxkIGhhcHBlbgo+IGJlY2F1c2Ugb2Yg
Y29uY3VycmVudCBhY2Nlc3NlcyB3aGVuIHBhdGNoaW5nIGlzIGhhcHBlbmluZyBvbiBhIHBhaXIg
YXVpcGMvamFybC4KPiAKPiBJJ20gd29uZGVyaW5nIGlmIGluc3RlYWQsIHdlIGNvdWxkIG5vdCBh
Y3R1YWxseSBoYW5kbGUgdGhlIHBvdGVudGlhbCB0cmFwczoKPiBiZWZvcmUgc3RvcmluZyB0aGUg
YXVpcGMgKyBqYWxyIHBhaXIsIHdlIGNvdWxkIHVzZSBhIHdlbGwtaWRlbnRpZmllZCB0cmFwcGlu
Zwo+IGluc3RydWN0aW9uIHRoYXQgY291bGQgYmUgcmVjb2duaXplZCBpbiB0aGUgdHJhcCBoYW5k
bGVyIGFzIGEgbGVnaXRpbWF0ZSB0cmFwLgo+IEZvciBleGFtcGxlOgo+IAo+IAo+IGF1aXBjICAt
LT7CoCBhdWlwY8KgIC0tPiAgWFhYWMKgIC0tPsKgIFhYWFjCoCAtLT7CoCBhdWlwYwo+IGphbHLC
oMKgIMKgwqDCoMKgIFhYWFjCoMKgwqDCoMKgIMKgIFhYWFjCoMKgwqDCoMKgwqAgamFscsKgwqDC
oMKgwqDCoCBqYWxyCj4gCj4gCj4gSWYgYSBjb3JlIHRyYXBzIG9uIGEgWFhYWCBpbnN0cnVjdGlv
biwgd2Uga25vdyB0aGlzIGFkZHJlc3MgaXMgYmVpbmcgcGF0Y2hlZCwgc28KPiB3ZSBjYW4gcmV0
dXJuIGFuZCBwcm9iYWJseSB0aGUgcGF0Y2hpbmcgd2lsbCBiZSBvdmVyLiBXZSBjb3VsZCBhbHNv
IGlkZW50aWZ5Cj4gaGFsZiBwYXRjaGVkIHdvcmQgaW5zdHJ1Y3Rpb24gKEkgbWVhbiB3aXRoIG9u
bHkgWFgpLgoKVW5mb3J0dW5hdGVseSB0aGlzIGRvZXMgbm90IHdvcmsgd2l0aG91dCBzb21lIGZl
bmNlLmkgaW4gdGhlIG1pZGRsZS4gVGhlCnByb2Nlc3NvciBpcyBmcmVlIHRvIGZldGNoIGFueSBp
bnN0cnVjdGlvbiB0aGF0IGhhcyBiZWVuIHdyaXR0ZW4gdG8gYSBsb2NhdGlvbgpzaW5jZSB0aGUg
bGFzdCBmZW5jZS5pIGluc3RydWN0aW9uLiBTbyBpdCB3b3VsZCBiZSBwZXJmZWN0bHkgdmFsaWQg
dG8gZmV0Y2ggdGhlCm9sZCBhaXVwYyBhbmQgbmV3IGphbHIgb3IgdmljZSB2ZXJzYSBhbmQgbm90
IHRyYXAuIFRoaXMgd291bGQgaGFwcGVuIGlmLCBmb3IKZXhhbXBsZSwgdGhlIHR3byBpbnN0cnVj
dGlvbnMgd2VyZSBpbiBkaWZmZXJlbnQgY2FjaGUgbGluZXMsIGFuZCBvbmx5IG9uZSBvZiB0aGUK
Y2FjaGUgbGluZXMgZ290IGV2aWN0ZWQgYW5kIHJlZmlsbGVkLgoKQnV0IHNlbmRpbmcgYW4gSVBJ
IHRvIHJ1biB0aGUgZmVuY2UuaSBwcm9iYWJseSBuZWdhdGVzIHRoZSBwZXJmb3JtYW5jZSBiZW5l
Zml0LgoKTWF5YmUgdGhlcmUgaXMgc29tZSBjcmVhdGl2ZSB3YXkgdG8gb3ZlcmNvbWUgdGhpcy4K
Cj4gQnV0IHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGF0J3MgY29tcGxldGVseSBzdHVwaWQgYW5k
IEkgZGlkIG5vdCB1bmRlcnN0YW5kIHRoZQo+IHByb2JsZW0sIHNpbmNlIG15IHBhdGNoc2V0IHRv
IHN1cHBvcnQgc3Z2cHRjLCBJIGFtIHdvbmRlcmluZyBpZiBpdCBpcyBub3QgbW9yZQo+IHBlcmZv
cm1hbnQgdG8gYWN0dWFsbHkgdGFrZSB2ZXJ5IHVubGlrZWx5IHRyYXBzIGluc3RlYWQgb2YgdHJ5
aW5nIHRvIGF2b2lkIHRoZW0uCgpJIGFncmVlIGluIGdlbmVyYWwgaXQgaXMgYSBnb29kIGlkZWEg
dG8gb3B0aW1pemUgdGhlIGhvdCBwYXRoIGxpa2UgdGhpcy4KClJlZ2FyZHMsClNhbXVlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
