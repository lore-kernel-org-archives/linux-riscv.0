Return-Path: <SRS0=1yfy=AP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9484C433DF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 12:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B821620885
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 12:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="saZE2lDl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9IRhHrz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B821620885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mgpNAEYeogPOHQufRWXWBw5+TBRGVq5gsAiveN6wPcA=; b=saZE2lDlSaXuqDs0syFja5mxn
	So+eQ5EanSCE4TezYyO9YaFFb2n+41DyjZ3jQXJQCwOwIOpCvCmHFLhJcBm0toKLCpghO6nFlwZxR
	Cjn9NI/cWlheqwnQ+sUpcY1Lssf0t7gafgVwpzChMspC7Ws6yFFxWiN1MMYXJyBror2DlFNZ8979I
	5dgaCXRmalFBTdWWnXDaVbE1mMOXfRnmNGKLXFOPUPbbfHWFd4v8jvVwxTnwOd+0lfZ3VjDjTc3mY
	d+VtYyV7dD0MyxUmH7u2gdhVD2OwXTuzG183tiiDLYryZ/YPtr2Z3TGfHKdMCfr9eIzifxsFW6U5X
	ORSG8CtvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrgzV-0002TA-G2; Sat, 04 Jul 2020 12:09:57 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrgzS-0002Sm-La
 for linux-riscv@lists.infradead.org; Sat, 04 Jul 2020 12:09:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id j4so33060268wrp.10
 for <linux-riscv@lists.infradead.org>; Sat, 04 Jul 2020 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q6/l6gbVd+4D3HhCjT+3idiCPEiasxsjgaH+81aczFE=;
 b=b9IRhHrzCgesVbckByioxGPz8FlQfkEkVf1NAa+4MF96GTovlwurUQsUsys1b5Ts4U
 ZoMO+/4NqCZOuk9mZuFSTIzqIvoCiTdOlygnvwJC2XxNUu38v/5vQyJP/L8OftsGaf54
 xmBDeimTuhrrVORWJCPd8tsTVsan5nSaASspLFjclUJqabNc3IgaNOO5zaMvfLGn1SgM
 qNz06vmFzuCymAFXe7A3ZxuFxVP7+iQFduXf12UNDfmfj4Z30Kr31ASgbLhIfdYanhER
 sKJnedGfLrmRiXrJw6KpcQmPi1syhPyDV5ZMEH4UMi0Dcupi5RHeRSDW8WmJtiOO2ffD
 0Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q6/l6gbVd+4D3HhCjT+3idiCPEiasxsjgaH+81aczFE=;
 b=lyKMG1Au+hlzQ8DTzu/eZsRa8Rd0Qi9HRdJeOWytloYcYWcFxVHZxQu3wPliw85NNf
 /rvlOVQ5IubNAyyqnGOuuK84s5Y2QT84T1ZQqt1A6Xa9hCI/3nJEqTa8L1FpZdZxY97W
 4d27AIFzHZmw0ZGbiW67NJ62o+g+CdtUwzg0th022AVIt5ynJfajjQf+624kECqF5Ik9
 8esfvpYKxE1AO8hRr0fws6ZP8eYNeg61MsL70tYMfF//Rm1tQhSDvpHLtq7rw3dDkAFT
 2HHcIz5xlnqJp2TXCt0J1meJVWl04e40ASevbCyfSjiHbEAchn/On7kVzxcY3PYFWOE3
 I4zg==
X-Gm-Message-State: AOAM531GRv4cYoKxeQLAHaSY7ChBypi4cmeNn+zwiMGpagC/IA6HYYtN
 bxAaITnpkEEM3vby9HyK8Kveqb/qrZaDM6JB8e0=
X-Google-Smtp-Source: ABdhPJwB9vVrA8j1YWUIpC/xHJschuvr8/Zcw6GKLce+xK6MBdOXF17mnIqhhLFLxsor2Wf7JWJi6AF5eWi6o8zAgcQ=
X-Received: by 2002:adf:ec90:: with SMTP id z16mr40439204wrn.52.1593864593453; 
 Sat, 04 Jul 2020 05:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200702200727.239348-1-kernel@esmil.dk>
 <CANBLGczQ51LQCiubvu2HTYrdnW2q_6GY_dfVNrV6M+dnRh1KQw@mail.gmail.com>
 <CAJ+HfNh38DwrwKrDi-S_3rzyF+=B4N3kXfAOoMEnXOyoq3LkSg@mail.gmail.com>
 <CANBLGcxf_vZ6b75Nm52-p0W-1h+Yft77gW+j+U5Wa-9uUo=pxw@mail.gmail.com>
In-Reply-To: <CANBLGcxf_vZ6b75Nm52-p0W-1h+Yft77gW+j+U5Wa-9uUo=pxw@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Sat, 4 Jul 2020 14:09:42 +0200
Message-ID: <CAJ+HfNhe=esLaRfDXfp93+GYSr+nGEoOswn=puggBPF8ikGw6g@mail.gmail.com>
Subject: Re: [RFC] riscv: Add jump-label implementation
To: Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_080954_791444_5EDC5723 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCA0IEp1bCAyMDIwIGF0IDEzOjM1LCBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVs
QGVzbWlsLmRrPiB3cm90ZToKPgo+IE9uIFNhdCwgNCBKdWwgMjAyMCBhdCAxMzoyMywgQmrDtnJu
IFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiA+IEluZGVlZC4g
QW5kIG5pY2Ugd29yayEgQ2FuIHlvdSByZXNwaW4gdGhlIHBhdGNoIHdpdGggdGhlIDMyYiBmaXgK
PiA+IGFib3ZlLCBhbmQgYWxzbyB3aXRob3V0IHRoZSBSRkMgdGFnPwo+Cj4gWWVzLCBvZiBjb3Vy
c2UuIElmIHlvdSBkb24ndCBtaW5kIEknbGwgd2FpdCBhIGJpdCBhbmQgbGV0IHRoaXMgY29sbGVj
dAo+IGEgYml0IG1vcmUgY29tbWVudHMuCj4KCkNlcnRhaW5seSEKCj4gPiBDdXJpb3VzOyBXaHkg
aXMgW2JyYW5jaCA/IDEgOiAwXSBuZWVkZWQgd2hlbiBjb2RpbmcgdGhlIGJvb2xlYW4gaW50bwo+
ID4gdGhlIGtleSBwb2ludGVyIChhcm02NCBpcyBqdXN0IFticmFuY2hdKS4gRGlmZmVyZW50IGVu
Y29kaW5nIG9mCj4gPiBib29sZWFucyAoYnJhbmNoIGluIHRoaXMgY2FzZSk/Cj4KPiBObywgdGhh
dCB3YXMganVzdCBtZSBiZWluZyB1bnN1cmUgZXhhY3RseSBob3cgYm9vbCB3b3JrcyB3aGVuIHVz
ZWQgYXMKPiBhbiBpbmRleC4gQWZ0ZXIgcmVhZGluZyB1cCBvbiBpdCBpdCBzZWVtcyB0aGUgb3Jp
Z2luYWwgY29kZSBpcyByaWdodCwKPiB5b3UgY2FuIGFjdHVhbGx5IHRydXN0IHRoYXQgX0Jvb2wg
aXMgZWl0aGVyIDAgb3IgMS4gSSdsbCBmaXggaXQgaW4gdGhlCj4gbmV4dCB2ZXJzaW9uLiBUaGFu
a3MhCj4KCkNvb2whIFRoYW5rcyBmb3IgY2xlYXJpbmcgdGhhdCB1cCBmb3IgbWUhCgpDaGVlcnMs
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
