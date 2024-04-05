Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D5CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0K+N2yoKCqcFuPLvWgxqio48ZUof0T1QCoh8G5xJo8=; b=kFe7L6ztGiQhWX
	4JmbWMbAcZB53+dupAOWMip9CMWvM9Xo63mVWArnsaqGLhqpQ1BgNvV9B8FOF5eBu71EoLRpUP9Pn
	TODPjr1M48bCYTI6SL8N8GWrHstgKFBM76ktEUR1vvv6hILTDF+EmfAd0j5zix3JUbon83s/F2AZg
	cAN62baPo8zVl7Aukbm6hJha+PQnl9KOIkJj6RzJ9lNMvAyaAg7OT7wC1qBOlurhdmmqhETkikbqy
	6rAyan6DAXGFdR14sGyu8+TPaBTR/stscdZb9iJRRJ5DrOqGHAxxrP1u7kD6AAOYUdVlTYgrMBC6o
	DYPP8GtbX/mlH1H1cOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsivN-000000070hv-0zRB;
	Fri, 05 Apr 2024 12:44:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsivJ-000000070dN-1Ubd
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:44:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41551639550so15220015e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712321038; x=1712925838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pULb2/SEKmMEonTMi0DJm45CRye8jTdoFzr8IafrgxM=;
        b=QTXKvwGsMexTdDgJJe3nRmGXjWRKehCpQ6aI0ZrHgcbjIzHepYob3w+DgV0f3c/AIb
         6/KDSr5zbdOaMZdifgTF7RGwB/FRwDvU1nJdfQA1sT7jlZzvHe3in/7nF+i24MhvVYPB
         sHBGp8Qz8PJttIiBxsMPK+JsUuWsIldV7STFcQAi6nfOsI3BTNX16nXy38Y7bklzJgay
         Qhd9LJVaEwbLzI2YLDeLL7MLx/SC3l//gGpi45GG8d11W0Y1Cq2gVGXlsaiw0cMGMmpZ
         NgZCFoL3JfkWOYtVs9mCjJyOuf/pFDV6APLggRltllFVbF4BSY4hPQbQLydhbUeUnI6J
         Elug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321038; x=1712925838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pULb2/SEKmMEonTMi0DJm45CRye8jTdoFzr8IafrgxM=;
        b=eNMHFe0yeHp5T7NAcKLJ4x9BHKs5Bc8VcUPhtih8B9yYObDvxz6LfKlK2PJdRmnym4
         rICtiuPOjBa1UbO01oFfaQRMMxHHX9KXSu+FBHcXThVhbCIUeMn5S1Lw/lNJwrse0UAW
         qjJnVKM1RaL74sQ5zUJvIfKdWqkHpfgJFNvRuF0fIcn9tVLhyXX5a204V66rqMBok+ey
         zVwEBJqLgUDsRbd5OJV6RycpBiBIwUJXLtxKXMz3S4/McGGO1oDE5lHhB4SuM2jisn8l
         3JC8Pl+vHHVL9wmcCXc8n9RNjAl8jZhv1V7hsYKBffU0RaZu7qrQTGXeLE8zsn12xTXf
         Pkug==
X-Forwarded-Encrypted: i=1; AJvYcCXMbkV7DO/8rhvYWtSLvZvOlR7b3d0+cjxMKmku5ohNRIKt7Alz2AYkHfcAfNK5aLhxSgBJkHOcoyirQe+4cIhivVITNmIm6P9M44VOLRXn
X-Gm-Message-State: AOJu0YwUUiNPYiZtOErGlv2kH0DWuIWpR5YA2TzkbNBJ54RG5+E1cUFE
	O6FpY7z5mfgNqjv2bC/ZoQircV4ApaOzQn9rvdR3ks+Kyq3v85t4
