Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B790DC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 04:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KNFnJAjEmdG7OhuB/VfvxR5JiFHpaur3RRDsbefHY0=; b=a+MIo5mVk01yux
	pq8qPR4eZjySGbNwBxfxK/afjYyLE0lFW32LFCzELJ1cqZCQ8hZghXAdB/W8IqbFdBoy4ciWRPvrh
	s6B4e2m+lWJZj4sHse/TJTcoGu0GxEl3PMmLs4j9f1/vXYq58F0PBdJyoj3TLDPuesAd1bjMxTt1P
	yl/fa4dsBfneHdvJ+qFfZJ0PQxnxV6wbZoP0ZQmICEm1NDRLoUkRvc6vP5VokX8RzjBEk+aVUzXTA
	Norx8TziPUnUbFm44gc0Q8wggQCDwo+Wis3PIcnM0NIx8GByw0T6f2pHDzSupGGkjGJc3qB/+H/px
	Xg5n/Jq9I0eJFnvJTNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTBI-009c43-Ci; Wed, 11 Jan 2023 04:57:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTBE-009c2n-Og
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 04:57:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id y1so15585018plb.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 20:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99ANLgFxphFa4RMobgrJ2eNXXnCEjcFv1k+7jyCUk6w=;
        b=gWWv6odFLymBS08N4tozgRxhRFJ+ZALqPSPoeMKugRXJa+GwIMDcXKdax6U/k0LRhx
         piOFg9ecmrA3RfcadxcaV5V0WPhFXiRctb9Tug1msbxQ6uJS30iuCbC1P7/KGSDug4hq
         MBb6ZF93HgapiAk9uonjwcd2GRNwofIKfkLfVIbzVcjt/5gUPtmrtEeKen6rNeAn4poa
         ge2KA2HKvTc3Eg1pkWi8VMHxijVWLcg2uGTdqr8uGU535oj528TCcFft0UdvUf0ZkKHU
         tC/Uwstx83j3ShDJQ9zYU21PuSdYaNaYGqDAz2bhOSqgoX15xPMQjSJ5AvjuwQ+C/080
         pPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99ANLgFxphFa4RMobgrJ2eNXXnCEjcFv1k+7jyCUk6w=;
        b=YsNnUL+383voc0FJlJEZv8BXp9zkFjPWJsNsIO6rjlJ7pEuuPTdcol9itUTe/qGJKe
         s5do8wlibRwsNGSziYeKMW+qo5PtnjGjCGL4+kswYw9xzrodqbaVWUA2MRuqx1+CMPpl
         naJCNxLpkuxvvCfGKoUC2E7aAjd46Cqvx57dj6hevt2sEBQZREYmdN2pjHc0IW+W9UHx
         avDGlKXUfOTefm0RSyESTKCInC0aXfJGO4jM1RdoP4caUYwAKFg5WJVZLG+AkrJqwlK3
         4b3QAJpamvkDWLH38EHtap9uYLI/Ppu7VH1E67EVxDBYRd3QUDRfb/h0NFqnZgFkO5rs
         dYOw==
X-Gm-Message-State: AFqh2krsKhRBgdZftXQh5ROsYI+UCxTAyLgAM7KuIyZh5K7KzZQMVaZn
	O8LxEwsvRHGMv4Fm3Lwz6tM45g==
X-Google-Smtp-Source: AMrXdXtgfQ5KvMHoQfuxK6nJGjeGMRvSM/O3IB+heakNvwrmn1TONARgj+bIf8D5Os1Hg20M9LfXcQ==
X-Received: by 2002:a17:902:caca:b0:192:f281:b933 with SMTP id y10-20020a170902caca00b00192f281b933mr20867374pld.9.1673413058790;
        Tue, 10 Jan 2023 20:57:38 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net. [63.157.97.90])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b00192b0a07891sm9043370plx.101.2023.01.10.20.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 20:57:38 -0800 (PST)
Message-ID: <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
Date: Tue, 10 Jan 2023 20:57:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
Content-Language: en-US
To: Jeff Law <jlaw@ventanamicro.com>, Vineet Gupta <vineetg@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>
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
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
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
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_205740_867599_AD64A838 
X-CRM114-Status: GOOD (  12.08  )
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

