Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2662DE9A03B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 23:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFaQhzzCLe/ZZ/JSxsNczFxm4kteh4Jeg/BcIwNxEWA=; b=tgrH3AZmQ/Y4CR
	yh+8hSBzATg/5q1tgMejwWYM6JgiHP6cPO54VddO9a+v+WgHEniQpjDk80I4bqv42ntl8NorTX7It
	3sOJyL+qPCV9Pmxn7R6T2waDxXZO6d45Byjkci6vqEYwGCK1UgHBs20W6tfbaDIZ9kXnn6XZJEAo1
	I5ug5iD4P6vGpzrjd4cNrrE6GFz5mcvmeY6ziJkt9JblR/r+37b+VpzjILHKKr2fPMXjWbLyXqNet
	8mdL64j6DHc01HonzImkf21p4Z6w1AgaGeTfVngjHSMpkfWa2IX4xq68+WACTb+tlqAsyOffnlylD
	rwuZfnzH1cUDyrCVOD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsUFR-000000091Ny-1Kxl;
	Tue, 17 Feb 2026 23:12:53 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsUFP-000000091Nc-0BJT
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 23:12:52 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-797d3864d89so22829127b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 15:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771369969; cv=none;
        d=google.com; s=arc-20240605;
        b=LbbVrnW6IhY6irgJkVczGDtGhdftgEdWD8vioGKFH0/Y2SHbySl9FztG7UAvfbLJ/s
         aRQ90ekY0cQGGS2XvmW/LTFkGqtAtn4SaGjeUG6Q7maRt9UcCuynRnDQvlxQVrPM+6Px
         Wl73RjMxCV93ZUIsVUgTczlh4P9sVOG+N2qxeDASLhyP9xDGC5ET0qkjaJhf7G4p5piO
         HD7Oryn2imrBnfLy7b9hZKa8EH6GA9Kt5mndSXDxMLpPn0+BEpVVc5prEEzkokVZB6C7
         puyPJWIFKerXN4yb0xtSPBCdopjcw26GATih1j3zm3icas42ByWo6eCqM7GlrU3cjbl6
         ZABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zP/wT+ORYJYEWXPTfGliwdU0mYdU90fsImuNVpM/pjY=;
        fh=EXY6xpVml+cy6Q3sIJdhw1Ax6x94KmryrWBPxbodvgA=;
        b=iCDVlCzOM2cuLgZfLXAzUNcXFGg178KNOW2WeBlKARQDCU8lQMbQoLYjywbuNOEUNN
         Lh2eaGhrcr7grnZIwW+1Cl+nmBFsQ1XIWazj9qeZf5FjhGKH60tSUxFuqHpRg8xN5h9Y
         v9UhamZlobo9tWjfcDvpUocKVzfn0sB7swxcdwlc4KdZrAQr6ceoKzSwznS/cIx923rF
         qc5p9dRQXYU+2z2uAIJURfkRgk5+uczqL2fnNLeupNoL/uWY1U8Y4BJeNy0Of2E7yhKm
         LJ4G64/5xdKSPEaaeNGcKdocAQzBrhFhGmxt5HJYDDmBzUPEvEuprJPrTcVjXRtTQodh
         m4+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771369969; x=1771974769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP/wT+ORYJYEWXPTfGliwdU0mYdU90fsImuNVpM/pjY=;
        b=QRXsqaTzhopCcJB1KOdaNBClrooiiZKA3D22IwkQdVxRLt3lau+/46oukrufhP8P2q
         +8wbqVwNDgGwr3IHtUBQ6/WxxSOkhy0D+yiKdgKD0loMrP4CZCD9UEo192KKbPqVYlTV
         L/7x8pVMZ+JeJjKLcJmW0my/ct8wGTJ8aECRMzJ8gx7s8p6bBeCj+MlJ6plOCbDFRebz
         rFUgzxrJ2mjYU7YxU5yjTZDoZVW6HQqA/kMnewrjduRLSWnC6XuuQ8Sx99ai6o8Tdh3E
         xre6US4+ifwzcUbbratt0/3CeCwMiaI3SL7Qe0rlOmxbWtW65M0tFEPBWXszoSkIDPCJ
         t3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771369969; x=1771974769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zP/wT+ORYJYEWXPTfGliwdU0mYdU90fsImuNVpM/pjY=;
        b=Il+n9WPDH1SAlwEJYml0j6Ev9Sbbqj4mlJNAzxqaZ1skOuH7wi3ycAIP1yXhWroiuI
         5aJBTKoLSI+HLe4ZIlOV41WfXUjYpqTH1KxBWCXpWpPN638/hYXw4ZO1eFD1YZzyS4GM
         f7Hkz884nN4MnoiHmUbhePJMewKHI9coUOsIKspQkrROkrfeHzTeoNcVeLlf8qgqhYFm
         bW7/DBC/NgzB5SxWFX1Fc3QR9QfMd4zY4DPm8CZZS6yIwmdcLvjZyJcO0OqDtgVO3qio
         7ZgPPsqDMIij7hUQxYIyRLnUdXw9i2FUlEskg5PsifsJVaoQ1sSm+xA24IpRt1+rtvdD
         k+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUvexyO2qDynoueXmQrofHxNQb2Rum1ucB74lbMBihNzkeXhU2SnHcZF4jdErG1unEiYgCCWENtfOm31Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRcbOgJXKaGEf9TZ4Y8GnjAg5liqCC9PxbT3Wbn4sUvqsI9c0V
	M+6i3a7H0lOzovirODD+vE8Wgv50/p74Bwbt7/ZAWpL67OtksT9S13mbnQ2uDBLfHMKlK2U6fhh
	WiGR7jypB1+ngBy4ZvEEdbYXP0BZQI1gaUgsdKrAJFA==
