Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00905C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Glbs3LnNE/g8eNXF1Y4g6WxDUXV6NsGrVUUYidmV6w=; b=quqxa7nLVW9rPM
	Evn4teI4Rog0TxUlniW4pJaiF5onivaBA0264sB6nzJqIAPOrNq6oBNdXmlF/P0ij8D1B1LYU6A44
	zfu3hN6Nnti4QX+fg3vZQEW7t/xffTU7PKXnx3sEhxhxKNGVJdJOpT759vn8WfUrvfph3tHdoSMRR
	+0AcHnvU3DegEUXFNYfZGl/VGtC7luLjcofc6QSMzSfYovQ2LnPH63OR1QirbB6+Ma0vPaWwKAMrC
	mHtfSdKDjIzJ+uhD2aep2w5JOAElYvl1Wm6klwg7MwbuifgfmO4abPuFWm9NrP9zkkeiJmyA/dUc6
	Qcb3dppBMnl9IPeLvq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrIZ-00000000Nrh-1Gwr;
	Wed, 06 Mar 2024 13:27:07 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrIV-00000000Nqx-0TUM
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:27:05 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5a159bd0cd2so326930eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709731622; x=1710336422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTTBKW3S6AHHJkeUW4yDspV4mq5EkRrqCQYaROMKfSE=;
        b=asjTdIFYpqWpBGFNsA8yCt6GKK4QUlpnzvuz+N61J7G0vAjm8oC6j7uGuacBuHt8aZ
         7KoL6iS8mb5sbkwIaFkhgZRhqgS6zCQ4SHqVsd3cch6EwTH9bZD1ODveR83Xpr7XEOrY
         zq2MlaEW0/h/QaZf45w5KikKIgYlooKK/bolUV70aoelYu1k9MhXsT/HVmse6G8o4VDH
         HYFsisShD8UupTnsiUoweb/ap4J7xJVHJRRp/QDMVYdYiPcnsU6SW0RpqM3gAVyb/bMe
         Asa/Kd4ztGT9Bp5Zm7+NaLGd9R2A0Naf8incWChcjWkuwBKNbIGY9hawu/j4Ti8rD/4o
         eOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731622; x=1710336422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTTBKW3S6AHHJkeUW4yDspV4mq5EkRrqCQYaROMKfSE=;
        b=jpB2a2f73YaXtk4F63BELHPXU3vnqSuUV5MWjFBREnf3swtGp46h7vMFjnNxAmk2vN
         /jtpFWsBZUpPeH5O7jMSLC8iGvRxwOllEMmBzOrf161srSwPwfv6UDiUvSiZdhA0D78g
         B25cmQc3J/s+dBN0ocZ8m0Z//GjDWuAiDFSneQ+xaQvKe5baXIOhRocN2F13OkCEc24K
         ey4AcWIQ/AqJ6fLXl00gNJ/s+QVEpU7nRMiiqnwvfCAeIl57+BP/BuBJzHS1fsBlfbfW
         QHDDSB0mr1smmkRiYLrBUVAza7Nzf2szI2ylcQmTBNXn/WtUTr62Bvx/us4sVUZ0ObN5
         iyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfLK/5R9/5ok+Il89Q4z/4tGZ5+FRTif27s+LOxcdWdnZ9vzfDC1XREbHUkEVJRIlnoVmbvcI+cI9y7BpvbT6dLIPYSnOat+VA8c9on6sc
X-Gm-Message-State: AOJu0YxAxjK0KfeGKo7kgUdmxnfbEHV4p85TsCyvydjRUxdbiXpSMzsb
	SlLl3uPW36p/V41HtLGtrTcvTI5FlqZ/p7jfoPo11Qn+u5ujQuYLmWSSkM6ZHVFHKJOGF7+NwRL
	GrbaqvZIXSj5JsyETbhffI6cWPlByQ7SUYx0oIw==
X-Google-Smtp-Source: AGHT+IHWNAYEUCXy96aSwRX05SXOrysd9FPb6KniNdKBWJshN+yQQ5ObTNFsHu55muUNwwV/8GXLjM+VKV3S+C0C+00=
X-Received: by 2002:a05:6871:4188:b0:221:4140:2f33 with SMTP id
 lc8-20020a056871418800b0022141402f33mr44063oab.8.1709731621937; Wed, 06 Mar
 2024 05:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <26f3e99c-8f57-4779-a679-2085e469d9cd@siemens.com> <CAEEQ3wnDKdhCH4yz+MY+Xks21jLnuFiyx-xxa7CFczokG2shvQ@mail.gmail.com>
 <CAMj1kXFxzFRQz0BUVw27xdOj+xAVtX9jPjwaLHsEOYDUSqXMOw@mail.gmail.com>
