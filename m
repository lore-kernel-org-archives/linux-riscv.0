Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52AEC07E9B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:25:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8026E600CC
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8026E600CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFgoS8rGDA8jlNut429oDmqgpP1c89EAw0zjhqb35QM=; b=Cl/Ru2sa1UxSpuvIqRGo+EF+6O
	HzHZw1DAM78NS+kY8i0lsclKtjWG5E8zr8uCHchYF58gcXtmP9Ud4UyVlPqUF88l7vDuMne2r2qvQ
	p//XgK8YDgZf6zFDJKh8BDXAHoic99TgjQEg5u2iTVG73NS3K7v29/dM+x/bY/agBM/G7/AgrUpLT
	EhR37cGV484a4aHt90CPzOkwgAnXE6OL/2YdqUn3xU5WcH8N/FQ303QCegH5rRlH/8DWhSLevcayb
	JYM3tJ+5nqoCFy4L/fCwXZLegKp7C/vYBm7GKkvLj96jSAvJ1l8l+DroqUjQOkPS61aZtCuEgC4Jw
	GBZVioSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5UCj-009rzC-M7; Mon, 19 Jul 2021 14:25:09 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5UCP-009rrl-0W
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 14:24:50 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so18348272otl.3
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7/qq3wyUV7N73BKpIHcRfvtIpGGk0m3CwLVAIa8erWo=;
 b=i+k6lzbQu/gYTazdC+tDJ+VqdJU6OFUmm3rB+LR3/2M/9mHGl/O662JrlUjlhCJc7e
 ZiJYreKouyfxkeiODkVVMvE41hTmVEAlG29kukXUrZ8czMj1LYShWI6tH+UNJvVMN3CT
 aJyhBcrwvQfiOI+nlPUAk9g0yq6Vpa3U7S/PHgQuO5sd9Gi4dD+ECGAZAwq1Xjdksqcs
 G2LR1m+G4OH60VqMYPePCoYzWde4SJdY/C+zBkr08pfbXPtpyWzEcENPmN8FnOyCClGF
 OcNw1i6IQbEKmoKfsGdXCPJYdJ8t/SPX1T7m3MADjcJwpocz2qmqSMQx7V/MnXUD5p1X
 leSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7/qq3wyUV7N73BKpIHcRfvtIpGGk0m3CwLVAIa8erWo=;
 b=VmUiR2Nw60FAgxUONNTrlLp44jDaR/4Ron7XfcVl8DxYFGcIzTjhYqgbagRz2cGWoT
 cM1g6EmJZv1WnV+Iq/odrbDlVkeFLG2fLXWZURhJePcRGKyiD+twh1AHvXqXugdj5LSA
 9z1Wx3bEEkTDjhlx08Te5UbxCHOSdgbdLyDHix56hEfC1/Vp0SSxFhsz+z8qXVj7I2Xs
 9Bc40fRHoc3O1BPnvc4JUHHyIgZwx0nyNcQIYKpEbsw4cYBmwN2fNMFb+dTD1Rj47u5u
 xSCfGLqSYY2rHcNHnrd2uZYawM96Xkk9vk8oVwi2zWJ1QqKlCHVtGygZPSPApNn2dAnI
 vyjw==
X-Gm-Message-State: AOAM530rX13zVJYqo8G626WAPDYikt/txdndTUlrdRr8iwBIG7zlJW9R
 h25cqbbPpGuwX9EURNEyuz0=
X-Google-Smtp-Source: ABdhPJx+VI2LTCuw35AamWFKyfBdlpvyzZmsV1/KxXQqjbQo5sFs3G6o6Fdv92eq+ScsT3IPzd7ANQ==
X-Received: by 2002:a9d:638f:: with SMTP id w15mr470201otk.148.1626704686753; 
 Mon, 19 Jul 2021 07:24:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 48sm3584391otf.13.2021.07.19.07.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 07:24:46 -0700 (PDT)
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
 <cd14a8b0-0a27-77a8-6dc2-3268f9f09922@roeck-us.net>
 <e1bb4768-5517-8ef3-eaf3-bbfc103fa918@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
Message-ID: <9a2bf544-2aaa-d175-bc0a-c8bcefd8141a@roeck-us.net>
Date: Mon, 19 Jul 2021 07:24:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e1bb4768-5517-8ef3-eaf3-bbfc103fa918@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_072449_094083_FCF97E69 
X-CRM114-Status: GOOD (  20.58  )
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

