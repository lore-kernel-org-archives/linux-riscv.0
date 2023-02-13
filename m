Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD21C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 22:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3u1GCEN3k126lJYR1ZK8l3p/4+VVwWIZZUtTAJ3JEE=; b=0rFr29L5l8Mq4X
	seZ2mq/HLx/IESAbwaunLIx3ExxrPP+9ZUAacrGSu+zbneoRTBXeeTkDDOUn81TYRzasQ5dIvdvXD
	godzF+pn7Js7/R4dtFPj7Q2APRGOUg5/sMmWwf67uCQNNJicJDbz7O6plOGZ1Z5KTaJv48Yqu60OP
	WjyBb6dCi4jn0NkraCVUwrgQNYwCLMM1lToTCPq5PZpodjTqRDx09v9yBcA/9I8eIMXGCr4pTLcRs
	ah3UhoU9H9N/XGvsF89m02TYsn18VfTZsRkwM2ue6lxpSVhEh8jXYk2mZRjcAX/Pr7vT4Lx63cwB6
	LGsUQ+0m01YxRIlrt2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhiK-00GhFc-9m; Mon, 13 Feb 2023 22:54:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhiE-00GhDL-FF
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 22:54:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id ja21so7566353plb.13
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 14:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=522NNid6LgSf8RrS5VU4Hzm30KHabJK+kCnv1UqFDb0=;
        b=mtte59o9IYhPKzWfl/qT9tfiUcxy6kAiA6N3oEJ4/kDtAk6IHaeV8Ah3DKN7hi4djP
         roRG5azvNbUTt71U22BMRTRMmNjtGT0QUT/0tdhFIicPVCYnKF0k/w1B2pV25aPu+3Cc
         xUMDjVcRf+lrvAo0wJWWvjx12ohbRo9ajXkqJ2DACWfl3qX9m/8FuM8q0T22wHgnLcuW
         flpdu4daI+21oLgWczWmJyvsZ91Sg/s2YpEMpxHaSTqmc+fxgasIBV0DpnYorh76uUI+
         uHXUhMsFbSRTnOc6toBJlfTYRj0iYDIAecWaIu1T+ldiRGVlf+WPl2Z9DWIsOIoBLp94
         KRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=522NNid6LgSf8RrS5VU4Hzm30KHabJK+kCnv1UqFDb0=;
        b=dBNjBmGVnzeLfhRP89TXFIAgqhdHpZPpowhPegiTCTvwsj77QQBYG7PdeaMyLPXaCF
         2GFLdNcBXiEq1HU5+CXs85i0Khr9APsNtVFjm4mx3V+RJxai4n/kBQxS9CWPM985BI53
         AXxAZvEtID6F+V6jE9loGO9YmYZ+DYgPhdEcFNDAPekZeQRMWD6l5pKXRUyNfg/LcAzE
         6vLGgNgydFy1St5qp2oqjQEPqPMTqE8b2kzsrSy3vcWqJtL+98si6XDGh0DWSu8LEPbF
         uwa6KlaY92EMhllfx+YrDYUvzxGlteEfg5vmo9rZpVw/wVXPaXus6p7yxu1lW1stuf12
         0eGA==
X-Gm-Message-State: AO0yUKV5HNtay/gzw8STxG6SGIsH3b4woaQSFc/mo/fAnTyQSIUVsxs5
	nMxsuOM59icQFF7gOm8kTO6ISw==
X-Google-Smtp-Source: AK7set9pHsxVA/aZc7KMCzq2WCIjJ4lcMDk1bqdJg3wOOdIz4ZzT5DwjszXnvCGrpL0mXz+ckJW81w==
X-Received: by 2002:a17:903:230a:b0:196:6162:1a76 with SMTP id d10-20020a170903230a00b0019661621a76mr709034plh.0.1676328854376;
        Mon, 13 Feb 2023 14:54:14 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id w12-20020a1709027b8c00b0019a73a45e60sm6614676pll.19.2023.02.13.14.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 14:54:14 -0800 (PST)
Message-ID: <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
Date: Mon, 13 Feb 2023 14:54:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang
 <jszhang@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Guo Ren <guoren@kernel.org>, Li Zhengyu <lizhengyu3@huawei.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <875ycdy22c.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_145418_515378_1F666247 
X-CRM114-Status: GOOD (  12.30  )
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