X-Google-Smtp-Source: AGHT+IHUW+bDfIBmn2iekT8yv3sAv6IIGKq2Tu5MgysTRgeCJ5Z1WV+/TuTm7uyrmNDypSyF3mGedA==
X-Received: by 2002:a05:600c:a0d:b0:416:331f:d3b3 with SMTP id z13-20020a05600c0a0d00b00416331fd3b3mr53944wmp.38.1712321037814;
        Fri, 05 Apr 2024 05:43:57 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id n32-20020a05600c3ba000b00415612e29a1sm2887862wms.30.2024.04.05.05.43.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2024 05:43:57 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next] riscv, bpf: add internal-only MOV instruction to resolve per-CPU addrs
Date: Fri,  5 Apr 2024 12:43:48 +0000
Message-Id: <20240405124348.27644-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_054401_965471_22EBADA3 
X-CRM114-Status: GOOD (  13.60  )
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

U3VwcG9ydCBhbiBpbnN0cnVjdGlvbiBmb3IgcmVzb2x2aW5nIGFic29sdXRlIGFkZHJlc3NlcyBv
ZiBwZXItQ1BVCmRhdGEgZnJvbSB0aGVpciBwZXItQ1BVIG9mZnNldHMuIFRoaXMgaW5zdHJ1Y3Rp
b24gaXMgaW50ZXJuYWwtb25seSBhbmQKdXNlcnMgYXJlIG5vdCBhbGxvd2VkIHRvIHVzZSB0aGVt
IGRpcmVjdGx5LiBUaGV5IHdpbGwgb25seSBiZSB1c2VkIGZvcgppbnRlcm5hbCBpbmxpbmluZyBv
cHRpbWl6YXRpb25zIGZvciBub3cgYmV0d2VlbiBCUEYgdmVyaWZpZXIgYW5kIEJQRgpKSVRzLgoK
UklTQy1WIHVzZXMgZ2VuZXJpYyBwZXItY3B1IGltcGxlbWVudGF0aW9uIHdoZXJlIHRoZSBvZmZz
ZXRzIGZvciBDUFVzCmFyZSBrZXB0IGluIGFuIGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0
W2NwdV9udW1iZXJdLiBSSVNDViBzdG9yZXMKdGhlIGFkZHJlc3Mgb2YgdGhlIHRhc2tfc3RydWN0
IGluIFRQIHJlZ2lzdGVyLiBUaGUgZmlyc3QgZWxlbWVudCBpbgp0YXN0X3N0cnVjdCBpcyBzdHJ1
Y3QgdGhyZWFkX2luZm8sIGFuZCB3ZSBjYW4gZ2V0IHRoZSBjcHUgbnVtYmVyIGJ5CnJlYWRpbmcg
ZnJvbSB0aGUgVFAgcmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSku
CgpPbmNlIHdlIGhhdmUgdGhlIGNwdSBudW1iZXIgaW4gYSByZWdpc3RlciB3ZSByZWFkIHRoZSBv
ZmZzZXQgZm9yIHRoYXQKY3B1IGZyb20gYWRkcmVzczogJl9fcGVyX2NwdV9vZmZzZXQgKyBjcHVf
bnVtYmVyIDw8IDMuIFRoZW4gd2UgYWRkIHRoaXMKb2Zmc2V0IHRvIHRoZSBkZXN0aW5hdGlvbiBy
ZWdpc3Rlci4KClRvIG1lYXN1cmUgdGhlIGltcHJvdmVtZW50IGZyb20gdGhpcyBjaGFuZ2UsIHRo
ZSBiZW5jaG1hcmsgaW4gWzFdIHdhcwp1c2VkIG9uIFFlbXU6CgpCZWZvcmU6Cmdsb2ItYXJyLWlu
YyAgIDogICAgMS4xMjcgwrEgMC4wMTNNL3MKYXJyLWluYyAgICAgICAgOiAgICAxLjEyMSDCsSAw
LjAwNE0vcwpoYXNoLWluYyAgICAgICA6ICAgIDAuNjgxIMKxIDAuMDUyTS9zCgpBZnRlcjoKZ2xv
Yi1hcnItaW5jICAgOiAgICAxLjEzOCDCsSAwLjAxMU0vcwphcnItaW5jICAgICAgICA6ICAgIDEu
MzY2IMKxIDAuMDA2TS9zCmhhc2gtaW5jICAgICAgIDogICAgMC42NzYgwrEgMC4wMDFNL3MKClsx
XSBodHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xpbnV4L2NvbW1pdC84ZGVjOTAwOTc1ZWYK
ClNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jCmluZGV4IDE1ZTQ4MmYyYzY1Ny4uZTk1YmQxZDQ1OWE0IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMKQEAgLTEyLDYgKzEyLDcgQEAKICNpbmNsdWRlIDxsaW51eC9zdG9wX21hY2hpbmUu
aD4KICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KICNpbmNsdWRlIDxhc20vY2ZpLmg+CisjaW5jbHVk
ZSA8YXNtL3BlcmNwdS5oPgogI2luY2x1ZGUgImJwZl9qaXQuaCIKIAogI2RlZmluZSBSVl9GRU5U
UllfTklOU05TIDIKQEAgLTEwODksNiArMTA5MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24o
Y29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwK
IAkJCWVtaXRfb3IoUlZfUkVHX1QxLCByZCwgUlZfUkVHX1QxLCBjdHgpOwogCQkJZW1pdF9tdihy
ZCwgUlZfUkVHX1QxLCBjdHgpOwogCQkJYnJlYWs7CisJCX0gZWxzZSBpZiAoaW5zbl9pc19tb3Zf
cGVyY3B1X2FkZHIoaW5zbikpIHsKKwkJCWlmIChyZCAhPSBycykKKwkJCQllbWl0X212KHJkLCBy
cywgY3R4KTsKKyNpZmRlZiBDT05GSUdfU01QCisJCQkJLyogTG9hZCBjdXJyZW50IENQVSBudW1i
ZXIgaW4gVDEgKi8KKwkJCQllbWl0X2xkKFJWX1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVh
ZF9pbmZvLCBjcHUpLCBSVl9SRUdfVFAsCisJCQkJCWN0eCk7CisJCQkJLyogPDwgMyBiZWNhdXNl
IG9mZnNldHMgYXJlIDggYnl0ZXMgKi8KKwkJCQllbWl0X3NsbGkoUlZfUkVHX1QxLCBSVl9SRUdf
VDEsIDMsIGN0eCk7CisJCQkJLyogTG9hZCBhZGRyZXNzIG9mIF9fcGVyX2NwdV9vZmZzZXQgYXJy
YXkgaW4gVDIgKi8KKwkJCQllbWl0X2ltbShSVl9SRUdfVDIsICh1NjQpJl9fcGVyX2NwdV9vZmZz
ZXQsIGN0eCk7CisJCQkJLyogQWRkIG9mZnNldCBvZiBjdXJyZW50IENQVSB0byAgX19wZXJfY3B1
X29mZnNldCAqLworCQkJCWVtaXRfYWRkKFJWX1JFR19UMSwgUlZfUkVHX1QyLCBSVl9SRUdfVDEs
IGN0eCk7CisJCQkJLyogTG9hZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gaW4gVDEgKi8KKwkJCQll
bWl0X2xkKFJWX1JFR19UMSwgMCwgUlZfUkVHX1QxLCBjdHgpOworCQkJCS8qIEFkZCB0aGUgb2Zm
c2V0IHRvIFJkICovCisJCQkJZW1pdF9hZGQocmQsIHJkLCBSVl9SRUdfVDEsIGN0eCk7CisjZW5k
aWYKIAkJfQogCQlpZiAoaW1tID09IDEpIHsKIAkJCS8qIFNwZWNpYWwgbW92MzIgZm9yIHpleHQg
Ki8KQEAgLTIwMzgsMyArMjA1Nyw4IEBAIGJvb2wgYnBmX2ppdF9zdXBwb3J0c19hcmVuYSh2b2lk
KQogewogCXJldHVybiB0cnVlOwogfQorCitib29sIGJwZl9qaXRfc3VwcG9ydHNfcGVyY3B1X2lu
c24odm9pZCkKK3sKKwlyZXR1cm4gdHJ1ZTsKK30KLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
