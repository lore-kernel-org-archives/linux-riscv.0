Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE45C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDj3gFty8ox9rpEIRYjQ+rIhNKb0aoxD9olja9qlBuY=; b=Tiuaq5erFdwiL0
	6b2DNye1jWHniFExcu32ngbR7b249VF8WLVkIOKRG2npa4+MYiMLbs3JQ6LvJ63QT53QFB9X6K5zi
	OmOSWo+1Dh7A2LVL72DZw99NCmgDoavg07fDDwOR1A7OMOnKi1ke3gKSj5ymaZ1PKqcLiIx4UMqeO
	7dmgb9TVYcTIDjwQHTdlNZnawOHWqEuRLWcEQtco11euIYMQcL7ZbiTOi+Nuqb4Wa4HErB6bvDlXo
	8AwmxvFIXObCvrKM5AWlvcWAYdeKHjPSVCf3cscWhK58sw4T07qMw1V8vNGSbZq64xgfzxPtFyYEq
	JNnMRv2couToEZbLZfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrfY-0067k6-9Y; Thu, 16 Dec 2021 14:23:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrZe-0065m5-TK
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 14:17:36 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E1A353F1C0
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639664246;
 bh=hXcKig2BTgNYlsnaKeNaeezzj0lAoxAXYJuGyAPXer0=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=tATwKonCqcd9rCmNOWVVvMgx/DZLUwWeMkhoVI9TkSV9VOH50u7t0PwKR5Hb3vvR2
 QYun/xsgaMt6MUO5RmjEoGB6bk9A+uvkRe1ejxI8A1rwn9zTCXu/+DNgI2FH7itrwD
 /LmXVr8M+2PHUBy+Gl1TcRbt1fobxxKbwuk4DxVZV8Sxe5z5etG32gJh1ugqHWk7H0
 5HM5sAIXOf0PsJrPRylDs8Fz1f0dO76ZBRFh/VwSa/kHPMdHfGcy3jgEfFRr2qqkY6
 t1s0Bg6SF8SkZBcC8O8YaaSAoPqUSy8DdM2QP4yaA+uZCuewF1XuppPraDfqp0yzYR
 G4kli7fXlyhKA==
Received: by mail-wm1-f70.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so2135253wml.0
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 06:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hXcKig2BTgNYlsnaKeNaeezzj0lAoxAXYJuGyAPXer0=;
 b=BbuFdViWckWszy+Sq1Yxmhj4jUVjC2bDDaSH1hODQc8bsIbt8/zepEziZhxkUvzLAz
 Sdfsg0vM+Co6yzqwTZRwSEVlAtWKdtwuh3mRZSAlaEVVvmDxzdLN9qE817WZGou9z1Le
 2IoKHX8M6kAE5c4oFF3Zu7VbAYQtGUBJYgGnhp6AopNrsKOazyj6ie8igeBGos8sW7kb
 d9CrQspGKWIc+kShe7wdWotnBP+S/nqXd4GFmD6So+zwcxSbvl9kjGhN3lnEFANrm3k/
 oBqpdRB4OYPJz/AALfotqp0lE2CS0kcFZvWCFE1Rgl5JXowD6uFWI5k71+TDsq/66pBz
 fkKQ==
X-Gm-Message-State: AOAM533lifHfatAUGrGfsSOr/vMoYZ9/MpR4taW0iM4/mnMMkLZqo+DB
 jS89vDnpTZOlvSZVh5bDLqroMNI37CxJsum4trMCZ3kyU+jPJz+4peojCaLmhJ9USdQyJnIJLrZ
 vGYwm2fUd0C/qrJE20wlFeZ2CwZKP7EpURzoEDJ8L/JNXRA==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr9316096wro.324.1639664246527; 
 Thu, 16 Dec 2021 06:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQzaGzh5uSvdXoD/U0jonieRUBkngZQxVU6MeqdFjuxxNDCLX8Dbfju2GouOfAFj1rfc6n9A==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr9316079wro.324.1639664246280; 
 Thu, 16 Dec 2021 06:17:26 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id o2sm3822032wru.109.2021.12.16.06.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:17:25 -0800 (PST)
Message-ID: <fd40010f-f2ec-b32a-6850-1e054af43725@canonical.com>
Date: Thu, 16 Dec 2021 15:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
 <BC1B38E7-1170-4C05-948A-D18E80AC49E7@jrtc27.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <BC1B38E7-1170-4C05-948A-D18E80AC49E7@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_061735_118833_CF29273E 
X-CRM114-Status: GOOD (  11.37  )
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

T24gMTIvMTYvMjEgMTQ6NDksIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+IE9uIDE2IERlYyAyMDIx
LCBhdCAxMjozNSwgSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5v
bmljYWwuY29tPiB3cm90ZToKPj4KPj4gVGhlIFNCSSAwLjEgc3BlY2lmaWNhdGlvbiBpcyBvYnNv
bGV0ZS4gVGhlIGN1cnJlbnQgdmVyc2lvbiBpcyAwLjMuCj4+IEhlbmNlIHdlIHNob3VsZCBub3Qg
cmVseSBieSBkZWZhdWx0IG9uIFNCSSAwLjEgYmVpbmcgaW1wbGVtZW50ZWQuCj4gCj4gSXTigJlz
IHdoYXQgQkJMIGltcGxlbWVudHMsIGFuZCBzb21lIHBlb3BsZSBhcmUgc3RpbGwgdXNpbmcgaXQs
Cj4gZXNwZWNpYWxseSBnaXZlbiBlYXJseSBoYXJkd2FyZSBzaGlwcGVkIGJlZm9yZSBPcGVuU0JJ
IGdyZXcgaW4KPiBwb3B1bGFyaXR5Lgo+IAo+IEplc3MKPiAKCkRvIHlvdSBtZWFuIEJCTCBpcyBu
b3QgZGV2ZWxvcGVkIGFueW1vcmU/CgpTb21lIHBlb3BsZSBtYXkgc3RpbGwgYmUgdXNpbmcgYSAw
LjEgU0JJLiBCdXQgdGhhdCBtaW5vcml0eSBzdHVjayBvbiBhbiAKb3V0ZGF0ZWQgc29mdHdhcmUg
c3RhY2sgZG9lcyBub3QganVzdGlmeSBkZWZhdWx0aW5nIHRvIGRlcHJlY2F0ZWQgCnNldHRpbmdz
IGluIGZ1dHVyZSBMaW51eCByZWxlYXNlcy4KCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
