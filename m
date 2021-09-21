Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20FDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7129E61100
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7129E61100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=prpre5UpVQe7/5DgTWTk7kGoTld8txEm9N97V4oAtKE=; b=F9DSz1taROH5BAuW3+Uole+mYr
	5dp4oIze8QFolJPZYU/hVQEu3HNGuZ6EPdtBYzcix/5zPFVpsay04A0jVSorICa3b/t53UDuR4o4A
	AFTZAEb/w9hQw97lE6XsHzfq7NRpVsbjDb6q2MJkaNYwxStPve/Ybpd4RpRnF2gyM7chW/kyTcDK9
	xmG0gbu+IHRojEkS2ZMUJT+mAndtGKbCrnaBwdoHNvpknja6wOnxHPZDwDLhVtYyU+VjWrEoBF1IA
	OnLMXvvK4kENd0q+D4d/RfW0DCl4nrlun3nUv8iL3lWdzq/x5MhUM4VJMGMkk/eWk/JAUkAbnAttY
	URvVwFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSeP4-004PWX-1O; Tue, 21 Sep 2021 11:57:38 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSeP0-004PVR-11
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:57:35 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 246484025C
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632225451;
 bh=Edrk8YB/JSUDN6TkY8ir7fMmkzEbx6D96lPgLtCkIX0=;
 h=To:References:From:Subject:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=Cy/5FWBEio25OmRFbS0sPzvy31x7+FHPY04xyXlvoKUBlqteL1iwhQnwNvdJZH/IV
 4QTCpz1hQgI4pA5HAkinYEXv2T4ouxJaVWQbZ5DTb4E6hnSjkO7WHY3fiPkpD6gwS7
 1+7vFe2skN0hg2ZQUKPmZ8a7fXRZ+Dg0vNS7RUt/ZWxK7YW3BHYsLvf4pCKNF18kYx
 DWRh/U+zDz+8FbP45BMMj6os6nLko63k1J8iuty8b1mS5ByM5QqqjIe3NCzlXJeXHu
 hykKfj0FwXW/KfqGyDFAyRNqYaLstKvORjFXw2lyLyZ94xNfztVb6K44aH665PhEYY
 oA3nvoTuIktrg==
Received: by mail-wr1-f69.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so8602513wrt.9
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Edrk8YB/JSUDN6TkY8ir7fMmkzEbx6D96lPgLtCkIX0=;
 b=OBhdUbuTmBhoWSlHGvTFE0UsnbOTwsA5tvtYK5bsupNKXWxCRm8oZIcvAzy6Rg2q4C
 BShUZ5GCHVtlLBUuAJZYRWXQqnN+K50S2gZAkyoVSrWRsgInG/ZszN5hvo9BcyvMXPPZ
 IsYm5dsjTjhWImDCDDmbfuI+x/RTwrIr5F+pvkfFvRx8IZUGtRJSUo6Ci+/JVp8V1WYd
 x8umZ8uPSHrWfkkrI5u0IYwlfLNsS953yQlzY40+8vTHH1AEk5dV0GIeDDSEVFRTjvn0
 LQzOlRNGbyh4C+zhGIzUkp/V1jmmXdJKZMPvewxsSGjpkmbmxxIoI8ORpAP1gHc3ZpcZ
 Y3dQ==
X-Gm-Message-State: AOAM532SHK2QWfMUXTT0zhYqmossSIYMHt4ikVoTgLA+Tv2CLG7tMpjP
 MzTvLPaqASxJ3shqPJOXwQ3AeXnNErzcuT2yHfyyoqCov5s4Xcv7tyyq6yAna28iSjyWOvIGoso
 ms8ydS4QB1WjMwpbB7m9URSTJK9tCPQBV2v4WVQZU/9NFnQ==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr34257876wrq.176.1632225450441; 
 Tue, 21 Sep 2021 04:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywrtK6qK54rP6gUN9u5o1jj6AXZs8KZz+kX4eWk6zyX0PcrVcN3qgGUnuD3nSi/IKh/sHT2Q==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr34257845wrq.176.1632225450222; 
 Tue, 21 Sep 2021 04:57:30 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id k4sm18725530wrv.24.2021.09.21.04.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 04:57:29 -0700 (PDT)
