Return-Path: <SRS0=eDvz=DK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D6AC4363D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 09:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 773122067C
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 09:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3WBNHvbm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1gww9oL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 773122067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IYu93iJLXgteyY2NCQ54WxgO3cSHSyXrBoNHcM740U4=; b=3WBNHvbmCrNvRDzQUMuJBVbM+
	9ZrJIyxMj9LVPf5hh0dmkUG7Gf9qYabrOq9b6gao3Qgsmng9kotGbJ7bzEACvfUIyYvmvmCxRqENW
	rD6sd8E6MnruhdpTXIxaT3Ocg/UTTLQG/TAqAc577AF0dB7tmUaq6IQrzTrOlXbO6K/4dj4zcMexB
	XCg+QAtkFIKm9LZ5CohC6qtvgEIFtyOjZPUQHIaQJk+OKyQSVsi0vYSA3fmBQqdeyE6Ubw95uW1EI
	jEBuTJjmi3JXxN4KCcCIeNdAqdMULR/YA4ylFfWcYnkSk8Em/LGo8ZT+ErWmwPVKTQbDtPvI2YtPp
	fdnq09KVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOduO-0008VV-9q; Sat, 03 Oct 2020 09:32:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOduK-0008St-Sr; Sat, 03 Oct 2020 09:32:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id h7so727593wre.4;
 Sat, 03 Oct 2020 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wmkJ9FxHCpTr+iWv6GHurEZpNNofEO+mT2y21utzFUs=;
 b=i1gww9oLCuAl7ps5bghVOHqyGmypLPIhDKuBqotkCvdnqEFRaD36CeVYStIMsJFTUN
 D6OtC9a5Pd3uni6o0V4KWqVjMy4G9aoHk65TQ0a3vqdwc8JJkyW9d2HuLnCONT5/aDfg
 6/s3VQo5bRbDCwgHl10h4opIShPXPwp0jNEqEv/LXoy0m9KLmBLPzE2Ma/7RxYryfpvx
 KDR4E1aW4hiJeLllUYcX3LaBX6pETHnRvDUFo4bDzUh+KpIuRoixv+Md31XOw1sV9Y0U
 jfsAyXPOLfP0gNHv1chHDLJodyRwn8IOgMLUW4LseTUQ8ulmWGY0taiIppcuxmyOrSSX
 QMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wmkJ9FxHCpTr+iWv6GHurEZpNNofEO+mT2y21utzFUs=;
 b=ciS6nzzk3KuJQ6w0jkGm9tZMUZB5ws4S2BbKNvNN9Q5i1Gow70bYzWPOXh/y4ECGMu
 hbt9X0XDpWVs5NuvxHppcHko1rm8wkBnIwDBGXYP28dMwJj9AH8v2ViNa0wR9qJjZi8X
 bISDg7Bn2it/z6gzLaEpsO51EqdgVIbTtbRZPlrOeki1XmFcdq7yjmD4I5WAsggrUfg/
 JcJ18k0es8XnmCzu2UJfCj23G7dYpXUSiR/w+Jo5IZbmtwVx5IgeK7pzMWUZjEDRNivT
 LHG8axjIUGMHWBb8AbSCiujlC37IihcSLN+xN3eRrLJYmhpOfvzooaJMMtWBCnHvqksr
 kuZQ==
X-Gm-Message-State: AOAM5310S4pzki1SP10vy+oI4ia81kzjhliTpY3Kxi5RVpKgBqLn4IKC
 liXPwoVRoWrhgvNar97eksk=
X-Google-Smtp-Source: ABdhPJxF6OsanYU7MGuhJyTy3ufPHyRz/VHEz71PltEzIDMI5xb5/GcsYkMEQc6B2ut+ufvoU3MTDA==
X-Received: by 2002:adf:e391:: with SMTP id e17mr7048859wrm.289.1601717566307; 
 Sat, 03 Oct 2020 02:32:46 -0700 (PDT)
Received: from [192.168.1.143] ([170.253.60.68])
 by smtp.gmail.com with ESMTPSA id i14sm4778140wml.24.2020.10.03.02.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 02:32:45 -0700 (PDT)
Subject: Re: [PATCH] man2: new page describing memfd_secret() system call
From: Alejandro Colomar <colomar.6.4.3@gmail.com>
To: rppt@kernel.org, mtk.manpages@gmail.com
References: <20200924133513.1589-1-rppt@kernel.org>
 <efb6d051-2104-af26-bfb0-995f4716feb2@gmail.com>
Message-ID: <94cf1b3a-e191-a896-a27d-cd7649cb2c59@gmail.com>
Date: Sat, 3 Oct 2020 11:32:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <efb6d051-2104-af26-bfb0-995f4716feb2@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_053248_948907_F6AB4FD3 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-man@vger.kernel.org, tglx@linutronix.de,
 david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linux-mm@kvack.org, will@kernel.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com,
 idan.yaniv@ibm.com, linux-riscv@lists.infradead.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, tycho@tycho.ws, linux-nvdimm@lists.01.org,
 shuah@kernel.org, x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com,
 mingo@redhat.com, arnd@arndb.de, jejb@linux.ibm.com, bp@alien8.de,
 viro@zeniv.linux.org.uk, luto@kernel.org, paul.walmsley@sifive.com,
 kirill@shutemov.name, dan.j.williams@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTWlrZSBhbmQgTWljaGFlbCwKClBpbmcuIDopCgpUaGFua3MsCgpBbGV4CgpPbiAyMDIwLTA5
LTI0IDE2OjU1LCBBbGVqYW5kcm8gQ29sb21hciB3cm90ZToKPiAqIE1pa2UgUmFwb3BvcnQ6Cj4g
ID4gKy5QUAo+ICA+ICsuSVIgTm90ZSA6Cj4gID4gK1RoZXJlIGlzIG5vIGdsaWJjIHdyYXBwZXIg
Zm9yIHRoaXMgc3lzdGVtIGNhbGw7IHNlZSBOT1RFUy4KPiAKPiBZb3UgYWRkZWQgYSByZWZlcmVu
Y2UgdG8gTk9URVMsIGJ1dCB0aGVuIGluIG5vdGVzIHRoZXJlIGlzIG5vdGhpbmcgYWJvdXQgCj4g
aXQuwqAgSSBndWVzcyB5b3Ugd2FudGVkIHRvIGFkZCB0aGUgZm9sbG93aW5nIHRvIE5PVEVTICh0
YWtlbiBmcm9tIAo+IG1lbWJhcnJpZXIuMik6Cj4gCj4gLlBQCj4gR2xpYmMgZG9lcyBub3QgcHJv
dmlkZSBhIHdyYXBwZXIgZm9yIHRoaXMgc3lzdGVtIGNhbGw7IGNhbGwgaXQgdXNpbmcKPiAuQlIg
c3lzY2FsbCAoMikuCj4gCj4gQ2hlZXJzLAo+IAo+IEFsZXgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