X-Gm-Gg: AZuq6aKM4ztjp79f7YBQJPVHzYv+Dz7O6ceW8DPVR9HnBCbUk+F0If+OKnW0sxbvBBO
	l78VgNfS9Hz6LkjnU7TpAp3qvbTMLlS8R7z6c1xBde93neRsACl/Tri7wT+SMFn4u0dRUPRRogy
	ZjPB39puFWbMKUlBFbP9NfhYaguwHBfyvAFAZ2ohsQJc7VBxiZjWvOrfBFj8Em6MyEO0R/ZTNGv
	I5uRdecybp5npr62RYSBjozjN6/Vud+JKO+WIArd1bjUqKH53CTAq0ZJAJUT9ViIIyW5Ls1l30c
	Ca70oEvbQ7NjzkQMG8aHpSgnq4hyLT3rxBIvtq+7aF1poIPONlLcvUhyTvAHLzmBWu2SSsY7
X-Received: by 2002:a05:690c:dd4:b0:794:77da:aa40 with SMTP id
 00721157ae682-797ac5cdf09mr105123407b3.43.1771369969517; Tue, 17 Feb 2026
 15:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com> <aZST4Yywv09u65MP@redhat.com>
In-Reply-To: <aZST4Yywv09u65MP@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 17 Feb 2026 17:12:38 -0600
X-Gm-Features: AaiRm53ZgMX5zL3OnOXtCGVJ3U5aMlR3Ss87ookwvkWmf5kHgzV6nQtkNYJPn7M
Message-ID: <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_151251_103239_F42A4AAD 
X-CRM114-Status: GOOD (  31.81  )
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

