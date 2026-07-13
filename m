Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CF9C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 05:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEEnAweRHjUKhLuZ0gtpbpHcQIHzK48rE1GrxvMGJSY=; b=BehLKw4ONwBVSw
	vNpBDbG+rd+nNvPNk8CKwZQWI12nOiPgBMLFrBCvuq1inQdfWpCPePaaUburzxtu8MWEW9BfvdQqU
	5WMcR34HpnY/qVjJfeYCxlp2Ing6lVh9thQ9CKG94RRbBmza3NYknfVXfWOMXHeUwJuUfYjnTGAlF
	MeLPlEeA0frThD79G9icWfWpGIKFn6nznMOdezJSPntaH2Nxsipx5T/jZ7yZMHW7DstWsz/YcX2DH
	gLJDh2dDdVEi02fqBJjX36LvJK3mMQ9MQQUaiefzzx47p+khgPHpXt5h8szbzVkEKSbjWzm18/g7Q
	0lD+EDu/yUr1zPb+Jc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj961-000000089Dp-0bzJ;
	Mon, 13 Jul 2026 05:20:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj95y-000000089D2-1U7S
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 05:20:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47de0093c42so2091960f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 22:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783920044; cv=none;
        d=google.com; s=arc-20260327;
        b=m/fbZA2iLB0EXRACEMYsH0kwHg21kBfdmF781f6mQ08aGlxIDiXDoJ73QLdouDjymt
         RZkeMdsxjnTmzwXtm84bPQ955H6lDh+WIVbZvaJSLq62+sNPdSDBd4o/u1O20b8B1nAY
         x73rg82x8zskKwCU86OmD8jWjarYFaKwS4PVngA5dX5kbUxwXmcs2y0BWxKXB4Iiikt6
         16bcYY3XFwPT7t6A4LI9TtF9X6cLDIvhZpj9J7IPBNb6yOGTeIIzHmBQ3MnI2SoW+xhP
         EoSnbe5r7ObpPABJJV+U55REE4CgIv1ckQtMJ0xM4OoRRKm+0yoQj57z68THyt+VD5P+
         Niog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vtAiO3GAOtWbZl83N5tUcn9I/FK/tuLB8pt/tT+Gqe4=;
        fh=gtenheC8RMG21zhm1Zy7JFSfwB5fUz62IDWwWxhfYQk=;
        b=aBiln6iQfrTmC31TQX4pHFsL1CooEPFdjEG7sn7N1O1wRHdp8P/HJA3lU3dNj0Bk9P
         N3jUOUKi0SnBOyRrWj7QsnCoMXvZC1wY8DvLPnMmxz3OegdOaAn5BE/QVQLWM+Fk0JWP
         KxaXpefDlAs4uUAz1F61MRSz+dGtvUfX9B8XoQrZLRNXCDWNmJ9e3ktYDmZepudhVtiy
         IhDcKwXGfSUphPD5zJIvS5BxY7zYTkMi39denEdl7GSrR4t3Vm4DCKNAvA8PHPLNmp9d
         rja3PF3rQfTcQXrnQbVOGPqOsEdPqL7ocka2OHKEZ6QTSrwFlLlzYpiJJHkcJVBiHOnM
         QUfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783920044; x=1784524844; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vtAiO3GAOtWbZl83N5tUcn9I/FK/tuLB8pt/tT+Gqe4=;
        b=VXC5kNVbUh9AP4AFS5jleNRaISPVT7yAfkA/UKeOmBaFB756NtAVEg07XWllcWEdQi
         r2LpRFb8fqD/bvzOIBCL18KADPEETY8AxGf7rCOOtPj/7Qi+YmvTO27WnJ9PwYIxxHnt
         ZXR9ZzNfSM65A2GwB3JoeSKUUrFgwo2Bsly1LTFOagIE+WUFS/hAhH+AWoy1HG9vrwNw
         EoapQ8Hi5ZzK01IJGy0xEmeveva6DeKs4Mo6sYXznoy5CMr7NajcFrmjIyuSBqAkA7iR
         /3ndB9I/IvJ8Lh1GaIRgh3BSyNEp/TdoPmfBs8Do6OOWRMA82RTX7XfppvSu5cDF/EGD
         93PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920044; x=1784524844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtAiO3GAOtWbZl83N5tUcn9I/FK/tuLB8pt/tT+Gqe4=;
        b=TnpoRJOc7a533/0+BxiwNjSVNb1cq1DCDlPbMkb0q6hu5TgdmpY4hs90I262jXZrhU
         N/cXGJMCM3GPbks3vKPyZf/QJCf5VoTNATagWDkN5tpXsVdr/w9xPmdbBE+GJwdl6ipy
         u3wNm3dbkNwGWJY8+ijwNwpg9ZePZDtvECKq1g01nUojk9uc2yP6jSB1D5NzBU8rPCAN
         6tjlh/2KVdF6jiMzZNfDjMLUS8YtCPvKVdMyMFovI9UJ/vtK47+Gx1VrZWLpDTkH2p3H
         L1lDQJNtoxaFo8fXEi6N7u2NjJYXqk0Y7y3Jb5OhNwTZKiK+rbYe9wUgMlzvsb/cKRke
         6yAg==
