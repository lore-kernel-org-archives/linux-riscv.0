Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F3606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tm/opez+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHqQsfjQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ez09x75Jua0MLOKYLda39qHxTEekERe3pUBM10ZhM/w=; b=Tm/opez+/hBgExYPSRF0Z4C7fs
	birmeUdGl2hN4NRFvKN80jLvYC5JB2s2CHaDI4sbnM5dvc0lE7623IX045ybS95W5E7dsBZe6BrcF
	WMIxN0M046JnPMnEe3ulW+M3GPD1h25hsQE7l9MttpCqvjgQCiCXANL15CKdkhUSsaspm+vE09K0t
	9yXOfISnypkkHnr+Hhi6UMPfs91Cu2slcts/rjDEfJ2rQsdivOP0iCf724pZZAO8MawV0yBbe5apB
	z/07jsrX1rDDtpesMS5UOzCCBhSaJNlByOuD0hySsy/WAQDlnSOO9wIxn0/eTV/fzi6147b/XdaYR
	AceF2Aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMSP-00000006TwP-3NKJ;
	Tue, 17 Nov 2026 16:54:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMSL-00000006Tvn-2OcR
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 16:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794934491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
	b=QHqQsfjQKtr9LJKCFW64WCyAfWedjSVLliUPZ1Zh85vdoki/F9/VqkoFJU0RMpBOKJ6Xan
	KUhgcxdDMnHbQ+e46iAJ/IHtsM/vGRRIYXcko7FZK0LuRPalWUoNCLyc4Och2BzsMccoGQ
	XAu+qvfJ/z8pVAoHeOunYRii3Kf3UE0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-WkJuEegqPxmiu9A1-bht2w-1; Tue, 17 Nov 2026 11:54:49 -0500
X-MC-Unique: WkJuEegqPxmiu9A1-bht2w-1
X-Mimecast-MFC-AGG-ID: WkJuEegqPxmiu9A1-bht2w_1794934488
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso284105e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 08:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934488; x=1795539288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        b=okeX2/UFK9LVRLXlSAkCqa7RChXltvot1PyDHWqlqGDnEATEW1nG6Kriz+N2nzilYV
         5jC29uoLCAyV7ccML+IDMSYfyF/P5rLUlhMaPWwY70U9CdmvJXc4EjCWun+AZc+l8LkJ
         MlJRIJ7OeQaE87BJTgkhvjui4ln5bpU6amQt5BpIIuirzxx2qLoN6B/Fr0rVrXQpBA4H
         S2KaASQo7sZdRVdH7qp7WC/9Jro7ogtOEkDbkjw8+5yH9xf+SwFzHcqLKK+jXGNCCcoH
         XIfeExUjiZIl7BeoRS5A+RwkGg6jzbglyJdIrsazSxHl6gG3m9tx+A2J6eatZhjrCqpK
         0+ew==
X-Forwarded-Encrypted: i=1; AL+hErHtKYZEioUPh0ToGo65l4qi+J06TEUR5HquNKLRMOY62IDeDs+kkmbG4geINl7epncUFGfMajmmugFShw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8g4R+tyCCtoX8RXnji86KyuZL3P7J0h4TS7QkLBhIk3OUoNaEH
	NLuevKzHJNTO9JlWVWb3SrbDg/rLmwXmFknu9Z4LzZHYxjZI/kdXNydFz4fbG/EqOlP59MXndl8
	EcA0AvEf2wIcrdhRL4G63kZBKGC4Xvv1OK2zpiMFTL2wKqNv7nnHN+jmbo2KtC2WeKh3RPCYphk
	dSvN/6PMkO4mdaKiMJT/pQW51E+Fqwug5ph1yiaCnjZtyS
X-Gm-Gg: AYBFou0hkg2M+XEeqhknaQdYnJnuFeN2Etd5IwbvFaUdGA7itNtA3dvB5MEVJqyGH1r
	1xE7tNsQfHx933chD5j3CaSqj+6vltXg4ogIkkEqbhsnv7gV9TTHfj8H05L7/+g+8nI/hDdBLwZ
	tlPcbEx0TB3RXa2A7SsaaDaqy39pMlZmgnLdF5AahhcwMtAKuvfs1KRH5Pb1EWRMnvrMwh2nm/H
	iLNaRG6Gd2pppPHlA==
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr178231535e9.0.1794934488497;
        Tue, 17 Nov 2026 08:54:48 -0800 (PST)
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id
 5b1f17b1804b1-4bb6a2db52fmr178231035e9.0.1794934488110; Tue, 17 Nov 2026
 08:54:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com> <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 17 Nov 2026 11:54:35 -0500
