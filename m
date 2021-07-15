Return-Path: <SRS0=TeVA=MH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A9CC07E96
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jul 2021 06:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66A961358
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jul 2021 06:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B66A961358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K5DR2cEYkr+tJT7wIzacL4yIVuiqzTs13tSe5pBl3Ow=; b=XMTGpR1uJSCKZkUfn3Vo/nD40s
	Q3EjObcyrbLlM39mz7wUqhYlNuIGoAQDBDnQU1Qw1xDu9WNV2eMYz2NYdxwVUpT3N706V3wEptfwr
	FqHdjBo8z4BeSgNdG8NF0pPZA8Eb9t3RpqJl8c2L/HQZBqDUTSt7AvkRkNz+a4hYsbYEI9fWIlRnU
	EURm07IHoaItGPdN0LSzGSFJ/9/TV4c73ckGzK0iE1Z70AtydXu7upl7Q/UyHvy5KuJwPmNJ4Rh6v
	iNQdiLcZYOCQj8bFjt4/D+3Qb08GZuWQUzATSHGhmovNyW43n1Fsrs4ZnWyt2iHdnUTKo1/l343v1
	DWSvr6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ujE-00HF4r-80; Thu, 15 Jul 2021 06:20:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ujB-00HF4P-C4
 for linux-riscv@lists.infradead.org; Thu, 15 Jul 2021 06:20:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id h1so2649774plf.6
 for <linux-riscv@lists.infradead.org>; Wed, 14 Jul 2021 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3KEYRV18inQTvxQEnqR/XVe6/C5rX+tc+VWpSwxHYPA=;
 b=VKLtGA+Eu/71OhbovI75hGlNKv6anN9s84itIzsfFEminUCEj7EMW+9LuLjH4s8qyl
 qbPz62Qkv/52TuLe0OxHtGpTeN5XCIlLBF5ZfnVzAyox8b8uvekArNjyzf4CFoYoVL16
 VwtxPXcMa4pUGx5cjrofYbSvsc/QYbYXFUnZne9Q3kA5dPWAXC+UodCttN/Dl6KFh3yx
 xy8kJMhdRkAZobISbgNz3c9Vl3M5ujsTlDb0s11C3mfnI90HlRcU4y67bTr4hvgUJaLB
 3aIgzEjl/18UtraL0xRGv98D2/fDEpVb+yo817YdKlcnQjqCwjr+vhIwtsE25BM085mL
 LONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3KEYRV18inQTvxQEnqR/XVe6/C5rX+tc+VWpSwxHYPA=;
 b=ao63f25aw+8FDffMyQ/srW+d0nv+M05EqAyQZvDw23cSeZHJS61v+cA8z8N1UE/l4G
 67a79U8BLr0g7KSo1f9cnt2Q8bUphGy/CL2NzCYX7j0xs0OnEVFK6/0JK32Uq8K0F4uE
 IM2OTLASAqX+igcH6FA4PiZz5d6URGw0FdFk/pXsD6P8FZDtIadKWk3T6AdtyDEbqrW0
 e+tIC2PkiQeFp8Mj8znR9E2sNZ6UJLJ4+0bEZojEhg4aZgT6/Jc0tNT3ESRZVRR5UOgZ
 RhNz3VXbXf/9ezDLdg64j2geNP/H2+sciHQA7xX4TNbXPVLpnRJtK0TLmaYkbaT+50h7
 fiUA==
X-Gm-Message-State: AOAM530aljlWXTkzsz8vEx2BERtJDoSoMzu3zVQLKYNh8cxP+0MjiFWa
 3wInVDWgbauj2Q9+fwJLwQ4=
X-Google-Smtp-Source: ABdhPJyqZ7oJFlKXoHbeQ6MasTn8ZV58Ycg6hIwJbWFpqbmbcmtq3SDYKcAMtWPnMxOr005WRz7Lzg==
X-Received: by 2002:a17:90a:3e0f:: with SMTP id
 j15mr2678681pjc.178.1626330006434; 
 Wed, 14 Jul 2021 23:20:06 -0700 (PDT)
Received: from [192.168.1.123] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id u21sm4937658pfh.163.2021.07.14.23.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 23:20:05 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>
References: <3e1dbea4-3b0f-de32-5447-2e23c6d4652a@gmail.com>
 <60c1f087-1e8b-8f22-7d25-86f5f3dcee3f@gmail.com>
 <20210710014915.GA149706@roeck-us.net>
 <CAMuHMdWrrP37Kfp4yC8G5f6SvMtD6u_=JkqX-Nd97FS_mayYWQ@mail.gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <f0d06d39-3dc8-fb10-4d37-a75ef866cdc8@gmail.com>
