Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE85CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsQhVisaX08mFfRKPdm3i+NqaHbqrQOVwUvcaXy8aFs=; b=su9qzKPQXr1C4B
	K4BmOzn4OYiYFCmFtujyK9ePPHIXhAWe1oBfbasgDdc9Z5If+x72N7iBPSH5/xGpJqlzEqEWU12ds
	2KIj8p/buMz6uDGjx5KmsVKM94clyJ5/SuCNIUjjaDobYZZ959Kl1dc/4Vx0dk3wO/r7AT5AAmZGX
	s2hEb68BUUBdVvT69rdFSjn4OW3xDABE9h7cuYkJrz4O5GX717GU31dSubWpT5l4WKS8xYo9p6Aaw
	UQiWR3I4HvU7WwrJI8k8aBPVLNzilOnp0tM9WlWoOXvFDK8kXrmtqCeu6gttp0YsFrnQLWskhT/jH
	G3yIWCWjwubdiJIY/cKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s81-0000000CWEA-2aQj;
	Thu, 25 Sep 2025 19:59:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s7y-0000000CWBI-32zq
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 19:59:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-269639879c3so13359235ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758830381; x=1759435181; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOzyRe+3fMSMSulDoCd/U8Ee2YvY46RKA0vukyO785o=;
        b=QCTlUdt1pbUROprGJDi+oc44YQYaYN+RoHeJY/jGRvQ10kw3YS09p7FxDhjJOUzA9k
         MtIzD55gHgb6kJyNbKdkDN/eZdmX/3THElRmSyHsM9A5c2CtKlnHOi1BqDOi/fBpaT6Y
         WesFo703c54k3d6YXPTnS3cMLsfFzqnA6leVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830381; x=1759435181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOzyRe+3fMSMSulDoCd/U8Ee2YvY46RKA0vukyO785o=;
        b=KyaIQCq7tiRBQHfrZYKoXxdNcJ+wpf/P7SWP6wlWlC2BPE28DT3BfAbvCpZIF4aAPQ
         ePVPnQi8xRRjoSkWlOB1dYFz7wG+CwwljCRiirIaaCL1dWGXe8kwfATYzFaSPI33kaB1
         LbZuWgApoxp99yymP7oOBhOTDr0mwJ5AU1qlP6Jtj1WZV2MEE18/dNITmUKonTBFkcGp
         K/zBgJZ5KQLXdZ4MolUqwtQtJfCVGY05J+ZejSYDrMINCmEbl1GBckuv4cm20OE6kHsk
         6ZoiQoJgzq9ChcgxtSosoO3Bf8PioXXc/GK7Ysjj37ifrCmshYd+gMIkhQLV0R8zR+Nk
         Yx6w==
X-Forwarded-Encrypted: i=1; AJvYcCXtHQdkti+Yzoafk7nD2RW44My6vvB1rDTeZn+5Hu0zmPnvpGOfMyog7JLA7vJX787lFPbnp9UlZ9iBBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEnKDuXOPzIRNTOA/xrtFDfxW9kG2UY+fCHsnEwOZLok908f1/
	jYgcrzRSyS4+w6oBAEeMNraWPl8s6lk/dHCiK1Z8kbnsfyQ4Jg1RV5FNB1oatpX9Msbzlw7nz4J
	3yMU=
X-Gm-Gg: ASbGncuVax/kvknLRC4e4RJTNDPdbt/jBNuhq+eRxc2TYxOy/76Gp6Hm47xUPcGlRc8
	XuEmREp+uBvCm9kb0iahhghclX6ARCfR9LrO9FCh1GaVrV/6zHZlSbuRQGyszgweZTiSf3vL6Mc
	Sxm07GsIRClyUr4v30BGq2xbXntbJ2A7sUHYQ7lUMe+imhUDhhU+iiKcGe1ly5Pa/+TND2JMQJQ
	Z751QBmKqmhIPB4fWlG8HokUJn4IzC0dnsFMdO76Bsg9Y3V73Nx2KTg0/SnhuA95MqRFcwR3xIw
	UR2cqSHJLL3AEOb5jEXWLoc7HuNGuUQJFsTeLumaNvb7yMVK02GS4q0NPPdntqK20+b+hIIlLZb
	ZTSdFbMyLxVW3NkGt2SXYOmlTlRCkclx/cEYgyl1nSUz975rEbEXqrEhEtbBGGw==
