Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFDCC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 05:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6us5+wJQ2o/ozsUqaHAPAyXn+mgWvGcypPVanOqS/L4=; b=xtokrOGVuIISmb
	/qS0oNDC6d3mO/u9X/PM6alRlbLDRccbdCFVlqEthp45bxh966WGwWvapEvYcR7I3bEGvt6hsCO7a
	icFn9eaTpWo1BtTqKU6gTS/zZ0ddAVAcQbIIW4rbqFrQYdmM3zovZf930PHCjDuB1qcwJAt3oSSLS
	s9hALHgFUEp5vR0QIneMqv3uGSOb6WyVCUIa53HLdvlHtHczoQ8fxgVDiOUqyomMENthZ1M9CHpaQ
	2Crs44dIESam75HwU0ylqJZ5TvjzHhhUo7uQ+I6vvVeMAUpeaC2lB/8SFvpgZ9CIPdFOVBcHphu86
	87OOrWe5rInwKYjwsn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTL3-009dkI-9x; Wed, 11 Jan 2023 05:07:49 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTL0-009dii-2d
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 05:07:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so15875138pjj.4
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 21:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jbzwp554wywzHNVVMHChM9DzhMTbyOsmi2YMZ/ITpA=;
        b=BxNi3cg+mWFxHu/yZLlIqcy0uTG6+8vV2PdJar/igkKsB4YS7DvCuSWBemQ0wnfg+k
         Agq8UfFuq7o7o7kiVbFZhDjQ/CvTmHeTiWGfW7BvPlkILGCMtkn6o5caserPkpecQUem
         wp6Gm8YkqXe1+dGkd69yfqnRJ0wH4utfM6SeDl7eS+hojIRiNmm5jdq4/CgnSftMLvEW
         rsHeSKSiBJCpiVlQih1G7TZH3CNryPlZGfzXLGxKzU3ybjgIU+ZEt1mngwXKOQEINQ62
         NMNcoY0+2Alb2PoGwr4b5MnCuEigxDT/PRVKit5Ai0V5bdZyV+yQcrX8B0AezRJzXmHN
         DGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jbzwp554wywzHNVVMHChM9DzhMTbyOsmi2YMZ/ITpA=;
        b=yU4FFBk62u42PNCK35NsWWlnysMHDGZ7dOq4SMPeei9Jf40G5LJnDEqdfiE4uvqeYs
         c1/B78eu4UpVdJG0OKOCwC25e3e02tgk9gO9k2RyaVdJSX3MSOGrTC+32gMBa1EAoRd4
         8/NXr/S8aMYwhypxnZP6vZkhKBuH/3JRjDwqMT9qQOKMukyjJEtpETa3C/koru6MF2WP
         qHjkuOGYNHCAwnrsZSRtaGEFQR7TW9o9pFNKjRx0ZwW/VNQWDiT6tJNw0z5H3dSbQ34U
         sgf4MRR0m0htuf9M2sEuP15Doi9tq8njdgy2DfbikEaWq32po/m7WhAEIxh1A22ZGKKr
         uBDA==
X-Gm-Message-State: AFqh2koeT2+kvoaaaifrOalaqfjVQVRlmBYRgaaGWiQjUCxBXmQ0TeeP
	stzJOVrDHxchSKSXO9VlE200bQ==
X-Google-Smtp-Source: AMrXdXuDFxUdDx6tQ118eIrW7EQ+X3GtiDgnhX9pLhKvmDCd6PtDt4pi6r2zX4IQpBBPIGJk7ZJEwg==
X-Received: by 2002:a05:6a20:d2cc:b0:af:f97e:efc7 with SMTP id ir12-20020a056a20d2cc00b000aff97eefc7mr85586557pzb.53.1673413662213;
        Tue, 10 Jan 2023 21:07:42 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id p128-20020a622986000000b00582cb9d9ad3sm9200974pfp.178.2023.01.10.21.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 21:07:41 -0800 (PST)
Message-ID: <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com>
Date: Tue, 10 Jan 2023 22:07:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Vineet Gupta <vineetg@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
 <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
 <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
 <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
 <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
 <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com>
 <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_210746_142285_67F76612 
X-CRM114-Status: GOOD (  12.35  )
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

