Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7303C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWzshF8MXXCdvQizwkjkGrWbpi9Ee5mJ7mNuTyqBePs=; b=BWrn9nPRZjm9iG
	uzpQV3T93L7t79ybwgrzuJlXVMsXpdUXL8LbFYLFxW3n1VOnM6fmbD3g862qbJ2hKeP2BGP/z5NBv
	FN1jKtGr4K1CW7dYF5axo8M3F5VAmO59QHH0a6UhdW0G8blQxcXtk8nPHX//EkEudNFelZzLQ6obd
	t1Cv9D5jjGAEIdkjbaVeX7M0cSyFFXpMTTDJV2Bpqnn6iJijzfNAwBGmwJWaQw7U61Uo9DOpWx/Yg
	r1aWBVuSr4YuW2mmC5vjvX6Q4K12m4ocFeo4rfVHhtsMuUQ5aC5o32fMk0c288Of4jahq9RDXhEGP
	bMPr2Ew3GK5VxDuOP3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSE9-006zf2-Gt; Tue, 08 Nov 2022 17:17:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSE6-006zea-7O
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 17:17:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id v17so14771886plo.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 09:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faqnCSL7HtyExxkwlZiQblYpyhKpkDzYxHj7SFADNmE=;
        b=r93tzqUTD6QegA8Sqq3MvpuD3M2V50gnRv+w2ZBvlzNgiXOJGCsj2ir+vL3HPBjBap
         g5Cd4DWVNuDRmNhzx1lBVOtcDSCEis2gxrlor8V5R2tjiXoSkL8KX4d8f907JoJe+a30
         J8QGR+UsI+OHlBXiU/SfzS0pOpmUc/PAtOQdhj+nbdlmswZmFi/E9ywekg8IhmNJoENk
         x+PzfwsmtmqV+A1oF+dZ+7m8yxdfVTk9bd2xMojgOkAsV2r3UfLusiPR7AXbnTI4yuFy
         TYBO/B1osOeGikkYdfLxmMljbblhaINeZ6kJZH3dzL4cbbde3jHn8assJtVgfZ7D5Hpq
         xTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faqnCSL7HtyExxkwlZiQblYpyhKpkDzYxHj7SFADNmE=;
        b=SQ3FMaKntzITO7mpqOxIMRbiCxVpj/vWvQNaY6jWPCwm8i/r9ylJaIy9OHSK+jdT9O
         V0B6NrdWof0bCAEBadPuqaNys8qBis7ziJb2riImcZHHHhIHp6tNI9/i5DXtaYIF7toa
         b0T7a8sX5BQsYxgrgm9jtO0lE9XuGjLef5Bgi2znrbwM3xcfDuJOfW/n9ktczUfz/sp4
         sC20JFcdBmLFR/avUEoWcFn9tJ6CPUuBSufpgVrBcvJTinlkJ7Tkaa0GV9g0aMH1PCBC
         Zz7SUYze8426tOSDpLbN22s1E9xdcWKy2rZ7axMCehb5+Z353ID/ex7aIKz/EG/Cv2kd
         nyng==
X-Gm-Message-State: ACrzQf2LJgsipn7xe1Qv4NPKiVqKnZrfnDGQyPSaVPeLsmoHDcaaOalT
	aMN24t9eIimGSCQJsUV6LFiZ2w==
X-Google-Smtp-Source: AMsMyM4c/DBQxQpQgIAVHsslVllRdo4vADEiV9Z3e/ZdWjfhqtgbZfts7JiUrCexCDfVIxMt6xf0cQ==
X-Received: by 2002:a17:902:e801:b0:187:3a52:d24f with SMTP id u1-20020a170902e80100b001873a52d24fmr40394044plg.127.1667927848872;
        Tue, 08 Nov 2022 09:17:28 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090adb4200b00214247989dfsm6409981pjx.13.2022.11.08.09.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:17:28 -0800 (PST)
