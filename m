Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA614606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 01:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/b2ZsNL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VPELLxa+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=YfmgvzMuaMKjDdR9PYOZPvfX9eUXOt79j2RqrODq1mk=; b=b/b2ZsNLPoIhI3MKsAqPQTcAO+
	E8zEn1VJ0VCcRKr0SKJ+9QjROLvKpmCwXl678+hYBAS7TCFt7GQKfmTNncwOOTu16r2qWb2/MTF+f
	H6NTKCX9Amo2K6IHPxjdK3z6DL1TmtuwtC5DO4NgBAEUrrerEAa238gLJbuqqgjYNq4xyHG3hXyOc
	HU436pSNXQIrCVGvRYa0Gyqoj1T4klQSt3KgIV0a1NfSmHSkszKlx10kkG2CoRyAIkI7hoSOZcW5A
	zOtmSEha0MuklLqzQUkzeUu1Cj6AHXz7rtKgHcpeKlFtbY32+DqIBKIDo405yqWuji6J92779GW4W
	txY0+EHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQb6U-000000027lm-2gNT;
	Tue, 10 Nov 2026 01:56:54 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQb6R-000000027lN-416R
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 01:56:53 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-833e671ee9fso1508887a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 17:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794275807; cv=none;
        d=google.com; s=arc-20260327;
        b=eBRYlrBcJyUJOwj5coogKx+v4AEPAQPWo/99kqlD1pixRxrL6ioj76QK0sbAkTHC7/
         dDeUEmMG3rmnXUOdy930RU34ou2QatxALS5nWDn5nrYaQpqXUELjWv10PdeINY2XamC9
         AIRsd3H+Ueg4xzGNLaW6rMxrsKCj5QpThoWdrC+DNwuMqHWWL+XVzUGFBnXdNTt+jjz0
         b+qKEhKws0175NFwpHT4biYEar6X6MxVHrRKLcbyfIKwzdCgxRjTLswiIYvVjjLGzaD/
         lYWVaL5djJyNoR1IP9Q+gXS4NVa0f8hulzndXnATSlzxfsT50M2P6Xj4VLVK8Ut/BGO3
         KUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
        fh=k2cKY8uUhlYrqTt6FShchDmwrYKP769XGInELv+totc=;
        b=S0OeDlWkSRHFe0k8LLM3fqrHnzSl0VW+A2OWppINoBcbzNgJXL/qna3C29V2LqYIjL
         SXNDo8kCHBz4oRxRCkmSiJHBmTClYJzBFoivBFWg+m3oI4G72Fr6PPmTG6kXR5ARYZKi
         LBK9zAyiLgVbaQ8ehFbIN3nU8J/7UqadUOUYKDt4k4XLTZTL9lx93kwAxtolvUsgX1ve
         PQaPHVRQ5yditNaborW69ZuODkafwnJLDpyoKaTOb11XD5Adn8Y94dGUDXIlF2xEC9+/
         RrlHRjJaMvTzsZEGRHeDCvqlPn+xCEwOWn8e3WpxFcP3BzlnABZDBoM+ASrJeSSrt61q
         CXTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794275807; x=1794880607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
        b=VPELLxa+sCeJCnYwT9KSNHehRuFJAILzjgaVIFDNeSkWEgAf9rXU1T/oyPhT2rzsAf
         XHFJhzNfHxbeXHd51VLDGX5+UTielsTo2sO+9zWe5aR+tR65+rcVIiFkMJIL4oZAwyV9
         7gcFSFq7vVq3RmRlkQ9An7bLAFVX4jS+vw2wZysnciRf1Y9v/jdpemK7reKxzrDplJaf
         fwJKBmv737hNFT5Y7Kgyb60qQZ413+IqPhxd/LCYBdPVaK0hmjztlARvaQFIsYtEz+zN
         HOmrPgiR36EQQ+4RVsjHdontmuIUE5dZoXckc5qJRIrZNvchRceoF9tx/tth4QAZJGph
         QuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275807; x=1794880607;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
        b=y5zpJXA35uwmzoeIiC94qFzgDOCUFYrP2Y6f/K7qfam5jYlHPDzsHv9CX/wsdwfoaE
         nCZih0yN2f/iOXpssp7RAijp7t/vycaDQY+YSR71Mk/U5wW6FzIhRsmaCmEOpDHMtR/J
         djBagCH/0hlApqpmemWCqc0XW8UiDMJ2O2ito8jtsIa6mNB6Xn4ZuZCHdiHDyaP43RGh
         0knEL/EZlYYqUgMGJHYHhNye5gyq7mnpyK5B1ftcs7m0TI+GSmJR+ZOZ2207UrNbGcHy
         jRRi5rMOfvhddkbJbYkTJv8SxJL4eBGTB3CSpQ0XcrZiA93QxR4IVhVsis9Rd9ckll7B
         2g0A==
