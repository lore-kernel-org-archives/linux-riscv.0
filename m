Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CBDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHB9jfA/1ON0Wm8t8tqTRhnko2l0tgZ4jl2wVKVQIJc=; b=cZ3UmtYDT3rSI9
	FN7TiG9ejRpOVZuX6KG3S10rz5R6qpcYeaOGowXPMjmFLDv2I6qUCRy1HKjg7zz6ZjthHi1RlGosD
	ehyyCnxtGQb3KvzOj6CnZwSg2KTAOIitYVu1+v6ihffFw7E9hWqz6l7FWnu031c4G7nUgl7Ok429J
	83IxbOtr8K9nhvIMJhgDPkQEkxIM02ZHxp694G5n+KWdjpPBhPS7wwiQoVC4IhNM0MSGsE/bzXYwz
	TAK1TOx6C5jbZo92gwEXxyIkalyx/qn5bD514oEYSiUIi6f+oFY1guspaWI/3RwQsCU4Op8XpryEP
	ReUzbUV4lFefgLIxExiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVOi-00FuoR-0J;
	Wed, 13 Dec 2023 20:00:00 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVOf-00Fumq-2c
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 19:59:59 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so6990001276.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 11:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702497596; x=1703102396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s31Qnl2jy9dVbfR9SU0O1e0gpO4gYzM2ckO1KK9cNWQ=;
        b=F5PsVZ4fYRGN2sFhdUUE1akXMHWtiKha6zu2EF3X0PNhBgzXJeeFrrDDFd2b4Is5GJ
         B8nfX1Etr5v9wYzewaLA4Z4CM4t2/I5i2QZAyyjWY7eSqVt5OcEv/9WQpwsltcXq4DB0
         iTYad6FB0i5fWi1gHf6yJyhzLd3QKBOVyI992s37DEm7B+Z10w/oHsWsLXPirjCwoI1I
         6bOP+IfGFoQvrVLvSlpBLToktOH7EQO9bH1WGDf3wOSChHlH886u+lkDafQTwq732bVk
         9l6fqtVSbzR3UtbkFPfMIGj7zR5d/1Cn8lvXFKxC81P8o/IaCHz26v52h7tfCIGEqFcT
         vQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702497596; x=1703102396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s31Qnl2jy9dVbfR9SU0O1e0gpO4gYzM2ckO1KK9cNWQ=;
        b=ZTy9jFP97umRFm/Pd7Goui3Ju0F+nVefpOU2rSN2OWSzPzjeVDqxZB20/jl3vCfaeK
         iJeeQuhYw6hLx3+1MeSxYPh2dX4IIwMLrMW/ismKT9omDMdCz7+N3Z4w8aX7kFvr79Yg
         flA8Et7FXber4T89cU8siSfSokU7fZwp/sUrm6zknTqbNW/WNXJVf+LpvfvwiTshQouE
         dcvVah5wEdu6s+xppziEGg5Upl/ZS8j7IpVd4JjBIEPi9kzkdH0YRfFY5QXyjOmgi3XR
         oNQSi3QGTefE7cMXMds7qZH6lSVHa5FY4DJi/ucjax6YQR7EGGMeH+eHYOQxXRu7Nfvw
         QFDQ==
X-Gm-Message-State: AOJu0YzkUuidAYDoqkwUQbN0vXufDoGjvltRqmpyI9paIpBs8p/f5uk9
	EfyrYaPKXmnIm2kDlrEtaXb2w/65MZ/0fj7QM82ASg==
X-Google-Smtp-Source: AGHT+IGoanEfSAfWqtQw7++5uapiVETyiSe4lA5KkKISTBsZpDDCHd2EgxZu4V1rN9q+R/qEjWhYJ9uGnGBTlEe8bKg=
X-Received: by 2002:a25:6ac4:0:b0:db7:dacf:3fb6 with SMTP id
 f187-20020a256ac4000000b00db7dacf3fb6mr4418808ybc.99.1702497596004; Wed, 13
 Dec 2023 11:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org> <20231122-arm64-gcs-v7-20-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-20-201c483bd775@kernel.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 13 Dec 2023 11:59:45 -0800
Message-ID: <CAKC1njQVB71A8fQBLmBnx++agM12XDLhS=7iL7-A4NTXSqUM+A@mail.gmail.com>
Subject: Re: [PATCH v7 20/39] arm64/gcs: Context switch GCS state for EL0
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_115957_853681_173BAAA9 
X-CRM114-Status: GOOD (  10.18  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTo0NeKAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gKwo+ICsvKgo+ICsgKiBBcHBseSB0aGUgR0NTIG1vZGUgY29uZmln
dXJlZCBmb3IgdGhlIHNwZWNpZmllZCB0YXNrIHRvIHRoZQo+ICsgKiBoYXJkd2FyZS4KPiArICov
Cj4gK3ZvaWQgZ2NzX3NldF9lbDBfbW9kZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCj4gK3sK
PiArICAgICAgIHU2NCBnY3NjcmUwX2VsMSA9IEdDU0NSRTBfRUwxX25UUjsKPiArCj4gKyAgICAg
ICBpZiAodGFzay0+dGhyZWFkLmdjc19lbDBfbW9kZSAmIFBSX1NIQURPV19TVEFDS19FTkFCTEUp
Cj4gKyAgICAgICAgICAgICAgIGdjc2NyZTBfZWwxIHw9IEdDU0NSRTBfRUwxX1JWQ0hLRU4gfCBH
Q1NDUkUwX0VMMV9QQ1JTRUw7CgpJZiB0aGUgaW50ZW50IGlzIHRvIGRpc2FibGUsIGlzIHRoZSBH
Q1Mgc3RhY2sgZnJlZWQgb3Iga2VwdCBhcm91bmQ/CkkgZXhwZWN0IGlmIGxpYmMgaXMgdGFraW5n
IHRoZSBkZWNpc2lvbiB0byBkaXNhYmxlLCBrZXJuZWwgc2hvdWxkIGZyZWUgaXQgdXAuCklzIGl0
IGZyZWVkIGluIHNvbWUgb3RoZXIgZmxvdz8KCj4gKwo+ICsgICAgICAgaWYgKHRhc2stPnRocmVh
ZC5nY3NfZWwwX21vZGUgJiBQUl9TSEFET1dfU1RBQ0tfV1JJVEUpCj4gKyAgICAgICAgICAgICAg
IGdjc2NyZTBfZWwxIHw9IEdDU0NSRTBfRUwxX1NUUkVuOwo+ICsKPiArICAgICAgIGlmICh0YXNr
LT50aHJlYWQuZ2NzX2VsMF9tb2RlICYgUFJfU0hBRE9XX1NUQUNLX1BVU0gpCj4gKyAgICAgICAg
ICAgICAgIGdjc2NyZTBfZWwxIHw9IEdDU0NSRTBfRUwxX1BVU0hNRW47Cj4gKwo+ICsgICAgICAg
d3JpdGVfc3lzcmVnX3MoZ2NzY3JlMF9lbDEsIFNZU19HQ1NDUkUwX0VMMSk7Cj4gK30KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
