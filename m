Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBCCC388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 11:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F56207DE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 11:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u34mIoWU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQlxVlKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6F56207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yaapd0+EiKc2SxoQwanKUyYpdFHizdgVvS8F3Cc52fY=; b=u34mIoWUIHsLmjM4lzNioGwYX
	k2F1STpCUG0wYhxLzPzlh6Cvu4sTE1bB1rzTU81jsEDaM37Vh6uRt5cUw8XZowov95Y0f9OW36Mnc
	NtUoDqj0joQMrV8CT/fbJzSgPU4a6lWh26KSu0soFTZC33kW/Mfne2NVwDpKCAYu9elql933Zo4oc
	z/MfSAmaXBEmSM9cRfpNkN7co/3f9sbb8xR+fBKCy5uh/vyYBi4HciEYwnAlR6hHiP6CVbsQgUEeh
	t3MnmF+HZoaEOJahr/aP7yJjGjHu1IiIG8kwYDhZzI8jReZ7ydzcdGV/oPSB82ARBZp4LlfwD/jxG
	2YRc+IUdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdXLV-0002MV-UR; Fri, 13 Nov 2020 11:34:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdXLT-0002Lo-AB
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 11:34:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k2so9459657wrx.2
 for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2020 03:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GMSoaYGH0pA9Jq20ijPobnsXJLhxhfT0yN3dukQKp6A=;
 b=LQlxVlKrvCkLWpBdDs/58N3IpmTopAyTws9kNHZKVjci2aBi1KeRGvBuLX3Spgfi5e
 zpsWdcAR5ty1QGG1399GotlpH1BqS5IYBsNKJDMIjqQQXunfMczgQrn1490UCWHS6P4d
 3OwmNxDiFuwYS8ZGX/dAzL/8PBFBlsS1pGuHYAbKe0jDT8JvUG2RmWO2ShVciJ/YK/ql
 ANmrM28vnx9onF4QRkv0o6w6p2+JYDrxbAYPfFE5B+X6ddFHhbkdMUiVKcZ4po1o8Td2
 W3oocH6cjfpeFTp63SmGwJuwj6OHv7l+Rh9OSMNDqwkjTEOq1sgE8ugKM0f4F6lKBAFF
 Xm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GMSoaYGH0pA9Jq20ijPobnsXJLhxhfT0yN3dukQKp6A=;
 b=orKrThStiVvEXum3SdQa57xVLerNJdN0unh2oETxS/0vg8F8LBW9fEy2ulZcMR0JR6
 SIcqncKs4cvKt/k5AVnPo7/J6/NbTSnHIndt3WCKtuwSv5poey+5ruvImhNCZo1oSXfR
 zz81vJ/C6M1ndK76dKsr+qlNSjz1TyZBBOZTfeXhHPPVSZb8/Yi4HNrbYeXGeDCTxiRn
 8bLJWPFyN4T2NuVE7Nb9j0X8x+hMuutYrW3AbdAxW7eRY8S+d5c69fX5uNVdh2eVso9f
 qRa5dtqhuILYjEQ+IvEMxz3fBscBRwbM/x1D4MTsX8EX7wMOlPbPtZau3L9TN/bFITxX
 C2iQ==
X-Gm-Message-State: AOAM530j0jeE8poP5/OBNvqlqMacIPSa/7lJY5TnoNrN/GPv4LBCzrPQ
 JB9pT4yit5ANJ7t0YNOcXZ8YBO/IFcs=
X-Google-Smtp-Source: ABdhPJyzAQ2D5zO01xFQdEApfeD/HaEk9Rw5kL9gKvfUGhUiYT0F9Hi4TU3agolrFc6X50eVsg9zgg==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr2844517wrj.162.1605267260409; 
 Fri, 13 Nov 2020 03:34:20 -0800 (PST)
Received: from [192.168.8.114] ([37.167.2.65])
 by smtp.gmail.com with ESMTPSA id g23sm9865657wmh.21.2020.11.13.03.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 03:34:19 -0800 (PST)
