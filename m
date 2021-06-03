Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82840C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 13:34:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D93613E3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 13:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D93613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cW9Te2R4Yaz7RDpA5IqZ4SW1Mmfw9EzwNNSfKlxoB68=; b=qPGf6KK2ZJb/wngTHSmu/pO+TH
	k3/cpQDLtLqeiBHdL/4Ckc/DbigrzJZjwNXmhFhYT23lEanJ2vbQ7lzQVjs63lNRvGJ1AJHgtKgZJ
	UAefw+3oYXbZWb/Nez2fpDMK+dfekOwrwW8o3rVY3kQM1bATCfv00dUqq7SUjVDGubfkKdPmRoP86
	3DwHhKGWzfsJAZXuILrLSXjbi50kkrHkvWsooydF1An6tKjuCyGfxfhKSmlcnHYDV1qiIHZEEynA3
	wKkrWj9F0nR48AGkTzZrmPuwUr5SqZiI/5DX8o0YNOoZ9ZR8rrd3fn2TR5M3iVvOrtbdGWAufoF3E
	Q2IbQjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lonTz-008wJH-8v; Thu, 03 Jun 2021 13:33:59 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lonTx-008wIq-9e
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 13:33:58 +0000
Received: by mail-pg1-f171.google.com with SMTP id q15so5120658pgg.12
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jun 2021 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iEQOESr2EHarE2eFXszkBy1aNJ++bvs1j++M9Lxe844=;
 b=vPDyYLOTwpL6TFrgNOmQUIXMBjHx9nEOI8sbJHIr182Frpim7246rIsL+wo+ttU3FF
 vOXs0iPPZlq3CNOu4syAMsUUOY70Hn+uiBXsZfqZO6QZg1dABRXb0stQ9uXoOqpzVevZ
 tmRCXt5K4J+1CJPI/5WYIJ2S0Evy0lKtYxVpykRhhl+7ujRulu1xW6PlBF5uusQ6FSV/
 SdPOJZt9ixNBjQ94gyWoQTyNUn+fsFwXVDw6Sb+siiqR31tIekVxQJdhZNQY9TCaAuvp
 Nkv/mf7Z0rByk8mbpq8mDjWwmuWE448YVv8RNlOLXFWLtNQR1PvCFXMwmSSP/6qctaQd
 IL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iEQOESr2EHarE2eFXszkBy1aNJ++bvs1j++M9Lxe844=;
 b=WZN9xnO1/9a3WqLGl0ejaue3dEsgQnEgOJHuEpjwoWJJBopH05KAWJG2zMJX8nWJPf
 w6fcyuEFsMsnWNDWj8rbcoAax6GTyyKzI2cd2vE/uJuZAYixONffE8+cfVW3xP+1dYyy
 hUz5mGuQMw6ZeXlNrpH8PEEWavhOWR/UWnwFHoYbf5PF3+R4SekmcwHByN87G5QNxMG9
 1IVNJYFK+7cVhMzGHE8zOei1iWVZiw1FrEl74S/IKlsrdQco5gZymGxL6LUd5agn1BuX
 7YFabDz7W4nNWHm0jfj8619K13wlfHk6iQNPZHsKLPLM7kUw1/AyH4nIwjs6MJbSlOw0
 Rr5g==
X-Gm-Message-State: AOAM531CFUJeySyKG5cZO3V8p8SEm1Qipdf+gUBYn7Gw1szl5WJWN81b
 13Rr9P6qitlAMReiPfTuRVw=
X-Google-Smtp-Source: ABdhPJy9oqwFXTx23rJ0NmxS6M9NAUoe4sGmMetpjMzUmi+ujURRvVRG9QQaM+6Tn/Ia2SR85oJ5Tg==
X-Received: by 2002:a63:d312:: with SMTP id b18mr39940154pgg.89.1622727176019; 
 Thu, 03 Jun 2021 06:32:56 -0700 (PDT)
Received: from [172.28.99.179] ([139.226.50.128])
 by smtp.gmail.com with ESMTPSA id nn6sm2307533pjb.57.2021.06.03.06.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 06:32:55 -0700 (PDT)
Subject: Re: [PATCH] [v4] docs/zh_CN: add translations in zh_CN/dev-tools/kasan
To: Wan Jiabing <wanjiabing@vivo.com>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song
 <maskray@google.com>, Wu XiangCheng <bobwxc@email.cn>,
 Bernard Zhao <bernard@vivo.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 clang-built-linux@googlegroups.com
References: <1622723294-26434-1-git-send-email-wanjiabing@vivo.com>
From: Alex Shi <seakeel@gmail.com>
Message-ID: <e04e491b-69f7-f4e0-882c-6ce86baa39bf@gmail.com>
Date: Thu, 3 Jun 2021 21:32:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622723294-26434-1-git-send-email-wanjiabing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_063357_355428_C4B1147E 
X-CRM114-Status: UNSURE (   9.54  )
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

CgpPbiA2LzMvMjEgODoyOCBQTSwgV2FuIEppYWJpbmcgd3JvdGU6Cj4gKwo+ICvlrp7mlr3nu4bl
iJkKPiArLS0tLS0tLS0tCgp0aGUgJy0nIGFuZCB0aGUgJ34nIHNob3VsZCBiZSBhbGlnbmVkIHdp
dGggdGl0bGVzLCBsaWtlIGFib3ZlICctJyBzaG91bGQgYmUgOCBudW1iZXJzCnNpbmNlIENoaW5l
c2UgY2hhcnMgdGFrZSAyIHBvc2l0aW9uLiBQbGVhc2UgZG91YmxlIGNoZWNrIGFsbCB0aXRsZXMg
YW5kIGl0cyB1bmRlcmxpbmUgY2hhcnMuCgpUaGFua3MKQWxleCAKPiArCj4gK+mAmueUqEtBU0FO
Cj4gK35+fn5+fn5+fn4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
