Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE29FC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwecXTw42x3hLwCKT/qeRWw5QSrgXl8Whna+eyp/5KI=; b=mzzLwWtEghTWhW
	yyxCr2Zxm8RrLc+H4uN2KMLvzxAlk0RZMvJFXQHkpnLgM+u/KZHiRAo+sQ8yvUMLLPkpyaKJjJlw6
	SdDzK3R8JKVLRA2DP6W6ZzPuZqcaWdIJhClzOjI7WBrbD+Q0Jcil9MaJnlc5icvc/geo4fWjSCIXd
	asvDhg3dW9qxuKWc9BOIlTK0UxKIQxBRCtb5wtQ9MKJ3NZ/05kaJpjShmQOXh7WDa/fBiZif1f0zo
	uwjCOa++JZYqoJfULpgSisLETNjb/7CVmSXbsiCf7eKxBSrYubEEcbPo38WeTz5/GDA8j33rffCc/
	E3bnOsDcjTuL0swM8eHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8Z2-00000009CMt-1h4a;
	Mon, 04 Mar 2024 13:41:08 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8Yz-00000009CLI-3QCW
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 13:41:07 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-59fdcf8ebbcso3038806eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709559663; x=1710164463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/dHCpgDDmSuBOfKLpH4euKRiDvMD04w7x34y1sbbGY=;
        b=VTbQQ9nist1ZLSEneQI7WGwsT+slxJIveWareH9YMpKm/SKnMwDxwRbp8eqKnkTe7Q
         2sTeLE2WiOkt3zc43H3W7CPC4O1j6NzyoIj2bf6Dtu9rUm8Ee/Ck0qMUnuMOsoW7IeWV
         b7NmaBR89WDPIX3fyQyyrhPOd5hj/Uz8PLxcj7xyln5HYzksgqNs/bQMQNcwP1BiaqQE
         8UTW1ROjP20cIWCMkz+2pqiuF0EKq+myxp9JayKsCprC19V1YH1I55mOmUne3VhyzJtE
         Hl2T8i0o6ix0Vuqgx0J+9pGRAh5WYqFsg7nKWi0on7DGMOhBwWfbifQpamf7WOKs4ylS
         6xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709559663; x=1710164463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/dHCpgDDmSuBOfKLpH4euKRiDvMD04w7x34y1sbbGY=;
        b=H/PhliHlZ0Khnt6qR8c3aJOCAo7KGYmMdIRxcDUL8D4DAQ4Z0SzJYhjHqYI+ncl+Vc
         5FiBAD99DZXieAF9IFUxh4uQ/vTh/MT2TZ2biYtlpl4KK1qRhWcqNcZS6dnmzSETQ6d3
         ss4WaJdbrqu0nTTj8WH9v9dwvcbcB8+q8vrbW7jdi98zsLQjPBCN4NtLGkuQDisPjwvo
         yuGCNAiyNJESb1NtfvtNf0eH7IudJjoncSr2qLpGu4cFb4eyY16NvL92nno48bfQV5o1
         0pW7lDx4SgpN2Gzqg0P/myikqnLTPXHvgWQSqyWMpKm1Ry7PmNmu3Z0f2CpQZu1gs2jb
         pDKg==
X-Forwarded-Encrypted: i=1; AJvYcCWNAnvzesCn6OseJvW1gFhL7AA8VKVgMHRh6+foy9B5pCVhwaLGjEKebzedVdFA7CeSi3GI3QsUaQt4//kdtn9GvdzrgDwrdUSUwSRK+xAC
X-Gm-Message-State: AOJu0YxU8kfYm7VzoNXxsHQkZCJOr7EoEHqeYxWzRRM+9ApEytn6UuNa
	XcHVLYOqkO6l0adJ8zTEb/GIlkw8af7LAYwQlYzt5vCOQpGvPECz5Klm4v1kqae9C5IdeNzjTwn
	3fnwKe8i/E7HEPqvl5GG62Nys18U=
X-Google-Smtp-Source: AGHT+IGApFrYWTCxf7o+Xw3AU3j0mc3yLDQDYin1YtShfj5gmezRzs9SAsWTz6aEslad9W0wPmt7sBbXkXDMb2pSQo4=
X-Received: by 2002:a4a:2559:0:b0:5a1:15a2:114c with SMTP id
 v25-20020a4a2559000000b005a115a2114cmr4854461ooe.0.1709559663519; Mon, 04 Mar
 2024 05:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
 <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com> <91f0a339-ac0e-49df-bd26-dbfe1485308f@linaro.org>
In-Reply-To: <91f0a339-ac0e-49df-bd26-dbfe1485308f@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 4 Mar 2024 21:40:52 +0800
Message-ID: <CAJRtX8TPz_jTvPmuBW8t=mC+BR1kWmu=GS9K1k6ys7U9u0ENFw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_054105_918591_3DE2916D 
X-CRM114-Status: GOOD (  13.42  )
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

T24gTW9uLCBNYXIgNCwgMjAyNCBhdCA2OjE14oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDA0LzAzLzIwMjQgMTA6
MDIsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gSW1wbGVtZW50IHRoZSBQV00gZHJpdmVyIGZvciBD
VjE4MDAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmluZ2JhbyBRaXUgPHFpdWppbmdiYW8uZGxt
dUBnbWFpbC5jb20+Cj4KPiAuLi4KPgo+ID4gKwo+ID4gKyAgICAgcmV0ID0gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KCZwZGV2LT5kZXYsIGRldm1fY2xrX3JhdGVfZXhjbHVzaXZlX3B1dCwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5jbGspOwo+ID4gKyAg
ICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBjbGtfcmF0ZV9leGNsdXNpdmVfcHV0KHBy
aXYtPmNsayk7Cj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiBQbGVhc2UgdGVzdCB0
aGlzIHBhdGggLSB5b3UgaGF2ZSBkb3VibGUgcHV0Lgo+CgpUaGFuayB5b3UgZm9yIHlvdXIgcmVw
bHkuIFlvdSdyZSByaWdodC4gSWYgdGhlCmRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpICBmdW5j
dGlvbgpmYWlscyB0byBhZGQgYW4gYWN0aW9uLCBpdCB3aWxsIGNhbGwgdGhlIGFjdGlvbi4KCkJ5
IHRoZSB3YXksIGlmIEkgbmVlZCB0byByZXNlbmQgdGhlIHBhdGNoLCBzaG91bGQgSSB3YWl0IGZv
ciB0aGUKbWFpbnRhaW5lciB0byByZXZpZXcgaXQsIG9yCnNob3VsZCBJIGltbWVkaWF0ZWx5IGNv
cnJlY3QgdGhpcyBlcnJvciBhbmQgcmVzZW5kIGl0LgoKQmVzdCByZWdhcmRzLApKaW5nYmFvIFFp
dQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
