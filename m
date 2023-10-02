Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06540E7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwmuUw0d4LoVN5+ywtk/qIPCYcP8D7jzoBNEwMH7owI=; b=zPNn0GuLf4Do17
	k6vWdyAtocKpitVQoLeBJcyGzAgYDRIMEA2/rZ7KfLqr5OOxp5kWL3PULHat8tGOmB0WBhYQ3qCuX
	zI6fbAWr+NPxqAra5xCMl80ZBbWlQXoKexKWxqr/RA5/79m262slF0GgnZxt8vXcsxz8xkDRzpqz/
	76jc8/L3cqFl04s6FNF7fNkZiIoO26ImHw/Mk9XQwjyJ9xftsMzXHfytIq8r9Dfk9Y8IlLV3d4wjC
	+qfMgr105u7zSa5TCopEqmQDbUcLuwpjSzTPzl/EZfvFw6s4slWUf+ljgxXxFTeJSho+T+/DQ070A
	5RSgBC9Cqp1J1r3kW8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnDXJ-00C67T-3B;
	Mon, 02 Oct 2023 07:40:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnDXH-00C660-0I
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 07:40:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40651b22977so10373165e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 00:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696232406; x=1696837206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/SmkuwNO2qK93iNkdDy+3DZV33vyoBJOdJJ+lJYPcnY=;
        b=dMLrLQ89OILNgj6IJgF7s0RHP+zaWjHabgeQsRROjpSt0TyOq6uZsYWANOAg6y33C1
         7f/xxjpz0bCwDTtm/pRsOkHkF9BDhVmT9C1wMD0aDpXtBYFO5/ahJTIRBAuht2xdoBRg
         PRLv9xw7s9cpP0hVjPrKDe8tWlorVkCeJ+AttPXyj/mqTO/AceFhO5nhWiXvaPJXAVR1
         r550lp3goJQs24NREM8/iSaE3icu954Ah4U9V8PERfVGWto50Ej820bgJyyEXpUaFJYf
         L3LQyYW0ogUSzbZOyUw9TKzXBr9wRrE9QK9nFJX1PLaBLTmuJ5v9tvIZXOfFyqz3I2WV
         Bb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232406; x=1696837206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SmkuwNO2qK93iNkdDy+3DZV33vyoBJOdJJ+lJYPcnY=;
        b=GGir9+i97iiEe2YnKsnuCf8Ieb/+L/rIvpB/Ne/AqDXawQtU0O+AosjBQkiAplr6eH
         DsKJ6/Y7zW0sCryjyHRxyiadnzqs6rZ6A4H8kVY7oq5Fr1LLEg7EeWGrcIOevzlQvYBF
         jfmWPQxAheturKLWU7dvUN0IrSbzwzL8BitjR1a5ixoGIOYKex0swMJ+Nc2/hVDq8GPm
         89TgD3RiuixK4aJf3Q0LK89U5O11xGxf1PM13GyPEzbk55aftS4ajKmMK0IxplkNoVnh
         p13FKDSZ5p9V2Mf0onTCmXug5hcVuSFMALDf0/gAr7ZU50oMsY3/1xd+Qw3QIPQxUHw9
         AkiQ==
X-Gm-Message-State: AOJu0Yy2v6+9T/xEr5keu0YI7FQ8uEkHhdlWPYrbw8QF5VXoCjcad9h1
	Ubggc15RC6DWIlde8l6OAUKiDw==
X-Google-Smtp-Source: AGHT+IGpjr4vDelieeMrTffwVcMt8woXagyVVosQfp5vhupKOMLXb+SgLQsZ3moRwjQnrVRywBIhzA==
X-Received: by 2002:adf:d0c1:0:b0:31a:ea18:c516 with SMTP id z1-20020adfd0c1000000b0031aea18c516mr9425270wrh.3.1696232405718;
        Mon, 02 Oct 2023 00:40:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:2dc5:b516:f0fb:7491? ([2a01:e0a:999:a3a0:2dc5:b516:f0fb:7491])
        by smtp.gmail.com with ESMTPSA id d17-20020adfe891000000b003266ece0fe2sm5879650wrm.98.2023.10.02.00.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 00:40:05 -0700 (PDT)
Message-ID: <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
Date: Mon, 2 Oct 2023 09:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>, =?UTF-8?Q?Bj=C3=B6rn_Topel?=
 <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ron Minnich <rminnich@gmail.com>,
 Daniel Maslowski <cyrevolt@googlemail.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20230930-patchy-curdle-ef5ee6e1a17c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_004011_134969_5C994995 
X-CRM114-Status: GOOD (  19.35  )
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

