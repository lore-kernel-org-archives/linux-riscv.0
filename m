Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077F9EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEiFsaPCprUINhXw2WtaaRkBuQZwyIciIsQxBXpSYJ8=; b=vNd0XWySYIM/Dn
	IvYOM13QUPDs0zq0AvwraAsBqS1CEDFWEkIQIToR5hlaH2LC9vRSgyIeXH/1BsDCpt4uGeyUXjXtY
	6QjvU1+L9+lXm7GEuVpeMYj2YDrsuCoQFCbpF40KQxS0r1kD682nFN1a87A3y3q+YCr2bMYNMDSb+
	ffdjiNIRH5oMUMZicl8mX+6YgFt6I09Fy701HhkWbjIJS49As59+/a+8BKCTKVKUXMOosvoxiBxBy
	2oSmx+OyfPx4NGhx7c8vyS47mIqKnH6S6WHsViYfoTWml7E4zIN8Ty/moIaD7DX3BppqRcLfew70o
	objRoAsastaOGuooCFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHUZ-008uXp-2f;
	Mon, 19 Jun 2023 16:12:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHUX-008uWo-01
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 16:12:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f9b258f3a2so9967825e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687191150; x=1689783150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0/b2EjSkCTg8kSWGnyoY5ofxy0GORXIjVW1oN5fAkI=;
        b=hOrLIhP3eghCi8ZLw5KuAl3EYvGzAwacdIJP8r3PCS8+eO157uGjvOl0mswuigm8i+
         3rWQ4iVLhlnpxk/Ho7ovyZ0ewMaczC27GDpfXoxwkYXAyOj4Rf1tmm6j6zlj33kHuLp/
         nv3BINASFrSa3aEx+PqEDPICI/DnOxY4fFU0PvIR2C5ahPBW5Nr/FVI9rB7k3BCnBB7j
         1EJ9DApUIWAGUguoZ7duFObmn8SNd2WtWGh75XKdVkAXx3x/m4JeApU1bmw4WzQGQTa1
         7snk4W16BWgZgdu8zEnssNTquwTxDF+jkqX9Xb7dtipmQwNeGOzHp3La4kv+BuwkrWgC
         FkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687191150; x=1689783150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0/b2EjSkCTg8kSWGnyoY5ofxy0GORXIjVW1oN5fAkI=;
        b=b3wyCT7ikcXSFkr44jsPRTY6f4SRwY0NUxxuj1tUxkY4L1vAI2xx8M8WBrLskUIJS6
         kARkjyDi5UXAoREH9LCvpVP1nybhdmPaw6KeW71uld/EGzlSeZuGDsZWuTNh1NViPqbD
         SQJfYBYB4QZxgkLeRDsLWVS04+PBrhUoementpGLc+Fn+kADJL6Eo0Rsf2dbQfPrEtiw
         2b+9PjeShrq2cqhnq9/6Rrpu9APGaPP8LB2/Q6cpGbRalOJCq9NRt9IhLHzDgp3rImK4
         f2LdFLTap9P/AI15SuOZqIUIEVpvOxxGw+dxc3AJGArY784amIUipsC4ziywzNnRt6rj
         stBQ==
X-Gm-Message-State: AC+VfDye1fzcj11Nlr9CPaF1UNHcGmq09iSBuLdTS1y7Mm3lsxde/L5X
	6/K3w/22a6/4iS6diK1r8ajFeA==
X-Google-Smtp-Source: ACHHUZ7Jius8lE7B9o8DmcK3xv1xBW2j/h8yXk8k2d4mvYFLUUvsMtvnPOG+51chV5CbC9Tj5mrOeA==
X-Received: by 2002:a1c:ed08:0:b0:3f7:f584:5796 with SMTP id l8-20020a1ced08000000b003f7f5845796mr10625015wmh.2.1687191150340;
        Mon, 19 Jun 2023 09:12:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:13d0:1b6c:ce40:5429? ([2a05:6e02:1041:c10:13d0:1b6c:ce40:5429])
        by smtp.googlemail.com with ESMTPSA id u23-20020a05600c00d700b003f78fd2cf5esm78197wmm.40.2023.06.19.09.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 09:12:29 -0700 (PDT)
Message-ID: <a98f4b5b-5656-a960-61d1-a258a1681784@linaro.org>
Date: Mon, 19 Jun 2023 18:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] clocksource: Add StarFive timer driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230320135433.144832-1-xingyu.wu@starfivetech.com>
 <20230320135433.144832-3-xingyu.wu@starfivetech.com>
 <506c0a1e-a839-c9b7-1b04-7fb3af535fe0@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <506c0a1e-a839-c9b7-1b04-7fb3af535fe0@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_091233_052061_67D1DA05 
X-CRM114-Status: GOOD (  11.48  )
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

T24gMDIvMDYvMjAyMyAxMTo0NSwgWGluZ3l1IFd1IHdyb3RlOgo+IE9uIDIwMjMvMy8yMCAyMTo1
NCwgWGluZ3l1IFd1IHdyb3RlOgo+PiBBZGQgdGltZXIgZHJpdmVyIGZvciB0aGUgU3RhckZpdmUg
Skg3MTEwIFNvQy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWGluZ3l1IFd1IDx4aW5neXUud3VAc3Rh
cmZpdmV0ZWNoLmNvbT4KPj4gLS0tCgpbIC4uLiBdCgo+IEhpIERhbmllbCBhbmQgVGhvbWFzLAo+
IAo+IEkgaGF2ZSBzdWJtaXR0ZWQgcGF0Y2hlcyBmb3IgVGltZXIgZHJpdmVyLiBDb3VsZCB5b3Ug
cGxlYXNlIGhlbHAgdG8gcmV2aWV3IGFuZCBnaXZlIHlvdXIgY29tbWVudHM/CgpZb3UgdG9sZCBp
biB0aGUgc2VyaWVzIHlvdSB3aWxsIHNlbmQgYSBuZXcgdmVyc2lvbgoKCi0tIAo8aHR0cDovL3d3
dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xp
bmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRl
ciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