X-Forwarded-Encrypted: i=1; AL+hErEG51l88Zs8XxnaoMu+gGnxM21smcblOsF/9ra9wiLpaSjeBDQxupEZKyZC5x+5Lu1YDDXxeIG8qJxiFg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+sxCNCZzpsmB8odrz8UNP1SwcgAl5+0E3Bk3zxbuN05wEJk2Bb
	OKhdInKF+5ztPts6ealVMUI8gNr4lD8RzwuNrbUWr4hiraayS43ajHEtrILuHq3jcpBBzRZdSPT
	zT/pIqXA7VoNWiIRPrMkpPVQ55a5bN9jWyqqZSqPlgg==
X-Gm-Gg: AYBFou0gihz7pzO30etuf2xFr8jux+4zQjHh+3sOkwIXlVGnJEgnhIQOp9YdNWP/+UM
	0ODhKVxJSU7IQkXqG0lUiR+7GfZqezzgRtMYNx6u/xGoMhCWps4Ox1de3QoDtXAwFYWEWMfs7XX
	iGJYt/QlHz6MmglrH79CKy3otdL1a9hIalmp1rfHJAxW5pbZGWFrR+S8eDBGZ2r6hEW5wVB6mkF
	zOAkpp+K2kh1Dgie1r+xRedMlQwpv2mQCujOihu7WtEf72vtb2yFPEpSOZlWB1EkerMySNKzLEO
	tTk793Efgjbg3aD6DdM9gCm9mjRes18VhJCn8VgXUFrAG1FJw40JP6HTw6zvdgg85z9q93Ri2pQ
	Tu0Fa0moS4ALqCpAtYjvSlZMjTBPyEwvpXTKcul24O6E=
X-Received: by 2002:a05:6830:914:b0:815:40bf:e777 with SMTP id
 46e09a7af769-860dc76a4f2mr1108016a34.13.1794275806867; Mon, 09 Nov 2026
 17:56:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260623083551.86021-1-cuiyunhui@bytedance.com> <CAEEQ3wkOOLbFrRRyvLtJdwLFfmTOHdacX3zX0b-=vzipwsJcbg@mail.gmail.com>
