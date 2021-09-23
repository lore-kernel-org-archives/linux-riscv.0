Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E35AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 11:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B102F60F48
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 11:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B102F60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdS5mYSvJvwgi7pn64eBCQwa4xzOFbx5HEE6OYpdNvw=; b=N92KzrpTduLmtK
	AsVzORGOB9dUDOLZIMxaYCwzBUrvarUJrBqGGbk9gPFHvMbYvVfQQZ0B+V6oUIKFzOcRGbBTDM4KE
	nvWdChrtqjiWzcR3l8vzsUqolyNnMUlh3IdqYqCc2O9M1sFxxogB7NgYwIaNavkXF40C7powYsPtd
	cBUi/ra1ujjdLSJAFU04ozIrl4DdQInrB7zja1BAT2EjSqXVtqIzxJ5UXNN/vZ96I5FuG2TBgGaQ5
	3jJsO1ycKPmDBqpYGXgAlfy+JlCH0udAC4kih0YAAAEYm0f75wgr/rnLCyHAOxBVsE1guv+mGHxs+
	Y6NE5EmXLMBLI5HvbNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNG9-00B9gl-6T; Thu, 23 Sep 2021 11:51:25 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNG5-00B9fq-W1
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 11:51:23 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 66E8A40291
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632397875;
 bh=wGcNO2IXTBVLJmMzaDNfXw1CRQSpWdqfS3q/Z8Q4M1Y=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=NzKf99/qq7vNEHj3qY0QtOMILEif7d7AjyZt2joR8FJYjDvYKPaqJ3mGcbUsk8o3a
 kFgXwtThDwCw5EwqBA7xfScsDCI+TcVo1Oj9oc25Wb/8kA8lZxn5ilceGRlZ7kbwwi
 z2U5B6tlxsHwA3FUtcUcYxlHw8ilikzCkVvlvc12q5ay4cTCLI5AR53bnCfjPxOYaC
 izJQZtXIMvkRKbVNhwcOi+8XRYsKPH5m9PXLmbTKo8qAhdscsvh6zWXzjQud5h6ef1
 pk+XnyH/mJy8+5mkKRJpArpFwI5ayvLdTIyHkgZCxLd+pUuWJHw4iM35pnHULpBsEE
 zzahR+aTsqqnA==
Received: by mail-lf1-f69.google.com with SMTP id
 a28-20020a056512021c00b003f5883dcd4bso5873702lfo.1
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 04:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wGcNO2IXTBVLJmMzaDNfXw1CRQSpWdqfS3q/Z8Q4M1Y=;
 b=BWUmF4WlxsG+fNyF1rhd1sgLBgXt7tXvDfXdIIZ2MpT5ipLzCXcv7Mpkt3u5jdl9Xa
 FvfKJZImbSzQ4NZ0ndVMhQNIzuQ4CwqIlQ+zviti18L7jBF9YALH11JMuBA0Pzv2fsQ3
 I8lE4Q69pafXsOFJPFYZXOSTaE7JVEmrghQPFjwhIWn2vJc+glsmC01/CAVY+AcVMbUv
 wIw3Fiae6/e4P4nva6lgT/z4tgpizvmxnr41On+I1TUFW6oXAHvoBTgoF36ImR6muXnY
 OrVH1zsM3214Gop3lektIwwZmM5yyHhpmnoCvxQllGPXYjnJY1uK456tUyjg+m4MDaq8
 ytKQ==
X-Gm-Message-State: AOAM530dq/PysI96RG7UaDlSbIJqacFCTO4RYGr9UOz20qJ4wZ36uE5W
 6HTK56lIBjp/4sLDJjTnj+1MqPWsxp/UBXQHohnrNPtPisM4tv0OCnctU3DLaTEbFiL8b8QrrZz
 KY8M+wYUN72Mzw92P9N1xrhmIcSJj4JUWOxvy85CrkXqQT1jih+dTWGs5xfGAIg==
X-Received: by 2002:aa7:db85:: with SMTP id u5mr4876818edt.234.1632397863963; 
 Thu, 23 Sep 2021 04:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzN+eiUB6TLkCud6NtqS90/s5C7jzCEwCWLoZO5rT0CasG/3cmMrbqmMTzSzy8MtmxB9LUuh7ZBIDENSSGBa0=
X-Received: by 2002:aa7:db85:: with SMTP id u5mr4876783edt.234.1632397863817; 
 Thu, 23 Sep 2021 04:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
 <CAAeLtUDu0yaDBcuC06nX1WUQC9k4eNuWjvAFrpkP_h0nf5BZAw@mail.gmail.com>
 <88696248a0c19a5dff660354b837514d@mailhost.ics.forth.gr>
