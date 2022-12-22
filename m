Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9817C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 05:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sC6PmdqLcbXUA+uTMaZkbUTO89kPV4q+qWo5fwkAIsA=; b=nGdON1H2WBxwzD
	Rum3CmJeCljUptgL2n+njB76XDeteaXYeX2YXKRiC+0oKvfFXo5eW9qm/UqTxo63SWdgQ9BtjR/pg
	qQmxX5tOsPlDF4Z0FZj8iH+QMdDsGjSdHk8LVhgfsi73qDnRMcGCqK8MWeb95UjNG6NRag1uaCjuC
	zZKQK7JZrz+Jz1/M9dYikHcUCywb7jmKGf/lkCMawcKo4xVmo2XqHqJXf1eoq05TPjDyqRSXAC1NJ
	i5ifdsHZz5JRhuMCjBvC38REZZowJTzhCV/9NWCfHOQvxAosGJn7X1OJchemZFJIYO0/lrKMWfSE+
	Mso1qaaYq205tpQlw4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8EE8-007GCk-8A; Thu, 22 Dec 2022 05:34:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8EE5-007GAk-I0
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 05:34:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id x66so509104pfx.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 21:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCvsOMVyu33EiuAgfN+FUTCv48Y5LFF5xmGYl6cbsZ8=;
        b=posl3ujUfmEnbuhJ4wbgrQwA4tveQ8r275wCkAOUBHNF62AC516BykEVe3CLkhOEkQ
         Qv0z15P1h+gRtM7cvOqWPAxWABV/341zuKwhDJ7nY8K24q0sbgyW+Q3rFVX7PSaNJqFg
         zCsRBxk0dH5YtUfOxoGlbe/t/SQfdY1laSCR+FocZ78RVv00oCdQ5eN5hJBvETwiRacy
         PnauCn6H7FVTZLN5pdC5aLtALBWz6tk480K9UAVIp0LOGo4qKw0sLBdUTcr6Pe6XbJwb
         jk704pNet0Tqa9BS3CTQT4pQmGkUIbun8VMfw2qtVV2fpsEbl4aAak4HfVuEsaFc3Emu
         hQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCvsOMVyu33EiuAgfN+FUTCv48Y5LFF5xmGYl6cbsZ8=;
        b=uZRHrnbGBocEbMMe7ckpc3rOSX6eLvto8V8yYZ2z+ejIqmT786TR/dYY8P32FiNDG9
         v5bQ2l9Sr4HxQAJI0y58KrEf2y6Q54/DUujxk5Hhwj1TN5q1wAtOZoz2i3SSa4uhF274
         d3YFhewiOp7fvehRg8PgKw+DJAKGY1CMbGjqZIOCw/pA9QNmQUJ1SJEgXL/XVDyDc8eK
         vYa3LomMiOr5mBLHlPkRaXRb24ou/GrnidLwa5PaeJvzGD2BBrH0BsEkJyQzKfBgo6+Q
         LNFPlcS7derrFhWUbrcGLQ5oBp1Uenn/qlg+YachQwIP3oT+0sHOKVe7VScxQsNHW62q
         Idsw==
X-Gm-Message-State: AFqh2kqsmgFWAUDQj27CzqlZTQx3kUhzpW0TNxNu9JnxEP86IWFv91Kd
	VDwe650QNpBnHEq5tPbzZoMMEA==
X-Google-Smtp-Source: AMrXdXvJDhwA/xe0qthSaNRvP+uY/2elloYhctIze+8lvzMhgIzDor8thyir5QD8gt43N/qyO1hI+w==
X-Received: by 2002:a05:6a00:1caa:b0:57f:ca45:5fef with SMTP id y42-20020a056a001caa00b0057fca455fefmr5034136pfw.30.1671687279302;
        Wed, 21 Dec 2022 21:34:39 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:716e:2242:a3b5:8079? ([2602:47:d48c:8101:716e:2242:a3b5:8079])
        by smtp.gmail.com with ESMTPSA id k10-20020aa79d0a000000b00575da69a16asm11925339pfp.179.2022.12.21.21.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 21:34:38 -0800 (PST)
Message-ID: <34d0ac75-26a5-6fe3-1b21-efea1e2e88a5@linaro.org>
Date: Wed, 21 Dec 2022 21:34:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Vineet Gupta <vineetg@rivosinc.com>,
 Vincent Chen <vincent.chen@sifive.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_213441_648323_847BD7BB 
X-CRM114-Status: GOOD (  11.29  )
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

T24gMTIvMjEvMjIgMTE6NDUsIFZpbmVldCBHdXB0YSB3cm90ZToKPj4gKyBfX2V4dGVuc2lvbl9f
IHVuaW9uIHsKPj4gKyB1bnNpZ25lZCBsb25nIGxvbmcgaW50IGZwcmVnc1s2Nl0gX19hdHRyaWJ1
dGVfXyAoKF9fYWxpZ25lZF9fICgxNikpKTsKPj4gKyAvKiBLZXJuZWwgdXNlcyBzdHJ1Y3QgX19y
aXNjdl9mcF9zdGF0ZSB0byBzYXZlIGYwLWYzMSBhbmQgZmNzcgo+PiArIHRvIHRoZSBzaWduYWwg
Y29udGV4dCwgc28gcGxlYXNlIHVzZSBzY19mcHJlZ3MgdG8gYWNjZXNzIHRoZXNlCj4+ICsgZnB1
IHJlZ2lzdGVycyBmcm9tIHRoZSBzaWduYWwgY29udGV4dC4gKi8KPj4gKyB1bmlvbiBfX3Jpc2N2
X2ZwX3N0YXRlIHNjX2ZwcmVnczsKPj4gKyB9Owo+PiArCj4+ICsgX191OCBzY19leHRuW10gX19h
dHRyaWJ1dGVfXygoX19hbGlnbmVkX18oMTYpKSk7Cj4+IMKgIH07Cj4+Cj4+IMKgICNlbmRpZgo+
Pgo+Pgo+PiBUaGlzIGNoYW5nZSBjYW4gcmVkdWNlIG1lbW9yeSB3YXN0ZSBzaXplIHRvIDE2IGJ5
dGVzIGluIHRoZSB3b3JzdAo+PiBjYXNlLiBUaGUgYmVzdCBjYXNlIGhhcHBlbnMgd2hlbiB0aGUg
c2NfZXh0biBsb2NhdGVzIGF0IGEgMTYtYnl0ZQo+PiBhbGlnbmVkIGFkZHJlc3MuIFRoZSBzaXpl
IG9mIHRoZSBzdHJ1Y3Qgc2lnY29udGV4dCBpcyBzdGlsbCB0aGUgc2FtZS4KPiAKPiBJdHMgYSBu
ZWF0IHRyaWNrLiBCdXQgdGhlIGFkZGl0aW9uYWwgc3RhY2sgYWxpZ25tZW50IG1lYW5zIHdlIGNv
dWxkIHN0aWxsIHBvdGVudGlhbGx5IAo+IGNoYW5naW5nIHRoZSBzaXplIG9mIHNpZ2NvbnRleHQg
LSBldmVuIGlmIGJ5IDE2IGJ5dGVzIC0gYWdhaW4gZm9yIGV4aXN0aW5nIGJpbmFyaWVzLgoKVGhl
IHJpc2N2IHNpZ2NvbnRleHQgaXMgYWxyZWFkeSBhbGlnbmVkIGJ5IDE2LCB2aWEgX19yaXNjdl9x
X2V4dF9zdGF0ZSwgZndpdy4KCgpyfgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
