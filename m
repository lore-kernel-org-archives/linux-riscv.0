Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B77DC07D5A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pETmwno/N7qhY8N5FXO1uPrT071EZC3myZeX2Kl8zc=; b=dR33uk4QDt1LGR
	zg5TG8oTLhrUbLoQJVC3y88FxKbUcsSyIunbCKSSy7YJ1qbaB/VvnHWGbexnRPvw6ofjUKLRZVoWF
	4mh3GerxI/XYMi50cIQVpuAq1ouVQQ0S57sTfLTheU2OdFDVvC6+5CFnhECZWDKp3Lq7d0pcoB1PE
	ZIK05Lnn7cv+3yUqKMZNFooMP4f9qscrNBrUtwMcSPhFwalTvehgoVP/DhSt9sgYAkK0uWmpy0Vce
	YE56JH+tcrTK/zQg7QBHIO4JXlFwe5I05YI9JrDm2NSO2A9rqvO6m0tqP5wgKixqcE/qZ0kRwgeFx
	1x2GnGkhINqS7IiUSsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yn7-0024FO-0e;
	Mon, 27 Nov 2023 10:24:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yn4-0024Dq-2J
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:24:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-407acb21f27so3962825e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701080667; x=1701685467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wu1INlBttSoNTPvzJ8LrRj387HEl+wYp0ca6zoIWQt8=;
        b=r16eYzv/56ZP5yXYPLbhaKnhMlaAlF7+WeGuByNB0WhFeyiTYb83TrCk4jkD7p0yJk
         RkNRM+O8rHx2OShm/HoGyUOycQlm4D6iXkuhk53S9X0gHHOnyzH3BrHl+Ic/wefAP83R
         lRa1ExJCNcBA3z2INqxqfhq5RfbVPl4Rx6NIQbtleWvjdYJ4ACmvvtbxTSuvl4ZARC1s
         gMmt6+3qhvFZIWo7KT3h1kTB4XvV/X/iTxj2DNlboPlEKS98rwXQ6YdMKgr/KxRZJ7/w
         sEd6VvreZiK64bcS1uc2lzATTTBl+YC/ECrB7BtNEIQWBRA7Gsu4zhYY8Lshgw00v3Uh
         3EqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080667; x=1701685467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu1INlBttSoNTPvzJ8LrRj387HEl+wYp0ca6zoIWQt8=;
        b=f2wqLcTSQVJucgD/26dWlvpy8E2peLb62fmQ9AIGfQiQ6LXICUw4T6JCF1NuGDcTK9
         CWj5NcGFwXxLbPAYaqUeR/kM4Et/5IUV0K6XZAfdl3DCt9q9U7KmzD1EWsVR8g7oGP6C
         pdBhZ8A2AUqNGVPIdXNVhIy32Kydd6ZEn/QKQoytYm5utTn6gnZm7c63yLXr6fXBUxBE
         vBoHdFU3+5xt+5S5Mr3Yrk3aMslUne3yG+pY7MRxJJrlDP0MEBypAHV0yT6Nt3v7+xtO
         KwgBK9Ty2HhsQGLuUK5qztmgX62CXAMSZx5c62mVV5wSEDzS/cCd/p2nLtuwQXzQWxti
         8IAA==
X-Gm-Message-State: AOJu0Yx9JRo/bQzExujcNMrFVL6EwQOzJM9OtljxWxfO1xNK3N1qn6D0
	aieRfRetQKpsXmG6raZC8mgJfA==
X-Google-Smtp-Source: AGHT+IFNFSIcXPktRz641S+TwSgPraxmwJhBPLk9O+g+xWRL5SHdqiCk/LWjTGiodXivE9z6GOcheQ==
X-Received: by 2002:a05:600c:45c6:b0:405:39bb:38a8 with SMTP id s6-20020a05600c45c600b0040539bb38a8mr7720726wmo.2.1701080666882;
        Mon, 27 Nov 2023 02:24:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:1a67:8e18:5d34:ea1b? ([2a01:e0a:999:a3a0:1a67:8e18:5d34:ea1b])
        by smtp.gmail.com with ESMTPSA id q17-20020a5d5751000000b00323287186aasm11598473wrw.32.2023.11.27.02.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 02:24:26 -0800 (PST)
