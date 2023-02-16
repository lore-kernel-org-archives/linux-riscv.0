Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D77C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+e0VP0YrI65ku7mPZ3Eb5RrLbza9RbcI6v4fYYbmOY=; b=t+8Ate3QmL5nlB
	ReGYOahunGVNuTDLTUh8MrV844Yd1PjptTRKsmZkCsfg20bCHDdf/tlgyRVD5AU7I2fMkKg4sOtrM
	h4JtpkQ7stAKxOTpjolIRkw4HqX4JKKFDK3+B/e9A3Nabf3NeX9rJsea6vkgOyEINhfcmzrJ2rk40
	78RC44HHO4mOq4NI55Kk2uRN9h/iwmSmx1KJa2tVSjVK/i5l5WXVxZSpBEiMKM00gYwYFdyHd5qdl
	AeIyL7BpDfUSVx2H+m0QyQqpOkgNHK2A/QEWRf+NatIhPXej5ly4Fpx0P6e5isv/8GMiw1Emai+VV
	emB2pGCZHxRXl134lfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYMk-008lYG-Pp; Thu, 16 Feb 2023 07:07:38 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYMg-008lXk-Jf
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 07:07:36 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-16cc1e43244so1523935fac.12
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 23:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmOQFdaAIyAOfFLdMeRV51+677qt49slvFEMnxIm3Lc=;
        b=M/7nKIKeBPnso2TkBqvxCbSwZyktqApzaM22W9Ca5gkcmNgWtQpBZnMiqjQX8I9y7z
         bt/9NdnShKCYCRBKyfq9r8Y6HMfbOg0whqQnXcuxLcnNfw31x8jazZ3hx7Ezv1F8J/2l
         Mo1l6t91/gDi9m2im5bI5dNcnB+IDBwc+lAquvsp8p0TAi3gzTJVKBj5Tbpt8KviVFIo
         vsRlnCtDoCkOhPGP97qTbcRflJDvG+HBcD+lv8JvE5WgtEBKvd9P/cJHPCsynAC4xrP6
         KeKBqHZ50pg/5d8OYOz3EEHkxyoMrwLIqj+IluiN37pdsEtBdNULJuMWWZlKa6yCYysi
         av9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmOQFdaAIyAOfFLdMeRV51+677qt49slvFEMnxIm3Lc=;
        b=RcDyPlvhBxwYNZ5xESLxBnRGnVFHNqAhkMZRxj3F1aW0Ff0JuH6vviGJ08D5G2Ztmg
         OsaF46Xf4sJvws/XvPEkFeFnOMuzpq1EWfe3aFMv/FIDYVFW3nK8ETCL9+WvkUi4Q2K9
         MutOzMlOMGeYkZEq0bulVc7ACJuTL8/0vz0ZDQX2IvfVwFEmkt6C03W0Bo4MoP6f+Mol
         klIitAK20O11+hXCPUgMUpQe0WUyb3TV6oTz1gKQl6qWPX3lxP1JZh4GhUwbZbINGeg3
         kYBBvLQ55qtQQO4SoWkLIpMVn7mDv2J8lBB+ZB/cmfii3PDDIQt+cSOrqJPqS8fsGz/I
         tYig==
X-Gm-Message-State: AO0yUKVYox8BpVvvx8iyqtGAbPFG9SfEcbNCOkhRXMdRfWm1C+qqdseW
	VrRWFzSPd2CPyF1Qz3dVvkM=
X-Google-Smtp-Source: AK7set/dfoZ+n5DMS9ZdRvqZzyq3xjMZFgmUDiZlQpYFrZwh9H69EaX/tIJax3V+CLDonim5O5WOOw==
X-Received: by 2002:a05:6871:287:b0:169:c549:6843 with SMTP id i7-20020a056871028700b00169c5496843mr2709257oae.46.1676531252560;
        Wed, 15 Feb 2023 23:07:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w1-20020a056870a2c100b0016dfaa8abf3sm317952oak.8.2023.02.15.23.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:07:31 -0800 (PST)
Message-ID: <b7da47c4-a7bb-b64b-4a26-735a4a4f02a1@roeck-us.net>
Date: Wed, 15 Feb 2023 23:07:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
 samuel@sholland.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
References: <20230212194735.491785-1-conor@kernel.org> <Y+q8ZnZ2A8g7BNdS@spud>
 <1944134.usQuhbGJ8B@diego> <45316784.fMDQidcC6G@diego>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
In-Reply-To: <45316784.fMDQidcC6G@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_230734_667116_D8774693 
X-CRM114-Status: GOOD (  14.44  )
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