Message-ID: <95287691-752f-5920-2dbc-b9a5b144d0ac@rivosinc.com>
Date: Tue, 8 Nov 2022 09:17:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Vineet Gupta <vineetg@rivosinc.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Chris Stillson <stillson@rivosinc.com>,
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
 <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
 <f4887649-3933-0a65-7ed5-1bf6bd842a46@rivosinc.com> <Y2oLkQSdCBJPvZW/@wendy>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y2oLkQSdCBJPvZW/@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_091730_517433_347A19EF 
X-CRM114-Status: GOOD (  13.25  )
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

T24gMTEvNy8yMiAyMzo1NiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIE1vbiwgTm92IDA3LCAy
MDIyIGF0IDA0OjA0OjI4UE0gLTA4MDAsIFZpbmVldCBHdXB0YSB3cm90ZToKPj4gK0NDIEFuZHks
IENvbm9yCj4+Cj4+IE9uIDExLzcvMjIgMDk6MjEsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+Pj4g
K2NvbmZpZyBWRUNUT1IKPj4+PiArCWJvb2wgIlZFQ1RPUiBzdXBwb3J0Igo+Pj4+ICsJZGVwZW5k
cyBvbiBHQ0NfVkVSU0lPTiA+PSAxMjAwMDAgfHwgQ0xBTkdfVkVSU0lPTiA+PSAxMzAwMDAKPj4+
PiArCWRlZmF1bHQgbgo+Pj4+ICsJaGVscAo+Pj4+ICsJICBTYXkgTiBoZXJlIGlmIHlvdSB3YW50
IHRvIGRpc2FibGUgYWxsIHZlY3RvciByZWxhdGVkIHByb2NlZHVyZQo+Pj4+ICsJICBpbiB0aGUg
a2VybmVsLgo+Pj4+ICsKPj4+PiArCSAgSWYgeW91IGRvbid0IGtub3cgd2hhdCB0byBkbyBoZXJl
LCBzYXkgWS4KPj4+PiArCj4+Pj4gK2VuZG1lbnUKPj4+ICJWRUNUT1IiIGlzIG5vdCByZWFsbHkg
Y29uc2lzdGVudCB0byBob3cgdGhlIG90aGVyIGNvbmZpZ3MgYXJlIG5hbWVkOwo+Pj4gUklTQ1Zf
SVNBX1YsIFJJU0NWX0lTQV9WRUNUT1IsIFJJU0NWX1ZFQ1RPUj8KPj4KPj4gR29vZCBwb2ludCwg
SSd2ZSBjaGFuZ2VkIGl0IHRvIFJJU0NWX0lTQV9WIHRvIGtlZXAgaXQgY29uc2lzdGVudCB3aXRo
Cj4+IGV4aXN0aW5nIFJJU0NWX0lTQV9DLgo+IAo+IEhleSBWaW5lZXQsIGtpbmRhIHJhbmRvbWx5
IHJlcGx5aW5nIGhlcmUgYnV0IHRoZSB3b3JkaW5nIG1ha2VzIGl0IGxvb2sKPiBsaWtlIHlvdSdy
ZSBnb2luZyB0byB0YWtlIHRoaXMgcGF0Y2hzZXQgb24/Cj4gSWYgc28sIHBsZWFzZSBjaGVjayBv
dXQgdjEwICh0aGluayBpdCB3YXMgZnJvbSBBcHJpbCkgYXMgdGhlcmUgYXJlIHNvbWUKPiBjb21t
ZW50cyBvbiB0aGF0IHZlcnNpb24gdGhhdCBJSVJDIHJlbWFpbiB1bi1yZXNvbHZlZC4KClN1cmUg
dGhpbmcuIEFsdGhvdWdoIEkgb25seSBzZWUgYSBmZXcgZnJvbSBDaHJpc3RvcGggYW5kIGtlcm5l
bCBidWlsZCBib3QuCgotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
