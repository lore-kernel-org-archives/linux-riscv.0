Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E63C3601A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khvdbNhTIZMtHuOntRduEskEY4FLyv3eEc9IXsJ1z/0=; b=SSrc9Io8B4EqR9
	ffMb2F80wisnp2ppllwj5riZh4N6JUZL49pCifLNt/oudtlcC2Xy9oEdRgklAGBiRyl+7lWfSdGLE
	zQoo3IXqn8+moOnj+B73vyWQc+dJzcoHDYIu4cZ4gXYwkXQi05Vh7rmY2CZ8DgCiVt99MeUrS5D5x
	TT+BZnvFuo126UesTqMr2/DntH3Eu0CABM/ONG+j5hGz8gQb+dx0YyulQdjxDa5olQNOO7cEhcHLM
	bC2WdQ5/Orgao//aKdE5pCXWE048fllnQp3QymuzIcI6feXVIXttwP6692QBwwqXzSyDvWZ/ngDPw
	7xKYEocMn/0BkrUcQtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWUu-00000002GFA-02kH;
	Tue, 01 Apr 2025 07:57:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWTF-00000002G7U-3AFA
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 07:55:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so47384375e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743494139; x=1744098939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3IFfnktPetU0+p+9PekfzVQmL5WwAw78U+gJAxKj4A=;
        b=cF7ys8vMLtvWHbsiu+6Iv3MGqWpH4cGVRMve+R+/IuE9GIR/lMqexyIYgtLIb8qjU/
         JH+SA6Qy1aYzdbCTy3IBQjtYHTy7F3xJHQjtmMvf1YLvSG9D74x6ecgDwGiSk5/3Zp23
         1wfCdOYm7VnzzZY+n2aFLHyicZnxSJ5jNeUIvtwz7bbmjq5GqHAUST0RKXC6ilG6OOAZ
         MvfmzaMhbpUlRiI48/PgXNi4aJ3rBIrmc5XLcCcmaEHWu0tK/TGBkKFx6i4ILjHLE4Y8
         39FRw7SnQHT7R/E9zm/9hTXvV5W7lIHCiS8vKhCxBWRbcMnLRTLK8bcm85Qxf58m7Zf5
         vB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743494139; x=1744098939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3IFfnktPetU0+p+9PekfzVQmL5WwAw78U+gJAxKj4A=;
        b=T5zXn/rygF8secrYIDxPGuaUjSOe2sR7P7ZhSpWX78Tx0FN5E7PDU1HL6HPtPaZihX
         pRGxC/+6a/FlVTGwbRAF9EYZR0A/xCPx6gc9S/OnO41UL331YEfTseSCvxfsI/RSPxD4
         r1H9lc/NFSTcWyiuQpc0XOBqfpePpRlEmhQz5DhnErCu/A+aSBvyXllWIJXpO5Nu7p8T
         3jibVRKL1qvn+/X41FZOkgM6+fT3yg4CnjuZjjYBNLseYipii98nR5Eota0lp1/j0M15
         cwqla3yyXRAkMxiU/5g4qOhCMHAio9EoWwMN+Ki95mlH52q0ZNsdXF26WbfBHffFGfdC
         4MHg==
X-Forwarded-Encrypted: i=1; AJvYcCW0OyuKfhl0DKll0j8oust4zWCjfoEPJEBksTzvjx0H2V54E/YFZjcqqN2L/mfTCELAgdhsb3jFUSgh0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEC85N/L23lsjKxHjAuwSgGDFhh7NUs6Wa0HnPvmStFfOlB4bf
	hiVnz9x40CEkwgKhBcr2O7DoYPTeSRgR0XkfbPZt1JTeWw+qIBR9nseoUQ1pCClamsT6Tid5Yk0
	t1e4=
X-Gm-Gg: ASbGncsrCUW+GAq9bCia1jVBAVvciS597qO9OUKORBlsveQirGJ4vr6klilgLvcj6LB
	1P9OB5I7ue7rJVwfCLoLDW+9HbY95y1Sx4GwoKvwvTiaE7EuWATkkM6owNvuJgbJxzYcBavJV3O
	GO6PlYwkNKPtsjAAxMM/7pJfsLcH0f4bK6gygMcNqnslyqdCDcL8CVoUvI+nnkGOdwSO9b1We27
	tTFzo0FNplIwkhuPXLqvozflazchz3clnm6v4lO9CkySeU9owUk6fjrZKi9EgfEWhsL8ZCp0NuM
	akLz5SedCsbElSEQ8UCHq6+uLRA9aYV6zkqAvnn0xa5kc2LRI3RslQEKwLRndIQAe0Q+7aVmRfi
	1dkqFRR4hagYP+w2T
X-Google-Smtp-Source: AGHT+IFdQHHyY0wP1F51yj0EQUTqviFJB2u9wmNXL+8rqBmHZaLUUYKhbBie7aq9H9T9wMmuh//sFw==
X-Received: by 2002:a05:6000:2913:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-39c1211fed8mr8420766f8f.55.1743494139265;
        Tue, 01 Apr 2025 00:55:39 -0700 (PDT)
