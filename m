Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC55ECCA464
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dscd2JSCkhjEtT5V+1psXkyWhnrAgnwAuzuGWP2c8Iw=; b=3tpdpaIOadUirF
	jslL02hHYnHq4wc6uRkRPHI8OUPlEgFf+bGdJOko9aKns8FZUfjEgkO6VoNI4mUp6hzYFG8ZQnEkY
	I5/2oxCz7a2AwYNW0t3xEj0c7JpjduAUK/whTJTee4Vp1H2pMqqZsHVWJ+fgOa0b5dXh6sP6ZlcBQ
	eH2DGvXhqfMLvmUAG5n4mletXBjDH0gyElmn/CJwz7XXm2gO8UyqB7t44DrxdMP4XG96HSWW0S+aC
	zO/WBKZTQH52RMM6nS0yKOq1cPWg1peMqYJnCfRIDlM2fPEjq6vS75s12arF1p/EJArvt/TWF2Mgs
	s1hyaYC2IwlX7B2iApUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfBd-00000002c7z-08RS;
	Fri, 16 Oct 2026 10:29:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfBb-00000002c76-0DyE
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 10:29:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so649911f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146553; x=1792751353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opHOuUGGTALSPReuuheLADgvOm4sgED9zbXGqnbAz2g=;
        b=B/w3vGiZNRDCYc2KHmENVD2fGHkoJFjXVbvrIBGyof8h3x0oBDTzTos1EKIMfsqon0
         QElG6WyCL+uRNWd2B+jBXukFka4ts4fXDlAhKcDjwlUmSdOELndb6wBItVLzQzd92w+t
         1yO4jZWqTgf9GYopFD5z2spkh4lLFcO+t9fWwEwsZ/e2nJcphz8wl0LS89ws7cJ1pe+k
         lzpUL3EPp8ltZvqE0CqfWLki+A2hsx03M8Ibwg4D4op1iuzlIQ9dHUjs4q0bFqcpJmE4
         xX+NSVWD84bTyE6SONgkQGHWidS4MmfkSmXsnwQranEy/gOSOcuRN2OhrDdBSFxZqNok
         2IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146553; x=1792751353;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opHOuUGGTALSPReuuheLADgvOm4sgED9zbXGqnbAz2g=;
        b=g4wc4Vt4FtTOnJHZF+lshMoTvRAKIgfYcZ2w8i2CwLAxxNXbexzi4JOJOwor78UV3E
         d9sye38FaOHQoWHMw8PPbn+GgYMBXDciFqZgGzMe/BC1GzadiTuU1CZRD2Sf47yvKUMU
         eUBQxCOoi9iRKdYbQJ3QDBeLhfEfDDxsRyYbhT5lclf2CnjB+WQbrxOhA9XXPkyJK8mF
         rGnPFGEHsmWXZafv2jpQyimD3SZRaYxmFIk4VixjYCP0XIfiFCvEyGcIq/NJFJ2gX45N
         sqH2VPBxwEim6lyxB2ElPch9mn3na9SXFwknEH+o6PocJuFQq45uM6To/iR/qceFZSmn
         Bb2g==
X-Forwarded-Encrypted: i=1; AKwUvBzIz1c9huFUW323PWu90G25pFIDM/W3C0QWP0Su+FiirQ9UuR3Fn2EAwFrjOXlUayEZ/ZSdPLQbpjx8Wg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKlDstc2n7o2lrNoaVfpics8ulqRt4hBn5QbdnnveIvBxDHHLRw
	y2ydxXtHA5fR7WmAh7DZ1fLbYet2JpacdtHmVxlKIXkVAYnLC6Ap2vDw
