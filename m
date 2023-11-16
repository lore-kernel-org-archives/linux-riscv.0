Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BA7C54FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRx+I7qpD84EPGH4GerUN2Ds+waPg94xE6KYUzWZq4A=; b=tjCXnZuK39INsG
	6kSgFn0GLzHoGh1cWxvXl8hYM+6BO8jJnxIh422HCEQtDOKXmXygrBSnkBtgcHPe2btUAxnHDBMdd
	Jzyhs2BJikdAFdaTGfSZvnDAtmaMz901L2qiNGZHYFiUeCO0u4/K0DDz5i0OL/iHXc9TyR22FCDll
	VbJ5I6uklL6XEKMuReheOpNVHktx7Z29WNwFs3L0wnHguG9bj23tgsNEXLrRKRgWUuCTyF91sbt/B
	Dzb8POLdSGoBB8OtDLVmX5CVnqHHYCvJkMgc4ejJqgz6hQgNo+HUyuOhh/mfVa3fRNO1KyWRvmIkO
	ao7xvyICyAmKhSMu2GoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aun-003OnG-2Y;
	Thu, 16 Nov 2023 11:52:09 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aul-003Ok3-22
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 11:52:08 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c18a3387f5so487080a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Nov 2023 03:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1700135524; x=1700740324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HELlPsqjg/Wefk5+wz/oWAt20BG/uf0xX6SQVFjDt18=;
        b=aZmEjW4GwiCYuFfq3BlrKr4U9SqfZyJfAAVn/pEmOe3kxF3aQoXkWXa/8zJFU5ZVT1
         qy6lP9RF4PsV6sZxDHEiNkep9oWJIhO5MtikXh24urgu75pzAxNSNxHMm8CDIXMHVM0w
         UZ3c6cIAJT7nG7qZkX6PYyKPeQ/btgc23E3nRDbtzT7NSKhQiU9rZn2qp9aTqXb8wADa
         cbTBAk+L4yZyks0QL5e1lzkM/00ENdRZr0K12GwTQAYExPl7ilWu48hGncBibdLAJ6hk
         xU4HjnUHQEpGn5SmomeH52Na/lPNvA5ZSdTdt7NV1F+CzU70Lv1f1DXhstRxL4Ghv8BQ
         C6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135524; x=1700740324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HELlPsqjg/Wefk5+wz/oWAt20BG/uf0xX6SQVFjDt18=;
        b=MyxPDw2f+uJLSOH3pmsjOumxARzWZh5O3dNLM0boK6Wze1c3IUay1fV3yUCmyTGTIg
         yvs8qR8z6lVdiQIgAlJLEDOo8SrIpsycQs6gZLZ3i7Hpr8uVycp6KIKxG3llxjCeuNuS
         rP1/c1KMiRQnxToy1Q3ic6gNZ97XvV+Ao7np1OlXYpCPLNaGinSWgTYZmW/raM1cXTgC
         ZqpsIk4TyBFtJnVpwqNmvyci7B0UX7cWgVNhjN5HZB+r0t+IXHTj0fpQBSpOsdhSFx46
         Kd8cdmw4HbndqawckpvYgVmKhucME67Qu1FAqAs0IRCTmFNPIE1rYu8R4alOQzp7+0hk
         0uVw==
X-Gm-Message-State: AOJu0YyL/mAWPmUH1Xf4oAcvqmjrf5WGZYWK8fuMpoUR5+nTrCM2FlxF
	dClNfh0WHXBDd1O+aBN3JK9tpmvUI8+lQ7huxpIqNQ==
X-Google-Smtp-Source: AGHT+IFgCut+bynCtvKeQGddj+t5nYD0UBTCfEVTs+udaQIi9PDDpeuZYnmLWJfo3BZcEYbkZ7f6eav48vkg/hOVLt0=
X-Received: by 2002:a17:90a:1951:b0:27d:669e:5a10 with SMTP id
 17-20020a17090a195100b0027d669e5a10mr14998332pjh.13.1700135524282; Thu, 16
 Nov 2023 03:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20231116105312.4800-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20231116105312.4800-1-joshua.yeong@starfivetech.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 17:21:51 +0530
Message-ID: <CAAhSdy2EvimCN_RfzXY_iEv_d0MtzFmEk8-0SYbuWfcmGmt8Hg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] clocksource/timer-riscv: Add riscv_clock_shutdown callback
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_035207_690698_86771788 
X-CRM114-Status: GOOD (  14.31  )
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

T24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgNDoyNOKAr1BNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIGNsb2Nrc291cmNlIGRldGFjaC9z
aHV0ZG93biBjYWxsYmFjayB0byBkaXNhYmxlIFJJU0MtViB0aW1lciBpbnRlcnJ1cHQgd2hlbgo+
IHN3aXRjaGluZyBvdXQgcmlzY3YgdGltZXIgYXMgY2xvY2sgc291cmNlCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKb3NodWEgWWVvbmcgPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgoKUGxlYXNl
IGluY2x1ZGUgUmIgdGFncyBvYnRhaW5lZCBpbiBwcmV2aW91cyByZXZpc2lvbnMuCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4g
LS0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyB8IDcgKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jCj4gaW5kZXggNTc4NTdjMGRmYmE5Li5lNjZkY2JkNjY1NjYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCj4gQEAgLTYxLDEyICs2MSwxOSBAQCBzdGF0aWMgaW50IHJpc2N2X2Ns
b2NrX25leHRfZXZlbnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPiAgICAgICAgIHJldHVybiAwOwo+
ICB9Cj4KPiArc3RhdGljIGludCByaXNjdl9jbG9ja19zaHV0ZG93bihzdHJ1Y3QgY2xvY2tfZXZl
bnRfZGV2aWNlICpldnQpCj4gK3sKPiArICAgICAgIHJpc2N2X2Nsb2NrX2V2ZW50X3N0b3AoKTsK
PiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2
X2Nsb2NrX2V2ZW50X2lycTsKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBjbG9ja19l
dmVudF9kZXZpY2UsIHJpc2N2X2Nsb2NrX2V2ZW50KSA9IHsKPiAgICAgICAgIC5uYW1lICAgICAg
ICAgICAgICAgICAgID0gInJpc2N2X3RpbWVyX2Nsb2NrZXZlbnQiLAo+ICAgICAgICAgLmZlYXR1
cmVzICAgICAgICAgICAgICAgPSBDTE9DS19FVlRfRkVBVF9PTkVTSE9ULAo+ICAgICAgICAgLnJh
dGluZyAgICAgICAgICAgICAgICAgPSAxMDAsCj4gICAgICAgICAuc2V0X25leHRfZXZlbnQgICAg
ICAgICA9IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQsCj4gKyAgICAgICAuc2V0X3N0YXRlX3NodXRk
b3duICAgICA9IHJpc2N2X2Nsb2NrX3NodXRkb3duLAo+ICB9Owo+Cj4gIC8qCj4gLS0KPiAyLjI1
LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