T24gMS8xMC8yMyAyMDoyOCwgSmVmZiBMYXcgd3JvdGU6Cj4gCj4gCj4gT24gMS8xMC8yMyAxODoy
MiwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6Cj4+IE9uIDEvMTAvMjMgMTA6MDcsIFZpbmVldCBH
dXB0YSB3cm90ZToKPj4+IFllcyBidWxrIG9mIGdsaWJjIG1pZ2h0IG5vdCBoYXZlIHZlY3RvciBj
b2RlLCBidXQgdGhvc2UgViBpZnVuYyByb3V0aW5lcyBkbyBhbmQgSU1PIAo+Pj4gdGhpcyBpbmZv
cm1hdGlvbiBuZWVkcyB0byBiZSByZWNvcmRlZCBzb21ld2hlcmUgaW4gdGhlIGVsZi4gQ2FzZSBp
biBwb2ludCBiZWluZyB0aGUgCj4+PiBjdXJyZW50IGlzc3VlIHdpdGggaG93IHRvIGVuYWJsZSBW
IHVuaXQuIENvbW11bml0eSB3YW50cyBhIHBlci1wcm9jZXNzIGVuYWJsZSwgdXNpbmcgYW4gCj4+
PiBleHBsaWNpdCBwcmN0bCBmcm9tIHVzZXJzcGFjZSAoc2luY2UgUlYgZG9lc24ndCBoYXZlIGZh
dWx0LW9uLWZpcnN0IHVzZSBoYXJkd2FyZSAKPj4+IG1lY2hhbmlzbSB1bmxpa2Ugc29tZSBvZiB0
aGUgb3RoZXIgYXJjaGVzKS4gQnV0IGhvdyBkb2VzIHRoZSBnbGliYyBsb2FkZXIga25vdyB0byAK
Pj4+IGludm9rZSBwcmN0bC4gV2UgY2FuJ3QganVzdCByZWx5IG9uIHVzZXIgZW52IEdMSUJDX1RV
TkFCTEUgZXRjIHNpbmNlIHRoYXQgbWlnaHQgbm90IGJlIAo+Pj4gYWNjdXJhdGUuIEl0IG5lZWRz
IHNvbWV0aGlnbiBjb25jcmV0ZSB3aGljaCBJTU8gY2FuIGNvbWUgZnJvbSBlbGYgYXR0cmlidXRl
cy4gSWYgbm90LCAKPj4+IGRvIHlvdSBoYXZlIHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBzb2x2ZSB0
aGlzIGlzc3VlID8KPj4KPj4gV2h5IG5vdCBqdXN0IGZhdWx0IG9uIGZpcnN0IHVzZSB0byBlbmFi
bGU/wqAgVGhhdCdzIHZhc3RseSBsZXNzIGNvbXBsaWNhdGVkIHRoYW4gdHJ5aW5nIAo+PiB0byBw
bHVtYiBhbnl0aGluZyB0aHJvdWdoIGVsZiByZXN1bHRpbmcgaW4gYSBwcmN0bC4KPiBXZWxsLCB0
aGUgYW5zd2VyIGlzIGluIFZpbmVldCdzIHBhcmFncmFwaCAtLSB0aGUgaGFyZHdhcmUgYXBwYXJl
bnRseSBkb2Vzbid0IGhhdmUgCj4gZmF1bHQtb24tZmlyc3QtdXNlIHdoaWNoIGlzIG1pZ2h0eSB1
bmZvcnR1bmF0ZS4KCk5vbnNlbnNlIC0tIHNzdGF0dXMudnMgc3RvcmVzIHtvZmYsIGluaXRpYWws
IGNsZWFuLCBkaXJ0eX0gc3RhdGUsIGp1c3QgbGlrZSBmcHUuCk5vdyB0cmVhdCB0aGUgdmVjdG9y
IHVuaXQganVzdCBsaWtlIGZwdSBsYXp5IG1pZ3JhdGlvbi4KCgpyfgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
