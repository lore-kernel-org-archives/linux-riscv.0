Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702F606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMsJ6SFq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=NeYfv0tn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0Z7u5d6nuAWdkwW5OzpMsfUi2bZVVzTnl9DV0bN/GWc=; b=oMsJ6SFqDO/NVEat4k7n1UvYzi
	ZZRn+3x3h5WD7XnI0m6M6yyajItNpl9GTpaFE3h3BXph9AhZ8MuUJ5aMSmfaKr5xO3MpUtOpAxJtb
	7OwUvODg/kBF9rZ2WdaZIZuBenbJNJSbn7xhWUniL5Fm4W085C9sD+eJZ7q0WLN/ozAedmffdViLw
	8S/3vOZcwo4X1oKNqfvv89HtfxwcpQYC6nq0M3W20AM20GUj/XAPGLl2zA+h6KwFkn5+VSXPTkgH/
	vgAAtKTjxtkKvCJJpTjfQp+/Pk+sVYuoBM+FTlo3Ekjjbn9w8ZtiRxAc8COWPdtk3SvijfpZ3RNua
	wcHjOrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXNAD-000000016QB-3riT;
	Sat, 28 Nov 2026 18:28:45 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXNAB-000000016Pd-1T1k
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 18:28:45 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-67da69e7c31so10047176d50.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Nov 2026 10:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795890522; cv=none;
        d=google.com; s=arc-20260327;
        b=dXtvG6NeEP4LOtq+8vm0f2nLFgZrvrsIODFcq5YaKqPxUdvlE2SN6/V5E842WZSI0P
         VtNOEmxhFPy/lSMHwb7FuGsEAEbqtpYfSsDTRvVSAvt2ZtTul0kmZ70eKrQfu+Ev2XIO
         UloBhEsU/PT4hgjBWXyYDZWjxl4Lj1DN4G8W3rBGUVNCC0ZAbxMpkpP53JglwEapoF35
         IO/cGkbwhVG8NRMr6/p1Udroao2m4bZEmb2ag5pm1Zp6p63alWzsyktiJB9VyImcl5SQ
         M68O8uEHJ9PsyPLk1njelpswcvv0fEXOMAWLjWrqjc9n+syAcKkbWqyp3Tluxg4XUTy3
         h6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5KDlshZO6k8zli7g0nQDjEZH6UyTaQrsaLykwKCups=;
        fh=hMbTp119WXrUdRSD8SDssk9Ebkw+tzfRcQrZY3+/dhU=;
        b=EY2Y6xl3ifRCmgVZRoYmM9mfJfFPOqRTUZyiawA0WcodbDnQn6zTGtHvjS57JecgZe
         8pIJo/oQ6ssDcaUbz8d/v8fAuc7H5bu4tz7bEshrcAyyLMR9IC/ROUWeK80UHOSze6cQ
         UKrW8tSYJOefQ9yRw8u1/UnnPmkkdQfXeBllkr1DI/CRrpXBF3aIDDHCWgSVm+3DCHTZ
         AdB5TqYwCiTKDfpQa76HwNNp+QYfNDEZeiOX/sPsO6j8f/tyI6MoI5k3ehidzdWoR5Ro
         RJeVQZ2AASbdtiyg4/XOxXUJwQ47tuil5aid/zrGiySyhMxfJQzxJ6V8Ifz7aRjVZ8HG
         iTmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795890522; x=1796495322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5KDlshZO6k8zli7g0nQDjEZH6UyTaQrsaLykwKCups=;
        b=NeYfv0tnYw7hWAwoEf+GJWWsBo4vO5NmkmaA44t3zRQcggVws/7SgzXvubNTexR7+Z
         M3CcGVsIGq3eePerr88Snb1Lj4S3Lw1KggCIvGwKh69DodqhyEmuY+XKE2Gexpu2qTsz
         WpVggC4ZTw6QUHbVPCfdKfk7X0s15tx2olS39lHuhMrhZLm515GhXzoE8pJAfKaKSx/L
         Kbc8TQ+K13Yi0LR6HTq1vtrKQPnhS25ww5B5xLdNySN0Viy3xX6Rb6hI28xf4MiUKW0t
         7tTGMy5x8a1TJKG1oWHGWWGRQQRZRerLkYRxHEDHqUf57tyIVHhJ61IT2ygAwNkVDzCH
         59hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890522; x=1796495322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5KDlshZO6k8zli7g0nQDjEZH6UyTaQrsaLykwKCups=;
        b=l2tWsZL1ddQnHO6n708FSmveY3Si9jRhuYIxLkUK6wrIRpbp2P3QTBKSjWLnDL9123
         A177YD0cPC3vi7vMGXL5AmBM0GcAjA+TmE58C8seDQKQdTaReJT25mfXlcjF5dLbGWIB
         BH4Y7HBhdSlhPx3X/+B3Xp3NB07+Bblipeb097HyS9hQHoqEtNRXPvGcJIaK/mC/jtnn
         iPXjTsOGyVGJjUMKJFNWeOJbKfSUidtBY7m0ql/0MkCF45oOSqy18iqtKtMKacDHJgri
         A9xj/AG3TLCNUpJCCLb+YymMTeuSn6sAQ6YI+or/Ex8EWPIl+Y8GosjW9V7OD48M0QYF
         8URg==
