Return-Path: <SRS0=1pxZ=OS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41D3C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  9 Dec 2018 16:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20C520865
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  9 Dec 2018 16:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUY1B8lv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jppk0nSe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20C520865
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2l4BB1ZRsLOvDnaxLedLNkLBA0+PA/sMC8knJwHiYo=; b=bUY1B8lvoME8Zk
	7Xm9pa3ul0YFj05zpcr8nMmHJVGyhrdqexdSB42TqIhM/6nYgqy2HTkodLvS6XZEbP+T3JxEB3SZi
	bc3u3BLX0IOhajFEYIus1dVP97ZOsPeFX6n1PU6bUAvgq3pB4xuAMRxCqgxmEYDqgGDIg3JCHKKZp
	fZVGM4Y7AwTRNnl6clqif3KpBzoQ1QkEasKF00tCuk16hN4lqKHLljuAArANuMmR5tPaut3Zr5Dns
	j/OgLB5VMEiivFRoEDGNkaN1BqeuAXH5Wjnbfe6RurvqAhflrWCiUuKKgP9OW8BoeSnWEhWMQoUFG
	z+xsBkI5L8Jwop3QQLfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gW1ym-0005fV-4n; Sun, 09 Dec 2018 16:30:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW1yi-0005da-VN
 for linux-riscv@lists.infradead.org; Sun, 09 Dec 2018 16:30:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id j2so8170733wrw.1
 for <linux-riscv@lists.infradead.org>; Sun, 09 Dec 2018 08:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FQB0a0IYNo7nzjeesQeSWed9Fp4QxJVIsK4jZhxJpcI=;
 b=Jppk0nSeK155fTwXj0059QiD5mKiqcaL05P5HAzEokSCSlpHAE4nMy0VG2w52pLicb
 LSkMDZcEm55h+pok8ZLw2ZTsIXkiQE23IH6NVcKMiuFSBpWhziQgc9uM3pM2WGbngwKV
 iMLZWv/CzLdh31Ea5rPhKc2tkW94PdqpYpAEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FQB0a0IYNo7nzjeesQeSWed9Fp4QxJVIsK4jZhxJpcI=;
 b=PLxQmaimyJgSkk8vLMp1z34cSf9RV8v05GILVIiMjhreswPS+XD0uPZ1SrK3lrGyzs
 76cFbRBebs0QpPcJhNEsfPrf36xtbdTwBHbxzNjqCyL+JLC44Wa2h5EcXVOo1HqwpU53
 /Y52nGidx3m3LkUCTcM0GjSIm7TYRu5IPerwCN/UeqPGea8duFDQHBDDhTiqG94uZ/e3
 i1cJ/WN+gMuMwLjtzzNmHkZnaUS4T9BOmZORstLawp5ZoLdcqZ7WayGcg4kVw3VVq/AG
 S1Gb1hUyHPaI7Sq9oLBbz2IfAWsWE9oHns3yS27oKiH2yw9hke+5I/MZpRRjAsifJCWl
 iDPw==
X-Gm-Message-State: AA+aEWbUVIn5q9kUuOuCSebVS1nfHlPjeSlKWD6dynsqbTmeE9hklRTa
 p/EVDc0eJwmKPqwWa9gpGhQIpA==
X-Google-Smtp-Source: AFSGD/VW9CqCEd1EmZvjZwOiD9wTJXLLd3mKkP2psLm0QyuxQzJAEw6Lc+oPpNbjT7GDwco0FQ1nrg==
X-Received: by 2002:a5d:6549:: with SMTP id z9mr7038765wrv.116.1544373036375; 
 Sun, 09 Dec 2018 08:30:36 -0800 (PST)
Received: from [192.168.0.40] (29.44.88.92.rev.sfr.net. [92.88.44.29])
 by smtp.googlemail.com with ESMTPSA id
 k128sm13132271wmd.37.2018.12.09.08.30.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Dec 2018 08:30:35 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Provide sched_clock for riscv_timer
To: Palmer Dabbelt <palmer@sifive.com>, anup@brainfault.org
References: <mhng-3c8e382b-518c-4e32-b76e-3eebdd41034a@palmer-si-x1c4>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <dd6a7f3f-203a-f71d-314e-9706ca4757bf@linaro.org>
Date: Sun, 9 Dec 2018 17:30:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <mhng-3c8e382b-518c-4e32-b76e-3eebdd41034a@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_083049_014794_E13B0CE1 
X-CRM114-Status: GOOD (  14.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcvMTIvMjAxOCAxODo1OSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVHVlLCAwNCBE
ZWMgMjAxOCAwMjoyOTo1MCBQU1QgKC0wODAwKSwgYW51cEBicmFpbmZhdWx0Lm9yZyB3cm90ZToK
Pj4gVGhpcyBwYXRjaHNldCBleHRlbmRzIHJpc2N2X3RpbWVyIHRvIHByb3ZpZGUgc2NoZWRfY2xv
Y2sgdXNpbmcgZ2VuZXJpYwo+PiBzY2hlZF9jbG9jayBmcmFtZXdvcmsuCj4+Cj4+IFRoZSBwYXRj
aHNldCBpcyB0ZXN0ZWQgb24gUUVNVSB2aXJ0IG1hY2hpbmUuIEl0IGlzIGJhc2VkIG9uCj4+IExp
bnV4LTQuMjAtcmM1Cj4+IGFuZCBjYW4gYmUgZm91bmQgYXQgcmlzY3Zfc2NoZWRfY2xvY2tfdjIg
YnJhbmNoIG9mOgo+PiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPj4KPj4g
Q2hhbmdlcyBzaW5jZSB2MToKPj4gwqAtIEFkZGVkIHBhdGNoIHRvIHNlbGVjdCBHRU5FUklDX1ND
SEVEX0NMT0NLIGZvciBSSVNDLVYKPj4gwqAtIEtjb25maWcgUklTQ1ZfVElNRVIgZGVwZW5kcyBv
biBHRU5FUklDX1NDSEVEX0NMT0NLCj4+Cj4+IEFudXAgUGF0ZWwgKDIpOgo+PiDCoCBSSVNDLVY6
IFNlbGVjdCBHRU5FUklDX1NDSEVEX0NMT0NLIGZvciBjbG9ja3NvdXJjZSBkcml2ZXJzCj4+IMKg
IGNsb2Nrc291cmNlOiByaXNjdl90aW1lcjogUHJvdmlkZSBzY2hlZF9jbG9jawo+Pgo+PiDCoGFy
Y2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+PiDC
oGRyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZ8KgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqBkcml2
ZXJzL2Nsb2Nrc291cmNlL3Jpc2N2X3RpbWVyLmMgfCA5ICsrKysrKysrKwo+PiDCoDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IEknbSBnb2luZyB0
byBhZGQgdGhlc2UgdG8gbXkgZm9yLW5leHQsIGJ1dCBsZXQgbWUga25vdyBpZiB0aGVzZSBzaG91
bGQKPiBnbyB0aHJvdWdoIGEgY2xvY2sgbWFpbnRhaW5lcidzIHRyZWUgaW5zdGVhZCBhbmQgSSds
bCBkcm9wIHRoZW0uCgpJJ2xsIHRha2UgdGhlIHNlY29uZCBvbmUgdGhyb3VnaCBteSB0cmVlLgoK
ICAtLSBEYW5pZWwKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
