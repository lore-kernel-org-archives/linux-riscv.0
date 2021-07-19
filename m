Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5E3C07E9B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 13:51:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315A56108B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 13:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 315A56108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycW5WWJxFOvlelTTk4VmuN4y0m8144pSIrRWJUEgLHw=; b=qGQGXPiM2/Qovfxxl297QRSs6y
	nTrp7wqD7PZrPPjL0Gg1PxkNI1q8eSqyDryh/RR81KYe5rk+m/uM22II8Sbpjs5ReiUHZ0Ql7OkFB
	J7ta48O/QZDJkMlJ56Is1D+DZ44l//DthMuIFJxgFQsdRxFnDhLT/2gfUXP3fFyIc4gWfLZ/qU8gx
	izj9/rh2Dx4pjJu6TnMlO71RZKjA4YJdH+axyyfktQ4/LBA0qPx/qmPwkVfcmP8mMpCgInhtmTGZC
	CefAj4T9TPbaZfN13fvsrP/lrGlQAfZGVh2mSU+ZM7KETEexI7FQ+gx72O5bn+vpu8aF4Lyl2W4XL
	WojiP33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Tfv-009o6A-1G; Mon, 19 Jul 2021 13:51:15 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Tfr-009o4m-IU
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 13:51:13 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 s2-20020a0568301e02b02904ce2c1a843eso7699534otr.13
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G6MwYyfQ7hWYMM8FEazyj6+PGlDAQxVO02bzWLIZ5AY=;
 b=hj0dhjZ5Jnrq0wnLeD39kxY2zFJbc0JkNv00IalygYNJ3E8rmuvZfs7ojbG1hVnYE7
 +6X5m1aumTOtEOShM59Q74bb27lD0B5YUrn7cW8tI8gWo60MYcv6St38IHpf94mrclno
 ir243xYtz3IYzxqyVMp4K8X4fuSAy/6DbyUnXmjA4flnGWrBvwq+ufE11Hjg+djxtQhl
 eZchId3HUUvJfiR2/2s8/H/6suP7uaoD94cpvxvf2YLf/EGBcU+mf7mfiB/omSsATC2n
 6GXAtMGCF4KNHYFEfYYsja61Zrb0KByPZm8d1BrvAY6e5cBFdjVhUA55IjneEV8+L0EY
 VpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6MwYyfQ7hWYMM8FEazyj6+PGlDAQxVO02bzWLIZ5AY=;
 b=s7AUkNKUFj4nn/i0CryWA8DYJo34AWUjWiaS3LuSKnSk9wzjWXk8u+lU7+Y5MFgoVa
 4X46e9JIfNrDYR/p8Yg3YhavAcX7ah4OM5UROC8EVia/h23PbAJ3K96T6mB1nDY7NJVF
 Gz1HEUsf/cl7lHiU6jqLoueX1byeWl54fgW0cW0/Dbl+gMIJUfH8mfs3DXn6JAKLAFfu
 fJhZ+4bBaPbmifjfkQomvZfH5SlEBIxKCD+y+pN0jbXkYmjm+UAulFhIU+CO+0oTKnuC
 RdLIl+gf2gmU8Zxp8prei8HxY2leETXst4FudmDa4L7Gwe5FUXTM9rkgBDdpcOoVPHxP
 28LQ==
X-Gm-Message-State: AOAM5305UDeTuHjJo5k8SJVyvvkMYyQdHoc18C3rwLl3m+bBKpZ0GIvK
 OFjRrIiexkClu5aChSzn+cA=
X-Google-Smtp-Source: ABdhPJy18zSSDt3JevOP6vVdaJbAZPIWCx+ATWkru0QavxZrggE4SSHexm+jtcXhxGlaBdB2vZey9A==
X-Received: by 2002:a9d:3a49:: with SMTP id j67mr19812527otc.114.1626702669812; 
 Mon, 19 Jul 2021 06:51:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x129sm3734177oia.26.2021.07.19.06.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 06:51:09 -0700 (PDT)
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
Message-ID: <cd14a8b0-0a27-77a8-6dc2-3268f9f09922@roeck-us.net>
Date: Mon, 19 Jul 2021 06:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_065111_693299_BB4662C6 
X-CRM114-Status: GOOD (  15.97  )
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