Received: from ?IPV6:2001:861:3380:2e20:6214:6f9b:8e4c:f723? ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e3b0sm13379295f8f.74.2025.04.01.00.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 00:55:38 -0700 (PDT)
Message-ID: <8559a9f9-9100-48a7-a996-700b4a5852a9@rivosinc.com>
Date: Tue, 1 Apr 2025 09:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Module load relocation hashtable size can become huge and
 unallocatable
To: William Pierce <wgpierce17@gmail.com>
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@dabbelt.com
References: <32a55bf7-ffc7-4383-ab61-fd4d75f46b3a@gmail.com>
 <754690c5-3df8-4524-b545-88a2a5e186ab@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <754690c5-3df8-4524-b545-88a2a5e186ab@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_005542_061801_407EA468 
X-CRM114-Status: GOOD (  16.45  )
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

CgpPbiAwMS8wNC8yMDI1IDA1OjEwLCBXaWxsaWFtIFBpZXJjZSB3cm90ZToKPiBVc2luZyB2bWFs
bG9jX2FycmF5L3ZmcmVlIG9uIHRoZSByZWxvY2F0aW9uX2hhc2h0YWJsZQo+IGFsbG93cyB0aGUg
a2VybmVsIG1vZHVsZSB0byBsb2FkIGp1c3QgZmluZS4gSSBjYW4gc2VuZCB0aGlzCj4gYXMgYSBw
YXRjaCBpZiB0aGUgZml4IHNvdW5kcyBnb29kLgoKSGV5IFdpbGxpYW0sCgpVc2luZyB2bWFsbG9j
IHNvdW5kcyByZWFzb25hYmxlIHNpbmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZQpwaHlzaWNh
bGx5IGNvbnRpZ3VvdXMgbWVtb3J5LgoKSG93ZXZlciwgdGhlcmUgaXMgYWxzbyBhIG5ldyBBUEkg
bmFtZWQga3ZtYWxsb2Mgd2hpY2ggdXNlcyBrbWFsbG9jIGZvcgpzbWFsbCBzaXplcyBhbmQgdm1h
bGxvYyBmb3IgbGFyZ2UgYWxsb2NhdGlvbnMgZXhjZWVkaW5nIGttYWxsb2MKY2FwYWJpbGl0aWVz
LCBwb3RlbnRpYWxseSBsZWFkaW5nIHRvIGJldHRlciBwZXJmb3JtYW5jZXMgdGhhbiB1c2luZwp2
bWFsbG9jIG9ubHkuCgpDbMOpbWVudAoKPiAKPiBPbiAzLzMwLzI1IDE6MTIgUE0sIFdpbGxpYW0g
UGllcmNlIHdyb3RlOgo+PiBIZWxsbywgSSBoYXZlIGEga2VybmVsIG1vZHVsZSB0aGF0IHJlcXVp
cmVzIGEgaHVnZSBudW1iZXIKPj4gb2YgcmVsb2NhdGlvbnMgdXBvbiBsb2FkaW5nLgo+Pgo+PiBP
biBvdGhlciBhcmNoaXRlY3R1cmVzLCBpdCBsb2FkcyBpbnRvIHRoZSBrZXJuZWwganVzdCBmaW5l
Lgo+PiBIb3dldmVyLCBvbiByaXNjdiwgd2hpbGUgYWxsb2NhdGluZyBtZW1vcnkgZm9yIGl0cyBy
ZWxvY2F0aW9uCj4+IGhhc2h0YWJsZSwgaXQgZW5kcyB1cCByZXF1ZXN0aW5nIDIwOTcxNTIgZWxl
bWVudHMgdG8ga21hbGxvY19hcnJheS4KPj4KPj4gUmlnaHQgaGVyZSBJJ3ZlIGR1bXBlZCB0aGUg
dmFsdWVzIGJ5IHJlY29tcGlsaW5nIHRoZSBrZXJuZWw6Cj4+IG51bV9yZWxvY2F0aW9uczogMTYz
MDk4NSwgaGFzdGFibGVfc2l6ZTogMjA5NzE1Mgo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni4xNC1yYzYvc291cmNlL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jI0w3MzQK
Pj4KPj4gd2hpY2gga21hbGxvY19hcnJheS0+Li4uLT5fX19rbWFsbG9jX2xhcmdlX25vZGUtPi4u
Li0+Cj4+IF9fYWxsb2NfZnJvemVuX3BhZ2VzX25vcHJvZiBjYW4ndCBoYW5kbGUgYW5kIHJldHVy
bnMKPj4gIkNhbm5vdCBhbGxvY2F0ZSBtZW1vcnkiIG9uIGluc21vZC4KPj4KPj4gSG93IHdvdWxk
IGl0IGJlIHJlY29tbWVuZGVkIHRvIGZpeCB0aGlzPwo+PiBJIGNvdWxkIGltYWdpbmUgYWxsb2Nh
dGluZyBhIG1vcmUgZGlzY29udGlndW91cyBkYXRhIHN0cnVjdHVyZQo+PiB0byB0cmFjayB0aGUg
cmVsb2NhdGlvbnMgb3Igb3RoZXJ3aXNlIHJld29ya2luZyB0aGUgdHJhY2tpbmcgdG8KPj4gZG8g
dGhlIHJlbG9jYXRpb24gdHJhY2tpbmcgaW5saW5lLgo+Pgo+PiBUaGFuayB5b3UsCj4+IFdpbGwg
UGllcmNlCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
