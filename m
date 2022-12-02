Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75277C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uo644jHtNvgA7TLEHNe02U0bI2KCuCvqirziMRAeO84=; b=LibxG4DIloLhP0
	N+lKM58AysxTyJwIAYc7rxD5xTiLCVSAXeOyQMscHVnNYeiZYlMFjrMtKOkxQXfYtWOJSWNS60Jek
	e0LC3IiDJnywdXwdz1fo3jTQosMLFokihyIgNcskKB+98BZ1wfCf1QxP7YGvSYM/Y5FYxn0rYEraL
	kv3wmEb+t3q4hdYXLw35EUmyAvbdn2x6kQZwiZoednrDromlfOznNH7MwvKSkU1xN05SBmqJTkzjK
	89Rv9WWBQJdvMtjkc12nE0ONXCDoKC5tL4YtRhYur9KY+Oj2alkTJ0ED1xN37YLm21UFCMemvdWam
	jhR38oK3QAs0Jj9YmRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14wp-00GG5f-5h; Fri, 02 Dec 2022 12:15:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14we-00GG1m-Tp
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 12:15:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id h4-20020a1c2104000000b003d0760654d3so4921103wmh.4
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLJHQPjamDL27wduKFuQu6Tat6NkRXHcc8EKAf/7bjo=;
        b=zqzk4cWnOT349WQSBXHpmaWCyctN5lEXHKz+80VGXDeWCINu57E1Ml3nRl7P/rDcPu
         qQ2bqeoyiE7P83Ml2GhHuwCaydOy/SgAoLdoxD8ayKvHG77tZ0j7X+WIjOr00Z6xAhu5
         Le4z8tWVYAk98TK8udYkfCjxWxIJZCGo9h56VG5GvLRpmetrS8hEbZIu16Nx5WcbqRLI
         51JHeb1PVYX/KOyB/kRHnebCpPL4GB97o7wVYhO7seX6XPgYdmzkRRGyO307JCeD4hny
         WBcyJUekuiCG2jOXnad5pEdrBs+BZT3lrvv+9SiwsdjKwJc5WEKj4QiekJZATrDE/lnc
         akeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLJHQPjamDL27wduKFuQu6Tat6NkRXHcc8EKAf/7bjo=;
        b=m3FWooKnwvwd1XP3LGbsB0JemS+myhEXJphczRtVQhVftIj1UHkh6pGb9bBawPNcNr
         JNrDAAfTcicui0O1HhbO+oKb77xF2JlYUqflFfJbOYQuMMzezAMP8rMVsxt1c0ACSbtK
         4LzNtMFysfTXnwkl614Y1v5DOsoJuxOepyxMj2ubvRFdb6opVMmLJ9uP/nzIvhDY7Vtd
         iiCKKQaVqwT1mMdDkce6627sAEtGfZ9rfaqVD7HeNNRYy9VJnzPiTlocRF3DX2k9EqTp
         soGGRuOyNqtPo/zTe3MB2DH4ryDTWG4gJAMvO23Ig0L3deu+YH23O1ZcZiyhReKWW0+g
         0k0g==
X-Gm-Message-State: ANoB5pm2brqi8WCwxfDF6OhLd5/X+gpSQyVMxTJ5L6wat6D4c0JfsHoa
	AkF/wplhum9RiEtMfO8bzcRfvw==
X-Google-Smtp-Source: AA0mqf4CysiOFh04+gXlHx3kv/Js467iK9kPm1nvc2vhmMlmpvRnbl48wu/hPk1TPJs4tVw7rtya2w==
X-Received: by 2002:a05:600c:5127:b0:3cf:a4c4:777e with SMTP id o39-20020a05600c512700b003cfa4c4777emr45731137wms.72.1669983307502;
        Fri, 02 Dec 2022 04:15:07 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id h34-20020a05600c49a200b003d0701ade2asm8858766wmp.7.2022.12.02.04.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 04:15:07 -0800 (PST)
Message-ID: <0a7abc7c-9a02-c4c5-4864-ad7662b3f06f@linaro.org>
Date: Fri, 2 Dec 2022 13:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Revert "clocksource/drivers/riscv: Events are stopped
 during CPU suspend"
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: tglx@linutronix.de, Conor Dooley <conor.dooley@microchip.com>,
 samuel@sholland.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 dmitriy@oss-tech.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20221023185444.678573-1-conor@kernel.org>
 <9d0211d8-eefe-9464-940f-ac113ddbb0a7@linaro.org> <Y4nqHl8mjbsRj7On@spud>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y4nqHl8mjbsRj7On@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_041508_999608_E9E5B2C3 
X-CRM114-Status: UNSURE (   8.87  )
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

T24gMDIvMTIvMjAyMiAxMzowNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIEZyaSwgRGVjIDAy
LCAyMDIyIGF0IDAxOjAyOjIwUE0gKzAxMDAsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBPbiAy
My8xMC8yMDIyIDIwOjU0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBGcm9tOiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4KPj4+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgMjMyY2NhYzFiZDliNWJmZTczODk1ZjUyN2MwODYyM2U3ZmEwNzUyZC4KPj4+IElmIGFuIEFY
SSByZWFkIHRvIHRoZSBQQ0llIGNvbnRyb2xsZXIgb24gUG9sYXJGaXJlIFNvQyB0aW1lcyBvdXQs
IHRoZQo+Pj4gc3lzdGVtIHdpbGwgc3RhbGwsCj4+Cj4+IEFwcGxpZWQsIHRoYW5rcwo+IAo+IEhl
eSBEYW5pZWwsCj4gCj4gTG9va3MgbGlrZSBUaG9tYXMgYWxyZWFkeSB0b29rIHRoZSB2MiBvZiB0
aGlzIHBhdGNoOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNjY5ODkzMTkwNTIuNDkw
Ni4zOTM0MzYwMTUwODYyMjMzMjEwLnRpcC1ib3QyQHRpcC1ib3QyLwoKT2ssIHRoYW5rcyBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuIEknbGwgZHJvcCBpdAoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZv
bGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNl
Ym9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