X-Forwarded-Encrypted: i=1; AHgh+Rrop4YLf8vY1P/LdnqHanVIuPtd6aFVluyiBKQ8QldtgoL/KATDSSDoryLE1ER8mGvRvgU9lEZc78RUcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtH/vLZvJC18IsJT5IFFQpWRlvK3OWuW/3ZFSUZ+LwKbUkb8UR
	+D/I2rEbSLmiHHTh+YeraMUFfE+allS7fihCMhYhmmwuUZIy+8GYdWf3ytoM52al/QT2phMO484
	x/qgS3DHdI2gNVLWUEX75RLdibixcs1Vnpkmel5JR/Q==
X-Gm-Gg: AfdE7cnduHh5cUd5u2WIgVLRUYbOg9KUuebF147pbaDuu7ISDTdOHnpt+iEHc620i0R
	fnH7cP3maobQKTb0lHvdBbpsSq7mhvFIQklntkb+bQ1InwVvqHGxjH9Hlc1rFWQ4TkYACuu/sBg
	GUjrAigtH0DkgVdiY1tPFwlBJXwqfD8lFvP9cf4typLwiShJIiPLT2TUv5+nyig5QxN5iuuSmwy
	9grYQBe811QXt1ttj2zfjduVnKmRM2qsgnYsAmzqohOYa77ADBvS32seIiPzWFrRR1sf9AXItWa
	4ylPqmDEAa8PQGMHhwaKkC5oKSHREJJZDqsDmP530SFNQmJnRx99D9pa0x8zWrlfeGJ7qdUnBVL
	lRoaHBLUeeLsiWwAk
X-Received: by 2002:a05:6000:40cb:b0:47b:5f25:7c59 with SMTP id
 ffacd0b85a97d-47f2dcf8d32mr8542206f8f.38.1783920044394; Sun, 12 Jul 2026
 22:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260610093922.51617-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260610093922.51617-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 10:50:32 +0530
X-Gm-Features: AUfX_mzgLxpjt24Y_crhzgSd_jT-mGHCzGXn6QWlmdDMie4AJ5TBR2ZEqWhokTY
Message-ID: <CAAhSdy220vPtK6a8WpRbmyfN2Aa2wQquJ+p3rLP-P4XOPZOzPQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid redundant page-table allocations in
 ioremap topup
To: fangyu.yu@linux.alibaba.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_222046_402689_42402930 
X-CRM114-Status: GOOD (  18.93  )
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

