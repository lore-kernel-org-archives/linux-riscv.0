Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE6C3A59D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 05:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGrCuizVkhVI8sYjwbcTj5HQls6kTGKMtxM8hbZk5r8=; b=fpqZyOaj63770G
	GgUVHPoURgbKu4gABoocM1XMBuP9SLB0SQUVw0IB8TKHw9X8HGqYpxBA9TQOApnZenCgEnlHxcaEq
	k2wbygrInRQcNrd/sqZkpzdnOh8pGq482x3ZfmPOkoWbZ8dmJkThYEluPCBTO890ejshDNdNHECbE
	fgJRfGvVqy32wP6K4rrx8Do+K+CgrF4G6bW/rd3+gC5jOp+4CPrVFyEkNyy5GDW9YQH28bxGwgFqU
	jJOsuUyQiroc1enuX7+0abJ8IxZci8F+4uD2fGRGc7P607uKX7UGvkEASLG2te6FeE2Rg3UrTqnsB
	20NEIiENx3YGteQi8Zlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ompxg-00HB7X-8h; Mon, 24 Oct 2022 05:25:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ompxc-00HB6U-Ub
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 05:25:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id g12so1572203wrs.10
        for <linux-riscv@lists.infradead.org>; Sun, 23 Oct 2022 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZk2YhOyCsD5JgZA8622Psb4g9tdzFicF6waMAEX+tE=;
        b=sGYDK7eIYH5PqH/5Acy0XyaEjCscnyemwFKPlv0plAI4IwAFCznfoGKOXs1a7qYDrr
         ly2ism/XDhfqN7P+LUkOQ+8zw1DW3s9014bL3MpmA/VeepyZ997065xLFYnKak1tqGkq
         FoBa0umV34QeH83RdEplTs4i5Q4cLt0MSci1zU3y4K+5MRKk5kvOo6/OmTyP65vvmeaX
         Q5fVy3H/6NpDIslefYS/jRvBlP4GCt+4AychccYkqmARW0YsM+HURsaQVLlgY4KIgMaO
         8B0U5afdOstZ9Xnrvl2gDFtoZcogvKS6fdmiHd2ZOE5f9wxSOHws4RH0J6kyMAnRSo9m
         cgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZk2YhOyCsD5JgZA8622Psb4g9tdzFicF6waMAEX+tE=;
        b=G32jaIfKDOqC7EMjkmQhCOxZZs2tJV5agTnFZsBV0xetqUNwhyvUygzCpovZby3USb
         LKPMBoT0H0JlpcCTSxRlDaFgGJovxcSEBixbdgwGqx2kaL6ak7jwTp0VYVdMxdSfFLpf
         KsD8fF59J//yAxjKxDhAUnajMdAge8Hb0Ecq1yN77huwHvjdJgkCQZEmssFv3Vl7SkRj
         Hf8Y/91fo+WHIEpbSV+6H4ezanhHl6yAIDdyr6a/mVoZubXmWz2hzeRoaDbRzQmIH9h2
         ILEy4lK+NWQA4A4oGh67h65XaO4UfAlOqezghyvXdNx4NcDfyGi4jKqCHF+re3cJd3BT
         inPQ==
X-Gm-Message-State: ACrzQf3ySIMjNhsrpw9SweRW6JZtwFK0K/+GZFFLAeHPKbG2CACDZhc8
	WzchpScLS1SzlOu2MJaXJwgPfQ==
X-Google-Smtp-Source: AMsMyM6QxHnKrRaxO/sgu91YoPZwLII9g5woi4tdrjAvc7GmkjpM0AXJ+q3phtLN49229n5kcuKDXw==
X-Received: by 2002:adf:e196:0:b0:236:740f:f234 with SMTP id az22-20020adfe196000000b00236740ff234mr996926wrb.518.1666589113331;
        Sun, 23 Oct 2022 22:25:13 -0700 (PDT)
Received: from [10.50.0.10] (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003c6f27d275dsm7317108wmq.33.2022.10.23.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:25:12 -0700 (PDT)
Message-ID: <5f4b9276-92bf-2e04-8a42-8f416526b3a6@linaro.org>
Date: Mon, 24 Oct 2022 07:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/2] stackprotector: move CANARY_MASK and
 get_random_canary() into stackprotector.h
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chris Zankel <chris@zankel.net>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren
 <guoren@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rich Felker <dalias@libc.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org
References: <20221023203208.118919-1-Jason@zx2c4.com>
 <20221023203208.118919-2-Jason@zx2c4.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221023203208.118919-2-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_222517_008745_683B0BA3 
X-CRM114-Status: GOOD (  11.41  )
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

T24gMjMvMTAvMjIgMjI6MzIsIEphc29uIEEuIERvbmVuZmVsZCB3cm90ZToKPiBUaGlzIGhhcyBu
b3RoaW5nIHRvIGRvIHdpdGggcmFuZG9tLmMgYW5kIGV2ZXJ5dGhpbmcgdG8gZG8gd2l0aCBzdGFj
awo+IHByb3RlY3RvcnMuIFllcywgaXQgdXNlcyByYW5kb21uZXNzLiBCdXQgbWFueSB0aGluZ3Mg
dXNlIHJhbmRvbW5lc3MuCj4gcmFuZG9tLmggYW5kIHJhbmRvbS5jIGFyZSBjb25jZXJuZWQgd2l0
aCB0aGUgZ2VuZXJhdGlvbiBvZiByYW5kb21uZXNzLAo+IG5vdCB3aXRoIGVhY2ggYW5kIGV2ZXJ5
IHVzZS4gU28gbW92ZSB0aGlzIGZ1bmN0aW9uIGludG8gdGhlIG1vcmUKPiBzcGVjaWZpYyBzdGFj
a3Byb3RlY3Rvci5oIGZpbGUgd2hlcmUgaXQgYmVsb25ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KPiAtLS0KPiAgIGFyY2gveDg2L2tl
cm5lbC9jcHUvY29tbW9uLmMgICB8ICAyICstCj4gICBhcmNoL3g4Ni9rZXJuZWwvc2V0dXBfcGVy
Y3B1LmMgfCAgMiArLQo+ICAgYXJjaC94ODYva2VybmVsL3NtcGJvb3QuYyAgICAgIHwgIDIgKy0K
PiAgIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyAgICB8ICAyICstCj4gICBpbmNsdWRlL2xp
bnV4L3JhbmRvbS5oICAgICAgICAgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRl
L2xpbnV4L3N0YWNrcHJvdGVjdG9yLmggfCAxOSArKysrKysrKysrKysrKysrKysrCj4gICBrZXJu
ZWwvZm9yay5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