T24gMi8xNS8yMyAxNDowMCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6ClsgLi4uIF0KPiBhZ2FpbiB3
aXRoIHRoZSBzYW1lIHZhcmlhbnRzCj4gLSBxZW11LXJpc2N2MzIgd2l0aG91dCB6YmIKPiAtIHFl
bXUtcmlzY3YzMiB3aXRoIHpiYgo+IC0gcWVtdS1yaXNjdjY0IHdpdGhvdXQgemJiCj4gLSBxZW11
LXJpc2N2NjQgd2l0aCB6YmIKPiAKPiBBbmQgYWxsIG9mIHRoZW0gYm9vdGVkIGZpbmUgaW50byBh
IG5mcy1yb290IChkZWJpYW4gZm9yIHJpc2N2NjQgYW5kIGEKPiBidWlsZHJvb3QgZm9yIHJpc2N2
MzIpLgo+IAo+IEkgZXZlbiBmb3JjZWQgYSBidWcgaW50byB0aGUgemJiIGNvZGUgdG8gbWFrZSBz
dXJlIHRoZSBwYXRjaGluZyB3b3JrZWQKPiBjb3JyZWN0bHkgKHdoZXJlIHRoZSBrZXJuZWwgZmFp
bGVkIGFzIGV4cGVjdGVkKS4KPiAKPiBRZW11LXZlcnNpb24gZm9yIG1lIHdhcyA3LjIuNTAgKHY3
LjIuMC03NDQtZzVhMzYzMzkyOWEtZGlydHkpCj4gCj4gSSBkaWQgdHJ5IHRoZSBvbmUgZnJvbSBE
ZWJpYW4tc3RhYmxlIChxZW11LTUuMikgYnV0IHRoYXQgd2FzIHRvbyBvbGQgYW5kCj4gZGlkbid0
IHN1cHBvcnQgWmJiIHlldC4KPiAKPiBPbmUgdGhpbmcgb2Ygbm90ZSwgdGhlICJhY3RpdmUiIDMy
Yml0IGNvbmZpZyBJIGhhZCwgc29tZWhvdyBkaWRuJ3QgcHJvZHVjZQo+IHdvcmtpbmcgaW1hZ2Vz
IGFuZCBJIG5lZWRlZCB0byBzdGFydCBhIG5ldyBidWlsZCB1c2luZyB0aGUgcnYzMl9kZWZjb25m
aWcuCj4gCj4gU28gcmlnaHQgbm93LCBJJ20gbm90IHN1cmUgd2hhdCBtb3JlIHRvIHRlc3QgdGhv
dWdoLgo+IAoKVHJ5IHRoaXM6CgotIFVzZSBuZXh0LTIwMjMwMjE2IGFzIGJhc2UuCi0gQXBwbHkK
ICAgICBSSVNDLVY6IHRha2UgdGV4dF9tdXRleCBkdXJpbmcgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcK
ICAgICBSSVNDLVY6IERvbid0IGNoZWNrIHRleHRfbXV0ZXggZHVyaW5nIHN0b3BfbWFjaGluZQog
ICBvbiB0b3Agb2YgaXQuCi0gQ29uZmlndXJlIGRlZmNvbmZpZyArIENPTkZJR19QUk9WRV9MT0NL
SU5HLgotIFJ1biBzb21ldGhpbmcgbGlrZQogICBxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQg
LW0gNTEyTSAtbm8tcmVib290IFwKICAgICAta2VybmVsIGFyY2gvcmlzY3YvYm9vdC9JbWFnZSAt
aW5pdHJkIHJvb3Rmcy5jcGlvIFwKICAgICAtYXBwZW5kICJyZGluaXQ9L3NiaW4vaW5pdCBjb25z
b2xlPXR0eVMwLDExNTIwMCBlYXJseWNvbj11YXJ0ODI1MCxtbWlvLDB4MTAwMDAwMDAsMTE1MjAw
IiBcCiAgICAgLW5vZ3JhcGhpYyAtbW9uaXRvciBub25lCgpUaGF0IHNob3VsZCBnaXZlIHlvdQoK
V0FSTklORzogQ1BVOiAwIFBJRDogMCBhdCBrZXJuZWwvdHJhY2UvdHJhY2VfZXZlbnRzLmM6NDQ4
IHRyYWNlX2V2ZW50X3Jhd19pbml0KzB4ZGUvMHg2NDIKLi4uCmV2ZW50IG5laWdoX3VwZGF0ZSBo
YXMgdW5zYWZlIGRlcmVmZXJlbmNlIG9mIGFyZ3VtZW50IDkKYW5kIGxvdHMgb2YgZm9sbG93LXVw
IG1lc3NhZ2VzLgoKSSB0cmllZCB3aXRoIHFlbXUgdjcuMi4wIGFuZCBxZW11IG1hc3RlciAodjcu
Mi4wLTE0MzQtZzZhNTBmNjRjYTApLgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