CgpPbiAyLzcvMjMgMDY6MzYsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+ICtib29sIHJ2dl9maXJz
dF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gK3sKPj4gKwlfX3VzZXIgdTMy
ICplcGMgPSAodTMyICopcmVncy0+ZXBjOwo+PiArCXUzMiB0dmFsID0gKHUzMilyZWdzLT5iYWRh
ZGRyOwo+PiArCj4+ICsJLyogSWYgViBoYXMgYmVlbiBlbmFibGVkIHRoZW4gaXQgaXMgbm90IHRo
ZSBmaXJzdC11c2UgdHJhcCAqLwo+PiArCWlmICh2c3RhdGVfcXVlcnkocmVncykpCj4+ICsJCXJl
dHVybiBmYWxzZTsKPj4gKwkvKiBHZXQgdGhlIGluc3RydWN0aW9uICovCj4+ICsJaWYgKCF0dmFs
KSB7Cj4+ICsJCWlmIChfX2dldF91c2VyKHR2YWwsIGVwYykpCj4+ICsJCQlyZXR1cm4gZmFsc2U7
Cj4+ICsJfQo+PiArCS8qIEZpbHRlciBvdXQgbm9uLVYgaW5zdHJ1Y3Rpb25zICovCj4+ICsJaWYg
KCFpbnNuX2lzX3ZlY3Rvcih0dmFsKSkKPj4gKwkJcmV0dXJuIGZhbHNlOwo+PiArCS8qIFNhbml0
eSBjaGVjay4gZGF0YXAgc2hvdWxkIGJlIG51bGwgYnkgdGhlIHRpbWUgb2YgdGhlIGZpcnN0LXVz
ZSB0cmFwICovCj4+ICsJV0FSTl9PTihjdXJyZW50LT50aHJlYWQudnN0YXRlLmRhdGFwKTsKPj4g
KwkvKgo+PiArCSAqIE5vdyB3ZSBzdXJlIHRoYXQgdGhpcyBpcyBhIFYgaW5zdHJ1Y3Rpb24uIEFu
ZCBpdCBleGVjdXRlcyBpbiB0aGUKPj4gKwkgKiBjb250ZXh0IHdoZXJlIFZTIGhhcyBiZWVuIG9m
Zi4gU28sIHRyeSB0byBhbGxvY2F0ZSB0aGUgdXNlcidzIFYKPj4gKwkgKiBjb250ZXh0IGFuZCBy
ZXN1bWUgZXhlY3V0aW9uLgo+PiArCSAqLwo+PiArCWlmIChydnZfdGhyZWFkX3phbGxvYygpKSB7
Cj4+ICsJCWZvcmNlX3NpZyhTSUdLSUxMKTsKPj4gKwkJcmV0dXJuIHRydWU7Cj4+ICsJfQo+IFNo
b3VsZCB0aGUgYWx0c3RhY2sgc2l6ZSBiZSB0YWtlbiBpbnRvIGNvbnNpZGVyYXRpb24sIGxpa2Ug
eDg2IGRvZXMgaW4KPiB2YWxpZGF0ZV9zaWdhbHRzdGFjaygpIChzZWUgX194c3RhdGVfcmVxdWVz
dF9wZXJtKCkpLgoKRm9yIGEgcHJlZXhpc3RpbmcgYWx0ZXJuYXRlIHN0YWNrID8gT3RoZXJ3aXNl
IHRoZXJlIGlzIG5vIAoiY29uZmlndXJhdGlvbiIgbGlrZSB4ODYgdG8gY3Jvc3MtY2hlY2sgYWdh
aW5zdCBhbmQgViBmYXVsdCBpbXBsaWVzIApsYXJnZSdpc2ggc2lnbmFsIHN0YWNrLgpTZWUgYmVs
b3cgYXMgd2VsbC4KCj4gUmVsYXRlZDsgV291bGQgaXQgbWFrZSBzZW5zZSB0byBpbXBsZW1lbnQg
c2lnYWx0c3RhY2tfc2l6ZV92YWxpZCgpIGZvcgo+IHJpc2N2LCBhbmFsb2dvdXMgdG8geDg2PwoK
SW5kZWVkIHdlIG5lZWQgdG8gZG8gdGhhdCBmb3IgdGhlIGNhc2Ugd2hlcmUgYWx0IHN0YWNrIGlz
IGJlaW5nIHNldHVwLCAKKmFmdGVyKiBWIGZhdWx0LW9uLWZpcnN0IHVzZS4KQnV0IGhvdyB0byBo
YW5kbGUgYW4gZXhpc3RpbmcgYWx0IHN0YWNrIHdoaWNoIG1pZ2h0IG5vdCBiZSBiaWcgZW5vdWdo
IHRvIApoYW5kbGUgViBzdGF0ZSA/CgotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