X-Forwarded-Encrypted: i=1; AL+hErE/WXQoqXXPGQa3zmvN2kbwYxf+njaXRwSKv8XRHPMeLLHimXYU/Z6tFOVJ3FXg/rDRaPT35zipMu5yAQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z86TTthCBdKXsxJ6wDuwfawrID3wGiNdnne6DYiupZEgyOOBqdf
	Hf7PLodun5/IS0WA4V1gxM55gnmZtvBFcPxrZbcPgvwJFj2L1U17Ge+fxBWCfmaFfHknQE2mF8D
	9skrw5KUzuIXIuAx3AIXEDBRHC3RQuISG+Hrb7e2mQw==
X-Gm-Gg: AZFdTZfWQvp0Yx9HkGTGU7ob/qOWUK9QqTtPjyAf+GGttOfLpX2VN0qCvSy5Ur8WWZF
	FfJJ9aksYg4/1layZZh5QyZCkofShqwKP+m6/dSZcSA5JUq7wd+zpH9TqHh3HpBpiGIsuUU74Y1
	8QAP/ff9tLRXsdwWSxmPWV29W9InOgT33HN0mgGI0zBz+neYZljZcGlTe3gVfAho2n5FAsGZcSe
	/9y++URhGRnU9BBbdwiNYw0F08dBmQelXvOo15Ba3RvBnobaUzo3cKrq7a1OZ0YaWAUn/r6UBXY
	SKIBimvWUD5OBToJZ8fVJowvcDin7YKu9wjx3IpBMfMfLEKayKvTTnqKdr/3cWiJOt6+yKA70y6
	LjvSfzEBF9WiHGX4hEeJQ56opAPQEU/idlO9g9Vw0GcQWF9p92XAydDsr18B7/S7SPj87wkZ085
	g511ijo8RScNmLVHPX9YgyqwxNaw==
X-Received: by 2002:a05:690e:4891:10b0:67d:be3c:9582 with SMTP id
 956f58d0204a3-67df449824cmr9371427d50.74.1795890522147; Sat, 28 Nov 2026
 10:28:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261127132958.2714501-1-lee@kernel.org>
In-Reply-To: <20261127132958.2714501-1-lee@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 28 Nov 2026 12:28:31 -0600
X-Gm-Features: Aa3M54oQdM03MJf4PgL0Ruo6EP2JNZQRLh_LJ7oypx9cVxd1wyP_7u-WnMa9NlU
Message-ID: <CAEev2e9aYuRtYg=W=+PNi+bfhxUv8JHn=yJBzgZTDdT8Cy3STg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: tenstorrent: Use prepare/unprepare ops for
 Atlantis PLL
To: Lee Jones <lee@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_102843_395379_E0088AB5 
X-CRM114-Status: GOOD (  14.04  )
X-Spam-Score: -2.0 (--)
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

