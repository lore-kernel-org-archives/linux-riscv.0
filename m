Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B56AC07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE08D61164
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE08D61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SCW80HXSF/qemV9hlNtPQwbVjAWCL+Ww2wSE7oMdYoA=; b=n0gPe53+LS+bVH3btjJiIOcnJg
	cXKt30uMmbG+IHgufc3Ft4W9Ajlk+0AClV4ULrAMYvkvBrXVfneGgSTjF0fxUDab1aWCLp/DX91sL
	IpaqGEssr4LptARrTfBKTnCyAQzE5khk00H/VBISR68X06EGQqXchy7Cy39OpjFLyA7sRCTB3yTva
	b3YDFIGsQS/M8Tk2j3trn0p0gfq/SIMNPrUNfo4QjnPjLdbZWLgrxixKk9QwcDwmaGHdJOxDrmscX
	fZ2RsSxYYaRgqNyv9AB40UGG77ekcvGzVXiwKdkdn6maj7VUSwD18RGQMDCveDeFPPctU/c6fzd+e
	CzXqtU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Uao-009xTZ-8S; Mon, 19 Jul 2021 14:50:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Ual-009xSn-2x
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 14:50:00 +0000
Received: by mail-pg1-x52c.google.com with SMTP id o4so14601553pgs.6
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=B2nzWA43SctfqP1ezHeTfan06KfDKnUBR++2X2af3Gw=;
 b=k+YOkWKVK04qEvZ7AKLWBw5Ds+C57Bfyows/xXAnoc/eKY1AMXvJAveZT0N1gryE/g
 f8ZEphAOk5uXp/ZRhDyOSXrPv/1jP47b880We+EupRmaIa3Z36JgL8MCSaZ2Hxo8mKCP
 TNVuaiV9kXyVlni6kC/Nvt3SWQ09lax2g1yuJWQvNqLs5agKkLwEUGNX066oDtBBirg9
 HTtnykKZEFTSFSndrRRYsPlz7yOLzunVkVdLjVaiau7BjhduGnQE4vexisIQYXJ+EhCy
 EVa25z+rhOaJ9SG8G+aFxFlML0ZYpjHB4+W9viKxy9mM3WXLzbJkjs8aCFDjbbZ3yXIT
 AiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2nzWA43SctfqP1ezHeTfan06KfDKnUBR++2X2af3Gw=;
 b=ap1vqMUEupnu/0YQWmpxrKVrynco6YxoS4Ytz/zF2WqA7lPQpo0VFhOQ73a4Pyj/JA
 +cS+JlBTzvIA/gJab9DPpFlzlpIGSrGdXckgHI23bfx1hL4QCsAK7Pds6gcbwVEh65sI
 Q6GiCdzaeUkZ3AASQptgHTKfT0c0PckcumvP4XtMLhIZYC0Te1bMk2gFuXE9KQlU6+C/
 p+eqWxXb4rVfdwj2Kqt1Ap2F6oFv1JmsQ7kHUmdPckaxkc8cib2v3AfloDD/Q2uNVy32
 wg9r6XQP6/1Oc1F704X68XtFFwaNEk3pT+5dvkStN5PaHmFIPzQJkpJaZup0NLxEluaH
 XxtQ==
X-Gm-Message-State: AOAM531WrDhsEfLOVdQMFU8qsOYu2+l+KITzezwAwwXuIUDtDFDHzupn
 AsFt/4hxUA52qR05YQHvoA4=
X-Google-Smtp-Source: ABdhPJxc7fHduUTAef7dKUoDC71acywe90tKbLmnGKCav/9cta3aM5e7ckVLjCVYAqWJxRDM6xThmQ==
X-Received: by 2002:a63:1266:: with SMTP id 38mr26190909pgs.154.1626706197950; 
 Mon, 19 Jul 2021 07:49:57 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id gb10sm20161764pjb.43.2021.07.19.07.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 07:49:57 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
 <cd14a8b0-0a27-77a8-6dc2-3268f9f09922@roeck-us.net>
 <e1bb4768-5517-8ef3-eaf3-bbfc103fa918@gmail.com>
 <9a2bf544-2aaa-d175-bc0a-c8bcefd8141a@roeck-us.net>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <718c5a83-de9f-3b5a-ef36-e52ad5bb4d67@gmail.com>