In-Reply-To: <88696248a0c19a5dff660354b837514d@mailhost.ics.forth.gr>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 23 Sep 2021 13:50:52 +0200
Message-ID: <CA+zEjCsO2CyhrfGGA4ceAH=LBOyqWF4U7F91VheTdr6wEJj1pw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anup Patel <anup@brainfault.org>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_045122_208239_83EE13F5 
X-CRM114-Status: GOOD (  21.60  )
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

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMTI6MTEgUE0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGlj
cy5mb3J0aC5ncj4gd3JvdGU6Cj4KPiDOo8+EzrnPgiAyMDIxLTA5LTIzIDEzOjA0LCBQaGlsaXBw
IFRvbXNpY2ggzq3Os8+BzrHPiM61Ogo+ID4KPiA+IEhvdyBpZiB3ZSBleHBhbmQgdGhpcyB0byBh
IG1tdSBzdWJub2RlIGluIGNwdUB4IGFuZCBhZGQgYSBib29sZWFucyBmb3IKPiA+IGFkb3JubWVu
dHMgbGlrZSBzdm5hcG90IGFuZCBzdnBibXQ/Cj4gPiBUaGUgb2xkZXIgbW11LXR5cGUgY291bGQg
dGhlbiB0cmVhdGVkIHRvIGluZGljYXRlIGEgbW11IHcvbyBhbnkKPiA+IGFkb3JubWVudHMgc3Bl
Y2lmaWVkLiAgSSBhbSBhd2FyZSB0aGF0IHRoaXMgZ2VuZXJhdGVzIGFuIGFkZGl0aW9uYWwKPiA+
IHBhcnNpbmctcGF0aCB0aGF0IHdpbGwgYmUgbWFpbnRhaW5lZCwgYnV0IGl0IHdpbGwgYWxsb3cg
ZnV0dXJlCj4gPiBwcm9wZXJ0aWVzIHRvIGJlIGdyb3VwZWQuCj4gPgo+ID4gY3B1QDAgewo+ID4g
Li4uCj4gPiBtbXUgewo+ID4gdHlwZSA9ICJyaXNjdixzdjM5IjsKPiA+IHN1cHBvcnRzLXN2cGJt
dDsKPiA+IH0KPiA+IC4uLgo+ID4gfQo+Cj4gSSB3YXMgYWJvdXQgdG8gcHJvcG9zZSB0aGUgc2Ft
ZSB0aGluZywgd2UgY2FuIGRvIHRoaXMgbm93IHdpdGhvdXQKPiBicmVha2luZyBiYWNrd2FyZHMg
Y29tcGF0aWJpbGl0eSwgd2UgZG9uJ3QgcmVhbGx5IHVzZSBtbXUtdHlwZSBwcm9wZXJ0eQo+IGF0
IHRoaXMgcG9pbnQsIHdlIGFyZSBlaXRoZXIgc3YzOSBvciBub21tdS4KCkluZGVlZCwgdGhpcyBw
cm9wZXJ0eSBpcyBvbmx5IGluZm9ybWF0aXZlIGFuZCBub3QgdXNlZnVsIHNpbmNlIHdlIGNhbgpk
aXJlY3RseSAiYXNrIiB0aGUgaHcgd2hhdCBpdCBzdXBwb3J0cyAoY2Ygc3Y0OCBwYXRjaHNldCku
IEFuZCBpdApjYW5ub3QgYWN0dWFsbHkgYmUgdXNlZCB0byBmb3JjZSBhIGNlcnRhaW4gc3ZYWCBz
aW5jZSByZWFkaW5nIHRoZQpkZXZpY2UgdHJlZSBoYXBwZW5zIHdheSB0b28gbGF0ZSBpbiB0aGUg
Ym9vdCBwcm9jZXNzIChJIGhhdmUgdGhpcwppc3N1ZSB3aXRoIG15IHN2NDggcGF0Y2hzZXQgd2hl
cmUgSSB1c2VkIHRvIHJlYWQgdGhlIGRldmljZSB0cmVlIHRvCnNldCB0aGUgc2l6ZSBvZiB0aGUg
YWRkcmVzcyBzcGFjZSwgYnV0IGl0IGFjdHVhbGx5IGJyZWFrcyBLQVNBTikuCgpJc24ndCB0aGVy
ZSBhIHdheSB0byBrbm93IGlmIGl0IHN1cHBvcnRzIHN2UEJNVCBhdCBydW50aW1lPwoKQWxleAoK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