T24gNy8xOS8yMSA3OjAwIEFNLCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4gCj4gT24gNy8xOS8y
MDIxIDEwOjUxIFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNy8xOS8y
MSA1OjUzIEFNLCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4+Pgo+Pj4gVGhpcyBwYXRjaCB3aWxs
IHJlZHVjZSBjcHUgdXNhZ2UgZHJhbWF0aWNhbGx5IGluIGtlcm5lbCBzcGFjZSBlc3BlY2lhbGx5
Cj4+PiBmb3IgYXBwbGljYXRpb24gd2hpY2ggdXNlIHN5cy1jYWxsIHdpdGggbGFyZ2UgYnVmZmVy
IHNpemUsIHN1Y2ggYXMKPj4+IG5ldHdvcmsgYXBwbGljYXRpb25zLiBUaGUgbWFpbiByZWFzb24g
YmVoaW5kIHRoaXMgaXMgdGhhdCBldmVyeQo+Pj4gdW5hbGlnbmVkIG1lbW9yeSBhY2Nlc3Mgd2ls
bCByYWlzZSBleGNlcHRpb25zIGFuZCBzd2l0Y2ggYmV0d2VlbiBzLW1vZGUKPj4+IGFuZCBtLW1v
ZGUgY2F1c2luZyBsYXJnZSBvdmVyaGVhZC4KPj4+Cj4+Cj4+IEkgaGFkIHRvIHJldmVydCB0aGUg
b3JpZ2luYWwgcGF0Y2ggZnJvbSB0aGUgbWFpbmxpbmUga2VybmVsIHByaW9yIHRvIGFwcGx5aW5n
Cj4+IHRoaXMgcGF0Y2guIE9idmlvdXNseSB0aGF0IG1lYW5zIHRoYXQgdGhlcmUgbWF5IGJlIG90
aGVyIGNoYW5nZXMgYWZmZWN0aW5nIHRoZQo+PiBvdXRjb21lLgo+Pgo+PiByaXNjdjY0IGltYWdl
cyB3b3JrLCBidXQgcmlzY3YzMiBpbWFnZXMgc3RpbGwgZmFpbCB3aXRoIHRoaXMgcGF0Y2ggYXBw
bGllZC4KPj4gVGhlIGVycm9yIGlzIGEgYml0IGRpZmZlcmVudCB0aGFuIGJlZm9yZSwgdGhvdWdo
Lgo+Pgo+PiAuLi4KPj4gW8KgwqAgMTEuODk5OTc5XSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHBy
b2Nlc3MKPj4gW8KgwqAgMTIuMTUyNjY2XSByYW5kb206IGZhc3QgaW5pdCBkb25lCj4+IG1vdW46
IGFwcGxldCBub3QgZm91bmQKPj4gIu+/ve+/ve+/ve+/ve+/vVbvv710OiBhcHBsZXQgbm90IGZv
dW5kCj4+IC9iae+/ve+/ve+/ve+/ve+/vVbvv71GLTogYXBwbGV0IG5vdCBmb3VuZAo+PiBtb3Vu
OiBhcHBsZXQgbm90IGZvdW5kCj4+IHN3YW9uOiBhcHBsZXQgbm90IGZvdW5kCj4+IGhvc3RuYW1l
LUY6IGFwcGxldCBub3QgZm91bmQKPj4KPj4gQWZ0ZXIgdGhpcywgdGhlIGltYWdlIGhhbmdzLgo+
Pgo+PiBGb3IgY29tcGFyaXNvbiwgdGhlIG1haW5saW5lIGtlcm5lbCAodjUuMTQtcmMyKSBmYWls
cyBhcyBmb2xsb3dzLgo+Pgo+PiBbwqDCoCAxMC43ODgxMDVdIFJ1biAvc2Jpbi9pbml0IGFzIGlu
aXQgcHJvY2Vzcwo+PiBTdGFydGluZyBzeXNsb2dkOiBPSwo+PiBTdGFydGluZyBrbG9nZDogT0sK
Pj4gL2V0Yy9pbml0LmQvUzAyc3lzY3RsOiBsaW5lIDY4OiBzeW50YXggZXJyb3I6IEVPRiBpbiBi
YWNrcXVvdGUgc3Vic3RpdHV0aW9uCj4+IC9ldGMvaW5pdC5kL1MyMHVyYW5kb206IGxpbmUgMTog
c3ludGF4IGVycm9yOiB1bnRlcm1pbmF0ZWQgcXVvdGVkIHN0cmluZwo+PiBTdGFydGluZyBuZXR3
b3JrOiAvYmluL3NoOiBzeW50YXggZXJyb3I6IHVudGVybWluYXRlZCBxdW90ZWQgc3RyaW5nCj4+
IHNlZDogdW5tYXRjaGVkICcvJwo+PiAvYmluL3NoOiBzeW50YXggZXJyb3I6IHVudGVybWluYXRl
ZCBxdW90ZWQgc3RyaW5nCj4+IEZBSUwKPj4gL2V0Yy9pbml0LmQvUzU1cnVudGVzdDogbGluZSA0
ODogc3ludGF4IGVycm9yOiBFT0YgaW4gYmFja3F1b3RlIHN1YnN0aXR1dGlvbgo+Pgo+PiBJJ2xs
IGJlIGhhcHB5IHRvIHByb3ZpZGUgaW5mb3JtYXRpb24gb24gaG93IHRvIHJlcHJvZHVjZSB0aGUg
cHJvYmxlbQo+PiBpZiBuZWVkZWQuIFBsZWFzZSBsZXQgbWUga25vdy4KPiAKPiBZZXMsIEkgZG8g
d291bGQgbGlrZSB0byBrbm93IHRoZSBwcm9jZWR1cmUgb2YgYnVpbGQgaW5zdHJ1Y3Rpb24gb2Yg
eW91ciBydjMyIGltYWdlLgo+IFRoZW4gSSB3b3VsZCByZXByb2R1Y2UgdGhlIGVycm9yIGFuZCBs
b29rIGludG8gaG93IHRvIGZpeCBpdC4KPiAKUGxlYXNlIGhhdmUgYSBsb29rIGF0IGh0dHA6Ly9z
ZXJ2ZXIucm9lY2stdXMubmV0L3FlbXUvcmlzY3YzMi8KYW5kIGxldCBtZSBrbm93IGlmIHlvdSBu
ZWVkIGFueXRoaW5nIGVsc2UuCgpUaGFua3MsCkd1ZW50ZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