Date: Thu, 15 Jul 2021 15:20:03 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWrrP37Kfp4yC8G5f6SvMtD6u_=JkqX-Nd97FS_mayYWQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_232009_478415_BF0AF8A8 
X-CRM114-Status: GOOD (  20.65  )
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

CgpPbiA3LzE0LzIwMjEgMzoxMCBBTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEfD
vG50ZXIsIFRzdWthbW90by1zYW4sCj4gCj4gT24gU2F0LCBKdWwgMTAsIDIwMjEgYXQgMzo1MCBB
TSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+PiBPbiBXZWQsIEp1
biAyMywgMjAyMSBhdCAwOTo0MDozOVBNICswOTAwLCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4+
PiBUaGlzIHBhdGNoIHdpbGwgcmVkdWNlIGNwdSB1c2FnZSBkcmFtYXRpY2FsbHkgaW4ga2VybmVs
IHNwYWNlIGVzcGVjaWFsbHkKPj4+IGZvciBhcHBsaWNhdGlvbiB3aGljaCB1c2Ugc3lzLWNhbGwg
d2l0aCBsYXJnZSBidWZmZXIgc2l6ZSwgc3VjaCBhcyBuZXR3b3JrCj4+PiBhcHBsaWNhdGlvbnMu
IFRoZSBtYWluIHJlYXNvbiBiZWhpbmQgdGhpcyBpcyB0aGF0IGV2ZXJ5IHVuYWxpZ25lZCBtZW1v
cnkKPj4+IGFjY2VzcyB3aWxsIHJhaXNlIGV4Y2VwdGlvbnMgYW5kIHN3aXRjaCBiZXR3ZWVuIHMt
bW9kZSBhbmQgbS1tb2RlIGNhdXNpbmcKPj4+IGxhcmdlIG92ZXJoZWFkLgo+Pj4KPj4+IEZpcnN0
IGNvcHkgaW4gYnl0ZXMgdW50aWwgcmVhY2hlcyB0aGUgZmlyc3Qgd29yZCBhbGlnbmVkIGJvdW5k
YXJ5IGluCj4+PiBkZXN0aW5hdGlvbiBtZW1vcnkgYWRkcmVzcy4gVGhpcyBpcyB0aGUgcHJlcGFy
YXRpb24gYmVmb3JlIHRoZSBidWxrCj4+PiBhbGlnbmVkIHdvcmQgY29weS4KPj4+Cj4+PiBUaGUg
ZGVzdGluYXRpb24gYWRkcmVzcyBpcyBhbGlnbmVkIG5vdywgYnV0IG9mdGVudGltZXMgdGhlIHNv
dXJjZSBhZGRyZXNzCj4+PiBpcyBub3QgaW4gYW4gYWxpZ25lZCBib3VuZGFyeS4gVG8gcmVkdWNl
IHRoZSB1bmFsaWduZWQgbWVtb3J5IGFjY2VzcywgaXQKPj4+IHJlYWRzIHRoZSBkYXRhIGZyb20g
c291cmNlIGluIGFsaWduZWQgYm91bmRhcmllcywgd2hpY2ggd2lsbCBjYXVzZSB0aGUKPj4+IGRh
dGEgdG8gaGF2ZSBhbiBvZmZzZXQsIGFuZCB0aGVuIGNvbWJpbmVzIHRoZSBkYXRhIGluIHRoZSBu
ZXh0IGl0ZXJhdGlvbgo+Pj4gYnkgZml4aW5nIG9mZnNldCB3aXRoIHNoaWZ0aW5nIGJlZm9yZSB3
cml0aW5nIHRvIGRlc3RpbmF0aW9uLiBUaGUgbWFqb3JpdHkKPj4+IG9mIHRoZSBpbXByb3Zpbmcg
Y29weSBzcGVlZCBjb21lcyBmcm9tIHRoaXMgc2hpZnQgY29weS4KPj4+Cj4+PiBJbiB0aGUgbHVj
a3kgc2l0dWF0aW9uIHRoYXQgdGhlIGJvdGggc291cmNlIGFuZCBkZXN0aW5hdGlvbiBhZGRyZXNz
IGFyZSBvbgo+Pj4gdGhlIGFsaWduZWQgYm91bmRhcnksIHBlcmZvcm0gbG9hZCBhbmQgc3RvcmUg
d2l0aCByZWdpc3RlciBzaXplIHRvIGNvcHkgdGhlCj4+PiBkYXRhLiBXaXRob3V0IHRoZSB1bnJv
bGxpbmcsIGl0IHdpbGwgcmVkdWNlIHRoZSBzcGVlZCBzaW5jZSB0aGUgbmV4dCBzdG9yZQo+Pj4g
aW5zdHJ1Y3Rpb24gZm9yIHRoZSBzYW1lIHJlZ2lzdGVyIHVzaW5nIGZyb20gdGhlIGxvYWQgd2ls
bCBzdGFsbCB0aGUKPj4+IHBpcGVsaW5lLgo+Pj4KPj4+IEF0IGxhc3QsIGNvcHlpbmcgdGhlIHJl
bWFpbmRlciBpbiBvbmUgYnl0ZSBhdCBhIHRpbWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWtp
cmEgVHN1a2Ftb3RvIDxha2lyYS50c3VrYW1vdG9AZ21haWwuY29tPgo+Pgo+PiBUaGlzIHBhdGNo
IGNhdXNlcyBhbGwgcmlzY3YzMiBxZW11IGVtdWxhdGlvbnMgdG8gc3RhbGwgZHVyaW5nIGJvb3Qu
Cj4+IFRoZSBsb2cgc3VnZ2VzdHMgdGhhdCBzb21ldGhpbmcgaW4ga2VybmVsL3VzZXIgY29tbXVu
aWNhdGlvbiBtYXkgYmUgd3JvbmcuCj4+Cj4+IEJhZCBjYXNlOgo+Pgo+PiBTdGFydGluZyBzeXNs
b2dkOiBPSwo+PiBTdGFydGluZyBrbG9nZDogT0sKPj4gL2V0Yy9pbml0LmQvUzAyc3lzY3RsOiBs
aW5lIDY4OiBzeW50YXggZXJyb3I6IEVPRiBpbiBiYWNrcXVvdGUgc3Vic3RpdHV0aW9uCj4+IC9l
dGMvaW5pdC5kL1MyMHVyYW5kb206IGxpbmUgMTogc3ludGF4IGVycm9yOiB1bnRlcm1pbmF0ZWQg
cXVvdGVkIHN0cmluZwo+PiBTdGFydGluZyBuZXR3b3JrOiAvYmluL3NoOiBzeW50YXggZXJyb3I6
IHVudGVybWluYXRlZCBxdW90ZWQgc3RyaW5nCj4gCj4+ICMgZmlyc3QgYmFkIGNvbW1pdDogW2Nh
NmVhYWEyMTBkZWVjMGU0MWNiZmMzODBiZjg5Y2YwNzkyMDM1NjldIHJpc2N2OiBfX2FzbV9jb3B5
X3RvLWZyb21fdXNlcjogT3B0aW1pemUgdW5hbGlnbmVkIG1lbW9yeSBhY2Nlc3MgYW5kIHBpcGVs
aW5lIHN0YWxsCj4gCj4gU2FtZSBoZXJlIG9uIHZleHJpc2N2LiBCaXNlY3RlZCB0byB0aGUgc2Ft
ZSBjb21taXQuCj4gCj4gVGhlIGFjdHVhbCBzY3JpcHRzIGxvb2sgZmluZSB3aGVuIHVzaW5nICJj
YXQiLCBidXQgY29udGFpbiBzb21lIGdhcmJhZ2UKPiB3aGVuIGV4ZWN1dGluZyB0aGVtIHVzaW5n
ICJzaCAtdiIuCj4gCj4gVHN1a2Ftb3RvLXNhbjogZ2xhbmNpbmcgYXQgdGhlIHBhdGNoOgo+IAo+
ICsgICAgICAgYWRkaSAgICBhMCwgYTAsIDgqU1pSRUcKPiArICAgICAgIGFkZGkgICAgYTEsIGEx
LCA4KlNaUkVHCj4gCj4gSSB0aGluayB5b3UgZm9yZ290IGFib3V0IHJ2MzIsIHdoZXJlIHJlZ2lz
dGVycyBjb3ZlciBvbmx5IDQKPiBieXRlcyBlYWNoPwoKVGhhbmtzIEfDvG50ZXIgYW5kIEdlZXJ0
IGZvciB0aGUgcG9pbnRpbmcgb3V0IHRoZSBlcnJvcnMuCkkgd2lsbCBzZW5kIHRoZSBmaXhlcywg
cHJvYmFibHkgdGhpcyB3ZWVrZW5kLgoKQWtpcmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