SGkgTGVlLAoKT24gRnJpLCBOb3YgMjcsIDIwMjYgYXQgNzozMOKAr0FNIExlZSBKb25lcyA8bGVl
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIENvbW1vbiBDbG9jayBGcmFtZXdvcmsgaW52b2tl
cyAuZW5hYmxlIGNhbGxiYWNrcyBpbiBhdG9taWMgY29udGV4dAo+IHdpdGggaW50ZXJydXB0cyBk
aXNhYmxlZCBhbmQgZW5hYmxlX2xvY2sgaGVsZC4gIEluIGF0bGFudGlzX2Nsa19wbGxfb3BzLAo+
IGF0bGFudGlzX2Nsa19wbGxfZW5hYmxlKCkgaXMgcmVnaXN0ZXJlZCBhcyB0aGUgLmVuYWJsZSBj
YWxsYmFjayB5ZXQKPiB3YWl0cyBmb3IgUExMIGxvY2sgdXNpbmcgcmVnbWFwX3JlYWRfcG9sbF90
aW1lb3V0KCkgd2l0aCBhIDUwMCB1cyBzbGVlcAo+IGludGVydmFsLCB0cmlnZ2VyaW5nIGEgc2xl
ZXAtaW4tYXRvbWljIGJ1ZyB2aWEgdXNsZWVwX3JhbmdlKCkuCj4KPiBDb252ZXJ0IGF0bGFudGlz
X2Nsa19wbGxfb3BzIHRvIHVzZSAucHJlcGFyZSwgLnVucHJlcGFyZSwgYW5kCj4gLmlzX3ByZXBh
cmVkIGluc3RlYWQgb2YgLmVuYWJsZSwgLmRpc2FibGUsIGFuZCAuaXNfZW5hYmxlZCBzbyB0aGF0
IHRoZQo+IFBMTCBsb2NrIHdhaXQgZXhlY3V0ZXMgdW5kZXIgdGhlIHNsZWVwaW5nIHByZXBhcmVf
bG9jayByYXRoZXIgdGhhbgo+IGF0b21pYyBlbmFibGVfbG9jay4KPgo+IEZpeGVzOiAyM2M4ZWJj
OTUyODQgKCJjbGs6IHRlbnN0b3JyZW50OiBBZGQgQXRsYW50aXMgY2xvY2sgY29udHJvbGxlciBk
cml2ZXIiKQo+IENsb3NlczogaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC05ODAzOTVh
Ni1mMjgyLTQ3OGEtYmYxOC1iNTY5NWE3MjU3MzUKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+Cj4gLS0tCj4gdjEg
PT4gdjI6Cj4gIC0gU3dpdGNoIGZyb20gLmVuYWJsZS8uZGlzYWJsZS8uaXNfZW5hYmxlZCB0byAu
cHJlcGFyZS8udW5wcmVwYXJlLy5pc19wcmVwYXJlZCBzbyBQTEwgbG9jayBwb2xsaW5nIHJ1bnMg
dW5kZXIgdGhlIHNsZWVwaW5nIHByZXBhcmVfbG9jayBpbnN0ZWFkIG9mIGVuYWJsZV9sb2NrLCBw
ZXIgQnJpYW4gTWFzbmV5J3MgcmV2aWV3Lgo+ICAtIEtlZXAgcmVnbWFwX3JlYWRfcG9sbF90aW1l
b3V0KCkgcmF0aGVyIHRoYW4gc3dpdGNoaW5nIHRvIHRoZSBhdG9taWMgdmFyaWFudC4KPiAgLSBE
cm9wIEFuaXJ1ZGggU3Jpbml2YXNhbidzIHYxIFJldmlld2VkLWJ5IHRhZyBkdWUgdG8gdGhlIGlt
cGxlbWVudGF0aW9uIGNoYW5nZS4KPiAgLSBEcm9wIHRoZSBvdGhlciBwYXRjaGVzIGZyb20gdjEg
dGhhdCB3ZXJlIGFscmVhZHkgYXBwbGllZCBvciBzdXBlcnNlZGVkLgo+Cj4gIGRyaXZlcnMvY2xr
L3RlbnN0b3JyZW50L2F0bGFudGlzLXByY20uYyB8IDEyICsrKysrKy0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKVGhpcyBwYXRjaCBmaXhl
cyB0aGUgZm9sbG93IGVycm9yIHJlcG9ydGVkIGJ5IGVuYWJsaW5nCkNPTkZJR19ERUJVR19BVE9N
SUNfU0xFRVAuCgpbICAgIDAuMjk1OTYwXSBCVUc6IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBm
cm9tIGludmFsaWQgY29udGV4dCBhdApkcml2ZXJzL2Nsay90ZW5zdG9ycmVudC9hdGxhbnRpcy1w
cmNtLmM6MzI5ClsgICAgMC4yOTYwNTZdIGluX2F0b21pYygpOiAxLCBpcnFzX2Rpc2FibGVkKCk6
IDEsIG5vbl9ibG9jazogMCwgcGlkOgoxLCBuYW1lOiBzd2FwcGVyLzAKWyAgICAwLjI5NjA4OV0g
cHJlZW1wdF9jb3VudDogMSwgZXhwZWN0ZWQ6IDAKWyAgICAwLjI5NjQ4NF0gQ1BVOiAwIFVJRDog
MCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkCjcuMi4wLTAwMDcxLWc5YTA1MThk
NGQ3MGQgIzIgUFJFRU1QVExBWlkKWyAgICAwLjI5NjY1MV0gSGFyZHdhcmUgbmFtZTogVGVuc3Rv
cnJlbnQgQXRsYW50aXMgUklTQy1WIE1hY2hpbmUgKERUKQoKUmV2aWV3ZWQtYnk6IEFuaXJ1ZGgg
U3Jpbml2YXNhbiA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