In-Reply-To: <CAMj1kXFxzFRQz0BUVw27xdOj+xAVtX9jPjwaLHsEOYDUSqXMOw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 6 Mar 2024 21:26:50 +0800
Message-ID: <CAEEQ3wnvTN5nGWAibjKKdMe4P3j3wPgghKn2HbOF1Xg56G=0kQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] Revert "riscv/efistub: Ensure
 GP-relative addressing is not used"
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, bp@alien8.de, xiao.w.wang@intel.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_052703_209179_B18BE8F2 
X-CRM114-Status: GOOD (  15.60  )
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

SGkgQXJkLAoKT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA5OjEx4oCvUE0gQXJkIEJpZXNoZXV2ZWwg
PGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDYgTWFyIDIwMjQgYXQgMTQ6MDgs
IHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBK
YW4sCj4gPgo+ID4gT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA4OjUy4oCvUE0gSmFuIEtpc3prYSA8
amFuLmtpc3prYUBzaWVtZW5zLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDA2LjAzLjI0IDA5
OjU2LCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYWZiMmE0
ZmI4NDU1NWVmOWU2MTA2MWY2ZWE2M2VkNzA4N2IyOTVkNS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBU
aGlzIGNvbWVzIHdpdGhvdXQgYSByZWFzb24gLSB3aGljaCBpcyBsaWtlbHkgc29tZXRoaW5nIGFy
b3VuZCAid2lsbCBmaXgKPiA+ID4gdGhpcyBwcm9wZXJseSBsYXRlciIuIEJ1dCB0aGVuIHlvdSBy
ZWdyZXNzIGZpcnN0IGFuZCBvbmx5IGZpeAo+ID4gPiBhZnRlcndhcmRzLiBDYW4ndCB0aGF0IGJl
IGRvbmUgdGhlIG90aGVyIHdheSBhcm91bmQ/Cj4gPgo+ID4gU29ycnksIEkgZG9uJ3QgcXVpdGUg
dW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLiBDYW4geW91IGhlbHAgZXhwbGFpbiBpdAo+ID4gbW9y
ZSBjbGVhcmx5PyBEbyB5b3UgbWVhbiAiZGVsZXRlIG1uby1yZWxheCBpbnN0ZWFkIG9mIHJldmVy
dAo+ID4gZGlyZWN0bHk/Igo+ID4KPgo+IFlvdSBzaG91bGQgb3JkZXIgeW91ciBwYXRjaGVzIGlu
IGEgd2F5IHRoYXQgZG9lcyBub3QgY3JlYXRlCj4gaW50ZXJtZWRpYXRlIHN0YXRlcyAoYmV0d2Vl
biAxLTIgb3IgYmV0d2VlbiAyLTMpIHdoZXJlIHRoZSBvcmlnaW5hbAo+IHByb2JsZW0gaXMgYmVp
bmcgcmVjcmVhdGVkLgo+Cj4gU28gaW4gdGhpcyBjYXNlLCB5b3Ugc2hvdWxkCj4gYSkgZml4IHRo
ZSBpc3N1ZQo+IGIpIHJldmVydCB0aGUgZXhpc3RpbmcgcGF0Y2hlcyBpbiAqb3Bwb3NpdGUqIG9y
ZGVyClNpbXBseSwgSSBwbGFuIHRvIHJlbW92ZSAiLW1uby1yZWxheCIgYW5kCiJcfFJfUklTQ1Zf
JChCSVRTKVx8Ul9SSVNDVl9SRUxBWCIgaW4gdGhlIHRoaXJkIHBhdGNoIChmaXggcGF0Y2gpLgoK
Cj4gSG93ZXZlciwgSSBkb24ndCB0aGluayB0aGUgRUZJIHN0dWIgY2FuIHVzZSBHUCAtIHBsZWFz
ZSByZWZlciB0byBteSBvdGhlciByZXBseS4KVGhlIHByb2JsZW0gd2UgZW5jb3VudGVyZWQgaXMg
dGhhdCBnY2MgMTMgd2lsbCBvcHRpbWl6ZSBlZmlzdHViIHVzaW5nIGdwLgoKVGhhbmtzLApZdW5o
dWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