Date: Mon, 19 Jul 2021 23:49:53 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9a2bf544-2aaa-d175-bc0a-c8bcefd8141a@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_074959_192433_06064708 
X-CRM114-Status: GOOD (  21.27  )
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

Ck9uIDcvMTkvMjAyMSAxMToyNCBQTSwgR3VlbnRlciBSb2VjayB3cm90ZToKPiBPbiA3LzE5LzIx
IDc6MDAgQU0sIEFraXJhIFRzdWthbW90byB3cm90ZToKPj4KPj4gT24gNy8xOS8yMDIxIDEwOjUx
IFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gNy8xOS8yMSA1OjUz
IEFNLCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4+Pj4KPj4+PiBUaGlzIHBhdGNoIHdpbGwgcmVk
dWNlIGNwdSB1c2FnZSBkcmFtYXRpY2FsbHkgaW4ga2VybmVsIHNwYWNlIGVzcGVjaWFsbHkKPj4+
PiBmb3IgYXBwbGljYXRpb24gd2hpY2ggdXNlIHN5cy1jYWxsIHdpdGggbGFyZ2UgYnVmZmVyIHNp
emUsIHN1Y2ggYXMKPj4+PiBuZXR3b3JrIGFwcGxpY2F0aW9ucy4gVGhlIG1haW4gcmVhc29uIGJl
aGluZCB0aGlzIGlzIHRoYXQgZXZlcnkKPj4+PiB1bmFsaWduZWQgbWVtb3J5IGFjY2VzcyB3aWxs
IHJhaXNlIGV4Y2VwdGlvbnMgYW5kIHN3aXRjaCBiZXR3ZWVuIHMtbW9kZQo+Pj4+IGFuZCBtLW1v
ZGUgY2F1c2luZyBsYXJnZSBvdmVyaGVhZC4KPj4+Pgo+Pj4KPj4+IEkgaGFkIHRvIHJldmVydCB0
aGUgb3JpZ2luYWwgcGF0Y2ggZnJvbSB0aGUgbWFpbmxpbmUga2VybmVsIHByaW9yIHRvIGFwcGx5
aW5nCj4+PiB0aGlzIHBhdGNoLiBPYnZpb3VzbHkgdGhhdCBtZWFucyB0aGF0IHRoZXJlIG1heSBi
ZSBvdGhlciBjaGFuZ2VzIGFmZmVjdGluZyB0aGUKPj4+IG91dGNvbWUuCj4+Pgo+Pj4gcmlzY3Y2
NCBpbWFnZXMgd29yaywgYnV0IHJpc2N2MzIgaW1hZ2VzIHN0aWxsIGZhaWwgd2l0aCB0aGlzIHBh
dGNoIGFwcGxpZWQuCj4+PiBUaGUgZXJyb3IgaXMgYSBiaXQgZGlmZmVyZW50IHRoYW4gYmVmb3Jl
LCB0aG91Z2guCj4+Pgo+Pj4gLi4uCj4+PiBbwqDCoCAxMS44OTk5NzldIFJ1biAvc2Jpbi9pbml0
IGFzIGluaXQgcHJvY2Vzcwo+Pj4gW8KgwqAgMTIuMTUyNjY2XSByYW5kb206IGZhc3QgaW5pdCBk
b25lCj4+PiBtb3VuOiBhcHBsZXQgbm90IGZvdW5kCj4+PiAi77+977+977+977+977+9Vu+/vXQ6
IGFwcGxldCBub3QgZm91bmQKPj4+IC9iae+/ve+/ve+/ve+/ve+/vVbvv71GLTogYXBwbGV0IG5v
dCBmb3VuZAo+Pj4gbW91bjogYXBwbGV0IG5vdCBmb3VuZAo+Pj4gc3dhb246IGFwcGxldCBub3Qg
Zm91bmQKPj4+IGhvc3RuYW1lLUY6IGFwcGxldCBub3QgZm91bmQKPj4+Cj4+PiBBZnRlciB0aGlz
LCB0aGUgaW1hZ2UgaGFuZ3MuCj4+Pgo+Pj4gRm9yIGNvbXBhcmlzb24sIHRoZSBtYWlubGluZSBr
ZXJuZWwgKHY1LjE0LXJjMikgZmFpbHMgYXMgZm9sbG93cy4KPj4+Cj4+PiBbwqDCoCAxMC43ODgx
MDVdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+Pj4gU3RhcnRpbmcgc3lzbG9nZDog
T0sKPj4+IFN0YXJ0aW5nIGtsb2dkOiBPSwo+Pj4gL2V0Yy9pbml0LmQvUzAyc3lzY3RsOiBsaW5l
IDY4OiBzeW50YXggZXJyb3I6IEVPRiBpbiBiYWNrcXVvdGUgc3Vic3RpdHV0aW9uCj4+PiAvZXRj
L2luaXQuZC9TMjB1cmFuZG9tOiBsaW5lIDE6IHN5bnRheCBlcnJvcjogdW50ZXJtaW5hdGVkIHF1
b3RlZCBzdHJpbmcKPj4+IFN0YXJ0aW5nIG5ldHdvcms6IC9iaW4vc2g6IHN5bnRheCBlcnJvcjog
dW50ZXJtaW5hdGVkIHF1b3RlZCBzdHJpbmcKPj4+IHNlZDogdW5tYXRjaGVkICcvJwo+Pj4gL2Jp
bi9zaDogc3ludGF4IGVycm9yOiB1bnRlcm1pbmF0ZWQgcXVvdGVkIHN0cmluZwo+Pj4gRkFJTAo+
Pj4gL2V0Yy9pbml0LmQvUzU1cnVudGVzdDogbGluZSA0ODogc3ludGF4IGVycm9yOiBFT0YgaW4g
YmFja3F1b3RlIHN1YnN0aXR1dGlvbgo+Pj4KPj4+IEknbGwgYmUgaGFwcHkgdG8gcHJvdmlkZSBp
bmZvcm1hdGlvbiBvbiBob3cgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtCj4+PiBpZiBuZWVkZWQu
IFBsZWFzZSBsZXQgbWUga25vdy4KPj4KPj4gWWVzLCBJIGRvIHdvdWxkIGxpa2UgdG8ga25vdyB0
aGUgcHJvY2VkdXJlIG9mIGJ1aWxkIGluc3RydWN0aW9uIG9mIHlvdXIgcnYzMiBpbWFnZS4KPj4g
VGhlbiBJIHdvdWxkIHJlcHJvZHVjZSB0aGUgZXJyb3IgYW5kIGxvb2sgaW50byBob3cgdG8gZml4
IGl0Lgo+Pgo+IFBsZWFzZSBoYXZlIGEgbG9vayBhdCBodHRwOi8vc2VydmVyLnJvZWNrLXVzLm5l
dC9xZW11L3Jpc2N2MzIvCj4gYW5kIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFueXRoaW5nIGVs
c2UuCgpUaGFua3MgZm9yIHRoZSBsaW5rLiBJIHdpbGwgd29yayBvbiBpdCB0b21vcnJvdyBpbiBt
eSB0aW1lLgpCdWlsZGluZyB0aGUga2VybmVsIHdpdGggZGVmY29uZmlnIGxvb2tzIG11Y2ggcXVp
Y2tlciB0aGFuIHRoZSBjb25maWcuCkkgd2lsbCB0cnkgaXQgZnJvbSBkZWZjb25maWcgYW5kIHRo
ZW4gY29uZmlnLgoKQWxzbyBJIHdvdWxkIGxpa2UgdG8gdXNlIHRoZSBzYW1lIHJ2MzIgdG9vbGNo
YWluLiBBcmUgeW91IHVzaW5nIHByZWJ1aWx0CnJpc2N2MzItbGludXgtZ2NjPyBTaG91bGQgbm90
IG1ha2UgZGlmZmVyZW5jZXMgYnV0IGp1c3QgaW4gY2FzZS4KCklzIHRoZXJlIGEgcHVibGljIHJl
ZmVyZW5jZSBmb3IgdGhlIHdheSBvZiBidWlsZGluZyB5b3VyIHFlbXUgYW5kIG9wZW5zYmk/Ck5v
dCBzdXJlIHdoaWNoIHZlcnNpb24gb2YgcWVtdSB3aXRoIHdoaWNoIHJ2MzIgdG8gYnVpbGQgdGhl
bSwgcnYzMmksIHJ2MzJpbWFkIG9yIGVsc2UuCgpJIHJlYWxseSBhcHByZWNpYXRlIHlvdXIgaGVs
cC4KCkFraXJhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
