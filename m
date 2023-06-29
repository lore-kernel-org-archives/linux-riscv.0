Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94CFEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgllbExTKqfadjB/JV+FsF7X6xVsTBtF6x2oibFZlVM=; b=uKXqG930VXboVH
	9CexbJfulFKuVgF+IU/s0RjDVVtOP8mWSZeWEN9IazH4pS5xCMKEw007GScHwyuS+E3BbobWy6MNT
	9W9ybg9rIZf9MvNlFvYQMgcjlFLbjpOkMg4TPxMHoDyQ2hAUJaW7ZmDPNvS32ZCbbw4ro2QVfJA4b
	PZgm3j8a7SaKTbQ/XHhw/CNt87Fb3j08Z+d04FOOgYkA+UBk8AO0z/8Hg1KLBc2mHep2ngL+c7ANF
	sqoBY42xIUwqueOm/VF+tb3rEX5cZCaMTxborUG2LVa8c2CTF1/Hc4oDXZ/Te87O07gJbBNPbJtRU
	S+XL1Bb3oQbPezYRMHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qExX1-001yZo-1n;
	Thu, 29 Jun 2023 19:42:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qExWy-001yYf-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 19:42:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51de841a727so511517a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688067733; x=1690659733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8xfd3Bi3FUEg2mdjjnrWh1F35O1rgPB2ctPxtJWJao=;
        b=LgBKMetrxewlKIGdFCcpoEPRF6NFs6XJRRca6Pvs1nL7hpytucBzWMjjhB6DivoOkT
         nqkSHsiswr4OJ5TPcl1HDBDEX3X01uWyUl34o8Qk7wqTqJ6XUGB/JlF/lWy6IYXXzd2j
         TNwn5f9XlqfqW9URN60MRZgDedy4THbCjfC0tIlbmkuATPbAb5fw5Ye67MY7fY5w4JHI
         8fS5xnHf0h3e7UjdnX9E1FMiA6HgrheVR5Zwu1j+EDg37QlmB9xQlC57u7JpoGBx1OVz
         BO+fSSJs9wIr4JHfKqIneRTn/Fl5uapvTuJIe6LWEdaiXxurU1C2KdKply9lMOsMhrTO
         i5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688067733; x=1690659733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8xfd3Bi3FUEg2mdjjnrWh1F35O1rgPB2ctPxtJWJao=;
        b=QUdRccRWFAvONrihgj+Y5bE9f6/hPubkWCbAQ7XPjQLIDKBrI6UvYLey+yWqd0Lsg/
         d9L9TZSdRNVj/R46JjrWtlj1GFx05M565fg6NBsVNxJDlZCgr+qHFVdNTtXu60ZMlrfK
         45zm2wZXlf/lyGtR+LCD2wj4ocxcNIVbVTBQkuKlquCPIlOu6IOC2LX/qALw/o8c6gzW
         Y8gYdpDoGG6zFGGHoKMzZ324cqrpLzO/lMKeZa3VuCXYQ8RaqoWJrqqTXhoReN3mYien
         8YqJ0vmHlyjowUOra/X8hF2p+TusPenHR9uFjGM633mX9AGCdswlgGLWQdqYZXimneKp
         kNIQ==
X-Gm-Message-State: ABy/qLYcbM/CE+yiNPdCr+Q/X+i/Qsrz48yeSg1S7y0H9WJSfgP4ghwd
	SUypzI/bbC3wTYOJcWHBjw==
X-Google-Smtp-Source: APBJJlEeUZAGifvNNwYzIvE081khgiSAJja1TtD3q2wF1Yzd9TXgi1C48M+JMyOUgYcqh1bFDGtfKw==
X-Received: by 2002:a05:6402:205c:b0:51d:91cc:32e8 with SMTP id bc28-20020a056402205c00b0051d91cc32e8mr122204edb.29.1688067733196;
        Thu, 29 Jun 2023 12:42:13 -0700 (PDT)
Received: from p183 ([46.53.248.48])
        by smtp.gmail.com with ESMTPSA id b5-20020aa7cd05000000b0051da8fd7570sm773742edw.41.2023.06.29.12.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 12:42:12 -0700 (PDT)
Date: Thu, 29 Jun 2023 22:42:10 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 2/2] selftests/proc: Do not build x86-64 tests on
 non-x86-64 builds
Message-ID: <fd61fd96-f06f-4a2d-8707-0e1e395c9e51@p183>
References: <20230629162301.1234157-1-bjorn@kernel.org>
 <20230629162301.1234157-3-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629162301.1234157-3-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_124216_189123_6945C11B 
X-CRM114-Status: UNSURE (   7.58  )
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

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMDY6MjM6MDBQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhl
IHByb2MtZW1wdHktdm0gdGVzdCBpcyB4ODYtNjQgb25seS4gUmVtb3ZlIHRoYXQgdGVzdCBmcm9t
Cj4gbm9uLXg4Ni02NCBidWlsZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgoKV2hhdCdzIHRoZSBhZGRyZXNzIHNwYWNlIHNpemUgb24gcmlz
Yy12PwoKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9wcm9jL01ha2VmaWxlCj4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcHJvYy9NYWtlZmlsZQo+IEBAIC04LDcgKzgsMTEg
QEAgVEVTVF9HRU5fUFJPR1MgKz0gZmQtMDAxLWxvb2t1cAo+ICBURVNUX0dFTl9QUk9HUyArPSBm
ZC0wMDItcG9zaXgtZXEKPiAgVEVTVF9HRU5fUFJPR1MgKz0gZmQtMDAzLWt0aHJlYWQKPiAgVEVT
VF9HRU5fUFJPR1MgKz0gcHJvYy1sb2FkYXZnLTAwMQo+ICsKPiAraWZuZXEgKCwkKGZpbHRlciAk
KEFSQ0gpLHg4Nl82NCkpCj4gIFRFU1RfR0VOX1BST0dTICs9IHByb2MtZW1wdHktdm0KPiArZW5k
aWYKPiArCj4gIFRFU1RfR0VOX1BST0dTICs9IHByb2MtcGlkLXZtCj4gIFRFU1RfR0VOX1BST0dT
ICs9IHByb2Mtc2VsZi1tYXAtZmlsZXMtMDAxCj4gIFRFU1RfR0VOX1BST0dTICs9IHByb2Mtc2Vs
Zi1tYXAtZmlsZXMtMDAyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
