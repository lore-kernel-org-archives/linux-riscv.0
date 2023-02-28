Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D97FC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbeeYWsfnj0JXR474bEBhXmWlybze8/JRuAB7kICB8Y=; b=IsIUFhkm46stvt
	WLtvxcikHK7o324Ts4XQuSaHDtyf/HFJGUNCx8o/Y27P26T+B9Rnxz9+nAb0o+mqGW2knWSPwVzi6
	cDTOh0Jql21dU6U8yLo6Gh/jJsl90KXauMsJRCZuzrHwa1/h+7KFL2sFdREU7dt0zrMM0L0kHcZlj
	v6CvHQA+38hnoOQqFfVYYxIPiSkeAM2pVTehS5Sq7oapFHSjXypCcyt+uERqSeci8OHXvp1D95orO
	wqGMvUmY+5ZGfzqm9AYvSrw2eVLzUN8josLzBC6mX5ACplLvAGFKdyYvpznffjdEouEWoB1DS+NDo
	9ai79a+WuKGyHbYS0NpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX62P-00E8ZC-Eo; Tue, 28 Feb 2023 19:53:25 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX62G-00E8XH-OW
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:53:22 +0000
Received: by mail-il1-x129.google.com with SMTP id y14so4969276ilv.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677613995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=h3yLXNiVfmN3RxOHP4UXRJqVIkpPUuJoz4ZoS0dwPVA=;
        b=KyiY7f3h3PRzGWTzkBkS3cLSs2YnRRM4gAvY74hqkTny2R1hc/BRYiE6X7AWg/Vwic
         jdGcpajP6RLMu4GoQadZAS93X6dl6epfDeVru3RV8Nvsyz0NcMXEQOQFA+bD+TEBBlUQ
         DJB/nZQITUiv1c6/BV3izckXURL0ePToAlCHO/4BbGarST16MzBd2Uvz1yyF8fQFTezz
         EtgdUjG8ir4+qpHkDjLiahldIUaR6djXcYXoSyiLraESPOzNGp8Yqb8kC8rm6PUzhxqa
         2Z3MD7CjlZBFjD9OXIwjXMbrPFQD6f5GHuldKmfEA7m75vRlbXFRLE38//pHp1rvTP0y
         AuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677613995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3yLXNiVfmN3RxOHP4UXRJqVIkpPUuJoz4ZoS0dwPVA=;
        b=kxWjdBvV4mJZJ0ccIkA4NqqkQZWK2BWdGrgW3q4HzFvgSUzvvJrGC2eCk+BXVBIJKG
         oyLzOdbZFnYAlbUQCcodEKE/at5cloUyySTTc+iYlzmg9jSe6sokuW5RmZsb5y4AEer7
         ctkGFAcnYEIHoggPqr5zV/RmLSUixmdqqsykBvyRcPw7WAb2yqJGIpZyjjiCJP+c7bWM
         p1VD96MfbBBgzlmHjsJxEwSutkJNBc+3oeWayoWDIauHJFZecrSbmLDAX+5vaW0hGDJ3
         EjdI+O40v11Gg9DcCWJnlftGPw9gGHrzvQVr7CN/+zlSHzvQMePbYqswsdx5OJOuRgxt
         fSKg==
X-Gm-Message-State: AO0yUKWBaNUQhU03Ol7cp8dwYkBS58N/s/YdDrY5ZjQ2MOCl7aMgsTSP
	MA0dQmxPRsWFSKGLN56hRk8=
X-Google-Smtp-Source: AK7set+dV2A5LmhjQfO69Hk/t81YPYmnCSWJWXqk9BOCIxIFkq/80wWKU1WzaeB5+YmDjgRtmGglpQ==
X-Received: by 2002:a05:6e02:1b88:b0:315:2d37:993 with SMTP id h8-20020a056e021b8800b003152d370993mr4331585ili.3.1677613995391;
        Tue, 28 Feb 2023 11:53:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5-20020a02c005000000b003ad13752c9csm3162809jai.72.2023.02.28.11.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 11:53:14 -0800 (PST)
