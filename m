Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4CDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCc9LDa6HO/uMwAMGcTc4wXDGnwT+AgtFXiLvVpxykA=; b=mPVXjsDWyingN6
	XCGiPJlDGO6Gog+q5t1BXVOI/9oU4f842Su9twGXWBrdu1O1q4BJmCF0ISyUo3C/zZMN+f1hfQ0Yg
	mZwVELiaqKDcYhuzwlyQHdbIaVZPWEBZUCg4IFOKxBYPQgp5vI1qm3Eb/WoKWhUXo5/0gN8kaSKTG
	jpssRC7cW+HnJTVRdsZBbmxQ+Ch/DMN32lNm1HbyLACVn0Ap01PnRzWf2007mQJlx2iameuB1h/zb
	8+vSBAPeNBdGzdibkhLGJHgKLB4eH5ZJ5N1tawuAIaMBlevo3eRUH2/wXqEvP3bn61tz3jGN5QwjW
	wiXlpTVskjsxGOjZ79IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DT3-00B9ql-2z; Thu, 08 Dec 2022 09:45:25 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DLf-00B0wl-9z; Thu, 08 Dec 2022 09:37:48 +0000
Received: by mail-wm1-f44.google.com with SMTP id ay40so627528wmb.2;
        Thu, 08 Dec 2022 01:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE2BRq9L+0PqGquoqVrkYyY0LIMIc6GkCZYnscxNcAw=;
        b=7Ck76qkMbbZpHIvdtXz1N5Rwaq5ixE6VoDAkbryBQWRFjZDKtWRcPxbR6zpczA/h43
         L+9dTmLVViawzsQOB5WTubTfIIC5fdq/W7kGWbk35s0T7tnZHC+mNXPxk8C/91CziFKr
         VJ/rnqvfHlT22Yupz/QkY45MuO0EV34Qqnys8LPl7P219jO3aX0gN5aZmXd8PIZ0Q7mN
         nWcLnffTFgIkjNceg+A+hhnsZZNtYFVznt1xZCKrwIBCasfRyWY3Ge/kg+6N1C7tuCpd
         8QYhJtgdBErcbZn2+xuofUyTMGa8l0Ao7jQlmmcU91tuXhO6pFmiOc35xTiTRnugt3NO
         nlxQ==
X-Gm-Message-State: ANoB5plWnM14aUpvXJ9THz/mNR+hKuyCetE8mi05Yg5TFzoDPKB5WU1C
	xTtkkzTVHqRMW94GBHYe7O0=
X-Google-Smtp-Source: AA0mqf6DS1fgI6lCdD1AjRyLiwjdw5l88iWUrUlwLzQPxLWVmcQUt3zi03en9VlUVHcUhixYmxMjfQ==
X-Received: by 2002:a05:600c:21d8:b0:3d0:8d48:2993 with SMTP id x24-20020a05600c21d800b003d08d482993mr1655335wmj.36.1670492264474;
        Thu, 08 Dec 2022 01:37:44 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id 6-20020a1c0206000000b003d1e90717ccsm4256666wmc.30.2022.12.08.01.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:37:44 -0800 (PST)
Message-ID: <035f431c-15ee-b604-79be-ec2861b45b86@kernel.org>
Date: Thu, 8 Dec 2022 10:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/3] serial: earlycon-arm-semihost: Move smh_putc()
 variants in respective arch's semihost.h
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>,
 linux-serial <linux-serial@vger.kernel.org>
Cc: "catalin.marinas" <catalin.marinas@arm.com>,
 gregkh <gregkh@linuxfoundation.org>, linux <linux@armlinux.org.uk>,
 will <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20221207135352.592556-1-bmeng@tinylab.org>
 <0443d5e9-b2ce-7e6b-c69b-708d67a5bf97@kernel.org>
 <em14380c7e-ee2b-45d5-8879-dde687f03b2b@eea79fc7.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <em14380c7e-ee2b-45d5-8879-dde687f03b2b@eea79fc7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_013747_423633_5E975707 
X-CRM114-Status: UNSURE (   8.51  )
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

T24gMDguIDEyLiAyMiwgMTA6MzIsIEJpbiBNZW5nIHdyb3RlOgo+Pj4gKyNpZmRlZiBDT05GSUdf
VEhVTUIyX0tFUk5FTAo+Pj4gKyNkZWZpbmUgU0VNSUhPU1RfU1dJwqDCoMKgICIweGFiIgo+Pj4g
KyNlbHNlCj4+PiArI2RlZmluZSBTRU1JSE9TVF9TV0nCoMKgwqAgIjB4MTIzNDU2Igo+Pj4gKyNl
bmRpZgo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzbWhfcHV0YyhzdHJ1Y3QgdWFydF9w
b3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFyIGMpCj4+Cj4+IDIpIHBvcnQgaXMgdW51c2VkIGluIGFs
bCBpbXBsZW1lbnRhdGlvbnMuIFNvIGl0IHNob3VsZCBiZSBkcm9wcGVkLgo+PiAzKSBjYW4geW91
IG1ha2UgImMiIGFuIGV4cGxpY2l0IHU4Pwo+IAo+IFRoZSBzbWhfcHV0YyBmdW5jdGlvbiBzaWdu
YXR1cmUgaXMgZGVmaW5lZCBieSB0aGUgdWFydF9jb25zb2xlX3dyaXRlIAo+IGhlbHBlci4gSSBk
b24ndCB0aGluayB3ZSBjYW4gY2hhbmdlIGl0LgoKQWguIE9mIGNvdXJzZS4gVGhlbiBhdCBsZWFz
dCBmb3J3YXJkLWRlY2xhcmUgc3RydWN0IHVhcnRfcG9ydCBoZXJlLiBTbyAKdGhhdCBpdCB3b3Jr
cyBhbHNvIHdoZW4gc29tZW9uZSBkZWNpZGVzIHRvIGluY2x1ZGUgdGhlIGhlYWRlciBvdXRzaWRl
IApzZXJpYWwuCgp0aGFua3MsCi0tIApqcwpzdXNlIGxhYnMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