In-Reply-To: <CAEEQ3wkOOLbFrRRyvLtJdwLFfmTOHdacX3zX0b-=vzipwsJcbg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 10 Nov 2026 09:56:35 +0800
X-Gm-Features: AclHuK_LjJHZQyLvZCezKPUxO2MW3wuz6t45CexphTMhH1tJQIdH8kW5C6PUMKo
Message-ID: <CAEEQ3wmx8+sffLDbWSOCndyTdRL8GB_CXQskkEF5M_3bKYzkZg@mail.gmail.com>
Subject: Re: [PATCH] riscv: uaccess: Add a fast path for small aligned copies
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	cuiyunhui@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_175652_012394_0B3F8216 
X-CRM114-Status: GOOD (  25.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiBXZWQsIEF1ZyA1LCAyMDI2IGF0IDExOjQ44oCvQU0geXVuaHVpIGN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgUGF1bCwKPgo+IE9uIFR1ZSwgSnVuIDIz
LCAyMDI2IGF0IDQ6MzbigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gVGhlIHNjYWxhciB1c2VyIGNvcHkgcm91dGluZSBjdXJyZW50bHkgZW50
ZXJzIHRoZSB3b3JkLWNvcHkgcGF0aCBvbmx5Cj4gPiBmb3IgY29waWVzIG9mIGF0IGxlYXN0IDkg
KiBTWlJFRyAtIDEgYnl0ZXMuIE9uIFJWNjQgdGhpcyBpcyA3MSBieXRlcywKPiA+IHNvIGNvbW1v
biAzMi1ieXRlIGFuZCA2NC1ieXRlIGFsaWduZWQgdXNlci9rZXJuZWwgY29waWVzIGZhbGwgYmFj
ayB0bwo+ID4gYnl0ZS1ieS1ieXRlIGNvcHlpbmcuCj4gPgo+ID4gQWRkIGEgc21hbGwtY29weSB3
b3JkIHBhdGggZm9yIGNvcGllcyBiZWxvdyB0aGF0IHRocmVzaG9sZCB3aGVuIGJvdGgKPiA+IHNv
dXJjZSBhbmQgZGVzdGluYXRpb24gYXJlIFNaUkVHLWFsaWduZWQuIFVuYWxpZ25lZCBhbmQgc3Vi
LXdvcmQgY29waWVzCj4gPiBrZWVwIHVzaW5nIHRoZSBleGlzdGluZyBieXRlLWNvcHkgcGF0aCwg
YW5kIGxhcmdlciBjb3BpZXMga2VlcCB1c2luZyB0aGUKPiA+IGV4aXN0aW5nIGxhcmdlLWNvcHkg
cGF0aHMuCj4gPgo+ID4gVGhpcyBpcyBhIGdlbmVyaWMgdXNlcmNvcHkgaW1wcm92ZW1lbnQuIE9u
ZSBjb21tb24gY2FzZSBpcyBMaW51eCBBSU86Cj4gPiBpb19nZXRldmVudHMoKSBjb3BpZXMgMzIt
Ynl0ZSBzdHJ1Y3QgaW9fZXZlbnQgb2JqZWN0cyB0byB1c2Vyc3BhY2UsIGFuZAo+ID4gaW9fc3Vi
bWl0KCkgY29waWVzIDY0LWJ5dGUgc3RydWN0IGlvY2Igb2JqZWN0cyBmcm9tIHVzZXJzcGFjZS4K
PiA+Cj4gPiBmaW8gbGliYWlvIHJhbmRydyB0aHJlZS1ydW4gYXZlcmFnZXMgaW1wcm92ZWQ6Cj4g
Pgo+ID4gICBiYXNlbGluZTogICByZWFkIDU2MGsgSU9QUywgd3JpdGUgMjQwayBJT1BTLCBzeXMg
NjguNjAlCj4gPiAgIHRoaXMgcGF0Y2g6IHJlYWQgNTkzayBJT1BTLCB3cml0ZSAyNTRrIElPUFMs
IHN5cyA2OS4wMyUKPiA+Cj4gPiBUaGlzIGlzIGFib3V0ICs1LjglIHJlYWQgSU9QUyBhbmQgKzUu
NSUgd3JpdGUgSU9QUy4KPiA+Cj4gPiBsbWJlbmNoIGJ3X3BpcGUgd2l0aCBzbWFsbCBtZXNzYWdl
cyB3YXMgYWxzbyBpbXByb3ZlZDoKPiA+Cj4gPiAgIGJ3X3BpcGUgLW0gPHNpemU+IC1NIDE2bSAt
VyAxIC1OIDUKPiA+Cj4gPiAgIHNpemUgICBiYXNlbGluZSBNQi9zICAgdGhpcyBwYXRjaCBNQi9z
ICAgY2hhbmdlCj4gPiAgICAzMiAgICAgICA2Mi41MiAgICAgICAgICAgIDc0LjU0ICAgICAgICAg
KzE5LjIlCj4gPiAgICA2NCAgICAgIDEyMi41NyAgICAgICAgICAgMTU1LjMxICAgICAgICAgKzI2
LjclCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+CgpKdXN0IGEgZ2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4gQW55IGNvbW1lbnRzPwoK
VGhhbmtzLApZdW5odWkKCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgfCAx
OSArKysrKysrKysrKysrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL3Vh
Y2Nlc3MuUyBiL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+ID4gaW5kZXggNGVmZWExYjMzMjZj
OC4uMmQ3ODAwN2YxMGQwMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3Mu
Uwo+ID4gKysrIGIvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4gPiBAQCAtNzAsMTIgKzcwLDI3
IEBAIFNZTV9GVU5DX1NUQVJUKGZhbGxiYWNrX3NjYWxhcl91c2VyY29weV9zdW1fZW5hYmxlZCkK
PiA+ICAgICAgICAgYWRkICAgICB0MCwgYTAsIGEyCj4gPgo+ID4gICAgICAgICAvKgo+ID4gLSAg
ICAgICAgKiBVc2UgYnl0ZSBjb3B5IG9ubHkgaWYgdG9vIHNtYWxsLgo+ID4gLSAgICAgICAgKiBT
WlJFRyBob2xkcyA0IGZvciBSVjMyIGFuZCA4IGZvciBSVjY0Cj4gPiArICAgICAgICAqIEZvciBz
bWFsbCBjb3BpZXMgYmVsb3cgdGhlIGxhcmdlLWNvcHkgdGhyZXNob2xkLCB1c2Ugd29yZC1jb3B5
IGlmCj4gPiArICAgICAgICAqIGJvdGggc3JjIGFuZCBkc3QgYXJlIG5hdHVyYWxseSBhbGlnbmVk
LiBVbmFsaWduZWQgb3Igc3ViLXdvcmQgY29waWVzCj4gPiArICAgICAgICAqIGFyZSBsZWZ0IHRv
IHRoZSBieXRlLWNvcHkgdGFpbC4KPiA+ICAgICAgICAgICovCj4gPiAgICAgICAgIGxpICAgICAg
YTMsIDkqU1pSRUctMSAvKiBzaXplIG11c3QgPj0gKHdvcmRfY29weSBzdHJpZGUgKyBTWlJFRy0x
KSAqLwo+ID4gKyAgICAgICBiZ2V1ICAgIGEyLCBhMywgLkxsYXJnZV9jb3B5X3VzZXIKPiA+ICsg
ICAgICAgbGkgICAgICBhMywgU1pSRUcKPiA+ICAgICAgICAgYmx0dSAgICBhMiwgYTMsIC5MYnl0
ZV9jb3B5X3RhaWwKPiA+ICsgICAgICAgb3IgICAgICBhMywgYTAsIGExCj4gPiArICAgICAgIGFu
ZGkgICAgYTMsIGEzLCBTWlJFRy0xCj4gPiArICAgICAgIGJuZXogICAgYTMsIC5MYnl0ZV9jb3B5
X3RhaWwKPiA+ICsgICAgICAgYW5kaSAgICB0MSwgdDAsIH4oU1pSRUctMSkKPiA+ICs1Ogo+ID4g
KyAgICAgICBmaXh1cCBSRUdfTCAgIGE1LCAwKGExKSwgMTBmCj4gPiArICAgICAgIGFkZGkgICAg
YTEsIGExLCBTWlJFRwo+ID4gKyAgICAgICBmaXh1cCBSRUdfUyAgIGE1LCAwKGEwKSwgMTBmCj4g
PiArICAgICAgIGFkZGkgICAgYTAsIGEwLCBTWlJFRwo+ID4gKyAgICAgICBibHR1ICAgIGEwLCB0
MSwgNWIKPiA+ICsgICAgICAgaiAgICAgICAuTGJ5dGVfY29weV90YWlsCj4gPgo+ID4gKy5MbGFy
Z2VfY29weV91c2VyOgo+ID4gICAgICAgICAvKgo+ID4gICAgICAgICAgKiBDb3B5IGZpcnN0IGJ5
dGVzIHVudGlsIGRzdCBpcyBhbGlnbmVkIHRvIHdvcmQgYm91bmRhcnkuCj4gPiAgICAgICAgICAq
IGEwIC0gc3RhcnQgb2YgZHN0Cj4gPiAtLQo+ID4gMi4zOS41Cj4gPgo+Cj4gQ291bGQgeW91IHBs
ZWFzZSBoZWxwIGNvbmZpcm0gd2hldGhlciB0aGlzIHBhdGNoIGNhbiBiZSBtZXJnZWQ/Cj4KPiBU
aGFua3PvvIwKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
