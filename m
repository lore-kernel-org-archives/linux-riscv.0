Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05120606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C931g0p1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bOlSUyoj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oA9Chth9Yv4lyrBBqnkzRQAXgM4kjTSWPlYR20VOokQ=; b=C931g0p15flQmzAUMEuKWaOpSu
	g10cgfI3zzRqt1MCbJqODR4hwI6ICQcWWPk5STRUXbpvz7/j7Wh4TxgzAZmS8uZ7niw6RFS/nETJY
	kwlXRUSaBa5y4LD4ZdTfMoQLgM7WwU9wcSCRagfPKQe8tnY/BcU4fk0D2p1tXlxKNnSkMh3gThD47
	wALvhII5yAdIHfoApsOUXCZOWrGVq4qn+Q181Bit/GUMWqdmT9O9bZsOKyYligk7rUQ2tJdIKRR1c
	iqUE9uhLW+2Ca+CXnjj2EmsYSraajPBZ8qnzsj0KrEHg2x5QBompMn4ItPFp9i5B+zuaO5vSgUZ0Z
	YqDaW82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGK8-0000000GWcG-482A;
	Fri, 23 Oct 2026 14:32:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGK5-0000000GWbZ-2pqk
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 14:32:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so797673f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 07:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765964; cv=none;
        d=google.com; s=arc-20260327;
        b=SxqDf9N8IpSUJ20/aQBkb0okMVO9BTjKKpMG0d0icszlMdIrw2urfsD6KnBLlPbGlY
         klhEHWA5B+bMgwoaPzgkA1kQFfqttPX/U1BLXCmfYOypZfhOu+qCSpS1ebR8UH2svB3R
         sfAh8pj/ogLjtFzmcrPbV4aBmKkzADfyeLO7Qi4oSYLOEYHbjA+AAykx3dvkTX6+pVFA
         xltMvaBjRygAbnb1nTJ44MrJuUDUN0UJgGQ3HfptYX2ilG8PdWRdCgmYbm3mGf5qQxUN
         MwOogkVfDjz7Lzh2dd0MnA+UPiWcHS82a1CjgK29+c5DOHaEMms1/oRT9/b/J70r/deF
         t8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        fh=J7ySgrTz7rjACP5YxrHC/z9sQTnYl37I9CvNDvz6Z2g=;
        b=HJs5Hr2bUCh2nelRtSI7SPfvIjv2iTxoIvZlwFNsBM9eUWPX5RJ7e6mD+026Zfn+oj
         jFv2TdbWzB/5MVDBXW4VKLCybyqJn0EtHm0S2slNOY3L40N5041tDZdGT8dnVVtrDMgw
         /PsfSem3HXA44bH6YRxgmqcyNDIaNtX2HGknh3sITDBizItTdnmvbE1u5wDpsk+W9qfe
         EAjUhLBn0RvRWvaBwHDQehP7NRTcHK/R+VJtPDw/iMrfehCRX0CLxU/Zl5XAUssIpO3B
         4he7sxdckWOo3Pm4tKAhptV9v2jsZn5BdiXRFx3a1tz4JirRamDqQJYU/eyDKkVZfu5n
         nEtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765964; x=1793370764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=bOlSUyojALvxCl/0iTQjIpE+/1P8zWIUF4Ua+d8RmV9w3OICDQ6+CCvTjwsLBGAe9L
         IgjMPNY7bV6Im67Q96NlsxdH5WttEGiB1gz0oL19q048ql8AOxzrr1zrfdOUQJGp0+m3
         rhUxY8PZzMPz/seHLbzJujoDPGSlgKSoreqRTtBNRLk//gqh5ANvGWo+eW0kTIqtgfQW
         gezq0v557KGYg+yGau+NqRO2yLJtmeRyLI9v8tf2hmE3DNOeGxSNUNwAXV8bK6sDyFoR
         U74mMYDdhJNOnej83tQjCy0sW7NhZ3zih0Ay9xuQYpdPsBk9BUtlqqJvwhH4eUCOtX+6
         y0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765964; x=1793370764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=HMooTRfu9BrGuHjtjwATN9wBIVMrc6UGP0M2JBO5erAkCLNX//cCFa0bY/xh1PReUG
         TZ96VQwtrUNmzpYHnLeG5MOYxuMnR+Ay80jxc3ufg/PsfXYo3ncogZBAmkl/HexWTsck
         LdaS11Dk6litM4DH24Ixjt071tj+cEfuNRffAJwB5pysaO7Uwi3B2Vv+iAO70QLnjziO
         xZqN0JTZ/Yp205869zKCOgEBzpNWpthJ/yy56QHjRpe1qKDEqMhoAqs488E/xAxFmSmB
         icybFDAGtqHg116YcuKo3ItciPQiByt0S4tuen6OlQY2CDEngf5/k8AFTuaEnghy1gZq
         HAnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTi0gKt7KG7UUyb/X/0nvzB8SAaNH++QEf53e9mTcuiyqFG7sEN5qxLHcMRJI0pev+OehKRvudjDYHaA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1fnpzghnbHO2/hGtTx8w9TOxEPMf5s9VV+X0LLpUcLL/Y5oi7
	MP6WzyduGcNNdEBrHlTBtkL2E0pv9zwLZsilwX14S75cHVngkQdAYsmXA/FPY/1WZJHIiLVGOe/
	6t5WyahtHhaoCWfyqmDJ2SEiSgv2EKxqASaGfstoreg==