CgpPbiAzMC8wOS8yMDIzIDExOjIzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBTZXAg
MjYsIDIwMjMgYXQgMDU6MDM6MDlQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBT
aW5jZSBjb21taXQgNjFjYWRiOSAoIlByb3ZpZGUgbmV3IGRlc2NyaXB0aW9uIG9mIG1pc2FsaWdu
ZWQgbG9hZC9zdG9yZQo+PiBiZWhhdmlvciBjb21wYXRpYmxlIHdpdGggcHJpdmlsZWdlZCBhcmNo
aXRlY3R1cmUuIikgaW4gdGhlIFJJU0MtViBJU0EKPj4gbWFudWFsLCBpdCBpcyBzdGF0ZWQgdGhh
dCBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgbWlnaHQgbm90IGJlIHN1cHBvcnRlZC4KPj4gSG93ZXZl
ciwgdGhlIFJJU0MtViBrZXJuZWwgdUFCSSBkZXNjcmliZXMgdGhhdCBtaXNhbGlnbmVkIGFjY2Vz
c2VzIGFyZQo+PiBzdXBwb3J0ZWQuIEluIG9yZGVyIHRvIHN1cHBvcnQgdGhhdCwgdGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciBTLW1vZGUKPj4gaGFuZGxpbmcgb2YgbWlzYWxpZ25lZCBhY2Nl
c3NlcyBhcyB3ZWxsIHN1cHBvcnQgZm9yIHByY3RsKFBSX1VOQUxJR04pLgo+Pgo+PiBIYW5kbGlu
ZyBtaXNhbGlnbmVkIGFjY2VzcyBpbiBrZXJuZWwgYWxsb3dzIGZvciBhIGZpbmVyIGdyYWluIGNv
bnRyb2wKPj4gb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzZXMgYmVoYXZpb3IsIGFuZCB0aGFua3Mg
dG8gdGhlIHByY3RsIGNhbGwsIGNhbgo+PiBhbGxvdyBkaXNhYmxpbmcgbWlzYWxpZ25lZCBhY2Nl
c3MgZW11bGF0aW9uIHRvIGdlbmVyYXRlIFNJR0JVUy4gVXNlcgo+PiBzcGFjZSBjYW4gdGhlbiBv
cHRpbWl6ZSBpdHMgc29mdHdhcmUgYnkgcmVtb3Zpbmcgc3VjaCBhY2Nlc3MgYmFzZWQgb24KPj4g
U0lHQlVTIGdlbmVyYXRpb24uCj4+Cj4+IEN1cnJlbnRseSwgdGhpcyBzZXJpZXMgaXMgdXNlZnVs
IGZvciBwZW9wbGUgdGhhdCB1c2VzIGEgU0JJIHRoYXQgZG9lcwo+PiBub3QgaGFuZGxlZCBtaXNh
bGlnbmVkIHRyYXBzLiBJbiBhIG5lYXIgZnV0dXJlLCB0aGlzIHNlcmllcyB3aWxsIG1ha2UKPj4g
dXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVzdCBkZWxlZ2F0aW9uIG9m
IHRoZQo+PiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgdHJhcHMgdG8gdGhlIFMtbW9kZSBzb2Z0d2Fy
ZS4gVGhpcyBleHRlbnNpb24gaGFzCj4+IGJlZW4gc3VibWl0dGVkIGZvciByZXZpZXcgdG8gdGhl
IHJpc2N2IHRlY2gtcHJzIGdyb3VwLiBBbiBPcGVuU0JJCj4+IGltcGxlbWVudGF0aW9uIGZvciB0
aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4KPj4KPj4gVGhpcyBzZXJpZXMgY2FuIGJlIHRl
c3RlZCB1c2luZyB0aGUgc3Bpa2Ugc2ltdWxhdG9yIFszXSBhbmQgYW4gb3BlblNCSQo+PiB2ZXJz
aW9uIFs0XSB3aGljaCBhbGxvd3MgdG8gYWx3YXlzIGRlbGVnYXRlIG1pc2FsaWduZWQgbG9hZC9z
dG9yZSB0bwo+PiBTLW1vZGUuCj4gCj4gU29tZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGRvIG5v
dCBidWlsZCBmb3IgYW55IGNvbmZpZ3MsIHNvbWUgYXJlCj4gYnJva2VuIGZvciBjbGFuZyBidWls
ZHMgYW5kIG90aGVycyBhcmUgYnJva2VuIGZvciBub21tdS4gUGxlYXNlIHRyeSB0bz4gYnVpbGQg
dGVzdCB0aGlzIG1vcmUgdGhvcm91Z2hseSBiZWZvcmUgeW91IHN1Ym1pdCB0aGUgbmV4dCB2ZXJz
aW9uLgoKSGkgQ29ub3IsCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSdsbCBjaGVjayB0aGF0
LgoKPiAKPiBBbHNvLCBBSVVJLCB0aGlzIHNlcmllcyBzaG91bGQgYmUgbWFya2VkIFJGQyBzaW5j
ZSB0aGUgU0JJIGV4dGVuc2lvbgo+IHRoaXMgcmVsaWVzIG9uIGhhcyBub3QgYmVlbiBmcm96ZW4u
CgpUaGlzIHNlcmllcyBkb2VzIG5vdCBhY3R1YWxseSB1c2VzIHRoZSBTQkkgZXh0ZW5zaW9uIGJ1
dCBwcm92aWRlcyBhIHdheQp0byBkZXRlY3QgaWYgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUgbm90
IGhhbmRsZWQgYnkgaGFyZHdhcmUgbm9yIGJ5IHRoZQpTQkkuIEl0IGhhcyBiZWVuIHJlcG9ydGVk
IGJ5IFJvbiAmIERhbmllbCB0aGV5IHRoZXkgaGF2ZSBhIG1pbmltYWwgU0JJCmltcGxlbWVudGF0
aW9uIHRoYXQgZG9lcyBub3QgaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgYW5kIHRoYXQgdGhl
eQp3b3VsZCBsaWtlIHRvIG1ha2UgdXNlIG9mIHRoZSBQUl9TRVRfVU5BTElHTiBmZWF0dXJlLiBU
aGlzIGlzIHdoYXQgdGhpcwpzZXJpZXMgYWRkcmVzc2VzIChhbmQgdGh1cyBkb2VzIG5vdCBkZXBl
bmQgb24gdGhlIG1lbnRpb25lZCBTQkkgZXh0ZW5zaW9uKS4KClRoYW5rcywKCkNsw6ltZW50Cgo+
IAo+IENoZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