SGksCgpPbiA3LzE5LzIxIDU6NTMgQU0sIEFraXJhIFRzdWthbW90byB3cm90ZToKPiAKPiBUaGlz
IHBhdGNoIHdpbGwgcmVkdWNlIGNwdSB1c2FnZSBkcmFtYXRpY2FsbHkgaW4ga2VybmVsIHNwYWNl
IGVzcGVjaWFsbHkKPiBmb3IgYXBwbGljYXRpb24gd2hpY2ggdXNlIHN5cy1jYWxsIHdpdGggbGFy
Z2UgYnVmZmVyIHNpemUsIHN1Y2ggYXMKPiBuZXR3b3JrIGFwcGxpY2F0aW9ucy4gVGhlIG1haW4g
cmVhc29uIGJlaGluZCB0aGlzIGlzIHRoYXQgZXZlcnkKPiB1bmFsaWduZWQgbWVtb3J5IGFjY2Vz
cyB3aWxsIHJhaXNlIGV4Y2VwdGlvbnMgYW5kIHN3aXRjaCBiZXR3ZWVuIHMtbW9kZQo+IGFuZCBt
LW1vZGUgY2F1c2luZyBsYXJnZSBvdmVyaGVhZC4KPiAKCkkgaGFkIHRvIHJldmVydCB0aGUgb3Jp
Z2luYWwgcGF0Y2ggZnJvbSB0aGUgbWFpbmxpbmUga2VybmVsIHByaW9yIHRvIGFwcGx5aW5nCnRo
aXMgcGF0Y2guIE9idmlvdXNseSB0aGF0IG1lYW5zIHRoYXQgdGhlcmUgbWF5IGJlIG90aGVyIGNo
YW5nZXMgYWZmZWN0aW5nIHRoZQpvdXRjb21lLgoKcmlzY3Y2NCBpbWFnZXMgd29yaywgYnV0IHJp
c2N2MzIgaW1hZ2VzIHN0aWxsIGZhaWwgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQuClRoZSBlcnJv
ciBpcyBhIGJpdCBkaWZmZXJlbnQgdGhhbiBiZWZvcmUsIHRob3VnaC4KCi4uLgpbICAgMTEuODk5
OTc5XSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKWyAgIDEyLjE1MjY2Nl0gcmFuZG9t
OiBmYXN0IGluaXQgZG9uZQptb3VuOiBhcHBsZXQgbm90IGZvdW5kCiLvv73vv73vv73vv73vv71W
77+9dDogYXBwbGV0IG5vdCBmb3VuZAovYmnvv73vv73vv73vv73vv71W77+9Ri06IGFwcGxldCBu
b3QgZm91bmQKbW91bjogYXBwbGV0IG5vdCBmb3VuZApzd2FvbjogYXBwbGV0IG5vdCBmb3VuZApo
b3N0bmFtZS1GOiBhcHBsZXQgbm90IGZvdW5kCgpBZnRlciB0aGlzLCB0aGUgaW1hZ2UgaGFuZ3Mu
CgpGb3IgY29tcGFyaXNvbiwgdGhlIG1haW5saW5lIGtlcm5lbCAodjUuMTQtcmMyKSBmYWlscyBh
cyBmb2xsb3dzLgoKWyAgIDEwLjc4ODEwNV0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNz
ClN0YXJ0aW5nIHN5c2xvZ2Q6IE9LClN0YXJ0aW5nIGtsb2dkOiBPSwovZXRjL2luaXQuZC9TMDJz
eXNjdGw6IGxpbmUgNjg6IHN5bnRheCBlcnJvcjogRU9GIGluIGJhY2txdW90ZSBzdWJzdGl0dXRp
b24KL2V0Yy9pbml0LmQvUzIwdXJhbmRvbTogbGluZSAxOiBzeW50YXggZXJyb3I6IHVudGVybWlu
YXRlZCBxdW90ZWQgc3RyaW5nClN0YXJ0aW5nIG5ldHdvcms6IC9iaW4vc2g6IHN5bnRheCBlcnJv
cjogdW50ZXJtaW5hdGVkIHF1b3RlZCBzdHJpbmcKc2VkOiB1bm1hdGNoZWQgJy8nCi9iaW4vc2g6
IHN5bnRheCBlcnJvcjogdW50ZXJtaW5hdGVkIHF1b3RlZCBzdHJpbmcKRkFJTAovZXRjL2luaXQu
ZC9TNTVydW50ZXN0OiBsaW5lIDQ4OiBzeW50YXggZXJyb3I6IEVPRiBpbiBiYWNrcXVvdGUgc3Vi
c3RpdHV0aW9uCgpJJ2xsIGJlIGhhcHB5IHRvIHByb3ZpZGUgaW5mb3JtYXRpb24gb24gaG93IHRv
IHJlcHJvZHVjZSB0aGUgcHJvYmxlbQppZiBuZWVkZWQuIFBsZWFzZSBsZXQgbWUga25vdy4KClRo
YW5rcywKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
