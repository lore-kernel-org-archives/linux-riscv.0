Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ECBC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T49jjbCOc81A0gk+zlQ4HgWtWbFgLwy5iNeqM171YWU=; b=TX4/JxKH8bjHO+
	iCOYavM3rVHnEdk/H/95m2F1uyftIm+PF/Z9MP7BvWMm8iWpjeC4jF9oZutxTn4I7HBQem9FWnU12
	qnFh4bsvn9b8O5kqN6NBM2YPi7l/EwudCuPiR2a5MmwSLmdZIk8/XSid66IAZ8irZni44rhYA1zIk
	4URUZPNBRoZleOVuvsy6JIO6PG+ON/eddGrJ9BnovGGu1Q4/TEK5mzw4jShtXCqZMJJkShepadq+n
	ZLwT7HX9eWokEzx1VWlVnIjpNDlK3t3xmtPyYPKGl2gvcBn7AJTizFRiwP2suopDxy02gOb27hy1I
	E5MmQFDLHOuSjM/vAjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkko4-0000000EM6V-2bwC;
	Thu, 14 Mar 2024 13:07:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkko0-0000000EM2c-3iaW
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 13:07:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33e9ba0eadcso751720f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710421649; x=1711026449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqukKuQ6NAMzoi8+shEz2UhwUDd0tDAkyYth3T10WcI=;
        b=F9uaMF1DEDWZ3hplQq7doSbgxGuqGZo6Rthq38bHnW7xxX9BVQwgi/cQ3mvfMOoVRG
         SjV7joFRQQsRb8nmiZlhNWXVUHmmvB+5w0syibcE7IUrrcDuDoycdX4lX0lSrrSbxlVo
         O/00LTqGjwIGhW4XeLsuqXCl0Rz1U6BfuxDDa0n1jFueINYCwu35gHs6joOKfdKQh5xp
         ws8LEJ/XvXnFUEORJ+X+YH6za6uUCruKzsCCWAH3vMvpZ5i8U5W25V4Fd3J0YGlX+3Gu
         wQspLGPTHnOeJatvPRfiwvWKLCBT8wRdHN4Og1EdVem8se9DvFyqtTY7CaFIicgWRjBt
         fqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710421649; x=1711026449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqukKuQ6NAMzoi8+shEz2UhwUDd0tDAkyYth3T10WcI=;
        b=AC5BUPTHqiz5CkOklPE3NeFNJc/TpzrLGYIYJjmdS3EZwQR34+p+Dm4MEz07v4QjNF
         erXu8LH2eoXbROLPBhko/Wkb/3snVf6NsgIQ9rONq5ZHZTODDAy+Gzy5dhTmgFV0nJI1
         y7uyWkf/Jz9CsWEhwi4iIibqurD2g+WgsBmQsMvXjSE5QuZbP17bJnjgBIdO0SE+UF1b
         ncm9uls0MVqsXVFUbuk1EppGg+GooVzszRj2RQnfoSiNhx+7JKw7j+hYodna/jKcdwnC
         W9VANJO0rhhsHbMwfAOVNZ6qaCmOFUemchbJaD9H1pooLmD4MTtt78V2Lbt/VfPBddgf
         LOHg==
X-Forwarded-Encrypted: i=1; AJvYcCUz+O9Bvxf34iFgVQzzlZW5etvI3jsSk6Z2FASlQOoD2kmb8xIowEeWWBmCFyJT9VTxJzPndLRWkwBSrq3FHVkxeKSfAQ06volw/1KLBrHp
X-Gm-Message-State: AOJu0Yw788SJ0GYR9JCTjhcAz922Sh7P1W6pC4fANHqllFVHB7HQJCh2
	m6Bgo2EC8idStUTEtZGsZcms4oMM80wLl76RQv8QQi4Oh1IexK+LjGO5ml0qo9Q=
X-Google-Smtp-Source: AGHT+IEh08BPIkO5i8MZI/XIrn4b44D6Mi1UxDOz589tb60I+o7DsjnE8/ap5GYLCSYvnHF8eCZRDQ==
X-Received: by 2002:adf:a4c3:0:b0:33e:b7d7:76f6 with SMTP id h3-20020adfa4c3000000b0033eb7d776f6mr1192201wrb.55.1710421648875;
        Thu, 14 Mar 2024 06:07:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id y13-20020a056000108d00b0033d202abf01sm725439wrw.28.2024.03.14.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:07:28 -0700 (PDT)
Message-ID: <a7b6732f-f103-43e8-a5fc-aef5cdc490fd@linaro.org>
Date: Thu, 14 Mar 2024 14:07:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: build error for sg2024 device-tree
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>,
 Device Tree list <devicetree@vger.kernel.org>
References: <dc78535c-eab3-4501-9ecc-0464e90c9b54@codethink.co.uk>
 <MA0P287MB28229709A260ECC6348CADF6FE292@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB28229709A260ECC6348CADF6FE292@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_060732_965649_2C0AF785 
X-CRM114-Status: UNSURE (   8.62  )
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

T24gMTQvMDMvMjAyNCAxMzo0MywgQ2hlbiBXYW5nIHdyb3RlOgo+IEZZSTogCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvTUEwUDI4N01CMjgyMjI4QTk0MTE5NjQyOTc5QTAz
NUM3RkUyOTJATUEwUDI4N01CMjgyMi5JTkRQMjg3LlBST0QuT1VUTE9PSy5DT00vCj4gCj4gT24g
MjAyNC8zLzE0IDE3OjQ3LCBCZW4gRG9va3Mgd3JvdGU6Cj4+IEJ1aWxkaW5nIHRoZSBjdXJyZW50
IGxpbnV4IGtlcm5lbCBJJ20gZ2V0dGluZzoKPj4KPj4+IMKgIERUQyBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdGIKPj4+IEluIGZpbGUgaW5jbHVkZWQg
ZnJvbSAKPj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVy
LmR0czo2Ogo+Pj4gYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2k6OToxMDog
ZmF0YWwgZXJyb3I6IAo+Pj4gZHQtYmluZGluZ3MvcmVzZXQvc29waGdvLHNnMjA0Mi1yZXNldC5o
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+PiDCoMKgwqAgOSB8ICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9yZXNldC9zb3BoZ28sc2cyMDQyLXJlc2V0Lmg+Cj4+PiDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
Pj4+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4+PiBtYWtlWzVdOiAqKiogW3NjcmlwdHMvTWFr
ZWZpbGUubGliOjQyMTogCj4+PiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWls
a3YtcGlvbmVlci5kdGJdIEVycm9yIDEKPj4+IG1ha2VbNF06ICoqKiBbc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDo0ODE6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvXSAKPj4+IEVycm9yIDIKPj4+
IG1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0ODE6IGFyY2gvcmlzY3YvYm9v
dC9kdHNdIEVycm9yIDIKPj4+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0
ODE6IGFyY2gvcmlzY3ZdIEVycm9yIDIKPj4KPj4gQ29uZmlnIGlzIGF0dGFjaGVkLCBidXQgbG9v
a3MgbGlrZSBzb21ldGhpbmcgaXMgZWl0aGVyIG1pc3Npbmcgb3Igbm90IAo+PiBtZXJnZWQgZnJv
bSBhbm90aGVyIHRyZWUuCgpJIHJlY29tbWVuZCB0byBhbGwgZm9sa3MgdG8gYWRkIHRoZWlyIHRy
ZWVzIHRvIExLUCAoPGFkPm9yIHJlYWQgbXkgbGFzdApMUEMgdGFsazwvYWQ+KS4KCkJlc3QgcmVn
YXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