SGVsbG8gQnJpYW4KCk9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0IDEwOjE04oCvQU0gQnJpYW4gTWFz
bmV5IDxibWFzbmV5QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSGkgQW5pcnVkaCwKPgo+IE9uIE1v
biwgRmViIDE2LCAyMDI2IGF0IDA0OjE2OjM0UE0gLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3
cm90ZToKPiA+IEFkZCBkcml2ZXIgZm9yIGNsb2NrIGNvbnRyb2xsZXIgaW4gVGVuc3RvcnJlbnQg
QXRsYW50aXMgU29DLiBUaGlzIHZlcnNpb24KPiA+IG9mIHRoZSBkcml2ZXIgY292ZXMgY2xvY2tz
IGZyb20gUkNQVSBzeXNjb24uCj4KPiAuLi5jb3ZlcnMgY2xvY2tzLi4KClRoYW5rIHlvdSBmb3Ig
eW91ciBjb21tZW50cy4gSSB3aWxsIGFkZHJlc3MgdGhlIHR5cG9zIGFuZCBhZGQgdGhlCnN0YXRp
YyBtb2RpZmllciBmb3IgdGhlIGRpZmZlcmVudCB2YXJpYWJsZXMgdGhhdCB5b3Ugc3VnZ2VzdGVk
LgoKPiA+ICsKPiA+ICtzdHJ1Y3QgYXRsYW50aXNfY2xrX2dhdGVfc2hhcmVkX2NvbmZpZyB7Cj4g
PiArICAgICB1MzIgcmVnX29mZnNldDsKPiA+ICsgICAgIHUzMiBlbmFibGU7Cj4gPiArICAgICB1
bnNpZ25lZCBpbnQgKnNoYXJlX2NvdW50Owo+Cj4gV2h5IGlzIHRoaXMgYSBwb2ludGVyPyBDb3Vs
ZCB0aGlzIGp1c3QgYmUgYSBwbGFpbiB1bnNpZ25lZCBpbnQgc2luY2UKPiBhbGwgb2NjdXJyZW5j
ZXMgb2YgdGhpcyBhcmUgZGVyZWZlcmVuY2VkPwoKV2UgaGF2ZSBhIGdyb3VwIG9mIGdhdGUgY2xv
Y2tzIHRoYXQgaGF2ZSBhIHNpbmdsZSBlbmFibGUgYml0IHNoYXJlZAphbW9uZyB0aGVtIChpbnN0
ZWFkIG9mIGluZGl2aWR1YWwgZW5hYmxlIGJpdHMgZm9yIGVhY2ggY2xvY2spLiBXZSBuZWVkCnRv
IGtlZXAgdHJhY2sgb2YgdGhlIG51bWJlciBvZiBjbG9ja3Mgd2l0aGluIGEgZ3JvdXAgdGhhdCBo
YXZlCnJlcXVlc3RlZCBhbiBlbmFibGUsIGFuZCBvbmx5IHVuc2V0IHRoZSBiaXQgaWYgYWxsIHRo
ZSBjbG9ja3MgYXJlCmRpc2FibGVkLiBzaGFyZV9jb3VudCBpcyB1c2VkIHRvIGtlZXAgdHJhY2sg
b2YgdGhpcy4gSXQgZ2V0cyB1cGRhdGVkCmJ5IGVhY2ggY2xvY2suIEhlbmNlIGl0J3MgYSBwb2lu
dGVyIChhbmQgdGhlIG11dGV4ZXMgYXJvdW5kIGFjY2VzcyB0bwppdCkuCgo+ID4gK3N0YXRpYyBp
bnQgYXRsYW50aXNfY2xrX2dhdGVfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ICt7
Cj4gPiArICAgICBzdHJ1Y3QgYXRsYW50aXNfY2xrX2dhdGUgKmdhdGUgPSBod190b19hdGxhbnRp
c19jbGtfZ2F0ZShodyk7Cj4gPiArICAgICB1MzIgdmFsOwo+ID4gKwo+ID4gKyAgICAgcmVnbWFw
X3JlYWQoZ2F0ZS0+Y29tbW9uLnJlZ21hcCwgZ2F0ZS0+Y29uZmlnLnJlZ19vZmZzZXQsICZ2YWwp
Owo+ID4gKwo+ID4gKyAgICAgdmFsICY9IGdhdGUtPmNvbmZpZy5lbmFibGU7Cj4gPiArCj4gPiAr
ICAgICByZXR1cm4gdmFsID8gMSA6IDA7Cj4KPiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlz
IGluc3RlYWQ/Cj4KPiAgICAgcmV0dXJuICEhdmFsOwoKQWNrCgo+ID4gK3N0YXRpYyBpbnQgYXRs
YW50aXNfY2xrX2dhdGVfc2hhcmVkX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ICt7Cj4g
PiArICAgICBzdHJ1Y3QgYXRsYW50aXNfY2xrX2dhdGVfc2hhcmVkICpnYXRlID0KPiA+ICsgICAg
ICAgICAgICAgaHdfdG9fYXRsYW50aXNfY2xrX2dhdGVfc2hhcmVkKGh3KTsKPiA+ICsgICAgIGJv
b2wgbmVlZF9lbmFibGU7Cj4gPiArICAgICB1MzIgcmVnOwo+ID4gKwo+ID4gKyAgICAgc2NvcGVk
X2d1YXJkKHNwaW5sb2NrX2lycXNhdmUsIGdhdGUtPmNvbmZpZy5yZWZjb3VudF9sb2NrKQo+ID4g
KyAgICAgewo+ID4gKyAgICAgICAgICAgICBuZWVkX2VuYWJsZSA9ICgqZ2F0ZS0+Y29uZmlnLnNo
YXJlX2NvdW50KSsrID09IDA7Cj4gPiArICAgICAgICAgICAgIGlmIChuZWVkX2VuYWJsZSkgewo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF9yZWFkKGdhdGUtPmNvbW1vbi5yZWdtYXAs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2F0ZS0+Y29uZmlnLnJlZ19v
ZmZzZXQsICZyZWcpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyB8PSBnYXRlLT5jb25m
aWcuZW5hYmxlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF93cml0ZShnYXRlLT5j
b21tb24ucmVnbWFwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnYXRl
LT5jb25maWcucmVnX29mZnNldCwgcmVnKTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gKyAgICAgaWYgKG5lZWRfZW5hYmxlKSB7Cj4gPiArICAgICAgICAgICAgIHJl
Z21hcF9yZWFkKGdhdGUtPmNvbW1vbi5yZWdtYXAsIGdhdGUtPmNvbmZpZy5yZWdfb2Zmc2V0LCAm
cmVnKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKCEocmVnICYgZ2F0ZS0+Y29uZmlnLmVu
YWJsZSkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCIlczogZ2F0ZSBlbmFi
bGUgJWQgZmFpbGVkIHRvIGVuYWJsZVxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsa19od19nZXRfbmFtZShodyksIGdhdGUtPmNvbmZpZy5lbmFibGUpOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlPOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAg
ICB9Cj4KPiBTaG91bGQgdGhpcyBjaGVjayBiZSBkb25lIHdpdGhpbiB0aGUgc2NvcGVkX2d1YXJk
PwoKVGhlIGxvY2sgaXMgdXNlZCBvbmx5IGZvciBhY2Nlc3MgdG8gKmdhdGUtPmNvbmZpZy5zaGFy
ZV9jb3VudC4gU2luY2UKd2UgYXJlbid0IHJlYWRpbmcgdGhhdCBoZXJlLCBpdCBpc24ndCBwdXQg
aW5zaWRlIHRoZSBsb2NrLgoKPiA+ICtzdGF0aWMgaW50IGF0bGFudGlzX3ByY21fY2xvY2tzX3Jl
Z2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBhdGxhbnRpc19wcmNtX2RhdGEgKmRh
dGEpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGNsa19od19vbmVjZWxsX2RhdGEgKmNsa19kYXRh
Owo+ID4gKyAgICAgaW50IGksIHJldDsKPiA+ICsgICAgIHNpemVfdCBudW1fY2xrcyA9IGRhdGEt
Pm51bTsKPiA+ICsKPiA+ICsgICAgIGNsa19kYXRhID0gZGV2bV9remFsbG9jKGRldiwgc3RydWN0
X3NpemUoY2xrX2RhdGEsIGh3cywgZGF0YS0+bnVtKSwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgaWYgKCFjbGtfZGF0YSkKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwg
ZGF0YS0+bnVtOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGNsa19odyAqaHcgPSBk
YXRhLT5od3NbaV07Cj4gPiArICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBody0+aW5p
dC0+bmFtZTsKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGF0bGFudGlzX2Nsa19jb21tb24gKmNv
bW1vbiA9Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaHdfdG9fYXRsYW50aXNfY2xrX2NvbW1v
bihodyk7Cj4KPiBZb3UgY2FuIGpvaW4gdGhlc2UgdHdvIGxpbmVzIGludG8gb25lIGFuZCB5b3Un
bGwgYmUgYXQgODMgY2hhcmFjdGVycy4KPiBjaGVja3BhdGNoLnBsIG5vdyBhbGxvd3MgdXAgdG8g
MTAwLgoKPgo+ID4gKyAgICAgICAgICAgICBjb21tb24tPnJlZ21hcCA9IHJlZ21hcDsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgcmV0ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LCBodyk7Cj4g
PiArCj4gPiArICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgIkNhbm5vdCByZWdpc3RlciBjbG9jayAlZCAtICVzXG4iLCBpLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmFtZSk7Cj4KPiBUaGlzIHdpbGwgYmUgYXQg
ODEgY2hhcmFjdGVycyBpZiB0aGUgbGluZXMgYXJlIGpvaW5lZC4KCkkgdXNlZCBjbGFuZy1mb3Jt
YXQgdG8gZG8gdGhlIGZvcm1hdHRpbmcgaGVyZSBhbmQgaXQgc2VlbXMgdG8gaGF2ZQpwaWNrZWQg
YSBsaW5lIGxlbmd0aCBvZiA4MD8gSSBjYW4gY2hhbmdlIHRoaXMKCj4KPiBIb3dldmVyLCBiaWdn
ZXIgcXVlc3Rpb24gaXMgaWYgdGhpcyBtZXNzYWdlIHNob3VsZCBiZSBkcm9wcGVkIGVudGlyZWx5
PyBJZgo+IHRoaXMgY29uZGl0aW9uIG9jY3VycywgYW4gZXJyb3IgaXMgbG9nZ2VkIGhlcmUsIGFu
ZCBhIHNlY29uZCBtZXNzYWdlIHdpbGwgYmUKPiBsb2dnZWQgaW4gYXRsYW50aXNfcHJjbV9wcm9i
ZSgpIGJlbG93Lgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsg
ICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICBjbGtfZGF0YS0+aHdzW2NvbW1v
bi0+Y2xraWRdID0gaHc7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBjbGtfZGF0YS0+bnVt
ID0gbnVtX2Nsa3M7Cj4gPiArCj4gPiArICAgICByZXQgPSBkZXZtX29mX2Nsa19hZGRfaHdfcHJv
dmlkZXIoZGV2LCBvZl9jbGtfaHdfb25lY2VsbF9nZXQsIGNsa19kYXRhKTsKPiA+ICsgICAgIGlm
IChyZXQpCj4gPiArICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFkZCBjbG9j
ayBoYXJkd2FyZSBwcm92aWRlciAoJWQpXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJl
dCk7Cj4KPiBTaG91bGQgdGhpcyBtZXNzYWdlIGFsc28gYmUgZHJvcHBlZCBhcyB3ZWxsPwoKU28g
eW91J3JlIHN1Z2dlc3RpbmcgdGhhdCB3ZSBqdXN0IHByaW50IGEgc2luZ2xlIGVycm9yIG1lc3Nh
Z2UgaW5zdGVhZApvZiBtdWx0aXBsZS4gSSBjYW4gY2hhbmdlIGl0IHRvIGJlIGxpa2UgdGhhdC4K
Cj4KPiBCcmlhbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