Message-ID: <056964b6-c313-d91a-3c35-5c1dbf8dd431@roeck-us.net>
Date: Tue, 28 Feb 2023 11:53:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] riscv, lib: Fix Zbb strncmp
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230228184211.1585641-1-bjorn@kernel.org>
 <Y/5SJc1AlfnY/l3l@spud>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y/5SJc1AlfnY/l3l@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_115316_831742_451BCAA7 
X-CRM114-Status: GOOD (  12.49  )
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

T24gMi8yOC8yMyAxMToxMiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDI4LCAy
MDIzIGF0IDA3OjQyOjEwUE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEZyb206IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4KPj4gVGhlIFpiYiBvcHRpbWl6ZWQg
c3RybmNtcCBoYXMgdHdvIHBhcnRzOyBhIGZhc3QgcGF0aCB0aGF0IGRvZXMgWExFTi84Qgo+PiBw
ZXIgaXRlcmF0aW9uLCBhbmQgYSBzbG93IHRoYXQgZG9lcyBvbmUgYnl0ZSBwZXIgaXRlcmF0aW9u
Lgo+Pgo+PiBUaGUgaWRlYSBpcyB0byBjb21wYXJlIGFsaWduZWQgWExFTiBjaHVua3MgZm9yIG1v
c3Qgb2Ygc3RyaW5ncywgYW5kIGRvCj4+IHRoZSByZW1haW5kZXIgdGFpbCBpbiB0aGUgc2xvdyBw
YXRoLgo+Pgo+PiBUaGUgWmJiIHN0cm5jbXAgaGFzIHR3byBpc3N1ZXMgaW4gdGhlIGZhc3QgcGF0
aDoKPj4KPj4gSW5jb3JyZWN0IHJlbWFpbmRlciBoYW5kbGluZyAod3JvbmcgY29tcGFyZSk6IEFz
c3VtZSB0aGF0IHRoZSBzdHJpbmcKPj4gbGVuZ3RoIGlzIDkuIE9uIDY0YiBzeXN0ZW1zLCB0aGUg
ZmFzdCBwYXRoIHNob3VsZCBkbyBvbmUgaXRlcmF0aW9uLAo+PiBhbmQgb25lIGl0ZXJhdGlvbiBp
biB0aGUgc2xvdyBwYXRoLiBJbnN0ZWFkLCBib3RoIHdlcmUgZG9uZSBpbiB0aGUKPj4gZmFzdCBw
YXRoLCB3aGljaCBsZWFkIHRvIGluY29ycmVjdCByZXN1bHRzLiBBbiBleGFtcGxlOgo+Pgo+PiAg
ICBzdHJuY21wKCIvZGV2L3ZkYSIsICIvZGV2LyIsIDUpOwo+Pgo+PiBDb3JyZWN0IGJ5IGNoYW5n
aW5nICJiZ3QiIHRvICJiZ2UiLgo+Pgo+PiBNaXNzaW5nIE5VTEwgY2hlY2tzIGluIHRoZSBzZWNv
bmQgc3RyaW5nOiBUaGlzIGNvdWxkIGxlYWQgdG8gaW5jb3JyZWN0Cj4+IHJlc3VsdHMgZm9yOgo+
Pgo+PiAgICBzdHJuY21wKCIvZGV2L3ZkYSIsICIvZGV2L3ZkYVwwIiwgOCk7Cj4+Cj4+IENvcnJl
Y3QgYnkgYWRkaW5nIGFuIGFkZGl0aW9uYWwgY2hlY2suCj4+Cj4+IEZpeGVzOiBiNmZjZGIxOTFl
MzYgKCJSSVNDLVY6IGFkZCB6YmIgc3VwcG9ydCB0byBzdHJpbmcgZnVuY3Rpb25zIikKPj4gU3Vn
Z2VzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Cj4+IFNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBXaXRo
IHlvdXIgbmV3IHNlbGZ0ZXN0IHN0dWZmICYgb24gYSBKSDcxMTA6Cj4gVGVzdGVkLWJ5OiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IEFsc28sIGdpdmVuIHRoZSBy
ZXBvcnRlciwgdGhpcyBzaG91bGQgYmU6Cj4gUmVwb3J0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4KPiBubz8KPiAKCk5vIHdvcnJpZXMuIEknbGwgZ2l2ZSB0aGUgcGF0
Y2ggYSB0cnkuCgpHdWVudGVyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