X-Gm-Gg: AYBFou0JsC4IYgl90u6eE2iqLlijwamL4733IBoj3PcWxMQngUjPNy5Qk1CWuItZgiX
	NKcIj52OcTUvZBdzeoXWyIMPun7BI/aciK2ptgC4ruRkrgLeUgWucwkdSGakr52Bh4/31mpj44v
	+iz5zWh7/4yV4n4wMdkO6qWJitVxnmkOwvo6IkgMpD9LvJrcMTOlJ9g+1yFtts/rruuPX0ndGkq
	FvPkENM2r2AMVcqOtnDZzqobZw5FVT/9kDiZxxTjBfZaN8SZi8j22Ur9oQyMWOVN3IhpzqwmBRd
	L39idqCaUwcrhNyluIlCOis3YQrXVAJ4P6rJCLk4n/BVLvGlpfLAsNJVMPdWFyd4FGZR3rJega2
	mFXfR4uw2gMQTY+CF/pw+uaZ4eyEdPf/3JeDAarDnjARY1NFazOoSJrjBZkBaegAmPMoD4nN+xt
	VZYpluRqTHswk5zWo+LpTmknRmFQfwudd06OCpqHDOGiXOn7ZLG8UXv1y2iyTfjlPZF7WjBYAdC
	L7nKwLzDKNl7w1suPhZl8YmSzp0VatR4Rlmb4k8MrUnNaGlno2enU9oc1CLkI4b/9IWBh+djL7H
	Qj+ODlkVff25hCJRxEFxTu/G4hbeyMmKQJXBRZGfS64BE+3OC2KE9nUc87Z8nO11nk97uL3HM+k
	nE5U=
X-Received: by 2002:a5d:5f92:0:b0:48d:efcb:1fea with SMTP id ffacd0b85a97d-48dfaca41d1mr6649319f8f.0.1792146552674;
        Fri, 16 Oct 2026 03:29:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7889sm4059906f8f.24.2026.10.16.03.29.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 03:29:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: mm: Pre-allocate module page tables for execmem
Date: Fri, 16 Oct 2026 12:28:47 +0200
Message-Id: <20261016102847.96530-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_032915_115380_BBBC3EA6 
X-CRM114-Status: GOOD (  12.73  )
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

