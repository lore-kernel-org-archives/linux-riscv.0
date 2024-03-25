Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B8EC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKy0zhKPjyz2LrZgOr9f0OloQGM5S4tuslQSUpwTpNM=; b=C7EUrrmlwJ8GAM
	+X0VH7YWMEev72O1merB6jLpR9czD8rVfQoLnEEaVoFVF33pORGccaNRmLAawyb/JJbU5bUG25Xvi
	CqBK5sgyH4MIfDu1MxSOkon2uHd+zXt88OhVOyWioyGqp/WqGH4p9aaS8VJKwg4dnBrkmuhTlj+qo
	/H27jxLzBLe4oFQqDGovLk+eAiUF787aiWs0hxjKKz27uboruMqRrlhI2XyFpR6f92PZ6/MZAgNDW
	03uOGfRvKIrbFHVwIk4NehIJQ/SBJbQpHgUHkJybmH9kL/noXj+CWToShqp33JP+6wjfRfz6TFnsn
	lvi22+KiWA17KKPj4T9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofxy-0000000GEt6-1Ngc;
	Mon, 25 Mar 2024 08:46:02 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofxr-0000000GEoT-08Ca
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 08:45:56 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3688d20b28dso3696225ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1711356353; x=1711961153; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAJj9egrVyRikkG0RKQceibcTBuLJH9YKNRRgrENxgU=;
        b=EFJDzx9iUyMo+cuWbmeX6N5FS2zzWkgiNfU0o7bt2wCypLFei1aH8RMURJBLXEosHg
         UpTjUjRbABTW2bH2NYAQTJ/RudgAEzQR+UJ5+2Lt1W6cKXLqNYtIJqwpkZ2d4ijNKCl3
         wjAe2/nX1SpSHalmfts48UTBcDdOD1o5h6UW28mXHmAJhd2IZIy0TdO9lb/GBBNrgvg4
         Y+ACUpDX5ynbQGLF3rQLc8CQ1GJFFvHyQCpHQPFMxpp6XAROZFs9T8gBQuDxJXsRjQYy
         l5ZJXiME1u/tgEPMg4RBaGJJIjtqbTZU+EW84P5ZhpxzeNlAzXSBMjaAJfnB6T49oVMF
         CZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711356353; x=1711961153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAJj9egrVyRikkG0RKQceibcTBuLJH9YKNRRgrENxgU=;
        b=YF+3boOP7LefX1M8WYPUYynbKbkC/p79Bph3z9gK+3765QCKB9+XUDOlmiMMfasTKd
         i5Zb0nYSOuB78TNI0bOjc6mMy8hux3cAV6d/qoGeapLc9e2Vd36nzuKdBxqs4g6fvmyD
         R4kjx/vaBJmYPW4G0asbxong4EBg+UlWR7eyLIq9NPz5DDDzKJ8AOsrUie4XEh75nyj9
         8//3c1qUHDhzGRyiEZmI6WWR8f/GVynPMP/bEPHHa/vIAnUAhbST3T3TwOBgviAPcf3y
         R77L1Zq2ey9BNMqt79atVNh4ZtJxTBKef6DZyem8iGQ4ugLEMvUoCLK0Y8TdwVcpIHZ+
         ypbg==
X-Forwarded-Encrypted: i=1; AJvYcCW9+cvzr8JVWOgfYmjvu/0tXeYmB7bPIQBNRbUuCrhuvmAIxATPLpgcW1A8bdtvd7Os2eLUUD8DbZ/i+0D4CifmYmqR7JSRObAFkaFJcbxf
X-Gm-Message-State: AOJu0YyxC/Z5n/kP8S/PoiTY0Wx1ABdbYB4tklayi9mvEpkgRKqoelKQ
	NReKmP8E632hr8XM72dTHXlx8vd9oOv1afvGCBMibu1r6xpP8vl16I//NF82rQNAmpCOjISkVej
	oKMedX8+Z6tmiqeVZKcJMqyivSi0JX3Maa+Ugfg==
X-Google-Smtp-Source: AGHT+IFVuCUCa9T26qI8wOCmAKjs5jQ0HPi7rCqnQz+zQAp9mUrZiWSUVy4an898YpR/XXTQ+Vy8tiAEK/p3ABMeQm0=
X-Received: by 2002:a92:ce04:0:b0:368:4766:ad75 with SMTP id
 b4-20020a92ce04000000b003684766ad75mr7623231ilo.10.1711356351275; Mon, 25 Mar
 2024 01:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240307081951.1954830-1-colin.i.king@gmail.com>
