Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C633C54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MTGOC3vOSuJRLKM5x1ZfYLRwiYlHn7okWaPXkrUZPE=; b=BHsj4F+1fp2BbK
	YAFrehKqI6BAfeehtjr7bgwZfcXg01x9xo6086FV4OF6aZO5V7h1LtqC6lCvVmelPyfxLbgQt+BRf
	fkXIE1DFRpl0GeaUiveYrlmDomnObuECYRVK0YP0n2Iy+50dQkJP0FjzgRTLuCYTTyU0kKPGCP3wT
	xAF4GVviicB9eXROSw5ZmpbbaxKyfWd60cXt0QZHdkMqS2I09XZFwaac7Q7CrTSrKEqykfukrgOR1
	kkxGojvYw/vunWTHBJ9WeCvWa7ZKoljn3z2A2mByG1RWG00LlHTZPWEP4ItRUWHO1Zo02d4PMRrQu
	Tq8EfyEWjSmFqx8adtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqbO-0000000EIJ2-1mVH;
	Thu, 28 Mar 2024 14:19:34 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqbK-0000000EIFN-38Hs
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 14:19:32 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cedfc32250so701662a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711635569; x=1712240369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4Q/WXW31g3snYFLHRmqhdEmRrxpqQ2+Fa0Su8cfptw=;
        b=K1zoUAZIq2k568lpZ+2bGFSwQnQvY3AVzWSL5q0Z7wTosWy3+qkU7gzFrTXeRu+NRm
         Y6Mp+C6KJxGHfPxje3Ux/pVdBAfab/lwNff9hFVwIgO0tyc1YOeoMvx6Ioido+1iIAQO
         k1V7XcDEdwqx6q6V7qGT0zItuU1DMCSAFaAZCk31r6NsbpoOAsQ0U9ZvQQ9M6Zmfg761
         JiK8R/Cx7iVHq/A91oN83vRxAobszJ2KqQ85XuLaNdytEME6NnRCH6wguSY8sTF2cLov
         5iOksnflDKj66uvRb01xP/Wq0RWz0Mv2ExCEd+TcBBcMWj+80NRHnWVueqQ8nVRUxS/4
         GAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635569; x=1712240369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4Q/WXW31g3snYFLHRmqhdEmRrxpqQ2+Fa0Su8cfptw=;
        b=cA6iqbMltYnyTVsWrmiGqZ/6vXgs4JxN20OewGyrI9DfXqoR9Cr0lt+bE99uKjsJLi
         9/gdBR8/INA4k8gn4gKHD5PAaWBMf7vK5qHRYMlN12cCqTpyIWyY+y0PIeVFE0xbbSUT
         iTdMaGbLgENTfUNHbMkDvHOAz0MaDMybLh6ExK/EFkZQ+Xvd3mamzMVSekxiHZd0Zdel
         Cy4TM/njyhlkK77tx3y/16tsbHL/prbziQRj/77nyatrSHp+dji6i2fHaEReee6FNgAy
         x9Pa+lKG648RcG17lQUfD0ztnhEQmUA+jFVzUfhFW9aIbvwHBG5rUHFYNx5DCQ1nIG2g
         UYEw==
X-Forwarded-Encrypted: i=1; AJvYcCUgWjoB1oQbGXg3Mf0JSazBjRAFE4l0h55B+N+18oL8lqgWVG11JNFxD8vSOPJn1HtcmR8bj15o1J3ieimQopajSd6VL2Bvz0TJFmOYx4xr
X-Gm-Message-State: AOJu0Yw7+nZRg88uGA2uoXMiXA8d7LPQPFTUymU3D6/iOQXTz5C+WaCd
	uw0qi2Sm9cB6lc1rCl4gzNYSGuK11z0DS+1HOVpn6tLWY9SxoloUXZjYqzS77x+WfS1apkxoSeC
	D9DhqUHKKMytnIMeP8WRn90e4t2BAis5mgMWAkg==
X-Google-Smtp-Source: AGHT+IEGkQ0N6UtKBWqxH+7naa+Jluj/ZOxU3Cl+pzh7cHt3uWbZJ1e3TfpyU9qq//m1skCMPh7OVDhYhAzD00yuybQ=
X-Received: by 2002:a17:90a:4a8c:b0:2a0:97a4:8743 with SMTP id
 f12-20020a17090a4a8c00b002a097a48743mr2227314pjh.47.1711635568843; Thu, 28
 Mar 2024 07:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu> <20240327125954.1809-1-dqfext@gmail.com>
In-Reply-To: <20240327125954.1809-1-dqfext@gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 28 Mar 2024 15:19:17 +0100
Message-ID: <CAEg0e7iFS1C93S4XuhRMQc8oK_kSJ1LMVXHjVcg6bAuUZQfecg@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Test th.mxstatus.MAEE bit before enabling MAEE
To: Qingfang Deng <dqfext@gmail.com>
Cc: ajones@ventanamicro.com, alistair.francis@wdc.com, aou@eecs.berkeley.edu, 
	bjorn@kernel.org, conor@kernel.org, cooper.qu@linux.alibaba.com, 
	dbarboza@ventanamicro.com, eric.huang@linux.alibaba.com, heiko@sntech.de, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, philipp.tomsich@vrull.eu, 
	zhiwei_liu@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_071930_833603_F8518B68 
X-CRM114-Status: UNSURE (   7.25  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMjowMOKAr1BNIFFpbmdmYW5nIERlbmcgPGRxZmV4dEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQ2hyaXN0b3BoLAo+Cj4gWW91IGRvbid0IG5lZWQgdGhl
IGFjY2VzcyB0byBNWFNUQVRVUy4gVGhlcmUgaXMgU1hTVEFUVVMgd2hpY2ggaXMgYQo+IHJlYWQt
b25seSBtaXJyb3Igb2YgTVhTVEFUVVMgaW4gUy1tb2RlLgoKVGhhbmtzIGZvciB0aGUgaGludCEK
SSdsbCBjaGFuZ2UgdGhlIHBhdGNoc2V0cyBhY2NvcmRpbmdseSAoYW5kIGRyb3AgdGhlIE9wZW5T
QkkgcGF0Y2hzZXQpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