UlY2NCBwcmUtYWxsb2NhdGVzIHBhZ2UtdGFibGUgbGV2ZWxzIGZvciBsYXRlIGtlcm5lbCBtYXBw
aW5ncy4gVGhlIG1vZHVsZQpyYW5nZSBpcyBndWFyZGVkIGJ5IENPTkZJR19NT0RVTEVTLCBhbHRo
b3VnaCBleGVjbWVtIGNhbiB1c2UgaXQgd2l0aG91dAptb2R1bGVzLiBCUEZfSklUX1JFR0lPTl9T
VEFSVC4uQlBGX0pJVF9SRUdJT05fRU5EIGxpZXMgd2l0aGluCk1PRFVMRVNfVkFERFIuLk1PRFVM
RVNfRU5ELgoKV2l0aCBDT05GSUdfQlBGX0pJVD15IGFuZCBDT05GSUdfTU9EVUxFUz1uLCBleGVj
bWVtIGFkZHMgYSBtYXBwaW5nIHRvCmluaXRfbW0gd2hpbGUgdGhlIGN1cnJlbnQgcHJvY2VzcyBy
ZXRhaW5zIGFuIGVtcHR5IFBHRCBlbnRyeS4gSW5pdGlhbGl6aW5nCmEgQlBGIHByb2dyYW0gcGFj
ayB0aGVuIGZhdWx0czoKCiAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3Qg
Li4uCiAgW2ZmZmZmZmZmNzgwMDAwMDBdIHBnZD0wMDAwMDAwMDAwMDAwMDAwCiAgLi4uCiAgYnBm
X2ppdF9maWxsX2hvbGVfd2l0aF96ZXJvCiAgYnBmX3Byb2dfcGFja19hbGxvYwoKVXNlIENPTkZJ
R19FWEVDTUVNIGZvciB0aGUgbW9kdWxlLXJhbmdlIHByZS1hbGxvY2F0aW9uLCBhcyBwb3dlcnBj
IGRvZXMKZm9yIGl0cyBleGVjbWVtIHBhZ2UtdGFibGUgc2V0dXAuIEJvdGggQ09ORklHX01PRFVM
RVMgYW5kIENPTkZJR19CUEZfSklUCnNlbGVjdCBpdC4KCkZpeGVzOiAyYzllNWQ0YTAwODIgKCJi
cGY6IHJlbW92ZSBDT05GSUdfQlBGX0pJVCBkZXBlbmRlbmN5IG9uIENPTkZJR19NT0RVTEVTIG9m
IikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKQXNzaXN0ZWQtYnk6IExMTQpTaWduZWQtb2Zm
LWJ5OiBLYXJsIE1laGx0cmV0dGVyIDxrbWVobHRyZXR0ZXJAZ21haWwuY29tPgpBY2tlZC1ieTog
TWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSA8cnBwdEBrZXJuZWwub3JnPgpBY2tlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gU3RhdGUg
dGhhdCB0aGUgQlBGIEpJVCByZWdpb24gbGllcyBpbnNpZGUgdGhlIG1vZHVsZSByZWdpb24gKE1p
a2UpLgotIEFkZCBBY2tlZC1ieSB0YWdzIGZyb20gTWlrZSBSYXBvcG9ydCBhbmQgQmrDtnJuIFTD
tnBlbC4KLSBObyBjb2RlIGNoYW5nZXMgZnJvbSB2MS4KCnYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjYxMDE1MDMzNjQzLjg0OTcyLTEta21laGx0cmV0dGVyQGdtYWlsLmNvbS8KCk5v
dGVzOgogICAgVGVzdGVkIG9uIGEgQmVhZ2xlViBBaGVhZCB3aXRoIG1hdGNoZWQgTExWTSAxOC4x
LjMgYnVpbGRzIGJhc2VkIG9uCiAgICB2Ny4zLXJjNzoKCiAgICAtIHVucGF0Y2hlZDogYSBuYXRp
dmUgWERQIGF0dGFjaCB0cmlnZ2VyZWQgdGhlIE9vcHMgYWJvdmUKICAgIC0gcGF0Y2hlZDogbmF0
aXZlIFhEUCBhdHRhY2ggYW5kIGRldGFjaCBjb21wbGV0ZWQgd2l0aG91dCBhbiBPb3BzCgogYXJj
aC9yaXNjdi9tbS9pbml0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCmluZGV4IGZiMzdiMGI2N2VmZS4uZDkyMzQyYzE2MmUyIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwpAQCAt
MTQzNyw3ICsxNDM3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHByZWFsbG9jYXRlX3BnZF9wYWdl
c19yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb24KIHZvaWQgX19pbml0IHBn
dGFibGVfY2FjaGVfaW5pdCh2b2lkKQogewogCXByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShW
TUFMTE9DX1NUQVJULCBWTUFMTE9DX0VORCwgInZtYWxsb2MiKTsKLQlpZiAoSVNfRU5BQkxFRChD
T05GSUdfTU9EVUxFUykpCisJaWYgKElTX0VOQUJMRUQoQ09ORklHX0VYRUNNRU0pKQogCQlwcmVh
bGxvY2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoTU9EVUxFU19WQUREUiwgTU9EVUxFU19FTkQsICJicGYv
bW9kdWxlcyIpOwogCWlmIChJU19FTkFCTEVEKENPTkZJR19NRU1PUllfSE9UUExVRykpIHsKIAkJ
cHJlYWxsb2NhdGVfcGdkX3BhZ2VzX3JhbmdlKFZNRU1NQVBfU1RBUlQsIFZNRU1NQVBfRU5ELCAi
dm1lbW1hcCIpOwoKYmFzZS1jb21taXQ6IDI0YTE5Yjk1M2UyYTNkMGVhNWE4YzQ5NTFhMGFiOGYz
MjcyMGM5MDcKLS0gCjIuMzkuNSAoQXBwbGUgR2l0LTE1NCkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