In-Reply-To: <20240307081951.1954830-1-colin.i.king@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2024 14:15:40 +0530
Message-ID: <CAAhSdy2zg4dD6_hKOWDuXxxcpiiu1RwpeL_h6-hvm+Y2B1hEeQ@mail.gmail.com>
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake "trigged" -> "triggered"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_014555_264438_0F4FC710 
X-CRM114-Status: GOOD (  12.82  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCAxOjQ54oCvUE0gQ29saW4gSWFuIEtpbmcgPGNvbGluLmku
a2luZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIHNwZWxsaW5nIG1pc3Rha2VzIGlu
IF9fR1VFU1RfQVNTRVJUIG1lc3NhZ2VzLiBGaXggdGhlbS4KPgo+IFNpZ25lZC1vZmYtYnk6IENv
bGluIElhbiBLaW5nIDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPgoKUXVldWVkIHRoaXMgcGF0Y2gg
Zm9yIExpbnV4LTYuOSBmaXhlcy4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jIHwgMiArLQo+ICB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jICAgfCAyICstCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYwo+IGluZGV4IGRkYmEy
YzJmYjVkZS4uMTZhYzc0ZDA3ZDY4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYwo+IEBAIC0xMzYsNyArMTM2LDcgQEAgc3RhdGlj
IHZvaWQgZ3Vlc3RfcnVuX3N0YWdlKHN0cnVjdCB0ZXN0X3ZjcHVfc2hhcmVkX2RhdGEgKnNoYXJl
ZF9kYXRhLAo+ICAgICAgICAgICAgICAgICBpcnFfaXRlciA9IFJFQURfT05DRShzaGFyZWRfZGF0
YS0+bnJfaXRlcik7Cj4gICAgICAgICAgICAgICAgIF9fR1VFU1RfQVNTRVJUKGNvbmZpZ19pdGVy
ICsgMSA9PSBpcnFfaXRlciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb25m
aWdfaXRlciArIDEgPSAweCVseCwgaXJxX2l0ZXIgPSAweCVseC5cbiIKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIgIEd1ZXN0IHRpbWVyIGludGVycnVwdCB3YXMgbm90IHRyaWdn
ZWQgd2l0aGluIHRoZSBzcGVjaWZpZWRcbiIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICIgIEd1ZXN0IHRpbWVyIGludGVycnVwdCB3YXMgbm90IHRyaWdnZXJlZCB3aXRoaW4gdGhl
IHNwZWNpZmllZFxuIgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAgaW50ZXJ2
YWwsIHRyeSB0byBpbmNyZWFzZSB0aGUgZXJyb3IgbWFyZ2luIGJ5IFstZV0gb3B0aW9uLlxuIiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZpZ19pdGVyICsgMSwgaXJxX2l0
ZXIpOwo+ICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vcmlzY3YvYXJjaF90aW1lci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2FyY2hfdGltZXIuYwo+IGluZGV4IGUyMjg0OGY3NDdjMC4uMGY5Y2FiZDk5ZmQ0IDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiAr
KysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jCj4gQEAg
LTYwLDcgKzYwLDcgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfcnVuKHN0cnVjdCB0ZXN0X3ZjcHVfc2hh
cmVkX2RhdGEgKnNoYXJlZF9kYXRhKQo+ICAgICAgICAgICAgICAgICBpcnFfaXRlciA9IFJFQURf
T05DRShzaGFyZWRfZGF0YS0+bnJfaXRlcik7Cj4gICAgICAgICAgICAgICAgIF9fR1VFU1RfQVNT
RVJUKGNvbmZpZ19pdGVyICsgMSA9PSBpcnFfaXRlciwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJjb25maWdfaXRlciArIDEgPSAweCV4LCBpcnFfaXRlciA9IDB4JXguXG4iCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiICBHdWVzdCB0aW1lciBpbnRlcnJ1cHQg
d2FzIG5vdCB0cmlnZ2VkIHdpdGhpbiB0aGUgc3BlY2lmaWVkXG4iCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiICBHdWVzdCB0aW1lciBpbnRlcnJ1cHQgd2FzIG5vdCB0cmlnZ2Vy
ZWQgd2l0aGluIHRoZSBzcGVjaWZpZWRcbiIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICIgIGludGVydmFsLCB0cnkgdG8gaW5jcmVhc2UgdGhlIGVycm9yIG1hcmdpbiBieSBbLWVd
IG9wdGlvbi5cbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25maWdfaXRl
ciArIDEsIGlycV9pdGVyKTsKPiAgICAgICAgIH0KPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