X-Gm-Features: Aa3M54roB7QDb-4IN47SMi2aVS10SiwVpvGI_zdHUzKl8EZH9k7SzFLp96gzPDI
Message-ID: <CADRr4bc4v4Uaf2_1ZRFJXoru6a=g+PEYgKKK-vEzXgmV6bXqPQ@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] perf tests: keep bp_signal memory accesses visible
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Ingo Molnar <mingo@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JEiSyxdfm2_Ux5GylDSnhF7W_AL0J4Ptfj1I6R902sE_1794934488
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_085453_776883_69A42325 
X-CRM114-Status: GOOD (  22.13  )
X-Spam-Score: -2.8 (--)
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

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCA5OjQw4oCvUE0gSGltYW5zaHUgQ2hhdWhhbgo8aGltYW5z
aHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEluIHRoZSBicmVha3BvaW50
IHNpZ25hbCBoYW5kbGVyIHRlc3QsIGEgYnJlYWtwb2ludCBpcyBzZXQgb24KPiBfX3Rlc3RfZnVu
Y3Rpb24uIEtlZXAgdGhhdCBoZWxwZXIgYXMgYSByZWFsIGNhbGwgdGFyZ2V0IHNvIHRoZSBicmVh
a3BvaW50Cj4gaGFzIGEgc3RhYmxlIGFkZHJlc3MuCj4KPiBUaGUgdGVzdCBhbHNvIHJlbGllcyBv
biB0aGUgd2F0Y2hlZCB2YXJpYWJsZSBiZWluZyBhY2Nlc3NlZCBhcyBkaXN0aW5jdAo+IG1lbW9y
eSBvcGVyYXRpb25zLiBVc2UgUkVBRF9PTkNFKCkgYW5kIFdSSVRFX09OQ0UoKSBmb3IgdGhvc2Ug
YWNjZXNzZXMKPiBpbnN0ZWFkIG9mIG1ha2luZyB0aGUgb2JqZWN0IHZvbGF0aWxlLCBzbyB0aGUg
c291cmNlIG1hcmtzIHRoZSBleGFjdAo+IG9wZXJhdGlvbnMgdGhhdCBtdXN0IGJlIHByZXNlcnZl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1LmNoYXVoYW5A
b3NzLnF1YWxjb21tLmNvbT4KUmV2aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqdGF1YmVwZUByZWRo
YXQuY29tPgoKSSBwZXJzb25hbGx5IHdvdWxkIHNlbmQgdGhpcyBzZXBhcmF0ZWx5IHNvIGl0J3Mg
Y2xlYXIgdGhhdCBpdCBzaG91bGQKYmUgYXBwbGllZCB0byB0aGUgcGVyZiB0cmVlLgpUaGFua3Ms
Ckplc3NlIFRhdWJlCgo+IC0tLQo+ICB0b29scy9wZXJmL3Rlc3RzL2JwX3NpZ25hbC5jIHwgMTQg
KysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3Rlc3RzL2JwX3NpZ25hbC5jIGIv
dG9vbHMvcGVyZi90ZXN0cy9icF9zaWduYWwuYwo+IGluZGV4IGY1ODBiYTc0ODZiMS4uMmU0Zjc3
NDdkMzJmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvdGVzdHMvYnBfc2lnbmFsLmMKPiArKysg
Yi90b29scy9wZXJmL3Rlc3RzL2JwX3NpZ25hbC5jCj4gQEAgLTM2LDE1ICszNiwxNCBAQCBzdGF0
aWMgaW50IGZkMzsKPiAgc3RhdGljIGludCBvdmVyZmxvd3M7Cj4gIHN0YXRpYyBpbnQgb3ZlcmZs
b3dzXzI7Cj4KPiAtc3RhdGljIHZvbGF0aWxlIGxvbmcgdGhlX3ZhcjsKPiAtCj4gK3N0YXRpYyBs
b25nIHRoZV92YXI7Cj4KPiAgLyoKPiAgICogVXNlIEFTTSB0byBlbnN1cmUgd2F0Y2hwb2ludCBh
bmQgYnJlYWtwb2ludCBjYW4gYmUgdHJpZ2dlcmVkCj4gICAqIGF0IG9uZSBpbnN0cnVjdGlvbi4K
PiAgICovCj4gICNpZiBkZWZpbmVkIChfX3g4Nl82NF9fKQo+IC1leHRlcm4gdm9pZCBfX3Rlc3Rf
ZnVuY3Rpb24odm9sYXRpbGUgbG9uZyAqcHRyKTsKPiArZXh0ZXJuIHZvaWQgX190ZXN0X2Z1bmN0
aW9uKGxvbmcgKnB0cik7Cj4gIGFzbSAoCj4gICAgICAgICAiLnB1c2hzZWN0aW9uIC50ZXh0OyIK
PiAgICAgICAgICIuZ2xvYmwgX190ZXN0X2Z1bmN0aW9uXG4iCj4gQEAgLTU0LDE2ICs1MywxOSBA
QCBhc20gKAo+ICAgICAgICAgInJldFxuIgo+ICAgICAgICAgIi5wb3BzZWN0aW9uXG4iKTsKPiAg
I2Vsc2UKPiAtc3RhdGljIHZvaWQgX190ZXN0X2Z1bmN0aW9uKHZvbGF0aWxlIGxvbmcgKnB0cikK
PiArc3RhdGljIG5vaW5saW5lIHZvaWQgX190ZXN0X2Z1bmN0aW9uKGxvbmcgKnB0cikKPiAgewo+
IC0gICAgICAgKnB0ciA9IDB4MTIzNDsKPiArICAgICAgIFdSSVRFX09OQ0UoKnB0ciwgMHgxMjM0
KTsKPiAgfQo+ICAjZW5kaWYKPgo+ICBzdGF0aWMgbm9pbmxpbmUgaW50IHRlc3RfZnVuY3Rpb24o
dm9pZCkKPiAgewo+ICsgICAgICAgbG9uZyB2YWx1ZTsKPiArCj4gICAgICAgICBfX3Rlc3RfZnVu
Y3Rpb24oJnRoZV92YXIpOwo+IC0gICAgICAgdGhlX3ZhcisrOwo+ICsgICAgICAgdmFsdWUgPSBS
RUFEX09OQ0UodGhlX3Zhcik7Cj4gKyAgICAgICBXUklURV9PTkNFKHRoZV92YXIsIHZhbHVlICsg
MSk7Cj4gICAgICAgICByZXR1cm4gdGltZShOVUxMKTsKPiAgfQo+Cj4gLS0KPiAyLjQzLjAKPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