CgpPbiAxLzEwLzIzIDIxOjU3LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToKPiBPbiAxLzEwLzIz
IDIwOjI4LCBKZWZmIExhdyB3cm90ZToKPj4KPj4KPj4gT24gMS8xMC8yMyAxODoyMiwgUmljaGFy
ZCBIZW5kZXJzb24gd3JvdGU6Cj4+PiBPbiAxLzEwLzIzIDEwOjA3LCBWaW5lZXQgR3VwdGEgd3Jv
dGU6Cj4+Pj4gWWVzIGJ1bGsgb2YgZ2xpYmMgbWlnaHQgbm90IGhhdmUgdmVjdG9yIGNvZGUsIGJ1
dCB0aG9zZSBWIGlmdW5jIAo+Pj4+IHJvdXRpbmVzIGRvIGFuZCBJTU8gdGhpcyBpbmZvcm1hdGlv
biBuZWVkcyB0byBiZSByZWNvcmRlZCBzb21ld2hlcmUgCj4+Pj4gaW4gdGhlIGVsZi4gQ2FzZSBp
biBwb2ludCBiZWluZyB0aGUgY3VycmVudCBpc3N1ZSB3aXRoIGhvdyB0byBlbmFibGUgCj4+Pj4g
ViB1bml0LiBDb21tdW5pdHkgd2FudHMgYSBwZXItcHJvY2VzcyBlbmFibGUsIHVzaW5nIGFuIGV4
cGxpY2l0IAo+Pj4+IHByY3RsIGZyb20gdXNlcnNwYWNlIChzaW5jZSBSViBkb2Vzbid0IGhhdmUg
ZmF1bHQtb24tZmlyc3QgdXNlIAo+Pj4+IGhhcmR3YXJlIG1lY2hhbmlzbSB1bmxpa2Ugc29tZSBv
ZiB0aGUgb3RoZXIgYXJjaGVzKS4gQnV0IGhvdyBkb2VzIAo+Pj4+IHRoZSBnbGliYyBsb2FkZXIg
a25vdyB0byBpbnZva2UgcHJjdGwuIFdlIGNhbid0IGp1c3QgcmVseSBvbiB1c2VyIAo+Pj4+IGVu
diBHTElCQ19UVU5BQkxFIGV0YyBzaW5jZSB0aGF0IG1pZ2h0IG5vdCBiZSBhY2N1cmF0ZS4gSXQg
bmVlZHMgCj4+Pj4gc29tZXRoaWduIGNvbmNyZXRlIHdoaWNoIElNTyBjYW4gY29tZSBmcm9tIGVs
ZiBhdHRyaWJ1dGVzLiBJZiBub3QsIAo+Pj4+IGRvIHlvdSBoYXZlIHN1Z2dlc3Rpb25zIG9uIGhv
dyB0byBzb2x2ZSB0aGlzIGlzc3VlID8KPj4+Cj4+PiBXaHkgbm90IGp1c3QgZmF1bHQgb24gZmly
c3QgdXNlIHRvIGVuYWJsZT/CoCBUaGF0J3MgdmFzdGx5IGxlc3MgCj4+PiBjb21wbGljYXRlZCB0
aGFuIHRyeWluZyB0byBwbHVtYiBhbnl0aGluZyB0aHJvdWdoIGVsZiByZXN1bHRpbmcgaW4gYSAK
Pj4+IHByY3RsLgo+PiBXZWxsLCB0aGUgYW5zd2VyIGlzIGluIFZpbmVldCdzIHBhcmFncmFwaCAt
LSB0aGUgaGFyZHdhcmUgYXBwYXJlbnRseSAKPj4gZG9lc24ndCBoYXZlIGZhdWx0LW9uLWZpcnN0
LXVzZSB3aGljaCBpcyBtaWdodHkgdW5mb3J0dW5hdGUuCj4gCj4gTm9uc2Vuc2UgLS0gc3N0YXR1
cy52cyBzdG9yZXMge29mZiwgaW5pdGlhbCwgY2xlYW4sIGRpcnR5fSBzdGF0ZSwganVzdCAKPiBs
aWtlIGZwdS4KPiBOb3cgdHJlYXQgdGhlIHZlY3RvciB1bml0IGp1c3QgbGlrZSBmcHUgbGF6eSBt
aWdyYXRpb24uClRoZW4gbGV0J3MgZG8gc29tZXRoaW5nIHNlbnNpYmxlLiAgICBNYW51YWxseSBl
bmFibGluZyB2aWEgcHJjdGwgc2VlbXMgCnNpbGx5IGlmIHdlIGhhdmUgZmF1bHQgb24gZmlyc3Qg
dXNlLgoKamVmZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
