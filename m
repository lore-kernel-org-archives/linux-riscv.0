Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208B1C4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMTs1plOqPIEeo9xUqbe8ZgFBigmQsbM79Sppiw3QD4=; b=4iO7qjAe73r7L8
	Cvb/d8EesNTBMB4+e7Y98zl9yGwt2e7ZtXbN8uZfNYMoZ1yROudrPt+zmLhw3a/cghwnfQXMoOo9r
	Zg76FodMqlCgdt5ay7GJpKDCIyIjtunjeWRgdbN0kbX8lVx9iJtnLbnmEtFdDhLBJTFhwkHGG8b5h
	oAaAumMu6/OsJbZKZFRD/Y9xkc/GlViOuBswxfcxuCETQfFQ9VPjP7yjJz2yCqRmWf3uRg+P53WdG
	mCnhdU8uZkflpGhWBtrwZZ7Jdt68yTDA9mpcZ6XeHfIJ8sUIFcHIEPRVNtRjSV7hwotZRqQabhhvB
	FbGgrGUndipo+l4J7/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZvC-00GHtS-Mn; Thu, 05 Jan 2023 23:45:18 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZ6O-00FoXV-AF
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 22:52:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso3461059pjp.4
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jan 2023 14:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xPqcqfP+R6cjTpKSXy+DepcDvWCHJ3HLtdtMjkOD6M=;
        b=YRIId0z7Z0OkM4tG4tdh3zD2dljBTMRjBXAyHPsTQZgXNs46ltuRwZp2aM72+imZSW
         9eNMnTj2dL29Xlazz8Kw3JYvcAuQPPexbmOu1+M+iJx2mOA6569s9LvK9b9BHyi0auhr
         jyRdOEqmbJ+ykw7LMc98YGvwPpfcZFYXeZlQx2VkgsaSDHy9tidmyaBA8QGlV2ljA6s0
         xo7UXhIrNwb/USwJhvit18Pf0ACvh1r71Cd+yS5SAUf5GC7vzz3tplSAMDhV3QPYl8Ww
         9thDd916CbpSjGwuPxcJtPIwdU6JsMDiJMkY7UP35v0PBC3Hciat8yp20f8b98wRyJ5a
         /B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xPqcqfP+R6cjTpKSXy+DepcDvWCHJ3HLtdtMjkOD6M=;
        b=jj1YmShOwKXBZRoKHYqEK3GKtmlfP37FG7DsoM4HiZZwadS5h6yRsxh5X9dMGlcwMk
         HH/XoxaF3dyTVlpzrpA1ggx4wTkcHUueCgyD6X2B/Mh05Rs6nMmyPpinQHwotxA1fMXp
         C5C1Ve+b/mG+3dSJvwobFul5NxxFAK94ajr3E9RZ4FNgaDfBYR4TOPLZozgXBITYASGl
         IQ+6UM4tGgapxXQgA2EC2N79ZezTdrmQ3uNO3gq6XMtRPEzabuhVMgPQ3goYaI68vyHw
         HTXDmUVRtxLSYi/V0V8nBdbjN2pBJMerm9XjpXkqkYuvI48qV5RnjAXK+3lplktRGHOH
         fvbQ==
X-Gm-Message-State: AFqh2kpTEMhlgVdAmp3Bp2lVMGI0deSTIBzV3xGjHEP6Xj4b0p+ysFWe
	dPas8pfuLH0tnVghc1JYYCf08Q==
X-Google-Smtp-Source: AMrXdXtMPfooQy8XylDqs8MZsmVKorBkMZnwp9WoCqDpjmQ99IUOSg4mgyA3gmLTFTH+56Wg1hp56w==
X-Received: by 2002:a17:902:c9d2:b0:192:ee98:664c with SMTP id q18-20020a170902c9d200b00192ee98664cmr5971034pld.54.1672959165689;
        Thu, 05 Jan 2023 14:52:45 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b00186b86ed450sm26600496plh.156.2023.01.05.14.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 14:52:45 -0800 (PST)
In-Reply-To: <20230102160748.1307289-1-bjorn@kernel.org>
References: <20230102160748.1307289-1-bjorn@kernel.org>
Subject: Re: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
Message-Id: <167295914582.11542.7858478388954477018.b4-ty@rivosinc.com>
Date: Thu, 05 Jan 2023 14:52:25 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-kernel@vger.kernel.org, Björn Töpel <bjorn@rivosinc.com>,
  linux-trace-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Björn Töpel <bjorn@kernel.org>, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_145248_617589_18EAD55C 
X-CRM114-Status: UNSURE (   5.92  )
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

T24gTW9uLCAyIEphbiAyMDIzIDE3OjA3OjQ4ICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBJbiB0aGUgY29t
cHJlc3NlZCBpbnN0cnVjdGlvbiBleHRlbnNpb24sIGMuanIsIGMuamFsciwgYy5tdiwgYW5kIGMu
YWRkCj4gaXMgZW5jb2RlZCB0aGUgZm9sbG93aW5nIHdheSAoZWFjaCBpbnN0cnVjdGlvbiBpcyAx
NmIpOgo+IAo+IC0tLSstKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tCj4gMTAwIDAgcnMxWzQ6
MF0hPTAgICAgICAgMDAwMDAgMTAgOiBjLmpyCj4gMTAwIDEgcnMxWzQ6MF0hPTAgICAgICAgMDAw
MDAgMTAgOiBjLmphbHIKPiAxMDAgMCAgcmRbNDowXSE9MCByczJbNDowXSE9MCAxMCA6IGMubXYK
PiAxMDAgMSAgcmRbNDowXSE9MCByczJbNDowXSE9MCAxMCA6IGMuYWRkCj4gCj4gWy4uLl0KCkFw
cGxpZWQsIHRoYW5rcyEKClsxLzFdIHJpc2N2LCBrcHJvYmVzOiBTdHJpY3RlciBjLmpyL2MuamFs
ciBkZWNvZGluZwogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3BhbG1lci9jL2IyZDQ3M2E2
MDE5ZQoKQmVzdCByZWdhcmRzLAotLSAKUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
