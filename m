Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9FC54E76
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 22:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITSZSx/STG+3tcQJs1jwc4PWOXp0yjDqeaoCq29tlGE=; b=tBuid3vT5ljojy
	BahK5u62DKBV33qVDUFpUZXPVozCEtHuzTSD4HQpuGST47SLievLRk/duakJK29FcAcNxc7zYn6X+
	HCzTMgueYfyiKtTscwmYK6Il/P8ytfLaAyr8updRnsc6kEvy8qfo//CJtxSk8WzON9R2l7TE8ss1E
	FBopUBzbrwoGGHKoOZRCUY74bHFgXEsbR+if3x8t0XDizqoGhnOXrCEE7HaLBurYx+HqK1aVi2fpx
	j3YX06xG6tBBv36SY/VClWyzlDCwF3UOtOXIzwN6FXxaNLvFw+e+Cfgd75M5WcphNVh8hrJHWTx/j
	qZC/3p2iqea0kSFBqOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCPF-00CkAO-H5; Wed, 04 Jan 2023 22:38:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCG1-00Ca2z-N6
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 22:29:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id o15so26734933wmr.4
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqEImEb3zxFSZLJK5O28PW5QmA8rmOHB2VVdmPKgTSM=;
        b=nc2poSArYIkrQ9l7v8cc3glR6yoUpg0wzCRnHEeAW1jw5rZKve3Hf4XVvYWcL+2Aj8
         uIayBj1Xt7oKb7rooG/M+EIFXmPl3ad2RRuj99IB/S3PZDzrw67vGNGl1aKKVE5itRAv
         QA/eft6/1JfkusHMmTjnFE/xXSBOjzVWD53S0EKSgTwBJLYM7YbREXcJt0/PrQXt4G4J
         qIVS4kar4A1TJR9eifi6N/0kbTFbC0tM7Zsakh9IOGmAtS0+yjMXm6i+jaO/IBTtSyPa
         YnDRLSJMYsYLhexVmeiBk0qNgH2FEozlsQiDjh/895jyh2Qtz+Huum3RdVjssGdHs4td
         lGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqEImEb3zxFSZLJK5O28PW5QmA8rmOHB2VVdmPKgTSM=;
        b=rtiHn/NHDfbnmbTGfm3k2TsC+RGOi2X8tVoHUGToSV4U2uEQ7BTxghXwNSGzDn6rDv
         6njIPEoyZupczmLs25h82TK2tu6SuM9QhKcylEWnS+2zzXVsI6X7ibtkw0jywTZAik86
         Y+pkeP1GgxUK4vvi7Lwb1aKYmlwlr8fOKJ72EAyIVJ3lXf4oXUxWqghZvGwNNrObZBNs
         GPqShnTxLKjd5A8F18Se7sZUGYzKea/50foKf+nKxIxQX37WZ+pzjB/6C5UIh8SFaAjL
         uQwrgbximvhaAzZCmWd9+v1p98NHRecubB0cnSNTMgdsEox+0KsDtp/q71mAjX1iHsF1
         vfXw==
X-Gm-Message-State: AFqh2kosj+VTrZdZv488gwMvtDDdmybIC6pAwd7xoDOjwxTmEBmx7c1P
	R/tYoIAB/hp8zwfi0wvYKFN0Xw==
X-Google-Smtp-Source: AMrXdXvosSW2IMXk+/+QjecXpbDsWIG5+bgibat8r06Du8mLR1UfEgwY7dPUUYm2db8dJYYS1As+5g==
X-Received: by 2002:a05:600c:34d1:b0:3d7:72e3:f437 with SMTP id d17-20020a05600c34d100b003d772e3f437mr35584965wmq.21.1672871348065;
        Wed, 04 Jan 2023 14:29:08 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bg41-20020a05600c3ca900b003d1e34bcbb2sm236756wmb.13.2023.01.04.14.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:29:07 -0800 (PST)
Message-ID: <a9dba647-b307-e60f-c31a-3ef7f949d23e@linaro.org>
Date: Wed, 4 Jan 2023 23:29:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock source
 rating
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221228004444.61568-1-samuel@sholland.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221228004444.61568-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_142914_070345_A080883D 
X-CRM114-Status: UNSURE (   9.99  )
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

T24gMjgvMTIvMjAyMiAwMTo0NCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gUklTQy1WIHByb3Zp
ZGVzIGFuIGFyY2hpdGVjdHVyYWwgY2xvY2sgc291cmNlIHZpYSB0aGUgdGltZSBDU1IuIFRoaXMK
PiBjbG9jayBzb3VyY2UgZXhwb3NlcyBhIDY0LWJpdCBjb3VudGVyIHN5bmNocm9uaXplZCBhY3Jv
c3MgYWxsIENQVXMuCj4gQmVjYXVzZSBpdCBpcyBhY2Nlc3NlZCB1c2luZyBhIENTUiwgaXQgaXMg
bXVjaCBtb3JlIGVmZmljaWVudCB0byByZWFkCj4gdGhhbiBNTUlPIGNsb2NrIHNvdXJjZXMuIEZv
ciBleGFtcGxlLCBvbiB0aGUgQWxsd2lubmVyIEQxLCByZWFkaW5nIHRoZQo+IHN1bjRpIHRpbWVy
IGluIGEgbG9vcCB0YWtlcyAxMzEgY3ljbGVzL2l0ZXJhdGlvbiwgd2hpbGUgcmVhZGluZyB0aGUK
PiBSSVNDLVYgdGltZSBDU1IgdGFrZXMgb25seSA1IGN5Y2xlcy9pdGVyYXRpb24uCj4gCj4gQWRq
dXN0IHRoZSBSSVNDLVYgY2xvY2sgc291cmNlIHJhdGluZyBzbyBpdCBpcyBwcmVmZXJyZWQgb3Zl
ciB0aGUKPiB2YXJpb3VzIHBsYXRmb3JtLXNwZWNpZmljIE1NSU8gY2xvY2sgc291cmNlcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPiAt
LS0KQXBwbGllZCwgdGhhbmtzCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzog
IDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6
Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8u
b3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