Message-ID: <9cb1fadf-bb83-4e9f-9c29-bff53e30b0c6@rivosinc.com>
Date: Mon, 27 Nov 2023 11:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: fix incorrect use of __user pointer
To: David Laight <David.Laight@ACULAB.COM>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, kernel test robot <lkp@intel.com>
References: <20231124113803.165431-1-cleger@rivosinc.com>
 <bf7dfadfc8a94e3f810a8ba238f77543@AcuMS.aculab.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <bf7dfadfc8a94e3f810a8ba238f77543@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_022434_761654_85FEB6A4 
X-CRM114-Status: GOOD (  16.28  )
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

CgpPbiAyNS8xMS8yMDIzIDE2OjM3LCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gLi4uCj4+IEBAIC00
OTEsNyArNDg2LDcgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCj4+Cj4+ICAJdmFsLmRhdGFfdTY0ID0gMDsKPj4gIAlmb3IgKGkgPSAwOyBpIDwgbGVu
OyBpKyspIHsKPj4gLQkJaWYgKGxvYWRfdTgocmVncywgKHZvaWQgKikoYWRkciArIGkpLCAmdmFs
LmRhdGFfYnl0ZXNbaV0pKQo+PiArCQlpZiAobG9hZF91OChyZWdzLCBhZGRyICsgaSwgJnZhbC5k
YXRhX2J5dGVzW2ldKSkKPj4gIAkJCXJldHVybiAtMTsKPj4gIAl9Cj4gCj4gSSdkIHJlYWxseSBo
YXZlIHRob3VnaHQgdGhhdCB5b3UnZCB3YW50IHRvIHB1bGwgdGhlIGtlcm5lbC91c2VyCj4gY2hl
Y2sgd2F5IG91dHNpZGUgdGhlIGxvb3A/CgpIaSBEYXZpZCwKCkkgaG9wZSB0aGUgY29tcGlsZXIg
aXMgYWJsZSB0byBleHRyYWN0IHRoYXQgJ2lmJyBvdXQgb2YgdGhlIGxvb3Agc2luY2UKcmVncyBp
c24ndCBtb2RpZmllZCBpbiB0aGUgbG9vcC4gTmV2ZXJ0aGVsZXNzLCB0aGF0IGNvdWxkIGJlIG1v
cmUKImNsZWFyIiBpZiBwdXQgb3V0c2lkZSBpbmRlZWQuCgo+IEluIGFueSBjYXNlLCBmb3IgYSBt
aXNhbGlnbmVkIHJlYWQgd2h5IG5vdCBqdXN0IHJlYWQgKGFkZHIgJiB+NylbMF0KPiBhbmQgKGlm
IG5lZWRlZCkgKGFkZHIgJiB+NylbMV0gYW5kIHRoZW4gYWhpZnQgYW5kIG9yIHRvZ2V0aGVyPwoK
TWFrZXMgc2Vuc2UsIHRoZSBvcmlnaW5hbCBjb2RlIHdhcyBsaWtlIHRoYXQgYnV0IHByb2JhYmx5
IGNvcHkvcGFzdGVkCmZyb20gb3BlblNCSSBJIGd1ZXNzLiAoPykKCkxldCdzIGtlZXAgdGhhdCBm
b3IgdGhlIG1vbWVudCAodGhpcyBwYXRjaCBpcyBhYm91dCBmaXhpbmcgd3JvbmcgX191c2VyCmFk
ZHJlc3Mgc3BhY2UpLiBJIHdpbGwgdHJ5IHRvIHN1Ym1pdCBhbm90aGVyIHNlcmllcyB1c2luZyB3
aGF0IHlvdSBwcm9wb3NlZC4KClJlZ2FyZHMsCgpDbMOpbWVudAoKPiAKPiBjbGFuZyB3aWxsIGRv
IGl0IGZvciBtaXNhbGlnbmVkIHN0cnVjdHVyZSBtZW1iZXJzIHdpdGgga25vd24KPiBtaXNhbGln
bm1lbnQsIGJ1dCBpdCBpcyBhbG1vc3QgY2VydGFpbmx5IGFsc28gYmV0dGVyIGZvciByZWFkcwo+
IHdpdGggdW5rbm93biBtaXNhbGlnbm1lbnQuCj4gCj4gCURhdmlkCj4gCj4gLQo+IFJlZ2lzdGVy
ZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5
bmVzLCBNSzEgMVBULCBVSwo+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