X-Google-Smtp-Source: AGHT+IGT+lil671w5tKfGQTt3hDCdLiNrQBA/lVDD5of0ACoXnAuvKi/jCZYmuhOqV+AAhs+Fe6WrQ==
X-Received: by 2002:a17:902:f647:b0:269:a8a8:4029 with SMTP id d9443c01a7336-27ed49df2c1mr61030335ad.5.1758830381338;
        Thu, 25 Sep 2025 12:59:41 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fcasm32745765ad.93.2025.09.25.12.59.40
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:59:41 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-330631e534eso1419077a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 12:59:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4+cwNC2dE1yx5hhZq0cXrQDgzevZJHdWIAhNHJoEEP1Wj2JF3hXHstYkUQvg3gbHUs4nr95g8i/g/Vg==@lists.infradead.org
X-Received: by 2002:a17:90b:538e:b0:32e:18b2:5a45 with SMTP id
 98e67ed59e1d1-3342a20b94dmr4932192a91.5.1758830380238; Thu, 25 Sep 2025
 12:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com> <20250925084806.89715-2-cuiyunhui@bytedance.com>
In-Reply-To: <20250925084806.89715-2-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Sep 2025 12:59:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
X-Gm-Features: AS18NWBiujTv-FGvPpgY3gBOBVEPrJ77epiIZ9CDp8xRQDwQ7FOMR9gCNXwR3xI
Message-ID: <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld into common code
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_125942_782653_EAA57EAB 
X-CRM114-Status: GOOD (  12.08  )
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

SGksCgpPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCAxOjQ44oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQEAgLTE3LDYgKzE3LDcgQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L2NwdV9wbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L25taS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGVyZi9hcm1fcG11Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9zY2hlZC9jbG9jay5oPgo+IEBAIC02OTYsMTAgKzY5NywxMiBAQCBzdGF0
aWMgaW50IGFybXBtdV9nZXRfY3B1X2lycShzdHJ1Y3QgYXJtX3BtdSAqcG11LCBpbnQgY3B1KQo+
ICAgICAgICAgcmV0dXJuIHBlcl9jcHUoaHdfZXZlbnRzLT5pcnEsIGNwdSk7Cj4gIH0KPgo+IC1i
b29sIGFybV9wbXVfaXJxX2lzX25taSh2b2lkKQo+ICsjaWZkZWYgQ09ORklHX0hBUkRMT0NLVVBf
REVURUNUT1JfUEVSRgo+ICtib29sIGFyY2hfcGVyZl9ubWlfaXNfYXZhaWxhYmxlKHZvaWQpCj4g
IHsKPiAgICAgICAgIHJldHVybiBoYXNfbm1pOwo+ICB9Cj4gKyNlbmRpZgoKU2hvdWxkIHRoZSBw
cmV2aW91cyBjb21tZW50IG1vdmUgaGVyZSwgQUtBOgoKLyoKICogaGFyZGxvY2t1cF9kZXRlY3Rv
cl9wZXJmX2luaXQoKSB3aWxsIHN1Y2Nlc3MgZXZlbiBpZiBQc2V1ZG8tTk1JIHR1cm5zIG9mZiwK
ICogaG93ZXZlciwgdGhlIHBtdSBpbnRlcnJ1cHRzIHdpbGwgYWN0IGxpa2UgYSBub3JtYWwgaW50
ZXJydXB0IGluc3RlYWQgb2YKICogTk1JIGFuZCB0aGUgaGFyZGxvY2t1cCBkZXRlY3RvciB3b3Vs
ZCBiZSBicm9rZW4uCiovCgoKPiArc3RhdGljIGludCBfX2luaXQgaW5pdF93YXRjaGRvZ19mcmVx
X25vdGlmaWVyKHZvaWQpCj4gK3sKPiArICAgICAgIHJldHVybiBjcHVmcmVxX3JlZ2lzdGVyX25v
dGlmaWVyKCZ3YXRjaGRvZ19mcmVxX25vdGlmaWVyLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgQ1BVRlJFUV9QT0xJQ1lfTk9USUZJRVIpOwoKSSB0aGluayB5b3Ug
bmVlZCB0byBkbyBzb21ldGhpbmcgdG8gcHJldmVudCB0aGlzIGZyb20gaGFwcGVuaW5nIG9uIGFu
eQpwbGF0Zm9ybXMgdGhhdCBvdmVycmlkZSBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSwgcmln
aHQ/IFRoZXNlCmNwdWZyZXEgbm90aWZpZXJzIHdpbGwgYmUgdXNlbGVzcyBpbiB0aGF0IGNhc2Uu
Li4KCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
