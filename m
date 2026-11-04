Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5F2606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VOLeGPgX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxLDHmvx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V8m1kNxJwQ07IbXrs4+LfvKe4DapMQ6QwPDzl4gTNIs=; b=VOLeGPgXvqTKJKvvu9WL1h7ljp
	ZSNIlSpcrZaJ9xImj6iKt/5K3tsSLKNme9X9gpiAMJkysRXxid6rdxDuvEiwFO6sgrDU4NEFVa8m4
	i7wcgTQMXdMuzExq+qYlHtDDbltmB/f5KSbZjChV9E8bfyHSrWbsE7xeYPdEW6TAM+RWWU//97pUC
	/4xEvHySd0l6kxOJJ6nFM61zZIDPBJQ5r5JKGy0hN2Gt+O1uKfL8wtT2O6dwSAbUYQc3xH85c88k5
	ZCFnpbFkvO8tGNC30WBwbS0JLDx98f8l7mLpA4D6b4ENALTYKU+gFynyLbLIx755988FGRanynqvA
	XSOTZXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfjL-00000006Oh8-1s3J;
	Wed, 04 Nov 2026 18:29:03 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfjI-00000006Ofg-3h1J
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 18:29:02 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-67c02c106e6so237267d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 10:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793816939; cv=none;
        d=google.com; s=arc-20260327;
        b=P9DHi3wlKWZhE+YxTteWL9BGa1ZaT9ylcHJjYxY5O4qn7geC50/Yk7Uhrclc6Q85Yq
         PVaZmEvZoxEaDHLjTVd5Rb+OjfPaBOpuyZ30Vj08l0mkxnvPVIByJDT08f9913+ZWClQ
         cv6iHTzn4WejTdWwsSD+biiLm30QMu8AYpDpx9/Xp/co+CBDb9QiogaMM38AxKd/wIFp
         Hy0+30cmEDrnHaJPVQ0I+96ZdMkGIODx8CMNpNJPAq5DuV3BNxxbwscdR6JMglMrs4s9
         gwPhZNj6DiNPt9BabIFiNDgAQNoS5lW+Po3ae3g9Bfi+vdHRiX3CDDfEbu7NWj6nNSeh
         zRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        fh=yZ8IJ1zHU9o/9UiCPKa5mI22K71YKJ4MVtxTjmifrZw=;
        b=Z3EdA0ty53BzxDhVZYTnRrR6mBpH3k8rlSTkIRnRMeBiiZdv5eUYlUmwmyJ1vTDdbC
         hlvsekdIlKs7i7q9sLE396GuPjWkZ3H9789r/io78tNiBARnNn+7LKFqyJQKadqnRQ7O
         hsX8dnIiwswKgquRNpbV+1ay5Sm7ujOlF3yjoWMOO/w5xjZaWLfrjPccnvLv3MT9B/wO
         aUAujik5KvpVjACRpn3zZWlAWKKhN0P6SC1xJyELKWxhXlDNyKgbLm1ubL+378DucqoT
         xeg2AZvppoCBUYWbNwwgkBPvfp18adcrO//qnmFRiBYqyZiZFu5AoUSf3LczY11iB4g0
         ySeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816939; x=1794421739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=dxLDHmvxITDTQ8Y0/pblW0mtMvthwZhmF8wO6sIIH6eu5DgdNRLwon93bBKABYt7L3
         dMte5Vnu4RkbidF0poNmloCf8+C32uAe3k7Aby+WMHhWNAumooMcelkaKkN8F634B1YJ
         Iuu/YD3LZooMkHEtibhOUIfdnWaNFfMlaOakoxUkvoxRbgdLePJt/Z2lEmKxnzq6N06+
         Q58M+uraPT4ZTM2nka5zTMFz/dwbzH1J3fT+H7+yjGA6XLEi1H/R4Dkt81qS/H5JcGjI
         v6m+zWIrAGydShZmlTKkMmZwysK5DnlqMtqaSRgYxHaQMzD7BLrL+Mgj7MahRvvTO8j8
         mSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816939; x=1794421739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=IRwPPJUecoljvfgmV+kecf3xmIKnvr+JLrKzDcfVqcd7Bq6vKX5PCMIGhzbqw03NLO
         1Q30la3Dy5hzmRg6J72W6YxJBoSiDdCRdVN6QrC/P0vfFX15qdXBokuMv5aH3o+ophc3
         NsFjpy9B3BV6C+83O2NA3Qc00lkjJD3xhoqB0Lmh7GDQ/aU0FnzVL98WbO6KE9L7fpfL
         UBW9QCtdQo9TflY676vBkxB6YU2TlIsE7uPW+csqBR9RMtEgqESSgIYEskV/mRAyGLY5
         uSJH5/tZyBs9Wr5cM2nbcq+Py1RoMTP39V44b6kb8CZFQ+PauTf5TBV603/2UOBI/53b
         5oPg==
