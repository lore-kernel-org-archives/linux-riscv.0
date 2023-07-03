Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0449EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xDyQqkMeKCwg+ILqeW7uIAoLbj9vuvBbaTSnO1c/H4=; b=3Pv0cK1bqT7Vig
	S2fZ3LQAvqXSmg4xHp6dfAoT2pBl44mC0jqqKJVrGKrzs6MVQIHJCzFuLARwIgqW92jPxddHD9IMQ
	oHRPx/ypPwKlZVbR73s6xNIeCLUitsgIHeFagJv+5wRINsFZZCUYMroqe9RXSXkGAKAnCESLqE7ua
	4EMSNQAwsZFEJBKd996DzuRzfRQXF0RfRfYxtsloTsbBaTnE85YpmXUEtRXn+ykmfDEIw+nG4/OE4
	vbTXlFbgElA4ILKK+qmDBUgNDwHb3AbiGTn8O33GOrfV9dwA1uQGfHUmBTW38avFtboMEglvHg/HI
	8DTQzQU1OX4JGb6eb7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKMc-00Ajnz-37;
	Mon, 03 Jul 2023 14:17:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKMa-00Ajmz-2w
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 14:17:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso22744775e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688393829; x=1690985829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7nRTxZW7CzMF8x6L9vlxMSTR8uIT9O6B/vDdhMl41M=;
        b=hymW8IG2ZTFaBo5EHFy2/EKitnCmH2B4pLg91wyqoTI4spEBDa9aP9Ua0u+Im6lqOD
         RaJA8E+nRzxaHQoGd287Kel7lTRyfo07b5Z2e2Vh9tefWUY8eXLEKrcha1L+m8w8gbNv
         IZ9eMfuvD8ol32wybA3RXkpJxgyzpx6lDcV/t9sFAIRpXULQNJ0sTkuFdSLwSqD36E/o
         pwi/vWT9cNI5X8gj5+kpWTJzWc3B6R//bjpHiuKWAq6Bd1IZvn24hw7SNNYRayWR+t19
         1BxFsS6Wy4vRGzJYTPgRC0oitOgSTbDHBQPwINS0rNa4XtRRuudRdfh5q/k0eTMxqbFD
         Rjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393829; x=1690985829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7nRTxZW7CzMF8x6L9vlxMSTR8uIT9O6B/vDdhMl41M=;
        b=UKCdht6a79wX/TiBflQ4EB//uRHp/54xSLRNw72DY7Jg3sBZ9s9q+0zcr8jQws3iV4
         y046bVyeIvkugG4KTty9hHL9qQtXvji+3f1pPjt4La0oQrYTYhUybeHjLW3JZ8ySvW2M
         C53M/2U6ZP0NSyucWFL9wyE4DNbhazpDa0Re7NWmJDtTDDNz9Sypd3kpLQaThVyb9TRR
         mvGYujxLitrvz1eNwOv7z/JOvI4hiVlRYbOwNMimI+YZQqnMd8rTMBA09gBvlHSauKOX
         DIGrMasQZ4wBTdirh1ZuJGxVTW/h0ZVbYmaaXMM/rxGoRWFDyq4CtTxzV24AdFfLP0d5
         6cZw==
X-Gm-Message-State: AC+VfDzhfsQnaAD1dszzCa36f1RJ9vti3odQ9VKRP8CH8rRY42UTYpSw
	3cEYXOtkKkhv21wazFUGH8gxcA==
X-Google-Smtp-Source: ACHHUZ4WBI6GLidOS0T1n6SOF6XWQ8OkVbHgTRncLHqekO96nc0/59TNZyymEHq3TfGx1g47smQe5A==
X-Received: by 2002:a05:600c:3799:b0:3fb:a8b0:521b with SMTP id o25-20020a05600c379900b003fba8b0521bmr9109503wmr.27.1688393829531;
        Mon, 03 Jul 2023 07:17:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j8-20020adfff88000000b0031412b685d2sm12148167wrr.32.2023.07.03.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 07:17:09 -0700 (PDT)
Date: Mon, 3 Jul 2023 16:17:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Cc: ardb@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, rminnich@gmail.com, 
	mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, lenb@kernel.org, 
	jdelvare@suse.com, yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, geshijian@bytedance.com, 
	weidong.wd@bytedance.com
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
Message-ID: <20230703-6ac90a2de15f1017bc0ced74@orel>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_071712_972803_8A61F981 
X-CRM114-Status: GOOD (  12.54  )
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

T24gTW9uLCBKdWwgMDMsIDIwMjMgYXQgMDk6MzA6MTBQTSArMDgwMCwg6L+Q6L6J5bSUIHdyb3Rl
Ogo+IEhpIGRyZXcsCj4gCj4gT24gTW9uLCBKdWwgMywgMjAyMyBhdCA5OjAx4oCvUE0gQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4KPiA+IChUaGlz
IGlzIGEgcmVwbHkgdG8gYSBub24tZXhpc3RlbnQgY292ZXIgbGV0dGVyLikKPiAKPiBUaGlzIGhh
cyBiZWVuIGRpc2N1c3NlZCBtYW55IHRpbWVzIHdpdGggQXJkLCBQbGVhc2UgcmVmZXIgdG8gOgo+
IGh0dHBzOi8vcGF0Y2hlcy5saW5hcm8ub3JnL3Byb2plY3QvbGludXgtYWNwaS9wYXRjaC8yMDIz
MDQyNjAzNDAwMS4xNi0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwoKVGhlcmUncyBub3RoaW5n
IGluIHRoYXQgdGhyZWFkIHRoYXQgY29udmluY2VzIG1lIHRoaXMgaXMgYSBnb29kIGlkZWEuCklu
ZGVlZCwgYWZhaWN0IGZyb20gdGhhdCB0aHJlYWQsIEFyZCBuYWNrZWQgdGhpcy4gSXQgd2FzIG9u
bHkgd2hlbiBpdAp3YXMgc3VnZ2VzdGVkIHRoYXQgYXJjaC9yaXNjdiB3b3VsZCBvd24gdGhlIGNv
ZGUsIHRoYXQgaGUgc3RvcHBlZApjb21wbGFpbmluZyBhYm91dCBpdC4gSSB3b3VsZG4ndCBjYWxs
IHRoYXQgYW4gZW5kb3JzZW1lbnQuCgpUaGFua3MsCmRyZXcKCj4gCj4gCj4gPiBJJ20gbm90IGEg
YmlnIGZhbiBvZiBhZGRpbmcgeWV0IGFub3RoZXIgaW50ZXJmYWNlLiBIYXZlIHlvdSBjb25zaWRl
cmVkCj4gPiBkb2luZyBzb21ldGhpbmcgbGlrZSBbMV0/Cj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS90aWFub2NvcmUvdGlhbm9jb3JlLmdpdGh1Yi5pby93aWtpL1VlZmlQYXlsb2FkUGtn
Cj4gPgo+ID4gVGhhbmtzLAo+ID4gZHJldwo+IAo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
