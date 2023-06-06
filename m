Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D53EC7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g09tVdiCiCcniCUu9EIMqtH5iT2uncNDOdvFsXU4F8I=; b=Sb6WjX0FviwVWB
	5VI5MGysk5JyyHdD8OTW5fCoZYoOJPbE/F/hoNuaVOj1J+agDwwOhDl2Sx1CYhlqLQjwZ7lPY/RHi
	SbvnubM5EpnOrn7Q3+v3HPTrPHl4n+S0RfeX/etr5sFcCrQSSVADytV3YHyeVSy/fbDYRPm+2kOar
	nxh8qFszU8rwGnypstaA5zCgk9f+6dGO9tPEh5cUX5xIRkqVE8HWmhDYmFLfIxGQriDBAm2eotanv
	0Tpo6R2WQxZYiy/WCIYZwlo9+XUyVufK6j4K0Q2ZjQLopNva9Ysw17oM33jO3E9ncETKJ6cVrme7X
	LuXcOjS4gkP7pJkn54Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6X6M-001uXS-2F;
	Tue, 06 Jun 2023 13:51:58 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6X6J-001uWJ-2R
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 13:51:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51452556acdso3552483a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686059513; x=1688651513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/meAPIsis+AXLZEtvKaqLr9I/b5AhX0Z28qNlrQqqbE=;
        b=Fv8s+7TokXGsfeC2LEaAc+xqng0Ju1MaH/xGf16DNJmcLHaJqjmtJJg+abJka+mdy7
         kCsmQ+exiZ7/tFNT8Weswe3ih7jVFwfhViBOVL2uxwXmDkxmhGO7tJCA4D/7hLKBfat7
         LPtv7+bKZFOkxA2z5aEMk3Z+CegOJtXZ6kKlHEv99oN8JGjcPtMYcnUBEZZ57WIKtAhA
         5gpdjrGpVvBq8TGmkm0yrYKhyGhSoXPNrfmG3uGah03YVqpgqEhaxtMrxJtRGIt0eF5Q
         dlHgNS8douww2BSBYItB5qFHtISgzYZkgeLzAg+GjmBLt3zIDVP1SD0dQApsFCYFweec
         X8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686059513; x=1688651513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/meAPIsis+AXLZEtvKaqLr9I/b5AhX0Z28qNlrQqqbE=;
        b=kcOtnIusiFU7ehNfAMVuqyzREhswWrRE1gmj7BiKFZNI5ApgFDsUNgDHYjEst9fOd/
         ZGuU8TaJSAHolYiS9nCZhHpc2dBll1Jm/6f0NDVjMQabIAp1OCcnreUtCkM6BEl7p8VY
         Hd98cWrnsHrKMSYysJQTb8PZpwT2iBJZEYtq8sRBq8dKHoVBffWmrK/O/pqe8M3QjaBp
         kPVoQjHXm3Jpd0j/K5xJi2DZ2QCdLyieI3zU1ifroJgKAdDsV+EVdRV/wI7LGH7gDiKC
         aisHd/2ztfQ5iyz9FDTSxfN7JXSzZR/0alh54l9tudnyOQ3XOUsyTwEb8IA25FEl5hCw
         L0iA==
X-Gm-Message-State: AC+VfDxSlo7Q8EnwSsiaRSkoT/XRkfm7om/3J+OgmMQJQKIooCPMRY9V
	olFkyzh4B2onV8MCSZ3K1TU=
X-Google-Smtp-Source: ACHHUZ7AdTODNyw4dWQnFLD+N5s+hcbMRMZ3B99ZCAjJ5ZMGxXh5YoMjJk7n85NSxLTQnViRgrWobw==
X-Received: by 2002:a05:6a20:258b:b0:10b:dca5:74e5 with SMTP id k11-20020a056a20258b00b0010bdca574e5mr2224688pzd.0.1686059512635;
        Tue, 06 Jun 2023 06:51:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b001b0f727bc44sm8518658plh.16.2023.06.06.06.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:51:51 -0700 (PDT)
Message-ID: <e9850b67-6c6f-4079-fa35-862b102c8ddd@roeck-us.net>
Date: Tue, 6 Jun 2023 06:51:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] hwmon: (nct6775) Directly call ASUS ACPI WMI
 method
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Denis Pauk <pauk.denis@gmail.com>
Cc: ahmad@khalifa.ws, chunkeey@gmail.com, greg@krypto.org,
 hubert.banas@gmail.com, igor@svelig.com, jaap.dehaan@freenet.de,
 jdelvare@suse.com, jeroen@beerstra.org, jonfarr87@gmail.com, jwp@redhat.com,
 kdudka@redhat.com, kernel@melin.net, kpietrzak@disroot.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, me@rebtoor.com,
 metalcaedes@gmail.com, michael@theoddone.net, mikhail.v.gavrilov@gmail.com,
 mundanedefoliation@gmail.com, nephartyz@gmail.com, oleksandr@natalenko.name,
 pehlm@pekholm.org, renedis@hotmail.com, robert@swiecki.net,
 sahan.h.fernando@gmail.com, sebastian.arnhold@posteo.de, sst@poczta.fm,
 to.eivind@gmail.com, torvic9@mailbox.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20230111212241.7456-1-pauk.denis@gmail.com>
 <CAMuHMdXGO17cKKvwA5sZQ+WBPzdMvghZkvv1gWvQ00X-N+EF9A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAMuHMdXGO17cKKvwA5sZQ+WBPzdMvghZkvv1gWvQ00X-N+EF9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_065155_799926_1C0624E3 