T24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgMzowOeKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBrdm1fcmlzY3ZfbW11X2lvcmVtYXAoKSBjdXJyZW50bHkgdG9wcyB1cCBpdHMg
b24tc3RhY2sgcGFnZS10YWJsZQo+IGNhY2hlIHZpYSBrdm1fbW11X3RvcHVwX21lbW9yeV9jYWNo
ZSgpLCB3aGljaCBhbGxvY2F0ZXMgdXAgdG8KPiBLVk1fQVJDSF9OUl9PQkpTX1BFUl9NRU1PUllf
Q0FDSEUgKDMyKSBvYmplY3RzIHBlciB0b3B1cC4KPgo+IGlvcmVtYXAgb25seSBjb25zdW1lcyBu
b24tbGVhZiBwYWdlLXRhYmxlIHBhZ2VzLCBhdCBtb3N0Cj4gcGdkX2xldmVscyAtIDEgKDEgdG8g
NCkgcGVyIGNhbGwsIGFuZCBmb3IgY29udGlndW91cyBtYXBwaW5ncwo+IHdpdGhpbiB0aGUgc2Ft
ZSBodWdlIHBhZ2UgdGhlIG5vbi1sZWFmIHBhZ2VzIGFyZSBhbGxvY2F0ZWQgb25jZQo+IGFuZCBy
ZXVzZWQgYnkgc3Vic2VxdWVudCBwYWdlcy4gVG9wcGluZyB1cCB0byAzMiBvYmplY3RzIHRoZXJl
Zm9yZQo+IHRyaWdnZXJzIG1hbnkgdW5uZWNlc3NhcnkgR0ZQX0tFUk5FTF9BQ0NPVU5UIGFsbG9j
YXRpb25zIG9uIGV2ZXJ5Cj4gY2FsbCwgYWxsIG9mIHdoaWNoIGFyZSBmcmVlZCB3aGVuIHRoZSBm
dW5jdGlvbiByZXR1cm5zLiBJbiBob3QKPiBwYXRocyAoc3VjaCBhcyB2Q1BVIG1pZ3JhdGlvbiks
IHRoaXMgY3JlYXRlcyBhdm9pZGFibGUgYWxsb2NhdG9yCj4gY2h1cm4gYW5kIHdhc3RlcyBDUFUg
Y3ljbGVzLgo+Cj4gVXNlIF9fa3ZtX21tdV90b3B1cF9tZW1vcnlfY2FjaGUoKSB3aXRoIGEgY2Fw
YWNpdHkgb2YgcGdkX2xldmVscyBzbwo+IHRoZSBvbi1zdGFjayBjYWNoZSBpcyBzaXplZCB0byB0
aGUgbWF4aW11bSBkZW1hbmQgb2YgYSBzaW5nbGUKPiBtYXBwaW5nLiBUaGlzIHJlbW92ZXMgdGhl
IHJlZHVuZGFudCBhbGxvY2F0aW9ucyBhbmQgcmVkdWNlcyBwZXItY2FsbAo+IG92ZXJoZWFkIHdp
dGhvdXQgY2hhbmdpbmcgYmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGEgZml4IGZvciBM
aW51eC03LjItcmNYCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5j
IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBpbmRleCAyZDNkZWYwMjQyNzAuLjg3M2E1ZGRlNGI5MiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTM5
LDYgKzM5LDcgQEAgaW50IGt2bV9yaXNjdl9tbXVfaW9yZW1hcChzdHJ1Y3Qga3ZtICprdm0sIGdw
YV90IGdwYSwgcGh5c19hZGRyX3QgaHBhLAo+ICAgICAgICAgcGdwcm90X3QgcHJvdDsKPiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcGZuOwo+ICAgICAgICAgcGh5c19hZGRyX3QgYWRkciwgZW5kOwo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBwZ2RfbGV2ZWxzID0ga3ZtLT5hcmNoLnBnZF9sZXZlbHM7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgcGNhY2hlID0gewo+ICAgICAg
ICAgICAgICAgICAuZ2ZwX2N1c3RvbSA9IChpbl9hdG9taWMpID8gR0ZQX0FUT01JQyB8IF9fR0ZQ
X0FDQ09VTlQgOiAwLAo+ICAgICAgICAgICAgICAgICAuZ2ZwX3plcm8gPSBfX0dGUF9aRVJPLAo+
IEBAIC02MSw3ICs2Miw3IEBAIGludCBrdm1fcmlzY3ZfbW11X2lvcmVtYXAoc3RydWN0IGt2bSAq
a3ZtLCBncGFfdCBncGEsIHBoeXNfYWRkcl90IGhwYSwKPiAgICAgICAgICAgICAgICAgaWYgKCF3
cml0YWJsZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBtYXAucHRlID0gcHRlX3dycHJvdGVj
dChtYXAucHRlKTsKPgo+IC0gICAgICAgICAgICAgICByZXQgPSBrdm1fbW11X3RvcHVwX21lbW9y
eV9jYWNoZSgmcGNhY2hlLCBrdm0tPmFyY2gucGdkX2xldmVscyk7Cj4gKyAgICAgICAgICAgICAg
IHJldCA9IF9fa3ZtX21tdV90b3B1cF9tZW1vcnlfY2FjaGUoJnBjYWNoZSwgcGdkX2xldmVscywg
cGdkX2xldmVscyk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4KPiAtLQo+IDIuNTAuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