X-Forwarded-Encrypted: i=1; AKwUvBzS3ZhKzFvJpJzKW1TlKKswiNpAu/XRf7C8qGLZ0ncNVsY6X14vSvr4fTyEdtBups9k+QE4l65Hz9ouvw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8OMD6V/aItVEvUhKY7nUgLXWdrgjzSRA3ooH2AnfxwXzcKH+Hz
	qA7NE1X8vZnDfJiGhXMQQT0XVqcP8pEI9hNsO7I+LGOdL5KxoK/miFGnL+KXCYGrJbCJKz3UZhF
	k1DDrbuPtsYGXZGAQP+yuzXwlV31nzH0=
X-Gm-Gg: AYBFou1XfIRdjWnyIzZlg9Z1RkIMGv1VhFtaIfJPsIyegaUWOub5P/J1GQ/y5laW5B1
	KaGwNgykJl9icyDImrWI6fZ2Lx5cWB8z7sASrMBO8WwywR3AwH8vD3L/YZ/vcDIAGxQg5ulmBzd
	YSFYfbSMrlrxdiJtzxS4BCdjOVn1JT70nMdfCNXRqvQZ9Jj6vdRQi0rmkZRtXheT/ZwFYy8IXnC
	xLsCBzynPIIocxYvDPcvLx0qOBdsJJon+Tx9ywdWXKTlnb4ryVe2qYS911g9oJXmrFNkAMmI6s1
	cCzt68Wp/nRM1sjeU+pmQPLvADCGjXmf+os5LyNcPvgn8z7GqLTzaxuWALmUIrnMpdED6KJvCvF
	4LtirQjfPbrOlYuyfo3kSrgBryhxrqgjTGEFlCM4eaHMfklPH8cPTJ9ZLTQA=
X-Received: by 2002:a05:690e:1c1c:b0:679:9340:acb6 with SMTP id
 956f58d0204a3-67baff093ddmr11231324d50.98.1793816939248; Wed, 04 Nov 2026
 10:28:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:28:00 +0100
X-Gm-Features: AclHuK8q2ZYeS6p9RTAqL2gmNJFu_7rEVvUOjm2KNLVXYzJFGgWF-O5cRxqiuAQ
Message-ID: <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_102900_937101_3EA8C0CE 
X-CRM114-Status: GOOD (  12.27  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVHJveSwKCkVsIG1hciwgMyBub3YgMjAyNiBhIGxhcyAxMTowMiwgVHJveSBNaXRjaGVsbAoo
PHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPikgZXNjcmliacOzOgo+Cj4gK3N0YXRp
YyBpbnQgc3BhY2VtaXRfdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiBbLi4uXQo+ICsgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiArICAg
ICAgIGlmIChpcnEgPCAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gaXJxOwoKQ29uc2lkZXIg
dXNpbmcgZGV2X2Vycl9wcm9iZSgpIGhlcmUgZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIHJlc3Qg
b2YKdGhlIGZ1bmN0aW9uLgoKPiBbLi4uXQo+ICsgICAgICAgcmF0ZSA9IGNsa19nZXRfcmF0ZShm
dW5jKTsKPiArICAgICAgIGlmIChyYXRlIDwgMzI3NjggfHwgcmF0ZSA+IFUzMl9NQVgpCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkludmFsaWQg
dGltZXIgcmF0ZTogJWx1XG4iLCByYXRlKTsKCjMyNzY4IGxvb2tzIGxpa2UgYSBtYWdpYyBudW1i
ZXIuIEknZCByZWNvbW1lbmQgeW91IHRvIGFkZCBhIGNvbW1lbnQKYWJvdmUgZXhwbGFpbmluZyB0
aGUgY2xvY2sgcmF0ZSBib3VuZHMuCgo+IFsuLi5dCj4gKyAgICAgICB0aW1lci0+c3luY191cyA9
IERJVl9ST1VORF9VUCgzICogVVNFQ19QRVJfU0VDLCByYXRlKTsKCjMgYWxzbyBsb29rcyBsaW5l
IGEgbWFnaWMgbnVtYmVyIHRoYXQgY291bGQgaGF2ZSBhbiBleHBsYW5hdGlvbi4gSSdkCnN1Z2dl
c3QgeW91IHRvIGFkZCBhIG1hY3JvIHdpdGggYSBwcm9wZXIgbmFtZSB0byBoYXZlIGl0IHByb3Bl
cmx5CmRvY3VtZW50ZWQuCgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzcGFj
ZW1pdF90aW1lcl9tYXRjaFtdID0gewo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1p
dCxrMS10aW1lciIgfSwKPiArICAgICAgIHsgfQo+ICt9OwoKVGhlIGRldmljZSB0cmVlIGJpbmRp
bmdzIHN1cHBvcnQgYm90aCBzcGFjZW1pdCxrMS10aW1lciBhbmQKc3BhY2VtaXQsazMtdGltZXIs
IGJ1dCB0aGUgZHJpdmVyJ3Mgb2ZfbWF0Y2hfdGFibGUgb25seSBsaXN0cyBLMS4gWW91CnNob3Vs
ZCBhZGQgSzMgdG8gdGhlIGxpc3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
