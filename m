Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4E6C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW8R9Q72cV5i+wtaewAsK74dxFsETFAj/vi5CsUTsAc=; b=AW8u07Hi1XQZKF
	hs+A+nMfyl8Vom8AMAnMGfUNnEKD3fHhWVAiVDL31zz48BZvhqawX7ImsXWU68TQ6w6c0rNqS04ZQ
	ZkYoMqkWSFbsj8TFA+jMDpOSmdamV2AfC6ys8IQJlkfKxH7cUfZJeBGF3xcxFCSHDXbwPD+iZuHcg
	Ck6jMRI66d0zUNJ6+vUYbZrNsOAAQDjsmUUEl0+6E2KEjZc97SWB0vPKIL8WCRqHRjuIn1rGVu/gU
	RHawt0YdQStJVqa5A038T5uDlvRREl27S0ZvzSSEzbXNBPtGeZ9hzB2ANDkJaWgFR8pN9OYLqAG98
	FH8JkGPwtLe2KYVx9pCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paB7Z-008NOd-JV; Thu, 09 Mar 2023 07:55:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paB77-008NAk-K4
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 07:55:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id bd34so945571pfb.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 23:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678348499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iXK5+ePsDKhEgIlUU5m0Syo0it8X6rean5oSrzb73E=;
        b=nsqZJ98umHe3ivTzOlso1UTWbtWFniYXYY9kIPJbg7QYQMlnfT+QWhhfneUDxytL82
         aRetbVQmZ/+8D9C6oHEmp5R+cFBKXIM2iW69TfpopiEP87a3UChXBBB0AL7xxE4t17VV
         wr7J5qXckA38AY/PT/6Iu5rCWgo+4v6eJAOa2cJMJjZp9Bjla7YmbI8ls9A3yonOTA/+
         jbbK7ILw4fBc/JjYdM+pbQcYI2xliT8lwGJglst9mO7T2VVYBtCif09KgFfFIJ67WJNu
         KLyX7WFfUR11St8Hy5TxbAM4m6txZR9VBgdsy/hU4Lmqb68Dnu0/5DVpn97SSVLusBJZ
         Y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678348499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iXK5+ePsDKhEgIlUU5m0Syo0it8X6rean5oSrzb73E=;
        b=8GlwUHxvhXnc/6HAMy9PU1cnuxpPNNL+zFpb5zEXU5FSN5XYpSeu0kVwtaAVWO8V4P
         vsxbRj3LZOtO02v2Q677tMD/xCpCGMD2U7nnwpR92R8k4sM/Z9HCwcegME8Oh2V0Zugm
         2PUI4oJEhYI69Y9Qq8kY8hc/11Ma2TL1Ehtv+bg1QQQk8S6hk6hGp/Qg+ztXDZ4MVD4m
         7KApRaKa2GcuZdEgmaoWeJiuTkS/u+gvErCBwD9pQlaP3TNxzB+SlTAPCX5BdLu8y9yX
         z12O2c8kf/0LTHj2Oo1hC5FTMdnKRlBcAtUkyUX9oSC6G9nRb5XVIXcfXGpm1YNRCjJ9
         4hIQ==
X-Gm-Message-State: AO0yUKVl8w3vkL75HSygwOeJPm0P18sCFa4UBufT0K6jjS9+1QpzhWNL
	TqQuN3vF/DJBrYHZXYbEuMHCoBYzhE2hK7sTFgc=
X-Google-Smtp-Source: AK7set+z8uYhKvn2trBTZHFaSFsTPKYfwQiKWK/f+lSI7Ys5OQEyPdZF2IKqnsT/hcOVyXjzJRcucryrW9plIeUCDIs=
X-Received: by 2002:a63:7f1a:0:b0:4d9:8f44:e1d7 with SMTP id
 a26-20020a637f1a000000b004d98f44e1d7mr7493710pgd.4.1678348498939; Wed, 08 Mar
 2023 23:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20230308064734.512457-1-suagrfillet@gmail.com> <20230308113510.fb6y2xhylavkrgtl@bogus>
In-Reply-To: <20230308113510.fb6y2xhylavkrgtl@bogus>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 9 Mar 2023 07:54:45 +0000
Message-ID: <CAAYs2=jFe_ejN9O26AMCZqDtnVkt1bpyMUw2nx1Q9t=SBWj79A@mail.gmail.com>
Subject: Re: [PATCH] Revert "riscv: Set more data to cacheinfo"
To: Sudeep Holla <sudeep.holla@arm.com>, conor.dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	pierre.gondois@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_235501_753493_13DA87CD 
X-CRM114-Status: GOOD (  15.24  )
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