X-Gm-Gg: AYBFou3WM36563mau3UxWAWrRV1XgbnMhAYVglDVg6OAFDZ5wFiuBXlZs59LmPU9TNO
	BECGpw44q1WFCyXEKPvQCHamblKSobXJisVI6IP1zMFzSlKHVjQZGOAha7Txg/BCNefpo+vro7W
	Xe7ePWb0coWVUHQ6z6cWwdB5vE7F44wa0V9pjUWBgFO/GfJMq4JF+U2kADo5k5t/IcwzCD/68N3
	mbhMpDTR8SD867Rgw4KUWm0iAMs10ufPWv57PJd2PnXFxDNBoLL4h5wUfvizQcjvFu4OZHxfiFW
	0qS6XefS9CyllO1h5MOG5xRHkzyDNaW/3oGRSVsFMTssYBtb0JO4YooWSaKjl6qbKpTjfx0j3eR
	YKjhY69F7LGthLX03fF5lTNaErQ9IjBPVPx3y4ni8aZazdrcJIcdTTwNbZ6lfomH+ncRu3EGdbJ
	JIjMhwIaibBIGk70eCfy7i6wMSRrQkt5famcvXASX51LM8EbvTbOJ7b/9o
X-Received: by 2002:a05:6000:98d:b0:48c:7ee3:e07d with SMTP id
 ffacd0b85a97d-48e385bfc42mr3907352f8f.52.1792765963409; Fri, 23 Oct 2026
 07:32:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-4-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-4-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:30 +0530
