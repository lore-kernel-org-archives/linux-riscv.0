Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35AFC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 04:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6txyOroEEQn+hoF68VfWQD3W74HxKkUsCYX/pZzYqoc=; b=upx7BeJ6+MAOor
	vW1p0ohZWSp+pJsUbPjVxUrZRiBE7mlhbQUXAjG+Ne6GDxy5u6MYtiYvral6SLyX22a5vPyxpow8y
	b0MlmAe6r4Ox/C+co2kUfYy3V+t9tZvq1m417Hbq1wguuNqN0Y/oahv6hUxn4PA3/QcSJq4t6Mcjg
	8BFV2hReKdVV/Ab+ZEeSfV4JHWraiuvqfg4mtVFffZ+zgSeNVQrDs3laAOSpB6HpVrzXoEGuZxRmf
	R8nzl2CdYJnPb9w4HMb9J+TtjOYDZkrrE6or5JtFBfAG8bmt4D0rIPjZ5kGsd8BjUxqJYWceJfHZ1
	gvoNdD0r7022CdoLY8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFSiw-009Xoa-4N; Wed, 11 Jan 2023 04:28:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFSis-009Xnu-I8
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 04:28:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id s8so7196494plk.5
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 20:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXZjC/DmwQdIIlQ4/Z/0cbskvNfG/Ewj+78a1mwo7zE=;
        b=XxgAKHKEBxa3Ku8ewYBVzexUdjK+YpBXdQ9ViBLjXTIvhtQ0R9xNqAQOWYXmoTHoFz
         J5hCePf+G2g1Mrfc0nvIeYEOZ9ELB0OuzpICfuMWQcCUV/NnHS/jAldeKvnJZ1WYF5AW
         buEGJyUzNElyL99k3p9CbWFHmW7vKEKjWySoZAXXFCa/nHiGsoAxVXFk7xUHpkxkO5JK
         gYr8snxcM9tEzzu27zP86/nLXkXYb6+jhVWxUPJabCX8t4t+mLDcrmRjP805w6Ip40k8
         puf2kEbWpw/poBuGYinDZSKr7hfFOLfG7PLKjLKZpqjHRhOMLRf1rWHUktbbfX9h4j98
         evNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXZjC/DmwQdIIlQ4/Z/0cbskvNfG/Ewj+78a1mwo7zE=;
        b=JZlnxBdXonXXK8pq8g4XDxBD+2TrZw8RE5sFMY6CMMtapxoodRutnKgM2f+ksOb1d2
         GEBVb9umoD0IXz1fO7+VCYh/WCEXZlQb5U7wT4/5O5qCjz9bArQjIVrT158Yy3cezQ9w
         scmmbn6VMWBOCmnM4AV0s7hXTeur95p1REb1dhdpObQSCYHnz31hTuwRq9bM3LI5uQB0
         MJeRSlJnuiAbRw4sJlktQrShpdURAYk80qWerUC52D37sVmbp/GBGnj3BkMWKwMbH97K
         weUNVsy7lF4ckDxE3Ddj3yrFGw7hxUXJRrqvIOO+nVpJXLJWv85D95etZGMHsrNLUa0d
         Lxng==
X-Gm-Message-State: AFqh2kpWPEgUsxwbdT9ep13xri9buQ9TSJcVQSXmkl9i6R5WI4h8CeMk
	sDBv4eBmtGSRKy1bv9cAQrqbLQ==
X-Google-Smtp-Source: AMrXdXvz//WNvmPcOjdnGix3EEbJUHoqRB5mxb0l9S+zAJsoPE02JWs6w26vSqZ3+p5fNA8wUq9bAQ==
X-Received: by 2002:a17:90a:6281:b0:219:b1f3:2401 with SMTP id d1-20020a17090a628100b00219b1f32401mr71627006pjj.13.1673411298802;
        Tue, 10 Jan 2023 20:28:18 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a1d0700b00228da96cfdbsm1054142pjd.20.2023.01.10.20.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 20:28:18 -0800 (PST)
Message-ID: <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com>
Date: Tue, 10 Jan 2023 21:28:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Vineet Gupta <vineetg@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
 <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
 <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
 <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
 <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_202822_644930_37E66863 
X-CRM114-Status: GOOD (  11.58  )
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

CgpPbiAxLzEwLzIzIDE4OjIyLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToKPiBPbiAxLzEwLzIz
IDEwOjA3LCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4+IFllcyBidWxrIG9mIGdsaWJjIG1pZ2h0IG5v
dCBoYXZlIHZlY3RvciBjb2RlLCBidXQgdGhvc2UgViBpZnVuYyAKPj4gcm91dGluZXMgZG8gYW5k
IElNTyB0aGlzIGluZm9ybWF0aW9uIG5lZWRzIHRvIGJlIHJlY29yZGVkIHNvbWV3aGVyZSBpbiAK
Pj4gdGhlIGVsZi4gQ2FzZSBpbiBwb2ludCBiZWluZyB0aGUgY3VycmVudCBpc3N1ZSB3aXRoIGhv
dyB0byBlbmFibGUgViAKPj4gdW5pdC4gQ29tbXVuaXR5IHdhbnRzIGEgcGVyLXByb2Nlc3MgZW5h
YmxlLCB1c2luZyBhbiBleHBsaWNpdCBwcmN0bCAKPj4gZnJvbSB1c2Vyc3BhY2UgKHNpbmNlIFJW
IGRvZXNuJ3QgaGF2ZSBmYXVsdC1vbi1maXJzdCB1c2UgaGFyZHdhcmUgCj4+IG1lY2hhbmlzbSB1
bmxpa2Ugc29tZSBvZiB0aGUgb3RoZXIgYXJjaGVzKS4gQnV0IGhvdyBkb2VzIHRoZSBnbGliYyAK
Pj4gbG9hZGVyIGtub3cgdG8gaW52b2tlIHByY3RsLiBXZSBjYW4ndCBqdXN0IHJlbHkgb24gdXNl
ciBlbnYgCj4+IEdMSUJDX1RVTkFCTEUgZXRjIHNpbmNlIHRoYXQgbWlnaHQgbm90IGJlIGFjY3Vy
YXRlLiBJdCBuZWVkcyBzb21ldGhpZ24gCj4+IGNvbmNyZXRlIHdoaWNoIElNTyBjYW4gY29tZSBm
cm9tIGVsZiBhdHRyaWJ1dGVzLiBJZiBub3QsIGRvIHlvdSBoYXZlIAo+PiBzdWdnZXN0aW9ucyBv
biBob3cgdG8gc29sdmUgdGhpcyBpc3N1ZSA/Cj4gCj4gV2h5IG5vdCBqdXN0IGZhdWx0IG9uIGZp
cnN0IHVzZSB0byBlbmFibGU/wqAgVGhhdCdzIHZhc3RseSBsZXNzIAo+IGNvbXBsaWNhdGVkIHRo
YW4gdHJ5aW5nIHRvIHBsdW1iIGFueXRoaW5nIHRocm91Z2ggZWxmIHJlc3VsdGluZyBpbiBhIHBy
Y3RsLgpXZWxsLCB0aGUgYW5zd2VyIGlzIGluIFZpbmVldCdzIHBhcmFncmFwaCAtLSB0aGUgaGFy
ZHdhcmUgYXBwYXJlbnRseSAKZG9lc24ndCBoYXZlIGZhdWx0LW9uLWZpcnN0LXVzZSB3aGljaCBp
cyBtaWdodHkgdW5mb3J0dW5hdGUuCgpKZWZmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