SGksIENvbm9yICYgU3VkZWVwIDoKClN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+
IOS6jjIwMjPlubQz5pyIOOaXpeWRqOS4iSAxMTozNeWGmemBk++8mgo+Cj4gT24gV2VkLCBNYXIg
MDgsIDIwMjMgYXQgMDI6NDc6MzRQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPiA+IFRoaXMg
cmV2ZXJ0cyBjb21taXQgYmFmN2NiZDk0YjU2ODhmMTY3NDQzYTJjYzNkY2VhMzMwMDEzMjA5OS4K
PiA+Cj4gPiBUaGVyZSBhcmUgc29tZSBkdXBsaWNhdGUgY2FjaGUgYXR0cmlidXRlcyBwb3B1bGF0
aW9ucyBleGVjdXRlZAo+ID4gaW4gYm90aCBjaV9sZWFmX2luaXQoKSBhbmQgbGF0ZXIgY2FjaGVf
c2V0dXBfcHJvcGVydGllcygpLgo+ID4KPiA+IFJldmVydCB0aGUgY29tbWl0IGJhZjdjYmQ5NGI1
NiAoInJpc2N2OiBTZXQgbW9yZSBkYXRhIHRvIGNhY2hlaW5mbyIpCj4gPiB0byBzZXR1cCBvbmx5
IHRoZSBsZXZlbCBhbmQgdHlwZSBhdHRyaWJ1dGVzIGF0IHRoaXMgZWFybHkgcGxhY2UuCj4gPgo+
Cj4gSSBoYWQgbm90aWNlZCB0aGUgc2FtZSBhbmQgaGFkIHNvbWV0aGluZyBzaW1pbGFyIHdoZW4g
d2UgZGlkIHNvbWUgcmV3b3JrCj4gYXJvdW5kIGZvciB2Ni4xIG1lcmdlIHdpbmRvdy4gQnV0IHRo
ZXJlIHdlcmUgbG90IG9mIG90aGVyIGlzc3VlcyB0byBiZQo+IGFkZHJlc3NlZCBhdCB0aGUgbW9t
ZW50IGFuZCBoZW5jZSBkZWZlcnJlZCB0aGlzLgo+Cj4gU28gZm9yIHRoZSBjaGFuZ2UgaW4gZ2Vu
ZXJhbCwgYnV0IGFzIENvbm9yIHJlc3BvbmRlZCwgaXQgd291bGQgYmUgZ29vZAo+IHRvIGRvIHNv
bWUgY2hlY2tpbmcgdG8gZW5zdXJlIG5vdGhpbmcgYnJlYWtzIGFuZCBhbGwgdGhlIHJlcXVpcmVt
ZW50cwo+IHRoaXMgcGF0Y2goYmFmN2NiZDk0YjU2KSBhZGRyZXNzZWQgYXJlIGFscmVhZHkgaGFu
ZGxlZCBpbiB0aGUgY29yZS4KCkFzIHlvdSBzdWdnZXN0ZWQsIGNvbW1pdCAoZGEyOWRiY2RhNDlk
ICJyaXNjdjogQWRkIGNhY2hlIGluZm9ybWF0aW9uCmluIEFVWCB2ZWN0b3IiKQppbiB0aGUgIkdl
dCBjYWNoZSBpbmZvcm1hdGlvbiBmcm9tIHVzZXJsYW5kIiBzZXJpZXMgc2hvdWxkIGJlIGNoZWNr
ZWQuCgpUaGUgY29tbWl0IGRhMjlkYmNkYTQ5ZCBhZGRzIHRoZSBjYWNoZWluZm8gKHJlYWQgZnJv
bQpjaV9jYWNoZWluZm8oY3B1KSkgaW4gRUxGIGF1eGlsaWFyeSB2ZWN0b3JzLApzbyBwcm9jZXNz
IGNhbiBmZXRjaCB0aGUgY2FjaGVpbmZvIHRocm91Z2ggZ2xpYmMgc3lzY29uZigpIGFmdGVyIEVM
RiBsb2FkaW5nLgpBdCB0aGUgc2FtZSB0aW1lLCB0aGUgZ2xpYmMgcmVsYXRlZCBzdXBwb3J0IHdh
cyBlbmFibGVkIGJ5IGl0cyBjb21taXQKKDE1YjM4ZmZjMTAgInJpc2N2OiBHZXQgY2FjaGUgaW5m
b3JtYXRpb24gdGhyb3VnaCBzeXNjb25mIikKCldpdGggdGhpcyByZXZlcnRpbmcgcGF0Y2ggYXBw
bGllZCwgdGhlIG91dHB1dCBvZiBgZ2V0Y29uZiAtYWAgbG9va3MgZ29vZAppbiBRZW11IHNpZml2
ZV91IG1hY2hpbmUgYW5kIHJvb3RmcyBpbWFnZSB3aXRoIGdsaWJjLTIuMzUuCgpgYGAKTEVWRUwx
X0lDQUNIRV9TSVpFIDMyNzY4CkxFVkVMMV9JQ0FDSEVfQVNTT0MgOApMRVZFTDFfSUNBQ0hFX0xJ
TkVTSVpFIDY0CkxFVkVMMV9EQ0FDSEVfU0laRSAzMjc2OApMRVZFTDFfRENBQ0hFX0FTU09DIDgK
TEVWRUwxX0RDQUNIRV9MSU5FU0laRSA2NApMRVZFTDJfQ0FDSEVfU0laRSAyMDk3MTUyCkxFVkVM
Ml9DQUNIRV9BU1NPQyAzMgpMRVZFTDJfQ0FDSEVfTElORVNJWkUgNjQKYGBgCgo+Cj4gQWNrZWQt
Ynk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+Cj4KPiAtLQo+IFJlZ2FyZHMs
Cj4gU3VkZWVwCgoKCi0tIApUaGFua3MsClNvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