Subject: Re: csum_partial() on different archs (selftest/bpf)
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <e23c63dd-5f90-c273-615f-d5d67991529c@gmail.com>
Date: Fri, 13 Nov 2020 12:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_063423_364916_F7931C16 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: Tom Herbert <tom@herbertland.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anders Roxell <anders.roxell@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8xMy8yMCAxMTozNiBBTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBJIHdhcyBydW5u
aW5nIHRoZSBzZWxmdGVzdC9icGYgb24gcmlzY3YsIGFuZCBoYWQgYSBjbG9zZXIgbG9vayBhdCBv
bmUKPiBvZiB0aGUgZmFpbGluZyBjYXNlczoKPiAKPiAgICMxNC9wIHZhbGlkIHJlYWQgbWFwIGFj
Y2VzcyBpbnRvIGEgcmVhZC1vbmx5IGFycmF5IDIgRkFJTCByZXR2YWwKPiA2NTUwNyAhPSAtMjkg
KHJ1biAxLzEpCj4gCj4gVGhlIHRlc3QgZG9lcyBhIGNzdW1fcGFydGlhbCgpIGNhbGwgdmlhIGEg
QlBGIGhlbHBlci4gcmlzY3YgdXNlcyB0aGUKPiBnZW5lcmljIGltcGxlbWVudGF0aW9uLiBhcm02
NCB1c2VzIHRoZSBnZW5lcmljIGNzdW1fcGFydGlhbCgpIGFuZCBmYWlsCj4gaW4gdGhlIHNhbWUg
d2F5IFsxXS4gYXJtICgzMi1iaXQpIGhhcyBhIGFyY2ggc3BlY2ZpYyBpbXBsZW1lbnRhdGlvbiwK
PiBhbmQgZmFpbCBpbiBhbm90aGVyIHdheSAoRkFJTCByZXR2YWwgMTMxMDQyICE9IC0yOSkgWzJd
Lgo+IAo+IEkgbWltaWNrZWQgdGhlIHRlc3QgY2FzZSBpbiBhIHVzZXJsYW5kIHByb2dyYW0sIGNv
bXBhcmluZyB0aGUgZ2VuZXJpYwo+IGNzdW1fcGFydGlhbCgpIHRvIHRoZSB4ODYgaW1wbGVtZW50
YXRpb24gWzNdLCBhbmQgdGhlIGdlbmVyaWMgYW5kIHg4Ngo+IGltcGxlbWVudGF0aW9uIGRvZXMg
eWllbGQgYSBkaWZmZXJlbnQgcmVzdWx0Lgo+IAo+IHg4NiAgICAgOiAgICAtMjkgOiAweGZmZmZm
ZmUzCj4gZ2VuZXJpYyA6ICA2NTUwNyA6IDB4MDAwMGZmZTMKPiBhcm0gICAgIDogMTMxMDQyIDog
MHgwMDAxZmZlMgo+IAo+IFdobyBpcyBjb3JyZWN0PyA6LSkgSXQgd291bGQgYmUgbmljZSB0byBn
ZXQgcmlkIG9mIHRoaXMgZmFpbGVkIGNhc2UuLi4KPiAKClRoZXJlIGFyZSBhbGwgdGhlIHNhbWUg
dmFsdWUgOiksIHRoZXkgYWxsIGZvbGQgdG8gdTE2ICAweEZGRTMKCk1heWJlIHRoZSB0ZXN0IG5l
ZWRzIGEgZml4LCB0aGVyZSBpcyBhIG1pc3NpbmcgZm9sZGluZy4KCj4gCj4gVGhhbmtzLAo+IEJq
w7Zybgo+IAo+IAo+IFsxXSBodHRwczovL3FhLXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4
LW5leHQtbWFzdGVyL2J1aWxkL25leHQtMjAyMDExMTIvdGVzdHJ1bi8zNDMwNDAxL3N1aXRlL2tz
ZWxmdGVzdC90ZXN0L2JwZi50ZXN0X3ZlcmlmaWVyL2xvZwo+IFsyXSBodHRwczovL3FhLXJlcG9y
dHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4LW1haW5saW5lLW1hc3Rlci9idWlsZC92NS4xMC1yYzMt
MjA3LWc1ODVlNWIxN2I5MmQvdGVzdHJ1bi8zNDMyMzYxL3N1aXRlL2tzZWxmdGVzdC90ZXN0L2Jw
Zi50ZXN0X3ZlcmlmaWVyL2xvZwo+IFszXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9iam90by9k
YzIyZDU5M2FhM2FjNjNjMmM5MDYzMmRlNWVkODJlMAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