X-Gm-Features: AclHuK_j5l_mLkVqrJqA4yovkMFdDFBB6LDPnRF9bN2ny94R09y2JYZPHifdEPA
Message-ID: <CAAhSdy3rxvq4X=AFx8ps9dSwKR6Rw6M7m8ra9PEbV42tH9o8Vg@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] dt-bindings: riscv: add Smcsrind and Sscsrind
 ISA extension descriptions
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_073245_779171_7A4C010C 
X-CRM114-Status: GOOD (  15.15  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBBdWcgNywgMjAyNiBhdCAxOjM54oCvUE0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBGcm9tOiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KPgo+IEFkZCB0aGUgU1ttfHNdY3NyaW5kIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24u
Cj4KPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiBMaW5rOiBodHRw
czovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA3MDEtY291bnRlcl9kZWxlZ2F0aW9uLXY4LTQtNzkw
OWY4NjNhNjQ1QG1ldGEuY29tCj4gW3Bqd0BrZXJuZWwub3JnOiB1c2Ugb2ZmaWNpYWwgZXh0ZW5z
aW9uIG5hbWVzIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbl0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMTYgKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCj4gaW5kZXggNWZmYzQwZDU5OWMwLi5jY2ZmMmJlMTIyNGQgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKPiBAQCAtMTgxLDYgKzE4MSwxNCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAg
ICBjaGFuZ2VzIHRvIGludGVycnVwdHMgYXMgZnJvemVuIGF0IGNvbW1pdCBjY2JkZGFiICgiTWVy
Z2UgcHVsbAo+ICAgICAgICAgICAgICByZXF1ZXN0ICM0MiBmcm9tIHJpc2N2L2poYXVzZXItMjAy
My1SQzQiKSBvZiByaXNjdi1haWEuCj4KPiArICAgICAgICAtIGNvbnN0OiBzbWNzcmluZAo+ICsg
ICAgICAgICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNtY3Ny
aW5kIG1hY2hpbmUtbGV2ZWwgZXh0ZW5zaW9uIGV4dGVuZHMgdGhlCj4gKyAgICAgICAgICAgIGlu
ZGlyZWN0IENTUiBhY2Nlc3MgbWVjaGFuaXNtIGRlZmluZWQgYnkgdGhlIFNtYWlhIGV4dGVuc2lv
bi4gVGhpcwo+ICsgICAgICAgICAgICBleHRlbnNpb24gYWxsb3dzIG90aGVyIElTQSBleHRlbnNp
b25zIHRvIHVzZSBpbmRpcmVjdCBDU1IgYWNjZXNzCj4gKyAgICAgICAgICAgIG1lY2hhbmlzbSBp
biBNLW1vZGUgYXMgcmF0aWZpZWQgaW4gdGhlIDIwMjQwMzI2IHZlcnNpb24gb2YgdGhlCj4gKyAg
ICAgICAgICAgIHByaXZpbGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCj4gKwo+ICAgICAgICAgIC0g
Y29uc3Q6IHNtbXBtCj4gICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ICAgICAgICAgICAgICBU
aGUgc3RhbmRhcmQgU21tcG0gZXh0ZW5zaW9uIGZvciBNLW1vZGUgcG9pbnRlciBtYXNraW5nIGFz
Cj4gQEAgLTIyNiw2ICsyMzQsMTQgQEAgcHJvcGVydGllczoKPiAgICAgICAgICAgICAgUHJvZmls
ZXMgVmVyc2lvbiAxLjAsIHdpdGggY29tbWl0IGIxZDgwNjYwNWY4NyAoIlVwZGF0ZWQgdG8KPiAg
ICAgICAgICAgICAgcmF0aWZpZWQgc3RhdGUuIikKPgo+ICsgICAgICAgIC0gY29uc3Q6IHNzY3Ny
aW5kCj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgU3Njc3JpbmQgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZXh0ZW5kcyB0aGUKPiArICAg
ICAgICAgICAgaW5kaXJlY3QgQ1NSIGFjY2VzcyBtZWNoYW5pc20gZGVmaW5lZCBieSB0aGUgU3Nh
aWEgZXh0ZW5zaW9uLiBUaGlzCj4gKyAgICAgICAgICAgIGV4dGVuc2lvbiBhbGxvd3Mgb3RoZXIg
SVNBIGV4dGVuc2lvbnMgdG8gdXNlIGluZGlyZWN0IENTUiBhY2Nlc3MKPiArICAgICAgICAgICAg
bWVjaGFuaXNtIGluIFMtbW9kZSBhcyByYXRpZmllZCBpbiB0aGUgMjAyNDAzMjYgdmVyc2lvbiBv
ZiB0aGUKPiArICAgICAgICAgICAgcHJpdmlsZWdlZCBJU0Egc3BlY2lmaWNhdGlvbi4KPiArCj4g
ICAgICAgICAgLSBjb25zdDogc3NucG0KPiAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gICAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBTc25wbSBleHRlbnNpb24gZm9yIG5leHQtbW9kZSBwb2lu
dGVyIG1hc2tpbmcgYXMKPgo+IC0tCj4gMi41My4wLU1ldGEKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