X-CRM114-Status: GOOD (  22.10  )
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

T24gNi82LzIzIDAzOjI5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgRGVuaXMsCj4g
Cj4gT24gV2VkLCBKYW4gMTEsIDIwMjMgYXQgMTA6MjTigK9QTSBEZW5pcyBQYXVrIDxwYXVrLmRl
bmlzQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE5ldyBBU1VTIEI2NTAvQjY2MC9YNjcwIGJvYXJkcyBm
aXJtd2FyZSBoYXZlIG5vdCBleHBvc2VkIFdNSSBtb25pdG9yaW5nCj4+IEdVSUQgIGFuZCBlbnRy
eXBvaW50IG1ldGhvZCBXTUJEIGNvdWxkIGJlIGltcGxlbWVudGVkIGZvciBkaWZmZXJlbnQgZGV2
aWNlCj4+IFVJRC4KPj4KPj4gSW1wbGVtZW50IHRoZSBkaXJlY3QgY2FsbCB0byBlbnRyeXBvaW50
IG1ldGhvZCBmb3IgbW9uaXRvcmluZyB0aGUgZGV2aWNlCj4+IFVJRCBvZiBCNTUwL1g1NzAgYm9h
cmRzLgo+Pgo+PiBCdWdMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIwNDgwNwo+PiBTaWduZWQtb2ZmLWJ5OiBEZW5pcyBQYXVrIDxwYXVrLmRlbmlzQGdt
YWlsLmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBBaG1hZCBLaGFsaWZhIDxhaG1hZEBraGFsaWZh
LndzPgo+PiBTaWduZWQtb2ZmLWJ5OiBBaG1hZCBLaGFsaWZhIDxhaG1hZEBraGFsaWZhLndzPgo+
IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCBjM2IzNzQ3ZDAy
ZjU3MWRhICgiaHdtb246Cj4gKG5jdDY3NzUpIERpcmVjdGx5IGNhbGwgQVNVUyBBQ1BJIFdNSSBt
ZXRob2QiKSBpbiAgdjYuMy1yYzEuCj4gCj4+IC0tLSBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZwo+
PiArKysgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKPj4gQEAgLTE1MTYsNyArMTUxNiw3IEBAIGNv
bmZpZyBTRU5TT1JTX05DVDY3NzVfQ09SRQo+PiAgIGNvbmZpZyBTRU5TT1JTX05DVDY3NzUKPj4g
ICAgICAgICAgdHJpc3RhdGUgIlBsYXRmb3JtIGRyaXZlciBmb3IgTnV2b3RvbiBOQ1Q2Nzc1RiBh
bmQgY29tcGF0aWJsZXMiCj4+ICAgICAgICAgIGRlcGVuZHMgb24gIVBQQwo+PiAtICAgICAgIGRl
cGVuZHMgb24gQUNQSV9XTUkgfHwgQUNQSV9XTUk9bgo+PiArICAgICAgIGRlcGVuZHMgb24gQUNQ
SSB8fCBBQ1BJPW4KPj4gICAgICAgICAgc2VsZWN0IEhXTU9OX1ZJRAo+PiAgICAgICAgICBzZWxl
Y3QgU0VOU09SU19OQ1Q2Nzc1X0NPUkUKPj4gICAgICAgICAgaGVscAo+IAo+IFRoZSByZWNlbnQg
cGF0Y2hlcyB0byBhZGQgc3VwcG9ydCBmb3IgQUNQSSBvbiBSSVNDLVYgY2F1c2VkIG1lIHRvCj4g
c2VlIGEgcXVlc3Rpb24gYWJvdXQgdGhpcyBkcml2ZXIgYWdhaW4gd2hlbiBydW5uaW5nICJtYWtl
IG9sZGNvbmZpZyIsCj4gYW5kIEkgaGFkIGEgY2xvc2VyIGxvb2sgYXQgdGhlIGRyaXZlci4uLgo+
IFVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLCB0aGlzIGlzIGEgcmVhbGx5IGRhbmdlcm91
cyBkcml2ZXIgd2hpY2gKPiBqdXN0IGJhbmdzIGJsaW5kbHkgaW50byBJL08gc3BhY2Ugd2l0aG91
dCBkb2luZyBhbnkgcGxhdGZvcm0gY2hlY2tzLAo+IHdoaWNoIGNvdWxkIGNhdXNlIGEgY3Jhc2gg
b3Igc3lzdGVtIGxvY2stdXA/Cj4gCj4gRG9lcyB0aGUgU0VOU09SU19OQ1Q2Nzc1IHN5bWJvbCBu
ZWVkIGEgYmV0dGVyIHBsYXRmb3JtIGRlcGVuZGVuYwo+IHRoYW4gIVBQQz8KPiAKClRoaXMgaXMg
bm8gZGlmZmVyZW50IHRoYW4gYWxsIHRoZSBvdGhlciBTdXBlcklPIGRyaXZlcnMuCgpHdWVudGVy
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
