Return-Path: <SRS0=yqZG=DL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2686BC4363C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 22:05:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE97206DD
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 22:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sk2FyEC7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="toLrE7tM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE97206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LlT518Q+DBRBwuyEiALReA5GKCYIq8GwXzh8zvFeokI=; b=sk2FyEC7Bef5YmC/sR7FiNdSv
	NAkghEZIntCWBfaVnAW14L4ZjnD0RFZIBqz0wEuY38fEyMLnoZsZo8rcefi8UfWiALF9kfYOZUtWF
	t2S1lBx6G8QmKXQsDsJGHQAID5mUONaAnhAauB2YXkXKHQzqXD4vgXJg85G3LNgJEHARRC/08R29X
	xsUv9fX9vZi8uwNPJOnG2izgrWYMKnUGrddkJZopmq++51Ozm8Cr8ZFV18rAj1nCZaAKNUHwebOl7
	skFk2zbICbHSs1PJPBPhz4cUiPbqcR4q2C+ip3VxZ5YYq4n4OT9gJLXANig9bN8Y61DjLCPAjY74w
	/YyQoE+sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPC89-0003e8-J5; Sun, 04 Oct 2020 22:05:21 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPC87-0003dI-8c
 for linux-riscv@lists.infradead.org; Sun, 04 Oct 2020 22:05:20 +0000
Received: by mail-pf1-x444.google.com with SMTP id a200so472618pfa.10
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=togLxEJv9rgoT2+f7/C3sCaigxFzV/7IORCr2allek8=;
 b=toLrE7tMLOAn+F3vN6MtRBZfQf2ECnlgVH2SePhj3VuKlw2mUh50WMONvUhR3Kbz2l
 ote01RqoFiqaef4v/aFTGlJAztjiPPHWSMFfT5tXaoys3Zn1o4HODnh9JdsFQdE3tyBP
 dJB2RkF06r44e5XVa0ZzeGEEXyk77XNTckz4v5Lz7ES478BSeSTh/nmqNm/PJ0sylfLG
 nPfS1CFSqA51s9RPYaT0uG9ZR3hC9vJi1/65aa0deLdSRc4MdunlO/94ixYeBEelHV1d
 4/8LEO84qzvJ9C3e23MSnP2LvcMPplucvhk1am6tlHg9Ta8bHFca6PbhAWuEo/R3apFP
 vsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=togLxEJv9rgoT2+f7/C3sCaigxFzV/7IORCr2allek8=;
 b=RkUEyW5qCbDhgoYgpld2PVok4WhOZUTL8sQjTvPjpTr6B+/PL3byLl7G2IuNrFl54V
 V0bpU/1sd/FJ0bXWJOIldPKUYys7fWDGcha7mATt3qkqHBzi8hWAmGGjRZh9yYO19nuK
 m57HZ6MXXImGcuHZihY9vdC8mMSElR8GW/LLRsegFgY2Rv6G34Pu2mhX3bnInIvLz/ms
 xpp5aSmoIJ1FvHU8VcAOImJrAJNDrHYzJtTt6tnv6xuHTZ0o4NZcUGBh+X9xpJzTmjVE
 6CfiPJ3tk7OWfH4PQPkTtnsfoI6zvie17XM8Gg76r1NIeW+u0dTmNDVxtN67FoVREMmk
 UXqw==
X-Gm-Message-State: AOAM533yjYNyKyt3ypVMJajD1/sDzfBw/OKddYV4Alk3Nh5OebSF1TTs
 GNorcs6dd71l4eOvt0nHSySjmg==
X-Google-Smtp-Source: ABdhPJwe+g0CsWIua0snBi6JmcX3/vEBTskQ11z/rDiv2ozn9h8ZAdUm4heqXRi1xzSr0TXMdeHT0Q==
X-Received: by 2002:a62:1951:0:b029:152:6669:ac74 with SMTP id
 78-20020a6219510000b02901526669ac74mr3588479pfz.36.1601849114787; 
 Sun, 04 Oct 2020 15:05:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c9sm8367537pgl.92.2020.10.04.15.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 15:05:14 -0700 (PDT)
