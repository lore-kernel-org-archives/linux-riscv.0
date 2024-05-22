Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0316C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nX6c/N/qgExWcSLCRSiv6tmjU4bz3USQ0vCsh2xiyS4=; b=fYy+ZwGOMKWzYI
	LQ3rDHfX4vFyvZMU43bvHeHM3Pbou6EHvw3L5eSESY4rSlUGURcDi/cJbWDm3FrI+hgUM/7Fsa25k
	1inejkBNtVfUkxlNUoexmPB4ZpWiU7iuLeBc8y9QD5YiaGrTaR379Hf+CRuO4bUSwCsxflrgT1Qqd
	n66sgxz3l6ahvNXWeiEspyBKw3VqblO5IUACGilIzCRAw52nKYEWm4C0ohYWAWnKqBCX0HFV5GMNB
	l74FfN/0+L6rIWZIwV+HlJhcC+EIQlFCmCWTWoqv6hekDfodVhfeVDQesE6tVxXVt57hM+Y/0I9vC
	1fUR9fmyC5Wwyyh3yR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gGp-00000002CeM-3rvQ;
	Wed, 22 May 2024 07:20:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gGl-00000002Ccm-3zJZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 07:20:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-354c82fb42eso131039f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716362411; x=1716967211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMBhFPY2RLtVbP9uMG/kHTkoH5FQv+/qbKIQ531cWpY=;
        b=DA+lu6eqKcvqn4mC0523ldTWyrcrIvF/Wn5uzMm5jCPtD5jI3HWaHC0peLIKQ2/M1a
         au7svVMmi9QJBCDYHEDAkD4t8UotV8ykBLh2NXX/gu2czso1RWDY5yIwp8Y2JQcgdVAm
         NgGaCPTH0F6c6nMA7DhX0Mz1tCw1ekD06sKnRkdDlT2NjZwFg2YG+6SJPZew+Cf9lqFl
         V4TMvLzJF0C4BXcJpKB3eOQ73ULyAzrkoAghvWC/ff8O6janNsOwJBAMRzz+6izjFpaK
         ATP3jHL7tjMssz6yXptX8d6xOUf8hk/7rfbc2Y/bRNllfF0Fmnn6/BGkv5CCdZVqbzyJ
         nV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716362411; x=1716967211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMBhFPY2RLtVbP9uMG/kHTkoH5FQv+/qbKIQ531cWpY=;
        b=H95DiYooy0AcqnJS4CW1NxbMs8Tkx6ENSBecgyfcUew4lIr4wi+l5tZavYbPvGK3du
         ggJuYMoF3kPid8VVTG9FBxGgXDBk7VJ0fNBpFkTmK2rNE+FYtviPzfk7HV2z4oBRNYcp
         22tIuB5iJFDsWTtp6mfd7DBFi24+xsHtY/K6qFVE6VoMpw2iG9b8HpEvIrqDhz32Tnmr
         34gG+OZUYoR/B6YFW5bsirsmeCaDI+RVljplLC0np+zzg4XPGb6wTssGAt7gC6RYjkbn
         menDbXv0ToKqhU/iodCM/3/VgGpIJHe0C8wd/dfPaC9Amhe2rnZW7PjArQkERRwBqyEQ
         H2HA==
X-Forwarded-Encrypted: i=1; AJvYcCU40QNnBzBl4RgGUQXLTm4kl4Sk3omcOfcTsj1//JL/yTxfHpo2fgPpUQ3FK+rJ03uxi9GACyjKkWEAE8bhZ/IhJx2+E5u4FBIBMuS6SNeO
X-Gm-Message-State: AOJu0Yxmsy15J6dhNnj7v5QjyC45EoECMywTTCSVZ3AjFNeFzW1kQOHD
	MI008OgZG3gsH5IAyLsmyjBjNYV9YqCfhawZXS8m8UoNbkBT/yYcdYk16DRClWo=
X-Google-Smtp-Source: AGHT+IHWVY+wf0lMzIRvSFmzGRBEtlk7+RZmAm7eEQ/Zt8L9I28gKKUkeR8X87R48p3Psaag4VJcvQ==
X-Received: by 2002:adf:f5c3:0:b0:34e:bdf9:32ff with SMTP id ffacd0b85a97d-354d8c7c2a0mr765925f8f.1.1716362411076;
        Wed, 22 May 2024 00:20:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:2d44:5824:d42d:899? ([2a01:e0a:999:a3a0:2d44:5824:d42d:899])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad037sm33448437f8f.71.2024.05.22.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:20:10 -0700 (PDT)
Message-ID: <de2c9064-bb01-42b2-9c0f-884dcabf7c40@rivosinc.com>
Date: Wed, 22 May 2024 09:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-9-cleger@rivosinc.com>
 <20240521-spiny-undergrad-efa1a391ad3d@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240521-spiny-undergrad-efa1a391ad3d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_002016_224462_45890E53 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMS8wNS8yMDI0IDIxOjQ5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gRnJpLCBNYXkg
MTcsIDIwMjQgYXQgMDQ6NTI6NDhQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IAo+
PiArc3RhdGljIGludCByaXNjdl9leHRfemNhX2RlcGVuZHMoY29uc3Qgc3RydWN0IHJpc2N2X2lz
YV9leHRfZGF0YSAqZGF0YSwKPj4gKwkJCQkgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1h
cCkKPj4gK3sKPj4gKwlyZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2Ff
Yml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgPyAwIDogLUVQUk9CRV9ERUZFUjsKPj4gK30KPj4g
K3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZF92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNh
X2V4dF9kYXRhICpkYXRhLAo+PiArCQkJCSAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1h
cCkKPj4gK3sKPj4gKwlyZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2Ff
Yml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgJiYKPj4gKwkgICAgICAgX19yaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpID8gMCA6IC1FUFJP
QkVfREVGRVI7Cj4+ICt9Cj4gCj4gQ291bGQgeW91IHdyaXRlIHRoZSBsb2dpYyBpbiB0aGVzZSBv
dXQgbm9ybWFsbHkgcGxlYXNlPyBJIHRoaW5rIHRoZXknZAo+IGJlIG1vcmUgdW5kZXJzdGFuZGFi
bGUgKHBhcnRpY3VsYXIgdGhpcyBzZWNvbmQgb25lKSBicm9rZW4gZG93biBhbmQgd2l0aAo+IGVh
cmx5IHJldHVybi4KClllcyBzdXJlLiBJJ2xsIHByb2JhYmx5IG1ha2UgdGhlIHNhbWUgdGhpbmcg
Zm9yIHpjZl92YWxpZGF0ZSBhcyB3ZWxsIGFzCnJlbW92aW5nIHRoZSAjaWZkZWYgYW5kIHVzaW5n
IElTX0VOQUJMRUQoKToKCnN0YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZl92YWxpZGF0ZShjb25zdCBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAoJCQkJICBjb25zdCB1bnNpZ25lZCBsb25n
ICppc2FfYml0bWFwKQp7CglpZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQoJCXJldHVybiAt
RUlOVkFMOwoKCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAs
IFJJU0NWX0lTQV9FWFRfWkNBKSAmJgoJICAgIF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFi
bGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9mKSkKCSAgICAgICByZXR1cm4gMDsKCglyZXR1
cm4gLUVQUk9CRV9ERUZFUjsKfQoKPiAKPiBPdGhlcndpc2UsCj4gUmV2aWV3ZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gQ2hlZXJzLAo+IENvbm9y
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