To: Conor.Dooley@microchip.com, ulf.hansson@linaro.org, robh+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, yamada.masahiro@socionext.com, piotrs@cadence.com,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
 <20210920150807.164673-4-krzysztof.kozlowski@canonical.com>
 <b83355ee-cce3-0a7d-a048-147dcb44b012@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC
 node
Message-ID: <d79c4aee-2c57-91a8-3bc5-b8d989ed41e1@canonical.com>
Date: Tue, 21 Sep 2021 13:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b83355ee-cce3-0a7d-a048-147dcb44b012@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_045734_325700_03E0781A 
X-CRM114-Status: GOOD (  27.07  )
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

T24gMjEvMDkvMjAyMSAxMjo0MCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4g
T24gMjAvMDkvMjAyMSAxNjowOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Cj4+IERldmljZXRyZWUgc291cmNlIGlzIGEg
ZGVzY3JpcHRpb24gb2YgaGFyZHdhcmUgYW5kIGhhcmR3YXJlIGhhcyBvbmx5IG9uZQo+PiBibG9j
ayBAMjAwMDgwMDAgd2hpY2ggY2FuIGJlIGNvbmZpZ3VyZWQgZWl0aGVyIGFzIGVNTUMgb3IgU0RI
Qy4gIEhhdmluZwo+PiB0d28gbm9kZSBmb3IgZGlmZmVyZW50IG1vZGVzIGlzIGFuIG9ic2N1cmUs
IHVudXN1YWwgYW5kIGNvbmZ1c2luZyB3YXkgdG8KPj4gY29uZmlndXJlIGl0LiAgSW5zdGVhZCB0
aGUgYm9hcmQgZmlsZSBpcyBzdXBwb3NlZCB0byBjdXN0b21pemUgdGhlIGJsb2NrCj4+IHRvIGl0
cyBuZWVkcywgZS5nLiB0byBTREhDIG1vZGUuCj4+Cj4+IFRoaXMgZml4ZXMgZHRic19jaGVjayB3
YXJuaW5nOgo+PiAgICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBm
cy1pY2ljbGUta2l0LmR0LnlhbWw6IHNkaGNAMjAwMDgwMDA6ICRub2RlbmFtZTowOiAnc2RoY0Ay
MDAwODAwMCcgZG9lcyBub3QgbWF0Y2ggJ15tbWMoQC4qKT8kJwo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+
Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAxLiBNb3ZlIGFsc28gYnVzLXdp
ZHRoLCBzdWdnZXN0ZWQgYnkgR2VlcnQuCj4+IC0tLQo+PiAgIC4uLi9taWNyb2NoaXAvbWljcm9j
aGlwLW1wZnMtaWNpY2xlLWtpdC5kdHMgICB8IDExICsrKysrKystCj4+ICAgLi4uL2Jvb3QvZHRz
L21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy5kdHNpICAgIHwgMjggKy0tLS0tLS0tLS0tLS0tLS0t
LQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2No
aXAtbXBmcy1pY2ljbGUta2l0LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21p
Y3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzCj4+IGluZGV4IDA3ZjFmM2NhYjY4Ni4uZmMxZTU4
NjlkZjFiIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNy
b2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cwo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21p
Y3JvY2hpcC9taWNyb2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cwo+PiBAQCAtNTEsOCArNTEsMTcg
QEAgJnNlcmlhbDMgewo+PiAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+ICAgfTsKPj4KPj4g
LSZzZGNhcmQgewo+PiArJm1tYyB7Cj4+ICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPj4gKwo+
PiArICAgICAgIGJ1cy13aWR0aCA9IDw0PjsKPj4gKyAgICAgICBkaXNhYmxlLXdwOwo+PiArICAg
ICAgIGNhcC1zZC1oaWdoc3BlZWQ7Cj4+ICsgICAgICAgY2FyZC1kZXRlY3QtZGVsYXkgPSA8MjAw
PjsKPj4gKyAgICAgICBzZC11aHMtc2RyMTI7Cj4+ICsgICAgICAgc2QtdWhzLXNkcjI1Owo+PiAr
ICAgICAgIHNkLXVocy1zZHI1MDsKPj4gKyAgICAgICBzZC11aHMtc2RyMTA0Owo+PiAgIH07Cj4+
Cj4+ICAgJmVtYWMwIHsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9j
aGlwL21pY3JvY2hpcC1tcGZzLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9t
aWNyb2NoaXAtbXBmcy5kdHNpCj4+IGluZGV4IDUwODRiOTMxODhmMC4uODNiYzE0ODYwOTYwIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBm
cy5kdHNpCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1t
cGZzLmR0c2kKPj4gQEAgLTI2MiwzOSArMjYyLDEzIEBAIHNlcmlhbDM6IHNlcmlhbEAyMDEwNDAw
MCB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAg
ICAgICAgICAgICAgICAgIH07Cj4+Cj4+IC0gICAgICAgICAgICAgICBlbW1jOiBtbWNAMjAwMDgw
MDAgewo+PiAtICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNkbnMsc2Q0aGMi
Owo+PiAtICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MjAwMDgwMDAgMHgwIDB4
MTAwMD47Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBs
aWM+Owo+PiAtICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDg4IDg5PjsKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjZmcgNj47Cj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGJ1cy13aWR0aCA9IDw0PjsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
Y2FwLW1tYy1oaWdoc3BlZWQ7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1tYy1kZHItM18z
djsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWF4LWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+
Owo+PiAtICAgICAgICAgICAgICAgICAgICAgICBub24tcmVtb3ZhYmxlOwo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICBuby1zZDsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgbm8tc2RpbzsK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgdm9sdGFnZS1yYW5nZXMgPSA8MzMwMCAzMzAwPjsK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gLSAgICAg
ICAgICAgICAgIH07Cj4+IC0KPj4gLSAgICAgICAgICAgICAgIHNkY2FyZDogc2RoY0AyMDAwODAw
MCB7Cj4+ICsgICAgICAgICAgICAgICBtbWM6IG1tY0AyMDAwODAwMCB7Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNkbnMsc2Q0aGMiOwo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MCAweDIwMDA4MDAwIDB4MCAweDEwMDA+Owo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDg4PjsKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBjbG9ja3MgPSA8JmNsa2NmZyA2PjsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnVz
LXdpZHRoID0gPDQ+Owo+PiAtICAgICAgICAgICAgICAgICAgICAgICBkaXNhYmxlLXdwOwo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICBjYXAtc2QtaGlnaHNwZWVkOwo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICBjYXJkLWRldGVjdC1kZWxheSA9IDwyMDA+Owo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICBzZC11aHMtc2RyMTI7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHNkLXVocy1z
ZHIyNTsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgc2QtdWhzLXNkcjUwOwo+PiAtICAgICAg
ICAgICAgICAgICAgICAgICBzZC11aHMtc2RyMTA0Owo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgbWF4LWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Owo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gICAgICAgICAgICAgICAgICB9Owo+PiAtLQo+PiAy
LjMwLjIKPj4KPiBIaSBLcnp5c3p0b2YsCj4gU2VlbXMgSSBtaXNzZWQgbW9zdCBvZiB0aGlzIHNl
cmllcyBvdGhlciB0aGFuIHRoZSBuZXcgdmVuZG9yIG5hbWUgaW4gdGhlIFYxLgoKVW5mb3J0dW5h
dGVseSB5b3VyIG5hbWUgZG9lcyBub3QgYXBwZWFyIGFzIG1haW50YWluZXIgZm9yIHRoZXNlIGZp
bGVzCmFuZCBnZXRfbWFpbnRhaW5lcnMucGwgYnJpbmdzIGl0IG9ubHkgc29tZXRpbWVzIGFzIGEg
LS1naXQgZmFsbGJhY2suCkFsc28gZmV3IGFkZHJlc3NlcyBmcm9tIHRoYXQgLS1naXQgZmFsbGJh
Y2sgYXJlIG5vbiB3b3JraW5nLCBzbyBJIGFtIG5vdAphbHdheXMgQ2MtaW5nIHRoZW0uIFNvcnJ5
IGZvciB0aGF0LCBJJ2xsIHRyeSB0byBDYyB5b3Ugb24gbmV4dCBNaWNyb2NoaXAKUklTQy1WIHN1
Ym1pc3Npb25zLCBob3dldmVyIHlvdSBzaG91bGQgcHJvYmFibHkgYWRkIGEgcHJvcGVyIHBsYXRm
b3JtCm1haW50YWluZXIgZW50cnkgKHNpbWlsYXJseSB0byBBUk0vQVJNNjQgc3ViYXJjaGl0ZWN0
dXJlcykuCgoKPiAKPiBXZSBoYXZlIGJlZW4gcmVkb2luZyB0aGUgZGV2aWNlIHRyZWUgZm9yIHRo
ZSBtcGZzL2ljaWNsZSBraXQgcGFydGx5IGR5ZSAKPiB0byBzb21lIGNoYW5nZXMgd2UgbWFkZSB0
byB0aGUgZGVzaWduLiBQcmV2aW91c2x5IFNEIGFuZCBlTU1DIHdlcmUgCj4gZGlmZmVyZW50IEZQ
R0EgZGVzaWducyBidXQgbm93IGJvdGggYXJlIGluIHRoZSBzYW1lIGRlc2lnbiBhbmQgbWFuYWdl
ZCAKPiBieSB0aGUgYm9vdGxvYWRlciwgZGVwZW5kaW5nIG9uIHdoZXJlIGl0IGZpbmRzIHRoZSBp
bWFnZSB0byBib290IGZyb20uCj4gU2luY2UgdGhlbiB3ZSd2ZSBqdXN0IGJlZW4gdXNpbmcgdGhl
IGZvbGxvd2luZyBzaW5nbGUgZW50cnkgaW4gdGhlIC5kdHNpOgo+IAo+ICDCoMKgwqAgwqDCoMKg
IG1tYzogbW1jQDIwMDA4MDAwIHsgLyogQ29tbW9uIG5vZGUgZW50cnkgZm9yIGVtbWMvc2QgKi8K
PiAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgY29tcGF0aWJsZSA9ICJjZG5zLHNkNGhjIjsKPiAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgcmVnID0gPDB4MCAweDIwMDA4MDAwIDB4MCAweDEwMDA+Owo+ICDC
oMKgwqAgwqDCoMKgIMKgwqDCoCBjbG9ja3MgPSA8JmNsa2NmZyBDTEtfTU1DPjsKPiAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4gIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIGludGVycnVwdHMgPSA8UExJQ19JTlRfTU1DX01BSU4gUExJQ19JTlRfTU1DX1dB
S0VVUD47CgpJJ2xsIHN3aXRjaCB0byAyIGludGVycnVwdHMuCgo+ICDCoMKgwqAgwqDCoMKgIMKg
wqDCoCBidXMtd2lkdGggPSA8ND47Cj4gIMKgwqDCoCDCoMKgwqAgwqDCoMKgIGNhcC1tbWMtaGln
aHNwZWVkOwo+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjYXAtc2QtaGlnaHNwZWVkOwo+ICDCoMKg
wqAgwqDCoMKgIMKgwqDCoCBuby0xLTgtdjsKPiAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgZGlzYWJs
ZS13cDsKPiAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgbWF4LWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+
Owo+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwoKSSB1bmRlcnN0
YW5kIHlvdSBwcmVmZXIgdGhlbiB0aGUgbW1jIG5vZGUgdG8gYmUgYWN0aXZlPyBCZWZvcmUgdGhl
IERUCmhhZCBTREhDIG9uZSBlbmFibGUsIHNvIG15IHBhdGNoIGRpZCBub3QgaW50cm9kdWNlIGNo
YW5nZXMgKGV4Y2VwdAptZW50aW9uZWQgaW50ZXJydXB0KS4KCkkgY2FuIGNoYW5nZSBpdCB0byBt
bWMgYWJvdmUgd2l0aCB5b3VyIGV4cGxhbmF0aW9uLgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