Date: Sun, 04 Oct 2020 15:05:14 -0700 (PDT)
X-Google-Original-Date: Sun, 04 Oct 2020 15:05:12 PDT (-0700)
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
In-Reply-To: <CAMj1kXEnOh4MBiVVgkhd4P81eRPCVi3+y6JcD58jL45-eh324A@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: ardb@kernel.org
Message-ID: <mhng-bfca22db-02c7-4e71-9b83-00367c9a6bfb@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_180519_340935_8D7C493A 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: lkp@intel.com, smueller@chronox.de, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwNCBPY3QgMjAyMCAxNDoxNjoxMCBQRFQgKC0wNzAwKSwgYXJkYkBrZXJuZWwub3Jn
IHdyb3RlOgo+IE9uIFN1biwgNCBPY3QgMjAyMCBhdCAyMDo0OCwgU3RlcGhhbiBNw7xsbGVyIDxz
bXVlbGxlckBjaHJvbm94LmRlPiB3cm90ZToKPj4KPj4gVGhlIFJJU0MtViBhcmNoaXRlY3R1cmUg
aXMgYWJvdXQgdG8gaW1wbGVtZW50IHRoZSBjYWxsYmFjawo+PiByYW5kb21fZ2V0X2VudHJvcHkg
d2l0aCBhIGZ1bmN0aW9uIHRoYXQgaXMgbm90IGV4cG9ydGVkIHRvIG1vZHVsZXMuCj4KPiBXaHkg
aXMgdGhhdD8gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGV4cG9ydCB0aGUgc3ltYm9sIGluc3Rl
YWQ/CgpJdCdzIHN0YXRpYyBpbmxpbmUgKGluIG91ciB0aW1leC5oKSwgc28gSSB0aG91Z2h0IHdl
IGRpZG4ndCBuZWVkIHRvIGV4cG9ydCB0aGUKc3ltYm9sPyAgRGlkIHRoaXMganVzdCBhcmlzZSBi
ZWNhdXNlIGNsaW50X3RpbWVfdmFsIHdhc24ndCBleHBvcnRlZD8gIFRoYXQgd2FzCmZpeGVkIGJl
Zm9yZSB0aGUgcmFuZG9tX2dldF9lbnRyb3B5KCkgY2hhbmdlIGxhbmRlZCBpbiBMaW51cycgdHJl
ZSwgc28gYXMgZmFyCmFzIEkga25vdyB3ZSBzaG91bGQgYmUgT0sgaGVyZS4KCklmIEkgYnJva2Ug
c29tZXRoaW5nIGhlcmUgaXQgc2VlbSBiZXR0ZXIgdG8gZml4IHRoaXMgaW4gdGhlIFJJU0MtViBw
b3J0IHRoYW4gYnkKanVzdCBiYW5uaW5nIG1vZHVsYXIgY29tcGlsYXRpb24gb2Ygaml0dGVyZW50
cm9weSwgYXMgdGhhdCBzZWVtcyBsaWtlIGEgdXNlZnVsCmZlYXR1cmUgdG8gbWUuCgo+PiBUaHVz
LCB0aGUgSml0dGVyIFJORyBpcyBjaGFuZ2VkIHRvIGJlIG9ubHkgYm91bmQgc3RhdGljYWxseSBp
bnRvIHRoZQo+PiBrZXJuZWwgcmVtb3ZpbmcgdGhlIG9wdGlvbiB0byBjb21waWxlIGl0IGFzIG1v
ZHVsZS4KPj4KPj4gUmVwb3J0ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFk
Lm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogU3RlcGhhbiBNdWVsbGVyIDxzbXVlbGxlckBjaHJvbm94
LmRlPgo+PiAtLS0KPj4gIGNyeXB0by9LY29uZmlnIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jcnlwdG8v
S2NvbmZpZyBiL2NyeXB0by9LY29uZmlnCj4+IGluZGV4IDA5NGVmNTZhYjdiNC4uNWIyMDA4N2Ix
MTdmIDEwMDY0NAo+PiAtLS0gYS9jcnlwdG8vS2NvbmZpZwo+PiArKysgYi9jcnlwdG8vS2NvbmZp
Zwo+PiBAQCAtMTg1Myw3ICsxODUzLDcgQEAgY29uZmlnIENSWVBUT19EUkJHCj4+ICBlbmRpZiAg
IyBpZiBDUllQVE9fRFJCR19NRU5VCj4+Cj4+ICBjb25maWcgQ1JZUFRPX0pJVFRFUkVOVFJPUFkK
Pj4gLSAgICAgICB0cmlzdGF0ZSAiSml0dGVyZW50cm9weSBOb24tRGV0ZXJtaW5pc3RpYyBSYW5k
b20gTnVtYmVyIEdlbmVyYXRvciIKPj4gKyAgICAgICBib29sICJKaXR0ZXJlbnRyb3B5IE5vbi1E
ZXRlcm1pbmlzdGljIFJhbmRvbSBOdW1iZXIgR2VuZXJhdG9yIgo+PiAgICAgICAgIHNlbGVjdCBD
UllQVE9fUk5HCj4+ICAgICAgICAgaGVscAo+PiAgICAgICAgICAgVGhlIEppdHRlcmVudHJvcHkg
Uk5HIGlzIGEgbm9pc2UgdGhhdCBpcyBpbnRlbmRlZAo+PiAtLQo+PiAyLjI2LjIKPj4KPj4KPj4K
Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
